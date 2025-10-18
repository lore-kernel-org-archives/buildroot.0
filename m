Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5B7CCD193
	for <buildroot@archiver.kernel.org>; Sat, 18 Oct 2025 18:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12DA8281A;
	Sat, 18 Oct 2025 18:30:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FoXVl7A_e9V2; Sat, 18 Oct 2025 18:30:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2B4582871
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2B4582871;
	Sat, 18 Oct 2025 18:30:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BE4043F
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F209640EFF
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHW8Yyz9oVPt for <buildroot@buildroot.org>;
 Sat, 18 Oct 2025 18:30:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2342E40EFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2342E40EFE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2342E40EFE
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 18:30:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3D117A4C2BD7
 for <buildroot@buildroot.org>; Sat, 18 Oct 2025 20:30:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42416)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vABgu-000000002IH-1Buf
 for buildroot@buildroot.org; Sat, 18 Oct 2025 18:30:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 18 Oct 2025 20:30:07 +0200
Message-ID: <20251018183007.2075689-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760812208;
 bh=//enw6NNZIYouf77rRBh0ZfBjPayrkJWroisl5Qf03M=;
 h=From:To:Subject:Date:From;
 b=0DLWtjBWLx51tSXF55ZkV+3ppvDNaGHWpkGbEApB5FDGaVYv4cCLLVpFKWEAq0IUS
 cEBW9U9I3wIpgFCKHi+3RTbqEe91zO1TMd/Lklfyo9vJSTHCBhoLvvQD7iopvbV32F
 0A50RpQnu/g1UX4E/uXTndCKiu+Cms1laiqfS87WRN5fSBScQPL00ABtFWcF7I55xA
 eYihfpscMMIklFOphvr1MtQsgQO1xLHlkIqRIawIRyZ/SxHLWjX8jQiHLigzXH+ROK
 E1k6gWA7RtBwxdxZVJj8aKOihgkNrau6d7b3xJ4bX6wldb/jhu1YrTlDcRFcMtn/Av
 XBUoytjr1uGFg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=0DLWtjBW
Subject: [Buildroot] [PATCH 1/1] package/libopenssl: fix build on x86
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/214/214b918f6b56e005b180145d245491971f3e3476/

/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/i686-buildroot-linux-gnu/14.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: ./libcrypto.so: undefined reference to `ossl_aes_cfb128_vaes_dec'
/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/i686-buildroot-linux-gnu/14.3.0/../../../../i686-buildroot-linux-gnu/bin/ld: ./libcrypto.so: undefined reference to `ossl_aes_cfb128_vaes_enc'

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...es_cfb128_vaes_encdec_wrapper-to-x64.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch

diff --git a/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch b/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch
new file mode 100644
index 0000000000..ab4cf88a40
--- /dev/null
+++ b/package/libopenssl/0004-Scope-aes_cfb128_vaes_encdec_wrapper-to-x64.patch
@@ -0,0 +1,36 @@
+From a37d316e643a4c2be4708d504cc3ecbf37ec1773 Mon Sep 17 00:00:00 2001
+From: Kai Pastor <dg0yt@darc.de>
+Date: Wed, 8 Oct 2025 18:50:33 +0200
+Subject: [PATCH] Scope aes_cfb128_vaes_encdec_wrapper to x64
+
+This function is only used on x64 and relies on other functions which
+are only implemented for x64.
+Fixes #28745.
+
+Upstream: https://github.com/openssl/openssl/pull/28792
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc b/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
+index d5577d00f132e..eb8e0164ac9ed 100644
+--- a/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
++++ b/providers/implementations/ciphers/cipher_aes_cfb_hw_aesni.inc
+@@ -30,6 +30,7 @@
+ static int ossl_aes_cfb8_vaes_eligible(void) { return 0; }
+ static int ossl_aes_cfb1_vaes_eligible(void) { return 0; }
+ 
++#if (defined(__x86_64) || defined(__x86_64__) || defined(_M_AMD64) || defined(_M_X64))
+ /* active in 64-bit builds when AES-NI, AVX512F, and VAES are detected */
+ static int aes_cfb128_vaes_encdec_wrapper(
+     PROV_CIPHER_CTX* dat,
+@@ -56,6 +57,7 @@ static int aes_cfb128_vaes_encdec_wrapper(
+ 
+     return 1;
+ }
++#endif
+  
+ /* generates AES round keys for AES-NI and VAES implementations */
+ static int cipher_hw_aesni_initkey(PROV_CIPHER_CTX *dat,
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
