Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C13C54E49
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EDAB405DD;
	Tue, 27 Feb 2024 16:31:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mqTNuJKtWngz; Tue, 27 Feb 2024 16:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B1D410B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B1D410B8;
	Tue, 27 Feb 2024 16:31:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6BAF81BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 595C1605D5
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 17meSwJR5wFo for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73877605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73877605BD
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73877605BD
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:42 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-512e568607aso4580248e87.1
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051440; x=1709656240;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3mZYCxmE8DoOuJy8yEJQnV4MCdjdtYGW6ltxuAr4t+M=;
 b=oUMBroT+1daNOP8LddS6Kauch5YgT8Xs65DR6cfF8YawUdoe66rr318Olk8DR0Kjdt
 7dDzy/NSeCwgCDo+siDOQKE524PcaFZJBIuWRnHqXEHD96sAkqAjjkaGHG+zFKYwrnXB
 r1hpvpEBS1KlmYmpOq9F1j5Sm9CpV20DddJkVTrV9B42xBzIuAZZaBULHjVFzZQiWEzo
 RAmrL/qqG5GUvZ/fjttzXzSatToZeVV56fi/snpqTHqzyusIFvYJGiTYCsPzpKRnJJzw
 1R42eDGXF0jpypcvEWYfthbA67IHKei3EPMFn1UVYB1TkNXMJ2sc9TAU7aB0nrM4XNp0
 Pdkw==
X-Gm-Message-State: AOJu0Yy36d75WLQ40SqSu2MI2g8SDtwFd+tj9RSymsx7DSr/EtM/SWen
 ghMJcLei4iS7AoPBmT3b/GSR2La9eOY7YkVuJlvKwL7HbXCGA0Urz0oQ0yHCLwp3s53T9t11ISd
 BGJ4=
X-Google-Smtp-Source: AGHT+IE69j6bZGqP1kMvyG6Pzia7tuAYwT6IXkVoY1VDrmskRqbIqy3puQvZbgx1RAx1aLLpvrej5g==
X-Received: by 2002:a05:6512:3e24:b0:512:f7fd:e9e2 with SMTP id
 i36-20020a0565123e2400b00512f7fde9e2mr5557581lfv.1.1709051440181; 
 Tue, 27 Feb 2024 08:30:40 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:39 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:12 +0100
Message-ID: <20240227163019.2876942-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051440; x=1709656240;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3mZYCxmE8DoOuJy8yEJQnV4MCdjdtYGW6ltxuAr4t+M=;
 b=nuI2mZvTQQ8dz4cA/oU2U8ocaj/UpX3nppb3GVoH/BCux+wRzURn0FI53tgG9d6Tw4
 asF7tjP5TuzYe94M7eAHaGTAHRPdtNMRx6tCJPdUjX/P5a2Ev62fW7pi1Em5w19oZrSx
 pB01um9kyxKgxczF3RwAtKLQEOuCR031HjXCI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=nuI2mZvT
Subject: [Buildroot] [PATCH v7 10/17] package/python-jsonschema: add host
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
