Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EF7C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29C9C81366;
	Tue,  6 Feb 2024 19:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O_khcwiQ0lay; Tue,  6 Feb 2024 19:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 394B0813F1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 394B0813F1;
	Tue,  6 Feb 2024 19:26:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D5C01BF2FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27DA760DFE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hHyVsILpPjB for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.89.224.132;
 helo=mx1.sberdevices.ru; envelope-from=ddrokosov@salutedevices.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9AAC760BE8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9AAC760BE8
Received: from mx1.sberdevices.ru (mx2.sberdevices.ru [45.89.224.132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9AAC760BE8
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:26:00 +0000 (UTC)
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 8F400120014;
 Tue,  6 Feb 2024 22:25:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8F400120014
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Tue,  6 Feb 2024 22:25:57 +0300 (MSK)
Received: from CAB-WSD-L081021.sberdevices.ru (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 22:25:56 +0300
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, "Yann E . MORIN"
 <yann.morin.1998@free.fr>, Herve Codina <herve.codina@bootlin.com>
Date: Tue, 6 Feb 2024 22:25:32 +0300
Message-ID: <20240206192543.7179-1-ddrokosov@salutedevices.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183246 [Feb 06 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7
 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Tracking_uf_ne_domains},
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 100.64.160.123:7.1.2; salutedevices.com:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; lore.kernel.org:7.1.1;
 smtp.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, ApMailHostAddress:
 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/02/06 18:28:00
X-KSMG-LinksScanning: Clean, bases: 2024/02/06 18:28:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2024/02/06 15:39:00 #23379857
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1707247557;
 bh=aymIvUSqAucl7+smfH+nEOoy6BVbxB0M0yFiznYSTis=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
 b=sXKu2CRmoVzlj/0Tmliw3WA9RU9VtT5bJ8elHh3KS/969NE+WT1cpYXISZtCkRiRY
 L5/F3YSCLCCdRFW2l1zbKLOBAiTpV5Z/FMWOeVsBPBf6CasSfnzkQ6ZVkgWv5kGUX5
 MDW9izr9784KGVkYiPhUu9WU9MvEzVcsWltL6Q70pfYqsv/V0Fy1Ylmxaom8qGyIHS
 DdZ8baItwyi0YOkinRVrz7nzqSbm58ndP3XZk0TMdYfTli7BIX4PPIigiutyh3a+XA
 tcTRe4yYBZxgPgiQDqYkSTRxtqMumUi0XdPhqRH+Jmi/z1WLLmTU4qKbl5+tU8iPHc
 LI+sJGVkRXaRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=salutedevices.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=salutedevices.com header.i=@salutedevices.com
 header.a=rsa-sha256 header.s=mail header.b=sXKu2CRm
Subject: [Buildroot] [PATCH v2 0/2] package/linux-tools: introduce linux mm
 tools
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
From: Dmitry Rokosov via buildroot <buildroot@buildroot.org>
Reply-To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Dmitry Rokosov <ddrokosov@salutedevices.com>, chopps@chopps.org,
 sdfw_system_team@sberdevices.ru, kernel@sberdevices.ru, rockosov@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This toolset was designed to facilitate the testing, monitoring, and
tracing of various things with virtual memory, pages, and slab objects.
It is an invaluable resource for identifying and analyzing
memory-related issues, such as leaks and bottlenecks, and can greatly
enhance one's understanding of memory utilization within a system.

Also this patch series includes multilib build support for all
linux-tools.

Changes v2 since v1 at [1]:
    - instead of comparing kernel versions, verify the presence of the
      tools/{mm|vm}/Makefile
    - add multilib build support patch for all linux-tools

Links:
    [1] https://lore.kernel.org/all/20230609113415.13856-1-ddrokosov@sberdevices.ru/

Dmitry Rokosov (1):
  package/linux-tools: introduce linux mm tools

Konstantin Menyaev (1):
  package/linux-tools: multilib build supported

 package/linux-tools/Config.in                 | 18 ++++++++
 package/linux-tools/linux-tool-gpio.mk.in     |  2 +-
 package/linux-tools/linux-tool-iio.mk.in      |  2 +-
 package/linux-tools/linux-tool-mm.mk.in       | 41 +++++++++++++++++++
 package/linux-tools/linux-tool-pci.mk.in      |  2 +-
 package/linux-tools/linux-tool-perf.mk.in     |  2 +-
 .../linux-tools/linux-tool-selftests.mk.in    |  2 +-
 package/linux-tools/linux-tool-tmon.mk.in     |  2 +-
 package/linux-tools/linux-tools.mk            |  2 +
 9 files changed, 67 insertions(+), 6 deletions(-)
 create mode 100644 package/linux-tools/linux-tool-mm.mk.in

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
