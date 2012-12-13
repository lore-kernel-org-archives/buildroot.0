From: Charles Manning <cdhmanning@gmail.com>
Date: Thu, 13 Dec 2012 15:27:29 +1300
Subject: [Buildroot] Need some help fetching local Linux code
Message-ID: <CAE21AQq8wky0Auuq5U0NNUPVXVGQsXGkWcBQ_kvkEe8Xy_RoUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I have been dabbling with the handling for Linux so that it can be
fetched from svn or a local directory.

Although testing of SITE_METHOD = local works fine with a simple test
case, I am struggling to get it working from the linux/linux.mk

What I have done is modify linux/Config.in as follows:
diff --git a/linux/Config.in b/linux/Config.in
index 51810e2..c199344 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -46,11 +46,11 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL
          This option allows to specify the http or ftp location of a
          specific kernel source tarball

-config BR2_LINUX_KERNEL_CUSTOM_GIT
-       bool "Custom Git tree"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE
+       bool "Custom repo/source tree"
        help
          This option allows Buildroot to get the Linux kernel source
-         code from a Git repository.
+         code from a custom repository or source.

 endchoice

@@ -62,25 +62,67 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION
        string "URL of custom kernel tarball"
        depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL

-config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
-       string "URL of custom Git repository"
-       depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+# Configs for fetching custom source
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_LOCATION
+       string "URL/location of custom source tree"
+       depends on BR2_LINUX_KERNEL_CUSTOM_SOURCE

-config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
-       string "Custom Git version"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_VERSION
+       string "Custom source version"
        default "HEAD"
-       depends on BR2_LINUX_KERNEL_CUSTOM_GIT
+       depends on BR2_LINUX_KERNEL_CUSTOM_SOURCE
        help
-         Git revision to use in the format used by git rev-parse,
+         Source revision to use in the format used by git rev-parse,
+         or svn or whatever
          E.G. a sha id, a tag, branch, ..

+choice
+       prompt "Custom fetch method"
+       depends on BR2_LINUX_KERNEL_CUSTOM_SOURCE
+
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_WGET
+       bool "wget"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_SCP
+       bool "scp"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_SVN
+       bool "svn"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_GIT
+       bool "git"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_HG
+       bool "Mercurial"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_BZR
+       bool "Bazaar"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_FILE
+       bool "Local tarball"
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_LOCAL
+       bool "Local directory"
+
+endchoice
+
+config BR2_LINUX_KERNEL_CUSTOM_SOURCE_METHOD
+       string
+       depends on BR2_LINUX_KERNEL_CUSTOM_SOURCE
+       default "wget" if BR2_LINUX_KERNEL_CUSTOM_SOURCE_WGET
+       default "scp" if BR2_LINUX_KERNEL_CUSTOM_SOURCE_SCP
+       default "svn" if BR2_LINUX_KERNEL_CUSTOM_SOURCE_SVN
+       default "git" if BR2_LINUX_KERNEL_CUSTOM_SOURCE_GIT
+       default "hg" if BR2_LINUX_KERNEL_CUSTOM_SOURCE_HG
+       default "bzr" if BR2_LINUX_KERNEL_CUSTOM_SOURCE_BZR
+       default "file" if BR2_LINUX_KERNEL_CUSTOM_SOURCE_FILE
+       default "local" if BR2_LINUX_KERNEL_CUSTOM_SOURCE_LOCAL
+
+#
+# End of fetching custom source
+#
+
 config BR2_LINUX_KERNEL_VERSION
        string
        default "3.7" if BR2_LINUX_KERNEL_3_7
        default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
        default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if
BR2_LINUX_KERNEL_CUSTOM_VERSION
        default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
-       default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if
BR2_LINUX_KERNEL_CUSTOM_GIT
+       default "custom-source" if BR2_LINUX_KERNEL_CUSTOM_SOURCE
+       default $BR2_LINUX_KERNEL_CUSTOM_VERSION if
BR2_LINUX_KERNEL_CUSTOM_VERSION

 #
 # Patch selection
diff --git a/linux/linux.mk b/linux/linux.mk
index c4bdf90..73623bd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -12,9 +12,9 @@ ifeq ($(LINUX_VERSION),custom)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_SITE = $(dir $(LINUX_TARBALL))
 LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
-else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
-LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
-LINUX_SITE_METHOD = git
+else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SOURCE),y)
+LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_SOURCE_LOCATION))
+LINUX_SITE_METHOD = $(BR2_LINUX_KERNEL_CUSTOM_SOURCE_METHOD)
 else
 LINUX_SOURCE = linux-$(LINUX_VERSION).tar.bz2
 # In X.Y.Z, get X and Y. We replace dots and dashes by spaces in order
diff --git a/package/Config.in b/package/Config.in
index f97e892..88cd947 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -763,4 +763,8 @@ source "package/vim/Config.in"
 endif
 endmenu

