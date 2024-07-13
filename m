Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23B3C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B13DC4068B;
	Sat, 13 Jul 2024 14:43:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6HlVKrhInAO; Sat, 13 Jul 2024 14:43:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6595D406C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6595D406C7;
	Sat, 13 Jul 2024 14:43:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5551BF41B
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78048606A7
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7Z9jp_k4zkX for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:43:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6499A606B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6499A606B9
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6499A606B9
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:43:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-42793d4abbbso19851295e9.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720881798; x=1721486598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K11KPqcI1T7PRvqnQN4WLUXSHOnGtpOMufPMoKsHQxA=;
 b=AgGo0M0BsJ8+E8PgBiwKqgDbYL26X8/1lHARXGB9M9r5GLvc7hbl3Ss3Hz3/CjBNgO
 +czt/dlJwX3hiuMpx6yPyKtfpFQ3Ggqp5O2Exr/lj1dxuqORezobYm8rzP/TyOd+mSQB
 mnGOYgKD3EUl1GOD5fQSt46cSSP+ECRYseWVJMgQMB4h/ye09jWrTY4Xoqkdir3dRakW
 Rh4174vHWjzmQ3QLFoTCdUjL8kTAzwwXIFv3nUJin6y4nKKD7GEZwewZkB8X9dTBUBJ3
 F4pb8Uj7sP/O4htvU5SAiOLG3px/+fI1Qb9CV6mq43bYdb5r2koBsMXo7gnOijBrDd0v
 PssQ==
X-Gm-Message-State: AOJu0Yyx9va5NingjPGvewWYaov3ofFIY/svr/L9vbdZyecAt+fDxaWT
 qsUrsV4IowgfjuGH4r/bjgRYv2JkyR2OtTQHGN0/IARig62P/A2NH3F9FWDhqQBy2EoYlUU6R3W
 81uI=
X-Google-Smtp-Source: AGHT+IG+fBQwBmgnbvBaJX/TmhTEgh20KGDFAnDmPxyMdsllPkRz0yUYUi1F8xG1Uchl3E7jb/8Lpg==
X-Received: by 2002:a05:600c:4c8a:b0:426:6e93:4ad0 with SMTP id
 5b1f17b1804b1-426707d7977mr101914595e9.17.1720881798217; 
 Sat, 13 Jul 2024 07:43:18 -0700 (PDT)
Received: from arnoutx1.home
 (2a01cb05949d5800b48198b5611fe783.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:b481:98b5:611f:e783])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f276b14sm57610835e9.23.2024.07.13.07.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 07:43:17 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:43:14 +0200
Message-ID: <20240713144316.403640-1-arnout@mind.be>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1720881798; x=1721486598; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K11KPqcI1T7PRvqnQN4WLUXSHOnGtpOMufPMoKsHQxA=;
 b=XpeUlsKgWxn5xF61MmWF5Xy1gQ+lPRimxNYDJbKEd6gHZvc2o/0T4c/TL/7d8O8I8y
 CFyAbQ1MUJuxfJvr3W3XDmqZU7HBXy9jv/2s0HLT4nl+VEHTRvePng1Y5XEbN0rfH8ab
 WiotumucMR+ZOExjkZG5cZofwuz88pzTGiJDIbc2UWraMfwHVVbMf6ERPOatZm0hJ480
 LmoDr7c43ShMPiANJvi5D73k/jCRjzxfOuMSAh7hby/Kjh7sWkoRiCfqG/BCLL4HUTyJ
 GcXPPZLRLziHZDo0bGzhaISaWtv4E20HtR0kXH5HPuFF/4eY3S4zHHW+GJh+0P1JB/Gz
 G2Dg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XpeUlsKg
Subject: [Buildroot] [PATCH 1/3] utils/docker-run: allow to specify extra
 mount points to propagate
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sometimes, the build needs access to directories which are outside of
the current directory, e.g. for pre-downloaded toolchains, local kernel
sources, OVERRIDE_SRCDIR, BR2_EXTERNALs, ... We need these to be mounted
into the container to be able to perform the build.

Since there is no generic way to find out all the directories that are
needed, we need a manual mechanism. We choose the environment variable
EXTRA_MOUNTPOINTS which contains a space-separated list of directories
(or files) to mount.

We choose an environment variable to avoid having to parse command-line
arguments to docker-run.

Update the terse documentation in utils/readme.txt with this
information.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/docker-run | 5 +++++
 utils/readme.txt | 5 ++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 1adb02d74e..3bb7b6a41b 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -90,6 +90,11 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi
 
+if [ -n "${EXTRA_MOUNTPOINTS:-}" ]; then
+    read -r -a extra_mountpoints <<<"${EXTRA_MOUNTPOINTS}"
+    mountpoints+=( "${extra_mountpoints[@]}" )
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )
diff --git a/utils/readme.txt b/utils/readme.txt
index 6488d13c75..0cc665e478 100644
--- a/utils/readme.txt
+++ b/utils/readme.txt
@@ -21,7 +21,10 @@ check-package
 docker-run
     a script that runs a command (like make check-package) inside the
     buildroot CI docker container; pass no command to get an interactive
-    shell.
+    shell. If additional directories need to be accessible inside the
+    container, specify them with the environment variable EXTRA_MOUNTPOINTS.
+    The buildroot directory, the current directory, and the download
+    directory are automatically propagated.
 
 genrandconfig
     a script that generates a random configuration, used by the autobuilders
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
