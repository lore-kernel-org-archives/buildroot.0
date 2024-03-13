Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F2AC54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00F4B4150A;
	Wed, 13 Mar 2024 09:15:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s2FYQ_NNQJsl; Wed, 13 Mar 2024 09:15:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA01F416FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BA01F416FD;
	Wed, 13 Mar 2024 09:15:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7DD41BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 011C681420
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mh_IicJfrfej for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B9308137E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B9308137E
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B9308137E
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:38 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d46c2e8dd7so5413421fa.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321276; x=1710926076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iqQvMl+e+GMMLOlJu3XJ672niwWIm/PtKU2exXtcIns=;
 b=wogRX8P7NUpmoeU2Y0OeEdFgx1izfv2KG4Ow2k7DnMPFvtubH4BIRl+DXYQ80mESq9
 Vroz4QgYUiKRP5JPX7tyOicgvI4mYrzyfMmcPMSpSs7ESNlxo00XWvcYh+63+VMRJ5Fs
 VFokOCbotDO45xY6OiEeXVvg6FhTSycmbskHGzAlRNyCObKZ3vQEBj8nq4KkLO9Lx+x/
 Ol16c1w1uyh8aXvAvJ7hjjKjay6OtJHRVLlkJyqqv7OdrCEbx0hOXa6Du/1jN5mSHtJt
 ectFxknuMSaf1f6K02tFSJiqvgDiQB1TrCOjXG/GIN9S0MeZQ7wQLU4rv2b7Ykoe8WmQ
 z0GQ==
X-Gm-Message-State: AOJu0Yz8T27TJA2WG40HFvgGBg2EbAKaAXHIvgVep1n6Bpdq4lgsWtCT
 mtT6WXB8Gn7vr/++nV3X4kdQ5evacitfV+NBGIgvEbQCLUVJBRa4OeIFQLjxx1I=
X-Google-Smtp-Source: AGHT+IF37m01a8JEffHbbfGBTYUTszNKmAPaEW5mlP0vedRhaHLosnE1JtCY4bzxUFc9AVwUG1FFNg==
X-Received: by 2002:a2e:9b58:0:b0:2d3:1bd0:6bcf with SMTP id
 o24-20020a2e9b58000000b002d31bd06bcfmr7276785ljj.8.1710321275875; 
 Wed, 13 Mar 2024 02:14:35 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:35 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:07 +0100
Message-Id: <20240313091412.20865-26-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321276; x=1710926076; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iqQvMl+e+GMMLOlJu3XJ672niwWIm/PtKU2exXtcIns=;
 b=RrL5YloS6+I1o0x0BE8glTiKfrsxUUUTZVg8GFLXqRsBZ/7L1hybYnfihGSN7qwQ9S
 0FxkgodKDZ8/gjxI8e0nLv/EVQNnob/U2UvcMEeU3TrzhK6doegBRdXdlI7VEuM+n0O6
 /z7kpBRiiDG3EDWCeu+c6L8/gMH4RksKUaFgNsVRx/LRse8UdE+j9oiAYZcHsrpwxwvL
 WUksACb82HxrtKYdfbM8XWzgt2m80qJn/0+4psfW2xItZdXuj2d4f/6xQuI14YeoOIHZ
 wywU+Ai9s/BvzGDTjWRTalzgfvcZsLSLE5J0SqTKPvIaxMJUZ5m/zshG41lRrT4P+cJy
 5sNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RrL5YloS
Subject: [Buildroot] [PATCH 26/31] package/tar: disable busybox tar
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
 package/tar/tar.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index d57d63970..ec4b7f7ad 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -33,6 +33,10 @@ else
 TAR_CONF_OPTS += --without-xattrs
 endif
 
+define TAR_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_TAR)
+endef
+
 $(eval $(autotools-package))
 
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
