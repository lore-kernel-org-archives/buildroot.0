Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4760EEB57B
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 00:26:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32FED80B14;
	Fri,  2 Jan 2026 00:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ejTtcqbFHlsA; Fri,  2 Jan 2026 00:26:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4601F80AF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767313594;
	bh=BAD1cSRmHym2Sqq9rZ3Zb6wTZSehVJEEr3/itJpdydk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Ll4NhvrRcgTvsIs168VLdSPaTBmZHiSPJY2JJWHlpqhH72i+QiwfNdbDw7XnzxD15
	 w0yHFZo2Dj/Z0DECP88honQvokJHmWM1XbXhzBv86D6vgYIlGJ4WTnwxnVrSbNr1sO
	 SC4xlG03QGg90Jv7FJyHJqHkkeda5QQ7Yyp5h+hGODApplWclj1/c/TQqvqS7eSKx3
	 rRO7BbsAeR0ucZ3uANC+QsKtLPVzu1u8WWXR6VsVgohKInvI5TXDDeOmNk8Y/eBC18
	 L6Qta+iskuis31bPKHT6iNFNAiM9UMCG2R54TrP2qBxvgWIz6vcXVpZY/PM/OlPiLD
	 4wwZ1I01CNvow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4601F80AF7;
	Fri,  2 Jan 2026 00:26:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DFB9D19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 00:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCEA340193
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 00:26:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXeiy08_2JqJ for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 00:26:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::34; helo=mail-oa1-x34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DA71340052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA71340052
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA71340052
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 00:26:31 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-3f5ec7636e2so4022440fac.2
 for <buildroot@buildroot.org>; Thu, 01 Jan 2026 16:26:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767313590; x=1767918390;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E4PnmHECQVsEBO1WlPeqblhLKZUpHqyFVbpG+OWY6Ms=;
 b=HHBFhH1T6lKsN2n75C84jqZUNxrkAP0/hXrV1aypxI6msQKwn5qmhJgMJgMz2blb8p
 Gu6bMC9BhhTZLoonO/nO1F9QycACXVoiuDkvElHAFSuknkSfkHtgd1W/53a0VSRJhFVk
 z9KU3yn81/Vqc2lY85KfCyEnDK7i/LS83os30flhB8t73fl9O6WrKkIwrSFQQDs+sGkc
 2vIgNcTLbX/eDHfq4vCDQOzwbpgDIyoUTIAtVooOitJH4tcM1FWmpdXAGnchadiEXJsE
 G4wQRgfDSJs3YzdosgaaUP5c2/lVrh95puHzGrTrWr4g77F68T20Dz174yoc0zJXI0ID
 u79A==
X-Gm-Message-State: AOJu0YycuI8/gBCyWm6KPqZAQ5yok4gJt6X0YxVusFaVtwrirqdnrpu6
 qEsGdOptWYx9IHj2lWYhrjs4JngxiXKHp93pAotA50ABdV5XTqcViAaUURAJd8QuMQY=
X-Gm-Gg: AY/fxX7pU64hd5NpTzU13zTB7ZzHZIxxUnah49nIB+JNIve/I7JKMu08JnRYxg0RizO
 HpEaLTk7zW7Y1+hDResVlsLaNYRS/HUZHvBdVRt2tsMkVI178pBXYrubjSOP7H3TGCjwWvCGLdb
 cfSGfZ3vXuyqnT59/k61VuYN72Bxn5PxQE0ZzfP+7G4TWZjtpv3M982AZkag9cwYWsOhAhcwTCP
 DbQ1l62X+A0Scn93z0rD1L/+JcC+D3x0GOoCPpBfbqdRWzGn83RMAGRfcs7Nm3OBZZVrhYM91E5
 x4C8Ag8ECdl84n6JkXE0lVY071jnR0UCwXnLpVoNBXcoMpur5+2GbUDJnVVaN5kePcn9UAfpyZD
 Vu9Ov4hSyX04q7t4aTHJotN/XDJTvdOk/asxgL7FX6w057hWOelJOQvx0K42HBqcWZX/TS0hnxd
 Z3mgw5vkdEi/ViZSnPiEw5N0V9Rl3Q44AFl+72j7gLii6hoXhcMSu7kqrlgRntmo9lYFb30BPUs
 baqalJYqQsy+stdcWw3gW4cjqJVG+4TSh6kQrq5xfLPK9HEEMbg53A=
