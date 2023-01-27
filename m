Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6744C38142
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 14:13:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 75BC3820DE;
	Fri, 27 Jan 2023 14:13:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75BC3820DE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Bqgo6uQMoSl; Fri, 27 Jan 2023 14:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 977C88208F;
	Fri, 27 Jan 2023 14:13:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 977C88208F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 464C71BF39E
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CA77611F1
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 14:11:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CA77611F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lx90jzUon5yW for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 14:11:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FD2161296
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FD2161296
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 14:11:08 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id y69so1950702iof.3
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 06:11:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5nef2vcq/7CURMbDXHA35whoXkmtlMhsXpgKmZPfq3g=;
 b=Kxd54k3AbhwiADuOJnFZOthUnPuJc0Logw+zbbvJptTbuOKMXmMw2lf/iv22CKP7je
 osfBpg49GOlsthnwLRK03NsVZmGICih7Ua4wcjAN/LPBRxxJDZcM6XsBqfyeCA6dhykT
 F82JkCJYeGNRu5Pqn3+COa0sTh9FG4PhlEs6H0tpM1wWa+OIWhVWs92F8OSdiOQCxYll
 AehwwJTxidTia9V7vPvzM/x0GuZWxrqFCuy0skCXeZE0katI+dbHfu2ins0udVxpTbHH
 Tw/kSKUj2MQT5MzQ7uv5wqnNbZ5HDSD+BnV7JN2XzdNrtB3yQgpPzrp4BQuJGSo2ZwjZ
 a3xg==
X-Gm-Message-State: AO0yUKXyzKatfjVrhobpPlkLYzQ2Q5caUMCWwiCbgjBImTzySP6WHHJV
 0VZ9O/WIOhqX51cF0er5kw110GOdTvNrOg==
X-Google-Smtp-Source: AK7set/jgyEBZoSz605IGiSZyX3Su0QhSWQfzd4hb1d5Sy4lTxm3Lx2PVSsCvTsPXRww90VTiEmVvw==
X-Received: by 2002:a05:6602:341a:b0:70b:4f72:9ee0 with SMTP id
 n26-20020a056602341a00b0070b4f729ee0mr3959495ioz.21.1674828667927; 
 Fri, 27 Jan 2023 06:11:07 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 n2-20020a6bed02000000b006d8b7bcaa6esm1290806iog.4.2023.01.27.06.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 06:11:07 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 Jan 2023 07:10:56 -0700
Message-Id: <20230127141058.2180747-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127141058.2180747-1-james.hilliard1@gmail.com>
References: <20230127141058.2180747-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5nef2vcq/7CURMbDXHA35whoXkmtlMhsXpgKmZPfq3g=;
 b=Vg0hZa9IwVV7JSu1DyC7r1NdQkX4ux8cCMpnn2a8aYKCIb2y5OHg8PnTF3sbr/SwCR
 dKw0Njfnwns1mP6/jKZPhdkkz6yK27eOFldrWIZ4oQN63Nc/DOIz7sIVcxPQcPsDFw9b
 GWpnKBRaktbhdExCqhsrMdAHR8tO6kn9m41B45ZITQ0ZYqPURryOXNXJ+Y4YQ3xAp+PZ
 lHHEzmuee6PJdu6k1CLjo3FtfoosNX+PyTMd/c5pI/JDiHyj7visXqXdxU0O032LPoA1
 ON4CM6ivLoqWZFqQcTmNziC4pp6rl8WuO6QIINA1c6V4+nTJAptU0emeqiOgckzpl4W1
 jWhQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Vg0hZa9I
Subject: [Buildroot] [PATCH v4 11/13] package/fft2d: new package
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
Changes v3 -> v4:
  - fix license
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
index cfb0a8228d..a9ecf7847f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2704,6 +2704,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/fp16/
+F:	package/fft2d/
 F:	package/fxdiv/
 F:	package/gemmlowp/
 F:	package/neon-2-sse/
diff --git a/package/Config.in b/package/Config.in
index 26e37e2687..53f544ef40 100644
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
index 0000000000..eac68325a1
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
+FFT2D_LICENSE = MIT-like
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
