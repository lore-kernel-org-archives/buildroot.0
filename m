Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997B8C0015E
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 359B381749;
	Tue, 25 Jul 2023 13:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 359B381749
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jzqtk6NTHPS9; Tue, 25 Jul 2023 13:49:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6045581656;
	Tue, 25 Jul 2023 13:49:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6045581656
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D59E1BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 072CD60AD5
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:49:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 072CD60AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lO6TAVYoTyQh for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:49:52 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 20BF860FA2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:49:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20BF860FA2
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-78847bb8940so285536239f.0
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690292991; x=1690897791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8UaJ0M6YFd7LB5kuU9gXgpifhP7ZQ5KBLAtMZdvP20Q=;
 b=dem1wfSmGIzMg5P4II8GBawRc7DchHJM87RpD4Ewmv3smSXUNONPjIpQbihshhLPVu
 PKVCXEb4zJchkTP12ds8KURIw9RTwwj214YHJrAj2dZZsPy3SbID5072En/+X47SIGh2
 lE1f1tgwuJgjkZ3MZnQu16ii3KyA+Wjd9lA8OLDBVWgTVe22uBAJR/BjNwd3hOHs1AgS
 1l00iC/1YGedLVNjFZ001xiL13a4LpF4yzV+9vSzvyC5J8Y1iqKMd1ZgUGET1gO7FB0E
 KgZqPGZ2XD8+5lemyxctPgJvsBfpctoigJV//LU+PHKZb9J9kTBGlbuJ2TP4eCwH8I85
 CqFg==
X-Gm-Message-State: ABy/qLbj7kGVS6Voqyy/savBpNlx6JALOoGXn6OEpcLiVB9YunRzGnf9
 QVfL+TL3up/KDOeMonBh29cnh7rCxFU=
X-Google-Smtp-Source: APBJJlHa8TdaMMWmCAiwoPfhSWf9lsYQ08fZJjd7hofOWMqTBXEfIDYJrS0sMDNoXAl2Lm1NCoG74g==
X-Received: by 2002:a05:6e02:12e2:b0:345:ed70:9a86 with SMTP id
 l2-20020a056e0212e200b00345ed709a86mr3422494iln.24.1690292990878; 
 Tue, 25 Jul 2023 06:49:50 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-134.hlrn.qwest.net.
 [71.33.156.134]) by smtp.gmail.com with ESMTPSA id
 q11-20020a056e02078b00b0032afe23820bsm3688794ils.17.2023.07.25.06.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:49:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 07:49:48 -0600
Message-Id: <20230725134948.281769-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690292991; x=1690897791;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8UaJ0M6YFd7LB5kuU9gXgpifhP7ZQ5KBLAtMZdvP20Q=;
 b=hb1HSbWb6D7N2NlriLJT/cCgRQmVCYIuEOWuDNjWnuljIPoGBRLHyyTNdKdXg9bl3C
 JeJONUxEO9oB3Oy0km+TprrEhRQ+aDR4KbV22/tL6LzGf4jpwNfX8FQU3xYv8kqfnzKf
 PdaaqN1gpFMvEdXV/+O8pYmrCIDL7hwQE95WTsTL1bp9jiTf+5VRm7q/LBCeA5VZbGjn
 fyZmVdB0A+iDI+hxae59fcxRuqjXdCiQKoYpfdLK0P64EpsoCv/ncZFRDHh5rUU9cn/m
 u97QLFpedTl+41Xe7aoQhkMz6smMA2q0ceNMGQw43zd/vhQWEBGsvQ67fEiz8gp+fsRH
 4Xfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=hb1HSbWb
Subject: [Buildroot] [PATCH 1/1] package/python-msgpack: bump to version
 1.0.5
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
Cc: "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-msgpack/python-msgpack.hash | 4 ++--
 package/python-msgpack/python-msgpack.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgpack/python-msgpack.hash b/package/python-msgpack/python-msgpack.hash
index 4d0f510883..9a2ec9c9f3 100644
--- a/package/python-msgpack/python-msgpack.hash
+++ b/package/python-msgpack/python-msgpack.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgpack/json
-md5  1822cdb939e7531f7ad0f7f09b434f22  msgpack-1.0.4.tar.gz
-sha256  f5d869c18f030202eb412f08b28d2afeea553d6613aee89e200d7aca7ef01f5f  msgpack-1.0.4.tar.gz
+md5  da12a9f0a65a803ec005219f6095d0a3  msgpack-1.0.5.tar.gz
+sha256  c075544284eadc5cddc70f4757331d99dcbc16b2bbd4849d15f8aae4cf36d31c  msgpack-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  492dedba85da5872f78e6091bcd1fea474d660d35acb4dee964b8aab3f007427  COPYING
diff --git a/package/python-msgpack/python-msgpack.mk b/package/python-msgpack/python-msgpack.mk
index d9304e4def..785fec9f00 100644
--- a/package/python-msgpack/python-msgpack.mk
+++ b/package/python-msgpack/python-msgpack.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGPACK_VERSION = 1.0.4
+PYTHON_MSGPACK_VERSION = 1.0.5
 PYTHON_MSGPACK_SOURCE = msgpack-$(PYTHON_MSGPACK_VERSION).tar.gz
-PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/22/44/0829b19ac243211d1d2bd759999aa92196c546518b0be91de9cacc98122a
+PYTHON_MSGPACK_SITE = https://files.pythonhosted.org/packages/dc/a1/eba11a0d4b764bc62966a565b470f8c6f38242723ba3057e9b5098678c30
 PYTHON_MSGPACK_LICENSE = Apache-2.0
 PYTHON_MSGPACK_LICENSE_FILES = COPYING
 PYTHON_MSGPACK_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
