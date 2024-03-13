Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF5C54791
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61CA640B2B;
	Wed, 13 Mar 2024 09:14:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8b9DZpYFph8; Wed, 13 Mar 2024 09:14:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28F5B41583
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28F5B41583;
	Wed, 13 Mar 2024 09:14:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 452ED1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 323BC8133B
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NZjjJSAhi_VJ for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCD7281375
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCD7281375
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCD7281375
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:28 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-413e99afcc8so2206165e9.0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321267; x=1710926067;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IWym5oqziWvkY2ZOSsj+cenzbVCa1FwDMxOZ+8YiZb4=;
 b=dZRZn6XS5WhVfxfr923hKLnFNGPyhBg/NPWeWmkRBNDbLtWe3l5TFt29aDiIngJ1oE
 o2lDFVf9SFmJi41Gt6X7ivq9cfg+2SVdMbNYkawrR20XYUH2nX5CvI2RAP7aTqzJiJGZ
 oUzZ8sHD/Kb0VYySya2ULWf3imyUjrdeDlU/ddFFxTPJalzUErII+4v/eF03L735uWZj
 0BShzmW170C3oPf8CE4JllT+vTcmbpbYG/WAxZB3thJmehoE2WBR4VL4D/YSCjIg8neN
 +SrY1laC2Wm756JemJytZkmNxEIjN81MTZxugJrGzDDDANoQWFpUag+BxDNSnUJiPlcf
 /O2A==
X-Gm-Message-State: AOJu0YyJUy3COQSHomsDxkjcTHqXT0RMs96r3p0266Fw/TPIL9klp68p
 XHNFZaVtIM3LoD+uXqg8ojvfcfYJ+BZCcI9KXlyJYRWKmk+8MstNdHHaFZwnTpo=
X-Google-Smtp-Source: AGHT+IHWrwlyXOjRklIbw6OQPRCc8vCaqJwDMUBS6CN0RL8nb5Lan9uPgLDeogiVWhfrb4sg94XepQ==
X-Received: by 2002:a05:600c:4e04:b0:413:2950:bfc7 with SMTP id
 b4-20020a05600c4e0400b004132950bfc7mr3128073wmq.8.1710321266893; 
 Wed, 13 Mar 2024 02:14:26 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:51 +0100
Message-Id: <20240313091412.20865-10-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321267; x=1710926067; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IWym5oqziWvkY2ZOSsj+cenzbVCa1FwDMxOZ+8YiZb4=;
 b=YVYQ9G+1fgLVMgYGSZ5bPYY/YTGo0Z2VhbRNy+UG6W2IhSEMAYfx8j+Y107ufNClUn
 xuNN38vA0fYKlb4ZptMdQocYFt3bctbjJAszO8BfWVwtPz8q8Y5JZq8JdpvMcyFkmqLC
 7/Yo4g+wsBrEue2wOKVP7dYaTDvozOlqfsR3cnwV2SsUb1sKqGyR7cGpj+fsSgaeEXHR
 ThaTJMVYvQUX9giuAgFEgeEDhwS2+XCiiziJIAqi9mJPFDEjWTGlY13hoNBDGNUY3JYK
 pOZjXPRvppm1K1JER9C+ECXm9RSA2hrORmGpcMUe3/5JCEDKAxVH0d3LifPhptjSfXn6
 xiPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YVYQ9G+1
Subject: [Buildroot] [PATCH 10/31] package/gzip: disable busybox gunzip &
 gzip
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
 package/gzip/gzip.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
index 330321352..3d16235b0 100644
--- a/package/gzip/gzip.mk
+++ b/package/gzip/gzip.mk
@@ -22,5 +22,10 @@ HOST_GZIP_CONF_ENV += gl_cv_func_fflush_stdin=yes
 #  "using /bin/sh, even though it may have file descriptor bugs"
 GZIP_CONF_ENV += ac_cv_path_shell=/bin/sh
 
+define GZIP_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_GUNZIP)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_GZIP)
+endef
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