X-Google-Smtp-Source: AGHT+IEIVSkd66/qEYmL36cTO4fc5FKiMAh6QSIT/PfTbsHJ303saYOj9ezrOodSJl8Hz7tDUwiQBw==
X-Received: by 2002:a05:6870:2421:b0:3ec:39bb:d50b with SMTP id
 586e51a60fabf-3fda5607c53mr18283982fac.5.1767313590416; 
 Thu, 01 Jan 2026 16:26:30 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-3fdaabbf2e6sm25061497fac.17.2026.01.01.16.26.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jan 2026 16:26:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Jan 2026 17:26:25 -0700
Message-ID: <20260102002626.2690432-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767313590; x=1767918390; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E4PnmHECQVsEBO1WlPeqblhLKZUpHqyFVbpG+OWY6Ms=;
 b=NZusdPAMiMzSjaIrN7ZIuWI55yzItU/UcnMYNOutlk4M0nuesrz1mbyjy+yLUwL4AX
 JeQ/f/zL+6vhVazAmw+YFmGrRhN1ljjgStTJt1eg+OtuwWWcURzejzNDgI1eY2CxyGym
 C51FqIq3JQgtE1H0RA1UWFCsdcrk4ZX6mR3hPttTFlrcVYCO9YcLqKmqwHSZCAwzwpMH
 Whpfcej7frCOVFYVf1GOtbEQQMx2nZa1/TW+oRuQRjGciI3lqX1Ma54UNWet9qg5s4wV
 cV0seUZyQT8qVJ23tGMuDoZ0R5Fh4vYOt1quy1Fh0cmZO2g2TkjfwyM0nEumQrFSnqkk
 xsKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NZusdPAM
Subject: [Buildroot] [PATCH 1/2] package/python-librt: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                      |  1 +
 package/python-librt/Config.in         |  6 ++++++
 package/python-librt/python-librt.hash |  5 +++++
 package/python-librt/python-librt.mk   | 16 ++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-librt/Config.in
 create mode 100644 package/python-librt/python-librt.hash
 create mode 100644 package/python-librt/python-librt.mk

diff --git a/package/Config.in b/package/Config.in
index 500725d1d4..18a3ed997d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1201,6 +1201,7 @@ menu "External python modules"
 	source "package/python-libconf/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
+	source "package/python-librt/Config.in"
 	source "package/python-libusb1/Config.in"
 	source "package/python-lmdb/Config.in"
 	source "package/python-lockfile/Config.in"
diff --git a/package/python-librt/Config.in b/package/python-librt/Config.in
new file mode 100644
index 0000000000..1e29629680
--- /dev/null
+++ b/package/python-librt/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_LIBRT
+	bool "python-librt"
+	help
+	  Mypyc runtime library.
+
+	  https://github.com/mypyc/librt
diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
new file mode 100644
index 0000000000..5c7f55bbb9
--- /dev/null
+++ b/package/python-librt/python-librt.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/librt/json
+md5  2f0564db5d18a9e41bcd1fbdbdbee77c  librt-0.7.7.tar.gz
+sha256  81d957b069fed1890953c3b9c3895c7689960f233eea9a1d9607f71ce7f00b2c  librt-0.7.7.tar.gz
+# Locally computed sha256 checksums
+sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
new file mode 100644
index 0000000000..5c1ecd8e5e
--- /dev/null
+++ b/package/python-librt/python-librt.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-librt
+#
+################################################################################
+
+PYTHON_LIBRT_VERSION = 0.7.7
+PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/b7/29/47f29026ca17f35cf299290292d5f8331f5077364974b7675a353179afa2
+PYTHON_LIBRT_SETUP_TYPE = setuptools
+PYTHON_LIBRT_LICENSE = MIT
+PYTHON_LIBRT_LICENSE_FILES = LICENSE
+PYTHON_LIBRT_ENV = MYPYC_NO_EXTRA_FLAGS=1
+
+$(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
