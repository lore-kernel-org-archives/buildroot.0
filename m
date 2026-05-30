Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D05CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C44676F5E3;
	Sat, 30 May 2026 21:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZ-i44k95WQl; Sat, 30 May 2026 21:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AFB16F576
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780175693;
	bh=FThHkoyaxxrsB5kITrrh7wcBz1hOa66nqy8xjzX8XBU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SChKRAdp74qrpqVfBo7h1GJDKBYw63u2/EWv3R2nfSNnNud9NgRi1+nBkLfZpf58d
	 wGioXp1lcuavd83xx1IvWlIxT+PGMJJVe4mU9HfAHKHbW/WRTGGPZowPAWt2lMdoTE
	 T6HpSvPg+p09foUYEFSnJ5CUd3p9RwiYYz0J42NeJCyl1EfG2nLUTjsF9mpjm9QquV
	 7qAbLsz1bhVzeTTilU3p32SOPsTBW/xvafJ1ePPdAnkv/vpNdvqSTTMGeK33/m+XkI
	 o7WsyW0r1EbaUB1QaRIwaWvRHFWcvfmxt9a1MR3Mgcw5dWUNdHiL0wtj6x3zL6rWMP
	 GZfsNGFRjyZHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AFB16F576;
	Sat, 30 May 2026 21:14:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 433B912F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4057B40225
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cr6mmJz08VVB for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7ED394010F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7ED394010F
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7ED394010F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:14:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 940161A3755;
 Sat, 30 May 2026 21:14:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5A86A6073B;
 Sat, 30 May 2026 21:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2BA2310888CC7; 
 Sat, 30 May 2026 23:14:46 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 30 May 2026 23:14:12 +0200
Message-ID: <20260530211414.3016442-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780175686; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=zfSFUa333RCOfYybRHr+nHAQqKecHAvk5BlR427ZJeY=;
 b=NN/RclbkOD6ak79FAa11wzOR4K6FCKq/qAaskvITebSYg6NAK00C3TaWUwWPh6ptCnQqES
 4uTeYCFjgQCLfqpg9Bqa5kItb83uch5CiBPr+p5rqasyTEOmGmnVdRZekDBNPfgu7T3BvO
 1H4SEMQBlG/QZynkSQrNxj0upJGB/YeRTU1EWeKJcOeOWNdElpap+PBAgWyh5CdMGUUS21
 8Fbz8xxmJWq5xL6sFNLWGkT+G2Gk30Vch3L56BMhoi/u4NnEeoCRe/248rIrxRS+doLcS3
 11bYecsiG1WdQhi+8aw4F8c7bv/QoMya9LoNetZxqASLD+6gFLKFLu6bCS9WPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=NN/Rclbk
Subject: [Buildroot] [PATCH 1/2] package/qt6/qt6base: use regular $(RM) to
 remove directory
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

Using '$(Q)rm -rf' is not the typical thing we do in Buildroot, we
more commonly use '$(RM) -rf'.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 3bf4a1221b..5c939568ae 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -427,7 +427,7 @@ QT6BASE_CONF_OPTS += -DFEATURE_zstd=OFF
 endif
 
 define QT6BASE_RM_USR_MKSPECS
-	$(Q)rm -rf $(TARGET_DIR)/usr/mkspecs
+	$(RM) -rf $(TARGET_DIR)/usr/mkspecs
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
