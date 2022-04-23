Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AFC1C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 15:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61DE5824B4;
	Sat, 23 Apr 2022 15:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCNliiul5Sor; Sat, 23 Apr 2022 15:35:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BA1B82470;
	Sat, 23 Apr 2022 15:35:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 883221BF421
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75B9C404A3
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 15:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7WNBIuV5m7LB for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 15:35:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8720E405D3
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 15:35:13 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso7015296wml.5
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GlACmwfJCUSMrkZAf0hDOsMPNR+3tI+CWzONviUoyEQ=;
 b=WxICtfduxHg6utJhzoXrHV+oYj8TMyfzaNFmXEiey6s9XPX0omNaUZWkZp3b5W/Fp2
 1RlIaQmmXgDUsBY2655E1KKWc9qYp2hTpZxFF2VBgXAkXFTS76iw/Jn5NvSBKin7yaZ2
 00CPVQ/IXvzdLu4F76upnsc3tLp6vVlPGXx3fSCC6NRUwh+lcdV9oAdSskVFrI7DLvkC
 X3DTtc8ZHNK7lt3EN/AXXsPHOUkoYMe+VNQE/sc4r0H5oqHpAyOMZjrpj+n0vIww8BeB
 54z76Trpp6on/YwJ1w2k+eMBwqbzzFM8TljN1nVzG1BaW4u/pop0Lb4629v3ylGzoHgx
 oDhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GlACmwfJCUSMrkZAf0hDOsMPNR+3tI+CWzONviUoyEQ=;
 b=PtwYM5oxMiNiGgY1BGzUERdY5HwPEnvzuceGbYgqeF8n+RY+F73mKx0wsDVhz9nAJu
 /K9wxmetIcR6QswVkYhj+kvZjnhRz+CimPI+81h90nAhNSYFtSfiCYsGS8m9SefmPhKG
 gyFy0A7dRfA3jdsYptnxP02+M4OnAxNPbBlEGVIDixil718Lm2VYAirSFG4wNQwwZGEO
 NvnQyLROmVNkVTKNW7KodgyjNp//UQh/ku49uZIC9qwHWaECwnspqStx3idUeZF0Kt65
 6ww5UUdFRsmTTd4tEGWORc6oFq14QZ1v4lpIsIMWNvnaU7k/ST3k0uJSk2eH8sZPR+Rt
 1v2Q==
X-Gm-Message-State: AOAM531nFOjk9Bwd/KAIytwjSgpyBN7SHzO7aB6FhryxpDpvNY/H00b8
 +/WW7mHGNldYLYNoWSMrdY7lTI9RQYM=
X-Google-Smtp-Source: ABdhPJxnELzJHhj69FMnoXNfYJ0LFSk2pggwPigJkZSNJIZBmLfzX1Dzk3c4hZRHD955/PXyfwzMMg==
X-Received: by 2002:a05:600c:4e11:b0:392:c326:bb7 with SMTP id
 b17-20020a05600c4e1100b00392c3260bb7mr11899833wmq.156.1650728111220; 
 Sat, 23 Apr 2022 08:35:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600002cb00b0020a88c4ecb5sm5310384wry.3.2022.04.23.08.35.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 08:35:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 17:33:10 +0200
Message-Id: <20220423153310.2443908-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/netatalk: fix build with libressl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl >= 2.7.0:

In file included from uams_dhx_passwd.c:35:
openssl_compat.h:15:19: error: static declaration of 'DH_set0_pqg' follows non-static declaration
   15 | inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
      |                   ^~~~~~~~~~~
In file included from uams_dhx_passwd.c:33:
/home/autobuild/autobuild/instance-2/output-1/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/openssl/dh.h:195:5: note: previous declaration of 'DH_set0_pqg' was here
  195 | int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
      |     ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/fc6e308f346570f8198542602bc8c1bdd0a4869e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ..._compat.h-fix-build-with-libressl-2..patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch

diff --git a/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch b/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
new file mode 100644
index 0000000000..05913862f6
--- /dev/null
+++ b/package/netatalk/0002-etc-uams-openssl_compat.h-fix-build-with-libressl-2..patch
@@ -0,0 +1,43 @@
+From 58ddc137021a938f37c3794305a839f8df449d3f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 5 Apr 2022 23:59:15 +0200
+Subject: [PATCH] etc/uams/openssl_compat.h: fix build with libressl >= 2.7.0
+
+Fix the following build failure with libressl >= 2.7.0 which added
+DH_set0_pqg with
+https://github.com/libressl-portable/openbsd/commit/848e2a019c796b685fc8c5848283b86e48fbe0bf:
+
+In file included from uams_dhx_passwd.c:35:
+openssl_compat.h:15:19: error: static declaration of 'DH_set0_pqg' follows non-static declaration
+   15 | inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
+      |                   ^~~~~~~~~~~
+In file included from uams_dhx_passwd.c:33:
+/home/autobuild/autobuild/instance-2/output-1/host/mips64-buildroot-linux-uclibc/sysroot/usr/include/openssl/dh.h:195:5: note: previous declaration of 'DH_set0_pqg' was here
+  195 | int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g);
+      |     ^~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/fc6e308f346570f8198542602bc8c1bdd0a4869e
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ etc/uams/openssl_compat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/etc/uams/openssl_compat.h b/etc/uams/openssl_compat.h
+index ded377bc..5cc8de34 100644
+--- a/etc/uams/openssl_compat.h
++++ b/etc/uams/openssl_compat.h
+@@ -11,7 +11,7 @@ http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt
+ #ifndef OPENSSL_COMPAT_H
+ #define OPENSSL_COMPAT_H
+ 
+-#if OPENSSL_VERSION_NUMBER < 0x10100000L || defined(LIBRESSL_VERSION_NUMBER)
++#if OPENSSL_VERSION_NUMBER < 0x10100000L || (defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x2070000L)
+ inline static int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
+ {
+    /* If the fields p and g in d are NULL, the corresponding input
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
