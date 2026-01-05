Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66548C79F9D
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 14:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 385DD60A9F;
	Mon,  5 Jan 2026 14:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OX6jSjLeEY1S; Mon,  5 Jan 2026 14:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63739606A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767624087;
	bh=U+3Hj2H9gQ/PNe3/j8InZThUPB6k3useMYlH1uQbABk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=SlTq56T9iij7+B6ovxrEYp7Ol6c41+DrtZesSHmZSlT9kYWRTSwbBjb2jAyWwWC4U
	 2ecv4m/9tsz+HP2ehaiqgGRkYfqTuMTx5xZUv0dZ03sejCUImOWWTQU8iHOlDxrP8r
	 /vR/zSQSDk6pmhgX7Mk5HQbnJiKM/fZjsbBoODSViMRmlcGAhLWtkIKinl/9nbFdyj
	 JGwY+bpaIomd9tcKwP5jrgawpPj0l8PjbIDl9GAwf/R0AqpKoEUTvnEPZ1letb/yAy
	 gz6Z9DhUrxZfqpBvpaVbfzK3fqiHpNvXrQVgJf+Cu13FJll82cxSVgLDeh+ifI/5ot
	 C6CtwdA75Qa+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63739606A8;
	Mon,  5 Jan 2026 14:41:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2F664E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 223CD80BF1
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7zedobdpWKmn for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 14:41:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3EA180BEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3EA180BEC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3EA180BEC
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 14:41:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.30.53]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MCsPy-1vlbTP1BWy-00FMl4; Mon, 05
 Jan 2026 15:41:15 +0100
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 15:40:47 +0100
Message-ID: <20260105144048.16235-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105144048.16235-1-fiona.klute@gmx.de>
References: <20260105144048.16235-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tWNAuNKB6PX3nU1zhansvk3WvjOJbqo+JodOzyHD5gzuM/+8kJa
 +cHQgVGM+TaPR5GeUTRtI/ZlGQATNxFbqctWrQIjwThN/9GrriXc42E+7WZRIYRH7ZSFjFj
 zpWpWFtnem6J2ss8BFtfHP1bXVjqjk2mUDrUDrGs4rPKsnEdoPzYqtdxod8T+beKpI6Pmfj
 2NHconLZeZOcBbmJqrTRA==
UI-OutboundReport: notjunk:1;M01:P0:CsPHfS/JChc=;t1ZV+ftcDzr96CA++8HpsMJFa+N
 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
 F0Gd1p1M=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1767624075; x=1768228875; i=fiona.klute@gmx.de;
 bh=KP2S75kUq6UiLvyqkmexf415d9G0eJ50mgpHvMLEguY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=r16cuJxSq+Mc5n5J3/h9cHbvBaOyakcjysPuHrcA1OpgVgtQk3U2t7eTwyUju5y6
 gbU1dp8AnaTtJb3qe94CsmSk1WL40KhUQQ6oE2qbbya70svOv3PP4xbQnqf1xKf1g
 VLMQopyKzpUgW0NSi89w0T+TlAx9a9Rbh+9wKx067pNKanh3oImdObRZFwpb5+V6C
 07Vglyvv6pMRUY4y+ZpbnZXZG1Mm/mc00Bs3EG0jdtW2tDssNZHrxQMqQXA/1OUuK
 EU71I1b1zE+yrujN4g12zr5FqEUpjpLDuNd7GoHAjXxbf/vOlJbsNJfssrgGsdbXI
 azeYasUiS6jhH7v33g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=r16cuJxS
Subject: [Buildroot] [PATCH v2 2/3] package/python-memray: add config
 comment in case of missing dependencies
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package was added in c2df8bab97d7f7b8b61ce055b4820ceb1bd34a48.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* patch added

 package/python-memray/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-memray/Config.in b/package/python-memray/Config.in
index afd0adc901..831dfe2957 100644
--- a/package/python-memray/Config.in
+++ b/package/python-memray/Config.in
@@ -17,3 +17,8 @@ config BR2_PACKAGE_PYTHON_MEMRAY
 	  A memory profiler for Python applications.
 
 	  https://github.com/bloomberg/memray
+
+comment "python-memray needs a toolchain w/ dynamic library, threads, wchar"
+	depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
