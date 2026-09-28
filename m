Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379B8CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E76BC80D48;
	Mon, 28 Sep 2026 11:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kjMToWAmQ_pm; Mon, 28 Sep 2026 11:25:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2765580D36
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790594719;
	b=C/MpaIG1y0e3JW/QN/1isk2d5N70kxz4Uk9pnmeqHFp40fZdUWwCQS+gYAdvZEWzOv3z
	 6nRnyuF6ex6yBVRL6xN3vZHmyYLeopJCuNwNf0f1EkbGAvV71WAYLqyHeugfyJ4rGO5km
	 18JpfimC9OkeU8f5uMc7PczbapTatLcM6Ip52Jq7rYrcnKtFqBtC19NyZTMaFpGGXzyB+
	 UoYV6NvMs0Opz6EggDnKn9o2QteW5BLn6J4XGndwzKJSB8ggADMa87z7bhai69hViFeNm
	 bJTNOuB/LTb85sVAQhhid2QKlwjxyzt8IDiPPCDn4EeWM4IIQKzvcw+3LIYutj4zcMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790594719;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=h+0yRc7UDBaWTS10ZbvV2Ydua1XKFCo05GCePq0UgYo=;
	b=aEdTdpK7y1yfgrZ2Cr4F/wTfL9pfhvJQT5C2CG0Iy4NiaQYVOifNJbSE+6MDlEjkl8bh
	 XhOCEDEKZikkGwk6OOBlpZ2y6TQ2wSyzxaywh2aJfkWDZ7z6wHOj5IyLsJZKdLNA9yDKt
	 cdhpvA+dhJjp4bDfZnfPqb0cc123CIlPx10//J6jNVC2AusU6tZFJCuaFYHNZoB83yoyL
	 9vRgSzo3xEq+KziuYY8rHNASjPAKX8u9SIWGhQrGoRH8IgL3TxybxFG5DJsnHMYDR5Egy
	 htPgeBPhTvlBcd2yrjpCEwSGuOdI+5TLiU9IG0YlAtcJNkrbxPrAGb0WBNzMgiwCSDw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790594719;
	bh=h+0yRc7UDBaWTS10ZbvV2Ydua1XKFCo05GCePq0UgYo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=THpfnC1MmWJiPpuFuUn2JzPURtAptUu3lO6wRdj5i5IFVrjeMIFD++ERJRXhCcfkO
	 mBQuB1tlcCMmyHoU6tU9Q3ExYy35okBUovHhzRgPB3ktlEjNoEMuvnzoq6jSft1J9n
	 pGLrxOM61RzNormsnRUKK8yHh6vTcNrQb7IakX/wGWydAlJ8vuZKTbHoUXIX/WJ5Ql
	 aaQz0xMUORlMKnTzXEPgk3kAol2K7wezDlLZJl5jUbBFp5383JYbE4G8HfatImR8gD
	 VP4SZPQe31ykVNBjFE0G95lXMDL1BFDDCFj3cMUyK0SEgFz/9riz/zvQGFd/7UwzIY
	 zzc0GA5moGOAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2765580D36;
	Mon, 28 Sep 2026 11:25:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F34124E
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 112D2405E0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZgZfDgoMMjBY for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:25:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 50448402B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790594717;
 b=ZEDDdHEgAH3rtdMM/X/tV18dGknaTNDZEfW2ZhtCnQ27qoVf/DIz9x9SddDlvPyNB2nA
 brfSeM6siBh3r2iikBzO3t/bFfZ3tsUm85obJM2Sywfz2FGhVW2EcDUXRQhVgqYBFhjfC
 Uq6IsnWDKEN0tHco5+a8+cEqll2ksb4uLzLWePqJ94jvGuGTH1DSXYpUqHlAWPaCPmq7C
 ZW1Cse9/FQqXRdL5fIhO8AMuM/DQVBUVTGJi45tVxKQfvZy8Bk1Vr5Aqqna2p5BexXaDK
 AS72rNxrG6JMiWWK5ePxmDTHYMeCURCNnrypuKaYDqJ5WSTqJP9p+skM9xUtfi9nvPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790594717;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ONBEFFmwJQuu1EmA/JMA+onCOwdlzXG22CduTiLNMTs=;
 b=fXLypPuUeEpZyMAXpTGIUaXo2x2V3b5QbiKJh7IRTkrWuyK13aPPnsNFa7C21loh5Jc2
 qTqeEvbL9oLtKCa1+bF+ozGgTYyzaE/nkqPR4CUntLVUTh6N34cjVvNqHb4hRpHC1XPDX
 48PoAQahQUX68AMAupccNtRG3OQIMoCMfn1i83A7cQyz8I+GWvWZj0TtcRLs/T1mPaMnB
 Pv2mIrq+ea6v11P5Ekxi0hrwNwPf9QGul4w7i4r96poUtJ2uArTNMdXpbe42jvS3XdxiZ
 UC38vX38lG0sQNkes7/jSVzZXXExTHr/Hzt0XKCr93Bn7kvQN2lmS73BhZTT6ovRD5g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50448402B1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:25:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A4D895C83; Mon, 28 Sep 2026 11:24:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:24:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b1caae22baf5c89e5650c1264002af71f88c3ea
