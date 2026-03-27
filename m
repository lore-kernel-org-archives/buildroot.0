Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F53810F2853
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 16:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33F2A613A9;
	Fri, 27 Mar 2026 16:53:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8nRyt7vPLIw; Fri, 27 Mar 2026 16:53:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CC766139B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774630403;
	bh=8/VjpRDUQD12HyyYwJsTuwRBftk/qhuS/wEv04ds33Q=;
	h=Date:References:In-Reply-To:To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Kbe8xeRSmA2KLxXHuKk0fl7opK6+xxjg5yV9FdehRsfcMYlwXBwlv905iD4TVGbg7
	 vUZNvbFL7H/tfwGaB9mi76SKJr2kFHNchplXmKlZVrPWTzh9kGEK2rHc3AykWvWelv
	 KFvdKjb6aE0DTHdUylp2Kq7W/1oPlR5qGmqhGCgMG26xTEtmV4v2DxmPwJvVt4MPHJ
	 QPR5A9+YUBBVTObFTLdSLaKUT1kHKxDJX+O8BlzZ7appeukxPDfLE+jdmYFYYTlr29
	 kIC/ykrewtX0r4moyY+VpD2DlGpeVfCYqpjSElYMTsiJ3bH11MsqtgOqgFOJ33MGfX
	 XI+d8txnZzzgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CC766139B;
	Fri, 27 Mar 2026 16:53:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 094492AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06F7C40C84
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31A0-Gkyocmr for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 16:53:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.125.25.8;
 helo=smtp-1908.mail.infomaniak.ch; envelope-from=foss+buildroot@0leil.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CCD9840182
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCD9840182
Received: from smtp-1908.mail.infomaniak.ch (smtp-1908.mail.infomaniak.ch
 [185.125.25.8])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CCD9840182
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 16:53:19 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch
 [10.4.36.108])
 by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fj6Cd5h9FzJ9f;
 Fri, 27 Mar 2026 17:53:17 +0100 (CET)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fj6Cd0NTdzMRG; Fri, 27 Mar 2026 17:53:17 +0100 (CET)
Date: Fri, 27 Mar 2026 17:53:02 +0100
MIME-Version: 1.0
Message-Id: <20260327-qt5-5-15-18-v2-1-4c98e853266a@cherry.de>
References: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
In-Reply-To: <20260327-qt5-5-15-18-v2-0-4c98e853266a@cherry.de>
To: buildroot@buildroot.org
X-Mailer: b4 0.15-dev-47773
X-Infomaniak-Routing: alpha
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=0leil.net; s=20231125; t=1774630397;
 bh=HYa6q+2L3G9qW2JZBKFnplHlXiwrULD7k7Y3gt8ygkI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=B4LFDfNkzHW5OZBmb78JaeZu13JU7k15ZXclsZmJObbvmIrIuKiOsGSmhihnNKoO/
 wSnVvTZhZ2aLXAAnepOL8Cxbj5irl9coMb7C9z/hEAdQMv3lAvPJFlPVsUQKX3964d
 ROhPiG/0MGoTbDs1BiHmNiUmNyFATWOsBAI2rWhnT4/AswrlitHTuE6dU/LWXii63+
 8cafVeis9p2q/Y/uqdJ8ytfh6D2ZGEKBFICpkq9AExmE3CHSXtzgJtM+retlBa2iWJ
 mUQ8u5QnAT3ebhhlAxLoW8uJDg2a63fP8YtF9t1sVD3V305G/Y8xEAQ9UcjaaRZ9ok
 q6QMh1NV/vF+Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=0leil.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256
 header.s=20231125 header.b=B4LFDfNk
Subject: [Buildroot] [PATCH v2 1/5] package/qt5/qt53d: disable assimp
 support when BR2_PACKAGE_ASSIMP is not set
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
From: Quentin Schulz via buildroot <buildroot@buildroot.org>
Reply-To: Quentin Schulz <foss+buildroot@0leil.net>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@cherry.de>

If we don't disable it, the assimp module from the sources will be used
instead of none. Unfortunately, it currently doesn't build so let's
disable it when BR2_PACKAGE_ASSIMP is not set such that one can still
build qt53d.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 package/qt5/qt53d/qt53d.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 8d9babd704..459b019902 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -11,8 +11,14 @@ QT53D_DEPENDENCIES = qt5declarative
 QT53D_INSTALL_STAGING = YES
 QT53D_SYNC_QT_HEADERS = YES
 
+# command line argument separator
+QT53D_CONF_OPTS = --
+
 ifeq ($(BR2_PACKAGE_ASSIMP),y)
 QT53D_DEPENDENCIES += assimp
+else
+QT53D_CONF_OPTS += \
+	-no-feature-assimp
 endif
 
 QT53D_LICENSE = GPL-2.0 or GPL-3.0 or LGPL-3.0

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
