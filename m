From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 May 2014 19:12:56 -0300
Subject: [Buildroot] [WIP PATCH 1/5] uclibc: don't install tools to staging
	when static
In-Reply-To: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1401055980-28742-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't try to install ld* tools to staging when it's a static build,
there's no point and it'll be broken once we build a purely-static
uclibc.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 717cf53..ee87009 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -522,8 +522,8 @@ define UCLIBC_INSTALL_TARGET_CMDS
 	$(UCLIBC_INSTALL_TEST_SUITE)
 endef
 
-# For FLAT binfmts (static) there are no host utils
-ifeq ($(BR2_BINFMT_FLAT),)
+# STATIC has no ld* tools, only getconf
+ifeq ($(BR2_PREFER_STATIC_LIB),)
 define UCLIBC_INSTALL_UTILS_STAGING
 	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
 	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
-- 
1.8.5.5
