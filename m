Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22989C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:43:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D795E60C49
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:43:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D795E60C49
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81E4380DCC;
	Mon, 25 Oct 2021 08:43:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XTXbWvKZqV2P; Mon, 25 Oct 2021 08:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 099E380DCE;
	Mon, 25 Oct 2021 08:43:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 97AC41BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9272540368
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gwwFjtjANPo3 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 08:43:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8BFD40160
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 08:43:25 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id 3so9494940ilq.7
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 01:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UXOSbX+vIFn0vtvSRVchCr7BeEecDoDRQvSUCJ8v5J4=;
 b=qNHa8EZSDBllZtP+XtjcVs+Lf3zjf3ZuNJ7fWlaMC5bMACdxFa5zXiHPrVzkKrtvha
 l1mrjlNwBYJS37ymSWy2YuelzGQzgjQpeapKlX8Z/qFJT+z/fcwAGk/yWM/BKFSx+P85
 8CqVtsyoHkRs5O3KJ/uwdIveMdJ6nEym4EfkuoFrstsE5Dy8NDy99cmq8CHRgvkziXdX
 y/T6EN5j4nrNzbsIxFO+sVgYm5ofhlFG6NNky1fUi7p8vdRKRe+yFIgd731Vn7clXjlw
 F6Uv425IkP3QpYrmbZ94ViiarpCRg6yKqrf0PYJHNts9Niofm7XbCglW8QSKDufRCzlm
 95yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UXOSbX+vIFn0vtvSRVchCr7BeEecDoDRQvSUCJ8v5J4=;
 b=5Nao2Jmfr3wd50Zo4+cdBW2lTinfe2g1OkWxHWJj9SkUou3EX26EVG11UCLxusKJFs
 MqPP5V1hR6yASajLWTa0bk1IbEYMbElKHeBLJVWU9DmCJUmW3BKUCW5PQl9tf8x76tkx
 KkYNKESml9oxfexnfUToXbO/OCrHdzmJd2T04m89guNxCuWgrqgGF6q5A/NhalnTZBBh
 za24GKSNgNKanqpMQDZLTplgFCJyrU9xlXoSlGDVsTDGlIq683xIs9dLyn/NRtSZsMCV
 Ld/wVvKrzDkgOV2OGV50i9n53eAo+bdeuLmOy5lQhBDKF1zSQKppq7QnYGrPMw24movh
 HJHg==
X-Gm-Message-State: AOAM531p1NgwTqW++1inbG6RkYvv2wV7dDlPoLJAdq0BL8hJBoXlkHj6
 UvmY+vYf0v7L2QEZXfOBUd3ZVwvTAxc=
X-Google-Smtp-Source: ABdhPJzHJejWknApDhKtb812NwGltRVpDDhLXL3Beka1WndoAutXqKQwlPkWsZnYX5gN2xOzhcJZZg==
X-Received: by 2002:a05:6e02:20e7:: with SMTP id
 q7mr9659066ilv.254.1635151404910; 
 Mon, 25 Oct 2021 01:43:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id b10sm9084446iow.34.2021.10.25.01.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:43:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 02:43:10 -0600
Message-Id: <20211025084310.4055707-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/weston: remove launcher-libseat
 meson option
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This option only exists in main and is not in a release.

Fixes:
output/build/weston-9.0.0/meson.build:1:0: ERROR: Unknown options: "launcher-libseat"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/weston/weston.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 69ee11d23c..6dd5439291 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -26,13 +26,6 @@ else
 WESTON_CONF_OPTS += -Dsimple-clients=
 endif
 
-ifeq ($(BR2_PACKAGE_SEATD),y)
-WESTON_CONF_OPTS += -Dlauncher-libseat=true
-WESTON_DEPENDENCIES += seatd
-else
-WESTON_CONF_OPTS += -Dlauncher-libseat=false
-endif
-
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
 WESTON_CONF_OPTS += -Dlauncher-logind=true
 WESTON_DEPENDENCIES += dbus systemd
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
