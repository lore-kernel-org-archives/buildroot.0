Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8259C001B2
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 20:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC34820C5;
	Thu,  8 Dec 2022 20:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC34820C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MH_my6-6b6XS; Thu,  8 Dec 2022 20:21:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2820D820B0;
	Thu,  8 Dec 2022 20:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2820D820B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F3C621BF591
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB6EE401B7
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 20:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB6EE401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rtl971ebLYpv for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 20:21:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B28BD400FE
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B28BD400FE
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 20:21:10 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 n9-20020a05600c3b8900b003d0944dba41so1930968wms.4
 for <buildroot@buildroot.org>; Thu, 08 Dec 2022 12:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PjpGCts08b2e1hEXQgip7HtFGnvKYOz22dh2HoqEweI=;
 b=pajIka+i9MICy1zCSYv+d3D90n9ovpAPSNwBDcytqhGs4wmsZU7mwCfS86vjWpJQ2j
 iDbGoUZ3bqUjq2+FfTK3ct14p9a+hXdUtdOx9GPNpJzQ2hRJBRUdO44uRp+vhF8zjoR5
 3ud6EDpKQCu8JnUG16D3RU+t4NOKOjFReMKYOATna1NvXYJ7RpvWjT+QlfvjGY1/hdNK
 UlrTk1ag2FgzvIbQXET6DEImMPRluqAevfYQbjB+oMUoXvgDRvmYtRhw2X5fSoHEx1In
 LUWgovXVrNRgh+QB/QrijNBF3AmrXrU2f8n3T4Hgf6y5PdbsqJx9SKLRWMj/jG7TKCBI
 CvUg==
X-Gm-Message-State: ANoB5pmeq/EzIeXQgAe1mTnJfeGtuN4QMT7BNDe4QnQavhutZ5a3Hd5u
 H49Dxp23Xtfltp3rg5stwtJiB2KTZmQ=
X-Google-Smtp-Source: AA0mqf7C3A4EmY5C6UhAmLdz0tjPby1z8Z93MRm5kiW6oZAuyXKtjqxmvXC9bIQuhC5LxPqt25ga5g==
X-Received: by 2002:a05:600c:3d8c:b0:3d0:7fd2:4756 with SMTP id
 bi12-20020a05600c3d8c00b003d07fd24756mr3090625wmb.8.1670530868334; 
 Thu, 08 Dec 2022 12:21:08 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c1c0a00b003b49bd61b19sm7021367wms.15.2022.12.08.12.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 12:21:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Dec 2022 21:21:04 +0100
Message-Id: <20221208202104.3041-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PjpGCts08b2e1hEXQgip7HtFGnvKYOz22dh2HoqEweI=;
 b=GC3R9n28q6fSfawM6ujJLHDrNkwLqi1jcGivioaq9DljleTwyM7V5aAmZoBi3kH1TH
 9ftlSVT6WGAuPTZvaANyaVZ0RQYgFoBwYhwDZ6uYMPfDdQyijxQuXoug3t0UEzFAoph6
 XaFdM0JjyIGMKBe5Y5hx1cM5URFg8sJCCVvsPOIXljOaPSIqQo7x1IVcqkQD2TyH2NE/
 kl1qNGZshJJ7FWhtJivtUlS76yTkADoJc604JP88VoNh44JrPelU2QnLY39s09eeciI+
 NFXOccMInpUKzdQGkiqN4GMJ8wYO87adlydwL9YxLh4WQ2XeQj8PvzzsFSHTeUi7vQuO
 QbJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=GC3R9n28
Subject: [Buildroot] [PATCH 1/1] package/capnproto: security bump to version
 0.9.2
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2022-46149: Cap'n Proto is a data interchange format and remote
procedure call (RPC) system. Cap'n Proro prior to versions 0.7.1, 0.8.1,
0.9.2, and 0.10.3, as well as versions of Cap'n Proto's Rust
implementation prior to 0.13.7, 0.14.11, and 0.15.2 are vulnerable to
out-of-bounds read due to logic error handling list-of-list. This issue
may lead someone to remotely segfault a peer by sending it a malicious
message, if the victim performs certain actions on a list-of-pointer
type. Exfiltration of memory is possible if the victim performs
additional certain actions on a list-of-pointer type. To be vulnerable,
an application must perform a specific sequence of actions, described in
the GitHub Security Advisory. The bug is present in inlined code,
therefore the fix will require rebuilding dependent applications. Cap'n
Proto has C++ fixes available in versions 0.7.1, 0.8.1, 0.9.2, and
0.10.3.

https://github.com/capnproto/capnproto/security/advisories/GHSA-qqff-4vw4-f6hx
https://dwrensha.github.io/capnproto-rust/2022/11/30/out_of_bounds_memory_access_bug.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/capnproto/capnproto.hash | 2 +-
 package/capnproto/capnproto.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/capnproto/capnproto.hash b/package/capnproto/capnproto.hash
index 7fd0e6158b..c3233e7c8b 100644
--- a/package/capnproto/capnproto.hash
+++ b/package/capnproto/capnproto.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  daf49f794560f715e2f4651c842aaece2d065d4216834c5c3d3254962e35b535  capnproto-0.9.1.tar.gz
+sha256  4fe1ca8ab90859f33f08d2c4fcd7099e2983b0b946beecebd2fe051e3a64c67e  capnproto-0.9.2.tar.gz
 sha256  9564998c8d7f270a61a8b89869a8d17a9d5e3783b64027788b5e339ec8479e10  LICENSE
diff --git a/package/capnproto/capnproto.mk b/package/capnproto/capnproto.mk
index 7fc07043fb..23f128455a 100644
--- a/package/capnproto/capnproto.mk
+++ b/package/capnproto/capnproto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CAPNPROTO_VERSION = 0.9.1
+CAPNPROTO_VERSION = 0.9.2
 CAPNPROTO_SITE = $(call github,capnproto,capnproto,v$(CAPNPROTO_VERSION))
 CAPNPROTO_LICENSE = MIT
 CAPNPROTO_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
