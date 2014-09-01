From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Sep 2014 22:11:35 +0200
Subject: [Buildroot] [git commit] chrony: disable docs build
Message-ID: <20140902073856.413B69D5D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2dbdd7c1df69b6efd0f5eb49a98db1ec04026bba
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needs makeinfo and we don't care about docs. Fixes:
http://autobuild.buildroot.net/results/fd0/fd03a86ed670c765d9f0a1ed6cc913079e030fc9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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
