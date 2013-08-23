From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Aug 2013 20:40:16 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: fix ABI name for EABIhf
	targets
Message-ID: <1377283216-31225-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
I wondering how the EABIhf stuff could have worked. Is this something
I mismerged when rebasing my patch series? Anyway, if my analysis is
correct, it's certainly something that should be part of 2013.08.
---
 package/Makefile.in | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index e753d6b..e93d3ba 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -46,12 +46,10 @@ ABI=gnueabi
 else
 ABI=eabi
 endif
-else ifeq ($(BR2_ARM_EABIHF),y)
-ifeq ($(LIBC),uclibc)
-ABI=gnueabihf
-else
-ABI=eabihf
 endif
+
+ifeq ($(BR2_ARM_EABIHF),y)
+ABI:=$(ABI)hf
 endif
 
 # For FSL PowerPC there's SPE
-- 
1.8.1.2
