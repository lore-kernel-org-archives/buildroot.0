Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BB3C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 23:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E92460F94
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 23:48:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E92460F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E55A60B43;
	Fri,  8 Oct 2021 23:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HlJuz8-DNkWk; Fri,  8 Oct 2021 23:47:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F10160B42;
	Fri,  8 Oct 2021 23:47:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D2E61BF4E4
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 23:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4991A4064F
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 23:47:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TYupUhMGmy0k for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 23:47:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BED2404A4
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 23:47:56 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so8937875pji.2
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 16:47:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ro0NnkUIS9hEk+nbCPBdytUeNzaEg5TFJxbGSR2KGeQ=;
 b=mjwXjoonAaj9Cr8OyFBgg8ut5nV+rB+jqqapR0NzbKlUhggPVv5aA/ZzBtQjqDTAAe
 i4WCUDHFm5113k1Ubg+MYigh21DDO1t5R6PwOUtpS1e1eL4pzX6d+tkc4piBYrJDtS3o
 Luho/NwxYuXdb29KwNww4xAX4OHN++asVNf5ort8gzu2hS87ZRefbdV9TPtT5bY951Vq
 Y/1wL/v5n1GCOIUSZhNT5PIpLXcMqJJ4IdSttLX6vh/b44jhGMWbkYPwzj29wfionrQd
 SjhDWjmz99FsqdbQC0pQjgPw8MhD1ylyTFZgV3hS2LnEvqi5oGFCQJKZGGtjaxyJlnKy
 GPdw==
X-Gm-Message-State: AOAM530MuRf7K/lY18XjWuFY9JfND6iIhDvGMBiGnwSH8UWXzD6bPWBk
 Orp6/RuJY/TkGZ4HKAhByIutL4UaVgOe/Q==
X-Google-Smtp-Source: ABdhPJw4DitGdl+U9XBplIOIwqDVCUibh+GgYqkkBBpR0PZh5kyCg7VOi4/NrldDZgMTBjkHhC10Bw==
X-Received: by 2002:a17:903:234a:b0:13e:f01a:24f with SMTP id
 c10-20020a170903234a00b0013ef01a024fmr12053565plh.43.1633736875721; 
 Fri, 08 Oct 2021 16:47:55 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id a22sm364098pfg.61.2021.10.08.16.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:47:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 16:47:52 -0700
Message-Id: <20211008234752.92158-1-christian@paral.in>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.2
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
Cc: Christian Stewart <christian@paral.in>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.17.2 (released 2021-10-07) includes a security fix to the linker and
misc/wasm directory, as well as bug fixes to the compiler, the runtime, the go
command, and to the time and text/template packages.

https://golang.org/doc/devel/release#go1.17.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 9560eae30b..f5e6492da7 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  49dc08339770acd5613312db8c141eaf61779995577b89d93b541ef83067e5b1  go1.17.1.src.tar.gz
+sha256  2255eb3e4e824dd7d5fcdc2e7f84534371c186312e546fb1086a34c17752f431  go1.17.2.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 8e68dc3711..f8bea45c08 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.1
+GO_VERSION = 1.17.2
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
