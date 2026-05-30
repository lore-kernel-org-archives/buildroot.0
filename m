Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7439FCD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 21:14:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34145853C7;
	Sat, 30 May 2026 21:14:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufsHZcuPPc4U; Sat, 30 May 2026 21:14:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64E2F84D26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780175694;
	bh=mfzEPKnReBdHX4VglYMCofTojXtKTUIrJT4virJ1Wuo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fuvQ9+jbbHYvhbDco4whIOoZ6UYbgdhcTACMaE4wAUlfBcMOFah5Hu/SXtQxYzMBL
	 /0I9PTBNBA1ORtdDTK7DMHn7kOag83lxF0gdBOA5VeGRru738s1/9BfOIZHMZwdoNp
	 iBymfVOb8hXAk64JMQtXIgty19oBsYHbUI869w62X+AdASm5hDPOLhomH3wQP+e1Vg
	 sIuN24kYttFjFyh6bhM0xE6Vs6iuGsZcCoYHzBsy5NYa0uxs8EA30Tom4EcVqZ0bPL
	 Cwl5Zh3NylndmKkJyKBZYJ4SfyIOlGwO2MNujlFJhmiZgRlFLF1qOQnq3FQjpvrfw1
	 Q1D3R2AZd6HQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64E2F84D26;
	Sat, 30 May 2026 21:14:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 45BFD356
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 432D58414B
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:14:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zukCqsGpd_Rj for <buildroot@buildroot.org>;
 Sat, 30 May 2026 21:14:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7F15080EFC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F15080EFC
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F15080EFC
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:14:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A3F2D1A3756
 for <buildroot@buildroot.org>; Sat, 30 May 2026 21:14:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7942D6073B;
 Sat, 30 May 2026 21:14:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B8F7610888CCD; 
 Sat, 30 May 2026 23:14:47 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 30 May 2026 23:14:13 +0200
Message-ID: <20260530211414.3016442-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530211414.3016442-1-thomas.petazzoni@bootlin.com>
References: <20260530211414.3016442-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780175688; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=WtW7xyvmBrEYcIuK1YlqZsJ8rDGR0rpwTk2QPD8ZVgg=;
 b=SVINWYTSaIsQjGPzK6V5OAplpnHqXLJ86pw+ZQB9a+bk4/G/ixL3nEO9hyu/JqK0nuYbLp
 LqTNQ28NzRcJWN7hU5a/zVPSBie/vlBjLI/cIJpRJAZ1Bh/Fdpt7WlpAShuBZ6TRqJ7LAK
 fVw1vfPxNjHZVJUeQWIiILwjFViHURgwnSrjg9jfPAfPXrS8IVdSMHJiBVOzsrAannNYjM
 l0d79Gmk0ii79l0/bfqm6nlA4QT6YBEViN3hxMmjDyfTdlJi69hDp9o88ceFPrERvqVmTm
 c6a5tkCvd7HA8iwULdBrPzf9ktEYTZjY3dJBPfRbdr7Ya0bGWsbthCoT7gYRWg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=SVINWYTS
Subject: [Buildroot] [PATCH 2/2] package/qt6/qt6base: remove SBOMs from
 target
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

All Qt6 packages install their own SPDX SBOM in
$(TARGET_DIR)/usr/lib/qt6/sbom/. In the context of Buildroot having
such SBOMs on the target is not useful, and they take up some space,
so get rid of them.

We use a TARGET_FINALIZE_HOOKS (and not a POST_INSTALL_TARGET_HOOKS)
because it's not just qt6base that installs SBOMs, but all qt6
modules, so we want the cleanup to happen after they all got
installed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/qt6/qt6base/qt6base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 5c939568ae..01661b7f01 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -431,5 +431,10 @@ define QT6BASE_RM_USR_MKSPECS
 endef
 QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_USR_MKSPECS
 
+define QT6BASE_RM_SBOMS
+	$(RM) -rf $(TARGET_DIR)/usr/lib/qt6/sbom/
+endef
+QT6BASE_TARGET_FINALIZE_HOOKS += QT6BASE_RM_SBOMS
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
