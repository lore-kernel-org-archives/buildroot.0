Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48330C3DA64
	for <buildroot@archiver.kernel.org>; Sun,  4 Aug 2024 09:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EEFC34012B;
	Sun,  4 Aug 2024 09:50:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbM9YIM_D432; Sun,  4 Aug 2024 09:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4C6F40163
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4C6F40163;
	Sun,  4 Aug 2024 09:50:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 759B41BF59E
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 09:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E5F3605B7
 for <buildroot@lists.busybox.net>; Sun,  4 Aug 2024 09:50:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHvaOpoCh1gD for <buildroot@lists.busybox.net>;
 Sun,  4 Aug 2024 09:50:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E99D605AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E99D605AD
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E99D605AD
 for <buildroot@buildroot.org>; Sun,  4 Aug 2024 09:50:22 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2f035ae1083so117010801fa.3
 for <buildroot@buildroot.org>; Sun, 04 Aug 2024 02:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722765020; x=1723369820;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rMNvQVnkPSbjPfXROutMCZVDJABephHEPivjKkc1Ow=;
 b=SLXWtQ+ElMlRzTZZKI7L5ipwBJByt8Y39FG1x7kaNkuaVHk9Iebogv019OzvJir/S/
 r+1bIa+AcEjRWuxmF/Kl23YCl6kN/BVO3mlJTOLMC9GojbpM/Law0DpDCvH64bs5IARp
 tKFS/VQ+JrtdYN/pNYFBPeEeEhDGqhqw1meHjFeOxFGIhRXj+mLYy1eSv2FSFrRGIQjA
 XMJ/okc+dg+95Y/VVC0g012P3PCZ0sRALyMnPWaBjU96uwQXBDLep+7qz2/psr5tOSI6
 xwOo3zTK69Xz3RvWxmyF8ZDQP6uVDR/7ILvp/kpl6K8BJcNu61ADTmh6/zm3JEE0aL+M
 vo9g==
X-Gm-Message-State: AOJu0Yx2MvBo6N3LEbBTZ/CG/PIZwV3uskKBf+1g/is+xZGq0L7rCAMr
 qqtyoK57Wa0+AuLt3GkWUUMfuMP59KowMmjQa+XnuO9wDsnOxjby2cOuyQ==
X-Google-Smtp-Source: AGHT+IE4ObV1E1aTvkcwO+oDob8tejZd6goAf2DGPTnOtUd7HmMq5YZFDknty0WIOcADZvIIHnruJA==
X-Received: by 2002:a2e:9199:0:b0:2ef:1c07:475b with SMTP id
 38308e7fff4ca-2f15aa95c6amr57897821fa.15.1722765019267; 
 Sun, 04 Aug 2024 02:50:19 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f15e1a8f46sm6901051fa.29.2024.08.04.02.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Aug 2024 02:50:18 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Aug 2024 11:50:12 +0200
Message-ID: <20240804095012.878259-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722765020; x=1723369820; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4rMNvQVnkPSbjPfXROutMCZVDJABephHEPivjKkc1Ow=;
 b=Cms+GtzY+9cPApKYrVQ3xY7eTUn6yZrrtMtwydvNbAxTl+sWmhtnGOEq7W1T03EZf8
 oJQRNHSXv1nRMFIZcNP2HtYoFp0usTLaA/hC9oQvnA3b4G8klu2+8uwGiO2WicRDV1Of
 rPqsyDujxs40EUutfxZf5WIJMoV2Vjv6c5MB5LYIG9s3zxKXx6wAVTtiY4DSoZwKC8iS
 7BfJnJujJSDdmLoi0ZV/jKaGpHyq7EHeKQ6SGuZy81WQx8mShMG+aa67IMIAc89QZBIj
 ck4CwFq1LN6Y+P280xAdnCPGBp7Off7bBBa+Nzukw70hcmPFswxc85PFpgPeA6rQZYxm
 b5dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Cms+GtzY
Subject: [Buildroot] [PATCH 1/1] package/linux-pam: add menuconfig option to
 build pam_lastlog.so
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/linux-pam/Config.in    | 9 +++++++++
 package/linux-pam/linux-pam.mk | 6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/linux-pam/Config.in b/package/linux-pam/Config.in
index c8aca97ac6..1aa9045333 100644
--- a/package/linux-pam/Config.in
+++ b/package/linux-pam/Config.in
@@ -13,6 +13,15 @@ config BR2_PACKAGE_LINUX_PAM
 
 	  http://linux-pam.org
 
+if BR2_PACKAGE_LINUX_PAM
+
+config BR2_PACKAGE_LINUX_PAM_LASTLOG
+	bool "pam_lastlog.so"
+	help
+	  Build pam_lastlog.so module.
+
+endif
+
 comment "linux-pam needs a toolchain w/ wchar, locale, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on !BR2_ENABLE_LOCALE || !BR2_USE_WCHAR \
diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index a205d67c54..1433eb00b3 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -54,6 +54,12 @@ else
 LINUX_PAM_CONF_OPTS += --disable-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM_LASTLOG),y)
+LINUX_PAM_CONF_OPTS += --enable-lastlog
+else
+LINUX_PAM_CONF_OPTS += --disable-lastlog
+endif
+
 # Install default pam config (deny everything except login)
 define LINUX_PAM_INSTALL_CONFIG
 	$(INSTALL) -m 0644 -D package/linux-pam/login.pam \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
