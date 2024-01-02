Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5491C47074
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DD01400CB;
	Tue,  2 Jan 2024 22:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DD01400CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0gu_JIbcVFE; Tue,  2 Jan 2024 22:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 18F4740A6C;
	Tue,  2 Jan 2024 22:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18F4740A6C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A4C51BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10DD240A5E
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10DD240A5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jVB6c9lE7Uvq for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:10:31 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C1EFC400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:10:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1EFC400CB
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3368ae75082so5245790f8f.1
 for <buildroot@buildroot.org>; Tue, 02 Jan 2024 14:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704233428; x=1704838228;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G/vFHHhUkk4ILLwpOkZdB9OjVEUZQIsJDblmUj0dHEc=;
 b=MZlUmSQvGcEXzRc69iPqNYPkKM83srgwH0SDfvrsCs4iyfVEilCiik+87+9J478JNe
 fwizxM8qB21CRNdQeLn9p9prHD+DJHME6FzaSGcfgkEeC71tlu6dQfbA7pEquSDGdKdm
 p698bM/PJz9glHIKwJkwA3hEkdbSlfxV6vEuuiuh2lU5k+N1jZ9+icooR0Nn/FW9cr38
 mr31Ag/Y7TpqJaTSQzfAXXY+AH00ce8/atlOaqcla+M+RzkhW2lIwOpZTKLt2WZ4JReO
 /xIC6aknRq/4nRDb7tl02yetimjoQVvMNQhWqe2obEgE6ywLTOqyKiexpJV6fdsZzDs1
 EoNA==
X-Gm-Message-State: AOJu0YxNkeuNSXyiZcK77tf0PGieLlApapWHjYlXHhkC+vZU+yKpl5eR
 L13uKPsHrYIpvlo316KKLhq2H9PbCik=
X-Google-Smtp-Source: AGHT+IHZ0ImJaFTBC5Vfjj1oxwKDezGb9Ngz6WTVwJJ37ccIylC3AiGlcxcX1pl1zGN9neSmUQ4DNw==
X-Received: by 2002:a1c:790f:0:b0:40d:8bc8:3566 with SMTP id
 l15-20020a1c790f000000b0040d8bc83566mr45701wme.145.1704233428201; 
 Tue, 02 Jan 2024 14:10:28 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 p20-20020a05600c469400b0040d85a304desm270120wmo.35.2024.01.02.14.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 14:10:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jan 2024 23:10:24 +0100
Message-ID: <20240102221024.2434417-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704233428; x=1704838228; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G/vFHHhUkk4ILLwpOkZdB9OjVEUZQIsJDblmUj0dHEc=;
 b=EKsIEtpf2xMq8FC4UR8lp73gp50hK+Eh4rdq17z5mRJjeiHy8ck9F5uyG/rkOzipeb
 193nvgcrqyTGh0LQPH6jdMqU47O6VLUbaQ5W3sSL/UEUmkeyGjAytLsPQO38nocPNk1x
 gjf5gNd1A/S3kjXkxPmh8pnjFGMl5qFY3PezZpb/5gH6Qmg3bo0+9jpmWdyETfdHOONc
 /YcCFEsaaWQz3r7W5RS4qzednGSTeCnCY8cU5vnJxjYNOhfRdWmUDQCCA37F8z7zStFb
 SUsphKCScY1tB/wcRpH6wfzjeBVaMtMMg7Zy7ygwg5BXiB2nXlMdTR73XmpqbQoXjoYb
 YRtg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EKsIEtpf
Subject: [Buildroot] [PATCH 1/1] package/irqbalance: bump to version 1.9.3
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
Cc: Karoly Kasza <kaszak@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.3
https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.2
https://github.com/Irqbalance/irqbalance/releases/tag/v1.9.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/irqbalance/irqbalance.hash | 2 +-
 package/irqbalance/irqbalance.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/irqbalance/irqbalance.hash b/package/irqbalance/irqbalance.hash
index 3dd83a017f..989ed40a81 100644
--- a/package/irqbalance/irqbalance.hash
+++ b/package/irqbalance/irqbalance.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  883d3f6296f7e4a17e09dc2c91bd972e110fe574c119d9e45ec0c4e35c7317bb  irqbalance-1.9.0.tar.gz
+sha256  883d3f6296f7e4a17e09dc2c91bd972e110fe574c119d9e45ec0c4e35c7317bb  irqbalance-1.9.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
diff --git a/package/irqbalance/irqbalance.mk b/package/irqbalance/irqbalance.mk
index abd64e6b9e..5d1bd48002 100644
--- a/package/irqbalance/irqbalance.mk
+++ b/package/irqbalance/irqbalance.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IRQBALANCE_VERSION = 1.9.0
+IRQBALANCE_VERSION = 1.9.3
 IRQBALANCE_SITE = $(call github,irqbalance,irqbalance,v$(IRQBALANCE_VERSION))
 IRQBALANCE_LICENSE = GPL-2.0
 IRQBALANCE_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
