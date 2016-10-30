From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 17:02:12 +0100
Subject: [Buildroot] [PATCH 01/10] package/waf: new host package
In-Reply-To: <cover.1477843328.git.yann.morin.1998@free.fr>
References: <cover.1477843328.git.yann.morin.1998@free.fr>
Message-ID: <866827010ad3057640f15eb124ed58ce1b7e96c6.1477843328.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

host-waf will be used by waf-based packages that do not include it in
their release tarballs, like mpv.

mpv is currently the only case we have, but with the upcoming
waf-package infra, having host-waf available just makes the infra
complete from the onset.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@openwide.fr>
---
 package/waf/waf.hash |  3 +++
 package/waf/waf.mk   | 28 ++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 package/waf/waf.hash
 create mode 100644 package/waf/waf.mk

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
index 0000000..cd0c67e
--- /dev/null
+++ b/package/waf/waf.mk
@@ -0,0 +1,28 @@
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
+# Waf is a python script, compatible with any python >= 2.6, but some
+# packages have wafscripts not compatible with python3. So always use
+# python2.
+#
+# We don't really need host-python to install host-waf, but having this
+# dependency here will hide it from packages themselves
+HOST_WAF_DEPENDENCIES = host-python
+
+# Not really needed, but here for consistency with other packages.
+define HOST_WAF_EXTRACT_CMDS
+	$(INSTALL) -D -m 0755 $(DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
+endef
+
+define HOST_WAF_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/waf $(HOST_DIR)/usr/bin/waf
+endef
+
+$(eval $(host-generic-package))
-- 
2.7.4
