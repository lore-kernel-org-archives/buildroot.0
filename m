Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797C9C48BF8
	for <buildroot@archiver.kernel.org>; Thu, 22 Feb 2024 10:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4508041BBC;
	Thu, 22 Feb 2024 10:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlvtf3ywgiFX; Thu, 22 Feb 2024 10:17:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0A8441BB0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0A8441BB0;
	Thu, 22 Feb 2024 10:17:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0E061BF3FF
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D96741850
 for <buildroot@lists.busybox.net>; Thu, 22 Feb 2024 10:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJoR0en2g00p for <buildroot@lists.busybox.net>;
 Thu, 22 Feb 2024 10:16:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FF3E41851
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FF3E41851
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FF3E41851
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 10:16:56 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512aafb3ca8so4818061e87.3
 for <buildroot@buildroot.org>; Thu, 22 Feb 2024 02:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708597014; x=1709201814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yI6EI4PLyOwb5Mbfb+U9aDSReebynjCbXzyzR7HAgKs=;
 b=sk52w5enObHmbpFVPDW5emZ2AlzXB2o6KUAxYHJxNpQkqCXeSpoGajrGceIKj85Oua
 pIuZ0/Qf6OgiaxiTnhHzhPOLCSlbM5fVo2h01SOtONlJL4GMTdXjgYDHTzYgtveysfCO
 ZetPjc59Ztv/4TKRKFnp+ULNtZ5VMt2lzIOTcoS6rpV1g/lux083Iky61dF1CypxczZK
 61TLCO5/p6uNoFfL5mKMYiAva0KnmJNJMT7YtRdAObLaS+EKGuX94WfSIYaqIElOJG4M
 UAuLof+Ccf1ZAdIemoQdo0mVRpt74IWGdxFRuH5UKKZa0E0uJ5JLWp4A0F3KwiBGcTyG
 ateQ==
X-Gm-Message-State: AOJu0YxBAIKN9zM/Rbuo722NaCon85mxa/qd5F0StBf6BF2/vqrSA1xE
 MK00G0/WDn67M4l+c6jXJPRgfhUzWAbZ20CyU4DjRGmN/5QUkp4VhUet4+mEG1YpqxvAqr0bxSI
 5O0I=
X-Google-Smtp-Source: AGHT+IHPMDrCfaHE5rrhlKJOxVUNvX6Hz8P4fWPcgQcZllGLpZ+YlSC68ChSMJj58blEQBRNBqkpOA==
X-Received: by 2002:a19:5e12:0:b0:512:b115:a62f with SMTP id
 s18-20020a195e12000000b00512b115a62fmr7073834lfb.59.1708597013955; 
 Thu, 22 Feb 2024 02:16:53 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:4f68:2b3f:b15d:b5a9])
 by smtp.gmail.com with ESMTPSA id
 y17-20020a05600c365100b004126101915esm5619349wmq.4.2024.02.22.02.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Feb 2024 02:16:53 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 22 Feb 2024 11:16:07 +0100
Message-ID: <20240222101617.18422-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
References: <20240222101617.18422-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708597014; x=1709201814;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yI6EI4PLyOwb5Mbfb+U9aDSReebynjCbXzyzR7HAgKs=;
 b=q3/jFoD3ffA2aUvc8giCZlo8ecP3qbCGHqC9C9Ka24LcJUq+UUAlaa/XXivg2Bwo8i
 PkaEv12NB5S70Wltxhl6pd1xaRWfKFXwO9q+VxoQj41uvpJITPbQaVJU+7HRFB1uARxf
 nFUQinINuZIVlNiBLO9SUOeSiFl+edGZDyv1E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=q3/jFoD3
Subject: [Buildroot] [PATCH v5 06/16] package/python-attrs: add host variant
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

no changes since v3

Changes in v3:
- Drop Config.in.host

 package/python-attrs/python-attrs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 8a1236cc4402..fb1729e62fa2 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -15,4 +15,10 @@ PYTHON_ATTRS_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_ATTRS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
