Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B0BC54F51
	for <buildroot@archiver.kernel.org>; Wed, 29 Jul 2026 20:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F7A380DF7;
	Wed, 29 Jul 2026 20:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxXMMhLuaXs0; Wed, 29 Jul 2026 20:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46F2A80DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785356739;
	bh=zb6gmSGeEAPZGfZ2g207Ytsd/A1vGPBbor+HpDDFx+A=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XrAhQOSSJo1iPMtVBppPGXV1qZapaHpFIcDkY6Ekbbtv1QnxvgOz6czHL02J75Fle
	 /8TGpe4zUTwGQ3pD7Bg5mKRoPTmAnOLyYFI5ED6Gecb5NP/R+ioAbshWkVK6NTkPy0
	 vUnIbACV1FbV7esAvdtqlctoz75sUAhMX8wuVALihSNnSjcUqnDVM4qq4TZbn+rIqV
	 wMF8zPNyc3VfW3u6xVrsdVsf5U7hCdgw4shN4NcmhmWQTDgt1iW5QsFEdrvUti1Qps
	 qgLZzCseVnuC/F4HnNHk7u8zgmJPfTD0UdvY6wTeBwJsuerbi6ybBwGBLFuhZ1UAVL
	 CDqR7LFxLoF1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46F2A80DF8;
	Wed, 29 Jul 2026 20:25:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D0C126E
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EED780E43
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z0K5Mxv_X5Yk for <buildroot@buildroot.org>;
 Wed, 29 Jul 2026 20:25:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38DB080DF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38DB080DF8
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38DB080DF8
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:25:35 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:1065:2100:52d9:65fe:2df3:c492])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D8A785FFBA;
 Wed, 29 Jul 2026 22:25:29 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Wed, 29 Jul 2026 22:25:20 +0200
Message-ID: <20260729202520.1568463-1-ju.o@free.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1785356733;
 bh=GDt4mvcLybUtWV/kINK1uYMThGe5+k3RaYmtpA8ps4M=;
 h=From:To:Cc:Subject:Date:From;
 b=g79i7pCu3NywqORmbKHwe8pcGidXcUcUtGWr92XjwgyZprwvtVDouImMQeBPqawFm
 7OINmoUVcSPz/PBFPR7Olp5SOpV85x3LzsivK+22EwoyDYqk7+p2ZcVZf4WdHnBq49
 gZty7JFsWDfoBVh0bBK8cT8k8RuhitzkfIEeDaHp2F2trTk6eFNL2hOtey9sb5l4ns
 bqCGDpa7XJ6BI99qsp0HqL83kseyl0rt6iTOoqsAN9PbGMwMKDJz/tYRVILc1aOxy2
 b2pRI/fW4KUd4iCAwJrT+rPq3d7eS6p/fAGibp6jWrdqKMrQMFESZKYQiXMf94hsLH
 Gcp102xGpCJWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g79i7pCu
Subject: [Buildroot] [PATCH 1/1] package/uboot-tools: fix host build without
 FIT support
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit [1] "package/uboot-tools: fix host FIT signature support"
slightly changed the logic in which the file
$(@D)/include/generated/autoconf.h is created.

When there is no Kconfig sub-option selected, the file is no longer
created and the build fails with error:

    include/linux/kconfig.h:4:10: fatal error: generated/autoconf.h: No such file or directory

The issue can be reproduced with the with the simple commands:

    cat >.config <<EOF
    BR2_aarch64=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_HOST_UBOOT_TOOLS=y
    EOF
    make olddefconfig
    make host-uboot-tools

This commit fixes the issue by simply adding a touch of the file
at the beginning to make sure it will always exist.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/928cc5dc5cb82e6f2cb43f853488309eb806ef89

Cc: James Hilliard <james.hilliard1@gmail.com>
Reported-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/uboot-tools/uboot-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index ef8bcabbd9..8a2877333c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -124,6 +124,7 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	$(if $(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
