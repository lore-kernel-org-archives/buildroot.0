From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:35:27 +0200
Subject: [Buildroot] [git commit] libpwquality: bump to version 1.4.0
Message-ID: <20180602101014.120798199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a853849e4d50ef7e126a1da524be37aeb878a6de
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove both patches (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ith-disable-nls-on-platforms-without-libi.patch | 47 ----------------------
 ...leak-in-settings-when-using-bad-word-list.patch | 26 ------------
 package/libpwquality/libpwquality.hash             |  3 +-
 package/libpwquality/libpwquality.mk               |  2 +-
 4 files changed, 3 insertions(+), 75 deletions(-)

diff --git a/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch b/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
deleted file mode 100644
index 3bae15c221..0000000000
--- a/package/libpwquality/0001-Fix-build-with-disable-nls-on-platforms-without-libi.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From fd1694c9d85666a39fe39e76518581b1ccd5a6c5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
-Date: Thu, 2 Feb 2017 11:16:49 +0100
-Subject: [PATCH] Fix build with --disable-nls on platforms without libintl
- included in libc.
-
-Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
-
----
-
-Status: accepted upstream, not yet released.
-
-diff --git a/src/pwmake.c b/src/pwmake.c
-index 5b8cfb8..81f7cd3 100644
---- a/src/pwmake.c
-+++ b/src/pwmake.c
-@@ -33,9 +33,11 @@ main(int argc, char *argv[])
-         int bits;
-         void *auxerror;
- 
-+#ifdef ENABLE_NLS
-         setlocale(LC_ALL, "");
-         bindtextdomain("libpwquality", "/usr/share/locale");
-         textdomain("libpwquality");
-+#endif
- 
-         if (argc != 2) {
-                 usage(basename(argv[0]));
-diff --git a/src/pwscore.c b/src/pwscore.c
-index 219a175..24c13f2 100644
---- a/src/pwscore.c
-+++ b/src/pwscore.c
-@@ -34,9 +34,11 @@ main(int argc, char *argv[])
-         size_t len;
-         char *user = NULL;
- 
-+#ifdef ENABLE_NLS
-         setlocale(LC_ALL, "");
-         bindtextdomain("libpwquality", "/usr/share/locale");
-         textdomain("libpwquality");
-+#endif
- 
-         if (argc > 2) {
-                 usage(basename(argv[0]));
--- 
-2.9.3
-
diff --git a/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch b/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
deleted file mode 100644
index 1b4f24264c..0000000000
--- a/package/libpwquality/0002-Fix-memory-leak-in-settings-when-using-bad-word-list.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b1f2f1f71894fa0af92041fb4d5b6146101d63e5 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
-Date: Thu, 2 Feb 2017 11:17:26 +0100
-Subject: [PATCH] Fix memory leak in settings when using bad word list.
-
-Signed-off-by: Stefan S??rensen <stefan.sorensen@spectralink.com>
-
----
-
-Status: accepted upstream, not yet released.
-
-diff --git a/src/settings.c b/src/settings.c
-index 5c38b30..4b026b1 100644
---- a/src/settings.c
-+++ b/src/settings.c
-@@ -46,6 +46,7 @@ pwquality_free_settings(pwquality_settings_t *pwq)
- {
-         if (pwq) {
-                 free(pwq->dict_path);
-+                free(pwq->bad_words);
-                 free(pwq);
-         }
- }
--- 
-2.9.3
-
diff --git a/package/libpwquality/libpwquality.hash b/package/libpwquality/libpwquality.hash
index 0e3f9e30fd..97490f818a 100644
--- a/package/libpwquality/libpwquality.hash
+++ b/package/libpwquality/libpwquality.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	74d2ea90e103323c1f2d6a6cc9617cdae6877573eddb31aaf31a40f354cc2d2a	libpwquality-1.3.0.tar.bz2
+sha256	1de6ff046cf2172d265a2cb6f8da439d894f3e4e8157b056c515515232fade6b	libpwquality-1.4.0.tar.bz2
+sha256	aa44d09f651bf99b56253187c7778a240740c767d28453ab7fdc9804c842baee	COPYING
diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index 697af0b0b2..59b0e955fd 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPWQUALITY_VERSION = 1.3.0
+LIBPWQUALITY_VERSION = 1.4.0
 LIBPWQUALITY_SOURCE = libpwquality-$(LIBPWQUALITY_VERSION).tar.bz2
 LIBPWQUALITY_SITE = https://github.com/libpwquality/libpwquality/releases/download/libpwquality-$(LIBPWQUALITY_VERSION)
 LIBPWQUALITY_LICENSE = BSD-3-Clause or GPL-2.0+
