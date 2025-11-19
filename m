Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F258CF31A7
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 11:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 390E6822E3;
	Wed, 19 Nov 2025 11:21:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vszDRFouh8Z8; Wed, 19 Nov 2025 11:21:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC151822C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC151822C6;
	Wed, 19 Nov 2025 11:21:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ADD2837D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 11:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97E4940376
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 11:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4U3yt_Dt6lEp for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 11:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D78A240183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D78A240183
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D78A240183
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 11:21:19 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6418738efa0so11551340a12.1
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 03:21:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763551277; x=1764156077;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KwHxCpiTObWKaWK9+8+1VTmwQ4knsB/DPmk1Swc7CVk=;
 b=EGpwzRSPleHo1dVEAcm/V9jGrSv0/LIi6WtfaFPrnt4hzmk0WNAkxBVehtHVePbA3X
 90XPTU3wihOvInqUY9wfAi+n+K7v8Ez6gwomDI7Kg77d1AlRw3kkus+B2ZmRCPJC1ows
 HEAPC/VHerenhk+1H18vQtwM+7BZ/R5MDwSl5nuQyEAzgP2Xxj/xg6qJSqhKutkI3GPk
 7UFy56bQBfTTs5862Fo5W/+Ixi9OFdR6QKdrPZQqZAlehaNqX/cXJ1jL+C2kX0YJfHyF
 bX/pPxVAOvL6okwo5N2VEGQWhyrR95S9zeaDCM69RJrDz7XRYj0fp7l0rGGE0cpHlm8M
 Hc/g==
X-Gm-Message-State: AOJu0YwfWtyh21xArzIfUcOaCMdNHRp7MVTPt1MCEcMxX43Q+dRC655i
 dah3ooJsysSj9AqvGRv+Pzj+g97LU4+lupcLI44dhl2mRFHttpI12OIzvOZv
X-Gm-Gg: ASbGncs27ZQU//4fMghjWue7qkCKO1CZ+ErB52Gr4KmoI1rw9yR3UWACOgdOcmN+G77
 b54bwXBhvQ+w/Q0hKLHMJsRQATcG10RFJHGbbztkVrZA1p8TWATCQj59jRu8WlIco/Wy6rURC0d
 PkkPa5G6H9N9BcnqDjjndbyKfv1KYhn2tBa2CKdPnE3ItTqzHEVogUwh8LtcrAbK2DbnPFietN2
 5LXKJuoxip/eJ8br+IUtX5VqIRRBjuXPTSYbelSjLFBIiFLwRJ8WiQKr7/0f5XkAtp/veI3kggW
 I5NArpKo0qyPfcXWJjfoYUXDyTMGdwDpD0jiF0kgT+RVpm5rs+RZ5xAlPbXaZtPyq0HXG+Ls9B8
 70g9H4PMJcHazmTngsaJn00t2FWpubnxwZ7Z8SkrLfhXBg4WGPGO959eCuhmRYWr8DwiumV7X4Q
 mhzX2z+f08PcrZPqymeRzhU2zu8MpF12/mS9Uw
X-Google-Smtp-Source: AGHT+IEuP46mk7uplgpj1Aepzzw4et0JNouPct92V8+iHQk2BW75hKfOEobYKr8jh0mq+mWlC5h3VA==
X-Received: by 2002:a05:6402:1445:b0:640:e75a:f95d with SMTP id
 4fb4d7f45d1cf-64350e06df6mr20121384a12.15.1763551276460; 
 Wed, 19 Nov 2025 03:21:16 -0800 (PST)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a3f961bsm15087505a12.14.2025.11.19.03.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 03:21:15 -0800 (PST)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: Alexander Shirokov <shirokovalexs@gmail.com>
Date: Wed, 19 Nov 2025 12:20:33 +0100
Message-ID: <20251119112113.87557-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763551277; x=1764156077; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KwHxCpiTObWKaWK9+8+1VTmwQ4knsB/DPmk1Swc7CVk=;
 b=ilZCxQVRrfwWOePvX966rkAFOmaZygatKunC5rKzL43irq/SWTjfg9597h7IVRtWxr
 /q/loI4HSznxMfWNUT12ZgfxlF4prXhBRlEHtq/WQcQr8NEkEKztgn7pbBLH9glSVvWi
 m7PgjQlZxhttRnMJObPNRJOVfzQph7ZzTrBCtRMGqJF08QjY+PduMZY4YtpAIciMusYF
 yKcx4RUIjP4pyFsOr7WEE7wmO7EuJIXpb2xqhh9Aph2KGi3QoyTseVJNKZtCJ5MHzTFw
 sUgtPhMGQkkO0rumfaDkSOBgqHIS0W+AlXQQxp79GFfFMVqDIl7n4AVFlA/fMA7VWpLa
 /L5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ilZCxQVR
