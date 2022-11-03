Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA821C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 14:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7003D404D5;
	Thu,  3 Nov 2022 14:12:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7003D404D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3IgkqDLjk5RR; Thu,  3 Nov 2022 14:12:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 852844049A;
	Thu,  3 Nov 2022 14:12:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 852844049A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1F31A1BF38A
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED98F416D4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 14:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED98F416D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQQY9lplszYo for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 14:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D028941756
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D028941756
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 14:12:01 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id n191so1378600iod.13
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 07:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=//eB9CwzOmpt8XhFxUmCWxGaRecE3a+XQLlrvQPdEc0=;
 b=5rq9hQbDXNNCgg8kbSh7CBHauPGG02r4tEqOKfOY0Uc9L83FIpb0nzLREbLqveAWOj
 G4nV3F5rUqw7Hb+IoyXywuaGL07QHC3OY7lOMOLbP8LrkgZ2UDyCHCftaVrhdyWiXB/A
 VvFXg0DJ5y+RYmpy95N3smCHHfeC2X+c4MwTrJYjr4Uxk9uf4hsa6yXe9Fpm5BLZEh/J
 PuIP2cWZ11m8zDRizEsyQwl5D+KGkJIOdIlpoNbw1ARQkCHNpweUuk781H+DM1QkBSP9
 gYvdG44JcMBLRZy1zjVsDIef743nOvSuUhgiQeEWd0zs51fPNZUXAqygthvRLYs6H0D5
 mboA==
X-Gm-Message-State: ACrzQf3TEJOYOvQw0A8ZL0xvENiLltfWnfS8LEO92tZ1vWcXcn7FolRM
 SvbyRlvOh42RUh7WVRxH4fLM8a8/U7rWXnxp
X-Google-Smtp-Source: AMsMyM6Q+Fr4xaNsmmlI90BcNIrpShTr1xkTMPiKHR7MZHF5+HEAfjuTeRpz/tN31nSgvzd44HTi3A==
X-Received: by 2002:a05:6638:d4c:b0:374:f734:c16b with SMTP id
 d12-20020a0566380d4c00b00374f734c16bmr18614421jak.7.1667484720643; 
 Thu, 03 Nov 2022 07:12:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 g17-20020a056602151100b0069e1bcbddaesm378917iow.16.2022.11.03.07.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 07:12:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 08:11:58 -0600
Message-Id: <20221103141158.315907-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=//eB9CwzOmpt8XhFxUmCWxGaRecE3a+XQLlrvQPdEc0=;
 b=RaPTIaO9vQNa/Kq5GY/IAb/AlkUUu8Vqy5eqjjV3azo6BzECYls/vQsKQ+w/5bPZxf
 F1uptvhv/0nIJ03G79ZyUJ76uuv9WDJ8hXXoWbblBtiJxE2KTc/NNJt5UZRUpWnHHMUU
 t1MiJUIa81kEEqWotg2PSioVcbTMQAODBR7UnfLZlnd7FpHHwaFk11b6CuDmY0Cvnnyh
 /TRNoCTgldxcpO3UwzFkcvFa7jUKdGsMo0Wqp6q2ygFrX9LVDHVHsl8nz8aAyIdTtME6
 5t+kuIUF/EtRKbTd6SnJAqhfY5MMktYG4UG69SM9MjXGvgPuGkcNU66xyb9C226Fz8jX
 6hjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RaPTIaO9
Subject: [Buildroot] [PATCH 1/1] package/python-pyftpdlib: bump to version
 1.5.7
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
 package/python-pyftpdlib/python-pyftpdlib.hash | 4 ++--
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index abbb1261b2..46b5ae6336 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5  459dd3e685c4b7dfcf574ca05e5586eb  pyftpdlib-1.5.6.tar.gz
-sha256  fda655d81f29af52885ca2f8a2704134baed540f16d66a0b26e8fdfafd12db5e  pyftpdlib-1.5.6.tar.gz
+md5  6d9539aea866d4f959d86ae001cdddf7  pyftpdlib-1.5.7.tar.gz
+sha256  7ea3ce4137db8209af1f6b9ea020590f462c63ed7c7a1240bd596e4d3a7b656e  pyftpdlib-1.5.7.tar.gz
 # Locally computed sha256 checksums
 sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index 931e2dad06..bd1ada8125 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.6
+PYTHON_PYFTPDLIB_VERSION = 1.5.7
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/31/61/63ef60aca6de07eba1639d9d47f3f8e29462e8bb49d6a8dce9aeff240646
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/2f/bc/f03a15bf807698bbecdcf316041e3d79b25a40fa7b6e071e17702ff7b9d4
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
