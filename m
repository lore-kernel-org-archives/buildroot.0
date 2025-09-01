Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3BDCA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8089E40BAA;
	Mon,  1 Sep 2025 09:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Q-hx4k-dX_L; Mon,  1 Sep 2025 09:01:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DFA241505
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFA241505;
	Mon,  1 Sep 2025 09:01:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DC67D2
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6C8B40498;
 Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NLDck4azWwih; Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3D534044B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3D534044B
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3D534044B
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:36 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b7da4101fso9860725e9.3
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717295; x=1757322095;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eegGYybbLe6xK1FbgFHtWIUWrwY9njLvTS6bqJY99Zs=;
 b=QnGdY6Vv1NQXrLM/7G6eW7Tl1lpVK9mQk3UfYSZB67vmXcMPH80zs+AxWIbJP+Gw9n
 GHC20LE2DryX89WWjLYazPqAOtPbOR4Wio/pB0YFJUl/Y/XKR2oL2wxMsMTFv7sS4XT5
 QPd7OV8Ulle5iAg0wyeJxfH0Eg/pGW11ogZtqqmfm+CQ/+rB3kX9kAfwxcxblldLCuXC
 wMMmChEFwR80OWSrmvpwjN6WQeKXbACs6rDDfWu7E/HHidi/+BpHCy+6WoqllzRWeTJM
 O4KKNhovundO2roeOOsVuWMsrMLUo4mvkoMndqfhYfX614J2XQp8cCfJLXMF7AyRJU6M
 WbuA==
X-Gm-Message-State: AOJu0Yyon/N9HI6gxMl05hWsZfOFUaOfFEMRPUdDv02buZ58ICyxagBT
 xS4atlB11m7iYV2aI96d/+yhX5N16HunUvZ9nAi4pCyZQSD6pZs2xT0irx1H6w==
X-Gm-Gg: ASbGncs3kOF+rz7v8XtAqKhxiV0iiLQhIEY2ULK0aU0ZJQOGeG1wjqhYtBRaIELMrgr
 rLvD+1SeWYuhls1SAs6lodSkZvbIntmcAZo7AOl9gGrdi1IUkRUEH4g/FTERGC2t7gphbgzS7P7
 46hdReWsDeYjNFfcv3FW2c2w2tgxD3IjPqIuT8hTRXlxLdP/AEj8Ap81TvnYEEIqM704NxsnrPC
 iR9TfdHBI6b+6KyJqc+667wjwp2rNTs7htRUXqKMY9fXTWmFYaMEVbrMZk2yRZk1AKDMpIzt0pL
 Ggp3kTXH7d4v8PWEySTf73+/5FRPJaUvGb5x6N6BFz7tZNjAd26201iTpACw++dx0/pcYjP/V/n
 6QvNQroueIE21BFhL4fJns12TlU5+Of/rPy/ZgS+ae0s=
X-Google-Smtp-Source: AGHT+IFnS82qNBX1L9JyNSGzgtc4w23ejAopgmtvktLXeoGEb9BRNSIOBw1RNkgA37aDNHCbj4w0Ng==
X-Received: by 2002:a05:600c:c4ab:b0:45b:47e1:ef6d with SMTP id
 5b1f17b1804b1-45b855b3032mr55358755e9.36.1756717294683; 
 Mon, 01 Sep 2025 02:01:34 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2025 11:01:21 +0200
Message-ID: <3bdef5995150f3d2fd1fdcf0ac3cfb4f5cddbdc4.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717295; x=1757322095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eegGYybbLe6xK1FbgFHtWIUWrwY9njLvTS6bqJY99Zs=;
 b=hGPqH031QOZIhA9/USR0PD4ebh7pzy0vvGjI4XOV5uX+T0VoBgxjmmDMpKw2cxixlo
 F6csalat1nE+IJ3S1EQ6/YZo75ukQYFB6uFO1fr4p2krTT6yDQE9c3i5w1HPO7slOG63
 LGG4zntkH37qlMd9HqHB5bLPB4ApS6sLaZBNu45VbkWSZTVMkRfk89O7DgsTsAX/Wvbj
 DITp85p1069KOZZJpYSr5NGQQMs5Ir4ZdByPoHW5Kxjp3KU1mH6YTqOfMP12FzpbnQw+
 SvvoXNsKopT0MgFE5zAg26grkgdgGngFuFh/JnJjirC0/8MFSobHhqiHenosenMYxull
 0g8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hGPqH031
