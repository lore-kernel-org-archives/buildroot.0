Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E4BC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 22:25:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 467DF400E5;
	Fri, 12 Apr 2024 22:25:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LitXFXZSesmU; Fri, 12 Apr 2024 22:25:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40C8740350
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40C8740350;
	Fri, 12 Apr 2024 22:25:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC0161BF306
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 22:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D83F960878
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 22:25:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jK8oSB4y0v-h for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 22:25:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 99FA960717
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99FA960717
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99FA960717
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 22:25:25 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 0F0B5B0037C;
 Sat, 13 Apr 2024 00:25:19 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Apr 2024 00:24:58 +0200
Message-ID: <20240412222459.1630158-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712960722;
 bh=77go1GCUGy70yb9HmFe1pPrCFcM6T7T96BOJIU/unHw=;
 h=From:To:Cc:Subject:Date:From;
 b=SYQA8UleBRDQxQuQA7H9/lNRIH86T1Utq/nBcUGmfEk9QNUpdxlteNOhFc7k8uOT2
 d/HsJWUxuq0A5eoA+z5oh8980nhUef5cylDmZP7EpPcHDns2CPOM90lyhejbdM7uKo
 4Iu0MKDES9VH6NWFdDpIOyvnV/cNlmK00+eu1NRRAeXXcSz25A9eKGa6ymj5EwHWos
 PEJuLQLls5dYLhq9+I7U0wXbnBQL2qw4wnfAa4RQhsLIKopt/TNZnDb6N9grN7w6fS
 d9ozZEPrMe2AkFdaR+kQjgMKe6AwXgcWunSfZNLLKiL0Qx7GJYFiWzsDIGmYexVJYZ
 2W1lOSHfLgwuQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SYQA8Ule
Subject: [Buildroot] [PATCH 1/2] package/lvm2: enable device-mapper in
 Kernel config
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LVM2 has a hard dependency on the device-mapper presence in the Kernel.
This commit enables those mandatory Kernel configuration by defining
the _LINUX_CONFIG_FIXUPS macro. This will make sure the final system
image will end up in a working configuration.

This was suggested by Arnout in [1].

[1] https://lists.buildroot.org/pipermail/buildroot/2024-April/688776.html

Suggested-by: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lvm2/lvm2.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index bda16489550..4fcfddb1bbd 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -76,5 +76,10 @@ HOST_LVM2_CONF_OPTS = \
 	--disable-selinux \
 	--with-confdir=$(HOST_DIR)/etc
 
+define LVM2_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MD)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_BLK_DEV_DM)
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
