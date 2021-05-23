From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 20:35:45 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/wpa_supplicant:
 fix build with CVE-2021-30004 changes
Message-ID: <20210523180931.38A008A275@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cce9a17ddbc099d27ec8398196ae9e6594fa161
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit a8fbe67b9b16 ("package/wpa_supplicant: add upstream patch to fix
CVE-2021-30004") added security patch from hostapd upstream without
required ASN.1 helpers. Backport and adapt two commits from the
hostapd upstream to add missing headers and helpers.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 0c65499c3f11e89c6c383629a99f192d14815dd9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...de-stdbool.h-to-allow-C99-bool-to-be-used.patch | 32 +++++++++++++++++++
 ...elper-functions-for-recognizing-tag-value.patch | 37 ++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch b/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
new file mode 100644
index 0000000000..e52dbdb694
--- /dev/null
+++ b/package/wpa_supplicant/0003-Include-stdbool.h-to-allow-C99-bool-to-be-used.patch
@@ -0,0 +1,32 @@
+From 99cf89555313056d3a8fa54b21d02dc880b363e1 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <jouni@codeaurora.org>
+Date: Mon, 20 Apr 2020 20:29:31 +0300
+Subject: [PATCH] Include stdbool.h to allow C99 bool to be used
+
+We have practically started requiring some C99 features, so might as
+well finally go ahead and bring in the C99 bool as well.
+
+Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
+[geomatsi at gmail.com: backport from upstream]
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+[yann.morin.1998 at free.fr: keep upstream sha1 in header, drop numbering]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
+2.25.1
+
diff --git a/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch b/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
new file mode 100644
index 0000000000..a5415e7daf
--- /dev/null
+++ b/package/wpa_supplicant/0004-ASN.1-Add-helper-functions-for-recognizing-tag-value.patch
@@ -0,0 +1,37 @@
+From 9a990e8c4eb92dd64e0ec483599820e45c35ac23 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 13 Mar 2021 23:14:23 +0200
+Subject: [PATCH] ASN.1: Add helper functions for recognizing tag values
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+[geomatsi at gmail.com: backport asn1_is_null() from upstream 9a990e8c4eb9]
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+[yann.morin.1998 at free.fr: 
+  - reformat, keep the upstream sha1 and title,
+  - drop numbering
+]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ src/tls/asn1.h | 102 +++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 102 insertions(+)
+
+diff --git a/src/tls/asn1.h b/src/tls/asn1.h
+index de3430adb..a4d1be473 100644
+--- a/src/tls/asn1.h
++++ b/src/tls/asn1.h
+@@ -66,6 +66,12 @@ struct wpabuf * asn1_build_alg_id(const struct asn1_oid *oid,
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
+2.25.1
+
