Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A5CC433FE
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 17:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B09F860B32;
	Sat, 29 Oct 2022 17:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B09F860B32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LUKC51Ta_2QT; Sat, 29 Oct 2022 17:22:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBB5E60A8A;
	Sat, 29 Oct 2022 17:22:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBB5E60A8A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90CE31BF255
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 663DD60A8A
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 17:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 663DD60A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5-vXqqjB0l4 for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 17:22:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7824260671
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7824260671
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 17:22:19 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id x16so4432691ilm.5
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 10:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qpf8qcWv9AUc/GKWP2oPnS/2cu0Y5sEZ0qT0yfNvi3U=;
 b=b4lNX52wKZgto7it0fdH0ns1M8wg3euH4iUK9cPXiNwJ61xf7tnctQYaLmeY3WX0RJ
 BzXzUPAUu48F69QiA0d1Vna+4qAoD01HKXWuySTPQ0TAGeCVEEdzIAyk8zChzRQGNylw
 i0PAuC7hvITv5VlCFz/4PIeWQ4SoHsiXku86VB7SlixXNeHGQvFzzC0PknWXtBGrfzNZ
 onAfLpV5bXRnbu891bS2x9f2UD7fTaapWhZHttRCIngXDuO3hO+69FpJGKA6pBk0eTFM
 7ptKN5QVAm/oDt8WSU0FXYBVQPGZnySEYyI95eiAH4McKoxNlDRSVSWGciuMTYW6RKng
 VMiA==
X-Gm-Message-State: ACrzQf0laTbfPZ+wzerhdaNPShhew8lf/rVLmxNSDd6uA5px8F+lortf
 McjyjzQf5Vr3AgVigq0NtqEdFxbdsBQ7+w==
X-Google-Smtp-Source: AMsMyM6Y2VfDfXB8gXcTaZImlzj06JSWf7c5yCpop75gsX9ow8GbYg55di4OzH/2q6PwxUP1fqmVlA==
X-Received: by 2002:a92:dc8a:0:b0:2f9:9675:42ef with SMTP id
 c10-20020a92dc8a000000b002f9967542efmr2483801iln.130.1667064138113; 
 Sat, 29 Oct 2022 10:22:18 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 v12-20020a02b08c000000b0036c8a246f54sm787326jah.142.2022.10.29.10.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 10:22:17 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 11:22:15 -0600
Message-Id: <20221029172215.1437796-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qpf8qcWv9AUc/GKWP2oPnS/2cu0Y5sEZ0qT0yfNvi3U=;
 b=ZA56GiDCj+jC4cwhsJMwsgCvbSvhvtzZpyw9MZL+Mhkn8y1ypOJwlb2AM4NmY/e8N0
 KbvSJi8E/2aR6TnV+eQnB/oAvCCoQ7owD7OH/qu4+ZL//L9ed3aEjrn7EBxBBwihMHSs
 mjDXtJiHVmrTm89vxHR6SXO7UTdOK9YExhBlFfe+OYJBMpsFVhYakA649eg03qaZOD7C
 h/4o9j8i+ZLhzWN/+vlDunUXADD3msKNg0lWgGcd+ARm2vGqyxrGGMhTOe08smfBu/VM
 2jU3qPK3NoyW+F1eXk4GTyD29cV/1eoUuNJVSrxLsylBuUOp5yDi069DuKtnedhvsLIE
 JLqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZA56GiDC
Subject: [Buildroot] [PATCH 1/1] package/python-wsaccel: bump to version
 0.6.4
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wsaccel/python-wsaccel.hash | 4 ++--
 package/python-wsaccel/python-wsaccel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wsaccel/python-wsaccel.hash b/package/python-wsaccel/python-wsaccel.hash
index 9d0002d41d..b388c3cc7c 100644
--- a/package/python-wsaccel/python-wsaccel.hash
+++ b/package/python-wsaccel/python-wsaccel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wsaccel/json
-md5  973168711818dd98b8b28a4c2db77a27  wsaccel-0.6.3.tar.gz
-sha256  fdb27866bb6b6e7a29e45222778ff97938782a0ce92eff07dfb20af8fb9301c4  wsaccel-0.6.3.tar.gz
+md5  73bdc70035813ded14f9a4b81e82622a  wsaccel-0.6.4.tar.gz
+sha256  cbf66a88bcaf6c6ad16d50ea29215891526b6e993c4bc7ed44b044ee6fe3ad3d  wsaccel-0.6.4.tar.gz
 # Locally computed sha256 checksums
 sha256  b6982974cb838b985b54b663d1780d280735086249c2e28015f25dd455df25da  LICENSE
diff --git a/package/python-wsaccel/python-wsaccel.mk b/package/python-wsaccel/python-wsaccel.mk
index 7c78951f2f..ce41d431ff 100644
--- a/package/python-wsaccel/python-wsaccel.mk
+++ b/package/python-wsaccel/python-wsaccel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WSACCEL_VERSION = 0.6.3
+PYTHON_WSACCEL_VERSION = 0.6.4
 PYTHON_WSACCEL_SOURCE = wsaccel-$(PYTHON_WSACCEL_VERSION).tar.gz
-PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/f5/d1/3e99875a764d0d6ec94a74977ed72dd3022a7f31d036622da9cff8fc072f
+PYTHON_WSACCEL_SITE = https://files.pythonhosted.org/packages/77/0b/a44df15382a76b6768184630d483b8363d65b9f70d1aacf76153d496bbb9
 PYTHON_WSACCEL_LICENSE = Apache-2.0
 PYTHON_WSACCEL_LICENSE_FILES = LICENSE
 PYTHON_WSACCEL_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
