Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E887C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1CF61186
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:03:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C1CF61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B5AE403C2;
	Tue,  9 Nov 2021 22:03:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qk4lM2ZoiRBx; Tue,  9 Nov 2021 22:03:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F104403C3;
	Tue,  9 Nov 2021 22:03:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F26201BF5DF
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF18460894
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:03:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Umj80kvvh9H1 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:03:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09ED56088F
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:03:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d27so439768wrb.6
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 14:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPaKBQJwrOE69qRX1slR8rZVR5VDLY5MLixOtzFB+6s=;
 b=XuK82B4hEb+P74H6eI2raY0+cAY+9J6+BJCx7r+Pic/oiwu0VVmXo/rRl/ibv0BZ6G
 uOGuKdXBUYd2i4fZ0KXWnXdDn1pp37HTrfeaZcoPniJcObhZ1tVoP7/04JA1B9KFIEi+
 aQuPd4ZGdCTSTsFR1y8SVk/PTUT7rjS9ABYcmVdnKElEwWJCqkfLnNpU47WvXv5g8hNG
 nz8InmFu8i/0zqADZ/qiOAtbHAdLESzsbEdmK7bPuTe0GM+9lpgu2lPWd7gJes54/Sgw
 3AXfP58mDJeOYHFL63c2cCEUqFPYt4uP6ue3P7H3j3psLi0s9G9GIAfj2/Xgf0ldxF94
 7kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPaKBQJwrOE69qRX1slR8rZVR5VDLY5MLixOtzFB+6s=;
 b=QUgooHi18OaU/Wa9tcXi9usXzF5pvaVsOGyPjLnNX4Ly8mmyUh0KLHA7grN8ea3jdR
 jrdHVlVIBmzJZ+8VGWhTjNBf43KTu4hzFA1R+5VvbSaKnZxEghGC6qsX5hYgbx0d4EnA
 qFPbGmNG4yEuE8BLblLGHdSyvDLtNhSS+1v1XM/jcxoLl+590cQuQUGd2qifRd5SE5dA
 ueXL1WHiildjRBz1rtTQsJ0VZso1M2BVurcQCTPiLvqhhHulJN6W3ENycZPyZa8zCwMD
 58+ULEz3qq7UPD7x8WUZhcqGTkxFk5G7fUshwQQ4FEXlwad4yGBYhMiiXuYW6tFeYv9S
 cbVQ==
X-Gm-Message-State: AOAM533akFoha4X473RInGqrPAktraOi+4d6l05kZ/qe6WTkefv28hjp
 /+/Jl/T1iUnQG4e3tuhoKPYrqyQOztM=
X-Google-Smtp-Source: ABdhPJxv07XHh8UBkQeu16hCWdq8WpMH1F6iKGhFp95kZ4ZNb9f0NjGZe00u3Nd4xjJD6Fjsk6++zg==
X-Received: by 2002:adf:ea51:: with SMTP id j17mr13980617wrn.421.1636495418126; 
 Tue, 09 Nov 2021 14:03:38 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id i15sm4246301wmq.18.2021.11.09.14.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 14:03:37 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 23:03:28 +0100
Message-Id: <20211109220328.388872-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 RFC] support/scripts: don't build board
 defconfigs with Gitlab's pipelines trigged on tag
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
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently when a tag is added to the Buildroot git tree, the gitlab-ci
create a pipeline with several hundred of jobs (~750) to build all
defconfigs and execute the Buildroot testsuite.

However, there is only a limited number of gitlab-ci runner (9 runners)
and some jobs reach the timeout limit (24h) while waiting for a runner
[1]. Indeed, the Buildroot project doesn't use the Gitlab's shared
runners.

In addition to the pipeline created when a new tag is added to the
git repository, two pipelines are created each weeks to execute the
Buildroot testsuite (on monday [2]) and build all defconfigs (on
Thursday [3]).

At some point there are too many jobs waiting in gitlab due board
defconfigs builds. Indded a board defconfig requires a lot of time
(~30min) compared to other jobs in order to build a toolchain and a
kernel linux along with a basic rootfs. There is currently 262
defconfigs.

This is even worse when several pipelines are trigged at the same
time (new git tag and scheduled pipeline trigger).

In order to reduce the number of long jobs, don't build board
defconfigs with pipelines trigged on tag, keeping only the runtime
tests and the Qemu's defconfigs.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/1758966541
[2] https://gitlab.com/buildroot.org/buildroot/-/pipelines/404035190
[3] https://gitlab.com/buildroot.org/buildroot/-/pipelines/401685550

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
v2: improve commit log

I would like to keep Qemu runtime testing when a tag is added because
it test the toolchain provided by default by Buildroot on several
architectures.
---
 support/scripts/generate-gitlab-ci-yml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index 7d09279bbd..232785f2e3 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -36,6 +36,9 @@ gen_tests() {
              )
 
     if [ -n "${CI_COMMIT_TAG}" ]; then
+        # When a tag is added to the Buildroot git tree, we want
+        # to run the runtime tests and only test Qemu defconfigs.
+        defconfigs=( $(cd configs; LC_ALL=C ls -1 qemu_*_defconfig) )
         do_basics=true
         do_defconfigs=base
         do_runtime=true
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
