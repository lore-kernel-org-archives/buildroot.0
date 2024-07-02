Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D68C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 742B180AAC;
	Tue,  2 Jul 2024 19:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wvvtyandxeOL; Tue,  2 Jul 2024 19:23:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886AF80AB4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886AF80AB4;
	Tue,  2 Jul 2024 19:23:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2EBA41BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B13E4071E
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F6bPayodICR3 for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:23:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F05094065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F05094065A
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F05094065A
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:23:52 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f3f9so1390581a12.2
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:23:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719948231; x=1720553031;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uc6UauFwS/VUbGslkfeiFjmpwQTib8ZDYlRbPeKDyto=;
 b=b07W2h/aKIO+LFp4neRwfAAZ9NX6ryPeiNGGzUZ2NXyoM3/vXjrTtHN5g1ijOLVlxS
 ZL9LolC4ryqHgBfalSQmAr2wBsPYK7juzTzXel8XoLQdylsSEAkQwzcXAfGEsSQKTbaK
 Kq8YJ/iSx6apldAp2YPT8hkpa6HzbW8c38XLgMpuDnkkFduC4LW3EiWFuWhBdiONPQAl
 aYdE11ZtAlIAx/QnYrkkF8oSVxwA0D0dGw/aRT1GEFacBgiQKHgVb05t+qLW323TWshe
 YxCcUClt2HfSAtkTlXOP8fsrqO7EGj0L7CAU3Kq8BsWi/wKXre6wR90kHN17WbF7xcS1
 YLEQ==
X-Gm-Message-State: AOJu0YwkaLCaJ8vuf0fq8luejHmEIPuyy/q35QbCT9vK4BaNBYYabQiM
 RtVwKSS6tns+FNLUDSF7AVKqt7gFwBC948CjCCUYgkrrTqovuTgO1BEBRQbcyUqt6hrLGT2engG
 +/0k=
X-Google-Smtp-Source: AGHT+IEs38W0HDkZE1MRgIWLXTMEv9toKg3IeI//pIfhGMXgCQvg5jPW/YvYhGESvGgVYR0Kv4kZLg==
X-Received: by 2002:a05:6402:2712:b0:584:8fcd:260d with SMTP id
 4fb4d7f45d1cf-5879eaff67emr6849171a12.3.1719948225930; 
 Tue, 02 Jul 2024 12:23:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58c9061becfsm116696a12.83.2024.07.02.12.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 12:23:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 21:23:40 +0200
Message-ID: <20240702192340.2473137-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719948231; x=1720553031;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uc6UauFwS/VUbGslkfeiFjmpwQTib8ZDYlRbPeKDyto=;
 b=O0KnEkUJX7L/trWnTtisFfCHVsj6tx7/qhWVXfz7gE4deuOKR5B3IxN0MoOMRC9BTE
 DXbAoUQN6V41PHFULGjkhJzmkDuo/eWA8IBnPDiamoopuxMfpXnZu0ASsCvDKZ+IkYy+
 XfAxdJ/cbM+ZRz1TjElkhw/HcdMItF8R5+gOo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=O0KnEkUJ
Subject: [Buildroot] [PATCH 1/1] package/libhid: update the patches to be
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libhid fails to build with output:

    Applying 0003-uclinux.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 80.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/libhid/0003-uclinux.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhid/0003-uclinux.patch b/package/libhid/0003-uclinux.patch
index cb3c45216a09..a81c3dc0a1fa 100644
--- a/package/libhid/0003-uclinux.patch
+++ b/package/libhid/0003-uclinux.patch
@@ -5,9 +5,9 @@ Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 diff -Nura libhid-0.2.16.orig/configure.ac libhid-0.2.16/configure.ac
 --- libhid-0.2.16.orig/configure.ac	2014-06-22 09:35:50.277261742 -0300
 +++ libhid-0.2.16/configure.ac	2014-06-22 09:36:10.688951947 -0300
-@@ -80,6 +80,7 @@
+@@ -79,6 +79,7 @@
+ AC_C_STRINGIZE
  
- MD_CONF_DEBUGGING
  MD_CONF_COMPILER
 +AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "uclinux")
  AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "linux")
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
