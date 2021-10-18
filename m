Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C00C433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:32:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBC3608FB
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 20:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DBC3608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=eccles.dev
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7E1682AF8;
	Mon, 18 Oct 2021 20:32:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iz85Whkt4I1v; Mon, 18 Oct 2021 20:32:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4992B82ADD;
	Mon, 18 Oct 2021 20:32:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1771C1BF27A
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14AA282ADD
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 20:32:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hkLJFb4qlHA6 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 20:32:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
 [209.85.215.174])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B1E482ACD
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 20:32:20 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 75so17334173pga.3
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 13:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVouPLC3jUK9gFvU3FpDZNMLrWeVbLe6TsbL9yZTkUM=;
 b=kyYxAMr12ii7fpDsTiEmCmzupfiM+UWNc2Jc1gvr8uceV3+JRM/YnVF1Lf7fOvcvc7
 9VXPAK3USNkBFg5yOU2GbQ4TdOBnT8cN03mLCA45qVm3R9dOAuaG0ALbh79CNUxV1VAj
 ALGoHv4HsH699+gIYq8uHaxpI+8Lodqul1SmDLjMnwuWStTiSIIUFtIdUstp0uGUJdDa
 ZfXRITOHKi+spcA9S65rhrM948GtAVKG4M6NvHBrctMbarOY0Ge4yZlAjI4FzP76YXSu
 d3UDQd4Jfq7AC+0bOKgf2skBJk9xYLNcl3Y8/vef4S6TminYX4/J/fNcSRedrE0q1J3T
 vi5Q==
X-Gm-Message-State: AOAM530rOh4nW8EQtKkgqEyNQHrAmYwBTtDMeExL/tog7B2qYchTLf4H
 h7wWUmRgSHmKBjEwz9uJh+lJ5RHD0g==
X-Google-Smtp-Source: ABdhPJxVeLdyHq+kUHvySUh617Y/G1zY2T0ZgyRho0M+pzm3kNmMYR3bKHGlVSt7pR312QgpID0ltw==
X-Received: by 2002:a63:7a4a:: with SMTP id j10mr24777385pgn.284.1634589139666; 
 Mon, 18 Oct 2021 13:32:19 -0700 (PDT)
Received: from CTWS96.BCI.LOCAL ([50.224.150.182])
 by smtp.googlemail.com with ESMTPSA id oa1sm304026pjb.6.2021.10.18.13.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 13:32:19 -0700 (PDT)
From: Will Eccles <will@eccles.dev>
To: buildroot@buildroot.org
Date: Mon, 18 Oct 2021 16:30:37 -0400
Message-Id: <20211018203038.32453-1-will@eccles.dev>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/openssh: reset umask when init script
 exits
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
Cc: Will Eccles <will@eccles.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S50sshd updates umask to 077, but does not reset it when it exits. This
results in the root user's umask being configured incorrectly (assuming
a default of 022 or otherwise). This patch adds a trap to reset umask
when the script exits. This is convenient on systems where, for example,
configs such as /etc/profile may not be sourced by the root user. It may
also prevent issues with other init scripts which may inherit this umask
unintentionally, leading to improper permissions elsewhere in the
system.

Signed-off-by: Will Eccles <will@eccles.dev>
---
Backport to: 2021.02.6, 2021.08.1
(These are the releases on buildroot.org as of this writing, but as far
as I can tell, even releases as far back as 2012 have the same problem.)
---
 package/openssh/S50sshd | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index 22da41d1ca..94cf4c14e8 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -6,6 +6,8 @@
 # Make sure the ssh-keygen progam exists
 [ -f /usr/bin/ssh-keygen ] || exit 0
 
+# Reset uname at exit
+trap "uname $(uname)" EXIT
 umask 077
 
 start() {
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
