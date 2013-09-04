From: Axel Lin <axel.lin@ingics.com>
Date: Wed, 04 Sep 2013 10:43:18 +0800
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in: Fix dependency for
 selecting uclinux as TARGET_OS
Message-ID: <1378262598.32360.5.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current setting only allows blackfin to select uclinux as TARGET_OS.
However, some noMMU ARM platforms that using FLAT binary format also need to
select uclinux as TARGET_OS. Fix the dependency.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
I need this change to allow testing build for ARM noMMU.
Maybe worth to upstream.

Axel
 package/Makefile.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 91ae1b9..6aa6266 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -23,8 +23,8 @@ MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
 
-# Blackfin FLAT needs uclinux
-ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
+# FLAT binary format needs uclinux
+ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_OS=uclinux
 else
 TARGET_OS=linux
-- 
1.8.1.2
