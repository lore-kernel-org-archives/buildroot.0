Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE5BC433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 16:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A336840898;
	Sun,  9 Oct 2022 16:00:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A336840898
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OEkg_oHWVZXl; Sun,  9 Oct 2022 16:00:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A64408C4;
	Sun,  9 Oct 2022 16:00:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A64408C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 068191BF239
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5D0E60615
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 15:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D0E60615
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zy_uKdWHUPXP for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 15:59:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6ACC6605EC
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6ACC6605EC
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 15:59:50 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y5so13504713lfl.4
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 08:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a59czhMXyJr1Y9kV+Qwd9lj8rIsbnQVzlsH87WPHvLo=;
 b=rCOgxuXf2AlybzGkUs9DXG6g3fHnqpb15DF/P4GH9Cz7lK+pSkudnZ9pMYNa3xLQgq
 3+FwYvzm7ftwSYmBfnEhmcMLanEm6cTdwhAuB7qvEK+rtNi17+LYNmy3b2M2z4sA+1IS
 jqoK2B6PdlJi64B1WN60zYgU8t3JWy0a67j5kgZgfVvur3kddhpjuvOHK3UD0umK1nBi
 ND49YE+IJv+11GBl76ubuNUp7p2xiyzaonNkGi3ZmiWEk04no8SbPDfhVMZWrrf5xpJf
 b+2Oy5hMfZ7EarRzFh5PFI17OeEXBy6ECzCVksy3RZJdfCJHC2fFsiiGP3QOQexhSB4q
 KQuQ==
X-Gm-Message-State: ACrzQf34EVu3kISCwz9vW6f/pJNiPUYLGj80sofshq+8nspF1n+hQd7W
 9puxN1G6x2pVGjq6NZqY6F4pqPym9MU=
X-Google-Smtp-Source: AMsMyM4IklnKV+UuF2OE9/t/o/+Vj09zxmOQ35aXpfVY1lWMQkpdhqrPeVQ8nW9K++zANVQtTlzfQw==
X-Received: by 2002:a05:6512:6d4:b0:4a2:5045:db6a with SMTP id
 u20-20020a05651206d400b004a25045db6amr5555775lff.199.1665331188192; 
 Sun, 09 Oct 2022 08:59:48 -0700 (PDT)
Received: from luthien.lan ([98.128.186.104]) by smtp.gmail.com with ESMTPSA id
 k11-20020a05651210cb00b004947a12232bsm1057918lfg.275.2022.10.09.08.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Oct 2022 08:59:47 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Oct 2022 17:59:31 +0200
Message-Id: <20221009155938.2041695-4-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221009155938.2041695-1-troglobit@gmail.com>
References: <20221009155938.2041695-1-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a59czhMXyJr1Y9kV+Qwd9lj8rIsbnQVzlsH87WPHvLo=;
 b=ICLO23+EKrcYo7shN8ye6uVgLWQnMFcKnkKeg/uecuE5g38LuUv9fzjl6cCoZ+HSyF
 IBwhSJXf5hPwRs2eGiwi7yPWsqbVYZRmpyjO+bwNQR8z29E8wsWBiNzaExP8zAEaLDcs
 HpgGvnYiVa87IuBFhc5rmOZJLymFBCJQQoWnY0n/BPcJwA7O3KqiVGdIY7SyRi3rPPXi
 C9vhDDEdM/jweEbRNIjIoemTA9upBnTlPHZhtrPMEIm0/bHf1xbRkj9k+yqn7rVknwNp
 QHsondmNI2az72DajkCDHHjueNZmCXNrWAQ6bRxBkddYBz4kvidUMBsthTrXVa+rj00i
 xOew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ICLO23+E
Subject: [Buildroot] [PATCH 3/9] package/execline: bump to v2.9.0.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Summary of changes:

 - skalibs dependency bumped to 2.12.0.0.
 - New options to wait: -o to wait for one of the listed processes,
   and -a to get the default behaviour.
 - wait now exits 99 on timeout.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/execline/execline.hash | 4 ++--
 package/execline/execline.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 706b131afd..1d72e2cb49 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  a373f497d2335905d750e2f3be2ba47a028c11c4a7d5595dca9965c161e53aed  execline-2.8.0.1.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  01260fcaf80ffbca2a94aa55ea474dfb9e39b3033b55c8af88126791879531f6  execline-2.9.0.1.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index c348d924b7..38f4570ba4 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.8.0.1
+EXECLINE_VERSION = 2.9.0.1
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
