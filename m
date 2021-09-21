Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B435C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E653D61107
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E653D61107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 603EC4042B;
	Tue, 21 Sep 2021 20:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1ZWgkOgSHOwD; Tue, 21 Sep 2021 20:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CF6B40172;
	Tue, 21 Sep 2021 20:22:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 541C61BF995
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40BE7406CE
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-rWwAdMEon2 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:21:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35B8F40661
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1632255699;
 bh=/3ZzGz9h2p+s8F9rJR3UrTviKm5EsBYdGI4s1/5N1Ow=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EWp/A7vhem7NH1mjcOvFJP7Gnl0S1/rCE3OlvCYKlxCOB4thj1zJqauSov5sFJ+vW
 gGFqpFQk4XECOcKLCLI1Rkm3hL6byqhSn+4M7pPC1alPW5AYjxNXw7UCh9z6gJC6wu
 4OQayJvUwEQh2piMNn/q/pOPIUiXbU23PpLpSGZY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.170]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MfpSb-1n4Yvb3Ox7-00gJMi; Tue, 21 Sep 2021 22:21:38 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:21:34 +0200
Message-Id: <20210921202137.7092-3-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210921202137.7092-1-ps.report@gmx.net>
References: <20210921202137.7092-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:jzplgDuyIJq/TrS7SJQ1EXqwnZWXxV3wHlFCQM9igYXLZcC4Six
 hiZbBFu75eTa7K6g4wxJgxzb9YYiVQf/uBCnr/0ojs6rCWN+Uo5ZvU1YSHaOSL4cNhFIQGH
 BZQ3aplsWlfZOluaXo/qb4MeOXhYFxvyni9XGbpfX70+nZr/5jMUGQU/N02xwDamhLL9x5y
 1c3YZGHhOVMoczTvljZMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tdrFPrLfkR0=:+I0P951SSDimPlyyg40QHa
 iy6o21bp7IFnmgzBSM8v4gjqyOQsBsH/63w08tTIiWWN9xzQPkfsD/8+3hA8zhws7nbnntyZ2
 PHEYgBmraIFJzIx1PEwpO2P5T3LB7ZRKEyUy2JldzJXd5XhWdKnoSm3ic/1mZjClp2mZESVTW
 oqRVfhjax3QFtGBUJgAFznN9ZzIFoNtMygWTWOutfP48D2kS2ysjIcuN/PWpnQ3XLChLMzZ67
 CvK6rRMOJpf/ozZ2pCKL7A6+RT1WHJ5l+PDqYuKMh6K7R8ta6e0Ov/NQoQ6uw+WFpqAxB0f7t
 yeakke6IVMVNStUJGzlB0XLj3+LYWE2kUWOpnAgm2uN3p6TlfxOEOmsusVPRgcEirSzWHplMW
 eLYJ+S2rcsvKA1oGiknh+m9BR2O+xuILcZ7Wp/aXHBTTb3M2NphwNFyJoYGVyErL1tUj+lfgm
 Rl9YObgrHrJEjQ3kxVg1qS165GwhA6Ug6NUnGoLbLWD0cegyYeblhF95QBo3ipbGa+7UUkOyi
 mE5I69oARcOpearyqSwqgMkaUyAtmq07oMvscJ5w2qmIfiF4Zxf6q/oktS+ZvlX8PBdV+4XJu
 v0uGPi1U8Pn1w2m01PVoLKanKS4zyPaWLTJwQAXldPRwqI2HheGrsPjnGIMTDn4rFHtQxg0GI
 4WP26/mmCFfCC7U0bmbl0ErXwJdYGuANt5RV5e21qIIOnfh7qd2mxF6dfbKNxcHMvKg+Ywe5b
 zH3mt83w+YhqdF4PpgyvfsYlKgXLpIB4yjVDXVLy7GKrosSe+G16ZPUAZ6YtqOS9uXLg7mw6S
 /Q9aF2Y9IYpCpBxK0JLu/1FgppfBDoRth+2i4zVbZN5t2ywzNCyHYREDoRl/0jSBvxSOeZxR9
 +IMwiTp3gEG5g7Qh8bp6EvRuD0y06OGOT3YhdSqDE9Q6nfM8TS8M4GC9bOU4kEatSqjBm/k++
 /wb/yT3+UlPHFVtfShn7+u28jJah3wmAgeaoHANqXT64eP+/Usy/gJYcWGd0nmP8hSnZqhnxW
 ciWRN6y8adNmdp8P3st91tbHlqwJggfcw/p2xDZe+cKXBnkpUdZ33K5Cep4XjYhGgx3Z/Ph9u
 NHw/NCcQb97ADU=
Subject: [Buildroot] [PATCH v5 3/6] board/raspberrypicm4io-64: enable RTC
 and USB overlays
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

- add RTC and USB dtoverlay entries to config_cm4io_64bit.txt

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v4 -> v5:
  - new patch
---
 board/raspberrypi/config_cm4io_64bit.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/board/raspberrypi/config_cm4io_64bit.txt b/board/raspberrypi/config_cm4io_64bit.txt
index 6cd8a729cd..813f6eba7b 100644
--- a/board/raspberrypi/config_cm4io_64bit.txt
+++ b/board/raspberrypi/config_cm4io_64bit.txt
@@ -25,6 +25,13 @@ gpu_mem_1024=100
 # fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
 dtoverlay=miniuart-bt
 
+# enable RTC
+dtparam=i2c_vc=on
+dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
+
+# enable dwc2 USB controller (USB 2.0)
+dtoverlay=dwc2,dr_mode=host
+
 # enable 64bits support
 arm_64bit=1
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
