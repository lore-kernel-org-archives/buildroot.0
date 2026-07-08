Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8635DC43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 22:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D51A40740;
	Wed,  8 Jul 2026 22:35:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5aOaDnCwLmBT; Wed,  8 Jul 2026 22:35:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6323E40674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783550137;
	bh=a9fg8Nkmgvkd3y5Qqh2jN/5EBe00a27bgs4wp017VBA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DTK6ydwuRRyVBTtsLGW2+VLj+HIjhVAB1toGf4Xie1B9mqL3mFUer3qLv1aGiZiwl
	 NivWK1kOVGALDl9NMcNZAMJGwoSie0yen0m6APyHyWsJce+xoXev6IUg4SGln/595c
	 c91037q1vn/Y+EiDIoJ3D6UiuN4MlHwwq376wqa8JJz1t4qSM9uBbfIKoaIo99xTyG
	 5ecRUufJw0Icbo8t3HePEmDJU2jb4qmQp+S1Gb6aaAs5SPcHzEsWdOMD6qE3OSKqCM
	 hyLg0Ln9KhGz2ocLo8duOkgkJFnjZtpUd7sN8XY07ZNeqxp0dgWrN1v8wssOotY8wb
	 84cM8Vejgf6wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6323E40674;
	Wed,  8 Jul 2026 22:35:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5582E2FC
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 22:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B632406FC
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 22:35:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdAkz31M6nuW for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 22:35:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6D9D840674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9D840674
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D9D840674
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 22:35:35 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5A2F3448;
 Thu,  9 Jul 2026 00:34:43 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: buildroot@buildroot.org
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 libcamera-devel@lists.libcamera.org
Date: Thu,  9 Jul 2026 01:35:32 +0300
Message-ID: <20260708223532.421647-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1783550083;
 bh=axCoLMGF0adFHRlKkolJFQKufraIB2ARV/QKTvtWZ6M=;
 h=From:To:Cc:Subject:Date:From;
 b=haD77ZyqZCeT3HL9uf+bXsOvyE9Y+JLq3lO/nfF8x5A08WprHBrXNlbbtYXGaAff4
 AjQ0zAruth3BwSwYNO5hg+EoORryrOEHXX4Cfw2bGQpYo2gb4s3Cw1BzYIHrf9rNfH
 zPpYYA0PbOF1iqp+Zhv8YUU3T44sJ6P/spVWzBNg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=haD77Zyq
Subject: [Buildroot] [PATCH 1/1] package/libcamera: update source URL
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

libcamera has moved for a while now to gitlab.freedesktop.org. The
mirror on git.linuxtv.org is still active, but it isn't the canonical
repository and has less bandwidth than freedesktop.org. Switch the
libcamera source URL to gitlab.freedesktop.org.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 945207888bab..ba7510daf8e1 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
+LIBCAMERA_SITE = https://gitlab.freedesktop.org/camera/libcamera.git/
 LIBCAMERA_VERSION = v0.7.1
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \

base-commit: 6854ee9aa3826d5036a7d3cc19056d43c0452320
-- 
Regards,

Laurent Pinchart

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
