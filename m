From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 21:34:16 +0100
Subject: [Buildroot] [PATCH 2/2] package/pure-ftpd: fix CVE-2020-9365
In-Reply-To: <20200229203416.3462566-1-fontaine.fabrice@gmail.com>
References: <20200229203416.3462566-1-fontaine.fabrice@gmail.com>
Message-ID: <20200229203416.3462566-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An issue was discovered in Pure-FTPd 1.0.49. An out-of-bounds (OOB) read
has been detected in the pure_strcmp function in utils.c.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...002-pure_strcmp-len-s2-can-be-len-s1.patch | 30 +++++++++++++++++++
 package/pure-ftpd/pure-ftpd.mk                |  3 ++
 2 files changed, 33 insertions(+)
 create mode 100644 package/pure-ftpd/0002-pure_strcmp-len-s2-can-be-len-s1.patch

diff --git a/package/pure-ftpd/0002-pure_strcmp-len-s2-can-be-len-s1.patch b/package/pure-ftpd/0002-pure_strcmp-len-s2-can-be-len-s1.patch
new file mode 100644
index 0000000000..3de3cbd2c8
--- /dev/null
+++ b/package/pure-ftpd/0002-pure_strcmp-len-s2-can-be-len-s1.patch
@@ -0,0 +1,30 @@
+From 36c6d268cb190282a2c17106acfd31863121b58e Mon Sep 17 00:00:00 2001
+From: Frank Denis <github@pureftpd.org>
+Date: Mon, 24 Feb 2020 15:19:43 +0100
+Subject: [PATCH] pure_strcmp(): len(s2) can be > len(s1)
+
+Reported by Antonio Morales from GitHub Security Labs, thanks!
+[Retrieved from:
+https://github.com/jedisct1/pure-ftpd/commit/36c6d268cb190282a2c17106acfd31863121b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/utils.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/utils.c b/src/utils.c
+index f41492d..a7f0381 100644
+--- a/src/utils.c
++++ b/src/utils.c
+@@ -45,5 +45,11 @@ int pure_memcmp(const void * const b1_, const void * const b2_, size_t len)
+ 
+ int pure_strcmp(const char * const s1, const char * const s2)
+ {
+-    return pure_memcmp(s1, s2, strlen(s1) + 1U);
++    const size_t s1_len = strlen(s1);
++    const size_t s2_len = strlen(s2);
++
++    if (s1_len != s2_len) {
++        return -1;
++    }
++    return pure_memcmp(s1, s2, s1_len);
+ }
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 3af66a066c..0ef9a35250 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -14,6 +14,9 @@ PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 # 0001-listdir-reuse-a-single-buffer-to-store-every-file-name-to-display.patch
 PURE_FTPD_IGNORE_CVES += CVE-2019-20176
 
+# 0002-pure_strcmp-len-s2-can-be-len-s1.patch
+PURE_FTPD_IGNORE_CVES += CVE-2020-9365
+
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
 	--with-puredb
-- 
2.25.0
