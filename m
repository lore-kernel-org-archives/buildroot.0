Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87297C001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 04:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E417E4154F;
	Thu, 10 Aug 2023 04:27:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E417E4154F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zAAotz2XBNc4; Thu, 10 Aug 2023 04:27:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4177A40B4D;
	Thu, 10 Aug 2023 04:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4177A40B4D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A82671BF2AB
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 04:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67BCD83B36
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 04:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67BCD83B36
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N4RdyaTshuh3 for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 04:26:57 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 794DD83B31
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 04:26:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 794DD83B31
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3D8BF352BD86; Thu, 10 Aug 2023 06:26:52 +0200 (CEST)
Date: Thu, 10 Aug 2023 06:26:52 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZNRnDHlV2LzgmGjI@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691641613; bh=BxF1bZNHVuIFnihj4dxWvhdvmyWXYUYqi0eOSi005HE=;
 h=Date:From:To:Subject:From;
 b=QzWbhv2utwRbSzZXuhJIeHv01rhFgsctX05ncgUsOD2H0lSi9dzfHGpesZEm5n6Yz
 4hR8boN5ysyOvz5nVpKJlJle+5MT0Vm1rrd9BjXs/ucMSpt3OUNURdlRz+hR9xzHdJ
 oAml5/jVdeCOxDMOd7ivxWMUqYI9w/Jisave7Rghg/projXjzUlnd5pPs/F6Z/KhS2
 RIqL21tXmZaHTZXUl/fe6t3Y8NzFh0d2vsTCXbBkFq9Y3mMMSzhv6CXfPvKg+OiMqv
 GtsyqWvggM89CLvqiXk0kjs3oVaK0YN90a4rOSnr1yVP/2kWHh9e62NxuAXs+TqCPo
 6CQVS4MO4HnZw==
Subject: [Buildroot] [PATCH/next] package/musl: enable m68k with MMU
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support for m68k with MMU in musl was added in 2018 with
commit f81e44a0d96c88e052e51982f9fdd6fe0a212b46.

Tested with qemu_m68k_q800_defconfig.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/musl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index 34ffe8324a..5495ed3371 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_m68k_m68k
 	default y if BR2_microblaze
 	default y if BR2_mips
 	default y if BR2_mipsel
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
