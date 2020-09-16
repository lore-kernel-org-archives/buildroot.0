From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 16 Sep 2020 19:44:51 +0200
Subject: [Buildroot] [PATCH] package/ipmitool: fix patch
Message-ID: <20200916174452.5730-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous commit to this package
(37c5e903a7e18f5b3847c11a40af5f74984d6c77) introduced a bunch of patches
to fix a CVE. Unfortunatly only applying of the patches was tested but
not building the package.

This commit replaces a define that was introduced in a previous patch
upstream and caused the build failure.

Tested:

                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

Fixes:
 - http://autobuild.buildroot.net/results/3f7fe8ad181318153c459ba5e1afbbc8b49d541c/
 - and more

Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/ipmitool/0011-channel-Fix-buffer-overflow.patch | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/ipmitool/0011-channel-Fix-buffer-overflow.patch b/package/ipmitool/0011-channel-Fix-buffer-overflow.patch
index 8d7ecb9550..62e04c3e27 100644
--- a/package/ipmitool/0011-channel-Fix-buffer-overflow.patch
+++ b/package/ipmitool/0011-channel-Fix-buffer-overflow.patch
@@ -14,7 +14,12 @@ the final response?s `data_len`, which can lead to stack buffer overflow
 on the final copy.
 
 [Retrieve from:
-https://github.com/ipmitool/ipmitool/commit/9452be87181a6e83cfcc768b3ed8321763db50e4]
+https://github.com/ipmitool/ipmitool/commit/9452be87181a6e83cfcc768b3ed8321763db50e4
+
+The patch is slightly modified manually. The define
+(MAX_CIPHER_SUITE_DATA_LEN) was introduced upstream in another patch.
+Replace the define by the value 0x10.]
+
 Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
 ---
  lib/ipmi_channel.c | 5 ++++-
@@ -31,7 +36,7 @@ index fab2e54..59ac227 100644
 -		if (rsp->ccode > 0) {
 +		if (rsp->ccode
 +		    || rsp->data_len < 1
-+		    || rsp->data_len > sizeof(uint8_t) + MAX_CIPHER_SUITE_DATA_LEN)
++		    || rsp->data_len > sizeof(uint8_t) + 0x10)
 +		{
  			lprintf(LOG_ERR, "Get Channel Cipher Suites failed: %s",
  					val2str(rsp->ccode, completion_code_vals));
-- 
2.20.1
