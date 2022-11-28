Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D176C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 18:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1123409A5;
	Mon, 28 Nov 2022 18:00:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1123409A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ufx5jut8KZzK; Mon, 28 Nov 2022 18:00:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4615409DD;
	Mon, 28 Nov 2022 18:00:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4615409DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 877B71BF20B
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 708A260B92
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 17:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 708A260B92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Zay_M51Y6dL for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 17:59:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51F4160B88
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51F4160B88
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 17:59:01 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id h17so5400043ila.6
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 09:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxz05Jh+H1ML++yDV/sEEBvnhQzIWo6kvyWzDZxX1Ow=;
 b=blCKHnVt3gjMIfbycDpYHITGdOMLyOy4+IrsGW9v06iDbnKUU2PgCilfLSq3QZLqKB
 QXVIB3Fcnq/R0SQf8qKuLGglU4oDD9confQOHeSBbcwGIgLouFtdyztQMu6q+k/haeTW
 Uqqlr4yD/zRDTWIP8F/JHi1C9iROJPZ9j8T4CivA4qo6pzLjc62evlBcBA89CCXseTHt
 WYbdPxryUuM51UjSzUtTZx96OUfeXVUNngZfwcSA/TO3c84TMZNcTCvldV561VPyBm4P
 W06CyiYD6gef1XOv2gagnaiN1w+Za5oH7LLBH8RzTnT9Ey3P1N+Wn1SmuuOgdLxM6rNp
 YsOA==
X-Gm-Message-State: ANoB5pm6Ul3kpjcm4ldpOSWbJMTQjgQDRwpxYmLXWK6+vplQHnrVWFW5
 +IKuImZOpZ1BOJMjabATiM9Gs8kmdt6bRrA6
X-Google-Smtp-Source: AA0mqf6PZVUv/4vilFlU3BBlvsil35tkw99DRp6Gnm8NBekOQ37Hz4VWUSq9BQQ0cH1uM37fFTiVYQ==
X-Received: by 2002:a92:cc90:0:b0:302:4f58:bcab with SMTP id
 x16-20020a92cc90000000b003024f58bcabmr14339078ilo.313.1669658340032; 
 Mon, 28 Nov 2022 09:59:00 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 y16-20020a056638229000b00363781b6bccsm4564802jas.49.2022.11.28.09.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Nov 2022 09:58:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 28 Nov 2022 10:58:49 -0700
Message-Id: <20221128175851.1913859-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128175851.1913859-1-james.hilliard1@gmail.com>
References: <20221128175851.1913859-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxz05Jh+H1ML++yDV/sEEBvnhQzIWo6kvyWzDZxX1Ow=;
 b=f+Us29F1fhOjC4RqVDsrnkbxf83IDQvd1/HR5TJBn4dZo2jYHr+L2NOp29ktM53feg
 wtS3ifu4UMZmm0odgTeI3QBOSmAdsMfxuAKFfQuQ9+8NBQpyglkWccPygoqz6kICe7Pq
 H+05xr9cTKAOLD9cnARSR1KPaQKbZceEm1dtmWs+NJ6ABE5gxm9FF6cWfN56KigHfsg1
 I9ZBeTRyCAO5CqBdWCsstHDY47RO/+WO/nyl8FHWsy42jiIVhFvYeQohX1tnwVSk4tuz
 I+xSajPI89xTVkjkSscW7lIyWouTwDfomr80Z6SK8WuXwlbx07mZIKOddIa50/epAjWK
 yHqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=f+Us29F1
Subject: [Buildroot] [PATCH v2 6/8] package/fft2d: new package
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

This package doesn't provide a conventional install mechanism so
we need to install it manually.

Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in        |  1 +
 package/fft2d/Config.in  |  7 +++++++
 package/fft2d/fft2d.hash |  4 ++++
 package/fft2d/fft2d.mk   | 22 ++++++++++++++++++++++
 4 files changed, 34 insertions(+)
 create mode 100644 package/fft2d/Config.in
 create mode 100644 package/fft2d/fft2d.hash
 create mode 100644 package/fft2d/fft2d.mk

diff --git a/package/Config.in b/package/Config.in
index 2ec623ed8f..fe636fde9d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1988,6 +1988,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
 	source "package/falcosecurity-libs/Config.in"
+	source "package/fft2d/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
diff --git a/package/fft2d/Config.in b/package/fft2d/Config.in
new file mode 100644
index 0000000000..38394f6170
--- /dev/null
+++ b/package/fft2d/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FFT2D
+	bool "fft2d"
+	help
+	  This is a package to calculate Discrete Fourier/Cosine/Sine
+	  Transforms of 2,3-dimensional sequences of length 2^N.
+
+	  http://www.kurims.kyoto-u.ac.jp/~ooura/fft.html
diff --git a/package/fft2d/fft2d.hash b/package/fft2d/fft2d.hash
new file mode 100644
index 0000000000..a1b1a326ae
--- /dev/null
+++ b/package/fft2d/fft2d.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ada7e99087c4ed477bfdf11413f2ba8db8a840ba9bbf8ac94f4f3972e2a7cec9  fft2d.tgz
+# License files, locally calculated
+sha256  0b2a2082537735a2a576dbec2e8f9c1a09812eac6df6a389502a6ba860072906  readme2d.txt
diff --git a/package/fft2d/fft2d.mk b/package/fft2d/fft2d.mk
new file mode 100644
index 0000000000..6263b1af38
--- /dev/null
+++ b/package/fft2d/fft2d.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# fft2d
+#
+################################################################################
+
+FFT2D_VERSION = 2006.12.28
+FFT2D_SITE = https://www.kurims.kyoto-u.ac.jp/~ooura
+FFT2D_SOURCE = fft2d.tgz
+FFT2D_LICENSE = readme2d.txt
+FFT2D_LICENSE_FILES = readme2d.txt
+FFT2D_INSTALL_STAGING = YES
+FFT2D_INSTALL_TARGET = NO
+
+define FFT2D_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.c $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.f $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include/fft2d
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
