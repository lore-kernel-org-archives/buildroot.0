Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5BBC6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 16 Mar 2023 08:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14FE6813AC;
	Thu, 16 Mar 2023 08:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14FE6813AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vF6YaGqZpiXE; Thu, 16 Mar 2023 08:36:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 097A981F27;
	Thu, 16 Mar 2023 08:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 097A981F27
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A8521BF97E
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32C0D60F6E
 for <buildroot@lists.busybox.net>; Thu, 16 Mar 2023 08:35:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32C0D60F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C-drKiKqAxvB for <buildroot@lists.busybox.net>;
 Thu, 16 Mar 2023 08:35:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36BA60F66
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E36BA60F66
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 08:35:05 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id s4so437124ioj.11
 for <buildroot@buildroot.org>; Thu, 16 Mar 2023 01:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678955705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZfgLnS9FHedGhpQJSi3RfeuXC2+qCco5zgV5BgAKMio=;
 b=I+PkDUQi9lOtsbLOj5lUb1byHe7MLHfR+6UV1YuhaIdHsjauivG+26ttJPpRJwcYbM
 Y7x9JC6zxQjTJ+Ba0bpNtXm5MdQqe9T29h9ZktqwbXVpj+2EEMEDXbHkiT8bgKZukHxx
 /zlHsxBxQyWH+r02nWHgAoMLpZRUw0ZN1TA5c1eFv3F87aOnJpO2WxwK5scKtIskkKKn
 6kdV8omoZIhPS2Ix23kkfl9tLToG1daYNzH9dIWt0OzDxh02bYo+uUogFfcz8Xtwiugb
 r+0qV7rInqDjoDjJhfZ1aGpHaBHzSG+4vqw+1BDempctooeLyGOEmF0RDRUSNVWdZ1if
 1svQ==
X-Gm-Message-State: AO0yUKX502dEusSNtfFGXvH9JV3M0ZknaoTFBCj/aOWl1rl7tccLx2Uo
 V5rJ1Z/cXDZRUPKDytRyMsmcV6otjUpnpw==
X-Google-Smtp-Source: AK7set889XgE3YlHEyefyon9X70OcDF9bvTsrE/Wny37wgvmLfRFf3dmNlEEhwAlWF4XeWbZo3KRFg==
X-Received: by 2002:a6b:a07:0:b0:74c:a9a5:2c56 with SMTP id
 z7-20020a6b0a07000000b0074ca9a52c56mr27706038ioi.21.1678955704724; 
 Thu, 16 Mar 2023 01:35:04 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 y34-20020a029525000000b003b331f0bbdfsm534630jah.97.2023.03.16.01.35.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 01:35:04 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 16 Mar 2023 02:34:38 -0600
Message-Id: <20230316083440.3466725-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230316083440.3466725-1-james.hilliard1@gmail.com>
References: <20230316083440.3466725-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678955705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZfgLnS9FHedGhpQJSi3RfeuXC2+qCco5zgV5BgAKMio=;
 b=HpS3Sc8mEV+zE6/Tyd3eYOcih+oI6W0bHCk40tsxBu1AG/z+Lxdwcnt79008F+jXwh
 kjeXhmh++ylaEx4w1k6hu/3t2rlMaMUtaIIDuXsmm6FgeP4RkmPln7JEVfcryzjErY3P
 YZgmJaCbfw0pKsfmywG0PkYDSsavwZf1/0nuCpqJ/G3N4ACeWexIv2Vs6p3biigJup8I
 PsC+dt2YiYcjAIWpsXU4CCrghGQfVTo8+JOBtUi7etv2oobvsRY6Rn8ant1qV03JLv+4
 ZeUiod77ktJDvRfTX9EtbnqC7xKVHUPPlGXcEFns73lSH8fS6zwlFOZWJ8jAThZ0LS1e
 1+lA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HpS3Sc8m
Subject: [Buildroot] [PATCH v6 08/10] package/fft2d: new package
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
Changes v4 -> v5:
  - add comment indicating library is header/source only
Changes v3 -> v4:
  - fix license
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/fft2d/Config.in  |  7 +++++++
 package/fft2d/fft2d.hash |  4 ++++
 package/fft2d/fft2d.mk   | 23 +++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/fft2d/Config.in
 create mode 100644 package/fft2d/fft2d.hash
 create mode 100644 package/fft2d/fft2d.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 90c0508105..da79dd3022 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2688,6 +2688,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/fp16/
+F:	package/fft2d/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index 6f6c5beca8..893d5facdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2032,6 +2032,7 @@ menu "Other"
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
index 0000000000..781b545e2e
--- /dev/null
+++ b/package/fft2d/fft2d.mk
@@ -0,0 +1,23 @@
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
+# Only installs headers/sources
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
