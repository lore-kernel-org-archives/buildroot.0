Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF70C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 12:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0750284141;
	Sun, 18 Sep 2022 12:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0750284141
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TBrli3p0DSp2; Sun, 18 Sep 2022 12:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A4DE83F87;
	Sun, 18 Sep 2022 12:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A4DE83F87
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8ABBB1BF228
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 725F660E3A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 12:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 725F660E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YrOxHWw1MO2c for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 12:22:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A35D60E25
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A35D60E25
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 12:22:42 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id r7so1946787wrm.2
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 05:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=0L7Mep15GiFaB+S03PXAMhY7AAVMxhZAbgNt5mBRhA4=;
 b=1M9ZdHflNpEA/kXv3b/aNQkeGi+B8NegBrg5IkJPH9nRs07sVjznpU2WK1Pso2jBC7
 ox7riX0uKT8en1JPpJP2WvVnOAM6aLLm9wBUJgsTRuyvr4VP8T8Bd0dtN/KCJI4+VtVt
 EZb3/Hu3GpvEXPrRXSuUDmmKGcajENEN/dgb8Ljme09LxTgJRMxZG5phnQfdJqgKcMGb
 jN0t+bnYtqKtjkklRtGbutCJ6GNxzw9eSrlL+zcwQEXoXIi3l8rROOcTfabipnbhv4SU
 HIPDgqplZfHtmL3JA4htMSJzNhmtIvt3MGoYxpMxE/wG63sOWhi6/xCkIJu0Oxowlt/G
 rdZA==
X-Gm-Message-State: ACrzQf3fWIqwJ0jLW4wXxHBKzhmVURjvWr/qgrwWmN3beDQDtpjJNOmb
 h0J00lrSxloUUWPdkW7ZSL7BF/xQHIbBSefmGwI=
X-Google-Smtp-Source: AMsMyM5SrKkpC66bPs4ZtE9tIkGcjsfuTDOnHI5zvkoLo7u6ZwjY85t3UfrNesHdfn6EzsPzox+PSA==
X-Received: by 2002:adf:d1e1:0:b0:22a:cd3e:e98b with SMTP id
 g1-20020adfd1e1000000b0022acd3ee98bmr8363235wrd.510.1663503761197; 
 Sun, 18 Sep 2022 05:22:41 -0700 (PDT)
Received: from arnoutx1.. ([79.140.217.34]) by smtp.gmail.com with ESMTPSA id
 z17-20020adff751000000b0022afe4fb459sm559876wrp.51.2022.09.18.05.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Sep 2022 05:22:40 -0700 (PDT)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 14:22:39 +0200
Message-Id: <20220918122239.189147-1-arnout@mind.be>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=0L7Mep15GiFaB+S03PXAMhY7AAVMxhZAbgNt5mBRhA4=;
 b=VbBlpw1f4P2fmgPiGWgnixz2No8ivDYLNPjD/VVPBE8MwmimzV2ZWgn0bLzwd044yE
 CSw2eZ0vx7kXM8ynHhvCIbJjvIRA2oYN0OXAQ8Fbp7c0OQY0ZxO0IWceLYFYmsnB6Bmq
 xWvu0r0NsZLB/nBRTcvGEychTcCa04lYgtPAbXPIr4J7d0p3IQRoatgLbIs+Uw8a3NOR
 yxRE0Zzh2PWPVQRuIQI88Kajop7NZxLaGL4qm6cr3MmJcc8V2YDu9f2I3Zk69ppWKEQ4
 LGYnIARySObVUbfvADdt+v7AiqF6K2awYpxp0nzyoXh2AWHGw6RfglMEgn+Q9rTdUr7E
 USEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VbBlpw1f
Subject: [Buildroot] [PATCH] package/pkg-golang.mk: add osusergo and netgo
 tags in static builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CGO (the Go language C bindings) normally links dynamically with the C
libraries. It seems that passing -extldflags=-static is not sufficient
to make sure they link statically. As a result, a build using CGO will
fail with

runtime.gcdata: missing Go type information for global symbol .dynsym: size 72

There are two modules in the standard Go library that can use CGO:
os/user and net. Both of these have pure Go versions, however, which can
be selected with the osusergo and netgo tags. Since these two are
standard library modules that get used in almost all Go programs, pass
those flags in the common infrastructure.

It's not entirely clear if this is always the case or only depending on
the specific way CGO is used. In the former case, we could instead
disable CGO globally if static libs are enabled. However, it turns out
that this doesn't solve the problem completely anyway (delve still fails
to link, with different errors). Also, it is possible that other cgo
modules do still work. Therefore, just stick to adding the osusergo and
netgo tags.

Fixes:
 - crucible:
   http://autobuild.buildroot.net/results/c2f/c2f29f55b461899e8e15c0494578304e6f74bf51/
 - containerd:
   http://autobuild.buildroot.net/results/699/69910fc6b9f474a7eb0ca7ffa27ac5512cc1bb37/
 - delve:
   http://autobuild.buildroot.net/results/552/55225d5da17e85271943f7adce6f07d014d9717d/
 - probably others...

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-golang.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index 0b3dc3d32f..a4fc353e78 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -100,6 +100,7 @@ ifeq ($(4),target)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 $(2)_LDFLAGS += -extldflags '-static'
+$(2)_TAGS += osusergo netgo
 endif
 
 # Build package for target
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
