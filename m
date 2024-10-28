Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0A9D33980
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 13:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B319A8113A;
	Mon, 28 Oct 2024 13:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ef4vsKFLO-1I; Mon, 28 Oct 2024 13:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C87C810E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C87C810E6;
	Mon, 28 Oct 2024 13:46:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E76C5C1E
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 13:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BB6540199
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 13:46:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w7P3FgpIEuVk for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 13:46:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AAE53400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE53400D1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AAE53400D1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 13:46:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 9B5EE1C0012;
 Mon, 28 Oct 2024 13:46:02 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 28 Oct 2024 14:46:00 +0100
Message-ID: <20241028134601.1286048-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730123162;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RTbvT0mAXFz+V10oqQKvCrjXCIT0Dru++aBGN7Rpcm0=;
 b=hq18utz9/qAn9PHGnRxVplKbj9CM9lXIAficFvfP1StoNZGF+yubmUn3XTDtluHjLqSM69
 Km5hd5+qYiBshI0cgGvAbHiSTB/0GVRrukaEsa7IjhZ8SAYDSh75VO71flP+dMQngp+qCw
 joqxkkGc25ywDA1d2Q58cCJe+V5jWihehObAnq4ZS+/F5otDav9ts9lde5oxJnt9NEEJ+I
 Ef/5VFFbC5Y3oVQFflzV6J6tVkut7ADJwNPWQZgcT/jUDuLjJUlPI+LSGTR8Lgm4uHUVB/
 IUacPr+QsjXkjSpoenk24L+Ci04mpd2S+8+z5uxFwR1TgSQlkJPIzUF7fxa+RA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hq18utz9
Subject: [Buildroot] [PATCH] package/musl-compat-headers: fix download of
 queue.h
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

http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70 now
returns some HTML soup instead of the plain text version of the file,
causing the hash check to fail.

http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70;content-type=text%2Fplain
returns the correct data, but the ";" in the URL causes some issues
with the parsing logic in Buildroot.

So let's switch to
https://raw.githubusercontent.com/NetBSD/src/03be82a6b173b3c62116b7a186067fed3004dd44/sys/sys/queue.h
which delivers exactly the same file, but hopefully will be more
stable. The file name changed to just queue.h, but the contents is the
same.

Fixes:

  http://autobuild.buildroot.net/results/57c8078f382f74859076512425b2f1c52f44e95a/
  https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992850 (and many other similar cases)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/musl-compat-headers/musl-compat-headers.hash | 2 +-
 package/musl-compat-headers/musl-compat-headers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/musl-compat-headers/musl-compat-headers.hash b/package/musl-compat-headers/musl-compat-headers.hash
index 626145df34..27e0afb68c 100644
--- a/package/musl-compat-headers/musl-compat-headers.hash
+++ b/package/musl-compat-headers/musl-compat-headers.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c13407edd0e33be73cae72514cb234f8612e1c0e54401c9448daffd3a240158b  queue.h?rev=1.70
+sha256  c13407edd0e33be73cae72514cb234f8612e1c0e54401c9448daffd3a240158b  queue.h
diff --git a/package/musl-compat-headers/musl-compat-headers.mk b/package/musl-compat-headers/musl-compat-headers.mk
index 1cfa894879..865b0bae43 100644
--- a/package/musl-compat-headers/musl-compat-headers.mk
+++ b/package/musl-compat-headers/musl-compat-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # No main site, just using extra downloads
-MUSL_COMPAT_HEADERS_QUEUE_H = http://cvsweb.netbsd.org/bsdweb.cgi/src/sys/sys/queue.h?rev=1.70
+MUSL_COMPAT_HEADERS_QUEUE_H = https://raw.githubusercontent.com/NetBSD/src/03be82a6b173b3c62116b7a186067fed3004dd44/sys/sys/queue.h
 
 MUSL_COMPAT_HEADERS_EXTRA_DOWNLOADS = $(MUSL_COMPAT_HEADERS_QUEUE_H)
 
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
