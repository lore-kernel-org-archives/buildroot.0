Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9094EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CD1E60E60;
	Sun, 19 Jun 2022 16:49:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CD1E60E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYJ5-a34HDKL; Sun, 19 Jun 2022 16:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A2BE60B15;
	Sun, 19 Jun 2022 16:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A2BE60B15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 190071BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01600408D2
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:49:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01600408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O4pdrwIiH9BB for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:48:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11F5540943
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 11F5540943
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:48:58 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w17so11643611wrg.7
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 09:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K57wG3E9AaFQgTdjNVSx2Kpruq11F1lurU1LapmD0m8=;
 b=vs6OBQZl8wA06470tsYFjk4rhU3Rr+LtYNaRToNwy8lG7qyapcs0Cuw4cnkW0JwcDq
 /X53FC5Ycn8x6KCdM8FGSNaSobU5NtxJPmNOPH+BE64BoEtbWgw+71iDd5HmvEARPZGP
 70fjmeXnrsR6RoH9bnOn3v0wdzPgTfdORqC1xAmgJEzWA3/bPI96OuuXtbT6mp/6W3l2
 Ak9w3r3m9KeoJCwUlnfzGQgYFiNTNoaVmRNkhCwbjHIAvroKkpkSJ+ViKen/PaWkA4vZ
 Zb5MLNWV0Rmk4+eFuvG9SQyKfbiND6dAqnfqPvBZCSEk5XRk6kW+kqd2I8qRBtFhJ63e
 3hZQ==
X-Gm-Message-State: AJIora/EaeZTp3WyXMEYaeEd6CkYmR5DTMpc0KGbx8Kxj8zrADbv/dLX
 r10XNW8EM96sC/z9f2oZT3noxbwiHc0=
X-Google-Smtp-Source: AGRyM1vW8DCzNdPtaA55+OYSUO6tO/OpWIcDJTAvstOsQ9e5heCcZau/U0eNaZHGJZ4uFN4vnNdXag==
X-Received: by 2002:adf:fec2:0:b0:21a:6cff:a4f1 with SMTP id
 q2-20020adffec2000000b0021a6cffa4f1mr12664686wrs.139.1655657337184; 
 Sun, 19 Jun 2022 09:48:57 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 f123-20020a1c3881000000b003973ea7e725sm19815285wma.0.2022.06.19.09.48.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 09:48:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:46:10 +0200
Message-Id: <20220619164610.649145-4-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
References: <20220619164610.649145-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K57wG3E9AaFQgTdjNVSx2Kpruq11F1lurU1LapmD0m8=;
 b=i8WKpk2SILguYw4S/F385meTM5yw4Fqg2hO9DPjb7LRb9iKPMbW//mHPEu+5BvSeGm
 MherGas9Li8OHOzf7z5bf2I9r32s0TqYOPviOp/ACQvLuDxNAyk8gCcGcKLqQhPAbfC6
 VYY4JXk99vXAT5RNGpfNuhyd9QV5u7QluexntAtdB1UK5mPCU5I3D/YQPtKd/NRaQgCi
 UuLFB5bmbpPPrBegirsdE2ReA5dzaXjREaNuTfFyQgJ129ZPvEIdnUJoRV4Kr6eoAOg3
 zb5XEZC8VobG9iCsGmm+JFgRg/LrTcDXs6sRrotpoaxlRMBP3FhpWSGVmyhDhI9A+wdZ
 3lew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=i8WKpk2S
Subject: [Buildroot] [PATCH 4/4] package/rsyslog: add libmaxminddb optional
 dependency
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 1fa03bf135..741d090d55 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -88,6 +88,13 @@ else
 RSYSLOG_CONF_OPTS += --disable-libgcrypt
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+RSYSLOG_DEPENDENCIES += libmaxminddb
+RSYSLOG_CONF_OPTS += --enable-mmdblookup
+else
+RSYSLOG_CONF_OPTS += --disable-mmdblookup
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 RSYSLOG_DEPENDENCIES += libpcap
 RSYSLOG_CONF_OPTS += --enable-impcap
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
