Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081D1C021A4
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 18:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB24E610A5;
	Thu, 13 Feb 2025 18:09:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQN7_6tC5W1t; Thu, 13 Feb 2025 18:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DA7261AC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DA7261AC0;
	Thu, 13 Feb 2025 18:09:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C97A199
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 18:09:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D45940D55
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 18:09:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J4YXOYZ_yfv8 for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 18:09:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CFD5440C09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFD5440C09
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CFD5440C09
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 18:09:25 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-ab7e9254bb6so193730866b.1
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 10:09:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739470163; x=1740074963;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ciO2mQcPbeuuAAsRq37LuKrcZfYR3+ce4TZB9J6PeMg=;
 b=u4UDfCz1P+6pIuoeAtSvNA0DufJWcq6dhmZsvnFJ5BBl6ZrrTSmhPdppHoEFVVJuqh
 Bbz5usLnojHH1QsT2i2TUsNiHiS268SxbyZaFdohPac4uQt5FzXzmMLqetJGX49GSfjd
 Co40xXYc3gf3FFAhE44cNkc8OJlMdy8y08DtQzJXywO+RRt5nMI/hgykQlKUwzPMaGaQ
 9HnWT6xwrtowEojy7tomcYEv7iomFm56FhozD/SW9VftdyWCFeH4a7PvA6cE8TRwwqD1
 JXbJ9sQdx8RejByyR6bokqB1iJN9Xt+ZrSiivqQ5cSssKUHV+IPtjWvazOnl0DJdtHr4
 WDaA==
X-Gm-Message-State: AOJu0YzLVEdFiRTP8vbMvtLbO51Z6KqsVUG4XjsGDucnR24rmq74/bKl
 U+8kC6sXKuzLI3IVMPDLohPtupAd7WqhNpIeOwlbOXu2vXuLME/ZpgjwiQ1IZSC8Kp26Q6CSb+s
 U
X-Gm-Gg: ASbGncuZH15EpxujQVU2utkLCA/mneWiA9J0wt/GI5EKlmi/8mg1xkkPmzUmwn2+92m
 f6oUsTgej6eXN+cYO4dQ9Jxummkak7lQbXMXp5BnGexg11Oa7Rc5JYnoxlDWcIJEL7Cm8k92bsH
 ioxyNcjogue68Loq/Vjg/kY3JS+gl4Pc9Tg1SeTPC4Xzxxj9gIb7lY7qjIuB0mZNKInDbraXadK
 gddI51wYizHrYN4Hx6upMfeuXxULLJzvgs12wYmpErqCZz/9hpjv5Q9BG80WdJXoujhDVRJx69c
 2ygHhAVUDOnt+EqeNeEMTvb7CVFYQ4kFXn6RQpONr+J1uT6yKWybvoLH7nw=
X-Google-Smtp-Source: AGHT+IHj9B4Ou9M1doa+L2ZcADiZMoGiLESqqhjYWmLSAeCmzRWVw5eDfL9SWV41aKjDzw9P9hguNg==
X-Received: by 2002:a17:907:9719:b0:ab7:e811:de86 with SMTP id
 a640c23a62f3a-ab7f33a39d3mr780597966b.13.1739470160972; 
 Thu, 13 Feb 2025 10:09:20 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([176.200.207.55])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376756sm175345866b.115.2025.02.13.10.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 10:09:19 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 13 Feb 2025 19:09:08 +0100
Message-ID: <20250213180908.3963679-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1739470163; x=1740074963;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ciO2mQcPbeuuAAsRq37LuKrcZfYR3+ce4TZB9J6PeMg=;
 b=N7vQJCLTlStAwBY6CU8ZwT6znD8OwcgJxEvzMie4y5+pvp3hqnN0LaGXBLCUpjdaHQ
 qgMzSqylL13967Ten40JmZbWRD+ZgEN8wwqkwxTmut27QfUdUFExcZ5WSNAL3JtZ6ZX9
 WhCvi32E+WvQJ1iBl4IP5DNi+F3dvT1kRb02Y=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=N7vQJCLT
Subject: [Buildroot] [RFC PATCH v2 1/1] package/pkg-download: don't export
 the download command variables
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, Julien Olivain <ju.o@free.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Exporting the download variables can cause unfortunate name clashes, as
occurred with the SCP variable used by Binman for compiling U-Boot [1].
Do not globally export the package download commands anymore; instead,
pass them to the dl-wrapper environment.

[1] https://lore.kernel.org/buildroot/a023971c7c8bfa4826a9a8721500c7ff@free.fr/T/
Cc: Julien Olivain <ju.o@free.fr>
Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v1 -> v2:
- Drop the -C option

 package/pkg-download.mk | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index ca01ff67a59e..20173805c60e 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -7,16 +7,6 @@
 #
 ################################################################################
 
-# Download method commands
-export CURL := $(call qstrip,$(BR2_CURL))
-export WGET := $(call qstrip,$(BR2_WGET))
-export SVN := $(call qstrip,$(BR2_SVN))
-export CVS := $(call qstrip,$(BR2_CVS))
-export BZR := $(call qstrip,$(BR2_BZR))
-export GIT := $(call qstrip,$(BR2_GIT))
-export HG := $(call qstrip,$(BR2_HG))
-export SCP := $(call qstrip,$(BR2_SCP))
-export SFTP := $(call qstrip,$(BR2_SFTP))
 export LOCALFILES := $(call qstrip,$(BR2_LOCALFILES))
 
 # Version of the format of the archives we generate in the corresponding
@@ -118,6 +108,15 @@ define DOWNLOAD
 	$(Q)$(DOWNLOAD_SET_UMASK) $(EXTRA_ENV) \
 	$($(PKG)_DL_ENV) \
 	TAR="$(TAR)" \
+	CURL="$(call qstrip,$(BR2_CURL))" \
+	WGET="$(call qstrip,$(BR2_WGET))" \
+	SVN="$(call qstrip,$(BR2_SVN))" \
+	CVS="$(call qstrip,$(BR2_CVS))" \
+	BZR="$(call qstrip,$(BR2_BZR))" \
+	GIT="$(call qstrip,$(BR2_GIT))" \
+	HG="$(call qstrip,$(BR2_HG))" \
+	SCP="$(call qstrip,$(BR2_SCP))" \
+	SFTP="$(call qstrip,$(BR2_SFTP))" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
