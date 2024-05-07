Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C277C19F4F
	for <buildroot@archiver.kernel.org>; Tue,  7 May 2024 21:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2109E60B71;
	Tue,  7 May 2024 21:42:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t-5fIrjECREo; Tue,  7 May 2024 21:42:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17F5460B73
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17F5460B73;
	Tue,  7 May 2024 21:42:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44F081BF36B
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 21:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31C424178C
 for <buildroot@lists.busybox.net>; Tue,  7 May 2024 21:42:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gk7UbYcSVjr7 for <buildroot@lists.busybox.net>;
 Tue,  7 May 2024 21:42:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 237B7400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 237B7400AF
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 237B7400AF
 for <buildroot@buildroot.org>; Tue,  7 May 2024 21:42:37 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1ee954e0aa6so6933665ad.3
 for <buildroot@buildroot.org>; Tue, 07 May 2024 14:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715118157; x=1715722957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LCT4mW0mUsqoeolSRz6YZZqJI4mdBoUJOOsRvE/ULLQ=;
 b=QCLEaneXNoYhSz7DI8pXUesdaPzEij1jbE+LOm++AZXLW1CG/piPNIbB/uxf9kopdy
 jY+GV9kcG3W2YN467LYm2pcScz+DumFwE4XjcYhGsVB2C6Ee0jkrG28FZcH3RU0uKCXh
 Hspeb7OzwfV7uEMYT84PZkuRoT4inlP7/vcYr94bu11ZLDg6qGJ1eX0mwU0fLWxi0wPt
 yugVZ7kLsSyCeSvumNYWc6lr5QwrSdvfr/iCMx8HAuq/l5FgWmYpQjIgTzSGhzUKrp7p
 WGKcBMDRiFMbzcEdCr8e6CfTdFNPUIlQzAua5j7HU0kfrIne5J2pX01b3Sk1K8G9I5jT
 j/dw==
X-Gm-Message-State: AOJu0YxtHSNtoe/AmoCqWa7UdMIbbSxVyIsrgThV5EKWIizB+Qef2zrF
 DIThUyscISjnXdunVi9CApnpApTCzFo7wiQuyh5/VjxOLKy/GaK7PkdAuiIk28iDHzGe3tuFmQ8
 0
X-Google-Smtp-Source: AGHT+IG7I4nIQipOkF4yxNSUfE7u8/rgy56su5MojPboPWk/t+dfzZ4Tzgvc8Mo6VAQreR8zlSjNkA==
X-Received: by 2002:a17:902:daca:b0:1e3:c4c2:efa9 with SMTP id
 d9443c01a7336-1eeb059745emr10689165ad.31.1715118156964; 
 Tue, 07 May 2024 14:42:36 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d10-20020a170902654a00b001e435350a7bsm6818402pln.259.2024.05.07.14.42.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 May 2024 14:42:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  7 May 2024 14:42:34 -0700
Message-ID: <20240507214234.94186-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1715118157; x=1715722957; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LCT4mW0mUsqoeolSRz6YZZqJI4mdBoUJOOsRvE/ULLQ=;
 b=wO6eYDylf8fGEwEUb0qEfB1QyVIiopV03VqOPPdJbilx0JHGl8og6nBYUQY6/vrAGz
 GCqWIpMQ5qq2G0s21ZJ1PPO4pmMegfUMYJYDj1tn+PLrEBunabmVNSZxo31AosjwF1/G
 rqIes/TjGIRs61AllAqpumMj9YzK5wBv7VHaBs3hoqv1cOQ2kEAasQPjFUc6Rxygw8Ag
 7/p6fyGAAFu38DCJgrADW/P0eyztCX+DWWnIM/o9U0Z72+yOks+WcRqJmr87hp7lR1ll
 RAjWGIFNdzeL4TzGtjJAW5O8YjzJuC7CMbfMfmkrHTtIf98zFaHFGcqRy68VsStr0Z9R
 p05g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=wO6eYDyl
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump version to
 go1.22.3
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

Fixes CVEs:

CVE-2024-24787: cmd/go: arbitrary code execution during build on darwin
CVE-2024-24788: net: malformed DNS message can cause infinite loop

https://go.dev/doc/devel/release#go1.22.3

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 81bd14baa8..6bbde5b589 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  374ea82b289ec738e968267cac59c7d5ff180f9492250254784b2044e90df5a9  go1.22.2.src.tar.gz
+sha256  80648ef34f903193d72a59c0dff019f5f98ae0c9aa13ade0b0ecbff991a76f68  go1.22.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 0e39ad9f8c..43dfe1eae5 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.2
+GO_VERSION = 1.22.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
