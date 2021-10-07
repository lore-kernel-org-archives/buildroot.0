Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5662C433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 18:11:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2052B61039
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 18:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2052B61039
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BAC7440480;
	Thu,  7 Oct 2021 18:11:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9V0Qyss_r84r; Thu,  7 Oct 2021 18:11:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2F8440489;
	Thu,  7 Oct 2021 18:11:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA88C1BF870
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 18:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3F9B40A5E
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 18:11:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sShMsaMWE6DX for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 18:11:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AE8E40A5C
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 18:11:51 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id l20so7349705ilk.2
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 11:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5U4wNiW2J3xOASaMAon/PO+YWMLFUACamSYndTgeg28=;
 b=C91Oh6vnZdWVagWlczurxXiuAYMsOrZI6/Hs/j2TKAI5Uda9ixmu3vPUjzWL1N7sZw
 K8tVCvISQ7Z5QJpSWFztFf843Sfga2TYoyGUxK7BwR+9R/zIxruqJNlo4/hlDeW5Ez9J
 YMGWnOWz9N6ZLFOumDOb72UUPV1s8wHCupZ8lcK75O9goUVIRNoqh6S7Ufb364RL2+Df
 u829Vfb2ncDEinTFJS+8gNrdllw9NtQKFWV6D5rd+e2y5BG7r5w91mqg/o1YNgTFIf4h
 PifuqxPuR/j6Yk3kkZfIhE82yzMzuyocXBcu7XiktRSWczrymfaGIqgV5ONyVVS0U57d
 fTgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5U4wNiW2J3xOASaMAon/PO+YWMLFUACamSYndTgeg28=;
 b=I7t509x981AjjeeaAcEkbK77ICyRiX6sWyIqMqdLFJQ/fmrXDuvlFwEem74TXYmokx
 dcbSFyvTyDHXYH1SfwGBKpITWRyzERSG9q+mQya9UzycvHQF7QXiy0KSoFAqWX+EFay/
 EjHEQFEiXAtP1/gek7RDWpum0B04DAS2CvU6F5Hw0DedLfNqVLdD7KAOQoHjRFrkRyEf
 kmExdU/d90v6pp1WBxOd07EeTBZQvfHzW0XFORaRMIDEMt2hsjCCzi+EGEgK6s/BVtbV
 82Qs2484iM88gB4fTUWy0RZ3n0ZElTO5TYR92Q0wW0RcEs0/5vYO5YpoWoAT2fTLEIPi
 HmKA==
X-Gm-Message-State: AOAM530yaNRsVxequ0KYX0C5qDZ+Juq8HGLXcDfSMYPvBwMuRz81AT6c
 3UuYCD//jafAFnG1ZgcVraVHTTBEfP8=
X-Google-Smtp-Source: ABdhPJxV65dE2r4aq7K9gB2dJ02h2MqavtCKdxPZw4LEHbZXpPRrGsgahSZFZt0/dJ41vOxqqfWXYQ==
X-Received: by 2002:a05:6e02:1e03:: with SMTP id
 g3mr4382461ila.127.1633630309945; 
 Thu, 07 Oct 2021 11:11:49 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id z26sm15990ioe.9.2021.10.07.11.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 11:11:49 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 12:11:48 -0600
Message-Id: <20211007181148.3238157-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-u-msgpack: bump to version
 2.7.1
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to date update:
https://github.com/vsergeev/u-msgpack-python/commit/8599cae6bc970effe069e3ed955af1c64dab9106

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-u-msgpack/python-u-msgpack.hash | 8 ++++----
 package/python-u-msgpack/python-u-msgpack.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-u-msgpack/python-u-msgpack.hash b/package/python-u-msgpack/python-u-msgpack.hash
index 70c67c7283..0891783985 100644
--- a/package/python-u-msgpack/python-u-msgpack.hash
+++ b/package/python-u-msgpack/python-u-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/u-msgpack-python/json
-md5	bbeedd924f3d8c8ee90611914b3594e6  u-msgpack-python-2.5.2.tar.gz
-sha256	09c85a8af77376034396681e76bf30c249a4fd8e5ebb239f8a468d3655f210d0  u-msgpack-python-2.5.2.tar.gz
-# Locally computed sha256
-sha256	0603a3e697a80b13640e3023bb534727f683ada5c4b0b0149d001ec5272d64f4  LICENSE
+md5  8691cea6bc7b44bce6e2115260a54323  u-msgpack-python-2.7.1.tar.gz
+sha256  b7e7d433cab77171a4c752875d91836f3040306bab5063fb6dbe11f64ea69551  u-msgpack-python-2.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  268ae7b7efbf67cd7bc0a9efea844fcf448d03f9cc6b8c79e8fe311815985030  LICENSE
diff --git a/package/python-u-msgpack/python-u-msgpack.mk b/package/python-u-msgpack/python-u-msgpack.mk
index 6d98e55221..e0a3b3f297 100644
--- a/package/python-u-msgpack/python-u-msgpack.mk
+++ b/package/python-u-msgpack/python-u-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_U_MSGPACK_VERSION = 2.5.2
+PYTHON_U_MSGPACK_VERSION = 2.7.1
 PYTHON_U_MSGPACK_SOURCE = u-msgpack-python-$(PYTHON_U_MSGPACK_VERSION).tar.gz
-PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/75/c4/d9404382d0f7d9be27b5d13498d033a4faa83f325b3893e1c29a0faa83b9
+PYTHON_U_MSGPACK_SITE = https://files.pythonhosted.org/packages/62/94/a4f485b628310534d377b3e7cb6f85b8066dc823dbff0e4421fb4227fb7e
 PYTHON_U_MSGPACK_SETUP_TYPE = setuptools
 PYTHON_U_MSGPACK_LICENSE = MIT
 PYTHON_U_MSGPACK_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
