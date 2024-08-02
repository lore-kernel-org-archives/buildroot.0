Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4D6C3DA49
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 10:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 649ED410E5;
	Fri,  2 Aug 2024 10:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9tkjksXBfg1; Fri,  2 Aug 2024 10:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F3D840C8B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F3D840C8B;
	Fri,  2 Aug 2024 10:44:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BC7991BF98E
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 10:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A99CE40184
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 10:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rV3drY8YUjvF for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 10:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=robimarko@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C0DC400BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C0DC400BB
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C0DC400BB
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 10:44:43 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f15790b472so21089251fa.0
 for <buildroot@buildroot.org>; Fri, 02 Aug 2024 03:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722595480; x=1723200280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U/Z6/eNcGtug3L2Nk0msOEQq4EyzdBumD0uwp99V6pw=;
 b=DnApAM3u/9B8+pmBxE06Db8DQJ5TGblPWw3dBj9jYH3YNAb48//sXnD8kZj2ymz3AU
 teuU0nscyaaZIJDv74L2c5Bo64/MIHLBBoAaTQ5/g+4eXWlpuvOk6Mi6R+XVNkRS0Ewx
 NjQHr6Pp0hCZv1NWd3vtSd29JcR4bgJB/NExi23nywitOfsypaeC5mgxck+Is5Z9JCyk
 /nlUkvFj4o++xM52Ul3sL28NqnUV9o2+CtjsXUwPACFAiJHaNJyCPPNrq20U3PIbh9Xz
 T+zFsYzhWvzySAruCZcs7hyTx5eApqN7EzJHOnRPffqoYNfBCqV82DNb677O/It4a9CW
 qPjQ==
X-Gm-Message-State: AOJu0YyG+nCd3evDLsWSK88W8bfJnEsBgC20h0gbWw5VbjP+hGGXgjCY
 lMwGX57YjaNIh8DRe0IiMJc3Dc3tFw3MkvpAr7V9T/d4BS+CcvLF1SgvtA==
X-Google-Smtp-Source: AGHT+IFeDz267JNHOXb3Yd/UYWX0/NuIlCrws6Uud3BF2pSaXUZJj6KjkLe2WxZYSeIkghAFH0CfFQ==
X-Received: by 2002:a2e:870d:0:b0:2ef:2c86:4d47 with SMTP id
 38308e7fff4ca-2f15aa95d8dmr22732661fa.15.1722595479975; 
 Fri, 02 Aug 2024 03:44:39 -0700 (PDT)
Received: from fedora.. (cpe-109-60-83-44.zg3.cable.xnet.hr. [109.60.83.44])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4282bb63f16sm88465275e9.33.2024.08.02.03.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Aug 2024 03:44:39 -0700 (PDT)
From: Robert Marko <robimarko@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Aug 2024 12:44:37 +0200
Message-ID: <20240802104437.488091-1-robimarko@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722595480; x=1723200280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U/Z6/eNcGtug3L2Nk0msOEQq4EyzdBumD0uwp99V6pw=;
 b=coULwk+RARVprSUI9OS7wRRWEdKlpnJTF2LmmTNqw4jrwNkmDyJgLYrex2+W3eX00p
 iGPeRV86dY/zfBYJv+exNaT8XK/lVAE0S5zqoG4ikg2ifktB/LW/WK4BvJvLSp9QKUP1
 ulwuifhms7TeuBBW3I2BJ74tK7NtcZ157ptfEEURkH6diAQfbbEU3CF4+VdnN2RWrPks
 lNyK9ZrQNMRr6CAy+ywYLCTXlZ42GxSL64ZWE7g55mYtOWhZcAubk93DRtfAJW/dsRN0
 5ucm+nBVStMx8tWth7XTqYbl7wmZjsFLhKmEXj4xTuPubmMhxteA1ucAsyXW3mupTCgD
 diYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=coULwk+R
Subject: [Buildroot] [PATCH 1/1] package/mdio-tools: enable CONFIG_NETDEVICES
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
Cc: Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mdio-tools depends on CONFIG_MDIO_DEVICE in order for mdiobus driver to
be built, but CONFIG_MDIO_DEVICE depends on CONFIG_NETDEVICES which we
are not enabling so on platforms without it enabled in kernel config
building mdio-tools will fail with:

ERROR: modpost: "mdio_find_bus" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_c45_read" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_read" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_c45_write" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!
ERROR: modpost: "__mdiobus_write" [output-1/build/mdio-tools-1.3.1/kernel/mdio-netlink.ko] undefined!

So enable CONFIG_NETDEVICES as well to make sure CONFIG_MDIO_DEVICE can be enabled.

Fixes: http://autobuild.buildroot.net/results/edf47df96cde6094c890c0b74034cced90335a39/

Signed-off-by: Robert Marko <robimarko@gmail.com>
---
 package/mdio-tools/mdio-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index 16eba74734..b42ea41c79 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -14,6 +14,7 @@ MDIO_TOOLS_MODULE_SUBDIRS = kernel
 
 define MDIO_TOOLS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETDEVICES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_MDIO_DEVICE)
 endef
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
