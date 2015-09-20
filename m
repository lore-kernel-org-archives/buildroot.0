From: Chris Packham <judge.packham@gmail.com>
Date: Sun, 20 Sep 2015 20:44:35 +1200
Subject: [Buildroot] [PATCH] micropython: Add upstream patch to fix 64-bit
	builds
Message-ID: <1442738675-5141-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following error when building for a 64-bit target

  ../py/objint_mpz.c:54:5: error: right shift count >= width of type [-Werror]
       (MP_SSIZE_MAX >> MPZ_DIG_SIZE * 4) & DIG_MASK,
       ^
  ../py/objint_mpz.c:54:5: error: initializer element is not constant
  ../py/objint_mpz.c:54:5: error: (near initialization for 'maxsize_dig[4]')

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
So this is the upstream patch that fixes the build problem and replaces
http://lists.busybox.net/pipermail/buildroot/2015-September/139826.html

 package/micropython/micropython.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 6266882..f2ad5bf 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -9,6 +9,7 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,$(MICROPYTHON_VERSION))
 MICROPYTHON_LICENSE = MIT
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi
+MICROPYTHON_PATCH = https://github.com/micropython/micropython/commit/8b4fb4fe140e9cf57fcfa258d0d2d6fe19090fc5.patch
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
-- 
2.5.0
