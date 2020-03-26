From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Mar 2020 20:01:27 +0100
Subject: [Buildroot] [git commit] package/connman: add missing libmnl
 dependency for nftables
Message-ID: <20200326184926.B5893882C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76defe49ac278a74f05e00c70be0921eeab9d277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building with nftables support requires libmnl.

Fixes:
  - http://autobuild.buildroot.org/results/4afdacc0357eb3b86594757dd89623b6e5a5e362/
  - http://autobuild.buildroot.org/results/89e6f92dee4a93185891c48b5d7f7b5b0345b67e/
  - http://autobuild.buildroot.org/results/dd8a68827ca70838c59d82780cb3eadf6b9764c2/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
[yann.morin.1998 at free.fr: add autobuild referecnes]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/connman/Config.in  | 1 +
 package/connman/connman.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index ac012dda54..48a2ee421c 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -33,6 +33,7 @@ config BR2_PACKAGE_CONNMAN_NFTABLES
 	bool "nftables"
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+	select BR2_PACKAGE_LIBMNL
 	select BR2_PACKAGE_NFTABLES
 	help
 	  Use nftables as firewall.
diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 701be8b59d..1ebfe9cf14 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -41,7 +41,7 @@ CONNMAN_CONF_OPTS += --with-firewall=iptables
 CONNMAN_DEPENDENCIES += iptables
 else ifeq ($(BR2_PACKAGE_CONNMAN_NFTABLES),y)
 CONNMAN_CONF_OPTS += --with-firewall=nftables
-CONNMAN_DEPENDENCIES += nftables
+CONNMAN_DEPENDENCIES += libmnl nftables
 endif
 
 ifeq ($(BR2_PACKAGE_CONNMAN_LOOPBACK),y)
