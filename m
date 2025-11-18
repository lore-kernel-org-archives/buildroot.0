Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427C2CEBF97
	for <buildroot@archiver.kernel.org>; Tue, 18 Nov 2025 14:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFAD66069D;
	Tue, 18 Nov 2025 14:53:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Fx_JsditCoa; Tue, 18 Nov 2025 14:53:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1493260739
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1493260739;
	Tue, 18 Nov 2025 14:53:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EE96158
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 14:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72D476069D
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 14:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LdfZWvTFEtgS for <buildroot@buildroot.org>;
 Tue, 18 Nov 2025 14:53:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.52;
 helo=mail-wm1-f52.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4DAE460699
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DAE460699
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4DAE460699
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 14:53:11 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so33166735e9.3
 for <buildroot@buildroot.org>; Tue, 18 Nov 2025 06:53:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477589; x=1764082389;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0qNf0NHh1I9LFRnPB5D8M0OvU2Q3Ntn6sv7TQSuTvII=;
 b=CeJ+r1MQAk0z+bljZAt8FeZwyPz41BnFPEBkK4jf9Ck7MuycAuwfesIySzmTZqA0VT
 X6I4vwpT2CJJgWybLQCtr+mxOx99gshwJxM1Fa+Aduj+ZhblLvTdtDt8/W4gWxyoEY35
 0JXjpreCWYyY+mITkAVpZaWg70VFKpggmIcC6g//n7GIidrZCOTWVur0kwhgKKoUtISG
 Q7gYRCar10I9aeZG0NgSreHeYIuogcD2sSoByv/q1n/vnBoeGFA61c4ZUXHXF8QSxY6B
 F14vUflckQoFSZZccWIzuDVFHApc4apEB/QORfzVCUCwnW/psYPvUenhFJz+TK2G5PdC
 NZaQ==
X-Gm-Message-State: AOJu0YxAP7+ynvWfZc+NP5zCe7ZqP4yVwB9ztItCYgWZxMobPwZxwCE5
 A4PwD019wQyl7sMIkGUeq1Y0/fR54LKmXYrNzL4F0y4AYIwRauOcYEbY/ZsRrkNx
X-Gm-Gg: ASbGnctXH6OTNA+nf9n+GWPJvskxsLbSVr/XlPzNIi6bsvdNjFZg8Z6kCvHlKxNxynk
 Pt53bY8c950xXSji6s3xUtKrWXbx3Spj8Fd40qNQYbQXpQgE2QFmCmAorjIEncNv7N/7+qDH5nv
 L6SrUkzZBa/ZAa5leApFG/OFJZBoNmLarVAbSl4s5jQoBBIhkigHFxUbhXLgKvRDMQYyI3xsaT/
 2TnXX6AkXwe5H5V2cW2pJXqS/adD2ddk85n/hYvid7Iv1/MlqOxdLSJ2Ua4jHCGlhEJuN0ksMq5
 NxR8ArD2MKoI6h5MpUqgNAqIIMrZFXYv4cz2fUCwSKLSLyqEhudnV/T6YwyZgkqg/mwgd1jaSzw
 IooAOkJxbhM0VIZma7IioqFo69E19WlG/7a0Vk4tKLMbYKPEOKC5U6vAxauZkjLyjak6kQE1VY7
 hcXaJa5ZHp9i+kzgMoYjeoZojwzhQp3Yg1fX0n+hPgYJB6+S4Uog==
X-Google-Smtp-Source: AGHT+IFEbJ93K3alUwiknXY67/lkgl1rgQQq/9jRpj/tMkcLEQbptfmMe1p3k+eH4C95y4d3zPSjmQ==
X-Received: by 2002:a05:6000:1447:b0:42b:411b:e476 with SMTP id
 ffacd0b85a97d-42b5935df29mr15165682f8f.9.1763477588733; 
 Tue, 18 Nov 2025 06:53:08 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b60csm31675856f8f.22.2025.11.18.06.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:53:08 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue, 18 Nov 2025 15:53:03 +0100
Message-ID: <20251118145303.2215064-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH] package/yq: add new package
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

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

Version 4.45.2 was selected as newer versions require Go 1.24 [1],
which is not yet available in Buildroot.

[1] https://github.com/mikefarah/yq/commit/5bc2cd03da9139160db70901ffb8002bf6e242d5

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/Config.in    |  1 +
 package/yq/Config.in | 10 ++++++++++
 package/yq/yq.hash   |  3 +++
 package/yq/yq.mk     | 13 +++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/yq/Config.in
 create mode 100644 package/yq/yq.hash
 create mode 100644 package/yq/yq.mk

diff --git a/package/Config.in b/package/Config.in
index 12f327cb27..1dfff206d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -203,6 +203,7 @@ menu "Development tools"
 	source "package/tree/Config.in"
 	source "package/unifdef/Config.in"
 	source "package/yasm/Config.in"
+	source "package/yq/Config.in"
 endmenu
 
 menu "Filesystem and flash utilities"
diff --git a/package/yq/Config.in b/package/yq/Config.in
new file mode 100644
index 0000000000..d85b3e5601
--- /dev/null
+++ b/package/yq/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_YQ
+	bool "yq"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_GO
+	help
+	  A lightweight and portable command-line YAML, JSON, INI
+	  and XML processor, yq uses jq (a popular JSON processor)
+	  like syntax.
+
+	  https://mikefarah.gitbook.io/yq/
diff --git a/package/yq/yq.hash b/package/yq/yq.hash
new file mode 100644
index 0000000000..bc9dccad81
--- /dev/null
+++ b/package/yq/yq.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  39296b55e33962ef838cd8a1bc0e9850e775de4cc3843bf15f099324069d2632  yq-4.45.2-go2.tar.gz
+sha256  697db34dabb21562fe84487a2ccd031fbd45382b89c2cbdec8ef31682c486040  LICENSE
diff --git a/package/yq/yq.mk b/package/yq/yq.mk
new file mode 100644
index 0000000000..b42b8e652c
--- /dev/null
+++ b/package/yq/yq.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# yq
+#
+################################################################################
+
+YQ_VERSION = 4.45.2
+YQ_SITE = $(call github,mikefarah,yq,v$(YQ_VERSION))
+YQ_LICENSE = MIT
+YQ_LICENSE_FILES = LICENSE
+YQ_GOMOD = github.com/mikefarah/yq/v4
+
+$(eval $(golang-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
