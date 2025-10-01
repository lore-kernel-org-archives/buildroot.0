Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9B1CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 12:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D980F83CB2;
	Wed,  1 Oct 2025 12:27:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FyUdo2lMmbKC; Wed,  1 Oct 2025 12:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB86E83CD4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB86E83CD4;
	Wed,  1 Oct 2025 12:27:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 491CE93C
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 12:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FE7783CB2
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 12:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAqG_EgKSSM8 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 12:27:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::835; helo=mail-qt1-x835.google.com;
 envelope-from=robimarko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B2EE83CCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B2EE83CCF
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B2EE83CCF
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 12:27:10 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id
 d75a77b69052e-4de584653cfso84842791cf.0
 for <buildroot@buildroot.org>; Wed, 01 Oct 2025 05:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759321628; x=1759926428;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TQ01MOyp8VLavfQ1tmbxfbHv7f60R2IPnYccInkS3aw=;
 b=crNeCa2uXy8N8rjXJ1E5jVb72V8NyR0sy1+vb+1HKtzrevLI8PErh0cl+cJezx4fFD
 25v1U10W5/KJg6f2NmThBPeHjtk3+bz3+6P+vp2e/f9x6UV+pjSrUeu/5HfIQ4WY957e
 bk8SAs0latQupgLjsQ33pteZf1zwNr/MRUwytk/3fp3R+z74sSwFt8N09mqRFa3/EBbr
 D87prp2GQ9Am8HrY2gEL00HBv9SuuoZJJxkXWB+6BVehIhl1RMR+Yws6h+x8eWopasAW
 ziPMAyvN/qJTDTWQj44Vg4IDnUcdnqmCDfk2/89ApUql21wZGsnv2JkfQ+tGdlfGegIu
 oYLA==
X-Gm-Message-State: AOJu0YxcJgVwX/X++Har+6MBvsPu8GfFH2srcOopni/gVMpoygIcUcO0
 9E4Tu9K0NH4kfaeZZDVtyeTlcs4Atqqy+zJNsV9p2o6DxIFzH/IJXirYEGpW5Dyf
X-Gm-Gg: ASbGncsVfAki85w1IMPRED/SsFWQ4ymx9dsHGaIlkJibUo3Zwsj82JJfu1kqmki26nB
 cSzApku+oko6Wj9++8OiMw4rZ96DUNmDb6gEtnrs1Z0TYVjXMX2DtpoRXqxU+dsD0oras2Z7pNe
 Pikl1NuaeSPFTvvoKv3xY+2ly9u1r+Llr3wzDcGkmfRvS/6oVpLcbigkBE6rk+9zws7HxfIov2u
 pu87hDuuCubPNlP6z4o6v5vEvSYi+ylq/ji7mYP0YMIia8olyv3fAp3UnZZOrQ/BwAExTwgiEdJ
 eISABJfyM9JqfzwtLLieAijBQ9YRHvuKizsGzJgMrYyo/6Wyjeb8GeyEykJEGQWE/ln+MRYMtyX
 GESha6AqgrJtBdFKTOw8TwvRn5ZfnF8vk+6N+UyteUe5X+bgYTQ/kQmJXnvERzRqPsYRPTuYmuO
 l8n5gyhKsVufWr0OjatoQ/jyMi0rjin2/YPbanzgqSyE/DRxhhrQf/3GzmCmaiplfiHg==
X-Google-Smtp-Source: AGHT+IFSscVs63kzWPr5cKHvC3S5u/wdqphyNgUF2aI1TlRPyvw02b51v5rNGWz8dso2sNyGfsaVCA==
X-Received: by 2002:a05:622a:420b:b0:4df:3886:44d5 with SMTP id
 d75a77b69052e-4e41e44a710mr39634051cf.77.1759321628040; 
 Wed, 01 Oct 2025 05:27:08 -0700 (PDT)
Received: from fedora (cpezg-94-253-146-234-cbl.xnet.hr. [94.253.146.234])
 by smtp.googlemail.com with ESMTPSA id
 af79cd13be357-85c307acb86sm1232877385a.41.2025.10.01.05.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Oct 2025 05:27:06 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Cc: Robert Marko <robimarko@gmail.com>
Date: Wed,  1 Oct 2025 14:26:55 +0200
Message-ID: <20251001122655.994103-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759321628; x=1759926428; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TQ01MOyp8VLavfQ1tmbxfbHv7f60R2IPnYccInkS3aw=;
 b=KUk3SpcHSm8eHuccB3StXh9uEyb08KS8AVsmgV7d7VjD9q4eFdnaTJVTqN9L+gAI+c
 V3zhbtkJEiMpwehe5z5b5aEa+deZSR1LKLWk6aY2MHOiQv3PrAG0VkCBJZ9awyJx1pmZ
 x+tdu9bZ/T5boSjZXFJx1pmzgKEcTsHLCts1hiwRIeUKGP24WqWX9vowCKfBYI8CSbHc
 dOl7CrcO/MEEoXMZDPY7D4Z+HvVkAO1ozgeJzWPLC48HDEfb0bUa/i/cnJQ/z1n08pkG
 saneXib+JlDpy0va1504iMMqBtCccSaThFvZk7EG7yj/XJ30VGrNQecQeVl/608rdXv0
 mhng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KUk3SpcH
Subject: [Buildroot] [PATCH 1/1] package/mdio-tools: enable CONFIG_MDIO_BUS
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

CONFIG_MDIO_BUS was previously a hidden symbol that was selected by
CONFIG_MDIO_DEVICE, however since kernel 6.16 this changed.

CONFIG_MDIO_DEVICE was dropped and now CONFIG_MDIO_BUS is visible and must
be directly selected[1].

So, enable CONFIG_MDIO_BUS directly as otherwise building mdio-tools can
fail with:
ERROR: modpost: "mdio_find_bus" [mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_write" [mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_read" [mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_c45_read" [mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_c45_write" [mdio-netlink.ko] undefined!

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=v6.16.9&id=31be641d74267d98317ef5a2b90e6200511cabb3
Fixes: https://autobuild.buildroot.org/results/8595997794a2f603fcef95b559f60f83abfe4d83/

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 package/mdio-tools/mdio-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index b42ea41c79..e61f847e13 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -16,6 +16,7 @@ define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_BUS)
 endef
 
 $(eval $(kernel-module))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
