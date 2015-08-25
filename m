From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 11:49:29 +0200
Subject: [Buildroot] [git commit] dhcpdump: fix build with musl
Message-ID: <20150825094939.A72EC819E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4803fca4d7ae6deb843c5a7dad28620301188b5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

muls exposes udphdr Linux member names only when _GNU_SOURCE is defined.

Fixes:
http://autobuild.buildroot.net/results/dc2/dc2902b758faa7bcfed44cca5fa73aeffdf284ae/
http://autobuild.buildroot.net/results/432/43214b5f7d9e5881fbeba7203ee7fcfc6386a492/
http://autobuild.buildroot.net/results/291/29100641731904b50d73af7cf2db08847fe1567a/

and more.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dhcpdump/dhcpdump.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/dhcpdump/dhcpdump.mk b/package/dhcpdump/dhcpdump.mk
index 15fc02f..6b677a6 100644
--- a/package/dhcpdump/dhcpdump.mk
+++ b/package/dhcpdump/dhcpdump.mk
@@ -16,7 +16,8 @@ DHCPDUMP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
 endif
 
 define DHCPDUMP_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS)" LIBS="$(DHCPDUMP_LIBS)"
+	$(MAKE) -C $(@D) CC="$(TARGET_CC) $(TARGET_CFLAGS) -D_GNU_SOURCE" \
+		LIBS="$(DHCPDUMP_LIBS)"
 endef
 
 define DHCPDUMP_INSTALL_TARGET_CMDS
