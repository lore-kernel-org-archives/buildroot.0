Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02662C54E58
	for <buildroot@archiver.kernel.org>; Wed, 13 Mar 2024 09:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7FBC40AC3;
	Wed, 13 Mar 2024 09:14:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ftitakvoYzgv; Wed, 13 Mar 2024 09:14:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2580C41558
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2580C41558;
	Wed, 13 Mar 2024 09:14:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2BC1E1BF3DF
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67730813B6
 for <buildroot@lists.busybox.net>; Wed, 13 Mar 2024 09:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5TbEF7NwzrTi for <buildroot@lists.busybox.net>;
 Wed, 13 Mar 2024 09:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fperrad@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 171D181380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 171D181380
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 171D181380
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 09:14:27 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41330d48a29so13733595e9.3
 for <buildroot@busybox.net>; Wed, 13 Mar 2024 02:14:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710321266; x=1710926066;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cjs+e44XOjOT9xASMf/zP9IzYFKZLlIMPovwQLnPup8=;
 b=WKE1Mro7JrsJnTKEHFeTH6kgOUwccRrEgtVrlZR4mblRxONoL+mA8pxiZuT2aqHVhM
 bI3aiOIj/90lAKuJhvOoN83Rw87IgPWIJFR6mU5kKZCUzivad71MlNGnTs2hFPZd/W3g
 dg9uzS4m3rSoWMT5EXYoOjktQCH4ev/r7Z8jU8ERCb+Q0mInP/NFrWeTIWH8PGUzAN3x
 Cv+VnU+3ZUk0BFUsf/OUaOTrsHMmRbciH4hopBGR00YGpZPtmpYTKj5F2AZWHBIrYSqb
 vposZKAAd7xMIyPzqxYZG+BlugJoHJs/UDdpK2eHxtaGC1Q2aOGxFndWhpeNqUEePuMa
 MJJA==
X-Gm-Message-State: AOJu0YyZFtTHnaoRKf/L3NySKx5XRGgwtyOVTTQ9dvKw52tiJZQ+5pnP
 jx6PuRIHv29hVXG6ATDD2QOyXg/pyqqxecEtAhkcH5M9RGB/YPqS2lnJNgdB0Qo=
X-Google-Smtp-Source: AGHT+IHskAnws05aQMncyiElOeK3kqTWY+xbeHLNPQE3YEyyyoL8XRRsjHnHjH+VyyNu1XmA0ony4Q==
X-Received: by 2002:a05:600c:3548:b0:413:1622:4d04 with SMTP id
 i8-20020a05600c354800b0041316224d04mr3032744wmq.12.1710321266213; 
 Wed, 13 Mar 2024 02:14:26 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.92]) by smtp.gmail.com with ESMTPSA id
 u1-20020a05600c138100b00412e5f32591sm1699799wmf.28.2024.03.13.02.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 02:14:25 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 13 Mar 2024 10:13:50 +0100
Message-Id: <20240313091412.20865-9-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240313091412.20865-1-francois.perrad@gadz.org>
References: <20240313091412.20865-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710321266; x=1710926066; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cjs+e44XOjOT9xASMf/zP9IzYFKZLlIMPovwQLnPup8=;
 b=LYfCZ/FQME8LQvYOo58Am7AuZcDnfkO1AUFyZdflZ2LCaF0B+2PTJQTMQfLFrxBcOy
 e5tpj3YccRPsSVAQq4uSEQN+AA4L4guDiZBYzCEnGND8NKUb4a14sN1pT3DOcg6Zm4u2
 Ptuo7POPl8gbxpsyIjMI1wuGeiRPe7Ysdtg3MvsyMcLiPLlSITKCipcwV8aIxpCWSgj7
 4hILADNdjW+7UoNurj0cbBwTW5eX1xfJPhcMLaN0YVILanudddepzWK0ao/l2O6+HeUR
 pKEyCuGn9TJ4G3DD5Zf33MuNtJHYehfLGYty7NKrq/xiRX/afWD7k9pX7C7PhWbbfhQ5
 TiIQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LYfCZ/FQ
Subject: [Buildroot] [PATCH 09/31] package/grep: disable busybox grep,
 egrep  & fgrep
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
 package/grep/grep.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 61900bb95..b0602e9e7 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -45,4 +45,10 @@ else
 GREP_CONF_OPTS += --disable-perl-regexp
 endif
 
+define GREP_BUSYBOX_CONFIG_FIXUPS
+	$(call KCONFIG_DISABLE_OPT,CONFIG_GREP)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_EGREP)
+	$(call KCONFIG_DISABLE_OPT,CONFIG_FGREP)
+endef
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
