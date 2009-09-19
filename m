From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2009 14:47:35 +0200
Subject: [Buildroot] [git commit master] Remove the BOARD/LOCAL feature
Message-ID: <20090919152747.86F73764AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=18183726d4ab327b217a9ead3a8e88cb434257f6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This can be achieved by adding a new target in target/device/, and I
will later propose a mechanism to add external boards and packages, so
that our users not willing to get their target-specific or
package-specific things merged can keep them cleanly separated from
Buildroot tree.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile |   15 ---------------
 1 files changed, 0 insertions(+), 15 deletions(-)

diff --git a/Makefile b/Makefile
index 8adaff4..cfa5778 100644
--- a/Makefile
+++ b/Makefile
@@ -32,14 +32,6 @@ noconfig_targets:=menuconfig xconfig config oldconfig randconfig \
 	defconfig allyesconfig allnoconfig release tags \
 	source-check help
 
-
-# Use shell variables, if defined
-ifneq ($(BUILDROOT_LOCAL),)
-BR2_LOCAL:=$(BUILDROOT_LOCAL)
-else
-BR2_LOCAL:=$(TOPDIR)/local
-endif
-
 # Strip quotes and then whitespaces
 qstrip=$(strip $(subst ",,$(1)))
 #"))
@@ -52,20 +44,13 @@ space:=$(empty) $(empty)
 # $(shell find . -name *_defconfig |sed 's/.*\///')
 # Pull in the user's configuration file
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
-ifeq ($(BOARD),)
-# if "make BOARD=xyz" command
 -include .config
-else
-# if "make" command
--include $(BR2_LOCAL)/$(BOARD)/$(BOARD).config
-endif
 endif
 
 # Override BR2_DL_DIR if shell variable defined
 ifneq ($(BUILDROOT_DL_DIR),)
 BR2_DL_DIR:=$(BUILDROOT_DL_DIR)
 endif
-LOCAL:=$(BR2_LOCAL)
 
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands
-- 
1.6.3.3
