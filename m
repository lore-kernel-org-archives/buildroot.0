Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7666DC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:58:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B10760F10
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0B10760F10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B65D0404AC;
	Sat,  7 Aug 2021 08:58:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h0ir2XBizUO3; Sat,  7 Aug 2021 08:58:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 800AF40442;
	Sat,  7 Aug 2021 08:58:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75D7F1BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6343983A9F
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:58:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FHUVQDnBc9vP for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:58:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87C0982BC4
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 08:58:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso7709496wmp.1
 for <buildroot@busybox.net>; Sat, 07 Aug 2021 01:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCtHJpFQSu9zTQRxhp+jli9OWNl7578vq+oa5x0K/hw=;
 b=QtWxexq886869VpHe6VCz1zG+n9BVvWvKUvg0FWnryxzQftZwnxHlprBXwpGGObSep
 VlgvbOtq3y0h0dETczczRwzDzv+yroozA6GfVORgJPN8+StJBduJhw5kWvEcpw4shBmw
 NypPkmvuiYW8LV6mB+zUJLleJv3vyJ02MBr9Q/3VAD5DIkR9T4v63448ayQ0Ts4WhPll
 6ps8lelQmtiesHH6Cgx1piJ8+5w35yeiWoqm7/iYBNuYDEnEhM3ID4VR0SNsMXgMCM/L
 7gUCyzWF/jwbafhlzYoFpwRL/FKXwIvpcr7eD5t3c4BYwZDXzoX+Ke3u3vIYXu5caaVD
 GptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jCtHJpFQSu9zTQRxhp+jli9OWNl7578vq+oa5x0K/hw=;
 b=cRSprRota67qdrY3hAJ9krxtINoiH3A0tWfwKCloHCPmfRZN4zjP9ONCNZkswXD3mS
 k7cyDr7qD/brWPHRFMemrtQBL6FUHP7hqaTQHzWngSG4dRG0bDNrgL/PQbVf9aop5rQO
 H5QOOihKe9hqSdbVOMnZ66L0AbJ6Rt/oC1DE4/M5oE1/UwwFgzdEGyjanZkgmelRk1Hv
 LtlLu1NVJ/wJBHRqIVK8WHYmXzkK/w4eAvWoKlh8t9qNBQvT4aoZEf9Yggoa7XuuTvNQ
 XXhtKTKkkYPGMhFoxHEz66QiBTBPm6ZmeMf7XD0p8Ao1Iga4zM6hlOcSMWxGNtWVxWyq
 DSeA==
X-Gm-Message-State: AOAM533EcoGKgNl6JFRa1LlCCfydZurydybgiWoFgKCVBwDFTgmDtLlh
 +FW67A9fFYmJnXZQ06jpCp8abLHirtM=
X-Google-Smtp-Source: ABdhPJzNwoK/y6kCfLuUlPxAvNkYNdp8FWpiE8YtKWVmKL6ibJiUKhElCP61jN05x+NRFWyFsuWbpA==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr19972083wml.18.1628326682570; 
 Sat, 07 Aug 2021 01:58:02 -0700 (PDT)
Received: from vm-user.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id t16sm12718110wmi.13.2021.08.07.01.58.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 01:58:02 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sat,  7 Aug 2021 10:57:51 +0200
Message-Id: <20210807085752.3269-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/2] package/lua-lunix: force no sysctl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fixes: http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/
Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-lunix/0003-force-no-sysctl.patch | 32 ++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/lua-lunix/0003-force-no-sysctl.patch

diff --git a/package/lua-lunix/0003-force-no-sysctl.patch b/package/lua-lunix/0003-force-no-sysctl.patch
new file mode 100644
index 000000000..3467e2713
--- /dev/null
+++ b/package/lua-lunix/0003-force-no-sysctl.patch
@@ -0,0 +1,32 @@
+From d9b65e306478f5d2356ef90eab8191984534238a Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 4 Aug 2021 15:27:05 +0200
+Subject: [PATCH] force no sysctl
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ lunix-rel-20170920/lunix-20170920-1.rockspec | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec b/lunix-rel-20170920/lunix-20170920-1.rockspec
+index 76cafeb..e42fd34 100644
+--- a/lunix-rel-20170920/lunix-20170920-1.rockspec
++++ b/lunix-rel-20170920/lunix-20170920-1.rockspec
+@@ -35,5 +35,14 @@ build = {
+ 				};
+ 			};
+ 		};
++		linux = {
++			modules = {
++				["unix"] = {
++					defines = {nil, nil, nil;
++						"HAVE_SYS_SYSCTL_H=0";
++					};
++				};
++			};
++		};
+ 	};
+ }
+-- 
+2.30.2
+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
