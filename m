Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0196EC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 19:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C29A409AF;
	Fri, 14 Aug 2026 19:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lSg_b_CX9vcq; Fri, 14 Aug 2026 19:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FF4740C0B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786737555;
	bh=3ZN9gEzplmJzTSIFNwPsByblhvSBwFOLDoeo2+2O6DM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Db3ZhZE11v+KvAfz2KlTPvplk9+NeAlY3/x1g7EU/sXtYT/wnZhTbQC5xvswK+1ce
	 XCxsw8i2YzxYo2PFcwEKsRmUiWbkjHlxAacM0b8kXGUCvN6wmjcYEGlhBTA+hXB2Oi
	 ZbGd8MWrG0Z6VRj/Ns/IA/FkFBb1lcxLuQEgrL0FgafG9LrHGpSm/5r7MLcjmK/dJI
	 /krs6H8UQT8i8jf+A/Tt42BoiJWLXJ6DGHphaEf5VGtjQECqy63V/KKiY28Z3uD+K2
	 XUyZoPa3SRQkflVgdnp9J7gSsj7vQtIJiykDKrW4FOXit2TPzUMpqwZl7XDdo4ca7o
	 ubvGancfuM4gQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF4740C0B;
	Fri, 14 Aug 2026 19:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B54DC23F
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B76780C0B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHVGFR-k3Xn5 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 19:59:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 64BA480BE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 64BA480BE7
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64BA480BE7
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 19:59:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1xMbAo1UPU-00jUY0; Fri, 14
 Aug 2026 21:59:10 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Nathaniel Roach <nroach44@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Fiona Klute <fiona.klute@gmx.de>
Date: Fri, 14 Aug 2026 21:58:47 +0200
Message-ID: <20260814195856.3295644-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814195856.3295644-1-fiona.klute@gmx.de>
References: <20260814195856.3295644-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UGX/36pvprfmXnwa2VHJE+O9HtW1afLIq2Y/3dnmukK+wqsRF7y
 3nKkkv4Z3dsRrr6FoP765cneRr7QW6WmaE5ynH3dL7e7vLR97DTkXnXiGCsxNznvfNKgsF/
 L7/I4BvedE8vYLddOvcmyA5JN2jAOMAPRD0+UJcbBIEnUaCaE0ed879tNmSbJ4FtKzQPyHe
 BHrpFpaleLFqFykNahEmQ==
UI-OutboundReport: notjunk:1;M01:P0:qUXqfqv/5aI=;dtTe8otz/3tCLX5I9n3NHG6f0Pn
 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
 ofVXIPQ==
Subject: [Buildroot] [PATCH 01/10] package/at-spi2-core: update project URL
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
project repository instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/at-spi2-core/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/at-spi2-core/Config.in b/package/at-spi2-core/Config.in
index 2a1b21d375..915815393a 100644
--- a/package/at-spi2-core/Config.in
+++ b/package/at-spi2-core/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_AT_SPI2_CORE
 	  GNOME platform and a library against which applications
 	  can be linked.
 
-	  https://wiki.gnome.org/Accessibility
+	  https://gitlab.gnome.org/GNOME/at-spi2-core
 
 comment "at-spi2-core needs a toolchain w/ dynamic library, wchar, threads"
 	depends on BR2_USE_MMU
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
