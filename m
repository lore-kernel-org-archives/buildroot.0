From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 13 Dec 2012 11:54:59 +0100
Subject: [Buildroot] Need some help fetching local Linux code
In-Reply-To: <CAE21AQq8wky0Auuq5U0NNUPVXVGQsXGkWcBQ_kvkEe8Xy_RoUg@mail.gmail.com>
References: <CAE21AQq8wky0Auuq5U0NNUPVXVGQsXGkWcBQ_kvkEe8Xy_RoUg@mail.gmail.com>
Message-ID: <50C9B403.1000105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/12/12 03:27, Charles Manning wrote:
> Hi
>
> I have been dabbling with the handling for Linux so that it can be
> fetched from svn or a local directory.
>
> Although testing of SITE_METHOD = local works fine with a simple test
> case, I am struggling to get it working from the linux/linux.mk
>
> What I have done is modify linux/Config.in as follows:

[snip]
> +choice
> +       prompt "Custom fetch method"
> +       depends on BR2_LINUX_KERNEL_CUSTOM_SOURCE
> +

  Not relevant for your problem, but I would:

- change the 'depends on' into an 'if' around all the relevant
configs;

- add a BR2_LINUX_KERNEL_CUSTOM_SOURCE_AUTO, which is the default,
and which unsets _SITE_METHOD so that it is derived automatically
from the URL.

> +config BR2_LINUX_KERNEL_CUSTOM_SOURCE_WGET
> +       bool "wget"
> +config BR2_LINUX_KERNEL_CUSTOM_SOURCE_SCP
> +       bool "scp"
> +config BR2_LINUX_KERNEL_CUSTOM_SOURCE_SVN
> +       bool "svn"
> +config BR2_LINUX_KERNEL_CUSTOM_SOURCE_GIT
> +       bool "git"
> +config BR2_LINUX_KERNEL_CUSTOM_SOURCE_HG
> +       bool "Mercurial"
> +config BR2_LINUX_KERNEL_CUSTOM_SOURCE_BZR
> +       bool "Bazaar"
> +config BR2_LINUX_KERNEL_CUSTOM_SOURCE_FILE
> +       bool "Local tarball"
> +config BR2_LINUX_KERNEL_CUSTOM_SOURCE_LOCAL
> +       bool "Local directory"
> +
> +endchoice
[snip]
>   config BR2_LINUX_KERNEL_VERSION
>          string
>          default "3.7" if BR2_LINUX_KERNEL_3_7
>          default BR2_DEFAULT_KERNEL_HEADERS if BR2_LINUX_KERNEL_SAME_AS_HEADERS
>          default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE if BR2_LINUX_KERNEL_CUSTOM_VERSION
>          default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
> -       default $BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION if BR2_LINUX_KERNEL_CUSTOM_GIT
> +       default "custom-source" if BR2_LINUX_KERNEL_CUSTOM_SOURCE
> +       default $BR2_LINUX_KERNEL_CUSTOM_VERSION if BR2_LINUX_KERNEL_CUSTOM_VERSION

  No need to change from custom to custom-source...

>
>   #
>   # Patch selection
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c4bdf90..73623bd 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -12,9 +12,9 @@ ifeq ($(LINUX_VERSION),custom)
>   LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
>   LINUX_SITE = $(dir $(LINUX_TARBALL))
>   LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
> -else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
> -LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL))
> -LINUX_SITE_METHOD = git
> +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SOURCE),y)
> +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_SOURCE_LOCATION))
> +LINUX_SITE_METHOD = $(BR2_LINUX_KERNEL_CUSTOM_SOURCE_METHOD)

  This should be qstrip'ped.  I suspect that is your problem. The problem is that
there is an 'ifeq ($(LINUX_SITE_METHOD),local)' in the generic-package expansion,
and that expands to 'ifeq ("local",local)' which is false.

