From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:37:26 +1300
Subject: [Buildroot] [git commit] package/cbootimage: add patch to fix
	bct_dump crash
Message-ID: <20170125033801.41D9A81EE5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=24a4f8a5cd2a9ab348b21ac08c339545fa3608ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch from upstream until version 1.8 release.

Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...on-t-crash-on-devices-without-RSA-support.patch | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/package/cbootimage/0001-bct_dump-don-t-crash-on-devices-without-RSA-support.patch b/package/cbootimage/0001-bct_dump-don-t-crash-on-devices-without-RSA-support.patch
new file mode 100644
index 0000000..587d67f
--- /dev/null
+++ b/package/cbootimage/0001-bct_dump-don-t-crash-on-devices-without-RSA-support.patch
@@ -0,0 +1,43 @@
+From 64045f993c2cd8989838aeaad3d22107d96d5596 Mon Sep 17 00:00:00 2001
+From: Stephen Warren <swarren@nvidia.com>
+Date: Thu, 28 Jul 2016 11:37:45 -0600
+Subject: [PATCH] bct_dump: don't crash on devices without RSA support
+
+format_rsa_param() currently crashes on chips that don't implement
+soc_config->get_value_size(); that is, on all chips before T124. Fix the
+function not to crash. Better might be to avoid even dumping RSA
+parameters on chips which don't support RSA, but that's a larger change
+that needs much more work.
+
+Fixes: 3c3b992a6814 ("Add support to dump rsa related fields for t210")
+Cc: Jimmy Zhang <jimmzhang@nvidia.com>
+Signed-off-by: Stephen Warren <swarren@nvidia.com>
+Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
+---
+ src/bct_dump.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/src/bct_dump.c b/src/bct_dump.c
+index 4f50fa2..b4ca9fc 100644
+--- a/src/bct_dump.c
++++ b/src/bct_dump.c
+@@ -133,10 +133,14 @@ static void format_rsa_param(parse_token id, char const * message, void * data)
+ {
+ #define MAX_BYTE_NUMBER_PER_LINE	16
+ 	u_int8_t *rsa = (u_int8_t *)data;
+-	int size = g_soc_config->get_value_size(id);
+-	int byte_index;
++	int size, byte_index;
+ 
+ 	printf("%s", message);
++
++	if (!g_soc_config->get_value_size)
++		return;
++
++	size = g_soc_config->get_value_size(id);
+ 	for (byte_index = 0; byte_index < size; ++byte_index) {
+ 		printf(" %02x", *rsa++);
+ 
+-- 
+2.1.4
+
