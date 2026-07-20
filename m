Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA54CC44515
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 15:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AC3A80D1C;
	Mon, 20 Jul 2026 15:02:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayspcGNM6S1O; Mon, 20 Jul 2026 15:02:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C73E980D13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784559776;
	bh=ZXnse6dgZaS55bnp2TRk9xP2K3sCkdD3tn7dfPK9fSU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZqghTblGFTaQUVA0v7PGhlqUYNolF57vyxmqnrarQsPYRXuc177UrISwglerMg6OM
	 dv/cDAx0QoKYZazGQR6zH2OB0cBaolD16HWJBm0yFdtYRdIRLRPfRGbsAfMXy6Vevr
	 EYWl6LCj+lI1TvPl4AZZNRd9Wpo8U5qYrOkjQDLCuLFUpp2gxgyRFQaateZFV9Q5TN
	 EIAgE92Rr/hTDnrwaWxa3ePnrFPTFfbaGSa/oM4mgnSNyh1Zs5dU7aXjILQgIs6Cqx
	 muhAzpv6tabMyKgmDJA2xa9rOCMQsAE2/KT4vJmjwYH63XRp96a3s8odKPBNekSPut
	 ST2AO2kIZuylw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C73E980D13;
	Mon, 20 Jul 2026 15:02:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 63039206
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46BF880CD0
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 15:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugwaEIaAy_is for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 15:02:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D8E6C80CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8E6C80CDC
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D8E6C80CDC
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 15:02:50 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-47f3b39f2a1so4868753f8f.2
 for <buildroot@busybox.net>; Mon, 20 Jul 2026 08:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784559769; x=1785164569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/QJ/o2OBmulhH68jRhinLaqaUOL6uXixMj4rti/WygA=;
 b=NroZXd1uWKT22EMk37wJoB+iPCoWrBNt+m0lRY8K8HBRT6sieGrZhBznAKWIfimRMq
 raGTHE1+04n2PBuXSoxISTtsafDafZgYcEKYIMTvj2PEG/DZtD5TkNHoj7L/HhjJHyDm
 +x3/gNtKYXX0LemNGYSU0fn4sqUMp3y81NJ5I/2nthwmhJkE+JCQHA7LIISorxOkA8wt
 OO2n7IED08snSeIx4XFdjriTTevFIFPehB240gl2xv2igdE1LR7gGZhAI2XR4yMFGR2m
 MhF0N60m2VYJ36T4duDfA2Gh6t6lBJ6l/NgiIpiKC96lJ5r/Xa/zOdpqSDBC02FeqONW
 xJ0g==
X-Gm-Message-State: AOJu0YypJ7kp4T/MuOpJuR2ZsprSdz30G+fw1RryiN7z9KqGi8Wij8Sr
 l4GFMPKnZ5AFRB4dn65Jk8UfZoM5W75AlrenZ6G5Xi/+Bq3lxlT0hXSXIDVsmw==
X-Gm-Gg: AR+sD11L1a7/TVCi95Jj32DDJRDd9FP89fU2qq95Ow2yATm+49rAgSSTr9K1S2WJVIL
 TneZbzyZTn5pz4yWNtzSYfWrmg41JZnKV5nJRnHQ2vCrWfr9GvqhW9Rh25fbkvkG1kq6ONclZ7n
 GX+PqcMOch3erKiIS174lrJbzaRNVCtwAxLdF6GY8aCDVmn4X9rxB2V7YLNpAAOBpjJkZmB+Ndr
 5EVvNV0LgrnGQGKvrDskE/7WDBrgwYxQ2T69vVTzOacBjBowjuAgHhuezDZy0miG256sGVsAxId
 N0sLjDIzdHPpVBVRVmBdnpWZiJ4ICjC1Lch08Q52zkbmLTsY7OZzpD/pXv9qim3pm5tV8BUdVzW
 3zhi/PASzMXxfz3r5uCxy+gnywbdR7syVWF9qUaTDTmQsYAdPZjhHAEKARbVsaCxVnKOFPd0KgL
 zfmiQtMf7vQXgjwSpsQM/Q1aVnGr6IJGUbsCONSeE=
