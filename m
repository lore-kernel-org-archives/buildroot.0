Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B17C54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F39C0416AC;
	Wed, 13 Mar 2024 09:15:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cW2ZkgeFo82Y; Wed, 13 Mar 2024 09:15:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E79B416B2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E79B416B2;
	Wed, 13 Mar 2024 09:15:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 44C1A1BF842
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDBAC81418
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8qZsE7GN5ohx for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 06077813B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06077813B6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 06077813B6
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:34 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-413e99afcc8so2206695e9.0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321273; x=1710926073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=udfSQYxr4+v3eg55f8ofmo8LuOsMocI+MVYAG/vXKVI=;
 b=ljgRhO8mwhqohnRgsz8HTLQXK21auFEbcRSTgKr9StgrUGs+yLbykwHjmqdgeYy8rd
 gQ5bn8CKByyz+QOpUroa5qO99iSgDR9esxFTA2k5UO6nWEo2fNS0+DrwzNjLTXhjzWsA
 cTNVelPqI+aKxssmR1uL/9ysFZekn5rXJyX/YB7CqvigWBCv0ViTpROO5O7VAMMSAFmy
 ut6WbvdPFMlHfXTR07riW+9m5c0zNhV/bwt8GAcTDhTNwniBr78daEE1yObHuRdy8Q+P
 iYIPo7EmhgussS46vQJo1/TWRFUItrDm4c0mrLnzNIdPY0HYRjS2RHKHlQDgJ6LiIu3b
 5V+g==
X-Gm-Message-State: AOJu0YxriEV9GVPGLyRnARDwBJ1xj/b7nHE4y3jsZpyZQ5Wi2SOhLUMQ
 tT4N4jQRaZ51D8HDcfKoHmVYPmECLpQsho8+Q+fE4URCZXzCKrT3EBMlH6bi+3M=
X-Google-Smtp-Source: AGHT+IGp5qem60BIjM/qfA5GvLSNJXq4MqsrYNOB3MxcpzOHqyWA2DnF9qZkXi5ndRLI6NDmiIs9kw==
X-Received: by 2002:a05:600c:1910:b0:413:3906:613a with SMTP id
 j16-20020a05600c191000b004133906613amr2735781wmq.13.1710321272834; 
 Wed, 13 Mar 2024 02:14:32 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:32 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:02 +0100
Message-Id: <20240313091412.20865-21-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321273; x=1710926073; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=udfSQYxr4+v3eg55f8ofmo8LuOsMocI+MVYAG/vXKVI=;
 b=SbancNc/3Q0pSOVUHPG1Mgn/DqGgn5hkn3k2qreztEQagT67xl0SOCwTV83+MFJ1s4
 HolKHmQ9/oxEOn7ooPMpGiPlhM3RpSwEbhEJ5NuoO4bPPI95f/cC1piWZTArLfYNj/Rk
 IR4o7AfqYGZWaqvBOO33XcA5/AEVDueHijzBX1XVsufzMJCZhwN02V8E1+PH0sldTtPQ
 k/uliOSqyLwBGS4TPCKHygCGuK7hiiSNnmvbGDYaLERm7acTF1Cy7hcVGe4myl0/RMaq
 F1+5N/cLJ2nC354XNFx8+8KWzl2svMT6qAv6a+gk7/PMLBW9CeQ/aePC/ay8G1mw23VK
 sQSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SbancNc/
Subject: [Buildroot] [PATCH 21/31] package/netcat-openbsd: disable busybox
 netcat
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
 package/netcat-openbsd/netcat-openbsd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
index 311f8aa81..cd1adff1f 100644
--- a/package/netcat-openbsd/netcat-openbsd.mk
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -28,4 +28,8 @@ define NETCAT_OPENBSD_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 755 -D $(@D)/nc $(TARGET_DIR)/usr/bin/nc
 endef
 
+define NETCAT_OPENBSD_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_NETCAT)
+endef
+
 $(eval $(generic-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
