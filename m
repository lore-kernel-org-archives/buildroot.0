Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431DFC30653
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 06:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF59940754;
	Sun,  7 Jul 2024 06:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wz54D3BpAeUi; Sun,  7 Jul 2024 06:10:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DA7F406BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DA7F406BE;
	Sun,  7 Jul 2024 06:10:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3DC931BF377
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 06:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A85040758
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 06:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uOORuMGXgmaP for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 06:10:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A52D840754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A52D840754
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A52D840754
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 06:10:35 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a77c0b42a8fso387674766b.1
 for <buildroot@buildroot.org>; Sat, 06 Jul 2024 23:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720332633; x=1720937433;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wtm+NYeg2CfPatMHnqFCDpxdKTXJrcSYAyTpo2lui00=;
 b=PPS1M8wExBnECqDkBZ9CIs20c0pwsmZyfQB697VpVaX7NUtqKxHeV0X+8hzNluKHvl
 jg+c693WbOz0n5A3/zN7ePsSKlqU2uCzms/LnZCPmUJ69fk/wKZyJFfox1BwodkyM3Pn
 sY3cTr77MDF7+YiLDOZC4nbocEkXNzRJ2d/zCHUC6oet0vGuirilpnNffrLY4kfVESYh
 0283zNkPHvsAo/Pqemj/Bz3pAup4Q7MDVL4GtbI4y9DBVvrs6+q56Z7v17E5S1tYnWfd
 b655Ngw9I7OZTsP3RcR3QX4xw5TH+mNnCpCi5Oo75ujh/jbA7sk34htRNDBtY82TC+Ls
 hYBA==
X-Gm-Message-State: AOJu0YzWNrd+VtoJEq0uYc1Wjulr51BNZ31XKxSZ3F2oshFI5XLUjT5o
 JAN+b4lZU4JVaqRh1RyRImRtmEpuhsV5m74+M+73N86DOxjqZK4yMQfz29xeTwwPqJUQZDWUMvS
 BJ6I=
X-Google-Smtp-Source: AGHT+IFem1oUI01VB6LXWpi4y7JzeMGg3cqIxb0b1QR0qUHIx2d4S5YAjYUG9HQTGPR7Z3+Gos6YLg==
X-Received: by 2002:a17:906:f801:b0:a75:7a8:d70c with SMTP id
 a640c23a62f3a-a77bd99b7b2mr621304666b.4.1720332633216; 
 Sat, 06 Jul 2024 23:10:33 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a77d9431b01sm168862666b.142.2024.07.06.23.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jul 2024 23:10:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 08:10:24 +0200
Message-ID: <20240707061024.3850928-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720332633; x=1720937433;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Wtm+NYeg2CfPatMHnqFCDpxdKTXJrcSYAyTpo2lui00=;
 b=QMPutvjA5+SWQ2D1BvYB9p9AD0cUN+LPkAUwSS4d2opse1qjxFkO+BW4kJhF2hAdrh
 oZxGAFwhYT2/HghDd+FpHSHfomKwm0gm8bRy33InXd65kWJ7g2v6X1PFAx9UtmoYBgav
 optBM7bFgn46FhBPyGpwaW/jpEn+MY5ra+d1I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=QMPutvjA
Subject: [Buildroot] [PATCH 1/1] package/nushell: update the patches to be
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, nushell fails to build with output:

    Applying 0001-uucore-add-support-for-sparc64.patch using patch:
    patching file VENDOR/uucore/src/lib/features/fs.rs
    Hunk #1 FAILED at 121.
    Hunk #2 FAILED at 137.
    2 out of 2 hunks FAILED -- saving rejects to file VENDOR/uucore/src/lib/features/fs.rs.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../nushell/0001-uucore-add-support-for-sparc64.patch  | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/nushell/0001-uucore-add-support-for-sparc64.patch b/package/nushell/0001-uucore-add-support-for-sparc64.patch
index 2cc05c172ede..ad7e70a56d63 100644
--- a/package/nushell/0001-uucore-add-support-for-sparc64.patch
+++ b/package/nushell/0001-uucore-add-support-for-sparc64.patch
@@ -28,6 +28,8 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Upstream: https://github.com/uutils/coreutils/commit/d158f1a396d19cc2aed68131b80ec3b7325d108e
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  src/uucore/src/lib/features/fs.rs | 2 ++
  1 file changed, 2 insertions(+)
@@ -36,16 +38,16 @@ diff --git a/VENDOR/uucore/src/lib/features/fs.rs b/VENDOR/uucore/src/lib/featur
 index 20cc9e13d..3b9170bc3 100644
 --- a/VENDOR/uucore/src/lib/features/fs.rs
 +++ b/VENDOR/uucore/src/lib/features/fs.rs
-@@ -121,6 +121,7 @@ impl FileInformation {
-             not(target_os = "solaris"),
+@@ -116,6 +116,7 @@
+             not(target_os = "freebsd"),
              not(target_arch = "aarch64"),
              not(target_arch = "riscv64"),
 +            not(target_arch = "sparc64"),
              target_pointer_width = "64"
          ))]
          return self.0.st_nlink;
-@@ -137,6 +138,7 @@ impl FileInformation {
-                 target_os = "solaris",
+@@ -127,6 +128,7 @@
+                 target_os = "freebsd",
                  target_arch = "aarch64",
                  target_arch = "riscv64",
 +                target_arch = "sparc64",
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
