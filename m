Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC57C87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 20:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D1F7614BD;
	Wed, 30 Jul 2025 20:39:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f4it4AiXDD2k; Wed, 30 Jul 2025 20:39:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577CD614B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577CD614B9;
	Wed, 30 Jul 2025 20:39:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E6D47186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D800340FF3
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OS1DGXxqzPOI for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 20:39:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 853CD4085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853CD4085A
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 853CD4085A
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 4B359449F1;
 Wed, 30 Jul 2025 20:39:48 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Jul 2025 22:39:43 +0200
Message-ID: <20250730203947.1097409-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepvdefiedvhfevieetgfethffgiefhjeevfefftdfhtddvffeuieeludehfeeguefgnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753907989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xaZ8ErGBYcLWc3WZ6M1W6+eIgnGuQuiyaJpNwpJSVjM=;
 b=AuJrF3fnl34yJoLM/hubx1CPb5ZAV40TlXIiN8MnKo6DVkvjUZXxNGMd2OvBV5ZCeN3Kx0
 iRp+U9S1WXAwMnlXDqgZdoUHRUN4OOsHRB+7WnBN+/OtRJgI7sQcAiAnTGA6gcovK1DRip
 Vi0MJt5bYkA2LPBB1rLMeb9JraQrFhpA7LwiYDDyVw4N4+zf0GAxURChofIF3AIh2CDTUO
 TlCjdMdiSq3XPCVeNBKLHzpETT0MWedcp5N/d3V1chxJLaxGEtd8uv2rsqJQC0Cgtp6qaz
 5/2WDWoQRZaxq3JM6xauCMWcVFEPtoZOdjYtVqOK49kgGFFoOYwgl3nX6mKWig==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=AuJrF3fn
Subject: [Buildroot] [PATCH 0/2] Upgrade glibc to 2.42
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

Hello,

Here is a small patch series bumping glibc to 2.42. I would probably
recommend to *not* merge this into master right now, but rather merge
it in next. Indeed, they removed termio.h, and this is likely to cause
some amount of breakage here and there. Even gcc had to be fixed
because of this.

So I believe we probably want to release 2025.08 with the existing
glibc 2.41, and bite the glibc 2.42 bullet for our 2025.11 release.

Best regards,

Thomas

Thomas Petazzoni (2):
  package/gcc: backport upstream fix for glibc 2.42 build
  package/{glibc,localdef}: bump to version 2.42

 ...bsanitizer-Fix-build-with-glibc-2.42.patch | 81 +++++++++++++++++++
 ...bsanitizer-Fix-build-with-glibc-2.42.patch | 81 +++++++++++++++++++
 ...bsanitizer-Fix-build-with-glibc-2.42.patch | 81 +++++++++++++++++++
 package/glibc/glibc.hash                      |  2 +-
 package/glibc/glibc.mk                        |  2 +-
 ...ACK-only-build-and-install-localedef.patch |  8 +-
 ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch | 14 ++--
 ...3_SOURCE-undefined-to-build-localede.patch | 10 +--
 package/localedef/localedef.mk                |  2 +-
 9 files changed, 262 insertions(+), 19 deletions(-)
 create mode 100644 package/gcc/13.4.0/0004-libsanitizer-Fix-build-with-glibc-2.42.patch
 create mode 100644 package/gcc/14.3.0/0003-libsanitizer-Fix-build-with-glibc-2.42.patch
 create mode 100644 package/gcc/15.1.0/0002-libsanitizer-Fix-build-with-glibc-2.42.patch

-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
