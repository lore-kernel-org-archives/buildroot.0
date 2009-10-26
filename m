From: Hugues Hiegel <hugues@hiegel.fr>
Date: Mon, 26 Oct 2009 17:17:12 +0100
Subject: [Buildroot] [PATCH] netkitftp: added package with
	Makefile.autotools.in support
In-Reply-To: <1256573832-11116-1-git-send-email-hugues@hiegel.fr>
References: <1256573832-11116-1-git-send-email-hugues@hiegel.fr>
Message-ID: <1256573832-11116-2-git-send-email-hugues@hiegel.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Hugues Hiegel <hugues.hiegel@openwide.fr>

---
 package/netkitftp/Config.in                        |    9 +++++
 package/netkitftp/netkitftp-configure-noexit.patch |   13 +++++++
 package/netkitftp/netkitftp-configure.patch        |   37 ++++++++++++++++++++
 package/netkitftp/netkitftp.mk                     |   23 ++++++++++++
 4 files changed, 82 insertions(+), 0 deletions(-)
 create mode 100644 package/netkitftp/Config.in
 create mode 100644 package/netkitftp/netkitftp-configure-noexit.patch
 create mode 100644 package/netkitftp/netkitftp-configure.patch
 create mode 100644 package/netkitftp/netkitftp.mk

diff --git a/package/netkitftp/Config.in b/package/netkitftp/Config.in
new file mode 100644
index 0000000..9b37d6e
--- /dev/null
+++ b/package/netkitftp/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_NETKITFTP
+	bool "netkitftp"
+	default n
+	help
+	  ftp client.
+	  ftp client version 0.17-16 with debian patch.
+	            ftp://ftp.debian.org/debian/pool/main/netkit-ftp/
+
+	  ftp://ftp.uk.linux.org/pub/linux/Networking/netkit/
diff --git a/package/netkitftp/netkitftp-configure-noexit.patch b/package/netkitftp/netkitftp-configure-noexit.patch
new file mode 100644
index 0000000..f588a46
--- /dev/null
+++ b/package/netkitftp/netkitftp-configure-noexit.patch
@@ -0,0 +1,13 @@
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
diff --git a/package/netkitftp/netkitftp-configure.patch b/package/netkitftp/netkitftp-configure.patch
new file mode 100644
index 0000000..65eb84f
--- /dev/null
+++ b/package/netkitftp/netkitftp-configure.patch
@@ -0,0 +1,37 @@
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
diff --git a/package/netkitftp/netkitftp.mk b/package/netkitftp/netkitftp.mk
new file mode 100644
index 0000000..fce9585
--- /dev/null
+++ b/package/netkitftp/netkitftp.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# netkitftp
+#
+#############################################################
+NETKITFTP_VERSION:=0.17
+NETKITFTP_SOURCE:=netkit-ftp_$(NETKITFTP_VERSION).orig.tar.gz
+NETKITFTP_PATCH:=netkit-ftp_0.17-16.diff.gz
+NETKITFTP_SITE:=ftp://ftp.debian.org/debian/pool/main/n/netkit-ftp/
+
+NETKITFTP_CONF_OPT = --installroot=$(TARGET_DIR) \
+					--without-readline
+NETKITFTP_MAKE_ENV = SUB=ftp
+NETKITFTP_INSTALL_TARGET_OPT = INSTALL_PREFIX=$(TARGET_DIR) install
+
+$(eval $(call AUTOTARGETS,package,netkitftp))
+
+$(NETKITFTP_HOOK_POST_BUILD):
+	[ ! -d $(TARGET_DIR)/usr/man/man1 ] && install -d $(TARGET_DIR)/usr/man/man1 || true
+	[ ! -d $(TARGET_DIR)/usr/man/man5 ] && install -d $(TARGET_DIR)/usr/man/man5 ||??true
+
+$(NETKITFTP_HOOK_POST_INSTALL):
+	rm -vfr $(TARGET_DIR)/usr/man
-- 
1.6.2.BigFiles
