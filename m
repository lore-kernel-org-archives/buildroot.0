From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:40:45 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] openvpn: Add explicit
	support for external lz4
Message-ID: <20170515125327.420F8828FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=655ff05b9f42160d25fbe0001dd80f74bdf66beb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

2.4.0 added lz4 support. Make that choice explicit or the bundled compat-lz4
"stub" will be used.

Signed-off-by: Jeroen Roovers <jer@airfi.aero>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 65e6f6ff2adc21f2fea4c0c8bc4dcd9e3b865264)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openvpn/Config.in  | 7 +++++++
 package/openvpn/openvpn.mk | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 5fa191d..0a16755 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -14,6 +14,13 @@ config BR2_PACKAGE_OPENVPN
 
 if BR2_PACKAGE_OPENVPN
 
+config BR2_PACKAGE_OPENVPN_LZ4
+	bool "LZ4 compression"
+	default y
+	select BR2_PACKAGE_LZ4
+	help
+	  Enable LZ4 compression.
+
 config BR2_PACKAGE_OPENVPN_LZO
 	bool "LZO compression"
 	default y
diff --git a/package/openvpn/openvpn.mk b/package/openvpn/openvpn.mk
index a2e21f9..6581a4e 100644
--- a/package/openvpn/openvpn.mk
+++ b/package/openvpn/openvpn.mk
@@ -35,6 +35,12 @@ else
 OPENVPN_CONF_ENV += IPROUTE=/sbin/ip
 endif
 
+ifeq ($(BR2_PACKAGE_OPENVPN_LZ4),y)
+OPENVPN_DEPENDENCIES += lz4
+else
+OPENVPN_CONF_OPTS += --disable-lz4
+endif
+
 ifeq ($(BR2_PACKAGE_OPENVPN_LZO),y)
 OPENVPN_DEPENDENCIES += lzo
 else
