From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 5 Feb 2020 15:37:51 +0100
Subject: [Buildroot] [git commit] package/elixir: new package
Message-ID: <20200205142657.B2F1F8C9AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14ff0c73899df6db0c83c5ecb8c85429df9513e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

elixir is required to build RabbitMQ starting from v3.7

Signed-off-by: Frank Vanbever <frank.vanbever@essensium.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                 |  1 +
 package/elixir/elixir.hash |  3 +++
 package/elixir/elixir.mk   | 21 +++++++++++++++++++++
 3 files changed, 25 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index af03992cc3..67cce2f8e4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -960,6 +960,7 @@ F:	package/upx/
 F:	package/zxing-cpp/
 
 N:	Frank Vanbever <frank.vanbever@essensium.com>
+F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
diff --git a/package/elixir/elixir.hash b/package/elixir/elixir.hash
new file mode 100644
index 0000000000..b4d2f8b6b0
--- /dev/null
+++ b/package/elixir/elixir.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256 f3465d8a8e386f3e74831bf9594ee39e6dfde6aa430fe9260844cfe46aa10139  elixir-1.9.4.tar.gz
+sha256 a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE
diff --git a/package/elixir/elixir.mk b/package/elixir/elixir.mk
new file mode 100644
index 0000000000..7a545d43b0
--- /dev/null
+++ b/package/elixir/elixir.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# elixir
+#
+################################################################################
+
+ELIXIR_VERSION = 1.9.4
+ELIXIR_SITE = $(call github,elixir-lang,elixir,v$(ELIXIR_VERSION))
+ELIXIR_LICENSE = Apache-2.0
+ELIXIR_LICENSE_FILES = LICENSE
+ELIXIR_DEPENDENCIES = host-erlang
+
+define HOST_ELIXIR_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) compile
+endef
+
+define HOST_ELIXIR_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) PREFIX="$(HOST_DIR)" -C $(@D) install
+endef
+
+$(eval $(host-generic-package))
