Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4F8CF45D5
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 22:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCB5A61102;
	Mon, 12 Jan 2026 22:19:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHbVseDeJqK7; Mon, 12 Jan 2026 22:19:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB6BE6105D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768256376;
	bh=5nEBvM04C2K+vNCwZ0ZYTtAY2rpKkP4iHa9KAqu8Wvw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nCMI/XxQUoSTL6zp3H5GXDoYgWKRkLbI7aGOqKH2tBkI7mXGhbK1OcqncN51plSlM
	 QkEpc/lJ5+S43g2jnO/y0imGOMhe6UVYgEobvoiWxXtcGTCj6wbbLR1SosTWBgT+h7
	 QuO1PN5AAxi8bJweH58AEbsdGRz7jQw/UXrwxG3gewzmXNjhlK4kTpkTYerLbb/Q09
	 mrtlycCk8uaW46Mrqxi5NdFuh3/bMeHufjVD1CSmNAdOsypxDXPvonk/xZ/2XRUGyG
	 VhdU28nYYwQNl1o456OeSO6BeCHHJ75y4wBNevby/Kjdsekqvx3oWdPqFHsJwvRs0s
	 baEfXe7UjrKJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB6BE6105D;
	Mon, 12 Jan 2026 22:19:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 162291CC
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F170A80A88
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2v73MrMn-dHz for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 22:19:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com;
 envelope-from=mr.bossman075@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9780C80864
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9780C80864
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9780C80864
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 22:19:32 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-88ffcb14e11so76944676d6.0
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 14:19:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768256369; x=1768861169;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBjsIYuxOpt5qQ4bl9G4EawxD+JKfsl8GqkpuWRzcpU=;
 b=v+qEuctb+vkB2OBkAf6PsaOzT5goGX8/IKngAzK9TtDm9L/cL9NhMFnor5NgMNBHAM
 jo5WbKqV14T3rrW2mfLATn4Rt6amzZkFSFP2WJlnDYpWQcEjG2BxqHoz90s+FMPnEepS
 BGIadk2XofllWxmhLnlHLaGELjxwjNHD/89WZf0XnvDHewGYgiF4X0Fhr+PN6NgjjY4h
 YlxMl3HpXU+FI6peAF4HcqjYH0A7SIdotYbX7iFjsT+1AG3ajcH3U/76IHSnTmeJupHP
 c/3kSWYyLdEKl03XRigm3otrOX+0076HZbjhT2fdzcuRl51ppVnmvF2LajYntdAsyEvY
 E8uA==
X-Gm-Message-State: AOJu0YyuLKbc6tKP+Sm2YIUAec8nrZtA+y0NH9lfEaqJ3CbrFh2nuwvs
 jvbwnz+2nIV5pQssr2x1YMcu/I36ouw4SneztL3DI7VEPCzyhAc+Yx9vt1SYGA==
X-Gm-Gg: AY/fxX7U/Gk70xxaaxQG0tr4WJ0YmMjm8FSY60jInBBb/Eskxvpkv8Ptldn7XxnLJCI
 sF/pnhyPmJpsBM9L4yFhfjK5QnpWOL5O29BMsHS9adhnhYHYrOAzlTwIOUEUmB5jXi8E1RqIv10
 6NX7mGz5LGAT1Cj74jGq1k5jsrZBgLAS/TabmjJ2wPNkRnu0cLibhofOLh8xFMiwzg0OZ0nGjrW
 P6VPw9N9izkYUM52k2k2YSeF+bS/TTboaFWulIcNaSAHKuyBoygi5rOyl7RjO4IEBdgSLQYeTyt
 ooEgvlmqWrtIMm6JqRs5rw3XhdYwEYDtkoWaf6xZX1ckMCyrZP7v6CYJd7aJeR7FPoEu9s8vH+k
 tKFpk6PfZMtXMVfGQzA5k8CU6hV2nw1wlf2HzXfu5adhp1r2oCa4U9WgYyf7twE9O3QI1qu83yS
 TM7FGi5XjT6eBYXjUevZqFlRUeMyDLA/z5gOPlEJqojKyGlTnsCDDhGojLx5bEAfp5
X-Google-Smtp-Source: AGHT+IGhA5yNcAj/qUdg8h7cFveR0QQRZRdxR9xZ1JbA3MgTC0xIeNEOgRe75g4mFzsMlRnalM1uGQ==
X-Received: by 2002:a05:6214:21e3:b0:87c:765:dc6 with SMTP id
 6a1803df08f44-8908417512dmr268622576d6.8.1768256368697; 
 Mon, 12 Jan 2026 14:19:28 -0800 (PST)
Received: from jesse-desktop (pool-108-26-186-76.bstnma.fios.verizon.net.
 [108.26.186.76]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89076fa0718sm140990246d6.0.2026.01.12.14.19.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jan 2026 14:19:28 -0800 (PST)
From: Jesse Taube <mr.bossman075@gmail.com>
X-Google-Original-From: Jesse Taube <Mr.Bossman075@gmail.com>
To: buildroot@buildroot.org
Cc: Marcus Hoffmann <bubu@bubu1.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Taube <Mr.Bossman075@gmail.com>
Date: Mon, 12 Jan 2026 17:19:26 -0500
Message-ID: <20260112221927.3745398-1-Mr.Bossman075@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768256369; x=1768861169; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wBjsIYuxOpt5qQ4bl9G4EawxD+JKfsl8GqkpuWRzcpU=;
 b=NCoTocPrv+7AoAD4XYe083HMXAtJBAQQQ21ZxCT920mbL5g8AxCRn4zt2Em8OPU/E6
 7DPKBp2NT0//L+lNNJgphSD48RV4wJA4EQyDZ+a/yfBuvUcYJDivUyaqRzAtTIjeSB/Q
 wpn65nfT2eoNUvPKiws/gdrpSSB1EeVJM/pW7OXwZaPsMBvNMl5Syuy+N/ZpUBxqAIjg
 rtKB7FgLPu+m2bCYsFHD8flVn5DnqchAGOfbaOU/1roKNwryDkCIAogLJy62//WOa4Fp
 1J4NCWt+pzpUHY5XsLyr/cJxsiDALiy8aKTVIgsiqPvCg9TJg1BBjsjI2bizT4rsDjSo
 53Tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NCoTocPr
Subject: [Buildroot] [PATCH v2 1/2] package/pico-sdk: Add host-pico-sdk
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

Add a host-pico-sdk package to pico-sdk.
This will allow users to build rpi pico applications on the host system.

Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
---
V1 -> V2:
 - No change
---
 package/pico-sdk/pico-sdk.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pico-sdk/pico-sdk.mk b/package/pico-sdk/pico-sdk.mk
index 3f242ab06b..5bcf71650d 100644
--- a/package/pico-sdk/pico-sdk.mk
+++ b/package/pico-sdk/pico-sdk.mk
@@ -19,4 +19,10 @@ define PICO_SDK_INSTALL_STAGING_CMDS
 	cp -r $(@D)/* $(STAGING_DIR)/usr/share/pico-sdk
 endef
 
+define HOST_PICO_SDK_INSTALL_CMDS
+	mkdir -p $(HOST_DIR)/usr/share/pico-sdk
+	cp -r $(@D)/* $(HOST_DIR)/usr/share/pico-sdk
+endef
+
 $(eval $(generic-package))
+$(eval $(host-generic-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
