Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F197FC6176
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D644060B;
	Sat, 14 Sep 2024 22:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SEPhnHGKemQK; Sat, 14 Sep 2024 22:28:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74C0540624
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74C0540624;
	Sat, 14 Sep 2024 22:28:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66DFD1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55F154018E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T9ibxVkJsUFu for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:28:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2402140130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2402140130
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2402140130
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:28:23 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-82ceab75c27so128660139f.1
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726352902; x=1726957702;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pvipqfDS5ETUtz+0BvcS7FW7eecSsbCK91XoRMUs7fY=;
 b=KZRTIRcNWaPQa5lF87OGPIRXBatvl78u4K88iudnJQ1ktJ30QU0dlpGESI3XHe/3zj
 jx8eNIBUiP8d4RrD+AeYVAa+fDsgsLTToHsT8BswqI9iMtAd143Epk3qPUUS4eR1L6MP
 SQTAorW+4KyV7hb16zmtmmmGKWbWhG3wfekduLbl91F4rCX+1HUFxLojhe6G8L+aQQVY
 zWo+2twBzjB4LX3FGv4zsgSXW/UaPnoumjD/Hg43DAkpOa9Bskz+hg2IW8RMo1uSjE9e
 3yTkao69P7L/LYLeQHcfkgmCegP25Q8uUfeWsCe20aRitcJo6c0o04o8LC486TR/FcUk
 TBvw==
X-Gm-Message-State: AOJu0YxvQSY2nhHdPR+Az5Jvh7s9cofQcyRZ3W4V7OhJDwNb3I7Hzost
 xA33gzw8OUHrLrdqj3oONDjHSHMMaSnfUBF8WvrM4+DkopPf0BYH+9nQVQ==
X-Google-Smtp-Source: AGHT+IGz67/nrRRSEq+nRe1aemLp3XoI2Idc1tO22/qJVVDRv9V+5aiggzaKt8SNIjPxkSIy+aWKdQ==
X-Received: by 2002:a05:6e02:4b2:b0:3a0:8e39:bcb1 with SMTP id
 e9e14a558f8ab-3a08e39bde0mr52243005ab.1.1726352901988; 
 Sat, 14 Sep 2024 15:28:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a092e10661sm6701805ab.25.2024.09.14.15.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:28:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:28:20 -0600
Message-Id: <20240914222820.1351112-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726352902; x=1726957702; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pvipqfDS5ETUtz+0BvcS7FW7eecSsbCK91XoRMUs7fY=;
 b=fgEupDNwUPpZP4rsovyZoKi9wX0ndmnRaL7pdAEnsy5orUJZovovQMNba/ljmeR4K0
 hkj4Xh5FA2hZG9JVoCMRe7YoauSwx/3RWoGO1wlTgCWbk2x7t+R9x5WLz6xHLrNgpuAd
 49yaqk3msrzn8sYQNchu7qckMflFFVxAXk3aAtNX/5gMtS4D4TYD0QiT50H5prVVlX6Q
 Wm9lHZgh3o50G6DvsQrkSpjhraqNG3ep+LArfQRtjweWoMiwRv+y97agjmVgyCiTCjdT
 NdEg3Li4912uwGH0SQxKQMiTk6jzz2PDEFjv9RKXev5dvJBSim41Y5fR2OxlN63FRPCH
 YyuA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fgEupDNw
Subject: [Buildroot] [PATCH 1/1] package/python-blinker: bump to version
 1.8.2
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
 Peter Seiderer <ps.report@gmx.net>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate build backend from setuptools to flit.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-blinker/python-blinker.hash | 6 +++---
 package/python-blinker/python-blinker.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-blinker/python-blinker.hash b/package/python-blinker/python-blinker.hash
index e0c1d600eb..d9f1052254 100644
--- a/package/python-blinker/python-blinker.hash
+++ b/package/python-blinker/python-blinker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/blinker/json
-md5  0306b831281e9918ffb0ac6e3e18b47f  blinker-1.7.0.tar.gz
-sha256  e6820ff6fa4e4d1d8e2747c2283749c3f547e4fee112b98555cdcdae32996182  blinker-1.7.0.tar.gz
+md5  ce2f9fb3bc0c0000db11f012f5f5afda  blinker-1.8.2.tar.gz
+sha256  8f77b09d3bf7c795e969e9486f39c2c5e9c39d4ee07424be2bc594ece9642d83  blinker-1.8.2.tar.gz
 # Locally computed sha256 checksums
-sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.rst
+sha256  9eb73a1f38597a4aa17025d2ae1be3839624c795e985d4f0e9769ce29faca467  LICENSE.txt
diff --git a/package/python-blinker/python-blinker.mk b/package/python-blinker/python-blinker.mk
index 234126a500..7ce06c2177 100644
--- a/package/python-blinker/python-blinker.mk
+++ b/package/python-blinker/python-blinker.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BLINKER_VERSION = 1.7.0
+PYTHON_BLINKER_VERSION = 1.8.2
 PYTHON_BLINKER_SOURCE = blinker-$(PYTHON_BLINKER_VERSION).tar.gz
-PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/a1/13/6df5fc090ff4e5d246baf1f45fe9e5623aa8565757dfa5bd243f6a545f9e
-PYTHON_BLINKER_SETUP_TYPE = setuptools
+PYTHON_BLINKER_SITE = https://files.pythonhosted.org/packages/1e/57/a6a1721eff09598fb01f3c7cda070c1b6a0f12d63c83236edf79a440abcc
+PYTHON_BLINKER_SETUP_TYPE = flit
 PYTHON_BLINKER_LICENSE = MIT
-PYTHON_BLINKER_LICENSE_FILES = LICENSE.rst
+PYTHON_BLINKER_LICENSE_FILES = LICENSE.txt
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
