From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed, 19 May 2021 23:22:38 +0300
Subject: [Buildroot] [PATCH 1/1] package/hostapd: fix build with
 CVE-2021-30004 changes
Message-ID: <20210519202238.307416-1-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit d65586f45a22 ("package/hostapd: add upstream patch to fix
CVE-2021-30004") added security patch from hostapd upstream
without required ASN.1 helpers. Add missing headers and helpers.

Fixes:
http://autobuild.buildroot.net/results/8f56cf556efbf447633ce873a21635f5adbc3cd2/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...03-include-stdbool-to-allow-c99-bool.patch | 23 +++++++++++++++++++
 package/hostapd/0004-add-asn1-helper.patch    | 21 +++++++++++++++++
 2 files changed, 44 insertions(+)
 create mode 100644 package/hostapd/0003-include-stdbool-to-allow-c99-bool.patch
 create mode 100644 package/hostapd/0004-add-asn1-helper.patch

diff --git a/package/hostapd/0003-include-stdbool-to-allow-c99-bool.patch b/package/hostapd/0003-include-stdbool-to-allow-c99-bool.patch
new file mode 100644
index 0000000000..618fa8f64c
--- /dev/null
+++ b/package/hostapd/0003-include-stdbool-to-allow-c99-bool.patch
@@ -0,0 +1,23 @@
+commit 99cf89555313056d3a8fa54b21d02dc880b363e1
+Author: Jouni Malinen <jouni@codeaurora.org>
+Date:   Mon Apr 20 20:29:31 2020 +0300
+
+Include stdbool.h to allow C99 bool to be used
+
+We have practically started requiring some C99 features, so might as
+well finally go ahead and bring in the C99 bool as well.
+
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
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
diff --git a/package/hostapd/0004-add-asn1-helper.patch b/package/hostapd/0004-add-asn1-helper.patch
new file mode 100644
index 0000000000..b97a55afef
--- /dev/null
+++ b/package/hostapd/0004-add-asn1-helper.patch
@@ -0,0 +1,21 @@
+Fix hostapd build with backported security patches.
+
+Add required ASN.1 helper asn1_is_null.
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
-- 
2.31.1
