Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1A8C64EC4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40C294107F;
	Wed, 22 Feb 2023 14:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40C294107F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fqPWvIV2ZuIA; Wed, 22 Feb 2023 14:51:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8324640399;
	Wed, 22 Feb 2023 14:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8324640399
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A46C21BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7E19682091
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:51:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E19682091
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DgbleJYdVKD3 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:51:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76E388208D
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76E388208D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65618866DE; Wed, 22 Feb 2023 14:51:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 15:51:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a39e328bb2835cd157ee1622d5117ba252d44733
X-Git-Newrev: d0af2840b1b16dd95b9a468e46b6e275186e5447
X-Patchwork-Hint: ignore
Message-Id: <20230222145144.65618866DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: fix libressl build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d0af2840b1b16dd95b9a468e46b6e275186e5447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with libressl raised since bump to
version 2.10.0 in commit 03bab7117d232c9dcd784a74eefc0e48ea51ee53:

/home/thomas/autobuild/instance-3/output-1/build/freerdp-2.10.0/libfreerdp/crypto/crypto.c: In function 'crypto_cert_get_signature_alg':
/home/thomas/autobuild/instance-3/output-1/build/freerdp-2.10.0/libfreerdp/crypto/crypto.c:980:8: error: 'NID_sha3_224' undeclared (first use in this function)
   case NID_sha3_224:
        ^~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e96848576ac292799636abe7485c37aa54196a2c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...isable-sha3-and-shake-hashes-for-libressl.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch b/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
new file mode 100644
index 0000000000..14f615e2e7
--- /dev/null
+++ b/package/freerdp/0004-Fix-8702-Disable-sha3-and-shake-hashes-for-libressl.patch
@@ -0,0 +1,38 @@
+From bd093454fe126163634c00b7484ab7fee6ffe670 Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Mon, 20 Feb 2023 16:23:39 +0100
+Subject: [PATCH] Fix #8702: Disable sha3 and shake hashes for libressl
+
+[Retrieved (and backported) from:
+https://github.com/FreeRDP/FreeRDP/pull/8708/commits/bd093454fe126163634c00b7484ab7fee6ffe670]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libfreerdp/crypto/x509_utils.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libfreerdp/crypto/crypto.c b/libfreerdp/crypto/crypto.c
+index 6e87a88b8d8..62cf2939be7 100644
+--- a/libfreerdp/crypto/crypto.c
++++ b/libfreerdp/crypto/crypto.c
+@@ -748,7 +748,7 @@ WINPR_MD_TYPE x509_utils_get_signature_alg(const X509* xcert)
+ 			return WINPR_MD_SHA512;
+ 		case NID_ripemd160:
+ 			return WINPR_MD_RIPEMD160;
+-#if (OPENSSL_VERSION_NUMBER >= 0x1010101fL) || defined(LIBRESSL_VERSION_NUMBER)
++#if (OPENSSL_VERSION_NUMBER >= 0x1010101fL) && !defined(LIBRESSL_VERSION_NUMBER)
+ 		case NID_sha3_224:
+ 			return WINPR_MD_SHA3_224;
+ 		case NID_sha3_256:
+@@ -757,11 +757,11 @@ WINPR_MD_TYPE x509_utils_get_signature_alg(const X509* xcert)
+ 			return WINPR_MD_SHA3_384;
+ 		case NID_sha3_512:
+ 			return WINPR_MD_SHA3_512;
+-#endif
+ 		case NID_shake128:
+ 			return WINPR_MD_SHAKE128;
+ 		case NID_shake256:
+ 			return WINPR_MD_SHAKE256;
++#endif
+ 		case NID_undef:
+ 		default:
+ 			return WINPR_MD_NONE;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