X-Git-Newrev: 3caf39eb798addc6f5022a1e90225a5981356b0b
X-Patchwork-Hint: ignore
Message-Id: <20260928112405.1A4D895C83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkcs11-helper: add support for
 OpenSSL 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3caf39eb798addc6f5022a1e90225a5981356b0b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-crypto-openssl-use-ASN1_TIME_to_tm.patch  | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
new file mode 100644
index 0000000000..d8149330e1
--- /dev/null
+++ b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
@@ -0,0 +1,48 @@
+From 59cc22b8d65669da599f1c435fdfe35d4e07db0e Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Thu, 4 Jun 2026 12:49:44 +0200
+Subject: [PATCH] crypto-openssl: use ASN1_TIME_to_tm
+
+Introduced in openssl-1.1.1 and is required for openssl-4.
+
+Upstream: https://github.com/OpenSC/pkcs11-helper/commit/59cc22b8d65669da599f1c435fdfe35d4e07db0e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/_pkcs11h-crypto-openssl.c | 16 +++++-----------
+ 1 files change, 5 insertions(+), 11 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-openssl.c b/lib/_pkcs11h-crypto-openssl.c
+index 05af65e..aa58722 100644
+--- a/lib/_pkcs11h-crypto-openssl.c
++++ b/lib/_pkcs11h-crypto-openssl.c
+@@ -148,21 +148,15 @@ __pkcs11h_crypto_openssl_certificate_get_expiration (
+ 		notBefore != NULL &&
+ 		notAfter != NULL &&
+ 		X509_cmp_current_time (notBefore) <= 0 &&
+-		X509_cmp_current_time (notAfter) >= 0 &&
+-		notAfter->length >= 12
++		X509_cmp_current_time (notAfter) >= 0
+ 	) {
+ 		struct tm tm1;
+ 
+ 		memset (&tm1, 0, sizeof (tm1));
+-		tm1.tm_year = (notAfter->data[ 0] - '0') * 10 + (notAfter->data[ 1] - '0') + 100;
+-		tm1.tm_mon  = (notAfter->data[ 2] - '0') * 10 + (notAfter->data[ 3] - '0') - 1;
+-		tm1.tm_mday = (notAfter->data[ 4] - '0') * 10 + (notAfter->data[ 5] - '0');
+-		tm1.tm_hour = (notAfter->data[ 6] - '0') * 10 + (notAfter->data[ 7] - '0');
+-		tm1.tm_min  = (notAfter->data[ 8] - '0') * 10 + (notAfter->data[ 9] - '0');
+-		tm1.tm_sec  = (notAfter->data[10] - '0') * 10 + (notAfter->data[11] - '0');
+-
+-		*expiration = mktime (&tm1);
+-		*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		if (ASN1_TIME_to_tm (notAfter, &tm1)) {
++			*expiration = mktime (&tm1);
++			*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		}
+ 	}
+ 
+ cleanup:
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
