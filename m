Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80371C7EE29
	for <buildroot@archiver.kernel.org>; Thu, 25 May 2023 13:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D7E61693;
	Thu, 25 May 2023 13:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D7E61693
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oF9NpZ7nDBsm; Thu, 25 May 2023 13:24:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1962F61684;
	Thu, 25 May 2023 13:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1962F61684
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9192A1BF277
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 13:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 670A8830E3
 for <buildroot@lists.busybox.net>; Thu, 25 May 2023 13:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 670A8830E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hkMQj2Nq299S for <buildroot@lists.busybox.net>;
 Thu, 25 May 2023 13:24:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A4B981E11
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A4B981E11
 for <buildroot@buildroot.org>; Thu, 25 May 2023 13:24:03 +0000 (UTC)
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
 by mx.sberdevices.ru (Postfix) with ESMTP id 23A825FD48;
 Thu, 25 May 2023 16:24:01 +0300 (MSK)
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru
 [172.16.1.4]) by mx.sberdevices.ru (Postfix) with ESMTP;
 Thu, 25 May 2023 16:24:01 +0300 (MSK)
From: Sergey Romanov <svromanov@sberdevices.ru>
To: <buildroot@buildroot.org>
Date: Thu, 25 May 2023 16:23:51 +0300
Message-ID: <20230525132353.89399-1-svromanov@sberdevices.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30,
 bases: 2023/05/25 04:52:00 #21357441
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sberdevices.ru; s=mail; t=1685021041;
 bh=zdZ3RiN1O0/ZjQSQff1koSVe4TsS6H8W3Qc4a1fe2VI=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
 b=hF+v+K+Pjipmjc+WJixQlPxnrn6yjmlcl6DKz2el08ecWLg68358+rB+areB3HPvW
 bKjd/MrFUbexmZETlFzQIrdCfLpt7wmc2u7g2qrNv6YOtZY0uGj3fP/hA/k4vigp/P
 J9eM4nu8NE8ei7DGaaOp3RbQIbirMPGvgMIktrfZlrGBCYS5K51NO+nT1UNzK2do94
 +0RPgnjQlVNaSG46gpsVkgO4O2rHafM2Ux3rIRP+9iguYLMedlTmY632mlajaihfEi
 vhx3lpWu2fmwOOFxNjr6HYkiVAVAkjoPRrXnB/yIzST0AXEe5acoxKgqbS1PNm6Me2
 R9ZHwtKB5iNVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=sberdevices.ru header.i=@sberdevices.ru
 header.a=rsa-sha256 header.s=mail header.b=hF+v+K+P
Subject: [Buildroot] [RFC PATCH v1 0/2] Added package: 'sysbench' and its
 dependency: 'ck'.
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
Cc: svromanov@sberdevices.ru, chip-club@ya.ru, akopytov@gmail.com,
 sbahra@repnop.org, sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Sergey Romanov (2):
  package/ck: new package
  package/sysbench: new package

 DEVELOPERS                                    |   4 +
 package/Config.in                             |   2 +
 ...oid-buildroot-s-influence-on-LDFLAGS.patch | 187 ++++++++++++++++++
 package/ck/Config.in                          |  23 +++
 package/ck/ck.hash                            |   3 +
 package/ck/ck.mk                              |  42 ++++
 package/sysbench/Config.in                    |  28 +++
 package/sysbench/sysbench.hash                |   3 +
 package/sysbench/sysbench.mk                  |  30 +++
 9 files changed, 322 insertions(+)
 create mode 100644 package/ck/0001-avoid-buildroot-s-influence-on-LDFLAGS.patch
 create mode 100644 package/ck/Config.in
 create mode 100644 package/ck/ck.hash
 create mode 100644 package/ck/ck.mk
 create mode 100644 package/sysbench/Config.in
 create mode 100644 package/sysbench/sysbench.hash
 create mode 100644 package/sysbench/sysbench.mk

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