Subject: [Buildroot] [v1, 1/1] package/kibi: new package
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

This commit adds "kibi" a configurable text editor with UTF-8 support,
incremental search, syntax highlighting, line numbers and more, written
in less than 1024 lines of Rust with minimal dependencies.

https://github.com/ilai-deutel/kibi

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
---
 DEVELOPERS             |  1 +
 package/Config.in      |  1 +
 package/kibi/Config.in | 20 ++++++++++++++++++++
 package/kibi/kibi.hash |  3 +++
 package/kibi/kibi.mk   | 21 +++++++++++++++++++++
 5 files changed, 46 insertions(+)
 create mode 100644 package/kibi/Config.in
 create mode 100644 package/kibi/kibi.hash
 create mode 100644 package/kibi/kibi.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 0272b4ba33..d768417159 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -88,6 +88,7 @@ F:	package/cpp-httplib/
 
 N:	Alexander Shirokov <shirokovalexs@gmail.com>
 F:	package/broot/
+F:	package/kibi/
 F:	package/nnn/
 
 N:	Alessandro Partesotti <a.partesotti@gmail.com>
diff --git a/package/Config.in b/package/Config.in
index 12f327cb27..863c97f6b1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2941,6 +2941,7 @@ menu "Text editors and viewers"
 	source "package/bvi/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
+	source "package/kibi/Config.in"
 	source "package/less/Config.in"
 	source "package/mc/Config.in"
 	source "package/mg/Config.in"
diff --git a/package/kibi/Config.in b/package/kibi/Config.in
new file mode 100644
index 0000000000..1a045ea21a
--- /dev/null
+++ b/package/kibi/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_KIBI
+	bool "kibi"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  A configurable text editor with UTF-8 support, incremental
+	  search, syntax highlighting, line numbers and more, written
+	  in less than 1024 lines of Rust with minimal dependencies.
+
+	  https://github.com/ilai-deutel/kibi
+
+if BR2_PACKAGE_KIBI
+
+config BR2_PACKAGE_KIBI_SYNTAX_HIGHLIGHTING
+	bool "syntax highlighting"
+	default y
+	help
+	  Install files to enable syntax highlighting. This option adds
+	  200 KB of data to /usr/share/
+endif
diff --git a/package/kibi/kibi.hash b/package/kibi/kibi.hash
new file mode 100644
index 0000000000..7d99b709b0
--- /dev/null
+++ b/package/kibi/kibi.hash
@@ -0,0 +1,3 @@
+# Locally generated
+sha256  0a2cdd264fadf455ed919e5d4c12ab25614735dfe0b30895004ce4f3919d7eff  kibi-0.3.1-cargo4.tar.gz
+sha256  53cdcb17642e801f813712b4844293b037c23d4b482004b77c15ae2f36f551c3  LICENSE-MIT
diff --git a/package/kibi/kibi.mk b/package/kibi/kibi.mk
new file mode 100644
index 0000000000..dae6746310
--- /dev/null
+++ b/package/kibi/kibi.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# kibi
+#
+################################################################################
+
+KIBI_VERSION = 0.3.1
+KIBI_SITE = $(call github,ilai-deutel,kibi,v$(KIBI_VERSION))
+KIBI_LICENSE = MIT
+KIBI_LICENSE_FILES = LICENSE-MIT
+
+define KIBI_INSTALL_SYNTAX_HIGHLIGHTING_CMDS
+	$(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/share/kibi/syntax.d
+	$(INSTALL) -m 0644 $(@D)/syntax.d/*.ini $(TARGET_DIR)/usr/share/kibi/syntax.d
+endef
+
+ifeq ($(BR2_PACKAGE_KIBI_SYNTAX_HIGHLIGHTING),y)
+KIBI_POST_INSTALL_TARGET_HOOKS += KIBI_INSTALL_SYNTAX_HIGHLIGHTING_CMDS
+endif
+
+$(eval $(cargo-package))
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
