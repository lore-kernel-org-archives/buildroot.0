Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF29C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 13:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73FFC4069D;
	Sat,  6 Jul 2024 13:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMZXXpfziMxB; Sat,  6 Jul 2024 13:57:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 320F64069F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 320F64069F;
	Sat,  6 Jul 2024 13:57:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ACD51BF2FD
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 13:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13F68402C7
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 13:57:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uq_9yMfJXaK for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 13:57:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B8FE740131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8FE740131
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B8FE740131
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 13:57:38 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ee7a1ad286so26370251fa.2
 for <buildroot@buildroot.org>; Sat, 06 Jul 2024 06:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720274256; x=1720879056;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=C0QAPl+iWJcSed2WxXl6pa7q0EcifYNDbpcGKcOI8WI=;
 b=B7sHLhuI9SOV9o5Z33d+gEIk0I4Ir/Cx2AJ9zFNxZRQ9LsSpQXMm8e3J00erURvGLu
 GZh1GfdRlsmuMvFcxWhVfFJ6ys3Xumla2x+bpDt59RJxoHILeVgGks/6+/k2jhYG/Q6X
 DfdSYjP6b5LHFbsoAo35di3j4AEkonMa4+bZ4eSqhtW5vLT3lobjSGutAhRt7v0/KUaq
 FMZfGrAOPAUw/UourU3YkOrQd5dIlFBam9GTUYkRBFBHTW0vI+FtHVq3UwlbpCqz1Ieg
 BMUMKWbQUwSLVeNfaNXDPASuLg2sfZzZpFYCptOrhA52Z16Q4QEyI6E1NeJJvekuyUBh
 gGGg==
X-Gm-Message-State: AOJu0YzT2qoBaW1JKLjve7tbJQnRh5f2C1QhvzIyPR3zwdv7kzViPGob
 E3SdGsMDfjsL4lqP0dNPS3g81+O2Ek4lUY0aZs8hJ2PB3v7Nh9LJLmO2U9MM55w8NuuEp3RM4vn
 shwg=
X-Google-Smtp-Source: AGHT+IFmKn38vo6jN2kYglEVKtG02JT84ty3TAkxJbSHJn4RyRS301Qzz1Uq5C2vPJrfeBQBJt7qfw==
X-Received: by 2002:a2e:7317:0:b0:2ee:594d:f54b with SMTP id
 38308e7fff4ca-2ee8ee13d0emr49884161fa.47.1720274255975; 
 Sat, 06 Jul 2024 06:57:35 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324dfaasm11100797a12.32.2024.07.06.06.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 06:57:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jul 2024 15:57:31 +0200
Message-ID: <20240706135731.3598621-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720274256; x=1720879056;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C0QAPl+iWJcSed2WxXl6pa7q0EcifYNDbpcGKcOI8WI=;
 b=jlv7KQnsOebfkiemiAHcW77RS0scradql/HpNIKnPR5SLWYgY9oyttzoXNaFBuL6PB
 oO4hdeA1MaqJ67O/3yHbJDKX4+T2DWLBeGBIsPa9s6i2nSyVkQiK2gDkhxNGKjoQUGZJ
 7163CHT1VkhS0hYw7FGWDUPq7an0fgv1sD7SU=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jlv7KQns
Subject: [Buildroot] [PATCH 1/1] package/dahdi-tools: update the patches to
 be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, dahdi-tools fails to build with output:

    Applying 0002-no-perl-manpages.patch using patch:
    patching file xpp/Makefile.am
    Hunk #2 FAILED at 58.
    Hunk #3 succeeded at 149 (offset 3 lines).
    1 out of 3 hunks FAILED -- saving rejects to file xpp/Makefile.am.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/dahdi-tools/0002-no-perl-manpages.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dahdi-tools/0002-no-perl-manpages.patch b/package/dahdi-tools/0002-no-perl-manpages.patch
index dae1b6c3c0f8..5f24c8199487 100644
--- a/package/dahdi-tools/0002-no-perl-manpages.patch
+++ b/package/dahdi-tools/0002-no-perl-manpages.patch
@@ -6,6 +6,8 @@ so the install step fails.
 Just disable them.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -durN dahdi-tools-2.11.0.orig/xpp/Makefile.am dahdi-tools-2.11.0/xpp/Makefile.am
 --- dahdi-tools-2.11.0.orig/xpp/Makefile.am	2015-12-22 21:19:12.000000000 +0100
@@ -25,8 +27,8 @@ diff -durN dahdi-tools-2.11.0.orig/xpp/Makefile.am dahdi-tools-2.11.0/xpp/Makefi
 -man_MANS		+= $(perl_mans)
  CLEANFILES		= $(perl_checks) $(perl_mans)
  
- if	PBX_USB
-@@ -147,8 +145,6 @@
+ dracutconfdir = @prefix@/lib/dracut/dracut.conf.d
+@@ -150,8 +148,6 @@
  		astribank_allow.8 \
  		astribank_is_starting.8
  
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
