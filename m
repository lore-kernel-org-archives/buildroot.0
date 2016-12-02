From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Dec 2016 22:02:29 +0100
Subject: [Buildroot] [git commit] package/waf: new host package
Message-ID: <20161202225223.03C0781E52@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=879136d4c72bc41575877a12ea4b4eb4bf366b65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

host-waf will be used by waf-based packages that do not include it in
their release tarballs, like mpv.

mpv is currently the only case we have, but with the upcoming
waf-package infra, having host-waf available just makes the infra
complete from the onset.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: drop dependency on host-python, it's really a runtime dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/waf/waf.hash |  3 +++
 package/waf/waf.mk   | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
new file mode 100644
index 0000000..9d610b2
--- /dev/null
+++ b/package/waf/waf.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha1    33d170c738ed8c92dda2945b445272972f558244                          waf-1.9.5
+sha256  101f14e0f47a6410c00b8feda094948516cd3989491c56eb8268907fcd164909  waf-1.9.5
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
new file mode 100644
index 0000000..3d61f26
--- /dev/null
+++ b/package/waf/waf.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# waf
+#
+################################################################################
+
+WAF_VERSION = 1.9.5
+WAF_SOURCE = waf-$(WAF_VERSION)
+WAF_SITE = https://waf.io/
+
+define HOST_WAF_EXTRACT_CMDS
+	$(INSTALL) -D -m 0755 $(DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
+endef
+
+define HOST_WAF_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/waf $(HOST_DIR)/usr/bin/waf
+endef
+
+$(eval $(host-generic-package))
