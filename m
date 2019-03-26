From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 19:22:21 +0100
Subject: [Buildroot] [git commit] package/bird: add optional protocols
Message-ID: <20190326181946.04AB08428E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=529fef57f6f46201ba16349b49c0a65ceccc4c25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adrien Gallou??t <adrien@gallouet.fr>
[Thomas:
 - use proper variable names in .mk file
 - add comment in Config.in]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bird/Config.in | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/bird/bird.mk   | 16 ++++++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index a69551f94e..63170ee470 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -20,4 +20,52 @@ config BR2_PACKAGE_BIRD_CLIENT
 	help
 	  Enable the BIRD client
 
+comment "protocol support"
+
+config BR2_PACKAGE_BIRD_BABEL
+	bool "babel"
+	help
+	  Enable Babel protocol.
+
+config BR2_PACKAGE_BIRD_BFD
+	bool "bfd"
+	help
+	  Enable BFD protocol.
+
+config BR2_PACKAGE_BIRD_BGP
+	bool "bgp"
+	default y
+	help
+	  Enable BGP protocol.
+
+config BR2_PACKAGE_BIRD_MRT
+	bool "mrt"
+	help
+	  Enable MRT protocol.
+
+config BR2_PACKAGE_BIRD_OSPF
+	bool "ospf"
+	help
+	  Enable OSPFv2 and OSPFv3 protocol.
+
+config BR2_PACKAGE_BIRD_PERF
+	bool "perf"
+	help
+	  Enable Perf protocol.
+
+config BR2_PACKAGE_BIRD_PIPE
+	bool "pipe"
+	help
+	  Enable Pipe protocol.
+
+config BR2_PACKAGE_BIRD_RADV
+	bool "radv"
+	help
+	  Enable RAdv protocol.
+
+config BR2_PACKAGE_BIRD_STATIC
+	bool "static"
+	help
+	  Enable Static protocol.
+
 endif
diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index e165be61c0..8fe585b935 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -17,4 +17,20 @@ else
 BIRD_CONF_OPTS += --disable-client
 endif
 
+# BUG: RIP is mandatory for now
+BIRD_PROTOCOLS = \
+	rip \
+	$(if $(BR2_PACKAGE_BIRD_BFD),bfd) \
+	$(if $(BR2_PACKAGE_BIRD_BABEL),babel) \
+	$(if $(BR2_PACKAGE_BIRD_BGP),bgp) \
+	$(if $(BR2_PACKAGE_BIRD_MRT),mrt) \
+	$(if $(BR2_PACKAGE_BIRD_OSPF),ospf) \
+	$(if $(BR2_PACKAGE_BIRD_PERF),perf) \
+	$(if $(BR2_PACKAGE_BIRD_PIPE),pipe) \
+	$(if $(BR2_PACKAGE_BIRD_RADV),radv) \
+	$(if $(BR2_PACKAGE_BIRD_RIP),rip) \
+	$(if $(BR2_PACKAGE_BIRD_STATIC),static)
+
+BIRD_CONF_OPTS += --with-protocols=$(subst $(space),$(comma),$(strip $(BIRD_PROTOCOLS)))
+
 $(eval $(autotools-package))
