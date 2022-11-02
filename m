Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB8BC433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFA1E408D2;
	Wed,  2 Nov 2022 20:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFA1E408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4omezFXFpCuP; Wed,  2 Nov 2022 20:15:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F0337408E3;
	Wed,  2 Nov 2022 20:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0337408E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2C81BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4855981E6E
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:15:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4855981E6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrX1UICDGrM0 for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:15:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E6CD81E6C
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E6CD81E6C
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:15:09 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id z3so15990421iof.3
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:15:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yC37USfrJHXx1i6RDRxnIpE4euWEYZ66z+xJfTe3yfk=;
 b=gvjDujygSojZeAlzTD8uVvGt1zipLYKsFXyv2poC9bZVxhAJb1Tbqc8hMMHMA6He15
 lNLUvRett56gmVL29BaFAmJAxWsSRfDKTc+MfJQUfAhGDPoFFFPsnTn+Gi+GfuNpgiBz
 LDWM/amCMibBmxG9w+UGBRvP5xdeCbUKI9DJfLOouUeKDykvaSrkU7HVU0uHBnM0OBrW
 cavCxNeLSIh4Gc94+uuH/iFVwRLYDaBxpr+4LU2ovmrwUy/fO2vMQJwlmQLlnWB5H03B
 p8/blfC3SJZ9jScA56SFvxSMdn/+My2HSJDIEH6bKiuNsyJRIuc8zkbADYOOlF/R2003
 EvUA==
X-Gm-Message-State: ACrzQf1yqD4Isy8gdsfVk3r79X3Nq5VE5wjzEHQRqeuBo0+5oqyBzdKA
 UQvFsA6cTCQ9cvy4oatkCn1Fs3iWrGvkRQ==
X-Google-Smtp-Source: AMsMyM4iJCgX5scaAhxuqg1sA4Z3qtxOCwWSVnmBAb5WRz5GwRix3fEMH+IISFxUbOI78DAMipouzg==
X-Received: by 2002:a05:6638:e8a:b0:374:f6c5:cff6 with SMTP id
 p10-20020a0566380e8a00b00374f6c5cff6mr17453850jas.187.1667420107922; 
 Wed, 02 Nov 2022 13:15:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 i66-20020a6bb845000000b006bb5af55ddfsm5511872iof.19.2022.11.02.13.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:15:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:15:05 -0600
Message-Id: <20221102201505.2239068-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yC37USfrJHXx1i6RDRxnIpE4euWEYZ66z+xJfTe3yfk=;
 b=l0Lujozieh5vx+eX+ZF/moRcEGi1AL0Logvy3D/uCjGZKRGkbCvcEnFnUKOLFg0M6l
 8MFK3Nyyamr/6wHntBZZRqmBBZCJmjR65f+koKzONaTrhi/PYoXg1xGCyfWsESZtdMAA
 JmkUttxvbNqkF96H/nC4hyhZBazIyxcFsW890oBaX+tNHOOq/qILmRjhd5XbTDwDYoEv
 OQCHUI3VPrXwZW+2B111ZzPIpB7lM9sNqjTqp/XrLBR3FffGLOsTgDUGDO1zBpWRX7Lq
 DLgQCJhEX7UiodzrOhtJpDXjF7ZkptoIXmI9fLAyb9Ru4crp6vR7cJjSSrN4V2P20JSv
 Takg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=l0Lujozi
Subject: [Buildroot] [PATCH 1/1] package/python-dpkt: bump to version 1.9.8
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
 package/python-dpkt/python-dpkt.hash | 4 ++--
 package/python-dpkt/python-dpkt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dpkt/python-dpkt.hash b/package/python-dpkt/python-dpkt.hash
index e5e986628c..7de0d748fc 100644
--- a/package/python-dpkt/python-dpkt.hash
+++ b/package/python-dpkt/python-dpkt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dpkt/json
-md5  ac3ace1c5ee12a74f12a863ac9082b59  dpkt-1.9.7.2.tar.gz
-sha256  80f977667ebbad2b5c4f7b7f45ee8bea6622fb71723f68a9a8fe6274520c853b  dpkt-1.9.7.2.tar.gz
+md5  0f16de3c0b8caa6ec2261210f08c7b8b  dpkt-1.9.8.tar.gz
+sha256  43f8686e455da5052835fd1eda2689d51de3670aac9799b1b00cfd203927ee45  dpkt-1.9.8.tar.gz
 # Locally computed sha256 checksums
 sha256  4c5ffde575425591cbd51410219a6b98bbbb717e0c5784187e356653da8e5095  LICENSE
diff --git a/package/python-dpkt/python-dpkt.mk b/package/python-dpkt/python-dpkt.mk
index 87945d67c6..a99a1e8604 100644
--- a/package/python-dpkt/python-dpkt.mk
+++ b/package/python-dpkt/python-dpkt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DPKT_VERSION = 1.9.7.2
+PYTHON_DPKT_VERSION = 1.9.8
 PYTHON_DPKT_SOURCE = dpkt-$(PYTHON_DPKT_VERSION).tar.gz
-PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/95/51/923b370880eff9b62fe4fe965a916da709022a02669c670731da69088e93
+PYTHON_DPKT_SITE = https://files.pythonhosted.org/packages/c9/7d/52f17a794db52a66e46ebb0c7549bf2f035ed61d5a920ba4aaa127dd038e
 PYTHON_DPKT_SETUP_TYPE = setuptools
 PYTHON_DPKT_LICENSE = BSD-3-Clause
 PYTHON_DPKT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
