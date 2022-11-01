Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B338FA3749
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 00:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCC9740193;
	Tue,  1 Nov 2022 00:34:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BCC9740193
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ODvpcY1rPzVX; Tue,  1 Nov 2022 00:34:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3163400CC;
	Tue,  1 Nov 2022 00:34:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3163400CC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5635E1BF957
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 00:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2BF9380FB3
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 00:34:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2BF9380FB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mtV3-axcuFJv for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 00:34:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 670C580FAE
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 670C580FAE
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 00:34:25 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id 78so12075175pgb.13
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 17:34:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZUSCmViNq2ALF8NudEeyl/a2eAbUHnFdEFsvdcP0IiE=;
 b=cOZPwDozwiVSu5djgKgZpF281pq8nAPax53p7f9mypoGtD3GRTJrWeBb7jrblPoizB
 AXWmmIhPLWyVPoT+XaymMX7ywfD+PUoU+KSjumMzUUokLaOkDgmxPmVZx7wzD0iyfTi6
 rYJLf53gDgRpztCbBt99MWwu7aN8aJNeFSSRvm+gyj4TAbi1NdorJlMT68nJB5BtDSDl
 G2QUCjM3zzccKfGYlUCz9FfsZ3nUPwg9zVzSdKHwbZlqu9LU96ZsnHF86NBtALXXguI8
 Oom+MUoaIxQiq5MJdpi9RJ9w9W+6A1oxnsMiAent5uvTeUrYtjSDr6pG0uzfzPVEqIp+
 ndVw==
X-Gm-Message-State: ACrzQf2xYMckGqypjlIPvRbvnm4OWyxyM7bGuqEPnf4SZob7GZK40Jm+
 Zo/WSHuGCUrsL/vHjV90nCvMQjTBI7q3cQ==
X-Google-Smtp-Source: AMsMyM69ZpUCpEIii1ECetwHjWjLq+aQ/KaT47n00v5/nPvdQSzwLC1/u1derUhoEBW5/v8630s01w==
X-Received: by 2002:a62:fb0f:0:b0:56d:78af:993 with SMTP id
 x15-20020a62fb0f000000b0056d78af0993mr7811537pfm.7.1667262864362; 
 Mon, 31 Oct 2022 17:34:24 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 k32-20020a17090a3ea300b001f262f6f717sm4844145pjc.3.2022.10.31.17.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 17:34:23 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 31 Oct 2022 17:34:19 -0700
Message-Id: <20221101003419.754757-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: disable stack protector for cgo
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enabling the C stack protector for Cgo causes a build failure on i386:

runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
runtime/cgo(.text): unknown symbol __stack_chk_fail_local in pcrel
runtime/cgo(.text): relocation target __stack_chk_fail_local not defined
runtime/cgo(.text): relocation target __stack_chk_fail_local not defined

Add: CGO_CFLAGS=-fno-stack-protector

https://github.com/golang/go/issues/52919

Set CGO_CFLAGS and other flags while building Go with make.bash as well.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/go/go.mk b/package/go/go.mk
index fe4d3a29a9..d6c15c4ac9 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -49,6 +49,8 @@ else ifeq ($(BR2_aarch64),y)
 GO_GOARCH = arm64
 else ifeq ($(BR2_i386),y)
 GO_GOARCH = 386
+# stack-protector causes a build failure on i386.
+HOST_GO_CGO_CFLAGS += -fno-stack-protector
 # i386: use softfloat if no SSE2: https://golang.org/doc/go1.16#386
 ifneq ($(BR2_X86_CPU_HAS_SSE2),y)
 GO_GO386 = softfloat
@@ -78,7 +80,7 @@ HOST_GO_TARGET_ENV = \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	CC="$(TARGET_CC)" \
 	CXX="$(TARGET_CXX)" \
-	CGO_CFLAGS="$(TARGET_CFLAGS)" \
+	CGO_CFLAGS="$(TARGET_CFLAGS) $(HOST_GO_CGO_CFLAGS)" \
 	CGO_CXXFLAGS="$(TARGET_CXXFLAGS)" \
 	CGO_LDFLAGS="$(TARGET_LDFLAGS)" \
 	GOTOOLDIR="$(HOST_GO_TOOLDIR)"
@@ -109,6 +111,7 @@ HOST_GO_CGO_ENABLED = 1
 endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 
 # For the convenience of host golang packages
+# stack-protector causes a build failure on some architectures.
 HOST_GO_HOST_ENV = \
 	$(HOST_GO_COMMON_ENV) \
 	GOOS="" \
@@ -116,7 +119,7 @@ HOST_GO_HOST_ENV = \
 	GOCACHE="$(HOST_GO_HOST_CACHE)" \
 	CC="$(HOSTCC_NOCCACHE)" \
 	CXX="$(HOSTCXX_NOCCACHE)" \
-	CGO_CFLAGS="$(HOST_CFLAGS)" \
+	CGO_CFLAGS="$(HOST_CFLAGS) $(HOST_GO_CGO_CFLAGS)" \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
 
@@ -133,6 +136,9 @@ HOST_GO_MAKE_ENV = \
 	CC=$(HOSTCC_NOCCACHE) \
 	CXX=$(HOSTCXX_NOCCACHE) \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+	CGO_CFLAGS="$(HOST_CFLAGS) $(HOST_GO_CGO_CFLAGS)" \
+	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
+	CGO_LDFLAGS="$(HOST_LDFLAGS)" \
 	$(HOST_GO_CROSS_ENV)
 
 define HOST_GO_BUILD_CMDS
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
