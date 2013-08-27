From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 22:46:11 +0200
Subject: [Buildroot] [git commit] package/Makefile.in: fix ABI name for
	EABIhf targets
Message-ID: <20130827210259.F1BB49B3E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=796621c56aaed0a2b4c7c1fcec011f22501e94fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current code to set ABI on ARM does the following:

ifeq ($(BR2_arm)$(BR2_armeb),y)
... set ABI without 'hf' suffix ...
else ifeq ($(BR2_ARM_EABIHF),y)
... set ABI with 'hf' suffix ...
endif

But since $(BR2_arm)$(BR2_armeb) will always be 'y' in the cases where
BR2_ARM_EABIHF is 'y', it means that the 'else' part of the condition
will never be used.

Fix this by appending 'hf' to the ABI variable when BR2_ARM_EABIHF is
selected.

[Peter: put EABIhf handling under arm/armeb conditional for consistency]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.in |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index aed28d5..91ae1b9 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -46,11 +46,9 @@ ABI=gnueabi
 else
 ABI=eabi
 endif
-else ifeq ($(BR2_ARM_EABIHF),y)
-ifeq ($(LIBC),uclibc)
-ABI=gnueabihf
-else
-ABI=eabihf
+
+ifeq ($(BR2_ARM_EABIHF),y)
+ABI:=$(ABI)hf
 endif
 endif
 
