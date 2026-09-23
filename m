Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7B8DC9830B
	for <buildroot@archiver.kernel.org>; Wed, 23 Sep 2026 17:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E01240642;
	Wed, 23 Sep 2026 17:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id axFqbtP2ll30; Wed, 23 Sep 2026 17:19:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B086A40660
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790183984;
	b=r28QfphXXokul9g2z1ZJ8Dedb9foeZSE1TmkRrTS29XcwwKOhszOR4TEFoEK9kSBd2Vv
	 GD2bSvooc7TEWrG/WIjHJ5iTEJyAHCPiHMI74+7RLscra54n+v8jq2Y/XndOWvsfW90vr
	 3kTAp58eB/aHTbXlHLSUgnJ1AntfT95Y/OHF6is06hF0YUvcUeLdBfO2riGn1ZOXqX1h7
	 vqt8SV1bobdAwzqzA5cSMeCUXHiExPPHBpFXlKJ2EwggC+NWKLAx0ShWYxHT1YnRxLMD2
	 YmgKPtXqn+2b33CPXKWCLejkgRq77e2vBoatf3BLEPvUQGyAUePSwXjbNq08LYfE3GQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790183984;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xCtPOS3PLiSjOUXudRbn+YBpLeI0QKiYsaBMvVK1MVY=;
	b=lMaDZkmTxhEq0z/xOb9CPiKXWmsxSRbudtzPx86cmG7YOuAYRAvDBZ3WRpy5AW5VIma4
	 wHLTP77CzbEaPHehjBQtLj1EAPwCGbHmWex4f4e9jhqIrgm6hjxprCcsPwyKkiX+eGJhS
	 lQeV58l19yJ2WQhmDxVwNvJfISUY0Fr4AkshKwA6fBoHyb0GDo7kOjNglwJySintVbGzW
	 Ug/z6Wg+GtfAmHabkHHRuVQw8qqJLR0jKFHInt7kY46KKxO4gD7SiJH9BXf+FzUsNfQxX
	 +ZpQF3wo59M+xNtRC7FLWTonpHQzVztpXKH29fHNKdpR83g3dVvdomsCOYHcILmk9MA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790183984;
	bh=xCtPOS3PLiSjOUXudRbn+YBpLeI0QKiYsaBMvVK1MVY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hdAHJKbC498e0OyH/EFxvnuKcubQR4Di+aQ5m3ltsm4GqNC0s2Bq9pLdYkRXABsC2
	 1Q9dfK7YeBntpamZ8AE5/NzLRpbbLtQV0RqCZ2NV+9Y27Be7MaZ4ZwYqzScc6Qe1KM
	 kA4Yr6w+Q7HKWaXoNGnrWBKC8s0bJwI+4Z27z1KsW6hpPEth49VpqAYMpz0eKReE2/
	 J0qQj6021Kv1jV4SBxybCdRuWEuC9HC8gk8gDrU6DtVPbwvm4aOvdjEsTBeHlN5mV6
	 2sHe+7LbXjHkF9Iw9Y9h045iSkrK6nigJ+D4P3F00qEpEMya2A1Y7hyZT8eWTisPe9
	 LZ7+mA/KBznbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B086A40660;
	Wed, 23 Sep 2026 17:19:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C46D913B
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B60656087A
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QKrUm0Ns7g1 for <buildroot@buildroot.org>;
 Wed, 23 Sep 2026 17:19:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6474860880
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790183981;
 b=MrZ6rqGe3f7zm88S+TvN3EUzg2SFb7JVd2pzt1sXszJ/sZD7BeLQachgNK7cvpVM3qOk
 C1J9n5dIpHYUum2RJFGzGvuC63hit9oG/eOiw1enIiEXznTy5oCqO92Z505+4ETkAf+mI
 0dRREQzTq5q3QMM6LwpYm5JsPFj2ATjJ4IOBY271Iyty9Yzfw4AuiC9u4tfEZisESMoZq
 JODBo5eANdzaxQuA8v8SB/X65R1UkjJnaygCvXijLYdeuZpq5OgTh3vHrElrFgMCJmeQL
 gWahRpLevQSwHvv0RTc3vn+YUgqZLAZ+tJ3QG1RXO+4m/9K4UamhMZa5JMLp3dJyW0Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790183981;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=NzGoWGEZG8POJLoIikHpBCo3AEv2xZaTwHlLmEyMh2k=;
 b=Xw9lhMELlmqQd0ijEI+PPZ89/O+udPq4BLXtdV1jlyQhmc1ZPq1TGy17vvo7mV7fZNrO
 mHGlHFQq5MwBo6bPd8Fk/00HnzAxrOOVK2hYoxYgARlQDAos/ZbR7maVHxVKn0axw8GqY
 R1PPKbVh602xgeWaNMlj0Kb5yGD/4NSLdVS2A3+6jVMUmb+i8mPCo3GFSOdYRKstS7Crj
 U+gtwJhZM5jglzx1MV8bsPHUK1j9ST7t81T2pxgpm5Rqjb2w0odcccUiNrtZ4aSLoxy/Q
 S6LjnGCPdzBM9qDRaAYVCYEjQmBh9GyYY+ooeIQ1Cn4ziMoSc4kiX7BVtzfRjtbD/cA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=b6Ty6nAn; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=b6Ty6nAn
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6474860880
 for <buildroot@buildroot.org>; Wed, 23 Sep 2026 17:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790183976;
 bh=NzGoWGEZG8POJLoIikHpBCo3AEv2xZaTwHlLmEyMh2k=;
 h=From:To:Cc:Subject:Date:From;
 b=b6Ty6nAnAoXyMvlhfuK1zy4DDKwpJKiDoaIt+3t6WqPQVlhgmQ9yJz5aaK9G2bOdz
 NgqVROxbZpuNhoug0XcVMl2S7p56EkmD+GOfFAjfkpi186BZQtBAMoW/Aqtng3nRk1
 dGSsFyX40BMkZ/XNyBGNg8wmPqNGVWJQp1pHHCS/+bj75qC6lKRIJWA2fTuQ5f1EGJ
 hxmdzqYIvtUBsrqp3sRN3dQZWdZWrpCvPA3472MokYMxDtFmDVatKDWzIhicK9ov76
 Ol5TTtB3GOk6mzPvFKSoZpdyYjVt3NuTT2HA5f+DntYYliuNxAQ+t3iD3E3Kai7yPB
 BckpavaM7YmxQ==
