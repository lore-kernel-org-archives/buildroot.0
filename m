From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 24 Apr 2014 18:24:39 +0200
Subject: [Buildroot] [PATCH] Makefile: target-purgelocales: add dependencies
Message-ID: <1398356679-1438-1-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The "target-purgelocales" target must be executed after all the other
targets so add dependencies to ensure that.
This also fix the support to top-level parallel make.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---

When both BR2_ENABLE_LOCALE_PURGE BR2_GENERATE_LOCALE are defined it
swap the execution order of target-purgelocales and
target-generatelocales, but as far as i can understand it does not arm
to do that.

Regards
Fabio Porcedda

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index eff408b..6b24482 100644
--- a/Makefile
+++ b/Makefile
@@ -579,7 +579,7 @@ ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
 LOCALE_WHITELIST = $(BUILD_DIR)/locales.nopurge
 LOCALE_NOPURGE = $(call qstrip,$(BR2_ENABLE_LOCALE_WHITELIST))
 
-target-purgelocales:
+target-purgelocales: $(filter-out target-purgelocales,$(TARGETS))
 	rm -f $(LOCALE_WHITELIST)
 	for i in $(LOCALE_NOPURGE); do echo $$i >> $(LOCALE_WHITELIST); done
 
-- 
1.8.3.2