[snip]
> I also added the following debuggering:
> @@ -30,7 +30,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
>   # Only show the download message if it isn't already downloaded
>          $(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE)&&  \
>                  (test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
> -               $(call MESSAGE,"Downloading")
> +               $(call MESSAGE,"Downloading $($(PKG)_SITE) $($(PKG)_SITE_METHOD)")
>   endif

  The way it's written now, you don't see the quotes.  Better put single quotes
around the message instead of double quotes.

>          $(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_SOURCE)))
>          $(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE)/$($(PKG)_PATCH)))
>
> Unfortunately, the code is not fetched properly and instead buildroot
> tries to fetch a tarball.
>
> make V=1 gives:
>
> harles at charles-laptop:/opt/buildroot/buildroot$ make V=1
> (test -e /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz&&  \
> 		(test -z  || test -e /opt/buildroot/buildroot/dl)) || \
> 		echo ">>>  linux custom-source "Downloading
> /home/charles/projects/ex/linux-omap-3.2/ "local"""
>>>> linux custom-source Downloading /home/charles/projects/ex/linux-omap-3.2/ local
> if test -n "" ; then case "" in scp) 	test -e
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || scp
> '/linux-custom-source.tar.gz'
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz&&  exit ;; *)
> 	test -e /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz ||
> (wget --passive-ftp -nd -t 3  -O
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
> '/linux-custom-source.tar.gz'&&  mv
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz) || (rm -f
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp ; exit 1)
> &&  exit ;; esac ; fi ; if test "" = "y" ; then exit 1 ; fi ; if test
> -n "/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz"
> ; then if test -z ""local"" ; then

  Here you can see the double double quotes. (Note: the double double is
intentional here :-)


  Regards,
  Arnout

> scheme="/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz"
> ; else scheme=""local"" ; fi ; case "$scheme" in git) 	test -e
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || (pushd
> /opt/buildroot/buildroot/dl>  /dev/null&&  ((test "`git ls-remote
> /home/charles/projects/ex/linux-omap-3.2/ custom-source`"&&  echo
> "Doing shallow clone"&&  git clone --depth 1 -b custom-source --bare
> /home/charles/projects/ex/linux-omap-3.2/ linux-custom-source) ||
> (echo "Doing full clone"&&  git clone --bare
> /home/charles/projects/ex/linux-omap-3.2/ linux-custom-source))&&
> pushd linux-custom-source>  /dev/null&&  git archive --format=tar
> --prefix=linux-custom-source/ custom-source | gzip -c>
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz&&  popd>
> /dev/null&&  rm -rf /opt/buildroot/buildroot/dl/linux-custom-source&&
> popd>  /dev/null)&&  exit ;; svn) 	test -e
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || (pushd
> /opt/buildroot/buildroot/dl>  /dev/null&&  svn export -r custom-source
> /home/charles/projects/ex/linux-omap-3.2/
> /opt/buildroot/buildroot/dl/linux-custom-source&&  tar czf
> linux-custom-source.tar.gz linux-custom-source/&&  rm -rf
> /opt/buildroot/buildroot/dl/linux-custom-source&&  popd>  /dev/null)
> &&  exit ;; bzr) 	test -e
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || bzr export
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz
> /home/charles/projects/ex/linux-omap-3.2/ -r custom-source&&  exit ;;
> file) 	echo "Download local files" test -e
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || cp
> /home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz
> /opt/buildroot/buildroot/dl&&  exit ;; scp) 	test -e
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || scp
> '/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz'
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz&&  exit ;; hg)
> 	test -e /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz ||
> (pushd /opt/buildroot/buildroot/dl>  /dev/null&&  hg  clone --noupdate
> --rev custom-source /home/charles/projects/ex/linux-omap-3.2/
> linux-custom-source&&  hg  archive --repository linux-custom-source
> --type tgz --prefix linux-custom-source/ --rev custom-source
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz&&  rm -rf
> /opt/buildroot/buildroot/dl/linux-custom-source&&  popd>  /dev/null)
> &&  exit ;; *) 	test -e
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz || (wget
> --passive-ftp -nd -t 3  -O
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
> '/home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz'
> &&  mv /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz) || (rm -f
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp ; exit 1)
> &&  exit ;; esac ; fi ; if test -n "http://sources.buildroot.net/" ;
> then 	test -e /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz
> || (wget --passive-ftp -nd -t 3  -O
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
> 'http://sources.buildroot.net//linux-custom-source.tar.gz'&&  mv
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz) || (rm -f
> /opt/buildroot/buildroot/dl/linux-custom-source.tar.gz.tmp ; exit 1)
> &&  exit ; fi ; exit 1
> /home/charles/projects/ex/linux-omap-3.2//linux-custom-source.tar.gz:
> Scheme missing.
> mkdir -p /opt/buildroot/buildroot/output/build/linux-custom-source
> touch /opt/buildroot/buildroot/output/build/linux-custom-source/.stamp_downloaded
>
>
> The flow is different when I ran a simplified test case. That just
> used rsync... and worked.
>
> Any help appreciated.
>
> Thanks
>
> Charles
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
