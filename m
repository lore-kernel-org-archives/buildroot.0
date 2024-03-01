Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76304C5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 422848336D;
	Fri,  1 Mar 2024 13:37:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6F-VPQrrACoa; Fri,  1 Mar 2024 13:37:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29A17832E8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29A17832E8;
	Fri,  1 Mar 2024 13:37:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B222C1BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FC4441DD7
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l6vZmvtgz-Sn for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B879741C61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B879741C61
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B879741C61
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:36 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so5350501a12.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300194; x=1709904994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pp6fhvEohhQ4y+WUANKkDtLMmeHNdm24Nbu2wGTBIj8=;
 b=rVZ9ozKQSRl1I+ikHho70FcU9aGFB6nSNbP2ZlpYOdsvEy+0no6DzRj4pIXAW199l9
 TnyW28svlqTqxSBiAfvX8rGX2+x9FE75Uiv1k/HTIbYpdytACGV2MwkurcyXAe4ihfai
 VtZBUdM5h+Z9IPymV/cNgP81JXy+neHdSTV8FvigdzZbVgsos7mLCmQ8BJX3hxYH5I2q
 n5aknbSK9I7GElwzQTEYOe++zny4llwfRxBrtwsF3z4dTipqY0nT0Cr37918jbCijLrC
 fm8GhKyyzzcVypG825LVcaTtPJKQK/8B54/QEFZ+dUV8uHgkSrAgYWqnKgCpHISY9z67
 pNHA==
X-Gm-Message-State: AOJu0YzYI+cgTMB2iaJY4p71GeXICALvJpTrooetjfy4MAPxZSEjDU+l
 rFnYbJm2xUqEafhY+nJEm3mOKFpMom4otnxonXevKFpXfqgYfaTOhQ0Zj2SUMCKuuymhJJWFHvW
 PBEE=
X-Google-Smtp-Source: AGHT+IHzSskzG6nu1pT0LWC2GZiowsxJ2LGfb3eG1ybDvQHGg9rfFqwlTFowo0dGZQ2wGyPJbNOdLQ==
X-Received: by 2002:a05:6402:2267:b0:566:201e:c18d with SMTP id
 du7-20020a056402226700b00566201ec18dmr1613528edb.13.1709300194666; 
 Fri, 01 Mar 2024 05:36:34 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:34 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:05 +0100
Message-ID: <20240301133620.3547430-9-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300194; x=1709904994;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pp6fhvEohhQ4y+WUANKkDtLMmeHNdm24Nbu2wGTBIj8=;
 b=ostfQrC3DtEh7Bsv2WZB6VNXx8dnOdQ3iJg4NBIqOOV/IEdJQHfiI8BDUMUE9FtMNe
 RXtkfKTNoh8cIUAIcx8pgZUz32DQ3ax6lBtB6qsaZ/pc3rmGsUNq5Qc3Ft9Bi1lqb3VY
 ccDeU5G6U9tSABdL+inlfkkqjvFUNHLH09Fnw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ostfQrC3
Subject: [Buildroot] [PATCH v8 08/23] package/python-referencing: add host
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/python-referencing/python-referencing.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index 27d1452e913a..66d59ed8091a 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -14,4 +14,15 @@ PYTHON_REFERENCING_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-vcs
 
+HOST_PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+# This is a runtime dependency, but we don't have the concept of
+# runtime dependencies for host packages.
+HOST_PYTHON_REFERENCING_DEPENDENCIES += \
+	host-python-attrs \
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
