Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED961CCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 17:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8924440C15;
	Fri, 17 Oct 2025 17:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bZqIU8ZDr0PL; Fri, 17 Oct 2025 17:59:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E22740C11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E22740C11;
	Fri, 17 Oct 2025 17:59:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98436D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 898E780E62
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HcqeeiKhS1Z for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 17:59:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D4C2780E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D4C2780E2D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D4C2780E2D
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 17:59:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3E212A4C0F2B;
 Fri, 17 Oct 2025 19:59:31 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50656)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v9oji-000000004QX-3Qda;
 Fri, 17 Oct 2025 17:59:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Baxiche Su <baxiche@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Oct 2025 19:59:30 +0200
Message-ID: <20251017175930.3369733-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760723971;
 bh=eHHMgxhVTAFKR0zoeasjU/TD7RnK5BDL2BtUX6KL+Hs=;
 h=From:To:Cc:Subject:Date:From;
 b=GmApFIklV3EiuHfTV0dVLPTpZs2kbTuWzREDLFNNOgh5BrbcvVWZwtSSv/6GaXqfp
 I7Blir4AZ711V84s93fsYf2EUvOwGQuZPbSpK0GRgl3IZnfTO5STufZUT1AytVARr4
 LtxSQe0ZtV3T8Fh54rqkKMwp8GXJ3i4pTWIPBy1sSab9tJNHa27DrraBR80jmFKiqD
 oTMFLKJBUtZ8T9uFrrSE2C4NKOP8lrL69bwz7IkzR4iS5Wee7mvWimI2QGU3JDe3g7
 PzojvwCTQY56+syjNqi/mG+p1pyCRqRgpIrf0DdnwB+FybMJluDRtMYPVv/16KZ85Q
 yyZbY/UuUnJvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=GmApFIkl
Subject: [Buildroot] [PATCH 1/1] package/qt6/qt6multimedia: add dependency
 to qt6svg for examples
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

Buildroot commit 553c55e9bd3cfa05cb84fa4cdfc5d25d51c3486b added the
qt6multimedia package including an option to build examples which
contains a dependency to qt6svg without selecting the package in
Config.in.

Fixes:
https://autobuild.buildroot.org/results/c94670cf255a1a6975e99d7b22a159f7fdc6f850/

    Makefile:578: *** qt6svg is in the dependency chain of qt6multimedia
    that has added it to its _DEPENDENCIES variable without selecting it
    or depending on it from Config.in.  Stop.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/qt6/qt6multimedia/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6multimedia/Config.in b/package/qt6/qt6multimedia/Config.in
index f64f60a004..8cdd95f3e8 100644
--- a/package/qt6/qt6multimedia/Config.in
+++ b/package/qt6/qt6multimedia/Config.in
@@ -25,6 +25,7 @@ config BR2_PACKAGE_QT6MULTIMEDIA_ALSA
 
 config BR2_PACKAGE_QT6MULTIMEDIA_EXAMPLES
 	bool "examples"
+	select BR2_PACKAGE_QT6SVG
 	help
 	  This option enables the Qt6 Multimedia examples.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
