Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381BAC43334
	for <buildroot@archiver.kernel.org>; Fri,  8 Jul 2022 05:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C30DD84667;
	Fri,  8 Jul 2022 05:50:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C30DD84667
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XeGBGXWnRT81; Fri,  8 Jul 2022 05:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3D1A84660;
	Fri,  8 Jul 2022 05:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3D1A84660
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4B51BF44C
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16DF784660
 for <buildroot@lists.busybox.net>; Fri,  8 Jul 2022 05:50:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16DF784660
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q9TdyFArTZKZ for <buildroot@lists.busybox.net>;
 Fri,  8 Jul 2022 05:50:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6858453C
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C6858453C
 for <buildroot@busybox.net>; Fri,  8 Jul 2022 05:50:18 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v14so29080562wra.5
 for <buildroot@busybox.net>; Thu, 07 Jul 2022 22:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hj9SxtAoj7ObluAjzS+ErjmNr9SPiYkAjb8KlSkAUts=;
 b=fJxe/H51sSu3AWYdS7y0H1lxQ6lNLy3E4r4ebfqMFNA79BY4GAnM4T2IguVx7Km20C
 1AGp5AwGZSJTUlyK9HkUthdRExzS5xvBPpFjGxEO+I2lf+EXXlVmQD4Y9ui7ZPDXZtOq
 laKHz7Q+uY2NgmUesM94vcZJ9D5Ir/Y3dM9/dn02jgrhwOVoWcYf0Mb9amFCSURWGXe8
 sQnV8YyedRWBRGpb1UnFUFgCDDMa5GgyKDlRNFUhkE3DNlWzgEutr8tiGPP8ZaGnxacz
 WKepQrDjgCyjRgyhjGKJa0k+7SBciVAZk2HMMbmUBK0bjgphOr/635ykY7bZm1c1g6sQ
 s0lQ==
X-Gm-Message-State: AJIora9DGqj7YRD7FBo8I956X/MvWAJNlBuKX6NyHULVsQoOMVeKWxaX
 PJg/IGyiCVcvjTZHT0TVHKd8/GAarPk=
X-Google-Smtp-Source: AGRyM1vPa7lRnFhi01lu+bx9SMZAW2dlJvO9SaJdbwIHDn3lcLIU4Wv0J3nzxGpN0aD1660CnWP83g==
X-Received: by 2002:adf:f847:0:b0:21d:6c3b:ecbf with SMTP id
 d7-20020adff847000000b0021d6c3becbfmr1455706wrq.423.1657259417437; 
 Thu, 07 Jul 2022 22:50:17 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l1-20020a5d5601000000b0021d7799cf4csm7616300wrv.61.2022.07.07.22.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 22:50:16 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri,  8 Jul 2022 07:50:14 +0200
Message-Id: <20220708055014.2613137-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hj9SxtAoj7ObluAjzS+ErjmNr9SPiYkAjb8KlSkAUts=;
 b=LjOU3h0HWvGqq5ZDX+K00cxMWl2Nm5bU2EnO8WoQJAMzTmn6CXDegBum2HV8TtOe+H
 EfGC3pgqSH4It10X8puO7y5llv3huYl3ooO9/HtCdYvzxsQbpIzYF6xx3Wjqwb9ziAWz
 PVWRgkdrXq3OWpCf4uAiucHMHJUmIfLX4cw8cyEA15Ny9ToNgpqryyz8+L67s/uEl4Qd
 KpqxQJlu+vkX/4BLehUNtfWGiNTufsv6OBh3eUEu94SbXfjN2FQfloFOVLc1TtpT9KG8
 LTh0anUX2GzeQ3ulsnqG1TVrmnzLMYhSZpfVzfbABCgfoSKyIcpnNOWoBqwm5Y+G/qVr
 5nug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LjOU3h0H
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.9.1
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index 14809402d..713645692 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5e840f0224891de96be4139e9475d3b1de7af3a32b95c1bdf05394563c60175f  luarocks-3.9.0.tar.gz
+sha256  ffafd83b1c42aa38042166a59ac3b618c838ce4e63f4ace9d961a5679ef58253  luarocks-3.9.1.tar.gz
 sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index b28a1bd57..2bec2fca2 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.9.0
+LUAROCKS_VERSION = 3.9.1
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
