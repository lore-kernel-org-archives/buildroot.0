Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5371BC3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 09:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07A90435DE;
	Wed, 10 Jan 2024 09:51:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07A90435DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fdx4mOQjD8BZ; Wed, 10 Jan 2024 09:51:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B3F314361B;
	Wed, 10 Jan 2024 09:51:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3F314361B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45C441BF34C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4963341693
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 09:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4963341693
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7nU_zAjQjB9k for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B79D4168E
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B79D4168E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A15785089; Wed, 10 Jan 2024 09:49:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 10:40:50 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 8d9e6967247607e393d023d4fcef7a8787de8389
X-Git-Newrev: 5b35141a899dd3607859e0b0f0380ab0864a48ff
X-Patchwork-Hint: ignore
Message-Id: <20240110094924.7A15785089@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/opensc: fix
 libressl build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5b35141a899dd3607859e0b0f0380ab0864a48ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix the following build failure with libressl >= 3.8 raised since bump
of libressl to version 3.8.2 in commit
21eca49ed5110872407b76ab9337d2877c4cda24:

In file included from card-westcos.c:37:
/home/autobuild/autobuild/instance-11/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/openssl/evp.h:627:32: error: macro "EVP_sha3_224" passed 1 arguments, but takes just 0
  627 | const EVP_MD *EVP_sha3_224(void);
      |                                ^

Fixes:
 - http://autobuild.buildroot.org/results/cecee659371f370bf4bd2b27a4752bf20ceff326

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e8ca87083b9ff7d6d196520b85533cd927369ca9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...breSSL-does-provide-EVP_sha3_-after-3-7-3.patch | 32 ++++++++++++++++++++++
 ...006-fixed-detection-of-SHA3-compatibility.patch | 27 ++++++++++++++++++
 2 files changed, 59 insertions(+)

diff --git a/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch b/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
new file mode 100644
index 0000000000..80c19a3f5f
--- /dev/null
+++ b/package/opensc/0005-LibreSSL-does-provide-EVP_sha3_-after-3-7-3.patch
@@ -0,0 +1,32 @@
+From e015242590ad9131e124232cc5a2fd02d525ef2c Mon Sep 17 00:00:00 2001
+From: Klemens Nanni <kn@openbsd.org>
+Date: Thu, 29 Jun 2023 02:41:43 +0300
+Subject: [PATCH] LibreSSL does provide EVP_sha3_*() after 3.7.3
+
+Support was added in 16.04.2023.
+
+Compile- and run-tested on OpenBSD/amd64 7.3-current.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OpenSC/OpenSC/commit/e015242590ad9131e124232cc5a2fd02d525ef2c
+---
+ src/libopensc/sc-ossl-compat.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index df0cebbce2..8012cd4c0f 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -50,10 +50,12 @@ extern "C" {
+ #if LIBRESSL_VERSION_NUMBER < 0x30500000L
+ #define FIPS_mode()                             (0)
+ #endif
++#ifndef EVP_sha3_224
+ #define EVP_sha3_224()                          (NULL)
+ #define EVP_sha3_256()                          (NULL)
+ #define EVP_sha3_384()                          (NULL)
+ #define EVP_sha3_512()                          (NULL)
++#endif
+ #if LIBRESSL_VERSION_NUMBER < 0x3070000fL
+ #define EVP_PKEY_new_raw_public_key(t, e, p, l) (NULL)
+ #define EVP_PKEY_get_raw_public_key(p, pu, l)   (0)
diff --git a/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch b/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
new file mode 100644
index 0000000000..3d8aa7e4ef
--- /dev/null
+++ b/package/opensc/0006-fixed-detection-of-SHA3-compatibility.patch
@@ -0,0 +1,27 @@
+From 33351d91aa22fa8077847ba3f19abb5a00b04600 Mon Sep 17 00:00:00 2001
+From: Frank Morgner <frankmorgner@gmail.com>
+Date: Tue, 15 Aug 2023 17:58:21 +0200
+Subject: [PATCH] fixed detection of SHA3 compatibility
+
+fixes https://github.com/OpenSC/OpenSC/issues/2836
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/OpenSC/OpenSC/commit/33351d91aa22fa8077847ba3f19abb5a00b04600
+---
+ src/libopensc/sc-ossl-compat.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/libopensc/sc-ossl-compat.h b/src/libopensc/sc-ossl-compat.h
+index 8012cd4c0f..96ec4bd736 100644
+--- a/src/libopensc/sc-ossl-compat.h
++++ b/src/libopensc/sc-ossl-compat.h
+@@ -50,7 +50,8 @@ extern "C" {
+ #if LIBRESSL_VERSION_NUMBER < 0x30500000L
+ #define FIPS_mode()                             (0)
+ #endif
+-#ifndef EVP_sha3_224
++/* OpenSSL 1.1.1 has EVP_sha3_* */
++#if defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30800000L
+ #define EVP_sha3_224()                          (NULL)
+ #define EVP_sha3_256()                          (NULL)
+ #define EVP_sha3_384()                          (NULL)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
