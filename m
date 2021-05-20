From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Thu, 20 May 2021 08:48:53 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/hostapd: fix build with
 CVE-2021-30004 changes
Message-ID: <20210520054853.15608-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d65586f45a22 ("package/hostapd: add upstream patch to fix
CVE-2021-30004") added security patch from hostapd upstream without
required ASN.1 helpers. Backport and adapt two commits from the
hostapd upstream to add missing headers and helpers.

Fixes:
http://autobuild.buildroot.net/results/8f56cf556efbf447633ce873a21635f5adbc3cd2/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...dbool.h-to-allow-C99-bool-to-be-used.patch | 32 +++++++++++++++++
 .../0004-ASN.1-add-asn1_is_null-helper.patch  | 34 +++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 package/hostapd/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
 create mode 100644 package/hostapd/0004-ASN.1-add-asn1_is_null-helper.patch

diff --git a/package/hostapd/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch b/package/hostapd/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
new file mode 100644
index 0000000000..74bd85f2af
--- /dev/null
+++ b/package/hostapd/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
@@ -0,0 +1,32 @@
+From b2feaf8fc6f3b1bed6c17cb1871889c66a2877dc Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Mon, 20 Apr 2020 20:29:31 +0300
+Subject: [PATCH 3/4] Include stdbool.h to allow C99 bool to be used
+
+We have practically started requiring some C99 features, so might as
+well finally go ahead and bring in the C99 bool as well.
+
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+
+Backport of commit 99cf89555313 ("Include stdbool.h to allow C99 bool
+to be used") to hostapd v2.9.
+---
+ src/utils/includes.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/utils/includes.h b/src/utils/includes.h
+index 75513fc8c..741fc9c14 100644
+--- a/src/utils/includes.h
++++ b/src/utils/includes.h
+@@ -18,6 +18,7 @@
+ 
+ #include <stdlib.h>
+ #include <stddef.h>
++#include <stdbool.h>
+ #include <stdio.h>
+ #include <stdarg.h>
+ #include <string.h>
+-- 
+2.31.1
+
diff --git a/package/hostapd/0004-ASN.1-add-asn1_is_null-helper.patch b/package/hostapd/0004-ASN.1-add-asn1_is_null-helper.patch
new file mode 100644
index 0000000000..62e77e28ae
--- /dev/null
+++ b/package/hostapd/0004-ASN.1-add-asn1_is_null-helper.patch
@@ -0,0 +1,34 @@
+From 93179bfeed9282c5a17fc62f6cafaf9d95f91f3f Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Thu, 20 May 2021 08:29:55 +0300
+Subject: [PATCH 4/4] ASN.1: add asn1_is_null helper
+
+Partially backport commit 9a990e8c4eb9 ("ASN.1: Add helper functions for
+recognizing tag values") to hostapd v2.9: add ASN.1 helper required to
+backport CVE-2021-30004 fix.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ src/tls/asn1.h | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/tls/asn1.h b/src/tls/asn1.h
+index 6bd7df565..77b94ef34 100644
+--- a/src/tls/asn1.h
++++ b/src/tls/asn1.h
+@@ -66,6 +66,12 @@ void asn1_oid_to_str(const struct asn1_oid *oid, char *buf, size_t len);
+ unsigned long asn1_bit_string_to_long(const u8 *buf, size_t len);
+ int asn1_oid_equal(const struct asn1_oid *a, const struct asn1_oid *b);
+ 
++static inline bool asn1_is_null(const struct asn1_hdr *hdr)
++{
++	return hdr->class == ASN1_CLASS_UNIVERSAL &&
++		hdr->tag == ASN1_TAG_NULL;
++}
++
+ extern struct asn1_oid asn1_sha1_oid;
+ extern struct asn1_oid asn1_sha256_oid;
+ 
+-- 
+2.31.1
+
-- 
2.31.1
