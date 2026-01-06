Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE331CE9D7D
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 16:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3D9401C6;
	Tue,  6 Jan 2026 16:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MU_jrrHkzWvX; Tue,  6 Jan 2026 16:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 946B5401B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767718551;
	bh=W4aPHTTCUHvaKDlHZwys8aYv/+4f/dmuN5yLyzcgQ1s=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GjPuJcwPB5YMoUh9nLIYY6TRG1riPu2g2RdkuKK5K9PJwKshZTiEBKT9EPJFHN007
	 xup5Mz1W2uohfpNCMGV8oqaMPqC38ZcKku/yomRhejEj/uLOBhAxGMoSgp05qVIVWy
	 jvo00fU42h0ItkBkhJjGjc6FrxQy9N3iFZFh7/dgQIAfcKmXR+sE4fqo/YjZLMBO86
	 9XZ9RQc2f1MlJuqbmaVgSnbgXpFRdaqngrNGur8QNKcV+/b2oe4PX6NXFB5K7c4H0I
	 /J0Iyn9sCF23iQpwJPM5KFU5VEVQIBUuZcnNzQgnj2mORKARhyw/KpN3BYgll2MbXm
	 NrEweanVyslow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 946B5401B6;
	Tue,  6 Jan 2026 16:55:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18F48E7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 16:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0082480725
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 16:55:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJSfiCfNcThi for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 16:55:49 +0000 (UTC)
X-Greylist: delayed 964 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 06 Jan 2026 16:55:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C85FC80665
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C85FC80665
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.67.31.27;
 helo=smtprelay04.ispgateway.de; envelope-from=mf@go-sys.de;
 receiver=<UNKNOWN> 
Received: from smtprelay04.ispgateway.de (smtprelay04.ispgateway.de
 [80.67.31.27])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C85FC80665
 for <buildroot@busybox.net>; Tue,  6 Jan 2026 16:55:48 +0000 (UTC)
Received: from [84.146.215.22] (helo=mail.go-sys.de)
 by smtprelay04.ispgateway.de with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.98)
 (envelope-from <mf@go-sys.de>) id 1vd9Vt-000000007Oo-3AYm
 for buildroot@busybox.net; Tue, 06 Jan 2026 17:02:29 +0100
Received: from mail.go-sys.de (192.168.1.9) by mail.go-sys.de (192.168.1.9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 6 Jan
 2026 17:02:29 +0100
Received: from go-sys.de (192.168.1.106) by mail.go-sys.de (192.168.1.9) with
 Microsoft SMTP Server id 15.1.2507.61 via Frontend Transport;
 Tue, 6 Jan 2026 17:02:29 +0100
From: Michael Fischer <mf@go-sys.de>
To: <buildroot@busybox.net>
CC: Michael Fischer <mf@go-sys.de>
Date: Tue, 6 Jan 2026 17:02:21 +0100
Message-ID: <20260106160221.662427-1-mf@go-sys.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-C2ProcessedOrg: 5fa85167-cd6f-46be-bafe-19070fe3dac3
X-CrossPremisesHeadersFilteredBySendConnector: mail.go-sys.de
X-OrganizationHeadersPreserved: mail.go-sys.de
X-Df-Sender: c21hcnRob3N0QGdvLXN5cy5kZQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=go-sys.de
Subject: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.4
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

For release note, see:
http://www.gnuplot.info/ReleaseNotes_6_0_4.html

Signed-off-by: Michael Fischer <mf@go-sys.de>
---
 package/gnuplot/gnuplot.hash | 8 ++++----
 package/gnuplot/gnuplot.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
index bac1cb9d2d..17211ab7dc 100644
--- a/package/gnuplot/gnuplot.hash
+++ b/package/gnuplot/gnuplot.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/
-md5  c897ca69062010e2cf5f7483e39e5acc  gnuplot-6.0.3.tar.gz
-sha1  b31779d6760f432f57136600fc0c2bf65f4d4013  gnuplot-6.0.3.tar.gz
-sha256  ec52e3af8c4083d4538152b3f13db47f6d29929a3f6ecec5365c834e77f251ab  gnuplot-6.0.3.tar.gz
+# From https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.4/
+md5  3a42b32f5d5a003bb88717fce350c3fd  gnuplot-6.0.4.tar.gz
+sha1  b199107483eaa70273d644f1cba259c19e64a178  gnuplot-6.0.4.tar.gz
+sha256  458d94769625e73d5f6232500f49cbadcb2b183380d43d2266a0f9701aeb9c5b  gnuplot-6.0.4.tar.gz
 # Locally computed
 sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index efdc08deae..487985c5a1 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUPLOT_VERSION = 6.0.3
+GNUPLOT_VERSION = 6.0.4
 GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
 GNUPLOT_LICENSE = gnuplot license (open source)
 GNUPLOT_LICENSE_FILES = Copyright
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
