Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FF7CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 08:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D1C260F8F
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 08:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D1C260F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56B634064F;
	Sat,  9 Oct 2021 08:19:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_ZL7FLfBeZL; Sat,  9 Oct 2021 08:19:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B79F140643;
	Sat,  9 Oct 2021 08:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAEF51BF388
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 08:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA80C60B5D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 08:19:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d8C8YmoMDqZh for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 08:19:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8CB2760B5C
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 08:19:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t2so36798996wrb.8
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 01:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5oHzqzT44kZsNpEX5H6DsgtIOmoWdJ9vtULN3qXHIc=;
 b=XyZbsm5imA6JGDVFSaPx0yeN8VA/Q3Csju6bpR/2EFpiYWvJrD6NOTTDvxb67Ws8cW
 mEgGs7ZsEKyDmIsRM5UfpJImJKpxV2N7mutePnly5HXSdfPu+edKKu4QqemQ5GvAWH2s
 p3Dko5l4WwwoAzwGONy3MmciMRgatZXBSVAYz5IvyJK7Wwttnf4Pt0h4LAWOjF3VQJ4W
 O2WBu7SbxTpl2Uc6E4345hkCojjYBrWPQnYsF+RJzmvqaCfdsH4rTojmoJ4tFpDIF4X1
 S0gRMa2DrDUB9lGyn4NnfrB7Ic2n9yv7HV5QgFmShnRK+dfS4jxUdXdiFwEgOpfl0jti
 FGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H5oHzqzT44kZsNpEX5H6DsgtIOmoWdJ9vtULN3qXHIc=;
 b=uFGmegGPC4lQ8tIUJXfGQNzJIot4FChxdAVGWDdIz6Ypgn+z28aKKGjq/nZR4QRsWK
 m4NCki5c4mqEVXDQBfNG5GhEJvs4S2rkaCR9fs2ZhHbEWPJfoTB1v74k5I5hn+POpR2w
 ZGW8AukS+PWW7f2w2T3tv5TPoxTXan6J4rEYQ/NSesYSDCDzUns+1BnUSyEhpsb3GtBT
 ghmnS6dbi4h9DFe0fQyRnnEoI4BQpH1ttP32rV28U0M8fUaNfoqmUz4ZLiLOIeH04qkR
 aLJXRt/Me3j9y3H9W2Ua6Er0oWWv+i9FoCkqmpJqq22yBRi0K18UTzMxCWZRyHtm0kOR
 j7Yg==
X-Gm-Message-State: AOAM533nhnbwU7+gcbu6qYCScnt1ldq/cm9jy1h0usFwcpnrPYomv05A
 SA2TPuLPitYnEnmZMIsAd/a03LDxr+U=
X-Google-Smtp-Source: ABdhPJwsOM7IEyei1PyaFo+oSbHv+GYJ5oU/uXLTz5ys/rzoQ3U7jgdxdnvmMIYM1Ps4EzQODm84uQ==
X-Received: by 2002:a7b:c303:: with SMTP id k3mr8360961wmj.44.1633767591298;
 Sat, 09 Oct 2021 01:19:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id h22sm1333590wmq.42.2021.10.09.01.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 01:19:50 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 10:18:52 +0200
Message-Id: <20211009081852.380162-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/automake: bump to version 1.16.5
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

This bump will avoid to set --with-python_{prefix,exec_prefix} to fix
the following build failures with python and libsoc or libgpiod raised
since bump of automake to version 1.16.4 in commit
fe90272b5128987ee7492fff950660e05324838d and
https://git.savannah.gnu.org/cgit/automake.git/commit/?id=ed8daa069a6c8ed34f7856c42402ec46f305e670:

 /bin/mkdir -p '/home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages'
 /bin/bash ../../libtool   --mode=install /usr/bin/install -c   gpiod.la '/home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages'
libtool: install: /usr/bin/install -c .libs/gpiod.so /home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot/home/buildroot/autobuild/instance-0/output-1/host/lib/python3.9/site-packages/gpiod.so

[...]

libgpiod: installs files in /home/buildroot/autobuild/instance-0/output-1/host/arc-buildroot-linux-uclibc/sysroot//home/buildroot/autobuild/instance-0/output-1

Fixes:
 - http://autobuild.buildroot.org/results/045dc3f737f58d44014a4b717b5a565388e86f63
 - http://autobuild.buildroot.org/results/6e7a129b05e7852a4dc8dd35148664ad09610f28

https://git.savannah.gnu.org/cgit/automake.git/tree/NEWS?h=v1.16.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/automake/automake.hash | 2 +-
 package/automake/automake.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.hash b/package/automake/automake.hash
index e8112e0c48..b2e70641db 100644
--- a/package/automake/automake.hash
+++ b/package/automake/automake.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  80facc09885a57e6d49d06972c0ae1089c5fa8f4d4c7cfe5baea58e5085f136d  automake-1.16.4.tar.xz
+sha256  f01d58cd6d9d77fbdca9eb4bbd5ead1988228fdb73d6f7a201f5f8d6b118b469  automake-1.16.5.tar.xz
 # License files, locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 470a0bd46e..5270e7864d 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUTOMAKE_VERSION = 1.16.4
+AUTOMAKE_VERSION = 1.16.5
 AUTOMAKE_SOURCE = automake-$(AUTOMAKE_VERSION).tar.xz
 AUTOMAKE_SITE = $(BR2_GNU_MIRROR)/automake
 AUTOMAKE_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
