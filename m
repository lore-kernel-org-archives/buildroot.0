From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 16:39:25 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/dnsmasq: bump to
 version 2.81
Message-ID: <20210204152011.F2E258012C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c787d0000cae09b4b17d04594e983d0da91c2002
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Drop upstream patches.

Remove CVE annotation; issue fixed upstream.

Depend on MMU. Upstream removed support for fork-less targets (commit
48d12f14c9c).

Reformat hashes file with two spaces delimiter. Remove stale 2.79
tarball hash entry.

Cc: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3aa870f19269abd4a51335a5af076ec42a0ee009)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Makefile-fix-i18n-build-with-ubus.patch   | 33 ---------------
 .../0002-Fix-build-with-libnettle-3.5.patch        | 46 --------------------
 ...003-Fix-build-after-y2038-changes-in-glib.patch | 29 -------------
 .../dnsmasq/0004-Fix-memory-leak-in-helper-c.patch | 49 ----------------------
 package/dnsmasq/Config.in                          |  1 +
 package/dnsmasq/dnsmasq.hash                       |  9 ++--
 package/dnsmasq/dnsmasq.mk                         |  5 +--
 7 files changed, 6 insertions(+), 166 deletions(-)

diff --git a/package/dnsmasq/0001-Makefile-fix-i18n-build-with-ubus.patch b/package/dnsmasq/0001-Makefile-fix-i18n-build-with-ubus.patch
deleted file mode 100644
index e42549beac..0000000000
--- a/package/dnsmasq/0001-Makefile-fix-i18n-build-with-ubus.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 08572cffb641004d86072f12aec4d6489454b897 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Fri, 21 Jun 2019 09:26:20 +0200
-Subject: [PATCH] Makefile: fix i18n build with ubus
-
-Commit caf4d571e6d86285a3690cfcc8de9c5f394320a8 forgot adding
-ubus_libs to build_libs for all-i18n target
-
-Fixes:
- - http://autobuild.buildroot.org/results/c0b27754b7ede024c095bdf0b3616e6f6be48c6d
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: sent to simon at thekelleys.org.uk]
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 3fb7cbe..78e25f0 100644
---- a/Makefile
-+++ b/Makefile
-@@ -111,7 +111,7 @@ all-i18n : $(BUILDDIR)
-  top="$(top)" \
-  i18n=-DLOCALEDIR=\'\"$(LOCALEDIR)\"\' \
-  build_cflags="$(version) $(dbus_cflags) $(idn2_cflags) $(idn_cflags) $(ct_cflags) $(lua_cflags) $(nettle_cflags)" \
-- build_libs="$(dbus_libs) $(idn2_libs) $(idn_libs) $(ct_libs) $(lua_libs) $(sunos_libs) $(nettle_libs) $(gmp_libs)"  \
-+ build_libs="$(dbus_libs) $(idn2_libs) $(idn_libs) $(ct_libs) $(lua_libs) $(sunos_libs) $(nettle_libs) $(gmp_libs) $(ubus_libs)"  \
-  -f $(top)/Makefile dnsmasq
- 	for f in `cd $(PO); echo *.po`; do \
- 		cd $(top) && cd $(BUILDDIR) && $(MAKE) top="$(top)" -f $(top)/Makefile $${f%.po}.mo; \
--- 
-2.14.1
-
diff --git a/package/dnsmasq/0002-Fix-build-with-libnettle-3.5.patch b/package/dnsmasq/0002-Fix-build-with-libnettle-3.5.patch
deleted file mode 100644
index a19a149458..0000000000
--- a/package/dnsmasq/0002-Fix-build-with-libnettle-3.5.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 6fd9aba7abe1e084123bc5002959350897774ace Mon Sep 17 00:00:00 2001
-From: Vladislav Grishenko <themiron@mail.ru>
-Date: Wed, 26 Jun 2019 20:27:11 +0500
-Subject: [PATCH] Fix build with libnettle 3.5
-
-Downloaded from
-https://github.com/themiron/dnsmasq/commit/6fd9aba7abe1e084123bc5002959350897774ace
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/crypto.c | 8 ++++++--
- 1 file changed, 6 insertions(+), 2 deletions(-)
-
-diff --git a/src/crypto.c b/src/crypto.c
-index 1f1c12b..9cfe371 100644
---- a/src/crypto.c
-+++ b/src/crypto.c
-@@ -296,6 +296,10 @@ static int dnsmasq_ecdsa_verify(struct blockdata *key_data, unsigned int key_len
-   static struct ecc_point *key_256 = NULL, *key_384 = NULL;
-   static mpz_t x, y;
-   static struct dsa_signature *sig_struct;
-+#if NETTLE_VERSION_MAJOR == 3 && NETTLE_VERSION_MINOR < 4
-+#define nettle_get_secp_256r1() (&nettle_secp_256r1)
-+#define nettle_get_secp_384r1() (&nettle_secp_384r1)
-+#endif
-   
-   if (!sig_struct)
-     {
-@@ -315,7 +319,7 @@ static int dnsmasq_ecdsa_verify(struct blockdata *key_data, unsigned int key_len
- 	  if (!(key_256 = whine_malloc(sizeof(struct ecc_point))))
- 	    return 0;
- 	  
--	  nettle_ecc_point_init(key_256, &nettle_secp_256r1);
-+	  nettle_ecc_point_init(key_256, nettle_get_secp_256r1());
- 	}
-       
-       key = key_256;
-@@ -328,7 +332,7 @@ static int dnsmasq_ecdsa_verify(struct blockdata *key_data, unsigned int key_len
- 	  if (!(key_384 = whine_malloc(sizeof(struct ecc_point))))
- 	    return 0;
- 	  
--	  nettle_ecc_point_init(key_384, &nettle_secp_384r1);
-+	  nettle_ecc_point_init(key_384, nettle_get_secp_384r1());
- 	}
-       
-       key = key_384;
diff --git a/package/dnsmasq/0003-Fix-build-after-y2038-changes-in-glib.patch b/package/dnsmasq/0003-Fix-build-after-y2038-changes-in-glib.patch
deleted file mode 100644
index fdde33a664..0000000000
--- a/package/dnsmasq/0003-Fix-build-after-y2038-changes-in-glib.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 3052ce208acf602f0163166dcefb7330d537cedb Mon Sep 17 00:00:00 2001
-From: Jiri Slaby <jslaby@suse.cz>
-Date: Wed, 24 Jul 2019 17:34:48 +0100
-Subject: [PATCH] Fix build after y2038 changes in glib.
-
-SIOCGSTAMP is defined in linux/sockios.h, not asm/sockios.h now.
-
-[Retrieved from:
-http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=patch;h=3052ce208acf602f0163166dcefb7330d537cedb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/dnsmasq.h |    1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/dnsmasq.h b/src/dnsmasq.h
-index ff3204a..3ef04ad 100644
---- a/src/dnsmasq.h
-+++ b/src/dnsmasq.h
-@@ -137,6 +137,7 @@ typedef unsigned long long u64;
- #endif
- 
- #if defined(HAVE_LINUX_NETWORK)
-+#include <linux/sockios.h>
- #include <linux/capability.h>
- /* There doesn't seem to be a universally-available 
-    userspace header for these. */
--- 
-1.7.10.4
-
diff --git a/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch b/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch
deleted file mode 100644
index c00a9cc3ef..0000000000
--- a/package/dnsmasq/0004-Fix-memory-leak-in-helper-c.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 69bc94779c2f035a9fffdb5327a54c3aeca73ed5 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Wed, 14 Aug 2019 20:44:50 +0100
-Subject: [PATCH] Fix memory leak in helper.c
-
-Thanks to Xu Mingjie <xumingjie1995@outlook.com> for spotting this.
-[Retrieved from:
-http://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=69bc94779c2f035a9fffdb5327a54c3aeca73ed5]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/helper.c |   12 +++++++++---
- 1 file changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/helper.c b/src/helper.c
-index 33ba120..c392eec 100644
---- a/src/helper.c
-+++ b/src/helper.c
-@@ -80,7 +80,8 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
-   pid_t pid;
-   int i, pipefd[2];
-   struct sigaction sigact;
--
-+  unsigned char *alloc_buff = NULL;
-+  
-   /* create the pipe through which the main program sends us commands,
-      then fork our process. */
-   if (pipe(pipefd) == -1 || !fix_fd(pipefd[1]) || (pid = fork()) == -1)
-@@ -186,11 +187,16 @@ int create_helper(int event_fd, int err_fd, uid_t uid, gid_t gid, long max_fd)
-       struct script_data data;
-       char *p, *action_str, *hostname = NULL, *domain = NULL;
-       unsigned char *buf = (unsigned char *)daemon->namebuff;
--      unsigned char *end, *extradata, *alloc_buff = NULL;
-+      unsigned char *end, *extradata;
-       int is6, err = 0;
-       int pipeout[2];
- 
--      free(alloc_buff);
-+      /* Free rarely-allocated memory from previous iteration. */
-+      if (alloc_buff)
-+	{
-+	  free(alloc_buff);
-+	  alloc_buff = NULL;
-+	}
-       
-       /* we read zero bytes when pipe closed: this is our signal to exit */ 
-       if (!read_write(pipefd[0], (unsigned char *)&data, sizeof(data), 1))
--- 
-1.7.10.4
-
diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index d7f3d74bd4..ef3a9b8341 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_DNSMASQ
 	bool "dnsmasq"
+	depends on BR2_USE_MMU # fork()
 	help
 	  A lightweight DNS and DHCP server. It is intended to provide
 	  coupled DNS and DHCP service to a LAN.
diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 18a539277e..99e417f069 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,7 +1,6 @@
 # Locally calculated after checking pgp signature
-# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.79.tar.xz.asc
-sha256	78ad74f5ca14fd85a8bac93f764cd9d60b27579e90eabd3687ca7b030e67861f	dnsmasq-2.79.tar.xz
-sha256	cdaba2785e92665cf090646cba6f94812760b9d7d8c8d0cfb07ac819377a63bb	dnsmasq-2.80.tar.xz
+# http://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.81.tar.xz.asc
+sha256  749ca903537c5197c26444ac24b0dce242cf42595fdfe6b9a5b9e4c7ad32f8fb  dnsmasq-2.81.tar.xz
 # Locally calculated
-sha256	dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa	COPYING
-sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING-v3
+sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 3f25ac0885..4a7218a2b7 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.80
+DNSMASQ_VERSION = 2.81
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
 DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
@@ -15,9 +15,6 @@ DNSMASQ_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DNSMASQ_LICENSE = GPL-2.0 or GPL-3.0
 DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 
-# 0004-Fix-memory-leak-in-helper-c.patch
-DNSMASQ_IGNORE_CVES += CVE-2019-14834
-
 DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
