From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 14 Jul 2020 18:58:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/keepalived: don't use --{en,
 dis}able-iptables
Message-ID: <20200714165800.995534-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 5fcee496df262fcc304ad22738441df35a960a67 wrongly replaced
--{en,dis}able-libiptc by --{en,dis}able-iptables.

Indeed, this will raise the following build failure if
--disable-iptables and --disable-ipset are both set:

configure: error: disable-libipset requires vrrp and iptables

The issue is that when iptables flag is set, it will first check for
libiptc and then for ipset so setting --disable-iptables will disable
libiptc and ipset (which is not what we wants)

As iptables flag is enabled by default, just drop
--{en,dis}able-iptables to keep it simple

Fixes:
 - http://autobuild.buildroot.org/results/a1712b2cc3ad878e6876325ec7d4c434d0d9d11b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/keepalived/keepalived.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index df1ab6d306..64224e66b4 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -41,9 +41,6 @@ endif
 
 ifeq ($(BR2_PACKAGE_IPTABLES),y)
 KEEPALIVED_DEPENDENCIES += iptables
-KEEPALIVED_CONF_OPTS += --enable-iptables
-else
-KEEPALIVED_CONF_OPTS += --disable-iptables
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNFTNL),y)
-- 
2.27.0
