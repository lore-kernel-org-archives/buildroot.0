From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  6 Oct 2019 10:49:12 +0200
Subject: [Buildroot] [PATCH 2/2] package/nbd: bump to version 3.20
In-Reply-To: <20191006084912.10456-1-fontaine.fabrice@gmail.com>
References: <20191006084912.10456-1-fontaine.fabrice@gmail.com>
Message-ID: <20191006084912.10456-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (already in version)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nbd/0001-avoid-name-clashing.patch | 28 ----------------------
 package/nbd/nbd.hash                       |  8 +++----
 package/nbd/nbd.mk                         |  2 +-
 3 files changed, 5 insertions(+), 33 deletions(-)
 delete mode 100644 package/nbd/0001-avoid-name-clashing.patch

diff --git a/package/nbd/0001-avoid-name-clashing.patch b/package/nbd/0001-avoid-name-clashing.patch
deleted file mode 100644
index b3ea9c99c5..0000000000
--- a/package/nbd/0001-avoid-name-clashing.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-rename err() function to avoid clashing with err() form C library
-
-err() is a function available in the C library, so when static linking,
-there is a clash at link timebecause the function is provided both by
-nbd and the C library:
-    http://autobuild.buildroot.org/results/aa8/aa8a1ac35a93e1c8b9fddbc2b5d66ecaa921f31e/build-end.log
-
-Fix that by renaming err() to nbd_err() and providing a small maco
-wrapper to avoid touching the many call sites.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
----
-Upstream status: hack, not submitted.
-
-diff -durN nbd-3.11.orig/cliserv.h nbd-3.11/cliserv.h
---- nbd-3.11.orig/cliserv.h	2015-05-25 12:27:56.000000000 +0200
-+++ nbd-3.11/cliserv.h	2015-08-13 19:28:21.609467505 +0200
-@@ -75,7 +75,8 @@
- void setmysockopt(int sock);
- void err_nonfatal(const char *s);
- 
--void err(const char *s) G_GNUC_NORETURN;
-+void nbd_err(const char *s) G_GNUC_NORETURN;
-+#define err(S) nbd_err(S)
- 
- void logging(const char* name);
- 
diff --git a/package/nbd/nbd.hash b/package/nbd/nbd.hash
index fab14072c9..d856953c22 100644
--- a/package/nbd/nbd.hash
+++ b/package/nbd/nbd.hash
@@ -1,7 +1,7 @@
-# From http://sourceforge.net/projects/nbd/files/nbd/3.19/
-md5	162da84302abb5b9be06143c7943a642	nbd-3.19.tar.xz
-sha1	97edd98f7323a2fcd0dcf441f307d348cdbbb807	nbd-3.19.tar.xz
+# From http://sourceforge.net/projects/nbd/files/nbd/3.20/
+md5	910fe6c152f8c30ad8608388e6a4ce89	nbd-3.20.tar.xz
+sha1	9240430266ff4bfb2316ef6d880056a9974a59fd	nbd-3.20.tar.xz
 
 # Locally calculated
-sha256	b4466412f13e057659f25d35e1e8e181afd62c7179bff22a6add81445ecb8690	nbd-3.19.tar.xz
+sha256	e0e1b3538ab7ae5accf56180afd1a9887d415b98d21223b8ad42592b4af7d6cd	nbd-3.20.tar.xz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643	COPYING
diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index fa569f3224..5fd5555510 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NBD_VERSION = 3.19
+NBD_VERSION = 3.20
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-- 
2.23.0
