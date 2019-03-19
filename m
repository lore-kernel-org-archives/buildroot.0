From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 21:00:29 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/busybox: udhcp
 CVE-2019-5747 patch
Message-ID: <20190319202043.D8C187FD6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d267478615c4a98408f0b2b6748821ad9d130cbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Patch to resolve CVE-2019-5747 which affects versions prior
to 1.30.0

More information can be found at:
https://nvd.nist.gov/vuln/detail/CVE-2019-5747

This applies to both master and 2019.02

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit a49e8f34fffffaa7839861049add77fe6f4d7967)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...te-options-are-indeed-4-byte-closes-11506.patch |  1 +
 ...ing-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch | 58 ++++++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch b/package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch
index bc1a48bf4b..b40979e359 100644
--- a/package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch
+++ b/package/busybox/0004-udhcpc-check-that-4-byte-options-are-indeed-4-byte-closes-11506.patch
@@ -10,6 +10,7 @@ udhcp_get_option                                     231     248     +17
 (add/remove: 1/0 grow/shrink: 1/0 up/down: 44/0)               Total: 44 bytes
 
 Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
 ---
  networking/udhcp/common.c | 19 +++++++++++++++++++
  networking/udhcp/common.h |  4 ++++
diff --git a/package/busybox/0005-udhcpc-when-decoding-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch b/package/busybox/0005-udhcpc-when-decoding-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch
new file mode 100644
index 0000000000..05939db4ab
--- /dev/null
+++ b/package/busybox/0005-udhcpc-when-decoding-DHCP_SUBNET-ensure-it-is-4-bytes-long.patch
@@ -0,0 +1,58 @@
+From 74d9f1ba37010face4bd1449df4d60dd84450b06 Mon Sep 17 00:00:00 2001
+From: Denys Vlasenko <vda.linux@googlemail.com>
+Date: Mon, 7 Jan 2019 15:33:42 +0100
+Subject: udhcpc: when decoding DHCP_SUBNET, ensure it is 4 bytes long
+
+function                                             old     new   delta
+udhcp_run_script                                     795     801      +6
+
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
+---
+ networking/udhcp/common.c | 2 +-
+ networking/udhcp/common.h | 2 +-
+ networking/udhcp/dhcpc.c  | 2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/networking/udhcp/common.c b/networking/udhcp/common.c
+index 4c2221b77..fc4de5716 100644
+--- a/networking/udhcp/common.c
++++ b/networking/udhcp/common.c
+@@ -302,7 +302,7 @@ uint8_t* FAST_FUNC udhcp_get_option32(struct dhcp_packet *packet, int code)
+ {
+ 	uint8_t *r = udhcp_get_option(packet, code);
+ 	if (r) {
+-		if (r[-1] != 4)
++		if (r[-OPT_DATA + OPT_LEN] != 4)
+ 			r = NULL;
+ 	}
+ 	return r;
+diff --git a/networking/udhcp/common.h b/networking/udhcp/common.h
+index 9511152ff..62f9a2a4a 100644
+--- a/networking/udhcp/common.h
++++ b/networking/udhcp/common.h
+@@ -119,7 +119,7 @@ enum {
+ //#define DHCP_TIME_SERVER      0x04 /* RFC 868 time server (32-bit, 0 = 1.1.1900) */
+ //#define DHCP_NAME_SERVER      0x05 /* IEN 116 _really_ ancient kind of NS */
+ //#define DHCP_DNS_SERVER       0x06
+-//#define DHCP_LOG_SERVER       0x07 /* port 704 UDP log (not syslog)
++//#define DHCP_LOG_SERVER       0x07 /* port 704 UDP log (not syslog) */
+ //#define DHCP_COOKIE_SERVER    0x08 /* "quote of the day" server */
+ //#define DHCP_LPR_SERVER       0x09
+ #define DHCP_HOST_NAME          0x0c /* 12: either client informs server or server gives name to client */
+diff --git a/networking/udhcp/dhcpc.c b/networking/udhcp/dhcpc.c
+index 5b3fd531c..dcec8cdfd 100644
+--- a/networking/udhcp/dhcpc.c
++++ b/networking/udhcp/dhcpc.c
+@@ -531,7 +531,7 @@ static char **fill_envp(struct dhcp_packet *packet)
+ 		temp = udhcp_get_option(packet, code);
+ 		*curr = xmalloc_optname_optval(temp, &dhcp_optflags[i], opt_name);
+ 		putenv(*curr++);
+-		if (code == DHCP_SUBNET) {
++		if (code == DHCP_SUBNET && temp[-OPT_DATA + OPT_LEN] == 4) {
+ 			/* Subnet option: make things like "$ip/$mask" possible */
+ 			uint32_t subnet;
+ 			move_from_unaligned32(subnet, temp);
+-- 
+cgit v1.2.1
+
