Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F6BC4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09B93817FD;
	Wed, 29 Nov 2023 17:27:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09B93817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qurdvGsC8jmF; Wed, 29 Nov 2023 17:27:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42380843A9;
	Wed, 29 Nov 2023 17:27:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42380843A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1DD161BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB4AD817FD
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB4AD817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PsCem8Ya1FTL for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:26:45 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 848DA817BA
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 848DA817BA
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50bc2e7f1e4so69272e87.1
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:26:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701278803; x=1701883603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iKG8I4XzO6UezuRdYQuzUs6qzO6FluWw5vcfw20zu9Y=;
 b=wc01ToVdTYFAvsaWAYO8VzGn0+mrcdMO934/xxpZwjJo1Zbx3lgzm2COT/O61u1lME
 6iZcnWW22o1q/5Oivmv9pQu6zfNPKAACqdciRKzBxxy0dmT2vDxB83mVQ0eGveMAKo1z
 41ag++q9SvzwkpLjB7lJYM36wb615OjyFLgHuni/q6hhChWV11CvqOUtdFl7VGzBi0yX
 t6sLicz2GVaNLhb8bbkKRRcUz/UYYo8yWdid6AIqqe1YjqUBXzw82YCc3vmYzBuFF0HI
 gAJfh2vR2fdKyhWKJjw9eCNS6d4cBUgVmGO/kg8Vo6q0jgaFBgn5f50R0sx/X6yT6fgX
 W8Kg==
X-Gm-Message-State: AOJu0YwSA34fa116sEw/BmBhzWPjOZjtWfs3nSl7XEicvyv8aY6okSSp
 yS4aYKGObnN1Cx558Q9myzcZ2bu5r6KFlnjMrD4rNQ==
X-Google-Smtp-Source: AGHT+IGiMxuVOD2noEWVObCEpHD3n07f05jNQb8El2Fvc4qsx7vVm4BOELfIzAYoArjkxFyFStnXHA==
X-Received: by 2002:ac2:554d:0:b0:50b:c138:f42a with SMTP id
 l13-20020ac2554d000000b0050bc138f42amr3003669lfk.68.1701278803382; 
 Wed, 29 Nov 2023 09:26:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-95-244-100-54.retail.telecomitalia.it. [95.244.100.54])
 by smtp.gmail.com with ESMTPSA id
 dv19-20020a170906b81300b009a9fbeb15f2sm8104620ejb.62.2023.11.29.09.26.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:26:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:26:10 +0100
Message-ID: <20231129172615.1683565-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
References: <20231129172615.1683565-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1701278803; x=1701883603;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iKG8I4XzO6UezuRdYQuzUs6qzO6FluWw5vcfw20zu9Y=;
 b=QloiqIQMOd/VIFfs1y7VNX4w0aLGnhWUE3dzMbpFjVYocI7CFU0ccI/Sv7T142wPTG
 9FOGtwm/Yge+oH2QcCyW2cHV62CltB1n/9HCJxSocsXXZRRCVIw4bxWl7RwgOACLuRCJ
 5HAXoEQtsTBvUlEIpmHFmX7alSorcvPhupq7w=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=QloiqIQM
Subject: [Buildroot] [PATCH 06/11] package/python-rpds-py: add host variant
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
Cc: michael@amarulasolutions.com, Asaf Kahlon <asafka7@gmail.com>,
 Xuanhao Shi <X15000177@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/Config.in.host                   | 1 +
 package/python-rpds-py/Config.in.host    | 8 ++++++++
 package/python-rpds-py/python-rpds-py.mk | 1 +
 3 files changed, 10 insertions(+)
 create mode 100644 package/python-rpds-py/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 56299184eb40..1b2af6cbf0f2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -91,6 +91,7 @@ menu "Host utilities"
 	source "package/python-lxml/Config.in.host"
 	source "package/python-pyyaml/Config.in.host"
 	source "package/python-referencing/Config.in.host"
+	source "package/python-rpds-py/Config.in.host"
 	source "package/python-six/Config.in.host"
 	source "package/python-xlrd/Config.in.host"
 	source "package/python3/Config.in.host"
diff --git a/package/python-rpds-py/Config.in.host b/package/python-rpds-py/Config.in.host
new file mode 100644
index 000000000000..2c11019fe997
--- /dev/null
+++ b/package/python-rpds-py/Config.in.host
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HOST_PYTHON_RPDS_PY
+	bool "host python-rpds-py"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  Python bindings to the Rust rpds crate for persistent
+	  data structures.
+
+	  https://github.com/crate-py/rpds
diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
index 6f71d0204704..f426bddff3d6 100644
--- a/package/python-rpds-py/python-rpds-py.mk
+++ b/package/python-rpds-py/python-rpds-py.mk
@@ -12,3 +12,4 @@ PYTHON_RPDS_PY_LICENSE = MIT
 PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
