Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDEE107BCE9
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 21:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D2F40EE9;
	Fri, 13 Mar 2026 21:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ipAyv7zY16PB; Fri, 13 Mar 2026 21:51:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD82640ECD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773438679;
	bh=1q3RD6fjYjQE5cwMUMmEBrONZtFk/9+e3mH/0UEPQWg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cinAx0KTdM7Ncyo7ZM0kJaWJ9FAVXyuGfgospjhhVQ6ObHf4JfsyVWh34u/+Ec+q+
	 x4T6rIDYdP+mkmqo6Z4fLDhKEn/Eiufywxd8tc9iepEPPrCVtK71gncoQp9mHo4CTy
	 uDYx18Exh3yvcgB0SrOz2BPmX2qMfBKnDrU0SO7GEzVmM44CcgejAMDKVx0HEuYV+Y
	 DbsVh4H5veE9dmVg5Tl7hMJdHK9KxAO9V/kEEwdJG3iYpx0a58/3ZKow/Jz3vpHag3
	 9YLPfK1Ru69vhi+RAdMtNfN4ZXItJOCStIW1eXNBiZ+qLx4sP7a/7iaqCJpZEb9A0y
	 xyS5JNwprw24Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD82640ECD;
	Fri, 13 Mar 2026 21:51:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 17809786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F196740613
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hoIbCTYbQj6C for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 21:51:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9A494005A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9A494005A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9A494005A
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 21:51:16 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id CBE7019F5A7;
 Fri, 13 Mar 2026 22:51:07 +0100 (CET)
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Philippe Proulx <eeppeliteloop@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Mar 2026 22:50:39 +0100
Message-ID: <20260313215044.2406044-3-ju.o@free.fr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313215044.2406044-1-ju.o@free.fr>
References: <20260313215044.2406044-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773438675;
 bh=wPfx730wp7UsqeTC8CACN53iMwE9gtY6xXdOUpADxW0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sbThRGTmb2h5EPSAmscDhtN/dOGvbqz5Xykpcm7tdabByRLqgDcdT7g8JPIsLrcty
 IuTHrJREUgmODSwK23/HSYyaXdNtfUWmvN1zt6ZG1r70yf3nLjhTsuAcxT55HNRbCT
 c7jP9znQmvnuWSF+icsmphZ+Q64Q44fEE/J9aWAznnu3foicmnvU3SYEzoyzIKjecl
 Q9uXgvnJEjzzr2Y5PVkbSb4VG56PPUblq/2XWsVrSuZcfzpzXBedxX30c+BdZC/KjG
 aHfKHwtZCzWwBQcYFErw2xCkPqBilbX8+QPpn7TMFgI0f3+ztQfUMB/1V6GP7sZ4Jn
 MPtyN1H34CQ+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sbThRGTm
Subject: [Buildroot] [PATCH v2 3/7] package/inih: enable host package variant
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-inih is needed for host-xfsprogs.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/inih/inih.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/inih/inih.mk b/package/inih/inih.mk
index 4d9a8c03ab..c4a897604b 100644
--- a/package/inih/inih.mk
+++ b/package/inih/inih.mk
@@ -18,3 +18,4 @@ INIH_CONF_OPTS += -Dwith_INIReader=false
 endif
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
