Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BFDC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8609683EE2;
	Tue,  2 Jul 2024 19:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaEK1tfMgjBa; Tue,  2 Jul 2024 19:56:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 146BE83F71
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 146BE83F71;
	Tue,  2 Jul 2024 19:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AAB5B1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5CF160C11
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZzNUTR9AP4Tp for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:56:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2780A606C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2780A606C9
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2780A606C9
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:56:02 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-585e774fd3dso2697661a12.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719950160; x=1720554960;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0r8GW6NPMjkaasjgrnpI3hgignnsnjj+w5LWSisMBAA=;
 b=YHPkV/27323LvAUAdDouOsbhKR2OxLvnH7kCgNE062hZJcNqYyS6BY7qv4OcvR44dJ
 pNVlx6qSXEcY6ePVqRXZE0FNNLSEZKEZXG6dEziP9yltNq1x2qwjFwKO/5/8zShpkiB5
 DaXK6srX78amHiYTbQlXaMyt1xS5IVOk5fgvwyIlkBDi8QG9L+iyhcmAVd1uFvDoAHIk
 PsRyKjZFfxpKcTkG6VlB6l/H1kqNCDKgzIOUexWj9VSV44MwC6gQERqZO+2Gz64VKfWD
 PSIDb3B/y/YneSjtvX2S8s6DpVyr7hiYEQ6uLmkH9oSMUB4DE1tsWBmF0jlo87s89pPd
 2RoQ==
X-Gm-Message-State: AOJu0YyQyP5RyyYFNli8WK909cXMRBbHI639Ebq6Wc76mcU0e0Iu7Ete
 zP8gBIVRERD9Ax7s/9Bkc0XJkrUmJchdmw27ayELnvQGsidETmE3e5JIXjbfBRg5jZWYU+sz26Q
 UC2I=
X-Google-Smtp-Source: AGHT+IEHMI0pWeAeDKMtO9X7Bx/cEv55dCr3wjoenVNXtkx54138knvdk/WfWr4/nbfz4KOn9QFPxg==
X-Received: by 2002:a05:6402:5cd:b0:583:a39e:f469 with SMTP id
 4fb4d7f45d1cf-5879f1c2589mr6241759a12.17.1719950160043; 
 Tue, 02 Jul 2024 12:56:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324fe5dsm6098192a12.36.2024.07.02.12.55.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 12:55:59 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 21:55:55 +0200
Message-ID: <20240702195555.2498129-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719950160; x=1720554960;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0r8GW6NPMjkaasjgrnpI3hgignnsnjj+w5LWSisMBAA=;
 b=ol94SKBvPssabnBrvuZ3+Gb3uMd3O5NqU87NjKDtaK6hd1+GJWB5iXODhQqh4ylrZ9
 cfAO9EYm2h/f2c+DyRWtsEY6lqLwaCDV6l6aTn8PZxnhv+5tJytFiVtTuICF2hXrsm/z
 AWqvLrX+gH27aBd+v2BO6QXR2fC1uBHAy+7+0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ol94SKBv
Subject: [Buildroot] [PATCH 1/1] package/libsvg: update the patches to be
 applied with fuzz 0
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
Cc: Carsten Schoenert <c.schoenert@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libsvg fails to build with output:

    Applying 0001-fix-expat-static-declaration.patch using patch:
    patching file src/svg_parser_expat.c
    Hunk #2 FAILED at 44.
    1 out of 2 hunks FAILED -- saving rejects to file src/svg_parser_expat.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libsvg/0001-fix-expat-static-declaration.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libsvg/0001-fix-expat-static-declaration.patch b/package/libsvg/0001-fix-expat-static-declaration.patch
index 58ef286729f1..1086785d0f0b 100644
--- a/package/libsvg/0001-fix-expat-static-declaration.patch
+++ b/package/libsvg/0001-fix-expat-static-declaration.patch
@@ -12,6 +12,8 @@ Patch based on
 http://oe-lite.org/redmine/projects/xorg/repository/revisions/c4df7951e846e1be718f37f2455696a1d0861f3d/entry/recipes/cairo/libsvg-0.1.4/gcc4_and_expat.patch
 
 Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -bur libsvg-0.1.4~orig/src/svg_parser_expat.c libsvg-0.1.4/src/svg_parser_expat.c
 --- libsvg-0.1.4~orig/src/svg_parser_expat.c	2005-02-14 11:26:26.000000000 -0600
@@ -31,3 +33,4 @@ diff -bur libsvg-0.1.4~orig/src/svg_parser_expat.c libsvg-0.1.4/src/svg_parser_e
 +#endif
  
  static void
+ _svg_parser_sax_warning (void		*closure,
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
