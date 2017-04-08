From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Apr 2017 21:43:02 +0200
Subject: [Buildroot] [git commit] arp-scan: fix static link when libnl is
	selected
Message-ID: <20170408194317.C37B3825DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=df578c86eddfb5d115195d3650d5ecba5431e8fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When libnl is selected, libpcap links with it. Since libpcap doesn't
provide a .pc file and arp-scan doesn't use its libpcap-config script,
we must provide the additional options explicilty.

Fixes
http://autobuild.buildroot.net/results/c605c8cc36348f199a36e2652851b8d02ee222c0

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/arp-scan/arp-scan.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/arp-scan/arp-scan.mk b/package/arp-scan/arp-scan.mk
index fc3740b..b46e941 100644
--- a/package/arp-scan/arp-scan.mk
+++ b/package/arp-scan/arp-scan.mk
@@ -13,6 +13,10 @@ ARP_SCAN_DEPENDENCIES = libpcap
 # 0001-configure-try-linking-to-detect-stack-protector-supp.patch touches acinclude.m4
 ARP_SCAN_AUTORECONF = YES
 
+ifeq ($(BR2_STATIC_LIBS),y)
+ARP_SCAN_CONF_OPTS = LIBS="`$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`"
+endif
+
 ARP_SCAN_CONF_ENV = pgac_cv_snprintf_long_long_int_format='%lld'
 
 $(eval $(autotools-package))
