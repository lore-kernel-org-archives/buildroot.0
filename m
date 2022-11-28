Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D37AC433FE
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 17:59:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4996E8137A;
	Mon, 28 Nov 2022 17:59:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4996E8137A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qLwxdgPnr9q; Mon, 28 Nov 2022 17:59:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70DB88135A;
	Mon, 28 Nov 2022 17:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DB88135A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AAA61BF20B
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 657658135A
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 657658135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A9ILMEHTlgU6 for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 17:58:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61A4D81252
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61A4D81252
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 17:58:59 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id x12so2479358ilg.1
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:58:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NkxPNA5F3tLQheb8jim0Blgupw3YYdZGZC25ymbd0qc=;
 b=2Bdd6bJf5RkrFw3oZJGAFlXC34HNVhfX9apE4Artav8a3e4cX0XCiDnmMtsQf+LIIH
 URGiYO8VhzWNk5JH3AvchjuHWu4qlbl/gVyQXIAj+KjXsTY8pHOK24TR/wiwqND2W6nr
 SeVphR4FC7rO8VY2O5apf1I3RKPwCnv6bNplOKT50MzvF/MuvjSltG817dUcehlTdA5O
 ckyuJ/13Qui0V+BN+OAszLuVT0QGt9IQE/TFOAb5OM3+yT6rMNC05QuHNT49PVssRzz8
 cMHPlJfIM23i0q1S03zZO3s3QHp/T0pavOfYsPAayyp/kZx+agGXEIoUfjssp7vdI2hQ
 2Nxw==
X-Gm-Message-State: ANoB5pndX9hjudQ6CxNAgin+GN84U6Isbo+4V1x8VczXrMGWxAeVkM7U
 I6uMofWgeWAKIDK9snnzTr6eCdLxU2/QTsp3
X-Google-Smtp-Source: AA0mqf507yPNrtCua23vb5GA8td7beTImT1KWlUv+frH96aNWdWFWl//G+yV8kycXsUE4OfMvqujJQ==
X-Received: by 2002:a92:cc4a:0:b0:302:b6c0:70f7 with SMTP id
 t10-20020a92cc4a000000b00302b6c070f7mr15144541ilq.151.1669658338149; 
 Mon, 28 Nov 2022 09:58:58 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056638229000b00363781b6bccsm4564802jas.49.2022.11.28.09.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:58:57 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:58:47 -0700
Message-Id: <20221128175851.1913859-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NkxPNA5F3tLQheb8jim0Blgupw3YYdZGZC25ymbd0qc=;
 b=D6DbcVxve9zONM6celP9yK0MIeQSjPorjFnAwBjlLOLYWdNXC2oX/uyjSmNYB1JFcS
 kC4ErmMp5P2K7bJHmS4to16CI7qGJg2Dx+PsSIl5OM6nnh44Z4oKT7rcokF61AmpNQjp
 gj6pt+NF8IWi5DPRbWIe3BETqTWIDXYeidP5c7Ve5vz5k05LKdXCl0o6b8c3bKnSKZFQ
 rwlbnAd05AbJbnnJwWKMqWtPoYBKQm8yOFbZH53mM+OXF4apyaHlxl4FB+bf5KPR6ma5
 QeBy+GiMXIVXmrU4h5KAXk+RuGdhmO65JKXdDlTf2y8t5LPU8oGnJr6VYWWFSNEm+q3C
 qAgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D6DbcVxv
Subject: [Buildroot] [PATCH v2 4/8] package/gemmlowp: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in              |  1 +
 package/gemmlowp/Config.in     |  7 +++++++
 package/gemmlowp/gemmlowp.hash |  4 ++++
 package/gemmlowp/gemmlowp.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/gemmlowp/Config.in
 create mode 100644 package/gemmlowp/gemmlowp.hash
 create mode 100644 package/gemmlowp/gemmlowp.mk

diff --git a/package/Config.in b/package/Config.in
index 45e66caa8c..d0d9d2905c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1994,6 +1994,7 @@ menu "Other"
 	source "package/flatcc/Config.in"
 	source "package/gconf/Config.in"
 	source "package/gdal/Config.in"
+	source "package/gemmlowp/Config.in"
 	source "package/gflags/Config.in"
 	source "package/gli/Config.in"
 	source "package/glibmm/Config.in"
diff --git a/package/gemmlowp/Config.in b/package/gemmlowp/Config.in
new file mode 100644
index 0000000000..24ba6e9768
--- /dev/null
+++ b/package/gemmlowp/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_GEMMLOWP
+	bool "gemmlowp"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Low-precision matrix multiplication.
+
+	  https://github.com/google/gemmlowp
diff --git a/package/gemmlowp/gemmlowp.hash b/package/gemmlowp/gemmlowp.hash
new file mode 100644
index 0000000000..7c56a18bb6
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  cc8a22b6f071c3781e6b4b72654c89b1cdc198e72ebadebb17638eac205344c1  gemmlowp-08e4bb339e34017a0835269d4a37c4ea04d15a69.tar.gz
+# License files, locally calculated
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/gemmlowp/gemmlowp.mk b/package/gemmlowp/gemmlowp.mk
new file mode 100644
index 0000000000..1a36fc48f7
--- /dev/null
+++ b/package/gemmlowp/gemmlowp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# gemmlowp
+#
+################################################################################
+
+GEMMLOWP_VERSION = 08e4bb339e34017a0835269d4a37c4ea04d15a69
+GEMMLOWP_SITE = $(call github,google,gemmlowp,$(GEMMLOWP_VERSION))
+GEMMLOWP_LICENSE = Apache-2.0
+GEMMLOWP_LICENSE_FILES = LICENSE
+GEMMLOWP_INSTALL_STAGING = YES
+GEMMLOWP_INSTALL_TARGET = NO
+GEMMLOWP_SUBDIR = contrib
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
