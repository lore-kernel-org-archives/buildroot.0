Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF68C02185
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 05:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A57C60AA1;
	Mon, 20 Jan 2025 05:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJjUyHI94HLn; Mon, 20 Jan 2025 05:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6366760ADC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6366760ADC;
	Mon, 20 Jan 2025 05:23:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C602959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 05:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AD52400AC
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 05:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_8bPsO8tjt5 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 05:22:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CD1ED4023C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CD1ED4023C
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD1ED4023C
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 05:22:56 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-21631789fcdso62609885ad.1
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 21:22:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737350576; x=1737955376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNUuRZpUSJj3MBVPaBruF/CGcthAjtcsaegzlBuS5EE=;
 b=XKzrOV9W9oCpFC5wdwdP9iVBtvnluFC65TYanua2HjqPBTsDm0wpNEVFw9xtvVDMU5
 pD5PKkLdoXyL/jY1lDyxPEIG9AcktB8e9/SLCZG6X0Adtw0nRmtIZ5yBrC9iYpqf827j
 hrgX0Cmqs2VxEGIdtDWN7nX3J/aQLkF2SL3ivt6Ef2XpQ5Jb+Uu8R7Ude52A3pXeRW1A
 8tNJUHoe3AJyKGiaJ3nzOMBbUEKWgUXHpBpUS0egKX8M7FLZXiyqsuAOb4kakESAN+/D
 Db9Mr6+MPmX645s8Iiq3StAFH53oYA5KWz4e2ZIstIzuZHanC7CMwem48WK3lRK7mqY6
 HTtQ==
X-Gm-Message-State: AOJu0Yx/JqF0vQopaC9uwrx5MMLFi3sisKGMMT3u7aa3mppQnW6h4zXB
 rAe70u0ojLomPJV7ChmAMQujFmXj0gnRtU3Zi9NKsxtNLA5g3+7cFU+da1/J
X-Gm-Gg: ASbGnctoEXk74DSlQ9htpsxlVnlC5VT5898hBntqddpuCMSzOZOweR0gkZRXnw8ZDFa
 738xKI0f1J5uLNhu/4Ja3DULJNryqedPwEnYsujbd3BoJO1Lv1U0RFpCnY5LsG42EhYi3Q3WHCO
 R7hrV9k0urBkE/K5WGJqqxwxi5FJLIZ9qS2GJSUjqLfNk0rxTPhPzNp+zIO2NbLuT98tngRoLcl
 xO3Z6YDyD9X/a1ktfNvG0zAUXZYof0TKibxDQEFGn9k8HOZcaHDNZ9kawLFe/NVXhFc0zvawwNY
 7jeGcDOp0GkYd/MnJlRZMdch77JfCXfsgMDKaHmyl6J0zKD84JVtNw==
X-Google-Smtp-Source: AGHT+IH4nBRJOD7JvTzKV5kr6QhA/LSpJ+C5qeMRYcpSa6eOko/H08eCP95bBJl12FYcAC7cJ5J9WQ==
X-Received: by 2002:a17:903:2352:b0:215:58be:334e with SMTP id
 d9443c01a7336-21c35c9af72mr172459215ad.10.1737350575608; 
 Sun, 19 Jan 2025 21:22:55 -0800 (PST)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3ac6fdsm52922065ad.113.2025.01.19.21.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jan 2025 21:22:55 -0800 (PST)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Sun, 19 Jan 2025 21:22:52 -0800
Message-Id: <20250120052252.3702-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737350576; x=1737955376; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vNUuRZpUSJj3MBVPaBruF/CGcthAjtcsaegzlBuS5EE=;
 b=fS4uAZY+BEu78lARpVsnYo9irEPbVSPZbKrjpohm4+mpRTnDzxn/pab1SX44SlJWj4
 ygxPEpgXs15fZ7M+Jl07qm0VCK6qzSQ5SFth1yxPA2sSZq/b7zQV0BxWh8j98oJeEPcc
 crnckKpMnQlZKKd8SEyyeyxnBfUSkZKlb3tB9yvqSE3vV2r8WUgttTQxHO/3BJ3JmhyG
 wpiqvojsb3Nf12EtcJy9H1Q6tQFSwJaaeSRFLZ21naMIbuXqAdY2OroCIFhhRTEW9acL
 sXW9ZaBs9c4cqVSmOx88RDEHCZ/RP/YvPqCvlZDFb4mUFWzEn8e6S6I0SYJXc2mtyyGj
 orrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fS4uAZY+
Subject: [Buildroot] [PATCH 1/1] package/ncurses: bump to version
 6.5.20250118
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250118/NEWS

- Drop upstream patch - 0001-fix-XOPEN_SOURCE-detection.patch
- COPYING hash changed due to Copyright year update.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 .../0001-fix-XOPEN_SOURCE-detection.patch       | 17 -----------------
 package/ncurses/ncurses.hash                    |  4 ++--
 package/ncurses/ncurses.mk                      |  4 ++--
 3 files changed, 4 insertions(+), 21 deletions(-)
 delete mode 100644 package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch

diff --git a/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch b/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch
deleted file mode 100644
index 130ef524b4..0000000000
--- a/package/ncurses/0001-fix-XOPEN_SOURCE-detection.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Fix detection of XOPEN_SOURCE
-
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
-Upstream: fixed in latest release, no git/svn/hg
-
-diff -Nur ncurses-snapshots-6_4_20230603.orig/configure ncurses-snapshots-6_4_20230603/configure
---- ncurses-snapshots-6_4_20230603.orig/configure	2023-06-04 00:07:40.000000000 +0200
-+++ ncurses-snapshots-6_4_20230603/configure	2024-08-14 20:38:03.426905460 +0200
-@@ -10411,7 +10411,7 @@
- 	cf_xopen_source="-D_SGI_SOURCE"
- 	cf_XOPEN_SOURCE=
- 	;;
--(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*)
-+(linux*gnu|linux*gnuabi64|linux*gnuabin32|linux*gnueabi|linux*gnueabihf|linux*gnux32|uclinux*|gnu*|mint*|k*bsd*-gnu|cygwin|msys|mingw*|linux*uclibc)
- 
- cf_gnu_xopen_source=$cf_XOPEN_SOURCE
- 
diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index b82a7b29e4..36bf5cd66c 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  b0910671694c2c8377f579eea68477a15d67bd20ddd4b29328cfe15c62c7b3fd  ncurses-6.4-20230603.tar.gz
+sha256  57778746be0516ac04bf351596a1eb3371889df12b8ee698d3c82cc91da48b1b  ncurses-6.5-20250118.tar.gz
 # Locally computed
-sha256  0413b2f4ea863194c174673032f0fca84f1ea1ed4eed6476baea68c075a631ce  COPYING
+sha256  708999f95527e1ffa670c6fce288c6c600cb477dd04afcc1171422b3dd4ee226  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 00e1c0d424..3ad3da7f2e 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When there is no snapshost yet for a new version, set it to the empty string
-NCURSES_VERSION_MAJOR = 6.4
-NCURSES_SNAPSHOT_DATE = 20230603
+NCURSES_VERSION_MAJOR = 6.5
+NCURSES_SNAPSHOT_DATE = 20250118
 NCURSES_VERSION = $(NCURSES_VERSION_MAJOR)$(if $(NCURSES_SNAPSHOT_DATE),-$(NCURSES_SNAPSHOT_DATE))
 NCURSES_VERSION_GIT = $(subst .,_,$(subst -,_,$(NCURSES_VERSION)))
 NCURSES_SITE = $(call github,ThomasDickey,ncurses-snapshots,v$(NCURSES_VERSION_GIT))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
