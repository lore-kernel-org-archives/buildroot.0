Return-Path: <SRS0=17BZ=NV=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06030C432BE
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:41:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEDB060F5C
	for <buildroot@archiver.kernel.org>; Mon, 30 Aug 2021 04:41:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEDB060F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C1D140412;
	Mon, 30 Aug 2021 04:41:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qjyzsv4aHOvq; Mon, 30 Aug 2021 04:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B814041A;
	Mon, 30 Aug 2021 04:41:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1515E1BF2F4
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 056E0606EF
 for <buildroot@lists.busybox.net>; Mon, 30 Aug 2021 04:41:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsZ5lMLL26gv for <buildroot@lists.busybox.net>;
 Mon, 30 Aug 2021 04:41:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABB0B60759
 for <buildroot@buildroot.org>; Mon, 30 Aug 2021 04:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1630298464; x=1661834464;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=37MoRX431DXL+aQl0Cqp22J+CiiAM+6cV53ND3bxqZs=;
 b=ETisq4C1H76qWIapdBHgcf6DaMv7ChxjeW+6Fyr674+7zqxmPyGNT9jh
 gb70sW+pmW8O0WezqrHZndrlOrrJIyrhofk94qJ1ciWNNmk16Nfe8hsqU
 nlNztbEGd4Rzot/JWeO/ehHIRMlVq9XZoLEhq0MGUy7MEQqoLmuYM1exL
 k3moXJqetPKmZbFd8FPa2PKkmaC7mrnvf73k6uRnc0AwlHG1FbVHeuA2U
 8nLckTvmOvTYGKHlbBeVh/VSg8shbkMgsxrwkkiweMFHsHDeFh9frQTnz
 6nrcfI/wRl9xjApM6YO2sdN5bM4khxifXh46LUfHxHSHrppD4i/u42Otk g==;
X-IronPort-AV: E=Sophos;i="5.84,362,1620662400"; d="scan'208";a="177842484"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Aug 2021 12:41:04 +0800
IronPort-SDR: xsU0jzXulOfwEyRREOlDidLiK0+hPSQi7aYTaZZPMlkZsb3L0HHnk1n20ayd3U0GfWCWuTCzPN
 1J0X/nIbo3kzSyqkWy4RGeA/JUoEzBM8LRxSBwsfBAQ4VHziBm0srZ3Zs8J29BnyYmnS9lssad
 nezNEjYOyBKV1qFNZOVuEue60776/IyCsNlvzpUOEv8Y94NQxTn4shQ6PGPukD6RMkE6AyYgtX
 V10Uf1RS8tJkbx02y3jBRPbaEhzBlBQd/DCB0b+z62KIBIRPTkpLpMirgGQUgnP9r6mmV1SMIm
 eNPOMHpGt+sjcUtjISiUOseF
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2021 21:17:55 -0700
IronPort-SDR: ZVHHJhMctBlnjyJjOjxOQOKCPq3qfQj1orzkDVl62JTzqr3X2AIWMsdvPmItcZXJ1FQlmTwuti
 aEcALGg2Oxn0HA1D3KPmVFuh20zPbeYzyin2JA0gB0DJJVJFSbWDs1K3l0zROyJTcZLW0LVucy
 goRBSjyFQszXfuUlg9ckms7+pAXo+HNZ5rdW5xq9RB+cJUCTncCho44blbYENfw2EQsUhU0AMV
 U8KY1JaIfhoPuqHn+FyS2kzpy798HvnLXh49EDxuj2dWBwHIRI0mowKfeD7WkBKA8cu0mMjYxD
 1iE=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.119])
 by uls-op-cesaip02.wdc.com with ESMTP; 29 Aug 2021 21:41:03 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Aug 2021 13:40:53 +0900
Message-Id: <20210830044100.260173-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830044100.260173-1-damien.lemoal@wdc.com>
References: <20210830044100.260173-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/9] package/Makefile.in: Fix NOMMU RISC-V
 64-bits toolchain base name
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

From: Christoph Hellwig <hch@lst.de>

Using *-uclinux-* seems like an only partially followed convention.
And at least RISC-V 64-bits gcc does not know about uclinux tuples.
So switch back to the normal "linux" one for now.

Signed-off-by: Christoph Hellwig <hch@lst.de>

[Damien]
* Make the change conditional on BR2_RISCV_64 being "y".

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 package/Makefile.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 86db62ba5b..5b25ea7c7a 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -39,8 +39,9 @@ endif
 # Compute GNU_TARGET_NAME
 GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
 
-# FLAT binary format needs uclinux
-ifeq ($(BR2_BINFMT_FLAT),y)
+# FLAT binary format needs uclinux, except RISC-V 64-bits which needs
+# the regular linux name.
+ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
 TARGET_OS = uclinux
 else
 TARGET_OS = linux
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
