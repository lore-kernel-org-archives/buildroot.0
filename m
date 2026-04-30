Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 766F9CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 19:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F71E41C7C;
	Thu, 30 Apr 2026 19:08:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uV3Z638iwulN; Thu, 30 Apr 2026 19:08:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BD8C41C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777576087;
	bh=8p/AnVab3K/lz5SMzT8SRGhrTgXh5MUpWiX4ZRRhLZ8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=jsPbswbjnOYrcAvNiODfqdk4BAMNvDSCR9ffdggSEJSD5SxRvyh0ePCoY1bCeUrch
	 8I12ecZ2/LvH8nMrBBv30nEHCz5JMTicBruksL3KI3xyqti/kL0n0AZVmRs+qjQ3U+
	 YUkPKkj3dfb0ZMKJ/An432YKWKDOGqvIidSO18eD3pEixmGZGILwR5s/ygQGNaAvY2
	 lg2B2IHfyg1a4n+PNC6omzw3Rr65CZTBhmfs5sfuos2LI42oMt4mtbWIDPlV9Y4Q8x
	 kmmIFNQGBtfcoEq39CVM/iF2IZeSySOMlNJeRLMQ5oM0j9HvLvXZe5RQK3GuPRKG1X
	 6c9F7OPmuYyKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BD8C41C79;
	Thu, 30 Apr 2026 19:08:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0460192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C1C596F4F2
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNik4nMwXMmw for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 19:08:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6B116F4ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B116F4ED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6B116F4ED
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:08:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6D57A4C2D5A;
 Thu, 30 Apr 2026 21:07:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWil-000000000Pg-441d;
 Thu, 30 Apr 2026 19:06:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 21:06:37 +0200
Message-ID: <20260430190647.3212159-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430190647.3212159-1-bernd@kuhls.net>
References: <20260430190647.3212159-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777576020;
 bh=5Yl3yZsESPnL3JlF2q0RAPsyuUABPtsLNyCeNyRtcYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Qod9sYshXNBqAtkynytIx0l+b6/lSx0sP12xQAXJdXofPwjzbotXe5kGW+Z7Tg6SL
 fWyLQ7mBmntBT2Rcff9I3tkzNXT099+p7ZMwHQZs6lI5I+UW2uGUJlEeurt6/ItQXf
 Y8UawSUNy9yAGu16+vkHrzR1DXd3rfZTTeA0ecU9mfcA2fYeWU9s9zZCwinLdfcS6b
 g5nNZh5SkrWh/GUafidMIbpP+ZoYPK4/3eZ8QxzJEFiivl8aOqRZfXu75iZTTtRPjC
 WPJ5Q0OVD3B90kZJ4TkKSkpz5lhPz7HxI36o5PfPUwhkkfBJ3GKbjHMSqwDnZWmVfN
 U1evPROeaU0NQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Qod9sYsh
Subject: [Buildroot] [PATCH v2 04/14] package/dump1090: disable -Werror
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes build error with gcc 16.x:

interactive.c: In function 'interactiveShowData':
interactive.c:334:49: error: '%5d' directive output may be truncated
 writing between 5 and 11 bytes into a region of size 7
 [-Werror=format-truncation=]
  334 |                 snprintf(strFl, sizeof(strFl), "%5d ", convert_altitude(modeC * 100));
      |                                                 ^~~

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dump1090/dump1090.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/dump1090/dump1090.mk b/package/dump1090/dump1090.mk
index 1ecdfca47f..9a18c356cc 100644
--- a/package/dump1090/dump1090.mk
+++ b/package/dump1090/dump1090.mk
@@ -11,6 +11,11 @@ DUMP1090_LICENSE_FILES = LICENSE
 DUMP1090_DEPENDENCIES = host-pkgconf ncurses
 DUMP1090_MAKE_OPTS = BLADERF=no CPUFEATURES=no LIMESDR=no
 
+define DUMP1090_NO_WERROR
+	$(SED) 's/-Werror//' $(@D)/Makefile
+endef
+DUMP1090_POST_PATCH_HOOKS += DUMP1090_NO_WERROR
+
 ifeq ($(BR2_PACKAGE_HACKRF),y)
 DUMP1090_DEPENDENCIES += hackrf
 DUMP1090_MAKE_OPTS += HACKRF=yes
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
