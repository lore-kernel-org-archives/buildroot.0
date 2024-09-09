Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2E3ECE577
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 18:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 836BF408C4;
	Mon,  9 Sep 2024 18:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZYK8ItyroZQ; Mon,  9 Sep 2024 18:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88695408CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88695408CA;
	Mon,  9 Sep 2024 18:21:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3CBF71BF33E
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A74B80529
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 18:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsIt8tlbnauj for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 18:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=975aea9dd=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F17E380523
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F17E380523
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F17E380523
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 18:21:14 +0000 (UTC)
X-CSE-ConnectionGUID: YqfJYbN6Q4WV9nGa2Bo0Aw==
X-CSE-MsgGUID: 1arrr5qBRUu9n/gKUfZNZg==
X-IronPort-AV: E=Sophos;i="6.10,214,1719849600"; d="scan'208";a="27081565"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Sep 2024 02:21:13 +0800
IronPort-SDR: 66df2fbc_8JS3x6oSzAtbDkib4oin7xvLBMRAymzt9UO2QBtI6v1fgmd
 QRww8eeG+XoizmrUQq/bIgKBB8BWdAPENSnlZ2g==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 09 Sep 2024 10:26:20 -0700
WDCIronportException: Internal
Received: from unknown (HELO ryzen.wdc.com) ([10.224.3.254])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Sep 2024 11:21:11 -0700
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 20:21:01 +0200
Message-ID: <20240909182103.3667296-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1725906074; x=1757442074;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hmYac1qpJnaceAqT2920rXQUcbGxtk2F5uqyepf/beI=;
 b=nXWdqnT/Q+Maj42b9ShD6y0KmPliQ8Wc8FUAGcAJj/iHdS65Hk73WAix
 rrr9aPn5c1Vilo65HBuJCN+tKQnX2SOEul666pepvWgaCGlu7hVVh5l+2
 fnhO9fWAVqs/bExz7N68ocw5nmVERv9ePqZ/hijVrh0VAGzjdA7ZYj9os
 nGarP8ljajRmtLDIRFTc+XnlHi7Y1xpnMHI/1aF20UI/RWauVKJE0OETe
 2v0TwlMHZ4Pp3sLU5isksV+eKZAeE488OGK1JooJSYL9Tgd01J7azvw3C
 i90MPtyzx5wtk+hWFEHN2pQlGBah99n9d/9eMeev3eQBib+kpPMooO1OP
 A==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=nXWdqnT/
Subject: [Buildroot] [PATCH 0/2] rock5b quality of life improvements
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <cassel@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Niklas Cassel <cassel@kernel.org>

Hello all,

Here are some quality of life improvements for the rock5b board.

Patch 1: enables mdev to enable automatic module loading.
rock5b uses the arm64 defconfig where most drivers are built as modules,
however, right now there is nothing which coldplugs or hotplugs kernel
modules. Add mdev so that coldplug and hotplug works.

Patch 2: adds a new uboot-env partition on the SD-card, located after the
uboot partition. A writable uboot environment is needed in order to use
the uboot saveenv command. This way, setenv and saveenv commands can be
used to modify uboot environment variables using the uboot command prompt,
e.g. to set up a PXE boot, or to change uboots default boot order.


Kind regards,
Niklas

Niklas Cassel (2):
  configs/rock5b: enable mdev to enable automatic module loading
  configs/rock5b_defconfig: enable uboot-env on the SD card

 board/radxa/rock5b/genimage.cfg    | 8 ++++++++
 board/radxa/rock5b/u-boot.fragment | 5 +++++
 configs/rock5b_defconfig           | 7 +++++++
 3 files changed, 20 insertions(+)
 create mode 100644 board/radxa/rock5b/u-boot.fragment

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
