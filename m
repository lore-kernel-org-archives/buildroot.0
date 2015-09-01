From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2015 21:57:35 +0200
Subject: [Buildroot] [git commit] musl: bump to version 1.1.11
Message-ID: <20150901200659.4110181ED5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=64ab4ffd18eecde29fc0e77f592b15780b84d40b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/musl/0001-fix-uselocale.patch |   30 ------------------------------
 package/musl/musl.hash                |    2 +-
 package/musl/musl.mk                  |    2 +-
 3 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/package/musl/0001-fix-uselocale.patch b/package/musl/0001-fix-uselocale.patch
deleted file mode 100644
index 03a4c6e..0000000
--- a/package/musl/0001-fix-uselocale.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 63f4b9f18f3674124d8bcb119739fec85e6da005 Mon Sep 17 00:00:00 2001
-From: Timo Ter??s <timo.teras@iki.fi>
-Date: Fri, 05 Jun 2015 07:39:42 +0000
-Subject: fix uselocale((locale_t)0) not to modify locale
-
-commit 68630b55c0c7219fe9df70dc28ffbf9efc8021d8 made the new locale to
-be assigned unconditonally resulting in crashes later on.
-
-Backported from: 63f4b9f18f3674124d8bcb119739fec85e6da005
-
-Signed-off-by: Timo Ter??s <timo.teras@iki.fi>
-Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
----
-diff --git a/src/locale/uselocale.c b/src/locale/uselocale.c
-index b70a0c1..0fc5ecb 100644
---- a/src/locale/uselocale.c
-+++ b/src/locale/uselocale.c
-@@ -8,9 +8,7 @@ locale_t __uselocale(locale_t new)
- 	locale_t old = self->locale;
- 	locale_t global = &libc.global_locale;
- 
--	if (new == LC_GLOBAL_LOCALE) new = global;
--
--	self->locale = new;
-+	if (new) self->locale = new == LC_GLOBAL_LOCALE ? global : new;
- 
- 	return old == global ? LC_GLOBAL_LOCALE : old;
- }
---
-cgit v0.9.0.3-65-g4555
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index 88415b0..4872f94 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	45bbe9b1c7f7a0f743477af1e103b6889bfe4dd9815e16f6c89f6c90831c8b7c  musl-1.1.10.tar.gz
+sha256	bb9e6da51b7b12641f5d1abb39705c6c6c1b2fbd20002362948aa736a0aa353f  musl-1.1.11.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index d8c0c6e..22589f5 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.10
+MUSL_VERSION = 1.1.11
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
