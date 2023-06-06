Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA77C7EE43
	for <buildroot@archiver.kernel.org>; Tue,  6 Jun 2023 21:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D40760AA0;
	Tue,  6 Jun 2023 21:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D40760AA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lkpA1XwAb2C1; Tue,  6 Jun 2023 21:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F32D60E11;
	Tue,  6 Jun 2023 21:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F32D60E11
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F78A1BF470
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 21:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 294E44021C
 for <buildroot@lists.busybox.net>; Tue,  6 Jun 2023 21:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 294E44021C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0AfmUm4uWfNn for <buildroot@lists.busybox.net>;
 Tue,  6 Jun 2023 21:46:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E99340128
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E99340128
 for <buildroot@buildroot.org>; Tue,  6 Jun 2023 21:46:04 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-652d76be8c2so6016944b3a.3
 for <buildroot@buildroot.org>; Tue, 06 Jun 2023 14:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686087963; x=1688679963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fr8k+uLIM71cZMtxO1KWpfDCrHaFPtGvpQGcJ05ErU0=;
 b=mEqpdlPSQ4GZ35oE/S3lEfIlSF/NwHcMi6Ohm+rxUt842ifmlI+LgM8Rben8n00psI
 HaUpjIo/SOoNtIlMCIUARTofBgYyXJZT5WdfQijROdwMe/imB6Gd2xKY8ziQBRlGvkql
 w8+T01HRQw324xnJ3RW4MV0vZ/AKAVWqmwGDkc4OPhTefRu1l5Da+FuFUBrqADDGUuE7
 N/lr5u3BvavEjujECh990kQh/hUtVNBS9YVDnB756geeixTH//VQq7QypcIVP29PdyzS
 IfnOPZ0ivsWZMxqazxWXzGI2is2Kz+JAC67PqMwHcykyrlqR05JGbp4b/tWEdSyRCv+c
 EaAw==
X-Gm-Message-State: AC+VfDyl+SsuLZ4ce8M4YxosEvZGEG1Gwf68pE8JhW5RosrdzKZOMNFZ
 PAKqlA8O1MZ4Lvs/YwGKwyZEfC3sy0DZ9ksmNSB0Gtc8
X-Google-Smtp-Source: ACHHUZ6SPrt6R8w1cqIhDinPSvtSWGgfYxWY0Na7tR4dxBLQbnQPn7dQTk/qGtaBsfJEVFFbKeg2qw==
X-Received: by 2002:a05:6a00:ad5:b0:649:93a7:571b with SMTP id
 c21-20020a056a000ad500b0064993a7571bmr4246930pfl.13.1686087963457; 
 Tue, 06 Jun 2023 14:46:03 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 n22-20020a62e516000000b0065dd1e7c3c2sm2981142pff.184.2023.06.06.14.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 14:46:02 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  6 Jun 2023 14:45:55 -0700
Message-ID: <20230606214556.174086-2-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230606214556.174086-1-christian@aperture.us>
References: <20230606214556.174086-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1686087963; x=1688679963;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fr8k+uLIM71cZMtxO1KWpfDCrHaFPtGvpQGcJ05ErU0=;
 b=MiR9tEKJXPnjrzRI/FmpsXw7YAxaezCKIEE08+MQASdXA5XVkLco1xSholVRmsL08E
 Oecwi+eNp6xtOto/wZAcW5Rl+Gjeek/yJi2K78GV+plQ7V1AKkGHY66PWsXbFq9l5bwE
 a4BV7Ia9XOx6z0PDFtu5Kqv3iNf0xWvXSgCUeyABxkT1ldwLKi/x2v3N/aaWUa3YnaZQ
 xHsW8K8/HGcdjPgEDEbtVlmZx4JixwjSKUKn1jmybb2ahEHFfPNeKgEIlGOZPyQln2z5
 brvVYESihUjzfDu1IFJfo9Yfk8Xr/GwnVwlnc5j9Q2LhCk2/miKC8+iveu/6ciYEopVV
 RrBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=MiR9tEKJ
Subject: [Buildroot] [PATCH v6 2/3] package/go: adjust comments
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
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adjust comments in the Go package to improve clarity:

Config.in.host:

 - Add comment mentioning list of supported architectures.

go.mk:

 - Improve formatting of comment about NOCCACHE
 - Reword comment re: copying src/ to host/
   - the previously linked issue is not relevant.
   - instead: mention that src/ is needed for stdlib.
 - Adjust comment re: adjusting file timestamps.
   - mention this is needed to avoid rebuilding stdlib

Signed-off-by: Christian Stewart <christian@aperture.us>

---

v3 -> v4:

 - move these comments to a separate patch
 - Thanks Thomas for the review.

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/Config.in.host |  2 ++
 package/go/go.mk          | 11 +++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 90a54f0da6..b87b862cec 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -3,6 +3,8 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE2_ARCH_SUPPORTS
+	# See https://go.dev/doc/install/source#environment
+	# See src/go/build/syslist.go for the list of supported architectures
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
diff --git a/package/go/go.mk b/package/go/go.mk
index a96c6ab5dd..66af25db45 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -121,8 +121,8 @@ HOST_GO_HOST_ENV = \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"
 
-# The go build system is not compatible with ccache, so use
-# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+# The go build system is not compatible with ccache, so use HOSTCC_NOCCACHE.
+# See https://github.com/golang/go/issues/11685.
 HOST_GO_MAKE_ENV = \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
@@ -154,12 +154,11 @@ define HOST_GO_INSTALL_CMDS
 	cp -a $(@D)/pkg/include $(@D)/pkg/linux_* $(HOST_GO_ROOT)/pkg/
 	cp -a $(@D)/pkg/tool $(HOST_GO_ROOT)/pkg/
 
-	# There is a known issue which requires the go sources to be installed
-	# https://golang.org/issue/2775
+	# The Go sources must be installed to the host/ tree for the Go stdlib.
 	cp -a $(@D)/src $(HOST_GO_ROOT)/
 
-	# Set all file timestamps to prevent the go compiler from rebuilding any
-	# built in packages when programs are built.
+	# Set file timestamps to prevent the Go compiler from rebuilding the stdlib
+	# when compiling other programs.
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
