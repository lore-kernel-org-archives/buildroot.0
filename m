From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 19 Jan 2013 09:06:25 -0300
Subject: [Buildroot] [PATCH] gettext: fix static build failure
Message-ID: <1358597185-7602-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When static libraries are preferred we don't build dynamic libraries so
it fails on the install phase. So don't try to do it for those cases.
Fixes:
http://autobuild.buildroot.net/results/651537ae1909b039e0cfc5c104ee87f93a9e5792/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gettext/gettext.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 953077d..204af10 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -35,9 +35,12 @@ endif
 # When the gettext tools are not enabled in the configuration, we only
 # install libintl to the target.
 ifeq ($(BR2_PACKAGE_GETTEXT_TOOLS),)
+# When static libs are preferred the .so files aren't created
+ifeq ($(BR2_PREFER_STATIC_LIB),)
 define GETTEXT_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.so* $(TARGET_DIR)/usr/lib/
 endef
+endif
 # Ditch the tools since they're off and pull other dependencies
 define GETTEXT_DISABLE_TOOLS
 	$(SED) 's/runtime gettext-tools/runtime/' $(@D)/Makefile.in
-- 
1.7.12.4
