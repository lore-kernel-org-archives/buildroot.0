Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9153DCA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B4D140E70;
	Sat,  3 Oct 2026 18:36:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E5i9Jv26RVm; Sat,  3 Oct 2026 18:36:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3129D40E84
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791052574;
	b=a16howmmhoVO8VpibTlORgX2UozGb4UjpiGnWdqQvTHjBaOK5THV84lroSvnmA92pR++
	 3+Vp99vQtTcqpQr4Na/G2XxYAEX+q2ZFSR8HB4Ew5C1aTWEp68ah77DIS/mjZ/DNgYyBC
	 L2q6PQPigGycTornKEI7+KlV/BaixByWayvGl0kcmEVVJEtNpTJYX4iOJRr2QzriD9jF9
	 WpCZMxz8z8MIN8+0XoEHsmG4zqELCLiGjO9d8DNE9RTG3uFl2xLOK73NxQupuhA7blVu4
	 d+miQk999ZOq6BhtVHqQMUPzNjHryeDay0jpzAGV2SXSaxuLi1Mdt1ipSEKeKFF0kPQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791052574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=lxL7N9cDvJneT9BAHr8OUzmdENixNvYwwv+VW1+lxW8=;
	b=ncG3caa4IcSEGQWoltaw7S7gwK4Ygo0LT82NecpZE87KJlUWljxDAM88AZ5bpyCuQlcq
	 i7Ya7CpSY868RnuoQkgeABiabllVQJdch7pWZVYX7rMn9oux9uIR+LKhbVtO0WD+lP5vQ
	 K7+I2ej1puCujAgrL9ge5Kplgj+5WUGPgN9zaLZh7aI9TG0Hy+bTY9M9X8XimQW5KGwhg
	 6cwpu+cqJJn1SoxA4l08LrVtgr4OmZIQSmivWZxA/gWcmvx17MfXaQApy1BXZZ+SPd4Vi
	 MvVDs2zOSDBELyWeTfAJ0Pr/+9dxcoZC6TCzSBNlYqV29pxia0U8vC74t9PgsFIL4Dw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791052574;
	bh=lxL7N9cDvJneT9BAHr8OUzmdENixNvYwwv+VW1+lxW8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s31UmVkW5YBAG/V8epQ3OkzfSbt7d4uh2IzdhKWGmsIpYVfJ8FCcx0Ny9MsCp1m4I
	 +Glkccnc5EQK5KZ4RpUgfTi1Anu3pGc0Z/ngwYrAbYiSoPf9B48r7yrs7Cp7WefRpQ
	 K4UJVfKu+x16zNr3hPg6MPAOhvC9IQ3f0ZdjrLVeQr3mAYdPmmLzNLvikDlQXxyU/n
	 LLH0CAlNB/+uy7lZPSE+g+Syrn+fufbjtyMqePhiLKgRBd9kX3H8fjAiSV5r7i81Bq
	 xBaSB2x3+DyxhO9AR3P4LZInfAZje0Kv9bJOZ18TiSDVWKhPmUpQ2hVCDg99xd+zXg
	 KrCU3Pd9r1QcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3129D40E84;
	Sat,  3 Oct 2026 18:36:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C2741A6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4920581479
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:36:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NNT_vEgV-r0f for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:36:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8D87D8146D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791052571;
 b=GtnUX83sGnmZrn48x+5DEbKWYxXR103/FJmveXT2d5icZjoAjHzJ5tRznyJzZWHCVECc
 D6qF6trKFQINKJbCKcS3eVvI4RiV7WcAqokkjdP5xoy1pVJvfaPGHtgjo06ZKjVyE+Dta
 QgfBOoXAFg4PasJ15xZ9g8RW2MZMxG4b9ZVbJ+T6ls+C7srNWdIUKXyrt/b7u8Dggl6EZ
 Pz3mvA1mwBxqEFJ3Uc58RRi2SEr1ltfoKsHc1qkO/H5JYu2vk80KNJQd+VPwVEjAT0sqJ
 Eou64BKt5Op3aBLeTubHF0tlwai0SQbRou2sS94PSrIQW1fCGtszkyVDLRPtEzw9N4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791052571;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=U2Iv0PtxRP6by/jyMOxRW28b5VDdMav9vQcVFZImZOY=;
 b=Oq7PKdrvSLMs0ZOZRooa8cG+w1WfnOUPLGY3tx8FaffKwmZmd98EwKckA2bs+P/hNtr4
 RjLBZwcQJ+1yafUnWCenzdAArc/6UxxsUn/axqoUC3vaPAvtTIFMd7s9XGuNm+tKW5k7R
 bPESPduh8VJrfOiMAyPNbsLEhDHHwhhcJzH1WiU9DpLHQoOO7IVwfJFglS1QFpaKW6+Mh
 mgm8JA2gmcJJiK1IZnb2gC2Ta8tvCeRBAM01idlBcrvkzwKQkwkYdKjVm2M1Y6mFoMkfz
 MrUZtcc+UNiPi2G1HhCpqzY6XmbUDGWvr+KNVw6Ztlzs+OppeDf3ePFCkeipTgilXQA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D87D8146D
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:36:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC693886BC; Sat,  3 Oct 2026 18:34:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 19:50:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 875cc7bbf18f7878d9f32d3af9e02575703c3719
X-Git-Newrev: 9722f61382cd86a55e80585af3a088b4d121def4
X-Patchwork-Hint: ignore
Message-Id: <20261003183456.BC693886BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swig: also create a swig4.0 symlink
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9722f61382cd86a55e80585af3a088b4d121def4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

FindSWIG in CMake searches for swig4.0, swig3.0 and swig2.0 before it
tries plain swig, and it searches the whole PATH for one name before
moving on to the next. We only create swig3.0 and swig$(SWIG_VERSION_MAJOR)
(swig4.5) symlinks in $(HOST_DIR)/bin, so a swig4.0 installed on the
build machine, as Ubuntu 22.04 does with its swig4.0 package, takes
precedence over our host-swig for every CMake package that does not pass
SWIG_EXECUTABLE explicitly. With CMake 3.22.1, libftdi1 with Python
bindings ends up with

  -- Found SWIG: /usr/bin/swig4.0 (found suitable version "4.0.2", ...)

Also create a swig4.0 symlink, and update the comment accordingly.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swig/swig.mk | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index e277f5049a..4dac64dadc 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -30,18 +30,19 @@ endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
 
-# CMake looks first at swig3.0, then swig2.0 and then swig. However,
-# when doing the search, it will look into the PATH for swig2.0 first,
-# and then for swig.
+# CMake looks first for swig4.0, then swig3.0 and swig2.0, and only
+# then for swig. However, it searches the whole PATH for one name before
+# trying the next one.
 # While the PATH contains first our $(HOST_DIR)/bin, it also contains
 # /usr/bin and other system directories. Therefore, if there is an
-# installed swig3.0 on the system, it will get the preference over the
-# swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
-# this from happening we create a symbolic link swig3.0 -> swig, so that
-# our swig always gets used.
+# installed swig4.0 or swig3.0 on the system, it will get the preference
+# over the swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
+# this from happening we create swig4.0 and swig3.0 symbolic links to
+# swig, so that our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
 	ln -fs swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
+	ln -fs swig $(HOST_DIR)/bin/swig4.0
 	ln -fs swig $(HOST_DIR)/bin/swig3.0
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
