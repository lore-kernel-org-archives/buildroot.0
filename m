Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFADC54E41
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 20:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71F644053E;
	Sat, 24 Feb 2024 20:57:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kc5co1Vq4xzy; Sat, 24 Feb 2024 20:57:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E81E408A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E81E408A8;
	Sat, 24 Feb 2024 20:57:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 184E11BF276
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 136C940611
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 20:57:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7GcAnzKWFn70 for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 20:57:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 375B840522
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 375B840522
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 375B840522
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 20:57:42 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a3f829cde6dso216174766b.0
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 12:57:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708808260; x=1709413060;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3mZYCxmE8DoOuJy8yEJQnV4MCdjdtYGW6ltxuAr4t+M=;
 b=Kv2K/DUO2TSIa+0dya8yhKhPnnSUSXgFKXXsrKFnBU5VaQmyu9X0enjIKe2P0Zxx7s
 /9V+P5J/nzGFCQxF9qcVtpz1aRCtZl51He2Mh5fAuPzrurN0fLdPfGyJrMIpBoRBWYed
 jcfJeKQ3hSsma7XNfkEwgLS/C882yeq2iJrAx0wo2MijvfTYpvVqIhOcOwKLapTjNMLO
 +m58s2H1wMYYBYT4Uyq9td5y/CXupjJ3iR964z6XAeG6mNIko48gIw4RdFLCZYvZd2JV
 fSdnumjy1F+72wZoilD1fksB93pR5LfIRcvSa3V2LR/5LqfPTeLK0T6VBugEpqsH9vG7
 DghQ==
X-Gm-Message-State: AOJu0YxAtf1Pbv0c2yhh3xt7ikzVQcDUqpEFmdKf3JltH+4YVWEDbKQH
 Eutyx0E8oGrCT9rsLDRagGj9KifqatYs3D5aBMhuMZza5L4ECVgTa+SPFpR618ZWaZzMx2tUWN7
 9zYQ=
X-Google-Smtp-Source: AGHT+IH5IvBSWxeuoi9/bFB57h7TwzvpficXDFS0+IuFHxL4Gn/tOTlMdQUNjtuSHs41E599wMOrXw==
X-Received: by 2002:a17:906:344b:b0:a3e:1ab9:b6a1 with SMTP id
 d11-20020a170906344b00b00a3e1ab9b6a1mr2084311ejb.21.1708808260066; 
 Sat, 24 Feb 2024 12:57:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-5-96-195.retail.telecomitalia.it. [87.5.96.195])
 by smtp.gmail.com with ESMTPSA id
 tk6-20020a170907c28600b00a4306ac4c77sm425506ejc.197.2024.02.24.12.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Feb 2024 12:57:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 21:56:47 +0100
Message-ID: <20240224205654.1546744-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
References: <20240224205654.1546744-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708808260; x=1709413060;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mZYCxmE8DoOuJy8yEJQnV4MCdjdtYGW6ltxuAr4t+M=;
 b=O4ESW6l/4uc5F6OgEUltDdHWECDuxfReIH/CBBhoVq5XqaVj2mUeGyj5CVhatfECYv
 16Ijj3nN9sddWG424jB+aNirrmdwZsrO7mU/u5LqCzXuaU5q4J7y+aEe42H5+tzNLSYL
 dQdcx7pWtGgv2mIH1RgEAfJY2LYDglD2J5y4A=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=O4ESW6l/
Subject: [Buildroot] [PATCH v6 10/16] package/python-jsonschema: add host
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
Co-developed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Add runtime dependencies
- Add SOB and COB tags of Romain Naour

no changes in v4

Changes in v3:
- Drop Config.in.host

 package/python-jsonschema/python-jsonschema.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/package/python-jsonschema/python-jsonschema.mk b/package/python-jsonschema/python-jsonschema.mk
index 512c92aa7752..9e8b6e18b876 100644
--- a/package/python-jsonschema/python-jsonschema.mk
+++ b/package/python-jsonschema/python-jsonschema.mk
@@ -15,4 +15,18 @@ PYTHON_JSONSCHEMA_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_JSONSCHEMA_DEPENDENCIES += \
+	host-python-attrs \
+	host-python-jsonschema-specifications \
+	host-python-referencing \
+	host-python-rpds-py
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
