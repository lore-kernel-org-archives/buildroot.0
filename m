From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 4 Apr 2016 10:19:55 +0200
Subject: [Buildroot] [PATCH 2/2] strongswan: disable iptables support
Message-ID: <20160404081955.GA8572@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a new conflict between Linux header (linux/if.h)
and C library header (net/if.h) introduced by this commit
to the Linux kernel:
1ffad83dffd675cd742286ae82dca7d746cb0da8
Mikko Rapeli is working on a solution, but it requires
changes to the Linux kernel and C library.

For now I would just disable the iptables feature in Strongswan.

The changes fixes following autobuild error:
http://autobuild.buildroot.net/results/e1693a714eb690988c1798b733d0ff143e50b3b9/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/strongswan/strongswan.mk | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index e27606c..e7606c0 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -71,15 +71,10 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_MYSQL),mysql)
 endif
 
-ifeq ($(BR2_PACKAGE_IPTABLES),y)
-STRONGSWAN_DEPENDENCIES += iptables
+# disable connmark/forecast until net/if.h vs. linux/if.h conflict resolved
+# problem exist since linux 4.5 header changes
 STRONGSWAN_CONF_OPTS += \
-	--enable-connmark \
-	--enable-forecast
-else
-STRONGSWAN_COF_OPTS += \
 	--disable-connmark \
 	--disable-forecast
-endif
 
 $(eval $(autotools-package))
-- 
2.1.4
