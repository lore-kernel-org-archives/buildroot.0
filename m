Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A51E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAB0D61325;
	Mon, 16 Dec 2024 21:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQgikNpFSMqm; Mon, 16 Dec 2024 21:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF39A612FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF39A612FE;
	Mon, 16 Dec 2024 21:17:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C09E6C5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:17:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F03B84953
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:17:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wsOqRYD3Q-fe for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:17:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.bonnefille@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DF778494A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DF778494A
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DF778494A
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:17:03 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BAF70E0003;
 Mon, 16 Dec 2024 21:17:00 +0000 (UTC)
Date: Mon, 16 Dec 2024 22:16:44 +0100
MIME-Version: 1.0
Message-Id: <20241216-add_gdb_hash-v2-1-4eeb897a9f25@bootlin.com>
X-B4-Tracking: v=1; b=H4sIALuYYGcC/3XMQQrCMBCF4auUWRvpxFbQlfeQUpLMtBnQRpISl
 JK7G7t3+T943waJo3CCa7NB5CxJwlJDHxpw3iwzK6HaoFvdoUZUhmicyY7eJK9OnXX9RMSuJ6i
 XV+RJ3jt3H2p7SWuIn13P+Fv/QBkVKratJrxoe3Z4syGsD1mOLjxhKKV8AfauiL2qAAAA
X-Change-ID: 20241211-add_gdb_hash-34bc5fddec5d
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1734383821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q6346dC8ECxoFoQSLpARb2arIXXEqi8u0N+WTCkMCr4=;
 b=NmK5rgAyC2tE0o7Gib14AWVjfLN5ByiEAiWMWdrFY8Ct0s6O7K5KsAbUgczDts7rryaZ+0
 lZRHK/SQ3wfNhWxDxHq4HERgWGhXcDP8dakdP4qtLVO4Plez7dcq3Q7wg8BxdqrpOEiT//
 ZbUzikrVYfrpaJRvgnJVMl81rk6bMbsw5WjiZs/N1gEdbfOBr342yf4o90TM8TjlN5iwi5
 gpGL/Iq5KEmoRV3xzb5KSspNQE55SEks7Z/1SMJdzrAsWLrvd36fdOc002ch1wEKNe1eTH
 wKH5TZg3XLkvGBF8H9nNqa/zNSBCR8Cr6d5kH7A+VoTJqqBlmUSSJB187Z4qCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NmK5rgAy
Subject: [Buildroot] [PATCH v2] package/gdb: add hash of licence files
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
From: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds sha256 hash of the license files for GDB.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Changes in v2:
- Use sha256 instead of sha512
- Add one more whitespace between the type of hash and the hash of the
  file
- Link to v1: https://lore.kernel.org/r/20241211-add_gdb_hash-v1-1-eb02d192b6c1@bootlin.com
---
 package/gdb/gdb.hash | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/gdb/gdb.hash b/package/gdb/gdb.hash
index 6cf55a675dae3d373f9b32f795aec469049464f0..3d1809a2f97638b7c6a6d01e0c51e9a8b798a9ea 100644
--- a/package/gdb/gdb.hash
+++ b/package/gdb/gdb.hash
@@ -5,3 +5,9 @@ sha512  0217434073023a8b8316088bf3ee95d53a1b6a7897f6269095429016a8900f9a05e130c3
 
 # Locally calculated (fetched from Github)
 sha512  3518b47d5c11d1fb478ee152bde1719363f9391db73f3b9f5491217c17742bef8ebca6a51a40302dfaa9476c5a32a8b8f70a4bf64289422dea5f750ae53ab88d  gdb-arc-2023.09-release.tar.gz
+
+# Locally calculated (fetched from gcc.gnu.org)
+sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
+sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING3.LIB
+sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB

---
base-commit: c12008448e6d0f78774b386fb0f66a14c3064eed
change-id: 20241211-add_gdb_hash-34bc5fddec5d

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
