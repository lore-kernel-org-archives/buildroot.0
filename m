From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Feb 2016 12:27:59 +0100
Subject: [Buildroot] [git commit] iptables: fix libpcap static linking
Message-ID: <20160202135716.2CFD281739@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85a28f392783cf6b80881be02609c6df460e1dab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpcap can depend on other libraries like libusb and doesn't support
pkgconfig, so add those libraries to LIBS when building statically.
Fixes:
http://autobuild.buildroot.net/results/b4a/b4a3d00e9673a7aacc663c81de1d8e887a17951d/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iptables/iptables.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 77a9fad..12e00f2 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -38,6 +38,11 @@ endif
 
 # bpf compiler support and nfsynproxy tool
 ifeq ($(BR2_PACKAGE_IPTABLES_BPF_NFSYNPROXY),y)
+# libpcap is tricky for static-only builds and needs help
+ifeq ($(BR2_STATIC_LIBS),y)
+IPTABLES_LIBS_FOR_STATIC_LINK += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
+IPTABLES_CONF_OPTS += LIBS="$(IPTABLES_LIBS_FOR_STATIC_LINK)"
+endif
 IPTABLES_CONF_OPTS += --enable-bpf-compiler --enable-nfsynproxy
 IPTABLES_DEPENDENCIES += libpcap
 else
