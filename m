From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 14 Dec 2020 17:09:45 +0100
Subject: [Buildroot] [PATCH] package/iptables: bump to version 1.8.6
Message-ID: <20201214160945.96307-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...ler-warning-fixes-for-NO_SHARED_LIBS.patch | 58 -------------------
 package/iptables/iptables.hash                |  2 +-
 package/iptables/iptables.mk                  |  2 +-
 3 files changed, 2 insertions(+), 60 deletions(-)
 delete mode 100644 package/iptables/0001-libxtables-compiler-warning-fixes-for-NO_SHARED_LIBS.patch

diff --git a/package/iptables/0001-libxtables-compiler-warning-fixes-for-NO_SHARED_LIBS.patch b/package/iptables/0001-libxtables-compiler-warning-fixes-for-NO_SHARED_LIBS.patch
deleted file mode 100644
index 8d364b378..000000000
--- a/package/iptables/0001-libxtables-compiler-warning-fixes-for-NO_SHARED_LIBS.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 6cb8af1ff3951e47def7a16db39289dc9d9c61fe Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Maciej=20=C5=BBenczykowski?= <maze@google.com>
-Date: Tue, 23 Jun 2020 16:09:02 -0700
-Subject: libxtables: compiler warning fixes for NO_SHARED_LIBS
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fixes two issues with NO_SHARED_LIBS:
- - #include <dlfcn.h> is ifdef'ed out and thus dlclose()
-   triggers an undeclared function compiler warning
- - dlreg_add() is unused and thus triggers an unused
-   function warning
-
-Test: builds without warnings
-Signed-off-by: Maciej ?enczykowski <maze@google.com>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
-
-[Retrieved from:
-https://git.netfilter.org/iptables/commit/libxtables/xtables.c?id=6cb8af1ff3951e47def7a16db39289dc9d9c61fe]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- libxtables/xtables.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libxtables/xtables.c b/libxtables/xtables.c
-index 7fe42580..8907ba20 100644
---- a/libxtables/xtables.c
-+++ b/libxtables/xtables.c
-@@ -206,6 +206,7 @@ struct xtables_target *xtables_targets;
- static bool xtables_fully_register_pending_match(struct xtables_match *me);
- static bool xtables_fully_register_pending_target(struct xtables_target *me);
- 
-+#ifndef NO_SHARED_LIBS
- /* registry for loaded shared objects to close later */
- struct dlreg {
- 	struct dlreg *next;
-@@ -237,6 +238,7 @@ static void dlreg_free(void)
- 		dlreg = next;
- 	}
- }
-+#endif
- 
- void xtables_init(void)
- {
-@@ -267,7 +269,9 @@ void xtables_init(void)
- 
- void xtables_fini(void)
- {
-+#ifndef NO_SHARED_LIBS
- 	dlreg_free();
-+#endif
- }
- 
- void xtables_set_nfproto(uint8_t nfproto)
--- 
-cgit v1.2.3
-
diff --git a/package/iptables/iptables.hash b/package/iptables/iptables.hash
index 725770543..120e7e4a8 100644
--- a/package/iptables/iptables.hash
+++ b/package/iptables/iptables.hash
@@ -1,4 +1,4 @@
 # From https://netfilter.org/projects/iptables/downloads.html
-sha256  d457d74512e63aa3f50336e0597d4023c0e3c6845594d38532efb6ebcb294309  iptables-1.8.5.tar.bz2
+sha256  a0f4fe0c3eb8faa5bd9c8376d132f340b9558e750c91deb2d5028aa3d0047767  iptables-1.8.6.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 442639f15..f83165edb 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPTABLES_VERSION = 1.8.5
+IPTABLES_VERSION = 1.8.6
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = https://netfilter.org/projects/iptables/files
 IPTABLES_INSTALL_STAGING = YES
-- 
2.27.0
