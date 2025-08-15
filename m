Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E66ACA0EE4
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 22:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 413E782B5E;
	Fri, 15 Aug 2025 22:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kOQ0YUekJCbI; Fri, 15 Aug 2025 22:11:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 652B682A8F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652B682A8F;
	Fri, 15 Aug 2025 22:11:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E31F8223
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 22:11:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9AE061212
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 22:11:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DG4EL8ync7Lc for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 22:11:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CD7E561210
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD7E561210
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD7E561210
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 22:11:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3C175430D4;
 Fri, 15 Aug 2025 22:11:27 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Aug 2025 00:11:24 +0200
Message-ID: <20250815221125.1348145-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815221125.1348145-1-thomas.petazzoni@bootlin.com>
References: <20250815221125.1348145-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeehuddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtedtteduffdtueegfeeigedtgfeugfeuhefhgeeuveejffefveffkeetueeghfenucffohhmrghinhepsghuihhlughrohhothdrohhrghenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfrdhhohhmvgdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755295887;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiwiN8EUhb+SIgxx5e6D+ZqTbxSzP6z1dFWE66O2UPA=;
 b=iuTcPP+ASpTa48bkMe/NEDyMFEZJnduRJETtWLUD+2DkYLL6r8gMzNBRqGwV5DXdSxU1xT
 dB6H0xEmNCTwwtLZwRisQdgjLhRr/rEn5h6wnPR6Psoo7xmCgV4vnCFjwHA4d0LyDOqrWp
 wLc+h6ntIOJVdC0opoOlsVIbJku1fZgvBaSJlYO4g9PLQ9vV1Rj+vEul93GQDNf56CwEh5
 bZkQ0A3e2pHW0BcZU9zSkIcvtRYANiDk2k6jmqmS9CYfpvkOo4189PQbbfdIXc2i70vAay
 tPwNtbR5QLi14AGGfKaWg0WL1unxSATX/OzYFqk7z2AZPjNtD9DHyQyKrgj2IQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iuTcPP+A
Subject: [Buildroot] [PATCH 2/2] package/weston: jpeg support needs
 jpeg-turbo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since upstream commit 312efb2acba7dba80b6652ccf98339dcbbd47695, the
JPEG loading code is using jpeg_read_icc_profile(), which is only
available when the jpeg-turbo implementation is used, not the classic
libjpeg. When classic jpeg is used, the build fails with:

../shared/image-loader.c:163:14: error: implicit declaration of function 'jpeg_read_icc_profile' [-Wimplicit-function-declaration]
  163 |         if (!jpeg_read_icc_profile(cinfo, &profdata, &proflen)) {

This commit first appeared in development version 13.0.91 and stable
version 14.0.0, which means the problem exists in Buildroot since
commit 430b80cfc11c59949da8e0a4f11a7088d0b4bd79, when weston was
bumped from 13.0.3 to 14.0.0.

So let's enable the JPEG logic only when jpeg-turbo is used.

Fixes:

  https://autobuild.buildroot.org/results/353e39902616bdbce40ac667e98cbaf51079f69e/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/weston.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7d43132073..1d55a1fcba 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -36,7 +36,8 @@ WESTON_SIMPLE_CLIENTS += dmabuf-v4l
 endif
 endif # BR2_PACKAGE_WESTON_SIMPLE_CLIENTS
 
-ifeq ($(BR2_PACKAGE_JPEG),y)
+# weston uses jpeg_read_icc_profile(), only provided by jpeg-turbo
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
 WESTON_CONF_OPTS += -Dimage-jpeg=true
 WESTON_DEPENDENCIES += jpeg
 else
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
