Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFD4CA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EA82606F8;
	Sat, 10 Oct 2026 12:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wlTs0ZiGDBqD; Sat, 10 Oct 2026 12:52:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 885AD6061A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791636767;
	b=KTvYyOxs/1ZyFZJENYVvUxnaxTnik6wUmG1N+7X9EdkVG1Eu9lEp8u4RkdWOPC8Pua81
	 wPS9kvqY4aW28QC3ECES07Q0yiVEtQSZ75ZdqcTtbrJirrVgUXf5jQTiTcmk1E8rtie4e
	 RPLz6QlBT7kXeFBVL0MU9dfPdCUj+qK5Cf5+m6AEl54BVdWZ7p3eRmx7z0/ua+wGqcRBW
	 Fzwe2T+k93wIZBSQEkrPOtnC5D2cVUxZ6a77YPw+sdX9yIO3ENVbI4Zqc3/+BDLkAQCDp
	 kpvr0JpTkHWvhsfAEpUftt7fsz/j7Pwl7ft5btXOXZOGT/4iJDyfkfDSrtaJqTv4WFw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791636767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Dkw3AzAS35vDc7PU1R/grXizHttZBodI25riJRTO+0U=;
	b=WhWwIVdPz/EUdEt0VVgY/yYcxnZ2bUpRRVWOJ3QcU7Ei2rMI9s/JTpQX3LWeGyGWC/JC
	 bxtBwBiqtSV0t3v0foA9AoYSxSjaQzzqnZtNQg8wd9RIK4GToOWQJu1qYLv1zNK2Atcpx
	 dAdK/oANgGTynYS9WWvEifGFfG6X1mQDQjqUh2dqcUbimu4evRLOsrdg3HP2XVSQgWLAZ
	 4OGFVdainism0ZK2yt+WLGgmRPe/9hozDWfTmsc60l/NLe8jFYCzeoUtlQTtjDpbeB+J4
	 UTLkPw6t6lsVA6nWp4Pd5meo2cjnQ1nfNAnjC2gps3oa7gmQdlX/3fGGgRfPMCo5G5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791636767;
	bh=Dkw3AzAS35vDc7PU1R/grXizHttZBodI25riJRTO+0U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZoBKIffsqbH3zABwJKakLuC4Fq4YhVaMdKpK1HZYLS9KPSIw3lhqjZaOPJt7vDn2V
	 yXAjf2E1270eOqTNvWbVXGDBcU2wQuQWBujma0PpJlcFGC5cW72K45V7jwNwbXgx1v
	 kyBSOiNaH3u+ihCpY6wRNfL2ySSSuZ6H8sJFiZ9KR8hM+ykD3rD0E3boqhVMZUCE0Y
	 Njk41ErcGRUjhPBfBLPCJw+GREDoyhFFq9V+sps3my3ImqwpDrWD2uBZH7D6ktRgEV
	 r4W4AujOp04AewglLgbtDWVLeeh9UBfw9goTxQYXNCejk1R8aPAa/iSSL3otJARaxn
	 Mrv1fD9PWeVhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 885AD6061A;
	Sat, 10 Oct 2026 12:52:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2381F317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 214B740098
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXXFpYa2axy2 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:52:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 5D55840004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791636765;
 b=c5DlTnt27AAle9K2NoBt/CluXOCU6mSOYzWS4APoAYWdjSuBFqPUyzJkP3GSgBOMkMge
 J4VzZUOTvda3+IT4/G1qdOyBYl9rpKYQt31pUKJ78iNUjp0ySO2rzqvbUF6PeCjWXNMGt
 smyGN26Kqz53DGNDeE9PSRBteJ6KK4f9KCNlFp1iZz/UE8Vg7CkLo5KZX/AlsgZHqq5Ik
 KkzIrwOmm2cf3lJ4w+GGmbd70Whj2gRCLsMBtONEMLVVXJP/1VAKct6mAPw+6hdpu9DaP
 TtmzsilROgHqJIi+aI5tUePgCEu88YPZYlM4yUXNtxKdORTldpaj41aV3+sDkgYlbmw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791636765;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4HiiKrCjVyJ9LgPT06pmVY4KIrLlTXduurkUbUwnT6k=;
 b=Z31ud6eHT5b9rZxrO1JHld456qyR+0T6u6XERy38Lw2sETApN8kobGhLX+SgRz1vLCwP
 xW4ujIEnPm6iN2pGTZtjys067k+7Sfk51L5K4WZpNW4ejoqaBiYbTJR/ZvxhQ7DBXlf53
 514KK9FJiZZcS+Z5xK1lel2DQio3Hlsal2OkSmiccLaPXKTVtCiJPIJ1CQtolDlq883cm
 v8SGdDDK1CWruEbWk1gPp1QE8J4njjbw8X2ytMg5EyG6T1dbldnwohuMXQ9KxPHFkm3L4
 52ESBbz82jetRNHPPeoXbsGgl7+xUQOGR6UZP5ebdF0sB9WGbwD4j1p914usQBvdCMQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D55840004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:52:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B7F491C98; Sat, 10 Oct 2026 12:51:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:52:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 529df0b58030cebd7773d1bec4900af1716bb42d
X-Git-Newrev: f2449daf08cc4ba7b659b314cd8adbcc4a11d291
X-Patchwork-Hint: ignore
Message-Id: <20261010125127.0B7F491C98@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sqlite: bump version to 3.54.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f2449daf08cc4ba7b659b314cd8adbcc4a11d291
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sqlite.org/releaselog/3_54_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 3844da4792..25ac602fd7 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0e9483900e92cd5de8fd48d16bf9200145a61f7fd5be542a5ac81d8a9516eb9c  sqlite-autoconf-3530400.tar.gz
+sha256  134ec0802dda5795816e25d25872d20b312cb3973438c49b30bc40b7705ea9ed  sqlite-autoconf-3540000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 5d0fdf4791..df22314091 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.53.4
-SQLITE_TAR_VERSION = 3530400
+SQLITE_VERSION = 3.54.0
+SQLITE_TAR_VERSION = 3540000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
