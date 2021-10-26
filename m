Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C0D0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:24:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDF7F61040
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 07:24:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EDF7F61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D86580E03;
	Tue, 26 Oct 2021 07:24:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0lW_CvU0oC6r; Tue, 26 Oct 2021 07:24:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1979880DF7;
	Tue, 26 Oct 2021 07:24:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5058D1BF30B
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37E7140262
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 07:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=wdc.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QdwyOjwIbaGn for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 07:24:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D33914023F
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 07:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635233075; x=1666769075;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yvlg42eplvZnI5R5qRD0CUN+BtbK8BOT9sZgaYQtY2Y=;
 b=apWxLL/dx5wINQevW/usJJelCOwUKzbH7lTVfWfAbWSUJyHgfQqlPlkL
 CzE3IFtDkNKyIhOBQVCHql9lozAniGbGDIyjtxqndguDz2Y6uLhwZwegy
 x+lbtx0n/YOtL4HZWgrmThqdwj34ZOUbEBgV373rkXfkz4YOnjjSQjuq2
 BvjoobyZ/SXnWiUXAv9eKGDwdXiipo6pgU2LuXjImsC47/JRuSAWJ3rcU
 l3e4IhrsTQHSf3n/iC51GinYh0fLIFuivUoFY7mrfA5aCaiT+t6t1I8gM
 9J7IUwYHwRdQsQO62Y7QpcuOzeXAeS4yki5d0xAoDM4AVsHvcQQwyGRsc w==;
X-IronPort-AV: E=Sophos;i="5.87,182,1631548800"; d="scan'208";a="188623058"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 15:17:30 +0800
IronPort-SDR: 8vdfL9waniqx1D/hkq3QbG/Dh4+x+hyvQfz+5357lnnpS9tNy8Af7zeCx6bqMPicbjK99MT21k
 0FLUCfz5BYFIzbGoNY+zZktPT64JoNktNI7Mv5d8ZRoV/6UsJL3iP4chtksGMF6NqcunQw8Xa2
 P5m8jKpxLM7WNGlUu84ytAprg9qPWX6JaIiVk2uYki6qPge2yFhkRxU2eyjMcmmOy04984luPU
 APaqCcfFII6o7d0XGWTIIm08mgbYevJLyyia5IRYDYrJhaSFsV2Lg+rhhULl/+bwIEgdpRMQsW
 sEsfwEm7PDGGYP9U/FFgs0ob
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 23:51:28 -0700
IronPort-SDR: JjBiqaKhwzufu7sArfo3zZGL7Uw63UamUvGeAd0MpcVcV5YooGvHKO6i8WirSDO+P4PcpylGCD
 4VNyneENBFTeng+6+b0XlEgTaTXbr7txlK4NnwHdr6XwqC8zTwNAGerrQFPCGmVZRjlSVyqrb3
 dNQs1S1JGp2NGRrqy7HlVmWlskjj+gBxcDBGcYNqIhDKhwhsV8ZO6bluZuKqBlqu/AWHtyj52v
 rFwFEs1NwwzPU7y/J9NIUBe9OvJDHqFvBNvdCuW6nOIciZMl7nVNsxfEPWfD/Z4IlxrZsJKATL
 81s=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 26 Oct 2021 00:17:31 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Oct 2021 16:17:19 +0900
Message-Id: <20211026071728.954356-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211026071728.954356-1-damien.lemoal@wdc.com>
References: <20211026071728.954356-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 01/10] package: Makefile.in: fix elf2flt
 invocation options
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
Cc: Alistair Francis <alistair@alistair23.me>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When BR2_BINFMT_FLAT_ONE is selected, elf2flt must be invoked with the
"-r" option to ensure that a single contiguous binary image is created,
regardless of the architecture default image format implemented by
elf2flt.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 package/Makefile.in | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 86db62ba5b..50ccd0f25d 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -178,13 +178,19 @@ TARGET_CXXFLAGS += -fno-dwarf2-cfi-asm
 endif
 
 ifeq ($(BR2_BINFMT_FLAT),y)
-TARGET_CFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
-	-Wl$(comma)-elf2flt)
-TARGET_CXXFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
-	-Wl$(comma)-elf2flt)
-TARGET_FCFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
+ifeq ($(BR2_BINFMT_FLAT_ONE),y)
+ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
+	-Wl$(comma)-elf2flt="-r -s$($(PKG)_FLAT_STACKSIZE)",\
+        -Wl$(comma)-elf2flt=-r)
+else
+ELF2FLT_FLAGS = $(if $($(PKG)_FLAT_STACKSIZE),\
+	-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
 	-Wl$(comma)-elf2flt)
-TARGET_LDFLAGS += $(if $($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt)
+endif
+TARGET_CFLAGS += $(ELF2FLT_FLAGS)
+TARGET_CXXFLAGS += $(ELF2FLT_FLAGS)
+TARGET_FCFLAGS += $(ELF2FLT_FLAGS)
+TARGET_LDFLAGS += $(ELF2FLT_FLAGS)
 endif
 
 ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
