Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9CD8C0218A
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89917804A2;
	Tue, 28 Jan 2025 17:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFtHJ3HpfGFr; Tue, 28 Jan 2025 17:02:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 411FD804F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 411FD804F6;
	Tue, 28 Jan 2025 17:02:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A46BF2019
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 91EAA4139B
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fQ0QKAq0SvD for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:02:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2d; helo=mail-io1-xd2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DB39413BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB39413BC
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DB39413BC
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:06 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-844e39439abso150259639f.1
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:02:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083725; x=1738688525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RKCSxRgrRqvuFpIl7FjvgM/ZnF1EVTmJOCEzg/vaFck=;
 b=F9dS7ag91Rn2bv64oNs2r289VTNWZjn3pjgLoqSC1gsVOJtFqi6mucivW13/iyRdUW
 6R6/vwhn5GZCtXGiFJ3g60s58tb9ETw2XtaxR2OBDtqi8y5BQjeJrYe6PSziqqsyOioy
 z0vR86HPoNj+XMVMcOj3XN2LC2JCnfaO40otnW1Xcsc7C0AaObpWWxDTeqblbL8K9LcT
 oHx3v0G9Mo2p6dMPhKQcTRuv7hKTiUtl35XEeniQWzAzIDxdPxSm1/w/OU/M5OtHRQa6
 WorAJt7chH0jkcbXfqJ8ufbZpU5JHkv8h+0aJF3EFiP1aujlNTLUV2inwAw8jtgOjv4V
 +T6g==
X-Gm-Message-State: AOJu0Yx4NqV54yLeoMtmgbdlp+m5+BthUWxt8nEs3Bis2V/sST7YoFL8
 YytlYyD1+JoGUEYcdSn8VihwPTEWeOauMfQXMYQwh4zRJrc+G0OfvKd/9YqG
X-Gm-Gg: ASbGncuecnuWSMVZQxGY8iNlJGW9R2oPXZsE3OrD8/5DbZf4L3HxCdCgTB7IA23PtNz
 aDIWgaHQPDcjAEj6/wnEF5c4y/28lR+O2S3B/kZS5zsAMRVZUvmE9TX5GiODmsng8CigDn9kJp+
 46nwex6g0V9F89tlQKOdHEOEHjGjYIV2xtVkANvsBIKVqG3NZIfQhYnqaH/flbnbiusfWvvmhn5
 VYUs/M6ELqRXQDBTOmL8yDjnxQBOPdsq0hQcNBFL3041DEJ51cott6FW6CHydIUgcRdNcizvvTi
 YJwFss7muQbE0X9tzjYaXdtpNtpj0whmO7Dk/5YFw2hxoidMME+1ksWgdWQ/E1FCKp5IcQnw8Sz
 Y
X-Google-Smtp-Source: AGHT+IEFVXnsBYPuUsmice/mHOM1R0nKL8FYjEzMVT84uqf1DSNAE4YP1xstE+qp4Wf66K2Fj5EEBw==
X-Received: by 2002:a05:6602:3605:b0:84a:5133:9cd8 with SMTP id
 ca18e2360f4ac-85427dea855mr1836739f.10.1738083723341; 
 Tue, 28 Jan 2025 09:02:03 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:02:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:51 -0700
Message-Id: <20250128170153.2298242-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083725; x=1738688525; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RKCSxRgrRqvuFpIl7FjvgM/ZnF1EVTmJOCEzg/vaFck=;
 b=Nyddds2ogpalut1ZJYwUAZ3jv01gaesuA8VG5jSa8GYQUoMDIR/rV966QR18TqBWLK
 MCrZUTK/yq4qtcm7gkUqyDRdymzKe0KN0J9oDiBo6F9E3dV+MvrUas5nASpvBt+H28te
 oRdDf19O0JvOc4B3f5skShsLXtljbwsR6m95Nv8R9iTyNK5nKKuN4U86XF054VtwTIo6
 avP/YMSQEqsuu6EldEalbDIQz9zJNNvltusJlguVlZn++qu32wpcckKd7zsQbWSVjSWs
 VQrMZpTayKkaOIAp8eoEN77tXGoXFnljNXG2KWCJyxanVQEGDo6oYOILzY3vurrdRFSq
 DU/w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Nyddds2o
Subject: [Buildroot] [PATCH v8 08/10] package/fft2d: new package
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
index 2be4990676..5182df571c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3035,6 +3035,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/fp16/
+F:	package/fft2d/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index 74cd3e9815..0f35409720 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2183,6 +2183,7 @@ menu "Other"
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
