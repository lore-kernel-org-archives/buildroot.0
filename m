Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFFEC38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 03:11:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B92481774;
	Sat, 29 Oct 2022 03:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B92481774
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5dGH8Fk2eCvH; Sat, 29 Oct 2022 03:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 068EF8176A;
	Sat, 29 Oct 2022 03:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068EF8176A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EB40C1BF982
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE69B41511
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 03:11:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE69B41511
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CwLIyx7ud7q9 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 03:11:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91302410D5
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91302410D5
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 03:11:31 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id ay12so3989343qtb.12
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 20:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S2s/KOrCqWBEUxKFAJN6Olrg4tSyJUJ2EkPE5ef1bRA=;
 b=1aWkJ/BfOsHHOH+vUcjdzX0C8H/8sJsZQr+zC7VTW3O5+Tu+ZiMdt1l2wx0Iu9JOMs
 fM68YWU8tlk7gzIDqxblhs/pCOSwSEeId79BmxBRp5w6RvEvjHx1f+LpVfHLY4Zcp9XB
 mvEZOCDWk4xZnZElqw8t1hJrIrnFa8lNlgg7c9F4fh17w5bPhVd5i5oENeC1XXjhC5ED
 XLKYdQnUC7GvWC6c3FMIlpaAofjD07iOFrLT84Srobt8rRK8GclNPxRiw4vc7qopuY1c
 d20O7mwp3uk69fxIQpCLCmn4gGs/KbixKclvLC2us4bgcC0UgC26pp45BYbngWxMho1r
 CwRw==
X-Gm-Message-State: ACrzQf0sgJ+0NTC0qkOazZGS+sr4aH0pkBrYvy1cjRcLNCWSXvjkYKPC
 MUEEDMRx0WzaEd+Yqz0Cjc82bGEAtwMZng==
X-Google-Smtp-Source: AMsMyM42JlDfV7vxUX2iHCinWP2CfqMQjtePFcfQL6PSlmccqV4Q80/XTjm6xaUbbKn3vpHK5YEHnw==
X-Received: by 2002:a02:9090:0:b0:375:451f:a537 with SMTP id
 x16-20020a029090000000b00375451fa537mr107769jaf.167.1667006826622; 
 Fri, 28 Oct 2022 18:27:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c24-20020a023b18000000b0036377aa5a35sm89624jaa.100.2022.10.28.18.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 18:27:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 19:27:04 -0600
Message-Id: <20221029012704.1399837-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S2s/KOrCqWBEUxKFAJN6Olrg4tSyJUJ2EkPE5ef1bRA=;
 b=cBxuvWx14M/l+OhfjbeAJwtVncX6qJk5oQCuYGJ3hGvQR2xBrQhIIR6w8wcpNkER8Y
 +GWbOKz8lyBX4Vzv3hIWWDYCvRsFMaPFJ7Ts6ej/42kkRB4Z039p3fIeBxa8fJ/tkgyV
 BmJ/qpbYkJaDdPHG3B5YTs1YaqM/OJ7g9gZjZ/X0+/M+DnfpZd+NSfUcoyM/u3zzqV1n
 khjIQYI3TJPKs0+VqOW49I8jWELi55aOj+I5kEPdDmZBAZoCs50lRViyKFRP3uy/flzy
 ZhisbJK0LIWaqDlOvavdH/LRo9Ld7if67xlJtTJGZ4N++1a1/tQydkenZ+YaUKYM79R3
 JLKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=cBxuvWx1
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 3.0.0
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
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 3d50b2872d..32d8a22e66 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  a70f9fc85b6b8265c982eca6fe51381f  charset-normalizer-2.1.1.tar.gz
-sha256  5a3d016c7c547f69d6f81fb0db9449ce888b418b5b9952cc5e6e66843e9dd845  charset-normalizer-2.1.1.tar.gz
+md5  169527085be8e6bb7874164c24481eca  charset-normalizer-3.0.0.tar.gz
+sha256  b27d10ad15740b45fd55f76e6901a4391e6dca3917ef48ecdcf17edf6e00d770  charset-normalizer-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 72728a25b3..b2c42a74b8 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 2.1.1
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.0.0
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/a1/34/44964211e5410b051e4b8d2869c470ae8a68ae274953b1c7de6d98bbcf94
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/fe/77/6d5d367b7cfee812a88573e80bbe25cea2d015ed2c3490e4464951ff3232
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
