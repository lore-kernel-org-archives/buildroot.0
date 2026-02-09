Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F160EF0719
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 07:07:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40D6A80E03;
	Mon,  9 Feb 2026 07:07:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_MtI3KY0UEq; Mon,  9 Feb 2026 07:07:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6445182358
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770620845;
	bh=Q6kXz4r/qu1idRGoZqAvdYWPpqsYWywfxSa99o5rBOw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s6zDdnppS3/3Upe7Tapl1E6paGWz/eeBD636SM26hjq1DFsgMFVK242qwIiqz1vXQ
	 BStGx1s8DgF4aUpU7AI8d3JxzerUNQ4saMzyrIp2hwKcvW/ptn294/l0cGpyU1rL9i
	 mVlImVdoE7PCUyOUnh1NFHlJ3iqJhdfRqS9w04n7Y9TKPopwaNyW5myWc1nFjXTf5I
	 a9CybrZfJIXfF5QBQhqfzhl+CfWSnxBzlDWWSI6du7Mn322vfuIRHFSguhX+Z14Zsw
	 r8Tj0eqNV/EgIkm2dHmEjZMtHr47/BndFe5+fSJmJ6mgUVovrDZnNu3ba6vco7Yqn+
	 k3da217/iLrLA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6445182358;
	Mon,  9 Feb 2026 07:07:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46ACC2A2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 07:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34AC3400E6
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 07:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzux4ST5_W-Z for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 07:07:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3E3C240070
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E3C240070
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E3C240070
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 07:07:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4806e0f6b69so30558205e9.3
 for <buildroot@buildroot.org>; Sun, 08 Feb 2026 23:07:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770620840; x=1771225640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=74kbwGLm+T2HHzA2noSGr8KDM6SAeO0gq1uNSiB4EX4=;
 b=PghlelLn62EwzpPwDTRI+l1gGq5LUxb+9aZ4QOWruE97+Ilup/o/6PVxjY0KyJuC8g
 9KEZ2s34CPUGy3GDgmvIQkH6KxL3cD80I5K3BnZBz2Kk5qWwTpC7YCfSmzlAK1ON6ov+
 ly3Znd3YNvbmMbc3v7Mq4YFyE4qM7taFgr0Xuw2PR+YRIIYDVLos5SjCta357EoEY6Bt
 fkFQHtqQ8dW7ukrpaC0TzIOKOc7DJ+dt16UzX1gHgCfCTI2qGPlJj68q9rMlbup78sTr
 TJiKo1UkccVW4GiJ0LlooYNvC/ecKcEW/X90TwjWIXNuxD8NwbCQSA68ghBMs1lVr3Kd
 C8Hg==
X-Gm-Message-State: AOJu0YxMPwPFSLtayMWfMlIgEYfDNEoIZA/yfikrSR837z3E53Rdx03o
 +l/n16BHcviIQouCGYQgy+MHW6Y6MYGoSefpvZ/s+/7gL7JYC9ZUyDEJg4TvCA==
X-Gm-Gg: AZuq6aJXi2Ux2N8xVhMPb0/1O4XWJPTlVvxYV65tMFfOnNbeXdbbpt9/EGgWTAolA62
 JE1Y2N1wVlzgXY2JZmGJcLt6oGP5aXNHeFJOTy0LyKEi8RFsmE2R73MNBJhEsALVxNQ1OcJzC+y
 rHWe/+p1GPj2OapPPwQ2C/5da/lgBWZmtvFKp/H4vi6V+mji83TRp+PwAM4Ejs4iE7v/c+xAgWa
 K8eJyIO2i8TqQgLRUNu2uTZWRPW1YhbE2q0XVxaOCL4N6aVuANsaXR6A8dje7Q8/38q6WcV35e+
 W48+hxtfzWfoqnJY+p8u/iv6Or53kjaD9BJ7TPLOxmKpn6MYyWi67spiuk8U0x0Ss+UBt6k7FNx
 CaGYLGpqW3VAWnz8ZaaOVA/mZERHZUrLepaqI7xctS5eYnMOCbJE/8YePlrTsp9vaxnQWPQN51W
 QwiXIkOM91u36BxRoUxtV+NCM38DeFoAGK3CPl+8LMwefj5bWHmIStSyMCKmE=
X-Received: by 2002:a05:600d:640f:10b0:477:a1a2:d829 with SMTP id
 5b1f17b1804b1-483201dd24dmr115157415e9.13.1770620839847; 
 Sun, 08 Feb 2026 23:07:19 -0800 (PST)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483206ced0dsm214858915e9.6.2026.02.08.23.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 23:07:19 -0800 (PST)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>
Date: Mon,  9 Feb 2026 09:07:09 +0200
Message-ID: <20260209070709.4499-2-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209070709.4499-1-flaviu.nistor@gmail.com>
References: <20260209070709.4499-1-flaviu.nistor@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770620840; x=1771225640; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74kbwGLm+T2HHzA2noSGr8KDM6SAeO0gq1uNSiB4EX4=;
 b=aRQ+HjzuKWvDX8bfV+ZG3I2d+jiDC8EO5yIhLAFnAPdM3nNB6S6gwznGbIP+Y37H48
 0aiccdqvgVUrdLjpGKQgl2DB0o87v+ZV1qn/kBhbSCWxeRSO9BLIYKHwCXGTyaHKnYiB
 bpXp28G1KRXAxSOlcaIGKWHRxCmKspP3BMl+OVdbK4mIGHREzJQQiiNTyGWOHtLuJC3w
 OQnQvVgmHDhVKT3DUSntWQQTw2yw4GO9qsKYVbJf4WHX3BFj9wKfBsV98DzBKMrsDzOn
 tUoqYlGWYc60ljUpbkulv3FOEbX4y4JZJRJ5WXk9T8UQZKDnlS/CHdjfhqS7L6lHp3cj
 gZ+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aRQ+Hjzu
Subject: [Buildroot] [PATCH 1/1] linux/linux.mk: add kernel commit hash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add also the kernel commit hash to the kernel release string
in case LINUX_DIR is a valid git repo. Using uname, this allows
easy identification of the commit hash used to build the kernel.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 linux/linux.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index c61089bfe0..7833304013 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -12,6 +12,11 @@ LINUX_CPE_ID_VENDOR = linux
 LINUX_CPE_ID_PRODUCT = linux_kernel
 LINUX_CPE_ID_PREFIX = cpe:2.3:o
 
+# Get git commit hash if LINUX_DIR is a valid git repo or
+# an empty string which will be passed via LINUX_MAKE_FLAGS
+LINUX_GIT_COMMIT_HASH = $(shell cd $(LINUX_DIR) 2>/dev/null && git rev-parse --short HEAD 2>/dev/null)
+LINUX_LOCALVERSION = $(if $(LINUX_GIT_COMMIT_HASH),-g$(LINUX_GIT_COMMIT_HASH),)
+
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
 LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
@@ -164,7 +169,8 @@ LINUX_MAKE_FLAGS = \
 	CROSS_COMPILE="$(TARGET_CROSS)" \
 	WERROR=0 \
 	REGENERATE_PARSERS=1 \
-	DEPMOD=$(HOST_DIR)/sbin/depmod
+	DEPMOD=$(HOST_DIR)/sbin/depmod \
+	LOCALVERSION="$(LINUX_LOCALVERSION)"
 
 ifeq ($(BR2_REPRODUCIBLE),y)
 LINUX_MAKE_ENV += \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
