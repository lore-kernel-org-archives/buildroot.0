Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29059C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 19:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E2240919;
	Tue, 11 Apr 2023 19:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00E2240919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fTfumjQ-Y7f; Tue, 11 Apr 2023 19:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E30784092C;
	Tue, 11 Apr 2023 19:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E30784092C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF30F1BF36F
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 19:19:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 961AB40112
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 19:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 961AB40112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6kU4858Qgt_T for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 19:19:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6882400C6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B6882400C6
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 19:19:33 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v14-20020a05600c470e00b003f06520825fso10233706wmo.0
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 12:19:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681240772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yzSHlI/pQgAOMmePCwmV3g8CgijIISjakaQLET+8CY=;
 b=3zh7KFqHm1/q9Atz9m2UzUmHT2LJa4nlFUxmvWTzQBlPbo6mI+Bq8XNS6nva8rmkKI
 pXlCk/l9uBz32IYUtrtEeUTtGY0j4eRWHG1CKQJRCH3wrCl0jwnVa46O0lXbPQn0q2af
 5E5TzIUXuYv0XpUSkWG+3cwLnkZM8jxuYOQ0CC2lTdguLtLxWVRexCl/6kNuS9bSIjYl
 kOQNJRmWVsw50FaQnrPugzhVrhXc65PlsLCFUDmitZDlcCOq9jwEeVzxYD0OrS9D0iP3
 eX0MkONcBgP6xgL02VIUGiayE7Qu8FGT2eoYQzOF2s33ucl9EqA6HGyO9bstJhPvI5h2
 7FyA==
X-Gm-Message-State: AAQBX9dnKrLUZ2opBz3sMXnPav5+QhkgjeJcSNOHbsh4w9exVqxjTCIP
 TLzZH2nF1/cBemLvYuNIEab9oZ42oXw=
X-Google-Smtp-Source: AKy350aAmMirUCZ7lHcvPWpOcXCGT0nejGa76MyPRUGu+2f9wLJe4UsqhjPqqNxL8Me7ma26byU+Kg==
X-Received: by 2002:a05:600c:2284:b0:3ee:4ee:bf73 with SMTP id
 4-20020a05600c228400b003ee04eebf73mr7754117wmf.24.1681240771689; 
 Tue, 11 Apr 2023 12:19:31 -0700 (PDT)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 f19-20020a05600c4e9300b003f09cda253esm47139wmq.34.2023.04.11.12.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 12:19:31 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 11 Apr 2023 21:19:30 +0200
Message-Id: <20230411191930.1550516-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681240772;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=9yzSHlI/pQgAOMmePCwmV3g8CgijIISjakaQLET+8CY=;
 b=YENpPSSOP82NSgqmkBiFCg1F9z/yCv++hDD2H5rSsAyyPVq7L//CBAOIvv//9hRWjN
 MH7fNhgn0rgjiHPAm3MFKvS7SW22r+FftIAr6JlBhpkeXBqrRUJCctwNvbJu8CgPXGlN
 G3r0i2BOocOIjnex5G9E+/MJ7UPZBW0pnYaagdT7yeA1lPEllRx/8ezlrKhqzmdQtO63
 0MUo+PAhrug+WBZdkWA387gFR6rt8Q7Fagt2rdNBr7G1ApiGYGrwTgqUQQMQDRFY0Azb
 5YfSfgshFJDi9wSW+OjsO373IkUU6+wjwcdcR6E7b1ZElQk/x0RhceRVy7MEZo6Rj0Ev
 VPyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YENpPSSO
Subject: [Buildroot] [PATCH] Revert "package/skeleton: drop $(HOST_DIR)/usr
 compatibility symlink"
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In 38b798da73ba (package/skeleton: drop $(HOST_DIR)/usr compatibility
symlink), we considered that $(HOST_DIR)/usr is a legacy symlink, and so
we dropped it. During review, it was pointed out that:

 1. [if] something installs in HOST_DIR/usr it's probably going to
    break somewhere down the line,

 2. DESTDIR is empty for host builds. And PREFIX/usr would be completely
    crazy.

However, we do have a package where DESTDIR is not empty for host
packages. Indeed, for host-systemd, we do have a convoluted sequence
where we configure it for the traditional /usr prefix, rather than
$(HOST_DIR) for all other host packages, and we install it with
DESTDIR=$(HOST_DIR). This is because systemd has to interpret path on
the target, not on the host, and confusion ensues if host systemd is not
configured with the same prefix as the target systemd. See commit
35c11a027c88 (package/systemd: add host variant) for the full, in-depth
explanations.

This reverts commit 38b798da73ba69c9e1d8279805b621f80b98bc64.

This also changes the comment to note that, although legacy, the usr
symlink is still required for some weird host packages.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/skeleton/skeleton.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 186cb60189..4eaaf32ead 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -11,7 +11,12 @@
 SKELETON_ADD_TOOLCHAIN_DEPENDENCY = NO
 SKELETON_ADD_SKELETON_DEPENDENCY = NO
 
+# Although the $(HOST_DIR)/usr symlink is mostly for backward compatibility,
+# there are weird packages that still require it (see host-systemd, and
+# commit 35c11a027c88).
 define HOST_SKELETON_INSTALL_CMDS
+# check-package DoNotInstallToHostdirUsr
+	$(Q)ln -snf . $(HOST_DIR)/usr
 	$(Q)mkdir -p $(HOST_DIR)/lib
 	$(Q)mkdir -p $(HOST_DIR)/include
 	$(Q)case $(HOSTARCH) in \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
