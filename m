Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D500EC27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E15C4042F;
	Thu,  6 Jun 2024 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ID_62eqPfyhf; Thu,  6 Jun 2024 19:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C53D44177D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C53D44177D;
	Thu,  6 Jun 2024 19:30:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C1ED1BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 683AB4177D
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VH0_mZ4wVSdy for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:30:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A5EB4042F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A5EB4042F
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:30:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 163FA87BCA; Thu,  6 Jun 2024 19:30:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 21:29:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 311bb82c9e3a27f36639a1c93d8d5bc8e7eb034f
X-Git-Newrev: e6b30e239289ed9d31fd8805551f72c9897affa2
X-Patchwork-Hint: ignore
Message-Id: <20240606193048.163FA87BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/p11-kit: fix build with gcc 14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8381408140141494253=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8381408140141494253==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=e6b30e239289ed9d31fd8805551f72c9897affa2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 14:

p11-kit/import-object.c: In function 'add_attrs_pubkey_rsa':
p11-kit/import-object.c:223:62: error: passing argument 3 of 'p11_asn1_read' from incompatible pointer type [-Wincompatible-pointer-types]
  223 |         attr_modulus.pValue = p11_asn1_read (asn, "modulus", &attr_modulus.ulValueLen);
      |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~
      |                                                              |
      |                                                              long unsigned int *

Fixes:
 - http://autobuild.buildroot.org/results/41508a057568ad715e9e00a67adfc3867445d6c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...id-integer-truncation-on-32-bit-platforms.patch | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/package/p11-kit/0001-import-object-Avoid-integer-truncation-on-32-bit-platforms.patch b/package/p11-kit/0001-import-object-Avoid-integer-truncation-on-32-bit-platforms.patch
new file mode 100644
index 0000000000..03f54b4408
--- /dev/null
+++ b/package/p11-kit/0001-import-object-Avoid-integer-truncation-on-32-bit-platforms.patch
@@ -0,0 +1,109 @@
+From d49c92c8420db6ee4c88515bdb014f68f4d471d9 Mon Sep 17 00:00:00 2001
+From: Daiki Ueno <ueno@gnu.org>
+Date: Sat, 2 Dec 2023 09:24:01 +0900
+Subject: [PATCH] import-object: Avoid integer truncation on 32-bit platforms
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The build fails when compiling for 32-bit platforms with
+-Werror=incompatible-pointer-types:
+
+  CFLAGS="-m32 -march=i686 -Werror=incompatible-pointer-types -Werror=implicit -Werror=int-conversion" setarch i686 -- meson setup _build
+  setarch i686 -- meson compile -C _build -v
+  ...
+
+  ../p11-kit/import-object.c: In function ‘add_attrs_pubkey_rsa’:
+  ../p11-kit/import-object.c:223:62: error: passing argument 3 of ‘p11_asn1_read’ from incompatible pointer type [-Werror=incompatible-pointer-types]
+    223 |         attr_modulus.pValue = p11_asn1_read (asn, "modulus", &attr_modulus.ulValueLen);
+        |                                                              ^~~~~~~~~~~~~~~~~~~~~~~~
+        |                                                              |
+        |                                                              long unsigned int *
+
+Reported by Sam James in:
+https://github.com/p11-glue/p11-kit/issues/608
+
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+Upstream: https://github.com/p11-glue/p11-kit/commit/d49c92c8420db6ee4c88515bdb014f68f4d471d9
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ p11-kit/import-object.c | 30 +++++++++++++++++++++++++++---
+ 1 file changed, 27 insertions(+), 3 deletions(-)
+
+diff --git a/p11-kit/import-object.c b/p11-kit/import-object.c
+index feee0765..fb47b964 100644
+--- a/p11-kit/import-object.c
++++ b/p11-kit/import-object.c
+@@ -55,6 +55,7 @@
+ #endif
+ 
+ #include <assert.h>
++#include <limits.h>
+ #include <stdbool.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -201,6 +202,7 @@ add_attrs_pubkey_rsa (CK_ATTRIBUTE *attrs,
+ 	CK_ATTRIBUTE attr_encrypt = { CKA_ENCRYPT, &tval, sizeof (tval) };
+ 	CK_ATTRIBUTE attr_modulus = { CKA_MODULUS, };
+ 	CK_ATTRIBUTE attr_exponent = { CKA_PUBLIC_EXPONENT, };
++	size_t len = 0;
+ 
+ 	pubkey = p11_asn1_read (info, "subjectPublicKey", &pubkey_len);
+ 	if (pubkey == NULL) {
+@@ -220,17 +222,31 @@ add_attrs_pubkey_rsa (CK_ATTRIBUTE *attrs,
+ 		goto cleanup;
+ 	}
+ 
+-	attr_modulus.pValue = p11_asn1_read (asn, "modulus", &attr_modulus.ulValueLen);
++	attr_modulus.pValue = p11_asn1_read (asn, "modulus", &len);
+ 	if (attr_modulus.pValue == NULL) {
+ 		p11_message (_("failed to obtain modulus"));
+ 		goto cleanup;
+ 	}
++#if ULONG_MAX < SIZE_MAX
++	if (len > ULONG_MAX) {
++		p11_message (_("failed to obtain modulus"));
++		goto cleanup;
++	}
++#endif
++	attr_modulus.ulValueLen = len;
+ 
+-	attr_exponent.pValue = p11_asn1_read (asn, "publicExponent", &attr_exponent.ulValueLen);
++	attr_exponent.pValue = p11_asn1_read (asn, "publicExponent", &len);
+ 	if (attr_exponent.pValue == NULL) {
+ 		p11_message (_("failed to obtain exponent"));
+ 		goto cleanup;
+ 	}
++#if ULONG_MAX < SIZE_MAX
++	if (len > ULONG_MAX) {
++		p11_message (_("failed to obtain exponent"));
++		goto cleanup;
++	}
++#endif
++	attr_exponent.ulValueLen = len;
+ 
+ 	result = p11_attrs_build (attrs, &attr_key_type, &attr_encrypt, &attr_modulus, &attr_exponent, NULL);
+ 	if (result == NULL) {
+@@ -260,12 +276,20 @@ add_attrs_pubkey_ec (CK_ATTRIBUTE *attrs,
+ 	CK_ATTRIBUTE attr_key_type = { CKA_KEY_TYPE, &key_type, sizeof (key_type) };
+ 	CK_ATTRIBUTE attr_ec_params = { CKA_EC_PARAMS, };
+ 	CK_ATTRIBUTE attr_ec_point = { CKA_EC_POINT, };
++	size_t len = 0;
+ 
+-	attr_ec_params.pValue = p11_asn1_read (info, "algorithm.parameters", &attr_ec_params.ulValueLen);
++	attr_ec_params.pValue = p11_asn1_read (info, "algorithm.parameters", &len);
+ 	if (attr_ec_params.pValue == NULL) {
+ 		p11_message (_("failed to obtain EC parameters"));
+ 		goto cleanup;
+ 	}
++#if ULONG_MAX < SIZE_MAX
++	if (len > ULONG_MAX) {
++		p11_message (_("failed to obtain EC parameters"));
++		goto cleanup;
++	}
++#endif
++	attr_ec_params.ulValueLen = len;
+ 
+ 	/* subjectPublicKey is read as BIT STRING value which contains
+ 	 * EC point data. We need to DER encode this data as OCTET STRING.

--===============8381408140141494253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8381408140141494253==--
