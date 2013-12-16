From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 16:03:03 +0100
Subject: [Buildroot] [git commit] libpcap: add upstream patch to fix runtime
	issue when TPACKET_V3 isn't supported
Message-ID: <20131216150821.105EF9C0AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7f05f73e44d8be72aacb53d279585281b639058f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpcap would fail to initialize on Linux when compiled against kernel
headers with TPACKET_V3 support but running on kernel without:

"can't get TPACKET_V3 header len on packet socket: Invalid argument"

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...> libpcap-0001-remove-libnl-include-path.patch} |    0
 ...0002-fix-TPACKET_V3-initialization-GH-329.patch |   34 ++++++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/libpcap/libpcap-remove-libnl-include-path.patch b/package/libpcap/libpcap-0001-remove-libnl-include-path.patch
similarity index 100%
rename from package/libpcap/libpcap-remove-libnl-include-path.patch
rename to package/libpcap/libpcap-0001-remove-libnl-include-path.patch
diff --git a/package/libpcap/libpcap-0002-fix-TPACKET_V3-initialization-GH-329.patch b/package/libpcap/libpcap-0002-fix-TPACKET_V3-initialization-GH-329.patch
new file mode 100644
index 0000000..9d16098
--- /dev/null
+++ b/package/libpcap/libpcap-0002-fix-TPACKET_V3-initialization-GH-329.patch
@@ -0,0 +1,34 @@
+From cd84bc9743d7595dee1ea4bc40bd236a619d6539 Mon Sep 17 00:00:00 2001
+From: Gabor Tatarka <gabor.tatarka@ericsson.com>
+Date: Mon, 2 Dec 2013 22:05:57 +0400
+Subject: [PATCH] fix TPACKET_V3 initialization (GH #329)
+
+libpcap would fail to initialize on Linux when compiled against kernel
+headers with TPACKET_V3 support but running on kernel without:
+
+"can't get TPACKET_V3 header len on packet socket: Invalid argument"
+
+Fix init_tpacket() to respect EINVAL because that is what the kernel
+returns for unsupported TPACKET versions.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ pcap-linux.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pcap-linux.c b/pcap-linux.c
+index 6c0723a..8800c96 100644
+--- a/pcap-linux.c
++++ b/pcap-linux.c
+@@ -3471,7 +3471,7 @@ init_tpacket(pcap_t *handle, int version, const char *version_str)
+ 
+ 	/* Probe whether kernel supports the specified TPACKET version */
+ 	if (getsockopt(handle->fd, SOL_PACKET, PACKET_HDRLEN, &val, &len) < 0) {
+-		if (errno == ENOPROTOOPT)
++		if (errno == ENOPROTOOPT || errno == EINVAL)
+ 			return 1;	/* no */
+ 
+ 		/* Failed to even find out; this is a fatal error. */
+-- 
+1.8.5.1
+
