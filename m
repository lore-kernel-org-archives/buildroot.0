From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 15 Sep 2020 20:59:03 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/ipmitool: fix
 CVE-2020-5208
Message-ID: <20200915185504.4B0A681015@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e773a0ce46de2ce3ae61b833ec208b0da0d89a0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Add several upstream patches that are made to fix this CVE. Since there
is still no dated plan to release a new version add this bunch of
patches.

Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 37c5e903a7e18f5b3847c11a40af5f74984d6c77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...8-fru-Fix-buffer-overflow-vulnerabilities.patch | 132 +++++++++++++++++++
 ...Fix-buffer-overflow-in-ipmi_spd_print_fru.patch |  52 ++++++++
 ...-buffer-overflow-in-ipmi_get_session_info.patch |  52 ++++++++
 .../0011-channel-Fix-buffer-overflow.patch         |  41 ++++++
 ...-buffer-overflows-in-get_lan_param_select.patch |  92 ++++++++++++++
 ...13-fru-sdr-Fix-id_string-buffer-overflows.patch | 141 +++++++++++++++++++++
 package/ipmitool/ipmitool.mk                       |   8 ++
 7 files changed, 518 insertions(+)

diff --git a/package/ipmitool/0008-fru-Fix-buffer-overflow-vulnerabilities.patch b/package/ipmitool/0008-fru-Fix-buffer-overflow-vulnerabilities.patch
new file mode 100644
index 0000000000..a39713fdb1
--- /dev/null
+++ b/package/ipmitool/0008-fru-Fix-buffer-overflow-vulnerabilities.patch
@@ -0,0 +1,132 @@
+From d615cb6c39d401a569941be2a615176191afa7ac Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:33:59 +0000
+Subject: [PATCH] fru: Fix buffer overflow vulnerabilities
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `read_fru_area_section` function only performs size validation of
+requested read size, and falsely assumes that the IPMI message will not
+respond with more than the requested amount of data; it uses the
+unvalidated response size to copy into `frubuf`. If the response is
+larger than the request, this can result in overflowing the buffer.
+
+The same issue affects the `read_fru_area` function.
+
+[Retrieve from
+https://github.com/ipmitool/ipmitool/commit/e824c23316ae50beb7f7488f2055ac65e8b341f2]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ lib/ipmi_fru.c | 33 +++++++++++++++++++++++++++++++--
+ 1 file changed, 31 insertions(+), 2 deletions(-)
+
+diff --git a/lib/ipmi_fru.c b/lib/ipmi_fru.c
+index cf00eff..af99aa9 100644
+--- a/lib/ipmi_fru.c
++++ b/lib/ipmi_fru.c
+@@ -615,7 +615,10 @@ int
+ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 			uint32_t offset, uint32_t length, uint8_t *frubuf)
+ {
+-	uint32_t off = offset, tmp, finish;
++	uint32_t off = offset;
++	uint32_t tmp;
++	uint32_t finish;
++	uint32_t size_left_in_buffer;
+ 	struct ipmi_rs * rsp;
+ 	struct ipmi_rq req;
+ 	uint8_t msg_data[4];
+@@ -628,10 +631,12 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 
+ 	finish = offset + length;
+ 	if (finish > fru->size) {
++		memset(frubuf + fru->size, 0, length - fru->size);
+ 		finish = fru->size;
+ 		lprintf(LOG_NOTICE, "Read FRU Area length %d too large, "
+ 			"Adjusting to %d",
+ 			offset + length, finish - offset);
++		length = finish - offset;
+ 	}
+ 
+ 	memset(&req, 0, sizeof(req));
+@@ -667,6 +672,7 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 		}
+ 	}
+ 
++	size_left_in_buffer = length;
+ 	do {
+ 		tmp = fru->access ? off >> 1 : off;
+ 		msg_data[0] = id;
+@@ -707,9 +713,18 @@ read_fru_area(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 		}
+ 
+ 		tmp = fru->access ? rsp->data[0] << 1 : rsp->data[0];
++		if(rsp->data_len < 1
++		   || tmp > rsp->data_len - 1
++		   || tmp > size_left_in_buffer)
++		{
++			printf(" Not enough buffer size");
++			return -1;
++		}
++
+ 		memcpy(frubuf, rsp->data + 1, tmp);
+ 		off += tmp;
+ 		frubuf += tmp;
++		size_left_in_buffer -= tmp;
+ 		/* sometimes the size returned in the Info command
+ 		* is too large.  return 0 so higher level function
+ 		* still attempts to parse what was returned */
+@@ -742,7 +757,9 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 			uint32_t offset, uint32_t length, uint8_t *frubuf)
+ {
+ 	static uint32_t fru_data_rqst_size = 20;
+-	uint32_t off = offset, tmp, finish;
++	uint32_t off = offset;
++	uint32_t tmp, finish;
++	uint32_t size_left_in_buffer;
+ 	struct ipmi_rs * rsp;
+ 	struct ipmi_rq req;
+ 	uint8_t msg_data[4];
+@@ -755,10 +772,12 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 
+ 	finish = offset + length;
+ 	if (finish > fru->size) {
++		memset(frubuf + fru->size, 0, length - fru->size);
+ 		finish = fru->size;
+ 		lprintf(LOG_NOTICE, "Read FRU Area length %d too large, "
+ 			"Adjusting to %d",
+ 			offset + length, finish - offset);
++		length = finish - offset;
+ 	}
+ 
+ 	memset(&req, 0, sizeof(req));
+@@ -773,6 +792,8 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 	if (fru->access && fru_data_rqst_size > 16)
+ #endif
+ 		fru_data_rqst_size = 16;
++
++	size_left_in_buffer = length;
+ 	do {
+ 		tmp = fru->access ? off >> 1 : off;
+ 		msg_data[0] = id;
+@@ -804,8 +825,16 @@ read_fru_area_section(struct ipmi_intf * intf, struct fru_info *fru, uint8_t id,
+ 		}
+ 
+ 		tmp = fru->access ? rsp->data[0] << 1 : rsp->data[0];
++		if(rsp->data_len < 1
++		   || tmp > rsp->data_len - 1
++		   || tmp > size_left_in_buffer)
++		{
++			printf(" Not enough buffer size");
++			return -1;
++		}
+ 		memcpy((frubuf + off)-offset, rsp->data + 1, tmp);
+ 		off += tmp;
++		size_left_in_buffer -= tmp;
+ 
+ 		/* sometimes the size returned in the Info command
+ 		* is too large.  return 0 so higher level function
+-- 
+2.20.1
+
diff --git a/package/ipmitool/0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch b/package/ipmitool/0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
new file mode 100644
index 0000000000..213a2ad7bb
--- /dev/null
+++ b/package/ipmitool/0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
@@ -0,0 +1,52 @@
+From 879f57c3b1ff17b1ca0dbdc8aac9c7a814e876fc Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:44:18 +0000
+Subject: [PATCH] fru: Fix buffer overflow in ipmi_spd_print_fru
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_spd_print_fru` function has a similar issue as the one fixed
+by the previous commit in `read_fru_area_section`. An initial request is
+made to get the `fru.size`, which is used as the size for the allocation
+of `spd_data`. Inside a loop, further requests are performed to get the
+copy sizes which are not checked before being used as the size for a
+copy into the buffer.
+
+[Retrieve from:
+https://github.com/ipmitool/ipmitool/commit/840fb1cbb4fb365cb9797300e3374d4faefcdb10]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ lib/dimm_spd.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/lib/dimm_spd.c b/lib/dimm_spd.c
+index 41e30db..68f3b4f 100644
+--- a/lib/dimm_spd.c
++++ b/lib/dimm_spd.c
+@@ -1621,7 +1621,7 @@ ipmi_spd_print_fru(struct ipmi_intf * intf, uint8_t id)
+ 	struct ipmi_rq req;
+ 	struct fru_info fru;
+ 	uint8_t *spd_data, msg_data[4];
+-	int len, offset;
++	uint32_t len, offset;
+ 
+ 	msg_data[0] = id;
+ 
+@@ -1697,6 +1697,13 @@ ipmi_spd_print_fru(struct ipmi_intf * intf, uint8_t id)
+ 		}
+ 
+ 		len = rsp->data[0];
++		if(rsp->data_len < 1
++		   || len > rsp->data_len - 1
++		   || len > fru.size - offset)
++		{
++			printf(" Not enough buffer size");
++			return -1;
++		}
+ 		memcpy(&spd_data[offset], rsp->data + 1, len);
+ 		offset += len;
+ 	} while (offset < fru.size);
+-- 
+2.20.1
+
diff --git a/package/ipmitool/0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch b/package/ipmitool/0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
new file mode 100644
index 0000000000..94a5ce6504
--- /dev/null
+++ b/package/ipmitool/0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
@@ -0,0 +1,52 @@
+From cd785a7fe4f42ab59bcefcf01b9175f039af29b5 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:51:49 +0000
+Subject: [PATCH] session: Fix buffer overflow in ipmi_get_session_info
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_get_session_info` function does not properly check the
+response `data_len`, which is used as a copy size, allowing stack buffer
+overflow.
+
+[Retrieve from:
+https://github.com/ipmitool/ipmitool/commit/41d7026946fafbd4d1ec0bcaca3ea30a6e8eed22]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ lib/ipmi_session.c | 12 ++++++++----
+ 1 file changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/lib/ipmi_session.c b/lib/ipmi_session.c
+index 141f0f4..b9af1fd 100644
+--- a/lib/ipmi_session.c
++++ b/lib/ipmi_session.c
+@@ -309,8 +309,10 @@ ipmi_get_session_info(struct ipmi_intf         * intf,
+ 		}
+ 		else
+ 		{
+-			memcpy(&session_info,  rsp->data, rsp->data_len);
+-			print_session_info(&session_info, rsp->data_len);
++			memcpy(&session_info,  rsp->data,
++			       __min(rsp->data_len, sizeof(session_info)));
++			print_session_info(&session_info,
++			                   __min(rsp->data_len, sizeof(session_info)));
+ 		}
+ 		break;
+ 		
+@@ -341,8 +343,10 @@ ipmi_get_session_info(struct ipmi_intf         * intf,
+ 				break;
+ 			}
+ 
+-			memcpy(&session_info,  rsp->data, rsp->data_len);
+-			print_session_info(&session_info, rsp->data_len);
++			memcpy(&session_info,  rsp->data,
++			       __min(rsp->data_len, sizeof(session_info)));
++			print_session_info(&session_info,
++			                   __min(rsp->data_len, sizeof(session_info)));
+ 			
+ 		} while (i <= session_info.session_slot_count);
+ 		break;
+-- 
+2.20.1
+
diff --git a/package/ipmitool/0011-channel-Fix-buffer-overflow.patch b/package/ipmitool/0011-channel-Fix-buffer-overflow.patch
new file mode 100644
index 0000000000..8d7ecb9550
--- /dev/null
+++ b/package/ipmitool/0011-channel-Fix-buffer-overflow.patch
@@ -0,0 +1,41 @@
+From 1d479fc61feacc64adea64da9601f3dfcf6f74b3 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 16:56:38 +0000
+Subject: [PATCH] channel: Fix buffer overflow
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `ipmi_get_channel_cipher_suites` function does not properly check
+the final response???s `data_len`, which can lead to stack buffer overflow
+on the final copy.
+
+[Retrieve from:
+https://github.com/ipmitool/ipmitool/commit/9452be87181a6e83cfcc768b3ed8321763db50e4]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ lib/ipmi_channel.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ipmi_channel.c b/lib/ipmi_channel.c
+index fab2e54..59ac227 100644
+--- a/lib/ipmi_channel.c
++++ b/lib/ipmi_channel.c
+@@ -413,7 +413,10 @@ ipmi_get_channel_cipher_suites(struct ipmi_intf *intf, const char *payload_type,
+ 			lprintf(LOG_ERR, "Unable to Get Channel Cipher Suites");
+ 			return -1;
+ 		}
+-		if (rsp->ccode > 0) {
++		if (rsp->ccode
++		    || rsp->data_len < 1
++		    || rsp->data_len > sizeof(uint8_t) + MAX_CIPHER_SUITE_DATA_LEN)
++		{
+ 			lprintf(LOG_ERR, "Get Channel Cipher Suites failed: %s",
+ 					val2str(rsp->ccode, completion_code_vals));
+ 			return -1;
+-- 
+2.20.1
+
diff --git a/package/ipmitool/0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch b/package/ipmitool/0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
new file mode 100644
index 0000000000..aba9ad2c71
--- /dev/null
+++ b/package/ipmitool/0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
@@ -0,0 +1,92 @@
+From ceebf5998b71e11c81133680560b498977d3d3cd Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 17:06:39 +0000
+Subject: [PATCH] lanp: Fix buffer overflows in get_lan_param_select
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Partial fix for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+The `get_lan_param_select` function is missing a validation check on the
+response???s `data_len`, which it then returns to caller functions, where
+stack buffer overflow can occur.
+
+[Retrieve from:
+https://github.com/ipmitool/ipmitool/commit/d45572d71e70840e0d4c50bf48218492b79c1a10]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ lib/ipmi_lanp.c | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/lib/ipmi_lanp.c b/lib/ipmi_lanp.c
+index 65d881b..022c7f1 100644
+--- a/lib/ipmi_lanp.c
++++ b/lib/ipmi_lanp.c
+@@ -1809,7 +1809,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 		/* set new ipaddr */
+ 		memcpy(data+3, temp, 4);
+ 		printf("Setting LAN Alert %d IP Address to %d.%d.%d.%d\n", alert,
+@@ -1824,7 +1824,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 		/* set new macaddr */
+ 		memcpy(data+7, temp, 6);
+ 		printf("Setting LAN Alert %d MAC Address to "
+@@ -1838,7 +1838,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "def", 3) == 0 ||
+ 		    strncasecmp(argv[1], "default", 7) == 0) {
+@@ -1864,7 +1864,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "on", 2) == 0 ||
+ 		    strncasecmp(argv[1], "yes", 3) == 0) {
+@@ -1889,7 +1889,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (strncasecmp(argv[1], "pet", 3) == 0) {
+ 			printf("Setting LAN Alert %d destination to PET Trap\n", alert);
+@@ -1917,7 +1917,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (str2uchar(argv[1], &data[2]) != 0) {
+ 			lprintf(LOG_ERR, "Invalid time: %s", argv[1]);
+@@ -1933,7 +1933,7 @@ ipmi_lan_alert_set(struct ipmi_intf * intf, uint8_t chan, uint8_t alert,
+ 		if (p == NULL) {
+ 			return (-1);
+ 		}
+-		memcpy(data, p->data, p->data_len);
++		memcpy(data, p->data, __min(p->data_len, sizeof(data)));
+ 
+ 		if (str2uchar(argv[1], &data[3]) != 0) {
+ 			lprintf(LOG_ERR, "Invalid retry: %s", argv[1]);
+-- 
+2.20.1
+
diff --git a/package/ipmitool/0013-fru-sdr-Fix-id_string-buffer-overflows.patch b/package/ipmitool/0013-fru-sdr-Fix-id_string-buffer-overflows.patch
new file mode 100644
index 0000000000..2a519f3c72
--- /dev/null
+++ b/package/ipmitool/0013-fru-sdr-Fix-id_string-buffer-overflows.patch
@@ -0,0 +1,141 @@
+From bf3ded3a474d85da99eb717acdcd8ff4f89f9879 Mon Sep 17 00:00:00 2001
+From: Chrostoper Ertl <chertl@microsoft.com>
+Date: Thu, 28 Nov 2019 17:13:45 +0000
+Subject: [PATCH] fru, sdr: Fix id_string buffer overflows
+
+Final part of the fixes for CVE-2020-5208, see
+https://github.com/ipmitool/ipmitool/security/advisories/GHSA-g659-9qxw-p7cp
+
+9 variants of stack buffer overflow when parsing `id_string` field of
+SDR records returned from `CMD_GET_SDR` command.
+
+SDR record structs have an `id_code` field, and an `id_string` `char`
+array.
+
+The length of `id_string` is calculated as `(id_code & 0x1f) + 1`,
+which can be larger than expected 16 characters (if `id_code = 0xff`,
+then length will be `(0xff & 0x1f) + 1 = 32`).
+
+In numerous places, this can cause stack buffer overflow when copying
+into fixed buffer of size `17` bytes from this calculated length.
+
+[Retrieve from:
+https://github.com/ipmitool/ipmitool/commit/7ccea283dd62a05a320c1921e3d8d71a87772637]
+Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
+---
+ lib/ipmi_fru.c |  2 +-
+ lib/ipmi_sdr.c | 40 ++++++++++++++++++++++++----------------
+ 2 files changed, 25 insertions(+), 17 deletions(-)
+
+diff --git a/lib/ipmi_fru.c b/lib/ipmi_fru.c
+index af99aa9..98bc984 100644
+--- a/lib/ipmi_fru.c
++++ b/lib/ipmi_fru.c
+@@ -3062,7 +3062,7 @@ ipmi_fru_print(struct ipmi_intf * intf, struct sdr_record_fru_locator * fru)
+ 		return 0;
+ 
+ 	memset(desc, 0, sizeof(desc));
+-	memcpy(desc, fru->id_string, fru->id_code & 0x01f);
++	memcpy(desc, fru->id_string, __min(fru->id_code & 0x01f, sizeof(desc)));
+ 	desc[fru->id_code & 0x01f] = 0;
+ 	printf("FRU Device Description : %s (ID %d)\n", desc, fru->device_id);
+ 
+diff --git a/lib/ipmi_sdr.c b/lib/ipmi_sdr.c
+index 2a9cbe3..62aac08 100644
+--- a/lib/ipmi_sdr.c
++++ b/lib/ipmi_sdr.c
+@@ -2084,7 +2084,7 @@ ipmi_sdr_print_sensor_eventonly(struct ipmi_intf *intf,
+ 		return -1;
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (sensor->id_code & 0x1f) + 1, "%s", sensor->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (sensor->id_code & 0x1f) + 1, sensor->id_string);
+ 
+ 	if (verbose) {
+ 		printf("Sensor ID              : %s (0x%x)\n",
+@@ -2135,7 +2135,7 @@ ipmi_sdr_print_sensor_mc_locator(struct ipmi_intf *intf,
+ 		return -1;
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (mc->id_code & 0x1f) + 1, "%s", mc->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (mc->id_code & 0x1f) + 1, mc->id_string);
+ 
+ 	if (verbose == 0) {
+ 		if (csv_output)
+@@ -2228,7 +2228,7 @@ ipmi_sdr_print_sensor_generic_locator(struct ipmi_intf *intf,
+ 	char desc[17];
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (dev->id_code & 0x1f) + 1, "%s", dev->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (dev->id_code & 0x1f) + 1, dev->id_string);
+ 
+ 	if (!verbose) {
+ 		if (csv_output)
+@@ -2285,7 +2285,7 @@ ipmi_sdr_print_sensor_fru_locator(struct ipmi_intf *intf,
+ 	char desc[17];
+ 
+ 	memset(desc, 0, sizeof (desc));
+-	snprintf(desc, (fru->id_code & 0x1f) + 1, "%s", fru->id_string);
++	snprintf(desc, sizeof(desc), "%.*s", (fru->id_code & 0x1f) + 1, fru->id_string);
+ 
+ 	if (!verbose) {
+ 		if (csv_output)
+@@ -2489,35 +2489,43 @@ ipmi_sdr_print_name_from_rawentry(struct ipmi_intf *intf, uint16_t id,
+ 
+    int rc =0;
+    char desc[17];
++   const char *id_string;
++   uint8_t id_code;
+    memset(desc, ' ', sizeof (desc));
+ 
+    switch ( type) {
+       case SDR_RECORD_TYPE_FULL_SENSOR:
+       record.full = (struct sdr_record_full_sensor *) raw;
+-      snprintf(desc, (record.full->id_code & 0x1f) +1, "%s",
+-               (const char *)record.full->id_string);
++      id_code = record.full->id_code;
++      id_string = record.full->id_string;
+       break;
++
+       case SDR_RECORD_TYPE_COMPACT_SENSOR:
+       record.compact = (struct sdr_record_compact_sensor *) raw	;
+-      snprintf(desc, (record.compact->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.compact->id_string);
++      id_code = record.compact->id_code;
++      id_string = record.compact->id_string;
+       break;
++
+       case SDR_RECORD_TYPE_EVENTONLY_SENSOR:
+       record.eventonly  = (struct sdr_record_eventonly_sensor *) raw ;
+-      snprintf(desc, (record.eventonly->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.eventonly->id_string);
+-      break;            
++      id_code = record.eventonly->id_code;
++      id_string = record.eventonly->id_string;
++      break;
++
+       case SDR_RECORD_TYPE_MC_DEVICE_LOCATOR:
+       record.mcloc  = (struct sdr_record_mc_locator *) raw ;
+-      snprintf(desc, (record.mcloc->id_code & 0x1f)  +1, "%s",
+-               (const char *)record.mcloc->id_string);		
++      id_code = record.mcloc->id_code;
++      id_string = record.mcloc->id_string;
+       break;
++
+       default:
+       rc = -1;
+-      break;
+-   }   
++   }
++   if (!rc) {
++       snprintf(desc, sizeof(desc), "%.*s", (id_code & 0x1f) + 1, id_string);
++   }
+ 
+-      lprintf(LOG_INFO, "ID: 0x%04x , NAME: %-16s", id, desc);
++   lprintf(LOG_INFO, "ID: 0x%04x , NAME: %-16s", id, desc);
+    return rc;
+ }
+ 
+-- 
+2.20.1
+
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index 5254668877..123dd274f4 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -10,6 +10,14 @@ IPMITOOL_SITE = http://downloads.sourceforge.net/project/ipmitool/ipmitool/$(IPM
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
 
+# 0008-fru-Fix-buffer-overflow-vulnerabilities.patch
+# 0009-fru-Fix-buffer-overflow-in-ipmi_spd_print_fru.patch
+# 0010-session-Fix-buffer-overflow-in-ipmi_get_session_info.patch
+# 0011-channel-Fix-buffer-overflow.patch
+# 0012-lanp-Fix-buffer-overflows-in-get_lan_param_select.patch
+# 0013-fru-sdr-Fix-id_string-buffer-overflows.patch
+IPMITOOL_IGNORE_CVES += CVE-2020-5208
+
 ifeq ($(BR2_PACKAGE_IPMITOOL_LANPLUS),y)
 IPMITOOL_DEPENDENCIES += openssl
 IPMITOOL_CONF_OPTS += --enable-intf-lanplus
