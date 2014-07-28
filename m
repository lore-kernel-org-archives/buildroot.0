From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 22:29:09 +0200
Subject: [Buildroot] [git commit] perl: handle BR2_PREFER_STATIC_LIB
Message-ID: <20140728202918.306919D327@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=353e223d1471604f2c059d10a176b94a68e408ae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix commit title, use one line for both CONF_OPT options.]

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Makefile             |    1 +
 package/perl/perl.mk |    4 ++++
 2 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index d4ef081..258495c 100644
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
index 8321570..e4aad7f 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -69,6 +69,10 @@ ifeq ($(shell expr $(PERL_VERSION_MAJOR) % 2), 1)
     PERL_CONF_OPT += -Dusedevel
 endif
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+    PERL_CONF_OPT += --all-static --no-dynaloader
+endif
+
 ifneq ($(BR2_LARGEFILE),y)
     PERL_CONF_OPT += -Uuselargefiles
 endif
