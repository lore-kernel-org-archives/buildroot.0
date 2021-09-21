Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DCCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:21:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3684C61168
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3684C61168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF497400CF;
	Tue, 21 Sep 2021 20:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QJbKOGPioNS6; Tue, 21 Sep 2021 20:21:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16DF3400E9;
	Tue, 21 Sep 2021 20:21:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 513B81BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DE50834B6
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WKDhgHOONkFE for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:21:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E0C682D49
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632255698;
 bh=4Zu91/x8UTMtsmtLsAk+Gq4GDYSc1XvxRNjQWuPXoIY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=INFHMIdbMQpXysZ168QhEnnrDRSRwdSa8ZayOmk9YzxkzlBUa34lwpiCkEngDsX3T
 AO1uRvW+TmZ6IPa+//WB9euziCMbnkrU9PvhrOnf41yw4VEBocI33rXodsLRcaklyJ
 8k1/7Jy7R93x+tC4H1QEOsDbhoRl8sp1WGjpMkbk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.170]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MxUrx-1mn22l1xvd-00xqDU; Tue, 21 Sep 2021 22:21:38 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:21:33 +0200
Message-Id: <20210921202137.7092-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921202137.7092-1-ps.report@gmx.net>
References: <20210921202137.7092-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:+Ma1O6PTC66A+GSIVUACc+As8pPX1TOskGcjefSj1rcgDNGgHY0
 NkyvDMoyyhCJeMBABU2IZfXpDohoavC6khuQRJytJs+xa11/7AY+7nxdUFS2HBIYxCDOEgG
 UqFWZ2nM8Gk11vrgOT8gnIRAeIs5pRbrlxzfWcgKoiltdzD/yszVJtlhRAS6+eIDnjn1fUh
 qUKZWw/BhitFT1qKJ85cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:I13v1jANi+Q=:LWV1Vdr9qPooV/Z8lEyFhP
 GGMpoTA1epTKLiJCLehZ1LZ6MUfo3b36IIKtuYWG4crD1pkifj3ZSY8OpXhP6QFU3WnWcaw2u
 fD7CPgF7ooSl1J1pzFj1WsswI9ES6W0npV2+EiidO5wQLeZ+NZU1Ijj/2/OOpq1G9mAc0WCw9
 /Pm/+C5Gohv5hcQp2Wy5fqAJ2UfUolI0UhNxI/WZApuVpN+8c8EZmGHay7lr+eASMwyQULTHh
 12mrmeOaP0oYAn2JP2eiWkfwp0PC5tdhLB9O/8MVjNtxRKe8a6cFL7O5n5XANmfNyX3ftRxOv
 vQlh7XOx/CfEPWQgpNxxQKiEnDUCQZEFt9LEjFzSKM0+X+FenKJudIcwcY+spdjzS5U+W6Y44
 KfSBeGlf5Em0SluFddL2nj3OqFCN45Oq70oQTvjHqtEnVRMRbnoZkyoZ6g5/71g90h0mD3um4
 CZwRrcRjIM+dvvT7XzL/MMASz/oyUY4/qumKx6IC2bym4Mev009PoZnjQ18smBqP9Hajev5SJ
 IRidXAZ/QlBPNc0Eh13sD7oTgo+RqRu3+C3PxTigw0rhCIsyAu2twytgKwilFkkORvfQPq5ll
 Nhh218VxZrINuRid2ctfM4qyr2tM9lSRHKRSFfJ/3NWcyGwZfVqmIsA5H43Z3VBZYCCj7vWMa
 z5jur9tZ2yOiZxmxmbGYgN30MEojDoCNCWgyFbu4pA9z0Iv022VOArX5HRoEkKpcTWZ0Os8D4
 ZkWIrgtEVGEwW1PLR50nPCibR3+IfJCoUWvD/G9k23tZuikEzpYFsCB7QtpSP5DhuFKebT5Oz
 jtNnwupYlmLaaq1hLRYPWcbppAuKFldwlRYa2THUFVugyq2PRsF9SZ2qO0elJ1LVxfvRpvQAB
 EU53UFbqiTWO2f/y3IwhfHfITqoYQjrfmY5H7FB43vqp83g5c3NPGGSkx/reaRxAH1U0sTRFi
 Y6hr2K07cvadGHh9xmU8OoVghFA8xRgp0N8ROK2PZL/ga/AaQdjREbuxHY6ydGGQ4Wvetb3AZ
 qjCHrmKngvL/blAl74/sENF1yL7tojvoYXr68N+IfHP2qgoAE2H4nvz+5O6Ys+FEx7Vt2+myc
 8+n2Z9eLOCHEw0=
Subject: [Buildroot] [PATCH v5 2/6] board/raspberrypicm4io: enable RTC and
 USB overlays
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- add RTC and USB dtoverlay entries to config_cm4io.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v4 -> v5:
  - new patch
---
 board/raspberrypi/config_cm4io.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/raspberrypi/config_cm4io.txt b/board/raspberrypi/config_cm4io.txt
index 01f60395b3..cf7e6df1a1 100644
--- a/board/raspberrypi/config_cm4io.txt
+++ b/board/raspberrypi/config_cm4io.txt
@@ -24,3 +24,10 @@ gpu_mem_1024=100
 
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
 dtoverlay=miniuart-bt
+
+# enable RTC
+dtparam=i2c_vc=on
+dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
+
+# enable dwc2 USB controller (USB 2.0)
+dtoverlay=dwc2,dr_mode=host
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
