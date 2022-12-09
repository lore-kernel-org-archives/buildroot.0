Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BACFC4167B
	for <buildroot@archiver.kernel.org>; Fri,  9 Dec 2022 07:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C10BD40A00;
	Fri,  9 Dec 2022 07:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C10BD40A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmFi7sr8uBmN; Fri,  9 Dec 2022 07:51:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC17F410E7;
	Fri,  9 Dec 2022 07:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC17F410E7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA741BF5DE
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5545960B16
 for <buildroot@lists.busybox.net>; Fri,  9 Dec 2022 07:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5545960B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vGQHQqUTqVbo for <buildroot@lists.busybox.net>;
 Fri,  9 Dec 2022 07:51:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F19760593
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F19760593
 for <buildroot@buildroot.org>; Fri,  9 Dec 2022 07:51:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bx10so4382667wrb.0
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 23:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xYSvYU/DBhkzNGhieTYX36BzIGMILdl08OPT9Q9bp4c=;
 b=KvY7L9dZxPUkR3f49Ifn/VMNZQlfyRDpmxa1Su+Uh3+zyoxnLkn7tG5TMVVibmvXg7
 srwwyCTRYwKtYdrVc+F2OXdT8Y78/UC8BWgtgd8Pa8dM8w+5AELzsFNgiR+vjBsR9AcD
 uzkIsbb76zh/4DSOqGvzAryXQyRDYMVMHrsAa0j75isTYy6xYAapRADZwS2hUenPrqPE
 T0eqOM0CrvfC7ZL1TtE7o4G/2VBpmleIt2ZdKme84uS9RG83gB+xL45ZVN109hcUNMx3
 4shvAJUGG+RfbaaVlxprgGB/E9xRjvdtRn+6DIyjb9JPZzzNXZjq8hq3oFPYRY70MPC5
 d74Q==
X-Gm-Message-State: ANoB5pmLpnx6glBSESJOoADhp2+DGcAxlTdpYB3qStJ8of9DghyVDMJS
 ALEGRt/gZIkBaQxBImb+uY4PL72Q99wnkyLD
X-Google-Smtp-Source: AA0mqf5EvTOEfP9WVUFhq2A2AOn3hEY+e3VA7QuvMpZEPoou55QbEfXDXoSbD6NPj5T4c6csvvJPew==
X-Received: by 2002:adf:a743:0:b0:242:1c1a:37ec with SMTP id
 e3-20020adfa743000000b002421c1a37ecmr2546737wrd.17.1670572274104; 
 Thu, 08 Dec 2022 23:51:14 -0800 (PST)
Received: from lmecxl1178.home (lfbn-nan-1-127-214.w90-49.abo.wanadoo.fr.
 [90.49.211.214]) by smtp.gmail.com with ESMTPSA id
 bp3-20020a5d5a83000000b002415dd45320sm664507wrb.112.2022.12.08.23.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 23:51:13 -0800 (PST)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri,  9 Dec 2022 08:51:01 +0100
Message-Id: <20221209075104.1168297-2-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209075104.1168297-1-etienne.carriere@linaro.org>
References: <20221209075104.1168297-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xYSvYU/DBhkzNGhieTYX36BzIGMILdl08OPT9Q9bp4c=;
 b=eBgBhyXEwWOealOvQqatUK/FBe0uN8PLqnOvFcReHyWrlDN/Uldxv3scl3NNPG8xJG
 Y5ATtEOJVBmIEkiJBObLlqf5yeNWoIrKUsZLhmmxnbOAVD/r3hJ43R7RpkX86jqjwWOO
 EZbHiD11WE64xO0x9Gsr+CiWVIs98qqrjrnWb8hyNq37hDND0fK42y1yBWZ7U7xTSWOn
 EH1EImBOSC2WJSrud4YiWyMkx/ToUR55+sbwT9ZBsUY/I3QIs/Zy6w+T5Ahuvvco3mph
 E1afLjAB6opY1QeOrpO992b0CTyIgPH1jfRo9rtTSFNhR+AMgroKAKEmEjP2s2hOVtoH
 A/Hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=eBgBhyXE
Subject: [Buildroot] [PATCH v2 2/5] package/optee-benchmark: bump to version
 3.19.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE benchmark package version to OP-TEE release 3.19.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
No change since v1.
---
 package/optee-benchmark/optee-benchmark.hash | 4 ++--
 package/optee-benchmark/optee-benchmark.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
index 27c91e0fb0..d74a24c8ab 100644
--- a/package/optee-benchmark/optee-benchmark.hash
+++ b/package/optee-benchmark/optee-benchmark.hash
@@ -1,4 +1,4 @@
-# From https://github.com/linaro-swg/optee_benchmark/archive/3.18.0/optee-benchmark-3.18.0.tar.gz
-sha256  2151aa5da062402518f35823d9c9dffa2e012f924625d2f7123e0d21d350a86b  optee-benchmark-3.18.0.tar.gz
+# From https://github.com/linaro-swg/optee_benchmark/archive/3.19.0/optee-benchmark-3.19.0.tar.gz
+sha256  32f41854bf07eb7bb89dfc702da023c3a99518c33fbe7edf0e1f004e29a8c90c  optee-benchmark-3.19.0.tar.gz
 # Locally computed
 sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
index 1071c4bb5c..338a51ada4 100644
--- a/package/optee-benchmark/optee-benchmark.mk
+++ b/package/optee-benchmark/optee-benchmark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_BENCHMARK_VERSION = 3.18.0
+OPTEE_BENCHMARK_VERSION = 3.19.0
 OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
 OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
 OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