Subject: [Buildroot] [PATCH 12/18 v3] support/scripts: reject skeletons or
 overlays that are unexpectedly merged
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, we partially accept that a skeleton or a rootfs overlay be
merged:
  - for unmerged, we accept all kind of situations: unmerged, partially
    merged, badly merged, merged-usr or merged-bin, arbitrary relative
    or absolute symlinks, and whatnots;
  - for merged-usr, we strictly require a properly set up merged-usr,
    and we refuse a merged-bin;
  - for merged-bin, we stricty require a properly set up merged-bin.

The unmerged case is inconsistent with the other cases, especially it
allows for arbitrary symlinks that may point to arbitrary locations that
may even not belong to $(TARGET_DIR) at all...

We fix that by ensuring that the skeleton and overlays strictly adhere
to the merge-level of the configuration; i.e. for an unmerged config, we
require that the skeleton and overlays be strictly unmerged, that is,
/bin, /lib, and /sbin, and their counterparts in /usr, are actual
directories.

Thus, for all three types of merge level, the skeleton and overlays must
match the configured merge level.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-merged | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/support/scripts/check-merged b/support/scripts/check-merged
index fbda49f1c0..bff6ae2b7b 100755
--- a/support/scripts/check-merged
+++ b/support/scripts/check-merged
@@ -3,16 +3,21 @@
 # Check if a given custom skeleton or overlay complies to the merged
 # requirements:
 #
-# - for merged-usr:
-#   /bin            missing, or a relative symlink to usr/bin
-#   /lib            missing, or a relative symlink to usr/lib
-#   /sbin           missing, or a relative symlink to usr/sbin
+# - for unmerged:
+#   /bin            missing*, or an existing directory; not a symlink
+#   /lib            missing*, or an existing directory; not a symlink
+#   /sbin           missing*, or an existing directory; not a symlink
 #   /usr/bin/       missing*, or an existing directory; not a symlink
 #   /usr/lib/       missing*, or an existing directory; not a symlink
 #   /usr/sbin/      missing*, or an existing directory; not a symlink
 #
 # *: must be present for skeletons, can be missing for overlays
 #
+# - for merged-usr: all of the above, except:
+#   /bin            missing, or a relative symlink to usr/bin
+#   /lib            missing, or a relative symlink to usr/lib
+#   /sbin           missing, or a relative symlink to usr/sbin
+#
 # - for merged-bin: all of the above, except:
 #   /usr/sbin       missing, or a relative symlink to bin (thus points
 #                   to /usr/bin)
@@ -119,9 +124,9 @@ test_dir() {
 is_success=true
 for root; do
 	first=true
+	test_dir "${type}" "${root}" "/" "usr/bin"
+	test_dir "${type}" "${root}" "/" "usr/lib"
 	if ${merged_usr}; then
-		test_dir "${type}" "${root}" "/" "usr/bin"
-		test_dir "${type}" "${root}" "/" "usr/lib"
 		test_merged "${type}" "${root}" "/" "bin" "usr/bin"
 		test_merged "${type}" "${root}" "/" "lib" "usr/lib"
 		test_merged "${type}" "${root}" "/" "sbin" "usr/sbin"
@@ -130,6 +135,11 @@ for root; do
 		else
 			test_dir "${type}" "${root}" "/" "usr/sbin"
 		fi
+	else
+		test_dir "${type}" "${root}" "/" "bin"
+		test_dir "${type}" "${root}" "/" "lib"
+		test_dir "${type}" "${root}" "/" "sbin"
+		test_dir "${type}" "${root}" "/" "usr/sbin"
 	fi
 done
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
