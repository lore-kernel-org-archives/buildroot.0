From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  6 Dec 2016 20:49:07 +0100
Subject: [Buildroot] [PATCH v3 2/4] core: waf-package infra: add missing
	additional variables for build step
In-Reply-To: <1481053749-9315-1-git-send-email-romain.naour@gmail.com>
References: <1481053749-9315-1-git-send-email-romain.naour@gmail.com>
Message-ID: <1481053749-9315-2-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some waf packages may want to pass additional variables to waf script
in build step. Add the possibility to do so by defining <pkg>_BUILD_OPTS.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/pkg-waf.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index a82f45c..f9d435e 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -49,6 +49,7 @@ else
 $(2)_WAF = ./waf
 endif
 
+$(2)_BUILD_OPTS 			?=
 $(2)_INSTALL_STAGING_OPTS 		?=
 $(2)_INSTALL_TARGET_OPTS 		?=
 
@@ -75,7 +76,8 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$(@D) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) build -j $$(PARALLEL_JOBS)
+	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/usr/bin/python2 $$($(2)_WAF) \
+		build -j $$(PARALLEL_JOBS) $$($(2)_BUILD_OPTS)
 endef
 endif
 
-- 
2.5.5
