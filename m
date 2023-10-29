Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F66BC4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D82244312B;
	Sun, 29 Oct 2023 08:58:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D82244312B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7aXRRSCi0fWi; Sun, 29 Oct 2023 08:58:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F0AE43128;
	Sun, 29 Oct 2023 08:58:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F0AE43128
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2466A1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1F2D84C57
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1F2D84C57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Km_bG8VU_XCB for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:58:37 +0000 (UTC)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0526E84C54
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:58:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0526E84C54
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so51337161fa.1
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 01:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698569914; x=1699174714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UDjT84sVlELZQd8k6qH84HyY6VG7N381y2qLLyU3ub0=;
 b=chgzI6kMAgiiJuvJqaeNbmKN0r7khCugUpAt8JSgMAXGA1j9Js7cUqUivQ75fdX4Hz
 Dqjm7/+F1d6x7HpOMI6dSaBDyOx00NVXXetld9gnVEy0MaGP3cqqZgpQ55Ycb+qPGjMX
 Q0a5nZz33u/n3Lo2rdmWSrKdH572tM7ih35uUpJ8eYqRpKhEEF9maiLw7UjIyCkniOfI
 k7Z/zTBjLyD4MtjPbSH7IXQesC5FuzDKeZuSWSE3dnng3EgGRdIo9BnkL84AZKDS6bhS
 1HusYl6PcvbUsNbr38LkSVwEg+KH8HJJe7F6M3GMb4iUYX8QJ2sYjjxMhbT3dIWiUORu
 GERg==
X-Gm-Message-State: AOJu0Yw1gCpjwnM9rOcUSRa5XW4w/jECAwIp1S85pHhxJpN/Rbx3eJnN
 nh0/A8+e2lv8TpmfspuGAeHvEANSmLc=
X-Google-Smtp-Source: AGHT+IGMPCxw58GlhcFAxAP57hYOpuu3X7t4VO6a+LwC02GrM720HYVeh/1NwDhQYciYSZrDf4l/Kw==
X-Received: by 2002:a2e:b5c9:0:b0:2bd:1000:431d with SMTP id
 g9-20020a2eb5c9000000b002bd1000431dmr4753496ljn.10.1698569914175; 
 Sun, 29 Oct 2023 01:58:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i21-20020a05600c355500b00405959469afsm6126039wmq.3.2023.10.29.01.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Oct 2023 01:58:33 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Oct 2023 09:58:31 +0100
Message-ID: <20231029085831.234005-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698569914; x=1699174714; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UDjT84sVlELZQd8k6qH84HyY6VG7N381y2qLLyU3ub0=;
 b=EwSpMC9o5/Mp8e6urFaQfnZyadzK0pQFPyN2guqZE65iCeleqgelA927hstfSLZwBv
 ejrXPqWJciCa6XXX2uh+OvNU+eB/GSXIaB+pIXLjL+PnU9FIU66Pm6Gb1tfLiR2IGr15
 kVtVgGQ7IBtwgWHF/gYWXTYzBjCthxM3TnS4NTy2q3Ti1fmrbWhRmw2AM0kKY/ZNH/bR
 h8XAJOdR1h85D8wCWhzyIf5wqh2Z6TCJcpqPFJZtD+5DyS9KSgIs/FtjOu+UR31bMSu4
 XK9PvcscDq1M4aeeSCjGY26aMKA12Df7lT30LlMj7V3tZAydfKKldMuGvEOrSdmU0Ktr
 HyRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EwSpMC9o
Subject: [Buildroot] [PATCH 1/1] package/pango: fix build with gcc >= 13
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc >= 13:

In function 'find_best_lang_match_cached',
    inlined from 'find_best_lang_match_cached' at ../pango/pango-language.c:501:1,
    inlined from 'pango_language_get_scripts' at ../pango/pango-language.c:661:21:
../pango/pango-language.c:518:12: error: array subscript 0 is outside array bounds of 'const void *[0]' {aka 'const void *[]'} [-Werror=array-bounds=]
  518 |     *cache = result;
      |     ~~~~~~~^~~~~~~~
In function 'pango_language_get_scripts':
cc1: note: source object is likely at address zero
cc1: some warnings being treated as errors

Fixes:
 - http://autobuild.buildroot.org/results/e8b5a752a62621099942b29c1642747eef2930cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../pango/0001-Drop-Werror-array-bounds.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/pango/0001-Drop-Werror-array-bounds.patch

diff --git a/package/pango/0001-Drop-Werror-array-bounds.patch b/package/pango/0001-Drop-Werror-array-bounds.patch
new file mode 100644
index 0000000000..45821e8533
--- /dev/null
+++ b/package/pango/0001-Drop-Werror-array-bounds.patch
@@ -0,0 +1,40 @@
+From e93dbd66973040f1e0afcba0dc7c712c27d75d59 Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Mon, 1 May 2023 23:27:52 -0400
+Subject: [PATCH] Drop -Werror=array-bounds
+
+gcc has strange issues with this and produces false
+positives that recently started breaking the build of
+pango as a subproject in gtk.
+
+See e.g. https://gcc.gnu.org/bugzilla/show_bug.cgi?id=105523
+
+Upstream: https://gitlab.gnome.org/GNOME/pango/-/commit/e93dbd66973040f1e0afcba0dc7c712c27d75d59
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 930f41082..2d30c0141 100644
+--- a/meson.build
++++ b/meson.build
+@@ -89,7 +89,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     '-Wuninitialized',
+     '-Wunused',
+     '-Werror=address',
+-    '-Werror=array-bounds',
+     '-Werror=empty-body',
+     '-Werror=implicit',
+     '-Werror=implicit-fallthrough',
+@@ -132,7 +131,6 @@ elif cc.get_id() == 'gcc' or cc.get_id() == 'clang'
+     '-Werror=sequence-point',
+     '-Werror=return-type',
+     '-Werror=trigraphs',
+-    '-Werror=array-bounds',
+     '-Werror=write-strings',
+     '-Werror=address',
+     '-Werror=int-to-pointer-cast',
+-- 
+GitLab
+
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
