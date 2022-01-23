Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A3EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 09:51:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15E7660AFB;
	Sun, 23 Jan 2022 09:51:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a5Gay8-AdP4l; Sun, 23 Jan 2022 09:51:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FE2B60AF1;
	Sun, 23 Jan 2022 09:51:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57B721BF57F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 464614067F
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 09:50:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KdlzDi0D-weT for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 09:50:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 547054067C
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 09:50:36 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so25569440wmb.5
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 01:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eNSjjbHju/89FiANAsIY3GS2/XWjBeOVCnp2+sNyxB8=;
 b=etNkvDwfSTkjjAiEfxSwEgSuZW42SwOsv+8C+lIW08o6rqbcVzM82IAQqB6dYpVQ+W
 OPGwUU8UjYlu27Ks1YtlRLIb9HJ9JS7dW9ac1ucHhntBr0ovhtphCGwb/Nnw59qm617G
 PNFfVmuXW3ttQuktAR+d+wUsbYUUECaJowLtX6OguqiVCb2+KjBdtY0oWmnrlk/brNvy
 3gRZ8zWgvtC1BuE9/A5Yrq7EdF3xOYCUo9ckq3ifeCANabzM4AMrgUcgstIQha+Ueb0B
 0MbGsDiiXmTirLrGlbGL0p+ulb0vbHnI/B1VXxJsr6MsI7ZZKK/hzpoCntDirh8NxjiO
 Zn5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eNSjjbHju/89FiANAsIY3GS2/XWjBeOVCnp2+sNyxB8=;
 b=sR38hFa73DT2PSY6HVAT6K/7aVKwSW6CNu3OUIOr/JE3XV9QwAdhJN1AV8Wd5nxbBX
 tSCQ3fPUWQA2dOxWKsFQbPdbZZMUxExXPI6U+ftXO6iVF24PaLcEkOd59i2GYt9L8PLx
 uX4Q08wRDLnR+s4fk38shxVDLRESTcuWORaoxWhgJ3eIdN/4Vc4egHC/Ozsypn4EgHgB
 o9TuzYwpfNT/NL9dx4qIZs5j7e+3YcEm3x9lgbwWTkJBMC2Q42eRwUOhylzn8C7y1jhP
 5SmQe1YYFdPRnq5kA7r1qmA0AKa0IlYUFCiDo9N7Xk0AhoWDG8KaPNbqwrn8crp4BgLH
 1VNQ==
X-Gm-Message-State: AOAM5339xHqRGzD9F1z/RLneZvPhIYb9TUjV+FqMI81OUhyKPLT5bMxv
 kOVBANzu+uFHn0azEqA03viY22rcHbE=
X-Google-Smtp-Source: ABdhPJy2qwPDXNndaf6IG0jjVz6oAYAXvpOTWTSLqjdc7iJFGZ4li7hYnwhAT3SCRcqJmGcAFo0VQg==
X-Received: by 2002:a1c:cc0f:: with SMTP id h15mr7378040wmb.38.1642931434467; 
 Sun, 23 Jan 2022 01:50:34 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id l24sm9773505wme.17.2022.01.23.01.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jan 2022 01:50:34 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jan 2022 10:48:47 +0100
Message-Id: <20220123094850.491817-3-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
References: <20220123094850.491817-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/6] package/lighttpd: add brotli support
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...uild-meson-fix-typo-in-variable-name.patch | 25 +++++++++++++++++++
 package/lighttpd/Config.in                    |  6 +++++
 package/lighttpd/lighttpd.mk                  |  8 +++++-
 3 files changed, 38 insertions(+), 1 deletion(-)
 create mode 100644 package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch

diff --git a/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch b/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
new file mode 100644
index 0000000000..d338979d46
--- /dev/null
+++ b/package/lighttpd/0002-build-meson-fix-typo-in-variable-name.patch
@@ -0,0 +1,25 @@
+From 876a1e1b2cc21282a0df5245004197cdffe1d380 Mon Sep 17 00:00:00 2001
+From: Glenn Strauss <gstrauss@gluelogic.com>
+Date: Thu, 20 Jan 2022 07:04:51 -0500
+Subject: [PATCH] [build] meson: fix typo in variable name
+
+[Retrieved from:
+https://github.com/lighttpd/lighttpd1.4/commit/876a1e1b2cc21282a0df5245004197cdffe1d380]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 4ee163468..b35c1037f 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -266,7 +266,7 @@ endif
+ libbrotli = []
+ if get_option('with_brotli')
+ 	libbrotli = [ compiler.find_library('brotlienc') ]
+-	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotlienc, prefix: '#include <brotli/encode.h>')
++	if compiler.has_function('BrotliEncoderCreateInstance', args: defs, dependencies: libbrotli, prefix: '#include <brotli/encode.h>')
+ 		conf_data.set('HAVE_BROTLI_ENCODE_H', true)
+ 		conf_data.set('HAVE_BROTLI', true)
+ 	else
diff --git a/package/lighttpd/Config.in b/package/lighttpd/Config.in
index 05a7c84961..f3e252d850 100644
--- a/package/lighttpd/Config.in
+++ b/package/lighttpd/Config.in
@@ -21,6 +21,12 @@ config BR2_PACKAGE_LIGHTTPD
 
 if BR2_PACKAGE_LIGHTTPD
 
+config BR2_PACKAGE_LIGHTTPD_BROTLI
+	bool "brotli support"
+	select BR2_PACKAGE_BROTLI
+	help
+	  Enable brotli support for lighttpd mod_deflate.
+
 config BR2_PACKAGE_LIGHTTPD_BZIP2
 	bool "bzip2 support"
 	select BR2_PACKAGE_BZIP2
diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 4f05db4e29..22db1a7348 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -13,7 +13,6 @@ LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf xxhash
 LIGHTTPD_CONF_OPTS = \
-	-Dwith_brotli=false \
 	-Dwith_dbi=false \
 	-Dwith_fam=false \
 	-Dwith_gnutls=false \
@@ -36,6 +35,13 @@ LIGHTTPD_CONF_OPTS = \
 	-Dbuild_static=false \
 	-Dmoduledir=lib/lighttpd
 
+ifeq ($(BR2_PACKAGE_LIGHTTPD_BROTLI),y)
+LIGHTTPD_DEPENDENCIES += brotli
+LIGHTTPD_CONF_OPTS += -Dwith_brotli=true
+else
+LIGHTTPD_CONF_OPTS += -Dwith_brotli=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIGHTTPD_BZIP2),y)
 LIGHTTPD_DEPENDENCIES += bzip2
 LIGHTTPD_CONF_OPTS += -Dwith_bzip=true
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
