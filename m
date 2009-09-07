From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Sep 2009 00:09:50 +0200
Subject: [Buildroot] [PATCH 2/5] Remove the BOARD/LOCAL feature
In-Reply-To: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
References: <cover.1252361088.git.thomas.petazzoni@free-electrons.com>
Message-ID: <5e910ab8275a30b2f0f9fc51bf59088a46d8e094.1252361088.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
index 7a3cd17..61c2b80 100644
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
1.6.0.4
