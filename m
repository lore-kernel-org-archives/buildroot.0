Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D454E677F7
	for <buildroot@archiver.kernel.org>; Sat,  2 Nov 2024 22:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16A2260E11;
	Sat,  2 Nov 2024 22:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRUV7V7WJaji; Sat,  2 Nov 2024 22:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1813961125
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1813961125;
	Sat,  2 Nov 2024 22:56:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3082723
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 22:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3D7141721
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 22:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YkWxWAEYJgDd for <buildroot@buildroot.org>;
 Sat,  2 Nov 2024 22:56:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D7CD4172C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D7CD4172C
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D7CD4172C
 for <buildroot@buildroot.org>; Sat,  2 Nov 2024 22:56:49 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so26557765e9.1
 for <buildroot@buildroot.org>; Sat, 02 Nov 2024 15:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730588207; x=1731193007;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8ks3rs2CubnQ/fs4MvdLqRumjz1ih3F71RTaTrBOpwE=;
 b=X5RW3U9kzjBGwN7gpqNGhpr1j34gNFIk37SSdBaI6lUAfgK63XebfNnmlYxzpxnfRN
 CYgTvt8RnBzMV09ly120MnjTr+Til4R9jWJCaQZ4M3BiPo3Rjmt/8AiFfpW86hBMLpmL
 nkMZqiqLBOyh/joy0UxzXmU6blntMPXY9jyfNukCMh9dO1dPMjhRHdTJgDz9k5GFWPPc
 XljdzZFvrLKD95rGD74nswQ2WYS5nsTiXsoPTsgwjb7Ta6hMtiTgpsswRWPJruOZltOb
 KxDiNqNrz7n2OvwbeQt8XBV7dFgSuRXeJUhb9/5okMUWbDAo9fmatiMich8fNLV2vgaR
 AfVQ==
X-Gm-Message-State: AOJu0YzPfOzIuyEMD+y55Q/+a7XQNxUkouXgabqlisbxiBv6zc0/5Wpt
 GH1P30GIXTJEemMro2Q47IIkL6hffd5S5NsMLl3TlfiDCiyU2mI/vKcrSXzJxZjRGaZIWR/GGLS
 h
X-Google-Smtp-Source: AGHT+IHK65RQYHIEWundV1kK1diDYLe8mRt2xrcbsktGZV+WKDW4ikBVObQ/C/ZccJli1niaXvl1SQ==
X-Received: by 2002:a05:600c:1c01:b0:431:12a8:7f1a with SMTP id
 5b1f17b1804b1-4319acadc13mr256961525e9.16.1730588207396; 
 Sat, 02 Nov 2024 15:56:47 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10d437bsm9124744f8f.30.2024.11.02.15.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 15:56:47 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  2 Nov 2024 23:56:44 +0100
Message-ID: <20241102225644.692402-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730588207; x=1731193007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8ks3rs2CubnQ/fs4MvdLqRumjz1ih3F71RTaTrBOpwE=;
 b=OlvljfsDAZRDqLRfsokepkoAfPgffJMCoX9jwT6C/QHgjYdL8IPoOYrVnaV1LPYNRw
 GiWUVEedl8MM6XhsWwM4zReOjtYktBWMLgvnFlPL6649+qnlLv4Q+jnsC1jWJIG6jrl4
 Jg5W5JwxvfpX2NR2tGzFyG3dWd4JCMg50L02k=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=OlvljfsD
Subject: [Buildroot] [PATCH] package/polkit: disable PIDFD when systemd is
 not available
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the Polkit version bump 125, TestPolkitInitd fail due to an
upstream issue related to the new PIDFD support introduced in
Polkit 124 [1].

The PIDFD issue only affect OS without systemd.

Only enable PIDFD support when systemd is available until
upstream fix the issue.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596

[1] https://github.com/polkit-org/polkit/issues/451

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...-PIDFD-when-systemd-is-not-available.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch

diff --git a/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch b/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch
new file mode 100644
index 0000000000..621b1feef7
--- /dev/null
+++ b/package/polkit/0001-meson-disable-PIDFD-when-systemd-is-not-available.patch
@@ -0,0 +1,53 @@
+From 51a1c5b5ab616fe0243b40baddb4864199bbe624 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sat, 2 Nov 2024 23:33:16 +0100
+Subject: [PATCH] meson: disable PIDFD when systemd is not available
+
+Since the Polkit version bump 125, TestPolkitInitd fail due to an
+upstream issue related to the new PIDFD support introduced in
+Polkit 124 [1].
+
+The PIDFD issue only affect OS without systemd.
+
+Only enable PIDFD support when systemd is available until
+upstream fix the issue.
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992596
+
+[1] https://github.com/polkit-org/polkit/issues/451
+
+Upstream: Not applicable
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ meson.build | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 302c189..5c247f4 100644
+--- a/meson.build
++++ b/meson.build
+@@ -202,8 +202,6 @@ if enable_logind
+ endif
+ config_data.set('HAVE_LIBSYSTEMD', enable_logind)
+ 
+-config_data.set('HAVE_PIDFD_OPEN', cc.get_define('SYS_pidfd_open', prefix: '#include <sys/syscall.h>') != '')
+-
+ # systemd unit / sysuser / tmpfiles.d file installation directories
+ systemdsystemunitdir = get_option('systemdsystemunitdir')
+ systemd_dep = dependency('systemd', required : false)
+@@ -222,6 +220,10 @@ else
+   tmpfiles_dir = '/usr/lib/tmpfiles.d'
+ endif
+ 
++# PIDFD is broken with sysvinit based OS since 124 release
++# https://github.com/polkit-org/polkit/issues/451
++config_data.set('HAVE_PIDFD_OPEN', systemd_dep.found() and cc.get_define('SYS_pidfd_open', prefix: '#include <sys/syscall.h>') != '')
++
+ # User for running polkitd
+ polkitd_user = get_option('polkitd_user')
+ config_data.set_quoted('POLKITD_USER', polkitd_user)
+-- 
+2.45.0
+
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
