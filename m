From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Nov 2014 22:40:55 +0100
Subject: [Buildroot] [git commit] tcpdump: fix static build
Message-ID: <20141111221026.1B608B4389@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da1a445d419cfdd168c02f2ebc71800e7c86dc8d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 746116d1eb2e (tcpdump: use libpcap shared library) broke static build
of tcpdump, because its configure script doesn't take into account indirect
dependencies of libpcap. Add these dependencies to the LIBS configure
parameter.

Fixes:
http://autobuild.buildroot.net/results/fd231d34e4bb0306609b021e9e74eb862b7bd6bd/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tcpdump/tcpdump.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
index e62dfaf..1acf7d9 100644
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
