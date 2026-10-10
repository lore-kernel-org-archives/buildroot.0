Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF6ECA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C32BB6066D;
	Sat, 10 Oct 2026 08:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id facj_wwPHZS9; Sat, 10 Oct 2026 08:37:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org F0BCC6060A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621474;
	b=MZsFkja94XkX3wy0rr80PWEahn0JR6Vmdiw9LiJrV2d2hK5EEiuLr3rCCthZ4tHWTT29
	 /nv9+8CIJsftIzTZnjWHy38xc5396WuumP6hsGYA3g/4789NdsjktbY/SzQNtwkWQsvJZ
	 MQey3X3HlvbCOfmtrj4em5jL6hOqSkoXaE11NN/8F6021lGx1c3ATrkcjG7JmuMcXzaen
	 rF94PqlshHexzqeVcxUAiXKzQVUmlW1S5M0xBUqEM60Fs738racYLM412C1bKWBLvSzWJ
	 HAWnTAoZ8makedoW6fujZOpZK6+AvAclXuGkb72cBUc1XDxhIDnwt9ZIOlO38ojKSnw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621474;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cU6jksh74o3QZr6YrDAx+fsgCaLDQcBIyTyrkqQcvRU=;
	b=N/Qx/iLlxYJfEpZ9UBMPi6cLdphbQ8WfJ/Y31YQ33in5+OJtBfJSt9J4GubtEu2uIXbi
	 TRFbPAn6ApaOgZOtpKtiA2aCVbYj/T+QXMzeiIr3fa8Dr2KzVMgVVaoOV7TnzZgYYj4PW
	 3GKsozzjnWwwWm3bn+cs7CX1NqfsF00RzNyH4GV10KTC80rYm+jFH0UuNeC62yZPSan5H
	 2szGitacEz6MOpGzrjoc234zxA3lksBn4uDFuMRgW2L69kgAmUePugfLAmJZOq+7yCPGP
	 TGXsdvOSbNJhBDi3Rg/Y8ctiBMEbFx5mTnqAhESExdT2Bv9tRv2ajquGbRTeAdHdxQQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621474;
	bh=cU6jksh74o3QZr6YrDAx+fsgCaLDQcBIyTyrkqQcvRU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O4fncYtWlHyWHbNDaqiPvjPL++2G2/yUzmJi5IUR/EdT8x+B4imaWtX5FmhJjbD+l
	 RendB8cCyKX6V/mJV5ssW25dpNMCzkwlk03DBixCbToiE8v8q8dIT6YEdYc7QkZ95x
	 rBd1mE5kFi259ItiFkMxDlMpr2VFgqNJKRkAFQSaJJ0KABdXcAZkFOjsj1VhgkppFU
	 KJliwjg+BQaerrkqpRKV8Y++L8FpdbiD72Sa8vULiBmyHreif8GJanYtGUH34wF/j1
	 CS+rN682AHrtvXSvRNrknOZLSAoajOuI/xJUSs3bdCD8k/QoeFNxHhefxar/eJZHCZ
	 EvV20P9NpCK9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0BCC6060A;
	Sat, 10 Oct 2026 08:37:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E4D74111
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D69C28116A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8HoHmfgip2k for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:37:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3359C81108
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621472;
 b=lOflyUAmibReuaYkMBtYedA50Xt3rYIkfnxh0qq48yBDhi52At8CUkUoP/OaNhHnvTuh
 2nhZ0Ees9fPP4nb5cc5/w9dGUGqt2OSBAC4JGiEmC9LyCA3KdbvCcNoofDLkwvmR5x2H4
 KtVfDeC+CJQ2Re5pN+XmKZUcTsheW9eLz9AOvCeWO11RTOzIHanmORcDDrbfyVfGw+44+
 lWL+FzZfSFIMsvAEeZg4DF7Y/M31AAwCti5gwZsnjRRsX3mde7jWjBfvaeMs1QlB34ssj
 YolbBVRQ9IEIi/WZTwYNIDwkGHaVD3NHCCEDhrdHR5B5XmViuTc2i+WTJm0Scj5vaBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621472;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ll/KtvFHl2MvorA1RiWpX6hnxgvZGh8NEtnNIck/+j8=;
 b=azDp1S8mqysbA+Qqo1jJ+IdE3VZQnHvAhY2ye9FtQq07saRhvkQsn4WZuWaWa24FOt1E
 9iK4Mc/w8bzlB3UAAwJDbHHt/U9097hnKzpADRSRtfmgrEqrRvSAonnNnSiJR/SkS25Wg
 RwBBWuEIDgkGuLh059nW7levyv5IafY3lK86algCydZZyra5wYtcNTD2MKwcjq/udLj8e
 jgosIWBBZR8wh4K9V91Erc/JHjdgOuQGRbNNBQPJJyygETHGPOL87OzKt6tVeNY23hzEp
 Ue4X7elOayARxsaGIsun9qLABL6ixlFHLKOikrPRN8GhHkJw4lTXfg4pBW/YILL4tcg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3359C81108
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:37:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6754A8F013; Sat, 10 Oct 2026 08:36:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:36:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 75aba76d9a9c0bec2f1ecedbe7ebc48616cb728b
X-Git-Newrev: f3fcabfb888dda0b68b5353777e832ad234e655f
X-Patchwork-Hint: ignore
Message-Id: <20261010083632.6754A8F013@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ibm-sw-tpm2: fix build with
 OpenSSL 4.{0, 1}
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3fcabfb888dda0b68b5353777e832ad234e655f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Philippe Reynes <philippe.reynes@softathome.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-tpm-Update-to-OpenSSL-4.1.patch           | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
new file mode 100644
index 0000000000..3b4e3d815e
--- /dev/null
+++ b/package/ibm-sw-tpm2/0002-tpm-Update-to-OpenSSL-4.1.patch
@@ -0,0 +1,28 @@
+From 66921ee5ba05ffb92700b00f17cf1e8b75522aee Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 13 Sep 2026 11:11:24 +0200
+Subject: [PATCH] tpm: Update to OpenSSL 4.1
+
+Upstream: https://github.com/kgoldman/ibmswtpm2/pull/24
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/BnToOsslMath.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/BnToOsslMath.h b/src/BnToOsslMath.h
+index 731957e..345d29f 100644
+--- a/src/BnToOsslMath.h
++++ b/src/BnToOsslMath.h
+@@ -77,7 +77,7 @@
+ #include <openssl/ec.h>
+ #include <openssl/bn.h>
+ 
+-#if OPENSSL_VERSION_NUMBER >= 0x30600ff0L
++#if OPENSSL_VERSION_NUMBER >= 0x40100ff0L
+ // Check the bignum_st definition against the one below and either update the
+ // version check or provide the new definition for this version.
+ #  error Untested OpenSSL version
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
