From: =?UTF-8?q?Adrien=20Gallou=C3=ABt?= <adrien@gallouet.fr>
Date: Wed, 20 Mar 2019 21:09:44 +0000
Subject: [Buildroot] [PATCH 1/1] package/bird: add optional protocols
Message-ID: <20190320210943.21377-1-adrien@gallouet.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrien Gallou?t <adrien@gallouet.fr>
---
 package/bird/Config.in | 46 ++++++++++++++++++++++++++++++++++++++++++
 package/bird/bird.mk   | 16 +++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/package/bird/Config.in b/package/bird/Config.in
index a69551f94e..298348d098 100644
--- a/package/bird/Config.in
+++ b/package/bird/Config.in
@@ -20,4 +20,50 @@ config BR2_PACKAGE_BIRD_CLIENT
 	help
 	  Enable the BIRD client
 
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
index e165be61c0..26bec01ebf 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -17,4 +17,20 @@ else
 BIRD_CONF_OPTS += --disable-client
 endif
 
+# BUG: RIP is needed for now
+BR2_PACKAGE_BIRD_RIP=y
+
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_BFD),bfd,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_BABEL),babel,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_BGP),bgp,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_MRT),mrt,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_OSPF),ospf,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_PERF),perf,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_PIPE),pipe,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_RADV),radv,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_RIP),rip,)
+BR2_PACKAGE_BIRD_PROTOCOLS += $(if $(BR2_PACKAGE_BIRD_STATIC),static,)
+
+BIRD_CONF_OPTS += --with-protocols=$(subst $(space),$(comma),$(strip $(BR2_PACKAGE_BIRD_PROTOCOLS)))
+
 $(eval $(autotools-package))
-- 
2.19.1
