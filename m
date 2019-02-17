From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Feb 2019 12:35:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/libssh: fix build with gcc 4.8
Message-ID: <20190217113558.27053-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/a56c515746874549714270c9a635f8a2ef303e67

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...pt-fix-strict-overflow-error-with-gcc-4.8.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libssh/0005-pki_gcrypt-fix-strict-overflow-error-with-gcc-4.8.patch

diff --git a/package/libssh/0005-pki_gcrypt-fix-strict-overflow-error-with-gcc-4.8.patch b/package/libssh/0005-pki_gcrypt-fix-strict-overflow-error-with-gcc-4.8.patch
new file mode 100644
index 0000000000..9187a612e7
--- /dev/null
+++ b/package/libssh/0005-pki_gcrypt-fix-strict-overflow-error-with-gcc-4.8.patch
@@ -0,0 +1,34 @@
+From aaebb96688cfcb9dc32fcfbb80a499cf2de25536 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 17 Feb 2019 12:20:45 +0100
+Subject: [PATCH] pki_gcrypt: fix strict-overflow error with gcc 4.8
+
+/home/buildroot/autobuild/instance-1/output/build/libssh-0.8.6/src/pki_gcrypt.c: In function 'privatekey_string_to_buffer':
+/home/buildroot/autobuild/instance-1/output/build/libssh-0.8.6/src/pki_gcrypt.c:485:10: error: assuming signed overflow does not occur when simplifying conditional to constant [-Werror=strict-overflow]
+     while(len > 0 && strncmp(p, header_end, header_end_size) != 0) {
+          ^
+Fixes:
+ - http://autobuild.buildroot.org/results/a56c515746874549714270c9a635f8a2ef303e67
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.libssh.org/T132]
+---
+ src/pki_gcrypt.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/pki_gcrypt.c b/src/pki_gcrypt.c
+index c0cf5926..e7b26fe6 100644
+--- a/src/pki_gcrypt.c
++++ b/src/pki_gcrypt.c
+@@ -409,7 +409,7 @@ static ssh_buffer privatekey_string_to_buffer(const char *pkey, int type,
+     unsigned int iv_len = 0;
+     int algo = 0;
+     int mode = 0;
+-    int len;
++    size_t len;
+ 
+     buffer = ssh_buffer_new();
+     if (buffer == NULL) {
+-- 
+2.14.1
+
-- 
2.14.1
