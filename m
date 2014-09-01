From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  1 Sep 2014 16:25:17 -0300
Subject: [Buildroot] [PATCH] chrony: disable docs build
Message-ID: <1409599517-29607-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needs makeinfo and we don't care about docs. Fixes:
http://autobuild.buildroot.net/results/fd0/fd03a86ed670c765d9f0a1ed6cc913079e030fc9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/chrony/chrony.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 59e5bfc..4fdb81f 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -27,6 +27,12 @@ ifneq ($(BR2_INET_IPV6),y)
 CHRONY_CONF_OPT += --disable-ipv6
 endif
 
+# Ditch the doc build, needs makeinfo and we don't need them
+define CHRONY_DISABLE_DOCS
+	$(SED) 's/chronyc chrony.txt/chronyc/' $(@D)/Makefile.in
+endef
+CHRONY_POST_PATCH_HOOKS += CHRONY_DISABLE_DOCS
+
 define CHRONY_CONFIGURE_CMDS
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(CHRONY_CONF_OPT)
 endef
-- 
1.8.5.5
