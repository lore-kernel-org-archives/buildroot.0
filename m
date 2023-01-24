Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94BD2C38142
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 09:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 314A74150F;
	Tue, 24 Jan 2023 09:23:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 314A74150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Qp3JrdFx_bO; Tue, 24 Jan 2023 09:23:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D79DD4182D;
	Tue, 24 Jan 2023 09:23:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D79DD4182D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F43D1BF2B0
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03DAC41719
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 09:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03DAC41719
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raZqnks8MFCY for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 09:22:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B81CD41622
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B81CD41622
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 09:22:47 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id g16so1309579ilr.1
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 01:22:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkj+Wg7JYz5qQJ692+OXUyVjNxR5na6ncsrvT7rc3Ek=;
 b=0pGFFeyxIg2GEmLNvAIqapFxVvZx4cBQhiYxkLltchOBPLvBGJIj9l0gFDHojKH2cd
 HTsvaWWH4D80cRJ5PcjtveU0GcNekyxaafaNJj0LYwfXDCPvlnYagKLh+3RqneQD+rHa
 wPuSf6Je9Agkbj0tk3Hw/4BjWiW0Qoh75Lx8UO1j7nOv3F7sk1bCQO7CNDM0wgcWbiqP
 e3Ot7M21tOwYmmezDC3L11Uj91vRKgXNrjMid1UtNGVGBQJwRULHds2i/nXWqjZ0G5ky
 T6J4IbpIIRcpEhJ0N1i7BCkF1HUUs7enDHtfC7xxotM/XN3HwWPjejntmOBIJZS/zJQS
 Paqg==
X-Gm-Message-State: AFqh2kqAaTEdKauCEA4XT+NEyfz6sR9ctFFXbJFTfujf5MZSHGIZXsNJ
 R210DGIyLsjLJm3+0s9C7EWXSCfZ0K0dOA==
X-Google-Smtp-Source: AMrXdXvMfCDrhXWFiMI3rYpifPUAGlYpZs1usw/cqLpL5JaWuaFDn8XUvPbUeXuVEZl9kL+KdV/qAA==
X-Received: by 2002:a92:cd85:0:b0:30f:55ee:2265 with SMTP id
 r5-20020a92cd85000000b0030f55ee2265mr12508059ilb.28.1674552166570; 
 Tue, 24 Jan 2023 01:22:46 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 v26-20020a02b91a000000b003a7d5061e1bsm524923jan.111.2023.01.24.01.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 01:22:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Jan 2023 02:22:33 -0700
Message-Id: <20230124092235.806969-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124092235.806969-1-james.hilliard1@gmail.com>
References: <20230124092235.806969-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lkj+Wg7JYz5qQJ692+OXUyVjNxR5na6ncsrvT7rc3Ek=;
 b=INrtIQzstV/PMfE2XRRelFPUJqQCq2VW7HLLGXoTRf4j/ob3eeAbUHJAyN8Ye0VyVe
 t7w9JWsbPz6Nr0JPHAv6V3YdTDHNWgQ2OdQmE3H+H5UrxyRUjZPfl9IQ5UgXQBlXuxbH
 PHSsWdgWqQvLIOLaCL3ixGjEOOuxFid1qk6V0T5YE3nHcfGWNzQvi7FSj3zQWk8yCpmD
 7AEijaqn2n1u+NhCYf4TosXasZgozYl17k7A11VWBCBC2DRELj6vPWX8HfbomA2DZbR+
 yikR/iC+UG6qB5r3Qkgr1ZyiYJXM9I6qn+Rd//z76cWxe4kGscaajJFI8rvUEw5/pzoF
 HoAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=INrtIQzs
Subject: [Buildroot] [PATCH v3 6/8] package/fft2d: new package
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

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/fft2d/Config.in  |  7 +++++++
 package/fft2d/fft2d.hash |  4 ++++
 package/fft2d/fft2d.mk   | 22 ++++++++++++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/fft2d/Config.in
 create mode 100644 package/fft2d/fft2d.hash
 create mode 100644 package/fft2d/fft2d.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a711f9f1ee..a2411bc749 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2703,6 +2703,7 @@ F:	package/ti-gfx/
 
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
+F:	package/fft2d/
 F:	package/gemmlowp/
 F:	package/neon-2-sse/
 F:	package/ruy/
diff --git a/package/Config.in b/package/Config.in
index 6377ddd2e5..dd16df061c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2003,6 +2003,7 @@ menu "Other"
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
