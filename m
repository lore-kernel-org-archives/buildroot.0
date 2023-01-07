Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A02C54EBD
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 01:05:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 717BD409A6;
	Sat,  7 Jan 2023 01:05:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 717BD409A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ymEeIrZx0oe8; Sat,  7 Jan 2023 01:05:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78DFD40940;
	Sat,  7 Jan 2023 01:04:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 78DFD40940
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D50581BF59B
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 01:04:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF52B40940
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 01:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF52B40940
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2_l2VZfU_Pbe for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 01:04:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C789940911
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C789940911
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 01:04:45 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id u8so1886390ilq.13
 for <buildroot@buildroot.org>; Fri, 06 Jan 2023 17:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qK3PM5y9P+NMeVpx/pAIjrY4sI7JRkZhW3DR29Z4BGI=;
 b=tMZNIlAmoEGPNi0FSyGkbvngxCw8i2SQfQIXwvewo2pc0eVveJsuTeCqk7WRDl0yI7
 J83+d3YgVO/4bzYBvNLc36WVWQASvg7QyuiSkrvaO35lEG+oh7712cH9YF/R0xKdW0vq
 0FfJfdx4UQmrUCI/6ZRlz5Hv6iNbPQ4wQ0w9hyb3nb+LM3QmasgPDaXalMXwgnSNMKSh
 A1vIkJ2MADmLFaTdEAwUNNZCLGQpc/SnbdMAWId6iQEhlRVgwHish29exbwvZ+xsTFdG
 hqn2Q87zDi1V9E05tllhDM/KYjPOYpvGzN1AUEHhxSkARwKI8edLpww8f0YdgvdpmKDc
 16bg==
X-Gm-Message-State: AFqh2krC2usm8pfmyKMSasYt6GLUcFC2SxFXaSPeK9lBEuJx/S0S9a52
 qcdoWDsOxNuCWpY8Pz1Mw5px2tf80Fdlyg==
X-Google-Smtp-Source: AMrXdXvL2ouY4pNLL6fXNd0C3vr4yPvr/Baqzbe+iiWKbDLmagyAlGVX/4J4P7H/qalFsldCrBfdZw==
X-Received: by 2002:a92:c90b:0:b0:304:d0b7:e56c with SMTP id
 t11-20020a92c90b000000b00304d0b7e56cmr39247126ilp.14.1673053484583; 
 Fri, 06 Jan 2023 17:04:44 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 e26-20020a0566380cda00b00363c4307bb2sm725938jak.79.2023.01.06.17.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jan 2023 17:04:43 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Jan 2023 18:04:35 -0700
Message-Id: <20230107010437.2471513-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230107010437.2471513-1-james.hilliard1@gmail.com>
References: <20230107010437.2471513-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qK3PM5y9P+NMeVpx/pAIjrY4sI7JRkZhW3DR29Z4BGI=;
 b=AT8PwSD89iKQfg8fA7+MVqzCJAG8JqW4jN5oqabVW2l4mofaPJUFGce0Fg2HDhrzDQ
 gLnJeMFqBEfv+oOGML3TyPTcy4bC/7aw7vSAEXPEvcXTsrk+C6CNHEPzK6yC6ifKQ3dz
 oLXRf6dd5tJ4G8FDKJ2SbQ2mF48oVLPkksk+URMfUeQq/vMH/8bODob8TsMADSiad0P5
 RuuoUo7CJG7diNCTmVVsLkMLGlgl+zt6xoh7dGmLod0CJlrQb3XEIv17U0vBRYB60eie
 UBCi8hqVGLJ+HVVKN6DRHu6Lz02p7XphfbNxUWUOa7QqJH6OXwffreMfOQsRedKFI1gp
 eDzA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AT8PwSD8
Subject: [Buildroot] [PATCH 2/4] package/zstd: disable ccache for host
 package
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to disable ccache when building host-zstd as the upcoming
ccache update depends on host-zstd.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/zstd/zstd.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e8f6315222..cb4f4cc611 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -98,12 +98,16 @@ endef
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
 
 define HOST_ZSTD_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
+	CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)" \
+	$(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) zstd-release lib-release
 endef
 
 define HOST_ZSTD_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
+	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) \
+	CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)" \
+	$(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) install
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
