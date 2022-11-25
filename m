Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3C0C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Nov 2022 16:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5A974058B;
	Fri, 25 Nov 2022 16:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5A974058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rd01aX6r4YtZ; Fri, 25 Nov 2022 16:09:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6976401F1;
	Fri, 25 Nov 2022 16:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6976401F1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B70B31BF966
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E452611DE
 for <buildroot@lists.busybox.net>; Fri, 25 Nov 2022 16:08:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E452611DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EnmuniZtfjfh for <buildroot@lists.busybox.net>;
 Fri, 25 Nov 2022 16:08:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6488611D1
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6488611D1
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 16:08:05 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id c7so3315204iof.13
 for <buildroot@buildroot.org>; Fri, 25 Nov 2022 08:08:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yxz05Jh+H1ML++yDV/sEEBvnhQzIWo6kvyWzDZxX1Ow=;
 b=xos03bnyPhVVo9uYVADVmz8iwJuXbz2JfIlmWPB9dyrSKWtdv/L/D7MzZCFZJAb3Gn
 ZsFjKVaLbeeIMxfhmhPVVKkv9flARo65ONFbg8XldYJy8dJxzilcSViViNEegq3pdS2w
 PxAWeCN6d8ET54ytDHctbHY2f0aiziw5RtCG2Wmibwd8k+laeWuIXBhXSRNq0ZuT3Iv7
 DzVP0Jk0FcBFTyPpDYybJB2hY21PBF8Rb1EmAnMUxAZ/auGH9dYr6q9x7lkkP6SvYyft
 p0m7QrP5c4bwuIchqjvSon3KfC2C//ghTOc7+5ranvzaMibbVJsiAHVaHBrJPOk52qre
 T+8g==
X-Gm-Message-State: ANoB5pkYfF3v/caujZ6dgeKK6KhXezOb+sylOMPRVOKRpF8ySs0ltDLp
 jsNiE2g94nsDreGJQl0rOZ/Kc8z7+b12Gw==
X-Google-Smtp-Source: AA0mqf71MAKqKs2ZlpOEFxbygtEQBYJCkjCIBZErhMJr+itetMMV1vGa0iyd9FVYXfwa07zg5so6GQ==
X-Received: by 2002:a05:6638:4103:b0:375:1a70:9c5c with SMTP id
 ay3-20020a056638410300b003751a709c5cmr13048035jab.129.1669392484381; 
 Fri, 25 Nov 2022 08:08:04 -0800 (PST)
Received: from james-x399.localdomain (71-218-226-239.hlrn.qwest.net.
 [71.218.226.239]) by smtp.gmail.com with ESMTPSA id
 z28-20020a056638215c00b00363753f4730sm1497384jaj.91.2022.11.25.08.08.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 08:08:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Nov 2022 09:07:22 -0700
Message-Id: <20221125160724.1725476-6-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125160724.1725476-1-james.hilliard1@gmail.com>
References: <20221125160724.1725476-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yxz05Jh+H1ML++yDV/sEEBvnhQzIWo6kvyWzDZxX1Ow=;
 b=MTNwPr8q389W4xWsRW5zq+R7sHkXvIdRF4hHMD/81GeepRsZWWjoUOcbKbfK+8AdMn
 OHtkxbqf/lyqIm6sJYTSSU4HKdEPmUK6Nx5ipkpa6mZnUZyQxInc4KKjy+ij0dSRRuhc
 k2COZfxZCGhLTQWLysbOapWguWcblI4PFDxfE7d0mekuROe2LVOZCqJqGag3OpmB2iGb
 0PN7ylYy0qj1pM/1NvfASGdv4HL5glmyhH0eCYM8GxjNS6fkmt61Jn+3lWCGGbVMLm78
 ffkfRo1MUhBdJcuvuOYPBLMv8Jolq2Mvv9YRGdW6nK5oWOX1LoBIPJbUGoPCmFon6bD2
 EzDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=MTNwPr8q
Subject: [Buildroot] [PATCH 6/8] package/fft2d: new package
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
