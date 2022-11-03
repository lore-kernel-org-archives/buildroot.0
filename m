Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9EFC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C61C5403B7;
	Thu,  3 Nov 2022 18:46:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C61C5403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C582Q_GiZjct; Thu,  3 Nov 2022 18:46:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 52481404C1;
	Thu,  3 Nov 2022 18:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52481404C1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9DA1BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B70CA60FCC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B70CA60FCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZrxgRH-o0ZS for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:45:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 980F26061B
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 980F26061B
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:45:59 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p184so2095305iof.11
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zT52YGhQjNrfAKWODkcyr+loi8J18iIPGCJl/YxH3XY=;
 b=7z6b0ein6qij1uYHUttMrsKhPQTBBUwCbU9J5Xt8FYbpOaB0fHrpcsEP5Tw3c/UiZm
 JjB4jUlZppFswf6agxBeoTShiy7jTOdJVrQX+rOPasyi8JAWRq+oxBqIZEvZXzGZ0Y80
 K4/3CRv6FhpOQJr4JbNjsAo5RLD50CnNA0b34oA7DQ69nK2BDO5C5kX4fameWo6W7ikI
 IQf/4KCyzmNlyyu9WMtv7YjWZhdrgyq6jAgk5eS0NeMUkAyoVP4jLFxccE696nRX8LK1
 UC73Y5kAYN85fL1kolFKTs6mu0VExRQJv9N1yewCICh/V6RGxdKEHVrmxWj3s3R59Iz7
 AgHw==
X-Gm-Message-State: ACrzQf3gu52Yi20tqjfPfmhWuLvuvP+1Qcay+ACyN0sVE01i2nkrnQSo
 uDyqDJYmNNl5RcAzg/Inn7Jzq436CRXIea+x
X-Google-Smtp-Source: AMsMyM4IrdWYc5iA7Ui2S9NEU2XsrmhZHY92/LBOxmK0vIisAQ4cMzkfbXb4/g/Ony8W45SXu1rvmQ==
X-Received: by 2002:a05:6638:1c18:b0:375:4d9a:7ed with SMTP id
 ca24-20020a0566381c1800b003754d9a07edmr16514300jab.163.1667501158433; 
 Thu, 03 Nov 2022 11:45:58 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 c15-20020a023f4f000000b003754d61acc2sm452864jaf.44.2022.11.03.11.45.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:45:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:45:56 -0600
Message-Id: <20221103184556.2132122-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zT52YGhQjNrfAKWODkcyr+loi8J18iIPGCJl/YxH3XY=;
 b=co60zvjM4jVuA2nXNiL/iGA5dac+1l785Fk+NHewzC/pWuG+Pt0jemA15ouPhuFgV9
 vZgNEXd4Mk1+7aYKicRtP6M9vpuTf9KhLuICgWFRwhzWLJTdZVCMtxcX/g7PxgIdhPHx
 bkFK9hptNxUN8ynyFGD5IdshbAckvwX8eEVv07c+pqIEbuywk56FS4SJXaXAyWUVfFqM
 GRIdNbr8R8l1ONCZx8vz9Xwti+k8/NuAagAS0CdVxxMskbB3Rzu7ts1jzCvw2LmN9TUL
 VJDCOgnKVxLbBhbZW9JKP7lZCNAb1rPe1t4sR5fnxLb6bkPCVEYmhAZtaginZZEQnneu
 Kcog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=co60zvjM
Subject: [Buildroot] [PATCH 1/1] package/python-reentry: bump to version
 1.3.3
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
 package/python-reentry/python-reentry.hash | 4 ++--
 package/python-reentry/python-reentry.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-reentry/python-reentry.hash b/package/python-reentry/python-reentry.hash
index 522b936118..1d6ff0e217 100644
--- a/package/python-reentry/python-reentry.hash
+++ b/package/python-reentry/python-reentry.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/reentry/json
-md5  398c1e5bbda657aa645c8d2d38afb63f  reentry-1.3.2.tar.gz
-sha256  c6667e59aeabbb4d122aadc2170102a270e6a811d16a5431c5c3b91fabd7cf02  reentry-1.3.2.tar.gz
+md5  30b57a189bb3c319c0552a2f3105d34d  reentry-1.3.3.tar.gz
+sha256  6343d83245e5047c9f8db0702ec1a7fa8210bd553f0ab643212572f6fce2c3ff  reentry-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  4ae7f3216208a7e2327236e95bcd2397b2495f1c2298c708986c893bea608509  LICENSE
diff --git a/package/python-reentry/python-reentry.mk b/package/python-reentry/python-reentry.mk
index ec33c17452..5808eee4a2 100644
--- a/package/python-reentry/python-reentry.mk
+++ b/package/python-reentry/python-reentry.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REENTRY_VERSION = 1.3.2
+PYTHON_REENTRY_VERSION = 1.3.3
 PYTHON_REENTRY_SOURCE = reentry-$(PYTHON_REENTRY_VERSION).tar.gz
-PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/a0/88/eb0c107c19227a2292ed11711034a3d80c0dc1368d2b3ebeb3fe7b936a8e
+PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/95/20/e820a29014f1cb662423d7001dc09a9ea5280083ea300f0c5efe5cae238b
 PYTHON_REENTRY_SETUP_TYPE = setuptools
 PYTHON_REENTRY_LICENSE = MIT
 PYTHON_REENTRY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
