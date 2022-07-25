Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6141C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 10:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50FFC84C34;
	Mon, 25 Jul 2022 10:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50FFC84C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tS6wEtQ5Fwqg; Mon, 25 Jul 2022 10:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2448684BC0;
	Mon, 25 Jul 2022 10:07:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2448684BC0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B0A211BF371
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 990F640407
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 10:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 990F640407
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTgRI-eAzSMR for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 10:07:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 458B7400C7
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 458B7400C7
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 10:07:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 r1-20020a05600c35c100b003a326685e7cso6955958wmq.1
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 03:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKanz+ClaDhgYrsuTjiD5V3Epxj4HjbEEhKFZEIkTvA=;
 b=NhT2/aL00FtJU9Hy26R0P3X+Eg9hD1E8q+YpSwI5V2/NMmP8TeUKxF/eyQrfYRbykY
 DtX7HS6sMyH7NuV+MKmy7pXGQAT3YRSF1athox4W8v0HFj2+nawKtnhKW//BSIvQpNB6
 /xaErfg6mRamkm27jBz0/AhcByukcMnvfKDgfLQeMy/zgij3g6gAIYSZ5ZVZgd+MXhG3
 kc8SR1GJvuJ5mOWPn91mSE+7RI5Xjj59p6LTd+TwytkbGNOmDYuyXNoToyjKPvOGYcJB
 UBgHU0ESwZS7Bom8VA0BGyh0fxpFaVxqZ5obABqsCHuNq7fJ/poidvNdPRAqzKJbae5V
 NZVg==
X-Gm-Message-State: AJIora/LhRCM5fA5EK56IgV/QXdN1VLiFAK9DeXvyuoKOTSY/+E1Uj8n
 SaI2dJ9J3i8aon4SvFli8Kn+KmPuloXeKg==
X-Google-Smtp-Source: AGRyM1sSO3CX1dDpP4CNowwtqComlP1dnphE3yyfrJudCphP4xTg7Fzu/PocL3BOTv5VazC/dXDQJQ==
X-Received: by 2002:a1c:7407:0:b0:3a3:1d8:5c12 with SMTP id
 p7-20020a1c7407000000b003a301d85c12mr20465797wmc.191.1658743667094; 
 Mon, 25 Jul 2022 03:07:47 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 i24-20020a1c5418000000b003a3187a2d4csm17633007wmb.22.2022.07.25.03.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 03:07:46 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 12:07:45 +0200
Message-Id: <20220725100745.2878896-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HKanz+ClaDhgYrsuTjiD5V3Epxj4HjbEEhKFZEIkTvA=;
 b=bKNeBJs1SyTQZMeRkzWvuq5QFOR3Qa5SCLm2oeDjVSQIjyE9zodr9l9QnMCsPqHHJM
 QnwPEtKTPTnZS8fp/nU/MVwTnil2doiVNR+66+8TaYMfWFzevUHJdvF6LOEsUGCiN9WL
 BE/SNatR9qcxwhy3l2BNgJJFiZcrPayCfBCwftIO3U1+74V7TbKpRa5v3IK2KBJo8pIM
 YwNvt5w+tK+RuXo1sP1kq3hEmHykZaggT2vollh2Y9gl9xy8ULrnI5MRvsSiVAV5X1+A
 6EU1XGq3DQH2gxg7YCIoDBpgmG0lqnfocBschdvp7YmFPhD8VvklhMoeF3NO1e+DeZHH
 pNeA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bKNeBJs1
Subject: [Buildroot] [PATCH] package/glibc: fix struct stat for microblaze
 with largefile
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On microblaze, there is a separate version of struct stat for largefile
and for non-largefile. When the struct was updated to include the
st_mtim, st_atim and st_ctim members for POSIX, the largefile version
was forgotten. Since we only use largefile in Buildroot, that means that
microblaze didn't have these members in struct stat. This breaks the
build of some packages.

Change the define around st_mtim etc. to __USE_XOPEN2K8 to enable it in
posix context (i.e. by default).

Fixes:
 - http://autobuild.buildroot.org/results/dd944a3bd4ac0c94b2bec8ac209100daaf43903d (zstd)
 - http://autobuild.buildroot.org/results/4609c8e2af24d9536eb33397a4659ad740aca742 (dieharder)

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Cc: Romain Naour <romain.naour@gmail.com>
---
 ...ot-posix-conformant-on-microblaze-wi.patch | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch

diff --git a/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch b/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
new file mode 100644
index 0000000000..9797f3a935
--- /dev/null
+++ b/package/glibc/0002-struct-stat-is-not-posix-conformant-on-microblaze-wi.patch
@@ -0,0 +1,37 @@
+From 87d415cc133ff493ccd02464c061cb171d11ef2f Mon Sep 17 00:00:00 2001
+From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
+Date: Mon, 25 Jul 2022 11:25:15 +0200
+Subject: [PATCH] struct stat is not posix conformant on microblaze with
+ __USE_FILE_OFFSET64
+
+Commit a06b40cdf5ba0d2ab4f9b4c77d21e45ff284fac7 updated stat.h to use
+__USE_XOPEN2K8 instead of __USE_MISC to add the st_atim, st_mtim and
+st_ctim members to struct stat. However, for microblaze, there are two
+definitions of struct stat, depending on the __USE_FILE_OFFSET64 macro.
+The second one was not updated.
+
+Change __USE_MISC to __USE_XOPEN2K8 in the __USE_FILE_OFFSET64 version
+of struct stat for microblaze.
+
+Upstream: https://sourceware.org/bugzilla/show_bug.cgi?id=29403
+Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
+---
+ sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h b/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
+index a2787e88343..850697f4fa6 100644
+--- a/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
++++ b/sysdeps/unix/sysv/linux/microblaze/bits/struct_stat.h
+@@ -89,7 +89,7 @@ struct stat
+         __blksize_t             st_blksize; /* Optimal block size for I/O.  */
+         int                     __pad3;
+         __blkcnt64_t            st_blocks;  /* Number 512-byte blocks allocated.  */
+-# ifdef __USE_MISC
++# ifdef __USE_XOPEN2K8
+         /* Nanosecond resolution timestamps are stored in a format
+          * equivalent to 'struct timespec'. This is the type used
+          * whenever possible but the Unix namespace rules do not allow the
+-- 
+2.35.3
+
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
