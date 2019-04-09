From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue,  9 Apr 2019 16:55:04 +0300
Subject: [Buildroot] [PATCH 1/2] package/gettext-tiny: Fix cyclic dependency
 with iconv
Message-ID: <1554818104-7594-1-git-send-email-email@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Vadim Kochan <vadim4j@gmail.com>

target's libiconv is added into host dependency which makes cyclic
dependency, anyway this dependency is not needed because of assumption
that iconv should be provided by the host.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 package/gettext-tiny/gettext-tiny.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index 4fa014e..87e90bc 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -49,10 +49,6 @@ define HOST_GETTEXT_TINY_COPY_EXTRA_FILES
 endef
 HOST_GETTEXT_TINY_POST_PATCH_HOOKS += HOST_GETTEXT_TINY_COPY_EXTRA_FILES
 
-ifeq ($(BR2_ENABLE_LOCALE),)
-HOST_GETTEXT_TINY_DEPENDENCIES = libiconv
-endif
-
 define HOST_GETTEXT_TINY_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
-- 
2.7.4
