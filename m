From: Hugues Hiegel <hugues@hiegel.fr>
Date: Tue, 27 Oct 2009 13:41:40 +0100
Subject: [Buildroot] [PATCH] netkitftp: ftp client from netkit project
In-Reply-To: <1256573832-11116-2-git-send-email-hugues@hiegel.fr>
References: <1256573832-11116-2-git-send-email-hugues@hiegel.fr>
Message-ID: <1256647300-19012-1-git-send-email-hugues@hiegel.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Hugues Hiegel <hugues.hiegel@openwide.fr>

---
 package/netkitftp/Config.in                        |    6 +++
 package/netkitftp/configure-conftest.patch         |   41 ++++++++++++++++++++
 package/netkitftp/configure-unrecognizedopts.patch |   17 ++++++++
 package/netkitftp/netkitftp.mk                     |   25 ++++++++++++
 4 files changed, 89 insertions(+), 0 deletions(-)
 create mode 100644 package/netkitftp/Config.in
 create mode 100644 package/netkitftp/configure-conftest.patch
 create mode 100644 package/netkitftp/configure-unrecognizedopts.patch
 create mode 100644 package/netkitftp/netkitftp.mk

diff --git a/package/netkitftp/Config.in b/package/netkitftp/Config.in
new file mode 100644
index 0000000..7ca0a14
--- /dev/null
+++ b/package/netkitftp/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_NETKITFTP
+	bool "netkitftp"
+	help
+	  "Classic" ftp client with standard behaviour from 
+	  the netkit project.
+	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
diff --git a/package/netkitftp/configure-conftest.patch b/package/netkitftp/configure-conftest.patch
new file mode 100644
index 0000000..06cfa11
--- /dev/null
+++ b/package/netkitftp/configure-conftest.patch
@@ -0,0 +1,41 @@
+
+This patch prevents ./configure script of netkitftp to exit
+upon execution of cross-compiled test binaries on the host.
+
+diff -aur old/configure new/configure
+--- old/configure	2007-02-23 10:09:31.974440552 +0100
++++ new/configure	2007-02-23 10:03:49.164555576 +0100
+@@ -86,7 +86,7 @@
+     echo -n 'Checking if C compiler works... '
+     if (
+           $CC __conftest.c -o __conftest || exit 1
+-          ./__conftest || exit 1
++          #./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+          echo 'yes'
+      else
+@@ -166,13 +166,13 @@
+ EOF
+ if (
+       $CC $CFLAGS  __conftest.c  -o __conftest || exit 1
+-      ./__conftest || exit 1
++      #./__conftest || exit 1
+    ) >/dev/null 2>&1; then
+     echo 'yes'
+ else
+     if (
+           $CC $CFLAGS -D__USE_BSD_SIGNAL __conftest.c  -o __conftest || exit 1
+-          ./__conftest || exit 1
++          #./__conftest || exit 1
+        ) >/dev/null 2>&1; then
+         echo '-D__USE_BSD_SIGNAL'
+         CFLAGS="$CFLAGS -D__USE_BSD_SIGNAL"
+@@ -379,7 +379,7 @@
+ EOF
+ if (
+       $CC $CFLAGS  __conftest.c $LIBBSD -o __conftest || exit 1
+-      ./__conftest || exit 1
++      #./__conftest || exit 1
+    ) >/dev/null 2>&1; then
+     echo 'ok'
+ else
diff --git a/package/netkitftp/configure-unrecognizedopts.patch b/package/netkitftp/configure-unrecognizedopts.patch
new file mode 100644
index 0000000..ff58c11
--- /dev/null
+++ b/package/netkitftp/configure-unrecognizedopts.patch
@@ -0,0 +1,17 @@
+
+This patch prevents ./configure script of netkitftp to exit upon unrecognized
+option that should be passed from the Makefile.autotools.in of buildroot.
+
+diff --git a/configure b/configure
+index 0440527..54a5278 100755
+--- a/configure
++++ b/configure
+@@ -39,7 +39,7 @@ EOF
+ 	--manmode=*) MANMODE=`echo $1 | sed 's/^[^=]*=//'` ;;
+ 	--with-c-compiler=*) CC=`echo $1 | sed 's/^[^=]*=//'` ;;
+ 	--without-readline|--disable-readline) WITHOUT_READLINE=1;;
+-	*) echo "Unrecognized option: $1"; exit 1;;
++	*) echo "Unrecognized option: $1";;
+ esac 
+ shift
+ done
diff --git a/package/netkitftp/netkitftp.mk b/package/netkitftp/netkitftp.mk
new file mode 100644
index 0000000..37aed24
--- /dev/null
+++ b/package/netkitftp/netkitftp.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# netkitftp
+#
+#############################################################
+NETKITFTP_VERSION:=0.17
+NETKITFTP_PATCH_VERSION:=16
+NETKITFTP_SOURCE:=netkit-ftp_$(NETKITFTP_VERSION).orig.tar.gz
+NETKITFTP_PATCH:=netkit-ftp_$(NETKITFTP_VERSION)-$(NETKITFTP_PATCH_VERSION).diff.gz
+NETKITFTP_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/n/netkit-ftp/
+
+# Netkitftp does not understands the INSTALL_PREFIX envvar,
+#??we have to use the --installroot configure option instead...
+NETKITFTP_CONF_OPT = --installroot=$(TARGET_DIR) \
+					 --without-readline
+NETKITFTP_INSTALL_TARGET_OPT = install
+
+$(eval $(call AUTOTARGETS,package,netkitftp))
+
+$(NETKITFTP_HOOK_POST_BUILD):
+	# The 'install' rule of netkitftp would install manpages, but the
+	#??folders generally do not exist on the TARGET_PATH, so we create
+	#??them in order to let 'make install' successfully perform.
+	mkdir -p $(TARGET_DIR)/usr/man/man1 $(TARGET_DIR)/usr/man/man5
+
-- 
1.6.2.BigFiles
