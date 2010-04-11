From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Apr 2010 06:05:21 +0200
Subject: [Buildroot] [PATCH 25/25] Get rid of the OPTIMIZE_FOR_CPU variable
In-Reply-To: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
References: <cover.1270958653.git.thomas.petazzoni@free-electrons.com>
Message-ID: <58d7ab13783fde007a9987e333721c17764f25ee.1270958653.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This variable, together with the FIXME comment, has been added has
part of Eric Andersen's ? Major buildroot facelift, step one ? commit
that occured in October 2004.

Since then, no real usage has been made of OPTIMIZE_FOR_CPU, and the
initial intention has probably been lost in the memories of the
implementors.

Therefore, get rid of the variable, and just use $(ARCH) at the two
locations the variable was used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in   |    4 ++--
 toolchain/Makefile.in |    3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 43ff2dd..983caf3 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -109,8 +109,8 @@ TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
-REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
+GNU_TARGET_NAME=$(ARCH)-linux
+REAL_GNU_TARGET_NAME=$(ARCH)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
 KERNEL_CROSS=$(TARGET_CROSS)
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
diff --git a/toolchain/Makefile.in b/toolchain/Makefile.in
index 91aa17a..57d84a3 100644
--- a/toolchain/Makefile.in
+++ b/toolchain/Makefile.in
@@ -30,8 +30,5 @@ BR2_SYSROOT=# nothing
 BR2_ISYSROOT=#nothing
 endif
 
-# FIXME -- this is temporary
-OPTIMIZE_FOR_CPU=$(ARCH)
-
 # gcc has a bunch of needed stuff....
 include toolchain/gcc/Makefile.in
-- 
1.6.3.3
