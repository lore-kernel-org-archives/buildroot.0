Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB39C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09F4E615E1
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 09F4E615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAEDB83F7D;
	Thu, 30 Sep 2021 07:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Lc7TvAczU7N; Thu, 30 Sep 2021 07:01:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 298FC83F8A;
	Thu, 30 Sep 2021 07:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9877D1BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 940AE613AD
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7eF874qcjhxj for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A79D160715
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:00 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h15so6665247wrc.3
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Xn7I8hFOhDDsEkcpByc11U+eDPFYiBLsElmlcnNVD04=;
 b=TvJn12k9jvc80raU6CYYbGzUFe0t0gEERwfH8ZKNACfsX8Zemv6irH7z25iJ5JxBmf
 R0VoZ3ibzQOHKanLKGxRbGHKnOL55Rz3ElRwqHgib+buMXRat6JoVVNmW9clmHA8VrLu
 /ZWYYsoJSDME8DzfJaN3bnC+d0nsUqmqPsqLwT3rjQPvcJHexdusk5QcO3NMcHKIgFO4
 fCgee4eIH/pVky6RB4mb6fKRhXOQjId/HEEbMQWSiKLfSoHqeAwoNvkvlH4Ztn0gH9NK
 rkk8iybAUrQVI2/K+MkurYdGRkkL8EI1jpBU7fCBJUsNqpteRbQ+hFJCH2rcQfa5TQDP
 9EWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xn7I8hFOhDDsEkcpByc11U+eDPFYiBLsElmlcnNVD04=;
 b=pmHP6W8O65+XNSrqRvx66KavBfv+/ms5oRbW6AysE92WTFLb3kAHuk97KJMEv0xIte
 x4rdA2dxmrU4GV4kpuAr7OgK0fbK1zes9xzcaiNq6HLUbenTwgwVEJsnvLQ4fWSGmK8h
 17NChx3qhTY547y6DEhUbUoJsBTp5Y2do+XZCNLVEh0o4ql6JEs3BH9bFyN7/q2iChdB
 F6mEqDD9sNuhZoeZVuk+751ej8q+9XaQRnIlx1k5O9YHQmgdnwzkr2Ao25nJmktSDV6d
 bNXeXz5GqkCR4APZDXZ1T0TLvo4tGo5V8AwSZAO+9w0n3HnE9GPUOtyLmLwkME1Gfw6r
 E7Ow==
X-Gm-Message-State: AOAM532As8yf4NqeGYguwwJyI0QGSHf99FVll7J5ZL+jQOfyNvWs9wCz
 YKu/0ufTqNsgn8u0mEZz8BzU3wj3EmY=
X-Google-Smtp-Source: ABdhPJxO4Vx3kJ4K5m0dMRrKyjFryzBpJK2d8brb34MgQ2P8D1LautXBKYbpJWsOL53pvRxpSXvP4w==
X-Received: by 2002:adf:e0c1:: with SMTP id m1mr4247068wri.241.1632985258780; 
 Thu, 30 Sep 2021 00:00:58 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:00:58 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:38 +0300
Message-Id: <20210930070051.40361-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-reentry: bump to version
 1.3.2
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-reentry/python-reentry.hash | 6 +++---
 package/python-reentry/python-reentry.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-reentry/python-reentry.hash b/package/python-reentry/python-reentry.hash
index 089d8594f5..522b936118 100644
--- a/package/python-reentry/python-reentry.hash
+++ b/package/python-reentry/python-reentry.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/reentry/json
-md5	819931cd0a766a7c226879e57ccea9c7  reentry-1.3.1.tar.gz
-sha256	2fe18c1a6946f3e2a51e1d5aa78228a11e879fbb0da14da5bf1e6252e83d26b1  reentry-1.3.1.tar.gz
+md5  398c1e5bbda657aa645c8d2d38afb63f  reentry-1.3.2.tar.gz
+sha256  c6667e59aeabbb4d122aadc2170102a270e6a811d16a5431c5c3b91fabd7cf02  reentry-1.3.2.tar.gz
 # Locally computed sha256 checksums
-sha256	4ae7f3216208a7e2327236e95bcd2397b2495f1c2298c708986c893bea608509  LICENSE
+sha256  4ae7f3216208a7e2327236e95bcd2397b2495f1c2298c708986c893bea608509  LICENSE
diff --git a/package/python-reentry/python-reentry.mk b/package/python-reentry/python-reentry.mk
index 428dbf2b1b..ec33c17452 100644
--- a/package/python-reentry/python-reentry.mk
+++ b/package/python-reentry/python-reentry.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REENTRY_VERSION = 1.3.1
+PYTHON_REENTRY_VERSION = 1.3.2
 PYTHON_REENTRY_SOURCE = reentry-$(PYTHON_REENTRY_VERSION).tar.gz
-PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/ee/3f/a90789e01c4d2b67a57e9bd758e60ecb9338d428604f66130b57684ba8cc
+PYTHON_REENTRY_SITE = https://files.pythonhosted.org/packages/a0/88/eb0c107c19227a2292ed11711034a3d80c0dc1368d2b3ebeb3fe7b936a8e
 PYTHON_REENTRY_SETUP_TYPE = setuptools
 PYTHON_REENTRY_LICENSE = MIT
 PYTHON_REENTRY_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
