From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 23 Feb 2010 23:17:40 +0100
Subject: [Buildroot] [git commit master] linux-advanced: Fix probing of
	kernel version
Message-ID: <20100223221928.54FC77777D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c1c171acbe3145af9647ddb42c4fe3af491689c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Probing the kernel version uses command substitution to capture the
result of a make command. If the top-level make is run with -C, the
sub-make will print entering/leaving directory messages, mucking up the
output we're trying to capture.

Invoke the sub-make with --no-print-directory so we get clean output.

Signed-off-by: Cameron Hutchison <cam@camh.ch>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 target/linux/Makefile.in.advanced |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/target/linux/Makefile.in.advanced b/target/linux/Makefile.in.advanced
index b4774ca..7679d1e 100644
--- a/target/linux/Makefile.in.advanced
+++ b/target/linux/Makefile.in.advanced
@@ -41,7 +41,7 @@ endif
 endif
 
 # Ask the kernel what version number it will use when installing modules
-LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) -s kernelrelease`
+LINUX26_VERSION_PROBED = `$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease`
 
 ifeq ($(BOARD_PATH),)
 BOARD_PATH:=$(call qstrip,$(BR2_BOARD_PATH))
-- 
1.6.3.3
