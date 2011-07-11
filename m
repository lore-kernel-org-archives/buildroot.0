From: Daniel Mack <zonque@gmail.com>
Date: Mon, 11 Jul 2011 17:43:40 +0200
Subject: [Buildroot] [PATCH] alsa-utils: Add patch for amixer TLV output
Message-ID: <1310399020-27026-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch is queued upstream, so it can be dropped once a new version
of alsa-utils is released.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 .../alsa-utils/alsa-utils-amixer-tlv-fix.patch     |   32 ++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/alsa-utils/alsa-utils-amixer-tlv-fix.patch

diff --git a/package/multimedia/alsa-utils/alsa-utils-amixer-tlv-fix.patch b/package/multimedia/alsa-utils/alsa-utils-amixer-tlv-fix.patch
new file mode 100644
index 0000000..1b5e9c5
--- /dev/null
+++ b/package/multimedia/alsa-utils/alsa-utils-amixer-tlv-fix.patch
@@ -0,0 +1,32 @@
+diff --git a/amixer/amixer.c b/amixer/amixer.c
+index a177288..3bc6743 100644
+--- a/amixer/amixer.c
++++ b/amixer/amixer.c
+@@ -517,20 +517,20 @@ static void decode_tlv(unsigned int spaces, unsigned int *tlv, unsigned int tlv_
+ #ifdef SND_CTL_TLVT_DB_RANGE
+ 	case SND_CTL_TLVT_DB_RANGE:
+ 		printf("dBrange-\n");
+-		if ((size / (6 * sizeof(unsigned int))) != 0) {
++		if ((size % (6 * sizeof(unsigned int))) != 0) {
+ 			while (size > 0) {
+ 				printf("0x%08x,", tlv[idx++]);
+ 				size -= sizeof(unsigned int);
+ 			}
+ 			break;
+ 		}
+-		idx = 0;
+-		while (idx < size) {
++		while (size >= 0) {
+ 			print_spaces(spaces + 2);
+-			printf("rangemin=%i,", tlv[0]);
+-			printf(",rangemax=%i\n", tlv[1]);
+-			decode_tlv(spaces + 4, tlv + 2, 6 * sizeof(unsigned int));
+-			idx += 6 * sizeof(unsigned int);
++			printf("rangemin=%i,", tlv[idx++]);
++			printf(",rangemax=%i\n", tlv[idx++]);
++			decode_tlv(spaces + 4, tlv + idx, 4 * sizeof(unsigned int));
++			idx += 4 * sizeof(unsigned int);
++			size -= 6 * sizeof(unsigned int);
+ 		}
+ 		break;
+ #endif
-- 
1.7.5.4
