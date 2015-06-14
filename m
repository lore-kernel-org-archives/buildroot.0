From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 14:49:45 +0200
Subject: [Buildroot] [git commit] package/musl: bump to version 1.1.10
Message-ID: <20150614124951.AD3CE807EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=48b6fc2dbc0bd90be61e8f2b907e70f466379581
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A new regression in uselocale made it into this release. As suggested [1] by the
musl maintainers add a patch from upstream [2] to avoid breaking programs that
call uselocale.

[1]
http://www.musl-libc.org/download.html

[2]
http://git.musl-libc.org/cgit/musl/patch/?id=63f4b9f18f3674124d8bcb119739fec85e6da005

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/musl/0001-fix-uselocale.patch |   30 ++++++++++++++++++++++++++++++
 package/musl/musl.hash                |    2 +-
 package/musl/musl.mk                  |    2 +-
 3 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/package/musl/0001-fix-uselocale.patch b/package/musl/0001-fix-uselocale.patch
new file mode 100644
index 0000000..03a4c6e
--- /dev/null
+++ b/package/musl/0001-fix-uselocale.patch
@@ -0,0 +1,30 @@
+From 63f4b9f18f3674124d8bcb119739fec85e6da005 Mon Sep 17 00:00:00 2001
+From: Timo Ter??s <timo.teras@iki.fi>
+Date: Fri, 05 Jun 2015 07:39:42 +0000
+Subject: fix uselocale((locale_t)0) not to modify locale
+
+commit 68630b55c0c7219fe9df70dc28ffbf9efc8021d8 made the new locale to
+be assigned unconditonally resulting in crashes later on.
+
+Backported from: 63f4b9f18f3674124d8bcb119739fec85e6da005
+
+Signed-off-by: Timo Ter??s <timo.teras@iki.fi>
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
+---
+diff --git a/src/locale/uselocale.c b/src/locale/uselocale.c
+index b70a0c1..0fc5ecb 100644
+--- a/src/locale/uselocale.c
++++ b/src/locale/uselocale.c
+@@ -8,9 +8,7 @@ locale_t __uselocale(locale_t new)
+ 	locale_t old = self->locale;
+ 	locale_t global = &libc.global_locale;
+ 
+-	if (new == LC_GLOBAL_LOCALE) new = global;
+-
+-	self->locale = new;
++	if (new) self->locale = new == LC_GLOBAL_LOCALE ? global : new;
+ 
+ 	return old == global ? LC_GLOBAL_LOCALE : old;
+ }
+--
+cgit v0.9.0.3-65-g4555
diff --git a/package/musl/musl.hash b/package/musl/musl.hash
index d6b28e2..88415b0 100644
--- a/package/musl/musl.hash
+++ b/package/musl/musl.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	00bf7173caf972c88cd07cb0d420c082a2f35efcccc1a81f8909bec2d030283e  musl-1.1.9.tar.gz
+sha256	45bbe9b1c7f7a0f743477af1e103b6889bfe4dd9815e16f6c89f6c90831c8b7c  musl-1.1.10.tar.gz
diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index a089327..d8c0c6e 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUSL_VERSION = 1.1.9
+MUSL_VERSION = 1.1.10
 MUSL_SITE = http://www.musl-libc.org/releases
 MUSL_LICENSE = MIT
 MUSL_LICENSE_FILES = COPYRIGHT
