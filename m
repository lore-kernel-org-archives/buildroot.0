Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F5AC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 01:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB67060BF0;
	Fri, 23 Sep 2022 01:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB67060BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8T3LqjzY44H; Fri, 23 Sep 2022 01:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DFD860BD6;
	Fri, 23 Sep 2022 01:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DFD860BD6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21FE81BF37E
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDC7982CB7
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 01:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDC7982CB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJH8V-CYJo6e for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 01:19:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 099B382C7C
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 099B382C7C
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 01:19:55 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id j188so14703896oih.0
 for <buildroot@buildroot.org>; Thu, 22 Sep 2022 18:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=aZ9lrUtg8Ap7pYF9IMtM5kESfbzCzohEBIDmReJh008=;
 b=RoiUuV05WKneyr+IaZ4UpQtsmO08ImhezR4IWmKNrX1GELpTFMjY4LxfBXdQxEb4Zo
 yn6TFn+BrjhZmYJKaD5FgYSefEFEbD2Q+SuharKPWXYU1B2bNdF4LlUubMXUpl51sI5n
 PxmQ/rJ6sK9EHlH9TpA+0yjjbKq7RdAK+Re13xygE/9aQlrs7/+dbyhq2CKpcmRh3s5A
 wCxMzH/JuwDtI1Muc5IavxSrUW5aRPA2FvznRA/8IMg609M7MY3szj0HISmpbELsBMpC
 0SFqA0ZhfkvATCV25N+WmTeCdAkjJc8d975uXzEWPhubIqsMlCQXK9y3VnKXcSwsOqMz
 +iaQ==
X-Gm-Message-State: ACrzQf3N13ymaN6c0oAcXD1ar0qhii88W1R5L2BhHhvzNAnetTyMLDKy
 y78XjWkJiF3Z7RaRBy+7LYLKK0tpNkakpg==
X-Google-Smtp-Source: AMsMyM6ZaF/nZhOj5oZQziK3a1bK5fDBvTLMfVdaQZYq44MVcF1UxfdAaEyCK3soV89dUDA4lzyKGA==
X-Received: by 2002:aca:1912:0:b0:350:504b:ee13 with SMTP id
 l18-20020aca1912000000b00350504bee13mr7719154oii.256.1663895994785; 
 Thu, 22 Sep 2022 18:19:54 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i8-20020a056808030800b00350f17527fesm2174791oie.28.2022.09.22.18.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 18:19:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Sep 2022 19:19:51 -0600
Message-Id: <20220923011951.2220067-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=aZ9lrUtg8Ap7pYF9IMtM5kESfbzCzohEBIDmReJh008=;
 b=iVtnnbXcgL1brpMJ66hJRcacAW18h67RvgTPIYQtpFrHH0bD2fYUXLNxbM9sJwhA2v
 9arOB1nK3PXkJb4yTRtP3NohKEFOaEkqNIXAQG+sKPBFJ7xiQiPwxqQzJyJFzCXTA4eq
 ZZ+mwjfB2wFz1G5jmLvEjk8SRlpHlcigfQtwYAW2SGrJRb/zbchXp/cz7zjMU2hBi2v6
 pqYMPbfxjQpyxk4QeJqCTg3a6/v5iGXQPuccYwNDn4Tc8LefwYW8ogr1Gx1+tN2DTr5g
 B3naXNetHfsefdkgdfJdg2+qIu3T5Uk05QPSUVExI8bMe5z+/cwrKc5m7C11IXgDtd3d
 oEaw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iVtnnbXc
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.37.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 4f6536dbfb..58603f79a4 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  5eb0df388216de4bfd058153d16c75bf  fonttools-4.36.0.zip
-sha256  e637d2fe06bddabbfc488e02ef32d04d561e3c71e9ba11abc7782ea753ceb218  fonttools-4.36.0.zip
+md5  6cad81799e0491751cda0a98642b00eb  fonttools-4.37.3.zip
+sha256  f32ef6ec966cf0e7d2aa88601fed2e3a8f2851c26b5db2c80ccc8f82bee4eedc  fonttools-4.37.3.zip
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index 6281359e86..aad1765899 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.36.0
+PYTHON_FONTTOOLS_VERSION = 4.37.3
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).zip
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/df/4b/ca51dbaf267decfcc7ca9300cdc703206c1c05f3e2beb5140a71817c2d7e
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/c1/0d/d41b9c2295e1896f4c89e6b213790eee8e8e641b3e9709518f2bddcdeffa
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
