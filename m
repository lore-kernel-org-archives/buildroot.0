Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751BBC43217
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0997F812E1;
	Thu,  3 Nov 2022 14:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0997F812E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IyrjgmS5p7_f; Thu,  3 Nov 2022 14:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3549E812B8;
	Thu,  3 Nov 2022 14:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3549E812B8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9500A1BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6EE8E41756
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:19:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6EE8E41756
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FCVwh8Fsxk0U for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:19:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43D27416D7
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43D27416D7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:19:52 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p184so1406394iof.11
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:19:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T/x8FlR3D7PFS/R3qm5s2WtXYS4nokLV3g1H0XX2Ezw=;
 b=4RYLM8KLvo99CdbUaMZQOUg/wEsFNGAsDuqHlDyOkl6wHUPCJCBrkVcvg56rlSal1U
 yYuyBx/KEZUfFLQFrGr29JDg1REAbe0UDrc1pWyUyF+thEMf83U0qV0keYGh6KhmpfH7
 iKK5HyoJldqYMNGaeaXeEHxZTf6pBM8Y2WMs7I/ymC0oe3KUziv12JEU+f056tcpUPJ1
 9lfYLgl6cMuru4sbAaMksrH1O5v1faO6siY/N16GrnYRmxqgOYLyzdDP1EUfqLUqkXDM
 eCluA4qYaJfdi2LEwmUbW9ZpThU+3wBChD7UEIlBo1/rSQWHZAsg6twF0Pd61wg2knic
 XNCA==
X-Gm-Message-State: ACrzQf2OSL0NAoZn0rPR80mrxY8uirHw6Ogft05ONG76m5j8XYOJhBeP
 KFIO8ukZm/lfuQ9SnKnFiU5bGTOqvWLx32NK
X-Google-Smtp-Source: AMsMyM6TYk2Xw8IDKC8wUfnE08u9Ph6U8wAPvGalae3kTyxbF0bxxa3hazpAVl/bxm8/l/rPHurdWw==
X-Received: by 2002:a05:6602:2c4b:b0:6bc:ab20:2c28 with SMTP id
 x11-20020a0566022c4b00b006bcab202c28mr19767462iov.70.1667485191002; 
 Thu, 03 Nov 2022 07:19:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 j20-20020a056e020ef400b002f6699c86eesm351940ilk.68.2022.11.03.07.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:19:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:19:49 -0600
Message-Id: <20221103141949.875644-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T/x8FlR3D7PFS/R3qm5s2WtXYS4nokLV3g1H0XX2Ezw=;
 b=C/WWCs4TLvUII8/yJWMhypGBW6Ubd0m3rc/TJVyt2c68p3EebxmshY6+FKYj73abjv
 PL0kvP+DtQBJnZUHdyuPBCa+Rdxxh68Qwd9C6qM6iTpYOBmJwkT3RMshDkn7GvX8CH69
 IY9pt8nz1dLwUJHGU1b5/6jausGZ0PDkfZYrevHzvGnUJIQO3llYQRdQxW/aMXHBHVuA
 vv/UdyzHACdsLdVqf/zhA83jW+bIT4t+IiGH5wrar5yXQ7rLahc7W0M6K9PkMtd+1Bqu
 40T1lHq+jx8HcbUwK/S4U6q7hZedFDV47+QI3Ik3I+bDUIAtB5n7jAPqN93GarFQ/wtf
 GuRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=C/WWCs4T
Subject: [Buildroot] [PATCH 1/1] package/python-pyhamcrest: bump to version
 2.0.4
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
 package/python-pyhamcrest/python-pyhamcrest.hash | 4 ++--
 package/python-pyhamcrest/python-pyhamcrest.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyhamcrest/python-pyhamcrest.hash b/package/python-pyhamcrest/python-pyhamcrest.hash
index b2e84d7d1f..176079e0f5 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.hash
+++ b/package/python-pyhamcrest/python-pyhamcrest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyhamcrest/json
-md5  7a086f0b067f8d38958ec32f054559b4  PyHamcrest-2.0.2.tar.gz
-sha256  412e00137858f04bde0729913874a48485665f2d36fe9ee449f26be864af9316  PyHamcrest-2.0.2.tar.gz
+md5  c808291b2fca0991d044927884e6d15e  pyhamcrest-2.0.4.tar.gz
+sha256  b5d9ce6b977696286cf232ce2adf8969b4d0b045975b0936ac9005e84e67e9c1  pyhamcrest-2.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  71beae6c8151362cfe398cbd350191a1cc52d3d28499839a7830b25f5b50a7fe  LICENSE.txt
diff --git a/package/python-pyhamcrest/python-pyhamcrest.mk b/package/python-pyhamcrest/python-pyhamcrest.mk
index 28979600dd..de5295e964 100644
--- a/package/python-pyhamcrest/python-pyhamcrest.mk
+++ b/package/python-pyhamcrest/python-pyhamcrest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYHAMCREST_VERSION = 2.0.2
-PYTHON_PYHAMCREST_SOURCE = PyHamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
-PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/58/05/7b993fabb44ff0b52a90916d96bfd91a65ecf90b8248e72bba325ba8e438
+PYTHON_PYHAMCREST_VERSION = 2.0.4
+PYTHON_PYHAMCREST_SOURCE = pyhamcrest-$(PYTHON_PYHAMCREST_VERSION).tar.gz
+PYTHON_PYHAMCREST_SITE = https://files.pythonhosted.org/packages/b1/9a/588f086b64ace8d2e9843d8551e9068b2570c3c51b06cb49a107303f8700
 PYTHON_PYHAMCREST_SETUP_TYPE = setuptools
 PYTHON_PYHAMCREST_LICENSE = BSD-3-Clause
 PYTHON_PYHAMCREST_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