X-Received: by 2002:a05:6000:2287:b0:47f:6fa0:a9f8 with SMTP id
 ffacd0b85a97d-47f6fa0aa2emr9639892f8f.28.1784559768368; 
 Mon, 20 Jul 2026 08:02:48 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f63ee926dsm28681532f8f.35.2026.07.20.08.02.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2026 08:02:47 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Mon, 20 Jul 2026 17:02:33 +0200
Message-ID: <20260720150236.243961-7-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720150236.243961-1-francois.perrad@gadz.org>
References: <20260720150236.243961-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784559769; x=1785164569; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/QJ/o2OBmulhH68jRhinLaqaUOL6uXixMj4rti/WygA=;
 b=I9iksYErVfhoJ8Bisbbpk3cb4gZO2RPtMURElVKwFfXW68CcQZtWqPau0bx3ZumEWw
 wudOI/SkPk5taS2YBcnKDWDugkkuUtHFBnXtsF/BxPq2H5YefkMVXfuF8hZ0J4xg+3nW
 C1xNsWxlJPJmXWUkoMZUUAWzwlLeMQB80WHdBgiwzYh8XK0c2e7XhhPSMOyA7f4Bett+
 1nAmfNh3aJbSOWPwGvx8rvPMAAmWARfN2EjEU9vY5twkbtLckUNNwMSRwDW8vpm/bhCB
 I4LdUMah0spKD34xWgfSmZSLt7/bUHT0Kn51YNpH2flii8SReJyQD0C6GHW7n7f6dyPa
 RUdQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=I9iksYEr
Subject: [Buildroot] [PATCH v2 6/8] package/hare-ev: new package
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in            |  1 +
 package/hare-ev/Config.in    |  8 ++++++++
 package/hare-ev/hare-ev.hash |  3 +++
 package/hare-ev/hare-ev.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/hare-ev/Config.in
 create mode 100644 package/hare-ev/hare-ev.hash
 create mode 100644 package/hare-ev/hare-ev.mk

diff --git a/package/Config.in b/package/Config.in
index 630662477..5cdf0c13d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2168,6 +2168,7 @@ menu "Other"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
 	source "package/gumbo-parser/Config.in"
+	source "package/hare-ev/Config.in"
 	source "package/highway/Config.in"
 	source "package/jemalloc/Config.in"
 	source "package/lapack/Config.in"
diff --git a/package/hare-ev/Config.in b/package/hare-ev/Config.in
new file mode 100644
index 000000000..5a65e1fbc
--- /dev/null
+++ b/package/hare-ev/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HARE_EV
+	bool "hare-ev"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  This package provides an event loop for Hare programs.
+
+	  https://git.sr.ht/~sircmpwn/hare-ev
diff --git a/package/hare-ev/hare-ev.hash b/package/hare-ev/hare-ev.hash
new file mode 100644
index 000000000..beb0c6f4d
--- /dev/null
+++ b/package/hare-ev/hare-ev.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c80dc647f3a227259c05dab3b42b4cdfee44c68acd8e7cf31245807a8fa79188  hare-ev-0.26.0.0-git4.tar.gz
+sha256  be782a711236b742d7231a4a9a15ca781013e61dead0d6908105fbc2cb38a317  COPYING
diff --git a/package/hare-ev/hare-ev.mk b/package/hare-ev/hare-ev.mk
new file mode 100644
index 000000000..0f374f3a3
--- /dev/null
+++ b/package/hare-ev/hare-ev.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hare-ev
+#
+################################################################################
+
+HARE_EV_VERSION = 0.26.0.0
+HARE_EV_SITE_METHOD = git
+HARE_EV_SITE = https://git.sr.ht/~sircmpwn/hare-ev
+HARE_EV_LICENSE = MPL-2.0
+HARE_EV_LICENSE_FILES = COPYING
+HARE_EV_INSTALL_STAGING = YES
+
+$(eval $(hare-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