X-KAS-Sym: v3:f51bdf72230551df:XCkF8tLcp5V9SBVu7otJJ21e71Fy2CZ3lR/QRMfN8AXgB
 pDZkglVpepWGj7lfBjCsF74w9P7sZbucBhMrroJuLbSN4LjR6VfloJ7CRfl9SDhnSLOuYq/xSIl
 dO5pws1H7y+0GDFe/ze5XpLP+jZEye+Y3ysZ2i4gaefOjY8dhXN7ULPfPcz7xzl2NxmFkeey/ce
 5VuMdWllwmEPum313SAdYuyayVY8s5R/R8n9TpUSx3xk0vtIn6gr7mNt4tuz+eB0Geo5y1emmSH
 OZikOH38N2b9QzksKViJ2FHkOAmpP9o7m87M9U63gTHdjRgoaf1lRs21ex0Qk7R2JixySsCQ==:
 8kq/CH98GVeSZnQ5FmtBx1n29pRW5ECbjrIJr9VNqwyP4C8OB3IGBr+LqMy2dFJOvYamsmzewar
 6w3rP2CGFfJlu9qlsiIda+0ajOnvDVmrwvsUJqoGCK0xvhQbdAtj1Pzt2Mi+F/UWb14D5mjiLUN
 dnDLh4APMYnp2MnopNVSrqkKJnAsbbuZI8+7gpDrsPHMXewhDCCn4fxGytn3SwrOMHYqeYCYdQW
 mWIy9dlbcJXL/OnGR0jQpXZWmWhWQua2SvfBFkI9eBdtJtiHxMIj/8EWF0H4p5LJApam92q2BKv
 mNfed9Qy/AKblAxmW5+6Ovrc8eyCC0UA7u9hTW0lKaXzJJfMyRDdtmE1f/755a75ZIwgY5Yy8f6
 z45olIpcsUiMn36whzWdh0p5bbQuag7KWi7dtLe0y58s8ZrSQ/ehsnTRRjX53xQZMclp8llEAZi
 NlEfQy03nAP8hdTBP6Dj4OtrWZrbitPd33gJQHsq7Lxy1bzDU8IWiTldaWRKyrLS5rjOO6guK/Z
 t4xuVv7Bc3YbiC/XYV6LOqRl4VUe/EfwLE+GpySWaEuIFOR4iXUJ1iYYVOT248XASi1+qAp8Y1n
 il5WD5ZllzP+UPwn2iYXz0zZ+3YeU8R6a4v5h2IqUTeKGstSJV12knsmVIHfeoKGA5oJVWxk7Om
 HClHORg==
Received: from fli4l.lan.fli4l (p54a1b329.dip0.t-ipconnect.de [84.161.179.41])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E6BBA4C4956;
 Wed, 23 Sep 2026 19:19:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38812)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x9Qd6-0000000010g-0afi;
 Wed, 23 Sep 2026 17:19:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>
Date: Wed, 23 Sep 2026 19:19:36 +0200
Message-ID: <20260923171936.46557-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/1] package/llvm-project: bump version to 23.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://discourse.llvm.org/t/llvm-23-1-2-released/91895

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index c7e1a8bff4..d092a2cf94 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.1
-sha256  ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4dc52179bfacc7888ee6  llvm-project-23.1.1.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.2
+sha256  c98bbef08a2b4c2613cd50e9aa9ae7b69b1fe6c16b2c40373bc0ab6116fdf78a  llvm-project-23.1.2.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 850bd78720..e3eb03468b 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.1
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
