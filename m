Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA45C4332F
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 22:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2EE5415AB;
	Tue,  1 Nov 2022 22:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2EE5415AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZPeHSfR_34l; Tue,  1 Nov 2022 22:15:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A11F441061;
	Tue,  1 Nov 2022 22:15:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A11F441061
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 188F61BF3E8
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7DD060E2F
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 22:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7DD060E2F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a9925uT0zf2J for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 22:15:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3650560D70
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3650560D70
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 22:15:41 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id q71so14625024pgq.8
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 15:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q+PGGq7M1cXa+U9NdDvudx6ocQQsp+2SWwle4UN8NDI=;
 b=Wt6K4DU9lyj5tMC1YG536fxdJqTJSPqtsiteJXvJIJqCTjoW/NxU63HihZfCh4gzY4
 /DAPU+/0K3WSCWW7oJiXNUNI2jaf0zZpIXEwvx5WFXqI1WsrhNDu/jIn8ltuHrEqjadt
 8TlAiKAbz0AeWNwSCH8sbqjlshi3ACe/buVLccDbb7cPhPmDhOqZAlL3y0xHZHaBd9uz
 7lYvy4M8HQ3fWQW11zYtV2FzBH3sua76PR4BBgxb5GIsIs9HA8E+tATkL/nWGTfRUoxb
 3lxcDWkp8gVL4pWqx/6207agGbTGIcyKKtVZlkwg7e4vUWC4ZMT519L+/7UYfOfDwTMj
 BNdg==
X-Gm-Message-State: ACrzQf1KS1nZVVIryVVlftxerf0UyiwulB9rPm27F4RfL/PvuZod1cs/
 nM0Y7pz2rzCn2T0KTcWnUO1gU4VAV4VQpA==
X-Google-Smtp-Source: AMsMyM4h/vg3IcgXHXcUTOtCn3LI4Rf3hCnEzisJvEQroqafObieVWgABRjwDvEec1XRZFv3aZAwdQ==
X-Received: by 2002:a05:6a00:21d4:b0:56c:3ebf:2174 with SMTP id
 t20-20020a056a0021d400b0056c3ebf2174mr22343117pfj.53.1667340940189; 
 Tue, 01 Nov 2022 15:15:40 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 s20-20020a63d054000000b0046f73d92ea5sm6262001pgi.90.2022.11.01.15.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 15:15:39 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue,  1 Nov 2022 15:15:37 -0700
Message-Id: <20221101221537.15506-1-christian@paral.in>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to go 1.19.3
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

go1.19.3 (released 2022-11-01) includes security fixes to the os/exec and
syscall packages, as well as bug fixes to the compiler and the runtime.

Fixes: CVE-2022-41716

NOTE: this CVE is specific to Windows and is not directly relevant to Buildroot.

https://go.dev/doc/devel/release#go1.19
https://github.com/golang/go/issues?q=milestone%3AGo1.19.3+label%3ACherryPickApproved

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index f944bd5304..c2a7321634 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  2ce930d70a931de660fdaf271d70192793b1b240272645bf0275779f6704df6b  go1.19.2.src.tar.gz
+sha256	18ac263e39210bcf68d85f4370e97fb1734166995a1f63fb38b4f6e07d90d212	go1.19.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index fe4d3a29a9..fd4caa2e5a 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.19.2
+GO_VERSION = 1.19.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
