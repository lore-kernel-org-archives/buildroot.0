Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08E3CCFA13
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 10:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69020809A4;
	Sun,  9 Nov 2025 10:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id voRptWDNXQIi; Sun,  9 Nov 2025 10:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 261D881358
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 261D881358;
	Sun,  9 Nov 2025 10:17:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47753FA
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E2B381347
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:17:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OI5nEL83q5j for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 10:17:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2DACB81321
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2DACB81321
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DACB81321
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 10:17:19 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b725ead5800so271424366b.1
 for <buildroot@buildroot.org>; Sun, 09 Nov 2025 02:17:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762683437; x=1763288237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MTDcZUpbgYm4pEHoYJXuZw6uH5P9O+fYuECxbu/HwGE=;
 b=tQ7qxrS5RHaW243yC8b3fWVw33FuRxViv9V9aTmMbLKYNf+Pgr5CxDGEYrirsIF25I
 rAjtFDIO2MZp1kY4tsEtF5hhAQmUC/NhrxjP/+yiMARanRgiQQXnfgs7/44wj54+pehu
 An3YltKB52m3D4oqgbWL6t+SpTbZyO8Buvn7WyUfDyKq0h4mwAU7PBgy8I56TiR3Zr2a
 f7M1oyBZ9gKGFw81ytWAkoNlqyAFQ/gbEV00A75JtgrpVeLkMT8azJ2ny0hcbTvSViqc
 Xqna/rKqKryB5T44Mn7dWh6/JhdHjjQiA/BwOitdt/k4RPCrgblw+RWizGeMWMwXUiX5
 7YXA==
X-Gm-Message-State: AOJu0YxO9KXBnWEDNB6Xxo6tINNFLZV03ijBIeK4IK0vQdSSDnjb5UM7
 hfrPLiimmaDLI5W61SN1TlzSvwUMSk6zULv7KjJYu/CgF8dzrDsXusbI8+KKPaCh8g2yblg0tq0
 d7nkP
X-Gm-Gg: ASbGnct5fErJgENWYG/+Ag0xfp0JHAddPe9E5O0iNQ9tNTb31oJS+MvgM25i+JseqcD
 yFM0eNfCki2oCpIzPI6kUBcUGNrAtPCa3Qzoyuc85Sp7g8FKZ4N+5RsGLaTr9lGYmYvjWx3amZ4
 o53au3QET5DDyCMJWMCzFPNb8zV/rJHZWyzZopMb9hmwJmuG42wdS+8beZSCsuXQGvyZ2jam5Ts
 SWdpo8PHwY94maRVfe7raz2sx3dJru2zrZSuzU3Zqldzbgz0v4vOX73MBsMMjjN3lNpFUJPtiLL
 MM3OOOKwZ2Csm2AEepTJpqLl3J0CcnsYX6p0Q8HQkTzzRzqB6PBALuBgSttw8XxftKKltqaHBrO
 naILYnH2lBXYx3NxBikj/wZ4bh58ltUH/5je/PZsu261brjlg7LSg/fcdI7nSji/klSBqJBqd8+
 hh1thMnmM2fO5gxJcogImJF9Hcxev/TL6tvtYtnSA2KD4v/lZaUlkz8c6tvetX8iCodMwPatoeh
 B6rNkY3ofZ684Sg1l0gFzIH+jufe0EoZAnYCYXQ+iiTcHHFfGul
X-Google-Smtp-Source: AGHT+IHoHwtl6da+Upp1t+IDqsaBpLMTo0EzZvDSYgWZLc01tW3QH/hBgUFXFguFoX0gHXEBllDTLw==
X-Received: by 2002:a17:907:809:b0:b3d:b8c3:768d with SMTP id
 a640c23a62f3a-b72e028d58dmr391759566b.7.1762683436786; 
 Sun, 09 Nov 2025 02:17:16 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-87-0-92-181.retail.telecomitalia.it. [87.0.92.181])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bfa24d2asm756205466b.70.2025.11.09.02.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Nov 2025 02:17:16 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun,  9 Nov 2025 11:17:07 +0100
Message-ID: <20251109101711.493759-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1762683437; x=1763288237;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MTDcZUpbgYm4pEHoYJXuZw6uH5P9O+fYuECxbu/HwGE=;
 b=JdAKF4ITpX7aLd7VFHRnBQ7685klG1+7elF8Ohf/qJKoOuNRka3D7KEn4GWxzZP/tu
 2vV+45UIewOzRbYBk8fQ5hULCwXqnmIsGwtC90JxppAFwa+qdTZMOfKGhpItRqOREkFp
 KaZ49MIwzSDSct4M37aadBStjMnLQz7Lkkjek=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=JdAKF4IT
Subject: [Buildroot] [PATCH v2 1/2] package/jsoncpp: add host variant
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

no changes since v1

 package/jsoncpp/jsoncpp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/jsoncpp/jsoncpp.mk b/package/jsoncpp/jsoncpp.mk
index 9915907ea8cf..319944abb7d6 100644
--- a/package/jsoncpp/jsoncpp.mk
+++ b/package/jsoncpp/jsoncpp.mk
@@ -11,5 +11,7 @@ JSONCPP_LICENSE_FILES = LICENSE
 JSONCPP_CPE_ID_VALID = YES
 JSONCPP_INSTALL_STAGING = YES
 JSONCPP_CONF_OPTS = -Dtests=false
+HOST_JSONCPP_CONF_OPTS = -Dtests=false
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
