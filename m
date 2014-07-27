From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 27 Jul 2014 18:34:37 +0200
Subject: [Buildroot] [PATCH] perl: handles BR2_PREFER_STATIC_LIB
Message-ID: <1406478877-9705-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 Makefile             | 1 +
 package/perl/perl.mk | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 6bd18e3..a0f37db 100644
--- a/Makefile
+++ b/Makefile
@@ -579,6 +579,7 @@ endif
 	rm -rf $(TARGET_DIR)/usr/lib/luarocks
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/pod
 	rm -rf $(TARGET_DIR)/usr/lib/perl5/$(PERL_VERSION)/$(PERL_ARCHNAME)/CORE
+	find $(TARGET_DIR)/usr/lib/perl5/ -name 'extralibs.ld' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '*.bs' -print0 | xargs -0 rm -f
 	find $(TARGET_DIR)/usr/lib/perl5/ -name '.packlist' -print0 | xargs -0 rm -f
 	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 8321570..7acd76d 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -69,6 +69,11 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_CONF_OPT += -Dusedevel
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+    PERL_CONF_OPT += --all-static
+    PERL_CONF_OPT += --no-dynaloader
+endif
+
 ifneq ($(BR2_LARGEFILE),y)
     PERL_CONF_OPT += -Uuselargefiles
 endif
-- 
1.9.1
