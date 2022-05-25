Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66994C433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:34:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E45441C16;
	Wed, 25 May 2022 13:34:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74NKeKvIgumS; Wed, 25 May 2022 13:34:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4808441BE4;
	Wed, 25 May 2022 13:34:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3995B1BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 251586130D
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:34:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGR3kEd3xUyk for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:34:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F87761307
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1653485678; x=1685021678;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eMSO4MNOWP8nhfvo4/JFfaKFPIR5fUd12ezLarr7SkY=;
 b=SLNvMyS1mpkyG5I+MC/C0NiHGohoCQjUddukwzufIcgZa4zqArytvKpF
 SBbWopMdVrtWA+fdRusfIGBtGNUzOTyDoG9PExLna4HOnvts1T3QRUAc8
 UzVnErSzHtGSNrtYSCaNMonPjZ7ky0OFq0hWFNcy21GJLwgMhyVNNvTWX
 Y5zoGfe3YPRGiq2gZDc4lMQfZfKblfx2NhsxO6BzIWR7HiCp64xz6I/zu
 DzRidjkmGD9xUARSD3GMPwfNdG8NfxvH2IGr1FGpFDAjNfZzqVRklOiaZ
 IIsC1N+IAjylIRcyU41/r2sQLarLw+rx9XPkomeHkvq4crWkVAh5LAdbY w==;
X-IronPort-AV: E=Sophos;i="5.91,250,1647273600"; d="scan'208";a="305635084"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 25 May 2022 21:27:32 +0800
IronPort-SDR: VQZfKU3cfYKt+Y5HC41CfnKGaCgxTTZbBPAJzNZSZCsNzik1KPoAXLE3MLVy5iDBhPskXXCjCM
 2Li+T34YDCjyMPKDRmh6vq32nTAUsjPXVaywAve2EjDCINLBsKgsM1oyBzsHulLdYrMxspdGa8
 dBMwdQxTXFUtKaePu55jzCr9rkTgHImLPEj7jgZN95Ir+IcALdwaMTnHAhCORYNvqLcTy6RxoS
 rAmykHwhJvXQbjh32aEwk16KgZmDlYwV5xiyM6HJDc3++3H3OOUEKMh++Ri9hDnAAvHhkwSkO3
 jetNT6HvnW19JEMzWsmBZHd2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 May 2022 05:51:28 -0700
IronPort-SDR: 3ePkLyKdNyzMEJ1EsIdIPCw2H2pv7XBlsiVNAN2KkmGnA2rcmnm+LDhe0ggTW7VsTpqpZSRhTB
 xc31CXek6aYHd09JzI6lHLZajW7GFs+JHaYtKlX3nsT8eMf8+MB5QpwK55wd1S+uN303TOm9He
 sKVue4wb5UZy939oYRcU54HSuNz+NNhCoQu3nYqEQcmEwH/JS+SJAIz8y+IvT8uM4Umzje/YNQ
 9NIYjORGIfC+uQ9OvxFnzYUxm7m9OMQcb8YK5H+4iIW/bvy4P1AaUqU8VqD7m5ntQngRKuIWYE
 axc=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.54])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 May 2022 06:27:32 -0700
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 May 2022 22:27:19 +0900
Message-Id: <20220525132729.2349105-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525132729.2349105-1-damien.lemoal@wdc.com>
References: <20220525132729.2349105-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 01/11] package: elf2flt: fix config menu entry
 description
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
Reply-To: Damien Le Moal <damien.lemoal@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Keep the same style as other config menu entries by removing the
question mark at the end of the elf2flt enable config option
description.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
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
