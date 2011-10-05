From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  5 Oct 2011 17:23:38 -0300
Subject: [Buildroot] [PATCH] gmp: work around ARM thumb build breakage
Message-ID: <1317846218-3890-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gmp/gmp.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 5eb6ecc..2222465 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -9,5 +9,10 @@ GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.bz2
 GMP_INSTALL_STAGING = YES
 
+# Bad ARM assembly breaks on pure thumb
+ifeq ($(ARCH),arm)
+GMP_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -marm"
+endif
+
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
-- 
1.7.3.4
