Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 174CAC71153
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 22:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DE1E60F18;
	Tue, 29 Aug 2023 22:22:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DE1E60F18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J_HzajEBS5L5; Tue, 29 Aug 2023 22:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B82BD60ECD;
	Tue, 29 Aug 2023 22:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B82BD60ECD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB5D71BF577
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 22:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC28160E4E
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 22:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC28160E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SSG5iYHPXRwq for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 22:22:33 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA28660AD2
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 22:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA28660AD2
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c1ff5b741cso9891785ad.2
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 15:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693347753; x=1693952553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WsDLlZ0tApZJMJxC0+H7tHY/OS0mhw832wHC3PZwxZk=;
 b=kvc4dIJh9T5FFNUJX9TyxD1B4CyFlQtbwgMXzxpZ8wwE681PAyIyV1JWyMCgBM4kEZ
 lfTzA7oWff6tgcnDcggMZxRdSOXwY8XDh7tU+cFpyGp7HeXxSQ1WxJUhzB7thtAHKsRE
 LcWM5ceLZS8tZgaQKK7qJxrZaN1n0KcHtrq4Ru9dTJ75JLsnStAm4BYDxSNFVQakkmLd
 UlrLzaQhfycRaL+S+H2fSDerlHQHtVnzsJFO1CXzTvt0vojJgf/oHRk2STvHGQCXu9ef
 BKZKmQ5u/XxdNbbmjI+lG6GOMXvPYOL3IqFH8HdG5Q/3p5d2T2ZKZR6heVkh0c9z58YU
 aUmA==
X-Gm-Message-State: AOJu0Yx1JHw73QA3xgMHBkDfuCUSE4QUFPxFu9Us9rjvt0eb374x7SC2
 ux37UJ+FUjyz17HcmEy3RDAorvD72zLdA+i3RMtJ+g==
X-Google-Smtp-Source: AGHT+IFnUqFA27nmZuwY3louQY1VVHhgmPGJBfWDCSTbFvd9OL70I+L0ApDctWcSOvA4EBNqlp5mwQ==
X-Received: by 2002:a17:902:e5cf:b0:1c0:e630:5031 with SMTP id
 u15-20020a170902e5cf00b001c0e6305031mr544277plf.28.1693347752879; 
 Tue, 29 Aug 2023 15:22:32 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ix5-20020a170902f80500b001bde65894d5sm9805097plb.109.2023.08.29.15.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Aug 2023 15:22:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 15:22:30 -0700
Message-ID: <20230829222230.1884427-1-christian@aperture.us>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1693347753; x=1693952553; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WsDLlZ0tApZJMJxC0+H7tHY/OS0mhw832wHC3PZwxZk=;
 b=id9TPGqTLPdmIjYqrA8AVJY9d56NaEonqmecC2VYLYGgr3aZPl9Lo6hMipikHEEzEv
 ZyBbZYWfD05iGd0KYpKznbFfR44o5P2xZzXb8T96KaokzM5KKF5W2Np59saw7+H0GcPG
 pI2jv7xvTDw5mEG3wc8QaMB6K5qoHiN7Jfvoyh+KSq2S9VZ7K0oEGoc/f4LdHNSBEjYy
 sJUQJFQNtFP7+1gjdUVYFuGl0C60hJzbOOQMCWN2UPE89LDWZoON8ApsUUZWPX/8x3Nu
 6StqO8Xurv04ull09oMAXxJK4nd1i4/nbmXCuLve7mRjtx4AkpguVF0YgzK7fOfbT0Iq
 9TFQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=id9TPGqT
Subject: [Buildroot] [PATCH v1 1/1] package/go: bump to version 1.21.0
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
Cc: Christian Stewart <christian@aperture.us>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Go 1.21.0 is a major release of Go.

https://go.dev/doc/devel/release#go1.21.0

Set GOTOOLCHAIN=local to disable the new toolchain download feature. This
feature, introduced in Go 1.21.x, will automatically download pre-built compiler
binaries from Google for the toolchain version specified in go.mod. We do not
want this in Buildroot as we build from source instead: set GOTOOLCHAIN=local to
disable the feature and use the locally built toolchain.

https://go.dev/doc/toolchain

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 2298534d91..2289442a72 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  2c5ee9c9ec1e733b0dbbc2bdfed3f62306e51d8172bf38f4f4e542b27520f597  go1.20.7.src.tar.gz
+sha256  818d46ede85682dd551ad378ef37a4d247006f12ec59b5b755601d2ce114369a  go1.21.0.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fc1d9ed681..04aa612256 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.20.7
+GO_VERSION = 1.21.0
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
@@ -28,6 +28,7 @@ HOST_GO_COMMON_ENV = \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	GOMODCACHE="$(HOST_GO_GOPATH)/pkg/mod" \
 	GOPROXY=off \
+	GOTOOLCHAIN=local \
 	PATH=$(BR_PATH) \
 	GOBIN= \
 	CGO_ENABLED=$(HOST_GO_CGO_ENABLED)
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
