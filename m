From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 11 Nov 2014 12:23:03 +0200
Subject: [Buildroot] [PATCH] tcpdump: fix static build
Message-ID: <be457e188e773edcdc62c53a9237aa532b708c0e.1415701383.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 746116d1eb2e (tcpdump: use libpcap shared library) broke static build
of tcpdump, because its configure script doesn't take into account indirect
dependencies of libpcap. Add these dependencies to the LIBS configure
parameter.

Fixes:
http://autobuild.buildroot.net/results/fd231d34e4bb0306609b021e9e74eb862b7bd6bd/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tcpdump/tcpdump.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index e62dfaf44a89..1acf7d9e3065 100644
--- a/package/tcpdump/tcpdump.mk
+++ b/package/tcpdump/tcpdump.mk
@@ -16,6 +16,10 @@ TCPDUMP_DEPENDENCIES = zlib libpcap
 # Patching aclocal.m4
 TCPDUMP_AUTORECONF = YES
 
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+TCPDUMP_CONF_OPTS += LIBS="$(shell $(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs)"
+endif
+
 # make install installs an unneeded extra copy of the tcpdump binary
 define TCPDUMP_REMOVE_DUPLICATED_BINARY
 	rm -f $(TARGET_DIR)/usr/sbin/tcpdump.$(TCPDUMP_VERSION)
-- 
2.1.1
