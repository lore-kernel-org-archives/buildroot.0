Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C62C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 18:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B97086086B;
	Sun, 11 Feb 2024 18:36:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kej633NtrtXK; Sun, 11 Feb 2024 18:36:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BAA60866
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22BAA60866;
	Sun, 11 Feb 2024 18:36:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0D6AD1BF349
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 18:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0881460866
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 18:36:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qqEyYaM_R1sA for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 18:36:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 941CA60859
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 941CA60859
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 941CA60859
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 18:36:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-410cb9315f6so2456865e9.2
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 10:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707676594; x=1708281394;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KS/umF6cHmV0UIuxL5vFxOVT82E7G1XsizIhRy8CWM8=;
 b=WQFvj8WvvsRjHXeRXXWsMpdRhdXeOjW51ICJB/zuk5AwLdtvliz+GEaRHfIupjjsqs
 Eu1OmrgWDm4BmBXEE2DTohaaYcCBg6tON8ByjlEKxKZ3fEbkKF/KfgF4jVAK8E9BPxI8
 lR+0v8z5wKL+GLIKqBUoMOKpcO+qkZFMYh9ilcWeJTkZgMSH6FtPjfS741F2ioOMX+PZ
 +WCo1PCaGWUyT1HxEQFN1HF4+wVPfwR6D9rO2Yn7YE1aFzy6qAKta7j5bRg3MLm077n5
 n4AfYbR9dJFmZ3EFW1rIu0NB94tL1ksSYqN2nAKMkdpSIu6UsPGOPtC07lM7JIzvJlGJ
 8d7g==
X-Gm-Message-State: AOJu0Ywx7w78pwsgNxAEl5Dmsq7/melbI7s2uJL58oqui2R6ruNPPMAZ
 8a6IOkmfkw5Qb1RgANy7W/cHzdUxtEJBoJh5ocMrtWOG8sSj7fMN3M3Kvyqj4S4=
X-Google-Smtp-Source: AGHT+IFdMk3a8mJ5P16pM1OFStbUlMuQuSVddB7sP3nrYWZtF7PibbU0ACVyokEhLj14OkT4yZzTpg==
X-Received: by 2002:adf:fd08:0:b0:33b:3b3:f486 with SMTP id
 e8-20020adffd08000000b0033b03b3f486mr3371760wrr.35.1707676594331; 
 Sun, 11 Feb 2024 10:36:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWkhpe1VV09xwRq1XWwxH38tWf3poIlKziiOOLQehOYOmYqc9cP1GANQo8I/DN2sUaNAX0JsXehpwiO6dGbnvUwt6zNioGLrdoH6A==
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bk26-20020a0560001d9a00b0033b1277e95dsm4862680wrb.77.2024.02.11.10.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 10:36:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 19:36:31 +0100
Message-ID: <20240211183631.1162846-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707676594; x=1708281394; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KS/umF6cHmV0UIuxL5vFxOVT82E7G1XsizIhRy8CWM8=;
 b=i/lg773nVNodFc1fO0ZGT5zpN4DnV9sxYFh1LtyRt75KTUVrl7La0oTjWP11BG5NrR
 a6QgALHEE1tO1gsyZ4b09dTq5MYosC4Ofw7MxDCR6un45pAv1nFRwWbdarWSx14j+6S9
 01enbEelBni00a1mSktbZeAm7al8guJD7dQYwkJWCcjVIQPYUt9NDfNP3wb+K5Rv0GP1
 MsGrgkmZB3tkWHk115i1p9eJGd15cu4RX3rrpJ8WNONMqkdX3LPgVH0Da6+dOkZ/kFKT
 QdCApjOakCP6eOThpjevlg0hBqmhrLrhxJjB3a712KaPD5BOw3HEplLgJ6saD+18rG7L
 ZpEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=i/lg773n
Subject: [Buildroot] [PATCH 1/1] package/opencv3: replace
 PKG_PYTHON_DISTUTILS_ENV
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace PKG_PYTHON_DISTUTILS_ENV by PKG_PYTHON_SETUPTOOLS_ENV
to avoid an issue with naming of python modules since commit
09de823cbc7bd50a40e25f4166b4e42be94b0c7b

Fixes: 09de823cbc7bd50a40e25f4166b4e42be94b0c7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 29fb246e65..5064496ca6 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -341,7 +341,7 @@ OPENCV3_CONF_OPTS += \
 	-DPYTHON3_NUMPY_VERSION=$(PYTHON_NUMPY_VERSION)
 OPENCV3_DEPENDENCIES += python3
 OPENCV3_KEEP_PY_FILES += usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/cv2/config*.py
-OPENCV3_CONF_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
+OPENCV3_CONF_ENV += $(PKG_PYTHON_SETUPTOOLS_ENV)
 OPENCV3_DEPENDENCIES += python-numpy
 else
 OPENCV3_CONF_OPTS += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
