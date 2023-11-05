Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED79C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8576260E02;
	Sun,  5 Nov 2023 02:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8576260E02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRvhy0DdJGhg; Sun,  5 Nov 2023 02:18:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D495160DF9;
	Sun,  5 Nov 2023 02:18:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D495160DF9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA2801BF59E
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1254821F7
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:18:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1254821F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EqxODotG6r2T for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:18:17 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA06F821E0
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:18:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA06F821E0
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7a66aa8ebb7so137097439f.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699150696; x=1699755496;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dqAaO/1HUfnRTHpsZHqh4noEIccP+df+GB/LywfagI0=;
 b=LVbWLODj3UWdIEunjF717qfcppa3dwqagvWxNR48iAUeFCGuaXSZ7QEzG9S07w17Ka
 LLD82juDzV+edBrAro6kn2hI4MagfOMa1PeAEuB2pCkjHVIBg35hiH6z7LqFRNYejzqB
 jBju4WAtvaSH+pl5b5SJvDQ5lFfivlu9XdYj2fPYEJGvmFUY4DUcO98ophzzGAC7fvvv
 Fs+ADg9Mvuc18LFIqHjkJ2wQrTaevhLhkLfsjuvd0w7hzZ9+YJK2IAkRtKJWWJqtoXah
 vjshyKED5le602xysoNy+GV8RT6/PJ/JI+drAOGyzysSaKPNpSbFHScsA1XG4qjqjyNB
 lBkg==
X-Gm-Message-State: AOJu0YwZ/Pc+DKQR8+aCpQze9XDnuWmgqA0k5Y/4oAFLpv2VgQph4AJP
 v0H+QExGv593JuWb9MGdLYcZxr0RAnM=
X-Google-Smtp-Source: AGHT+IGuzt7WmtF3HqM6p4TtdDlKB7KTLpAzMiQTF0KszFj1EIr1vOV1tQ3Y3wjy59L0J8q9chQDww==
X-Received: by 2002:a05:6602:1607:b0:7a9:afab:b984 with SMTP id
 x7-20020a056602160700b007a9afabb984mr31128598iow.17.1699150696295; 
 Sat, 04 Nov 2023 19:18:16 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 s13-20020a02cf2d000000b004300eca209csm1305086jar.112.2023.11.04.19.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:18:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:18:14 -0600
Message-Id: <20231105021814.2748949-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699150696; x=1699755496; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dqAaO/1HUfnRTHpsZHqh4noEIccP+df+GB/LywfagI0=;
 b=fTbHBtfg+DE79lzBLuh3KtHi5CE/J6F0FFXt8A7M073AIh8AlE1DbhWsH9BK5qVu2A
 7ERfsbXrh2Imzmhrsfz3OL3HryIluGr0y13EgowZz42SYak7Y+6QZtqAKXMEWoq+JP8I
 LmNZJVQnIPfy6vGjJR9nGEUuZvjIMQQ5eBgUhWSV4qshWLHnhIIpWwKhANGYlVX04GAI
 MDwNZww1EPNHyQ7aGWIpyEGS++kS0a93/x/Zh7qpQZRJsG+uNJKlXcU1asQ9Y/25UEh8
 YSApGuk1AavKiiRSTz4fOZQCQARw/7pvhUCQJjMtC+mWEhrzw0BBCmZDLLstWgUNU/84
 EJTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fTbHBtfg
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.31.78
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 1f5e5c0d3b..adf6232b24 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  efadef54dc1959898a42d4cae949572f  botocore-1.31.20.tar.gz
-sha256  485ef175cd011ebc965f4577d8cc02a226c46bd608dd2bb75ce6938328cff0fd  botocore-1.31.20.tar.gz
+md5  ee4f82382518e3af25b4ccfab38587d1  botocore-1.31.78.tar.gz
+sha256  320c70bc412157813c2cf60217a592b4b345f8e97e4bf3b1ce49b6be69ed8965  botocore-1.31.78.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index b76d1c64d7..850fb79aa1 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.31.20
+PYTHON_BOTOCORE_VERSION = 1.31.78
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/f9/0d/ec24cb66b7651268462d5eb5d9d3c140a99f487db3ed58a45617991b11e8
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/84/a9/9c2752aa24c050323c37a9d2af6dec348889825b51db07fb7f1bb792e307
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
