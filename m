Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB6BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 03:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE33E4199D;
	Mon, 30 May 2022 03:38:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x0ZJc4f95NtN; Mon, 30 May 2022 03:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9100141992;
	Mon, 30 May 2022 03:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2172B1BF834
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D7E940C03
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 03:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com header.b="OjoQhuhO";
 dkim=pass (2048-bit key) header.d=opensource.wdc.com
 header.b="mAcGssIF"
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEwC91CbZ9lF for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 03:38:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7648D40C01
 for <buildroot@buildroot.org>; Mon, 30 May 2022 03:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653881921; x=1685417921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=93dHdvAbFYi+wNFVfGQYVAbPcrSuJd/p8PSCWvdvx10=;
 b=OjoQhuhOK/1i6iPMqwSNyc0yvK8HcXJicV8S4LkTmKvbYZXiS4c88VzI
 h5K6H39r35bR8KXdHWHYkQFMd4CLk/C19wCNHscitgSAwFd2Enj5u+AHs
 x0HQeSzJ4TWyOCPnBII96XLS15ax0JrR5S97ckp996g4k3Dp8zUPyEKtS
 JFTQEgWAoQefEwAPS0Pw2zQJ/XznOjGDUB5CcVvUE/ZyglVWffHGdw5by
 xuSNSBJvZPCsQgQ8L2SOUT+4rsbRkI8arBL+05T5yjazDKGTD7wCJUCH6
 lkM0DqLOLxLogSYUGwnVmKU4bO/7L5PxJsShhwWXPC45oSntZBVljULll Q==;
X-IronPort-AV: E=Sophos;i="5.91,261,1647273600"; d="scan'208";a="313781111"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 May 2022 11:38:41 +0800
IronPort-SDR: jAjc7vAL/YCipEDYMnbx3THsUAuzrfWLFezXxVfGDsnYlzEpK6I9HhyiiAGBF/5KqqjsAESM5L
 An6UtcjqMkhRPzn1GeLZMMCWsW2UaL9UtzxYV7AMqs1s8k1RZYBztCrIH/hVM73s3EUd3KszDi
 T4RZQ9uliSe4NG5qs5UHXp4dcrZ1GxOLzW7KuLxY5jP9JKFw0mVROqKy6A7SxQQdVO46tDBX/b
 qwoA66B4qf22Qqhg1tG8xK1OYj0bNT0wyKdUyNwhujjxHAIAXVC61BR7yqFlunmWCN0UWK1GLF
 c4kZ2eUrWYWwgHEbSDGhgBfA
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 19:58:06 -0700
IronPort-SDR: 4D5KV87Egqdj9zLIrAOD9O9DveqM3wcuE1yEvpYgysXkwE9efudh5TKjgtSdT4fxnHRAr5J97t
 vE1EuMvQfnbpfYbH6Ca1Zxgm4HZHlLFRr8c50lg/2ShlLg5H6Bp0+bqwHG7eHB9ftQmZ/eNfgx
 GvW/Q/vjA/q2v3ocI0VULarlYvBfN6GIwjshvJNNYEq6m8GqEg8nwHZoBeJllrDE2Ene6nEC3f
 SkxljkL0/PbtuU9dKa/zwK2EqP/25HQqUo7BAQMKQLYr5mFVNIKDiKFrMjAz5eqgm0L3kiAGlU
 aX0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 May 2022 20:38:41 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LBLjX5m7Kz1SVp5
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:38:40 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1653881920; x=1656473921; bh=93dHdvAbFYi+wNFVfG
 QYVAbPcrSuJd/p8PSCWvdvx10=; b=mAcGssIFX2bNSq7vK3ElccEX3+jAiy17ch
 UXWRraHZwsp8POwe4T5lkaTb5R8rVZZOwvHK9VM3czPRu0u0cunJbzPIMxG+dti1
 RabTdkDtz3RlhHImd5F/83b0eMHnJURTlasv4tMv9WE+e6SAQwVl576+DjvXTqWc
 ppa/Ok0iMREDGehva/+GMABTseGWG8VF2GoYwG2zzFrlVWqMyQUBMmO583Y03xT9
 7Xt2ELe1Dea6fhW+FDeCCpwiev5R1DNYGe/HSNJGtRjN7zU+733085jY1Bh3vK5t
 AnDFIkB2xIloDhnjt/S41ttR0bE77/ms8Pd/qOjSHQqUqZDt1CzQ==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id 4YE61ciKVX_5 for <buildroot@buildroot.org>;
 Sun, 29 May 2022 20:38:40 -0700 (PDT)
Received: from washi.fujisawa.hgst.com (washi.fujisawa.hgst.com
 [10.149.53.254])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LBLjV6ftKz1Rvlx;
 Sun, 29 May 2022 20:38:38 -0700 (PDT)
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 May 2022 12:38:26 +0900
Message-Id: <20220530033836.474926-2-damien.lemoal@opensource.wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
References: <20220530033836.474926-1-damien.lemoal@opensource.wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 01/11] package: elf2flt: fix config menu
 entry description
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
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Cc: Niklas Cassel <Niklas.Cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Damien Le Moal <damien.lemoal@wdc.com>

Keep the same style as other config menu entries by removing the
question mark at the end of the elf2flt enable config option
description.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 package/elf2flt/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index 2bab0095c2..339ed06b40 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_ELF2FLT
-	bool "Enable elf2flt support?"
+	bool "Enable elf2flt support"
 	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa || BR2_RISCV_64
 	depends on !BR2_USE_MMU
 	help
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
