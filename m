From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 09:57:00 +0200
Subject: [Buildroot] [git commit] package/dnsmasq: add libidn2 support
Message-ID: <20190622075606.EDC058080E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=026a27ade4a6f4e71b5da0c2b29f26bbbb1dbb45
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libidn2 is preferred over libidn, see src/util.c:
 #if defined(HAVE_LIBIDN2)
 #include <idn2.h>
 #elif defined(HAVE_IDN)
 #include <idna.h>
 #endif

So select libidn2 if libidn is not enabled

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dnsmasq/Config.in  | 2 +-
 package/dnsmasq/dnsmasq.mk | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index cec68a9eba..d7f3d74bd4 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -29,7 +29,7 @@ config BR2_PACKAGE_DNSMASQ_DNSSEC
 
 config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support"
-	select BR2_PACKAGE_LIBIDN
+	select BR2_PACKAGE_LIBIDN2 if !BR2_PACKAGE_LIBIDN
 	help
 	  Enable IDN support in dnsmasq.
 	  This option is a big space taker since it pulls in many
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 366cebf012..f271523068 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -34,9 +34,14 @@ DNSMASQ_COPTS += -DNO_TFTP
 endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+DNSMASQ_DEPENDENCIES += libidn2
+DNSMASQ_COPTS += -DHAVE_LIBIDN2
+else
 DNSMASQ_DEPENDENCIES += libidn
 DNSMASQ_COPTS += -DHAVE_IDN
 endif
+endif
 
 ifeq ($(BR2_PACKAGE_DNSMASQ_CONNTRACK),y)
 DNSMASQ_DEPENDENCIES += libnetfilter_conntrack
