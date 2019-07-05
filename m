From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Jul 2019 18:50:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/lxc: switch from gnutls to openssl
Message-ID: <20190705165040.26254-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/c0a9565ae65336d55cdedc67adff221a7fa1a2c8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...itch-from-gnutls-to-openssl-for-sha1.patch | 232 ++++++++++++++++++
 package/lxc/lxc.mk                            |  16 +-
 2 files changed, 241 insertions(+), 7 deletions(-)
 create mode 100644 package/lxc/0001-Switch-from-gnutls-to-openssl-for-sha1.patch

diff --git a/package/lxc/0001-Switch-from-gnutls-to-openssl-for-sha1.patch b/package/lxc/0001-Switch-from-gnutls-to-openssl-for-sha1.patch
new file mode 100644
index 0000000000..a5a9bf47cb
--- /dev/null
+++ b/package/lxc/0001-Switch-from-gnutls-to-openssl-for-sha1.patch
@@ -0,0 +1,232 @@
+From fa2bb6ba532c5e7f92df8cbae50a68af519f9997 Mon Sep 17 00:00:00 2001
+From: Serge Hallyn <shallyn@cisco.com>
+Date: Fri, 14 Jun 2019 03:08:26 +0000
+Subject: [PATCH] Switch from gnutls to openssl for sha1
+
+The reason for this is because openssl can be statically linked
+against, gnutls cannot.
+
+Signed-off-by: Serge Hallyn <shallyn@cisco.com>
+[Retrieved from:
+https://github.com/lxc/lxc/commit/fa2bb6ba532c5e7f92df8cbae50a68af519f9997]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ configure.ac           | 27 +++++++++++++++------------
+ src/lxc/Makefile.am    |  8 ++++----
+ src/lxc/lxccontainer.c | 18 +++++++++++-------
+ src/lxc/utils.c        | 29 +++++++++++++++++++++--------
+ src/lxc/utils.h        |  5 ++---
+ 5 files changed, 53 insertions(+), 34 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3caa45ba8e..a041f2fdb0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -257,6 +257,8 @@ fi
+ 
+ AM_CONDITIONAL([ENABLE_API_DOCS], [test "x$HAVE_DOXYGEN" != "x"])
+ 
++AC_CONFIG_MACRO_DIRS([config])
++
+ # Apparmor
+ AC_ARG_ENABLE([apparmor],
+ 	[AC_HELP_STRING([--enable-apparmor], [enable apparmor support [default=auto]])],
+@@ -267,20 +269,21 @@ if test "$enable_apparmor" = "auto" ; then
+ fi
+ AM_CONDITIONAL([ENABLE_APPARMOR], [test "x$enable_apparmor" = "xyes"])
+ 
+-# GnuTLS
+-AC_ARG_ENABLE([gnutls],
+-	[AC_HELP_STRING([--enable-gnutls], [enable GnuTLS support [default=auto]])],
+-	[], [enable_gnutls=auto])
++# OpenSSL
++# libssl-dev
++AC_ARG_ENABLE([openssl],
++	[AC_HELP_STRING([--enable-openssl], [enable OpenSSL support [default=auto]])],
++	[], [enable_openssl=auto])
++
++if test "$enable_openssl" = "auto" ; then
++	AC_CHECK_LIB([ssl], [OPENSSL_init_ssl], [enable_openssl=yes], [enable_openssl=no])
+ 
+-if test "$enable_gnutls" = "auto" ; then
+-	AC_CHECK_LIB([gnutls], [gnutls_hash_fast], [enable_gnutls=yes], [enable_gnutls=no])
+ fi
+-AM_CONDITIONAL([ENABLE_GNUTLS], [test "x$enable_gnutls" = "xyes"])
++AM_CONDITIONAL([ENABLE_OPENSSL], [test "x$enable_openssl" = "xyes"])
+ 
+-AM_COND_IF([ENABLE_GNUTLS],
+-	[AC_CHECK_HEADER([gnutls/gnutls.h],[],[AC_MSG_ERROR([You must install the GnuTLS development package in order to compile lxc])])
+-	AC_CHECK_LIB([gnutls], [gnutls_hash_fast],[true],[AC_MSG_ERROR([You must install the GnuTLS development package in order to compile lxc])])
+-	AC_SUBST([GNUTLS_LIBS], [-lgnutls])])
++AM_COND_IF([ENABLE_OPENSSL],
++	[AC_CHECK_HEADER([openssl/engine.h],[],[AC_MSG_ERROR([You must install the OpenSSL development package in order to compile lxc])])
++	AC_SUBST([OPENSSL_LIBS], '-lssl -lcrypto')])
+ 
+ # SELinux
+ AC_ARG_ENABLE([selinux],
+@@ -1014,7 +1017,7 @@ Environment:
+  - distribution: $with_distro
+  - init script type(s): $init_script
+  - rpath: $enable_rpath
+- - GnuTLS: $enable_gnutls
++ - OpenSSL: $enable_openssl
+  - Bash integration: $enable_bash
+ 
+ Security features:
+diff --git a/src/lxc/Makefile.am b/src/lxc/Makefile.am
+index 49b3b014d1..4b18ac5d82 100644
+--- a/src/lxc/Makefile.am
++++ b/src/lxc/Makefile.am
+@@ -210,8 +210,8 @@ if ENABLE_APPARMOR
+ AM_CFLAGS += -DHAVE_APPARMOR
+ endif
+ 
+-if ENABLE_GNUTLS
+-AM_CFLAGS += -DHAVE_LIBGNUTLS
++if ENABLE_OPENSSL
++AM_CFLAGS += -DHAVE_OPENSSL
+ endif
+ 
+ if ENABLE_SECCOMP
+@@ -248,7 +248,7 @@ liblxc_la_LDFLAGS = -pthread \
+ 		    -version-info @LXC_ABI_MAJOR@
+ 
+ liblxc_la_LIBADD = $(CAP_LIBS) \
+-		   $(GNUTLS_LIBS) \
++		   $(OPENSSL_LIBS) \
+ 		   $(SELINUX_LIBS) \
+ 		   $(SECCOMP_LIBS) \
+ 		   $(DLOG_LIBS)
+@@ -307,7 +307,7 @@ endif
+ 
+ LDADD = liblxc.la \
+ 	@CAP_LIBS@ \
+-	@GNUTLS_LIBS@ \
++	@OPENSSL_LIBS@ \
+ 	@SECCOMP_LIBS@ \
+ 	@SELINUX_LIBS@ \
+ 	@DLOG_LIBS@
+diff --git a/src/lxc/lxccontainer.c b/src/lxc/lxccontainer.c
+index 253f07f683..a618645f81 100644
+--- a/src/lxc/lxccontainer.c
++++ b/src/lxc/lxccontainer.c
+@@ -79,6 +79,10 @@
+ #include "utils.h"
+ #include "version.h"
+ 
++#if HAVE_OPENSSL
++#include <openssl/evp.h>
++#endif
++
+ /* major()/minor() */
+ #ifdef MAJOR_IN_MKDEV
+ #include <sys/mkdev.h>
+@@ -1654,9 +1658,9 @@ static bool prepend_lxc_header(char *path, const char *t, char *const argv[])
+ 	char *contents;
+ 	FILE *f;
+ 	int ret = -1;
+-#if HAVE_LIBGNUTLS
+-	int i;
+-	unsigned char md_value[SHA_DIGEST_LENGTH];
++#if HAVE_OPENSSL
++	int i, md_len = 0;
++	unsigned char md_value[EVP_MAX_MD_SIZE];
+ 	char *tpath;
+ #endif
+ 
+@@ -1697,14 +1701,14 @@ static bool prepend_lxc_header(char *path, const char *t, char *const argv[])
+ 	if (ret < 0)
+ 		goto out_free_contents;
+ 
+-#if HAVE_LIBGNUTLS
++#if HAVE_OPENSSL
+ 	tpath = get_template_path(t);
+ 	if (!tpath) {
+ 		ERROR("Invalid template \"%s\" specified", t);
+ 		goto out_free_contents;
+ 	}
+ 
+-	ret = sha1sum_file(tpath, md_value);
++	ret = sha1sum_file(tpath, md_value, &md_len);
+ 	if (ret < 0) {
+ 		ERROR("Failed to get sha1sum of %s", tpath);
+ 		free(tpath);
+@@ -1730,9 +1734,9 @@ static bool prepend_lxc_header(char *path, const char *t, char *const argv[])
+ 		fprintf(f, "\n");
+ 	}
+ 
+-#if HAVE_LIBGNUTLS
++#if HAVE_OPENSSL
+ 	fprintf(f, "# Template script checksum (SHA-1): ");
+-	for (i=0; i<SHA_DIGEST_LENGTH; i++)
++	for (i=0; i<md_len; i++)
+ 		fprintf(f, "%02x", md_value[i]);
+ 	fprintf(f, "\n");
+ #endif
+diff --git a/src/lxc/utils.c b/src/lxc/utils.c
+index bf193a88b8..6d8a65818a 100644
+--- a/src/lxc/utils.c
++++ b/src/lxc/utils.c
+@@ -330,17 +330,30 @@ int lxc_wait_for_pid_status(pid_t pid)
+ 	return status;
+ }
+ 
+-#if HAVE_LIBGNUTLS
+-#include <gnutls/gnutls.h>
+-#include <gnutls/crypto.h>
++#ifdef HAVE_OPENSSL
++#include <openssl/evp.h>
+ 
+-__attribute__((constructor))
+-static void gnutls_lxc_init(void)
++static int do_sha1_hash(const char *buf, int buflen, unsigned char *md_value, int *md_len)
+ {
+-	gnutls_global_init();
++	EVP_MD_CTX *mdctx;
++	const EVP_MD *md;
++
++	md = EVP_get_digestbyname("sha1");
++	if(!md) {
++		printf("Unknown message digest: sha1\n");
++		return -1;
++	}
++
++	mdctx = EVP_MD_CTX_new();
++	EVP_DigestInit_ex(mdctx, md, NULL);
++	EVP_DigestUpdate(mdctx, buf, buflen);
++	EVP_DigestFinal_ex(mdctx, md_value, md_len);
++	EVP_MD_CTX_free(mdctx);
++
++	return 0;
+ }
+ 
+-int sha1sum_file(char *fnam, unsigned char *digest)
++int sha1sum_file(char *fnam, unsigned char *digest, int *md_len)
+ {
+ 	char *buf;
+ 	int ret;
+@@ -394,7 +407,7 @@ int sha1sum_file(char *fnam, unsigned char *digest)
+ 	}
+ 
+ 	buf[flen] = '\0';
+-	ret = gnutls_hash_fast(GNUTLS_DIG_SHA1, buf, flen, (void *)digest);
++	ret = do_sha1_hash(buf, flen, (void *)digest, md_len);
+ 	free(buf);
+ 	return ret;
+ }
+diff --git a/src/lxc/utils.h b/src/lxc/utils.h
+index 9f1c21dddb..dd6404f0b3 100644
+--- a/src/lxc/utils.h
++++ b/src/lxc/utils.h
+@@ -98,9 +98,8 @@ extern int lxc_pclose(struct lxc_popen_FILE *fp);
+ extern int wait_for_pid(pid_t pid);
+ extern int lxc_wait_for_pid_status(pid_t pid);
+ 
+-#if HAVE_LIBGNUTLS
+-#define SHA_DIGEST_LENGTH 20
+-extern int sha1sum_file(char *fnam, unsigned char *md_value);
++#if HAVE_OPENSSL
++extern int sha1sum_file(char *fnam, unsigned char *md_value, int *md_len);
+ #endif
+ 
+ /* initialize rand with urandom */
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index a059fd578e..0f5790b4b5 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -10,6 +10,8 @@ LXC_LICENSE = LGPL-2.1+
 LXC_LICENSE_FILES = COPYING
 LXC_DEPENDENCIES = host-pkgconf
 LXC_INSTALL_STAGING = YES
+# We're patching configure.ac
+LXC_AUTORECONF = YES
 
 LXC_CONF_OPTS = --disable-apparmor --with-distro=buildroot \
 	--disable-werror \
@@ -19,13 +21,6 @@ ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
 LXC_DEPENDENCIES += bash-completion
 endif
 
-ifeq ($(BR2_PACKAGE_GNUTLS),y)
-LXC_CONF_OPTS += --enable-gnutls
-LXC_DEPENDENCIES += gnutls
-else
-LXC_CONF_OPTS += --disable-gnutls
-endif
-
 ifeq ($(BR2_PACKAGE_LIBCAP),y)
 LXC_CONF_OPTS += --enable-capabilities
 LXC_DEPENDENCIES += libcap
@@ -47,4 +42,11 @@ else
 LXC_CONF_OPTS += --disable-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LXC_CONF_OPTS += --enable-openssl
+LXC_DEPENDENCIES += openssl
+else
+LXC_CONF_OPTS += --disable-openssl
+endif
+
 $(eval $(autotools-package))
-- 
2.20.1
