Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEB7C48BC4
	for <buildroot@archiver.kernel.org>; Sat, 17 Feb 2024 16:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16E9983C87;
	Sat, 17 Feb 2024 16:03:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oj5m0BoWe5Ed; Sat, 17 Feb 2024 16:03:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5E6D83CB1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5E6D83CB1;
	Sat, 17 Feb 2024 16:03:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 376281BF860
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3232560BE4
 for <buildroot@lists.busybox.net>; Sat, 17 Feb 2024 16:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CsjKgis9vwvx for <buildroot@lists.busybox.net>;
 Sat, 17 Feb 2024 16:03:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4D5F260BB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5F260BB8
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D5F260BB8
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 16:03:10 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-563c0f13cabso3309783a12.3
 for <buildroot@buildroot.org>; Sat, 17 Feb 2024 08:03:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708185788; x=1708790588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rtxWxH71mKMbbxPRI4GARxHRx9hx23QV4ELD0b/NV9o=;
 b=Wuz2UQWCZ6Uv7fYq2EaOM/6WUknyHqGq/8S1JzziLFCSuixvVeCTlHGHfYeYJd1YFm
 5GUSSefOrY6u+rzJGpStmMZGhuteblInoH+Va/Ct5d4Oz0leRXkcUBqGHyM87fGl0/lk
 jn7WpMwajE1SMz9qPxgP6ZJ8nw+lj8FqEhEcCq55uEqrCAmkCVdxYwjf4q8q+8rgkIzz
 EtY2hdAmjmg8PXQERT7smWRmCgH7PEy2wxbvV1KsqF6kvlTC/cBMqpZ8rqRgu8rsT1gl
 +hrI++ga4cUoby9AndGp65MfxinQTD2EGbcVGkSRYmRbK7hekrWw3mFQ5R0U3EM32rVV
 HoYg==
X-Gm-Message-State: AOJu0Yw5WXic5aagTubBIEV9yX/IGTKL87pl0EtDGy7iqx3WgaGbKcAy
 4GVwhL4T//7dZXnoUXfv8QtwFxq2122IHjuvYaF/AqQ87DZVUiBa6eNT03ypYDi28lLuYmJiz90
 K5so=
X-Google-Smtp-Source: AGHT+IHW4SbVCjMKwOJnIrwZX7583hRFcGpAOIEFFpd0t4YzNJ4ce9nyLi6K4vcEYirvIRQCKYLhQg==
X-Received: by 2002:a05:6402:202e:b0:564:17dd:d7e4 with SMTP id
 ay14-20020a056402202e00b0056417ddd7e4mr1592785edb.33.1708185788200; 
 Sat, 17 Feb 2024 08:03:08 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 dj13-20020a05640231ad00b0055f0b3ec5d8sm973414edb.36.2024.02.17.08.03.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Feb 2024 08:03:07 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 17 Feb 2024 17:02:32 +0100
Message-ID: <20240217160244.1320482-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
References: <20240217160244.1320482-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708185788; x=1708790588;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rtxWxH71mKMbbxPRI4GARxHRx9hx23QV4ELD0b/NV9o=;
 b=BOkzDcsO01/LqVMGsMRz0bk8W13wid2nNw/J/Yl5t1mNSUOXXZfhwU0NPCd9Jt2aWH
 ZS3d4/qmpQWf90NhnLatg+wLLMffMR/bwePf1sZuwZ4xQDx+g+XEJaPidz8/QOBDc0vc
 oFRctScGNsnUfMJmBCiWBbGNSyViitrdBE3No=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=BOkzDcsO
Subject: [Buildroot] [PATCH v4 08/20] package/python-jsonschema: add host
 variant
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/python-jsonschema/python-jsonschema.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 512c92aa7752..85fef7ad22ac 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -15,4 +15,10 @@ PYTHON_JSONSCHEMA_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES = \
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
