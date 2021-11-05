Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D9BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 02:31:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD95861108
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 02:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD95861108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BAE481B8A;
	Fri,  5 Nov 2021 02:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gCY7VaMsb1Kw; Fri,  5 Nov 2021 02:31:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00FC381B98;
	Fri,  5 Nov 2021 02:31:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C41EF1BF2B3
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 02:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1846405BC
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 02:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvfxOj4VM4pp for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 02:31:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 964634059E
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 02:31:49 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id n23so7110035pgh.8
 for <buildroot@buildroot.org>; Thu, 04 Nov 2021 19:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4836mh6GGZVBy0wVGFGWH2ggeQTAP7fTX+r5BCSltmA=;
 b=5tjJvC/pePwY1UpYkYVoOWMmAaboj8+Y5MoXcgJ2uLljwkpQ16Jl6Z7lUQKN0k2s6I
 iWIhuxp7wf3HbzDXfmBqv18WYp7iCM27opV7K8wRZxoa6iJLGcMjw/6Htleq/1sbeHuV
 mZkUQ/10ga0QrZ//jT5vrYDeLEMIFCRg5JgusMSp7rLbFgc9SktKRm8Cbf9KETOurRw5
 7hpNlb5a6RwHhkh6B9y7YTqSnhmTM15voO/4rHD9F4PrWFjaVUTCjg/yivdJowm8ETIG
 OZBb/QemKAMrLRewYhi7ieAKVaQ0cvMpCUfYRKyAuopNkCMPl/JGB3gLxqSdxeUu0pKT
 mASA==
X-Gm-Message-State: AOAM530CWYeI6cgZPT1Vplg0XasoHQ3iVmW81jegFtDUO5q58iUTYPag
 GuJsPudi2DDsL0QCWHsXE5wdnB//RUZncQ==
X-Google-Smtp-Source: ABdhPJykUJRQNb1aoulfKVE5SsNLE137NwlBtkrRFhNaRaoTp9ylpgbgIDd1bXc6SFN4pvHyrR2ZQQ==
X-Received: by 2002:aa7:8d17:0:b0:44d:3593:2c1a with SMTP id
 j23-20020aa78d17000000b0044d35932c1amr56427182pfe.3.1636079508846; 
 Thu, 04 Nov 2021 19:31:48 -0700 (PDT)
Received: from localhost.localdomain (ip68-111-8-11.sb.sd.cox.net.
 [68.111.8.11])
 by smtp.gmail.com with ESMTPSA id k73sm4816069pgc.63.2021.11.04.19.31.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 19:31:48 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 19:31:45 -0700
Message-Id: <20211105023146.22275-1-christian@paral.in>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.3
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

go1.17.3 (released 2021-11-04) includes security fixes to the archive/zip and
debug/macho packages, as well as bug fixes to the compiler, linker, runtime, the
go command, the misc/wasm directory, and to the net/http and syscall packages.

https://golang.org/doc/devel/release#go1.17.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index f5e6492da7..9031c33d8a 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  2255eb3e4e824dd7d5fcdc2e7f84534371c186312e546fb1086a34c17752f431  go1.17.2.src.tar.gz
+sha256  705c64251e5b25d5d55ede1039c6aa22bea40a7a931d14c370339853643c3df0  go1.17.3.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index f8bea45c08..59177e54db 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.2
+GO_VERSION = 1.17.3
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
