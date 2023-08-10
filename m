Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48982C04A6A
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 20:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A387141E0A;
	Thu, 10 Aug 2023 20:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A387141E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3GaH7Aqy6uyK; Thu, 10 Aug 2023 20:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92DCB41E0B;
	Thu, 10 Aug 2023 20:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92DCB41E0B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EED0F1BF5DF
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5B5D83F96
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 20:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5B5D83F96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tjad4cOPoV-s for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 20:32:26 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0470E83F37
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 20:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0470E83F37
Received: from fli4l.lan.fli4l (p54a1bb7a.dip0.t-ipconnect.de [84.161.187.122])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1929AA4C0C45
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 22:32:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45026)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qUCKU-0003pN-1u
 for buildroot@buildroot.org; Thu, 10 Aug 2023 22:32:22 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 22:32:22 +0200
Message-Id: <20230810203222.3072070-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691699543;
 bh=4SOLVE15YTy+IL1KwsjxWDIZPAaeOL2FJTkg1FGj220=;
 h=From:To:Subject:Date:From;
 b=urw4t9WSschNNmWLkteQ4cAMaET3oQfSGdan9yZ2mD7UBHxoInhVVLVCLuGtd235b
 QoNjbLkqQP4Tl769jrj8BZ1iJwgZfZ26AOsCCPGy+DxQQxpoYD2fFRsDYJ4ZK7YcOd
 kOf/1XoZp92NCTRhBO1ZSOpvqK6Bq2PeDpWErr8EcN6G52mxaxSNrZeKCbnO/aB7qk
 TsXmekhbumxSu06wkL21yC4jOvhJzWObIyhM8YE9Lg5qxhXVoSkkk0vxefDX3fuVzT
 gYncMNZjsdP18KdsRD9pa/xTv9mynh/t7RCRkcavNmN0MXgtUjoDiQAhEe2tjkMgQ8
 k/rE9lpAc5NPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=urw4t9WS
Subject: [Buildroot] [PATCH 1/1] linux: fix hash for kernel 4.14.290
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit e0a786a46733cc473f0e4c35064a3b09ccf548e6 added a hash
for the wrong file.

Fixes:
http://autobuild.buildroot.net/results/fc0/fc0e253e3535bbc1413d150554e836d3da9e2042/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 linux/linux.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index ec879b21d9..40ace29532 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -6,7 +6,7 @@ sha256  150f3846b76cd23a6135f49cef71372bade5a06e851cb4f8558df8b862d8fec7  linux-
 sha256  4c03516ae1d417571faaef175932d0892710bcbe0173e40550014d043d9098c9  linux-5.10.189.tar.xz
 sha256  3a78587523940374a7319089b63357c7dc412b90f5879d512265e59173588267  linux-5.4.252.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  6ee30a46f3fa6576602085b7b4b0c640586f99d1c110982db411819308b5755c  linux-4.19.250.tar.xz
+sha256  9fa5e24b7d791583f8cd001bcf02b52f569f261e276dc1dab2552974dca20ecf  linux-4.19.290.tar.xz
 sha256  d0e32bd47a547cc20e0ce09ff45514282742edb2af38df5dc0a03f22d4321715  linux-4.14.321.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
