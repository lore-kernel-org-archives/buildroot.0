Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B9C1C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE9004154D;
	Wed, 13 Mar 2024 09:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tjIRTfF5BJjW; Wed, 13 Mar 2024 09:15:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB09B416DB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB09B416DB;
	Wed, 13 Mar 2024 09:15:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D8D51BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0315A81375
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Afqppt8weXEF for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 474418137E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 474418137E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 474418137E
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:36 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-413eab9580dso1765655e9.1
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321274; x=1710926074;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3p4AsmcIbALuuAZlxxixWCWIp97mwjyuIoplDotbPWg=;
 b=gDpnli4nj9hdSgl8awRVXHmwiSTJ1ZimhNtm1AFGnGiy653jbw04EZ8gSbJVqMxfVO
 fW6DvaoGs6Nct7ijq4rzcvkYI8lVfi8wYGjE8ldnjP+3ORvHt+mffo5667atTbeyF8rZ
 Ulmm1Pzdkb0r1kTWaYBrUORMbmkkmVZGYrie22JAQ1Mv7QzTKYk42Au/AjjT6antPFe5
 VvlGpwYBdqqqQg1/Mu+YmGXaP9dQ2c+i1lAPJW2VxlVIGl9ZJYMoKnL0scAtdW7wRBgW
 5GJI3OQfemsjem0xyo+ICoP3M/AJazVY7jJjiynH1p0w54nftmVAy3r0I1143hlyWKLO
 owsw==
X-Gm-Message-State: AOJu0YzudFYszuc0yWkW6nk7AtTp8v66VyLSsreUCHfKKJFzkKtYHDX/
 04YXhUSK85yx0bHsMNuPW/epyQHQPPaOFgr2CoZyprCc6AyBTpc52SlNbD2fKgQ=
X-Google-Smtp-Source: AGHT+IE3Hlx2pzZsagjCOmIGATu4b0ayBRPlWnozQGuiJVfXhwpb5nJpvTe4q8C3cHaU+NSQL21wSA==
X-Received: by 2002:a05:600c:4508:b0:413:2a10:8a29 with SMTP id
 t8-20020a05600c450800b004132a108a29mr5630562wmo.13.1710321274495; 
 Wed, 13 Mar 2024 02:14:34 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:34 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:14:05 +0100
Message-Id: <20240313091412.20865-24-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321274; x=1710926074; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3p4AsmcIbALuuAZlxxixWCWIp97mwjyuIoplDotbPWg=;
 b=l1zM7Q3lz6y4PGKmKqyZ8oXtXvih0MPdSays+lrVt8l/XrGPxSylmiBynBAN/boySt
 gG64/tedfGodayt0ofwq1WBk3OTkGb/1LFy2C9O4Kt20lQxkcV2jAJmkoZixL/FIGHTZ
 h79JNp8iXJEZ5fe6MpEb1K49EhIa6cTfl/xDp1tV9R1gHEUePk0pRFC8IED/w3cVzAGT
 5fLHaJjBGAgi+CXKX7g/+sj02kzVN7OVbSPH7erdcAyswQEf+E1KoxcssJjI88I5PDTN
 h1hTFcX5iSpjzXyRGvy75SWNCpMV+u6R3rUfXQrKY50wj5s2qqVFuyKvGI/dNMTQsQde
 gzGA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l1zM7Q3l
Subject: [Buildroot] [PATCH 24/31] package/sed: disable busybox sed
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
 package/sed/sed.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sed/sed.mk b/package/sed/sed.mk
index 816508365..e5a2206f8 100644
--- a/package/sed/sed.mk
+++ b/package/sed/sed.mk
@@ -21,4 +21,8 @@ SED_CONF_OPTS = \
 	--infodir=/usr/share/info \
 	--include=$(STAGING_DIR)/usr/include
 
+define SED_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_SED)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
