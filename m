From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Sep 2015 09:51:20 +0200
Subject: [Buildroot] [git commit] micropython: Invert fallback detection
	logic
Message-ID: <20150924075555.A0CA781DCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d061220ae85e8f4cae2ebc490f687385e40a677
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rather than specifying architectures that do not have explicit support
in micropython invert the logic and set MICROPY_GCREGS_SETJMP=1 if the
architecture does not have explicit support. MIPS is listed as being
supported but this support consists of automatically defining
MICROPY_GCREGS_SETJMP 1 based on __mips__ being defined.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/micropython/micropython.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 7ae88a0..1358864 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -15,7 +15,7 @@ MICROPYTHON_PATCH = \
 
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
-ifeq ($(BR2_powerpc)$(BR2_sh)$(BR2_xtensa),y)
+ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
 MICROPYTHON_CFLAGS = -DMICROPY_GCREGS_SETJMP=1
 endif
 
