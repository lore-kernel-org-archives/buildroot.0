Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D94C54E60
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34FCC41522;
	Wed, 13 Mar 2024 09:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RPJOb3m2zODD; Wed, 13 Mar 2024 09:14:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EEED54154F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEED54154F;
	Wed, 13 Mar 2024 09:14:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1EA691BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FD5B813B0
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PiMGOT7bPo63 for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 598BB81346
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598BB81346
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598BB81346
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33d90dfe73cso334934f8f.0
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321265; x=1710926065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Kq1vHvPqEB4b6CqVY4ICsDxCbom6JHWuy+Luul3Yg2U=;
 b=D8/cd2tyo08Id9QqheOzvNIJ4YD8PMEG7ZbwkVp07mCuBl3JcWFNeaojDZGvwQcse7
 suT7tgO+dXiRNC1fEhAGOHfRw6LAWDnOa+afwEMdcgj+nNAkVFcsUyI+oky16ONXNPc8
 kscQWslMRk4IiOozOHlIgib4tYR1+QPO5sNYHoDv9ncnMBJCy97kLqHxqizOOPs52aWY
 /eJhtXY3jQwsR03HS7Oi1DIcf9ouM5yk/4dEXb80nDkUWrAaL4s6ctpAu/17fwNs4RFz
 oa0kmP36RdI9ipmbzn9vG83MVQh6FLxVP2xXU5eR/V7IGB6O9WbZcSeUxNTBSYH1VkWS
 D8kA==
X-Gm-Message-State: AOJu0YwjhIOv2XxUELSzZz56qNRVa1kfHXQI5Y6WWafSLcbEBBzD368h
 Szut4KgpxehcYTmw53SgEKjpsZ75pEfVMhK2ab0lpydWgasMS/W1PSuXmJ93RV8=
X-Google-Smtp-Source: AGHT+IFPUGqKQkAGxwljjUyL38mWPjjuoEvi20jfmhNNPCz7UHAmTMn6du3tj9CJBT4PGFsiEJZRlw==
X-Received: by 2002:adf:e049:0:b0:33e:764b:ab17 with SMTP id
 w9-20020adfe049000000b0033e764bab17mr1449965wrh.14.1710321265206; 
 Wed, 13 Mar 2024 02:14:25 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:24 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:48 +0100
Message-Id: <20240313091412.20865-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321265; x=1710926065; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Kq1vHvPqEB4b6CqVY4ICsDxCbom6JHWuy+Luul3Yg2U=;
 b=a/TuMa7qUJ6C0ftMwQF6BYqw3n5wY4e5mStuoyMLX5+9wPCUtAV/P9WOILZz6Q0Kze
 w5zNRDJQI5kSxY3WfA3EdnlwQxT+KCZiiACjGZQoQAyG+zXwXQwbW88UUCmrN/Hpv7XX
 cFRdDp2CCfmVc3KsBaIaqpnp3GchNGmAxkN/1vwV8LamEQMnHsmV5LA3DF5TGZrB8AdC
 VQzO7pFsFrkj2OrYodI2zwEP0Z/f1knhlp53SFpfIO/DIcH14t+uxwGyZH73j7Qd29gb
 oypk47EGA2IkDmYtarmQ+Up4PCCbItYkerbSwJI+bnkm0Fo2AURlHAyvGNTdFXbIWsej
 kHYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a/TuMa7q
Subject: [Buildroot] [PATCH 07/31] package/findutils: disable busybox find &
 xargs
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
 package/findutils/findutils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index 9731a3504..89ff17a42 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -22,4 +22,9 @@ else
 FINDUTILS_CONF_OPTS += --without-selinux
 endif
 
+define FINDUTILS_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_FIND)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_XARGS)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
