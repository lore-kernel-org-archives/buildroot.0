Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7803EC44500
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 14:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A4054098E;
	Sat,  4 Jul 2026 14:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sa8A9YKuQ9pI; Sat,  4 Jul 2026 14:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2AFE4089B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783176149;
	bh=X44GGIitwGzNUqZBzqpk7TBfRFs72izWXRBK3qtxYSY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FNfI7eHRy7GQFPU+eOdRL8fPoUsUxx5Q52nF0hMRHNH2PIwoidaMv5/H7C2PerB2h
	 mcOSDV5Gwz0V04yC1Z/sogWDmsf2AOQZ5gIs71dK9J66RDSU3kaQ/3c7Wm+N98a48l
	 TQraj3oFS6OKEh6JKhGimT1trnec4+CCVn7jIYLcG8acLbwuxJDvlvoX3S41ERN+Z7
	 HxKPyqpd5cyMKHECztu9aG/6PYFqiLvFQSGWdsx07uGjBCmAvN1oPqh8nZnFyzSWrT
	 V/WAdbmyMGZZXm0nrhKtnFOwJ+A/Zu9Q4m1io44qYPQaOs3w6cHLNN+9ik1IsZulVg
	 2cxqcGHbf8sfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2AFE4089B;
	Sat,  4 Jul 2026 14:42:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C9EA363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A57680D15
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSYKy71UDefb for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 14:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F360480CC3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F360480CC3
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C761883EB; Sat,  4 Jul 2026 14:41:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 16:34:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d06661fc1bf0f88356981a44cb93b7b0c76a669
X-Git-Newrev: 275faf6d61d04f1e01df12ef4ce0b0f2710a194f
X-Patchwork-Hint: ignore
Message-Id: <20260704144157.0C761883EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: fix build w/ wolfssl
 5.9.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/275faf6d61d04f1e01df12ef4ce0b0f2710a194f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The 'mlkem.h' header is no longer present in wolfssl v5.9.2 [1] and the
content was merged in the 'wc_mlkem.h' header.

[1] https://github.com/wolfSSL/wolfssl/commit/7a2cf5b655541013ed8c93ecc9f598146abf2916

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...01-wolfssl-Adapt-to-removed-ML-KEM-header.patch | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch b/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
new file mode 100644
index 0000000000..a2eba92612
--- /dev/null
+++ b/package/strongswan/0001-wolfssl-Adapt-to-removed-ML-KEM-header.patch
@@ -0,0 +1,29 @@
+From 98b133c54c5e3f66f46a5bb11c9b09d06fdc8469 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Fri, 26 Jun 2026 08:10:16 +0200
+Subject: [PATCH] wolfssl: Adapt to removed ML-KEM header
+
+The mlkem.h header that mainly defined aliases for the old wc_Kyber* API
+has been removed and its contents moved to the wc_mlkem.h header.
+
+Upstream: https://github.com/strongswan/strongswan/commit/98b133c54c5e3f66f46a5bb11c9b09d06fdc8469.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libstrongswan/plugins/wolfssl/wolfssl_kem.c | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c b/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
+index 042a7e70616..786aecab4cd 100644
+--- a/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
++++ b/src/libstrongswan/plugins/wolfssl/wolfssl_kem.c
+@@ -25,10 +25,7 @@
+ 
+ #ifdef WOLFSSL_HAVE_MLKEM
+ 
+-#include <wolfssl/wolfcrypt/mlkem.h>
+-#ifdef WOLFSSL_WC_MLKEM
+ #include <wolfssl/wolfcrypt/wc_mlkem.h>
+-#endif
+ 
+ typedef struct private_key_exchange_t private_key_exchange_t;
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