That gives me:
BR2_LINUX_KERNEL=y
# BR2_LINUX_KERNEL_3_7 is not set
# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
BR2_LINUX_KERNEL_CUSTOM_SOURCE=y
BR2_LINUX_KERNEL_CUSTOM_SOURCE_LOCATION="/home/charles/projects/ex/linux-omap-3.2/"
BR2_LINUX_KERNEL_CUSTOM_SOURCE_VERSION="HEAD"
# BR2_LINUX_KERNEL_CUSTOM_SOURCE_WGET is not set
# BR2_LINUX_KERNEL_CUSTOM_SOURCE_SCP is not set
# BR2_LINUX_KERNEL_CUSTOM_SOURCE_SVN is not set
# BR2_LINUX_KERNEL_CUSTOM_SOURCE_GIT is not set
# BR2_LINUX_KERNEL_CUSTOM_SOURCE_HG is not set
# BR2_LINUX_KERNEL_CUSTOM_SOURCE_BZR is not set
# BR2_LINUX_KERNEL_CUSTOM_SOURCE_FILE is not set
BR2_LINUX_KERNEL_CUSTOM_SOURCE_LOCAL=y
BR2_LINUX_KERNEL_CUSTOM_SOURCE_METHOD="local"
BR2_LINUX_KERNEL_VERSION="custom-source"
BR2_LINUX_KERNEL_PATCH=""

I also added the following debuggering:
@@ -30,7 +30,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 # Only show the download message if it isn't already downloaded
        $(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
                (test -z $($(PKG)_PATCH) || test -e
$(DL_DIR)$($(PKG)_PATCH))) || \
-               $(call MESSAGE,"Downloading")
+               $(call MESSAGE,"Downloading $($(PKG)_SITE)
$($(PKG)_SITE_METHOD)")
 endif
        $(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
        $(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_PATCH)))

Unfortunately, the code is not fetched properly and instead buildroot
tries to fetch a tarball.

make V=1 gives:

harles at charles-laptop:/opt/buildroot/buildroot$ make V=1
(test -e /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz && \
		(test -z  || test -e /opt/buildroot/buildroot/dl)) || \
		echo ">>> linux custom-source "Downloading
/home/charles/projects/ex/linux-omap-3.2/ "local"""
>>> linux custom-source Downloading /home/charles/projects/ex/linux-omap-3.2/ local
if test -n "" ; then case "" in scp) 	test -e
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || scp
'/linux-custom-source.tar.gz'
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz && exit ;; *)
	test -e /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz ||
(wget --passive-ftp -nd -t 3  -O
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
'/linux-custom-source.tar.gz' && mv
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz) || (rm -f
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp ; exit 1)
&& exit ;; esac ; fi ; if test "" = "y" ; then exit 1 ; fi ; if test
-n "/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz"
; then if test -z ""local"" ; then
scheme="/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz"
; else scheme=""local"" ; fi ; case "$scheme" in git) 	test -e
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || (pushd
/opt/buildroot/buildroot/dl > /dev/null && ((test "`git ls-remote
/home/charles/projects/ex/linux-omap-3.2/ custom-source`" && echo
"Doing shallow clone" && git clone --depth 1 -b custom-source --bare
/home/charles/projects/ex/linux-omap-3.2/ linux-custom-source) ||
(echo "Doing full clone" && git clone --bare
/home/charles/projects/ex/linux-omap-3.2/ linux-custom-source)) &&
pushd linux-custom-source > /dev/null && git archive --format=tar
--prefix=linux-custom-source/ custom-source | gzip -c >
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz && popd >
/dev/null && rm -rf /opt/buildroot/buildroot/dl/linux-custom-source &&
popd > /dev/null) && exit ;; svn) 	test -e
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || (pushd
/opt/buildroot/buildroot/dl > /dev/null && svn export -r custom-source
/home/charles/projects/ex/linux-omap-3.2/
/opt/buildroot/buildroot/dl/linux-custom-source && tar czf
linux-custom-source.tar.gz linux-custom-source/ && rm -rf
/opt/buildroot/buildroot/dl/linux-custom-source && popd > /dev/null)
&& exit ;; bzr) 	test -e
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || bzr export
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz
/home/charles/projects/ex/linux-omap-3.2/ -r custom-source && exit ;;
file) 	echo "Download local files" test -e
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || cp
/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz
/opt/buildroot/buildroot/dl && exit ;; scp) 	test -e
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || scp
'/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz'
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz && exit ;; hg)
	test -e /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz ||
(pushd /opt/buildroot/buildroot/dl > /dev/null && hg  clone --noupdate
--rev custom-source /home/charles/projects/ex/linux-omap-3.2/
linux-custom-source && hg  archive --repository linux-custom-source
--type tgz --prefix linux-custom-source/ --rev custom-source
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz && rm -rf
/opt/buildroot/buildroot/dl/linux-custom-source && popd > /dev/null)
&& exit ;; *) 	test -e
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || (wget
--passive-ftp -nd -t 3  -O
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
'/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz'
&& mv /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz) || (rm -f
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp ; exit 1)
&& exit ;; esac ; fi ; if test -n "http://sources.buildroot.net/" ;
then 	test -e /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz
|| (wget --passive-ftp -nd -t 3  -O
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
'http://sources.buildroot.net//linux-custom-source.tar.gz' && mv
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz) || (rm -f
/opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp ; exit 1)
&& exit ; fi ; exit 1
/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz:
Scheme missing.
mkdir -p /opt/buildroot/buildroot/output/build/linux-custom-source
touch /opt/buildroot/buildroot/output/build/linux-custom-source/.stamp_downloaded


The flow is different when I ran a simplified test case. That just
used rsync... and worked.

Any help appreciated.

Thanks

Charles
