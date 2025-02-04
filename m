Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321E3C02197
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 08:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6792413E1;
	Tue,  4 Feb 2025 08:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OoF6ta6obmR9; Tue,  4 Feb 2025 08:10:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA450413E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA450413E6;
	Tue,  4 Feb 2025 08:10:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F06B212F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:10:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E079C80DA8
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kn2dXgQChl0g for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 08:10:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B990480D94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B990480D94
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B990480D94
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 08:10:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9E2F3443DE;
 Tue,  4 Feb 2025 08:10:06 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  4 Feb 2025 09:10:04 +0100
Message-ID: <20250204081005.1212940-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffevueeuveehgeefuddtleeuudehveevheeugedtffejkedvfedvleeludfhueejnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtpdgtrhhoshhsthhoohhlqdhnghdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdrrddpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738656606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=f0M8hbXgJqYqyql/sjpMNvUg6/vHU8NXjWvRRxKzZKo=;
 b=RJnDxKtQkdpGpK1aWdxVSJhZSm7sBrMaG4qUlJm+FNqtiO2BaHJ02vrM+kiA1kEVwp6e+i
 s6BCVAIMwaodZbfW74eYPQYIU4k0RV8ss9KMtVIreK6q+GhxqZyEspi4q21M8az0kTt8ir
 9fnpbLm0BgCmQeqMAjabMR54B8meFH0OF67O/tcnLh66yyii+5wzwvOmOwgUhDuDPQy9zW
 QxMjWrhxaqeNuR2fKscG8i3IVt0Xm5KH2MBaVCdA4ddBHtZD33Rf1HShuidTPFCDK8xbGY
 Ic5DSNvcVxnTzQT1QcNcnJS9ZIb4wrxz84yCVn/pf1q4GOcNvEiz0wv7OF3yzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RJnDxKtQ
Subject: [Buildroot] [PATCH] package/cross-ldd: use Github download location
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

The crosstool-ng.org download link no longer works (probably a server
configuration of some sort), so let's switch to a Github
download. It's not an auto-generated tarball, but really the release
tarball, identical to the one on crosstool-ng.org, with the same hash.

Fixes:

  http://autobuild.buildroot.net/results/2ef16c821c4dcaaaa12b9b6c582da21a0592e453/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cross-ldd/cross-ldd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cross-ldd/cross-ldd.mk b/package/cross-ldd/cross-ldd.mk
index 357133cdd2..b5560805c8 100644
--- a/package/cross-ldd/cross-ldd.mk
+++ b/package/cross-ldd/cross-ldd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 CROSS_LDD_VERSION = 1.26.0
-CROSS_LDD_SITE = http://crosstool-ng.org/download/crosstool-ng
+CROSS_LDD_SITE = https://github.com/crosstool-ng/crosstool-ng/releases/download/crosstool-ng-$(CROSS_LDD_VERSION)
 CROSS_LDD_SOURCE = crosstool-ng-$(CROSS_LDD_VERSION).tar.xz
 CROSS_LDD_LICENSE = GPL-2.0
 CROSS_LDD_LICENSE_FILES = COPYING
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
