From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 15:38:15 +0200
Subject: [Buildroot] [git commit] package/micropython: define
 MICROPY_NLR_SETJMP for xtensa
Message-ID: <20210404131259.7650E8C005@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fd9f4e6752fd0931fa5cc287bf0e6cd598c36a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As suggested on https://github.com/micropython/micropython/issues/6551
define MICROPY_NLR_SETJMP to avoid the xtensa specific implementation
of nlr_push.

Fixes:
- http://autobuild.buildroot.net/results/5fc8669b5c768ccfc02bd20d1159bce7fe43683e

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/micropython/micropython.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 80d086f3c8..fa28da9be3 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -21,6 +21,11 @@ ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
 MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
 endif
 
+# xtensa has problems with nlr_push, use setjmp based implementation instead
+ifeq ($(BR2_xtensa),y)
+MICROPYTHON_CFLAGS = -DMICROPY_NLR_SETJMP=1
+endif
+
 # When building from a tarball we don't have some of the dependencies that are in
 # the git repository as submodules
 MICROPYTHON_MAKE_OPTS += \
