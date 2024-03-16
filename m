Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79953C54E5D
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 08:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1042A4176C;
	Sat, 16 Mar 2024 08:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mzcTAH39nRrT; Sat, 16 Mar 2024 08:44:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C352C417B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C352C417B6;
	Sat, 16 Mar 2024 08:44:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E8EC41BF853
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 08:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4F83417D5
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 08:44:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjeUTH3FCuz3 for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 08:44:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52459417B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52459417B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52459417B6
 for <buildroot@buildroot.org>; Sat, 16 Mar 2024 08:44:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b99a.dip0.t-ipconnect.de [84.161.185.154])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 77BAAA4C23A9;
 Sat, 16 Mar 2024 09:43:36 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48402)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rlPdg-000000002v5-0Hso;
 Sat, 16 Mar 2024 08:43:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 16 Mar 2024 09:43:32 +0100
Message-Id: <20240316084335.20839-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240316084335.20839-1-bernd@kuhls.net>
References: <20240316084335.20839-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710578616;
 bh=f7MmChDJogxeHFwOvcwy3w/psqP3IlIV1SEJVtuu7gU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R803RtRi7kHXmrqovuhyyWXZy1QyiP+6Xdx238HLCZjMya91B9NiGbK48GtdB2pEW
 WQbkzARbc4dJavN7t95SRuOAPvnL0gPRGBe0e+nTbWegskAd3JwWocXRvVqjFh0xP4
 U7i3VNZc1QEYOTOHoWBPaGMXlEMTGwNswIUg/Kn4iMdtjHBS93g1WGIjhNKJaoFJT0
 /wA4z9aFDQTN4y0eR5QNB59dWARxx5lHI3R1JWLaZ9z8yIL9+sTSHtBcpBoldMm0Vb
 Ls7gEBna6AT5YdkCh/a36SY6dLR3T+IkywazRzPrqQIzOMxe+9IDAJHY8IzbAmDKbU
 2AAOifa5etV2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=R803RtRi
Subject: [Buildroot] [PATCH 2/5] package/busybox: disable tc to fix build
 with kernel >= 6.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see https://bugs.busybox.net/show_bug.cgi?id=15934

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/busybox/busybox-minimal.config | 3 +--
 package/busybox/busybox.config         | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/busybox/busybox-minimal.config b/package/busybox/busybox-minimal.config
index 1e7ad1d357..5d2a30806a 100644
--- a/package/busybox/busybox-minimal.config
+++ b/package/busybox/busybox-minimal.config
@@ -955,8 +955,7 @@ CONFIG_PING=y
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
-CONFIG_TC=y
-CONFIG_FEATURE_TC_INGRESS=y
+# CONFIG_TC is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 6e8bd2799d..cfd16172fa 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -968,8 +968,7 @@ CONFIG_FEATURE_FANCY_PING=y
 CONFIG_ROUTE=y
 # CONFIG_SLATTACH is not set
 # CONFIG_SSL_CLIENT is not set
-CONFIG_TC=y
-CONFIG_FEATURE_TC_INGRESS=y
+# CONFIG_TC is not set
 # CONFIG_TCPSVD is not set
 # CONFIG_UDPSVD is not set
 CONFIG_TELNET=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
