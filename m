Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980ABC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 19:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E19F60F4E;
	Wed,  2 Nov 2022 19:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E19F60F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15sv9NhhCbif; Wed,  2 Nov 2022 19:26:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E604660AFC;
	Wed,  2 Nov 2022 19:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E604660AFC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4BBE81BF3E1
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 271E760AFC
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 19:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 271E760AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZKyiSg4TQdx for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 19:26:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB2060AA4
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2DB2060AA4
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 19:26:19 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id n191so15851341iod.13
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 12:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5YHNKKC9wxxL1ueVMLPh/aadaZPFoLOnTYBPp50u0o4=;
 b=nOi44ABa5j0YX/pD5anEn73QtM7If/NTBu9pV2k3Iiil4F58V+d6mpNpWYcyp7p2Wc
 eoPgZ1FNPT14ZTejtsW/k8RGg6cKUo7USOZCQIjdgHcMieSGi+OMK8pJiYenRC1U/8nB
 +uRz4THQ54b5yVNF8R3Nb1t0HLcSLEjPjWDIyXL0J2sZKl8d5ujFWLgubPQrY0e/5Inv
 Cciz6esBcFAL8xBxQ15D3A4E70Llk1EZ+w/+W7KUqWycUYsrSr1a+lXljKBEClfIg/jP
 huPIOfVF2rgw5+zIwtqRvEmpV8GcE1lyXAmEYfkkIbIWeRTA469gtGRJv+/ywaXIfoVP
 i6Sw==
X-Gm-Message-State: ACrzQf3+pBP32kS+rjVG+svyxpirGBH1Q55p10XI3FRKzrpXu6NEQ+R0
 s6/qaLmADWYfe+LAm3WrzXCeUHKGucSNYg==
X-Google-Smtp-Source: AMsMyM7kyjnFJGHZ1UvjYMwQmglrPFW8C6ru/W+Y4GGA4TQ8IEBJgjFlXkU+7zR+HA+OoT5gZlWZYw==
X-Received: by 2002:a05:6638:1a89:b0:374:7b1a:b9f with SMTP id
 ce9-20020a0566381a8900b003747b1a0b9fmr16919199jab.79.1667417177934; 
 Wed, 02 Nov 2022 12:26:17 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 k15-20020a02334f000000b003585ff0233asm5054800jak.150.2022.11.02.12.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 12:26:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 13:26:15 -0600
Message-Id: <20221102192615.3991325-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5YHNKKC9wxxL1ueVMLPh/aadaZPFoLOnTYBPp50u0o4=;
 b=EcapVbqUC7nBZO92GYfozXW4soo7kfTQGkC9CBKcS/WIo6lLg4ufPqNPaGFRiobDVU
 9jkXSMoit5KiJmCLa5nWDN28u2U/WPZeHRiHEPVg5xHQ63gdtN3nMquvBRP6/wqJ6wEz
 Iac/tMXQdb24vnPdETxgUeLFGNeKwUrnFjoDB29Vg/utYom/JnwqXsCG6oWVbGMfBIAM
 ts9RSCrbXBPV8++FF2Jq1IBocsGgqCkQmBzCNNFb1I+Hxg6QyUfXh3QA9oe3mrTbST96
 0xchqUchWeOGwP6Swy7HhmVeowFonK/hedA3R7UFP+RiF+Ba2/gTogwI+MprHOtMuEp2
 ubvA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EcapVbqU
Subject: [Buildroot] [PATCH 1/1] package/python-colorlog: bump to version
 6.7.0
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
Cc: Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-colorlog/python-colorlog.hash | 4 ++--
 package/python-colorlog/python-colorlog.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-colorlog/python-colorlog.hash b/package/python-colorlog/python-colorlog.hash
index f324c1f290..f4d0dd4c0e 100644
--- a/package/python-colorlog/python-colorlog.hash
+++ b/package/python-colorlog/python-colorlog.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/colorlog/json
-md5  f1b92c1cac428b2e3c9ac7edf2988440  colorlog-6.4.1.tar.gz
-sha256  af99440154a01f27c09256760ea3477982bf782721feaa345904e806879df4d8  colorlog-6.4.1.tar.gz
+md5  80b79f7824d39d4f3b11c75d1cba094e  colorlog-6.7.0.tar.gz
+sha256  bd94bd21c1e13fac7bd3153f4bc3a7dc0eb0974b8bc2fdf1a989e474f6e582e5  colorlog-6.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b1d9082bc483623fd59fc7279b457f0e40d942a76426cde257239e04dfe4125a  LICENSE
diff --git a/package/python-colorlog/python-colorlog.mk b/package/python-colorlog/python-colorlog.mk
index 801b30be89..12a1c8ec77 100644
--- a/package/python-colorlog/python-colorlog.mk
+++ b/package/python-colorlog/python-colorlog.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_COLORLOG_VERSION = 6.4.1
+PYTHON_COLORLOG_VERSION = 6.7.0
 PYTHON_COLORLOG_SOURCE = colorlog-$(PYTHON_COLORLOG_VERSION).tar.gz
-PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/d6/4a/840f6cb7e922a717c765a3cdc6988aff22a6ef211d88c8d16701dfbd664f
+PYTHON_COLORLOG_SITE = https://files.pythonhosted.org/packages/78/6b/4e5481ddcdb9c255b2715f54c863629f1543e97bc8c309d1c5c131ad14f2
 PYTHON_COLORLOG_SETUP_TYPE = setuptools
 PYTHON_COLORLOG_LICENSE = MIT
 PYTHON_COLORLOG_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
