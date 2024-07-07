Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE51DC3DA44
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 19:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37DC1402B2;
	Sun,  7 Jul 2024 19:44:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrV6nh2PRwRP; Sun,  7 Jul 2024 19:44:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 030D940348
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 030D940348;
	Sun,  7 Jul 2024 19:44:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B4B11BF3FC
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 19:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 35454400B8
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 19:44:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0VyR1x9YAZs for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 19:44:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFC12400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFC12400AC
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFC12400AC
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 19:44:49 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab63so4709192a12.3
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 12:44:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720381487; x=1720986287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yPDkcsIkHcRw4F+Al7TxfdqyrbWKKd9xx944ZMi+QtM=;
 b=TcZJTQ64XISKqb4owiyFYAo2duoZ+4WedUPeFd+mRsSOE7FOJr5pFOI9Q//J3Fspp9
 qZALeJUHb+rj4nS388d1EQtHiAFF7PA/AxhzPkRoYLQxLXGSowfR5DCCJVSs1U9jpPvW
 q88lPoOLM8n5RYwvFNEUoUb3xA1vvRiWHUGeG9BJFnCGP/+xGq6ZcH1PTtzCws1Pu+jV
 AaJkr3Rm7CetU4dfJtmjrtM4FS/l8Nvef5sy7tz3gdsR1fxcyv1QsZqt0FxpPjQmlLpc
 fZ6UX/fQJs3VxtaQYaeNpDHLl+SaHurc6g0wrmsgJtaD8ZfZGsdJUuFfjIMjT5v+QTsJ
 FFNA==
X-Gm-Message-State: AOJu0YwI52XjlyLyGYKvY3dt7JY529DYk/6av+QVRJtL+SrWJtbhanMN
 OhqwhIT37BKDu4qEjJh802JFBiSpv6bsxmozGqoBAh7cGUz5ACzTgSIRfD+zwCUKrgUDxHE6Btf
 ONVo=
X-Google-Smtp-Source: AGHT+IHzrzTtS3aRb113zE1nJyxKG+v82vdOa97iZMojchNcg+cNhhUWaEoP587LocTWkMbsxJ4diQ==
X-Received: by 2002:aa7:d5d6:0:b0:58d:703b:c1d5 with SMTP id
 4fb4d7f45d1cf-58e5cd151b2mr5488147a12.38.1720381487389; 
 Sun, 07 Jul 2024 12:44:47 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58dfd5aeda6sm4764325a12.78.2024.07.07.12.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 12:44:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 21:44:39 +0200
Message-ID: <20240707194439.371088-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720381487; x=1720986287;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yPDkcsIkHcRw4F+Al7TxfdqyrbWKKd9xx944ZMi+QtM=;
 b=liztdi2zW0gxJLroCIPCQInFUlRfKNy5xse2/JyRIq2pmKvum3hodeBwrLhf2TKcg0
 epepM5bQTAfLkdi5RFXqZPBwRdqGMQPjAjf5+J3MNgFv7wOEE5ZGpLcLb3lHk4gbuPBK
 AXHv+6e7Y9FYFvlxRvz3ail5AFftVQEvgS17k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=liztdi2z
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: fix patch fuzz
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, qt5webkit fails to build with output:

    Applying 0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch using patch:
    patching file Source/WTF/wtf/glib/GRefPtr.h
    Hunk #1 FAILED at 29.
    1 out of 1 hunk FAILED -- saving rejects to file Source/WTF/wtf/glib/GRefPtr.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...Remove-invalid-g_object-declarations-to-fix-build-wi.patch | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch b/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch
index 48605e4fe4fb..e3a1faec9c90 100644
--- a/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch
+++ b/package/qt5/qt5webkit/0004-Remove-invalid-g_object-declarations-to-fix-build-wi.patch
@@ -8,6 +8,8 @@ g_object_ref_sink is defined as a macro meanwhile and so the build fails.
 Just remove the declarations, glib.h is included anyway.
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 [Retrieved from: https://github.com/qtwebkit/qtwebkit/pull/1058]
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Source/WTF/wtf/glib/GRefPtr.h | 3 ---
  1 file changed, 3 deletions(-)
@@ -17,8 +19,8 @@ index 06133d82cb35..d9a1d2f145f5 100644
 --- a/Source/WTF/wtf/glib/GRefPtr.h
 +++ b/Source/WTF/wtf/glib/GRefPtr.h
 @@ -29,9 +29,6 @@
+ #include <wtf/RefPtr.h>
  #include <algorithm>
- #include <glib.h>
  
 -extern "C" void g_object_unref(gpointer);
 -extern "C" gpointer g_object_ref_sink(gpointer);
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
