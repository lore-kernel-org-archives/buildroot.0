From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 3 Jan 2016 22:06:00 +0100
Subject: [Buildroot] [git commit] tpm-tools: fix build failures caused by
	-Werror
Message-ID: <20160103210633.96F44822D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c79d685975b966d3406e8623a44e1e5d0f0d9b10
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes this build failure (and many others):
  http://autobuild.buildroot.org/results/d56/d56bfc69ef0a478219c959d50fb96d526fc2155e/

The build failure is caused by the build system using -Werror; this is
already patched upstream, so this commit just imports the upstream
patch.

Signed-off-by: No?? Rubinstein <noe.rubinstein@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-configure.in-remove-Werror.patch          | 27 ++++++++++++++++++++++
 package/tpm-tools/tpm-tools.mk                     |  2 +-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/package/tpm-tools/0002-configure.in-remove-Werror.patch b/package/tpm-tools/0002-configure.in-remove-Werror.patch
new file mode 100644
index 0000000..c101a95
--- /dev/null
+++ b/package/tpm-tools/0002-configure.in-remove-Werror.patch
@@ -0,0 +1,27 @@
+From b060873f444d79f3f5aa388427cb1ede6665834a Mon Sep 17 00:00:00 2001
+From: Kent Yoder <key@linux.vnet.ibm.com>
+Date: Mon, 5 Nov 2012 14:58:31 -0600
+Subject: [PATCH] configure.in: remove -Werror
+
+Signed-off-by: Kent Yoder <key@linux.vnet.ibm.com>
+Signed-off-by: Noe Rubinstein <nrubinstein@aldebaran.com>
+---
+ configure.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.in b/configure.in
+index da170d0..0f175be 100644
+--- a/configure.in
++++ b/configure.in
+@@ -138,7 +138,7 @@ AC_TYPE_SIZE_T
+ AC_TYPE_SIGNAL
+ AC_TYPE_UID_T
+ 
+-CFLAGS="$CFLAGS -Wall -Werror -Wreturn-type -Wsign-compare"
++CFLAGS="$CFLAGS -Wall -Wreturn-type -Wsign-compare"
+ 
+ AC_CONFIG_FILES(./Makefile		\
+ 		po/Makefile.in		\
+-- 
+2.1.4
+
diff --git a/package/tpm-tools/tpm-tools.mk b/package/tpm-tools/tpm-tools.mk
index 9dd844d..d196e89 100644
--- a/package/tpm-tools/tpm-tools.mk
+++ b/package/tpm-tools/tpm-tools.mk
@@ -12,7 +12,7 @@ TPM_TOOLS_LICENSE = Common Public License Version 1.0
 TPM_TOOLS_LICENSE_FILES = LICENSE
 TPM_TOOLS_DEPENDENCIES = trousers openssl \
 	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
-# lib/Makefile.am is patched
+# configure.in and lib/Makefile.am is patched
 TPM_TOOLS_AUTORECONF = YES
 
 TPM_TOOLS_CONF_OPTS = --disable-pkcs11-support
