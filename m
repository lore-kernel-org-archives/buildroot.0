Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135B4C79F85
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 09:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0B8040540;
	Sun,  6 Sep 2026 09:49:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vubkqM1ycjNV; Sun,  6 Sep 2026 09:49:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E43AF4050E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788688181;
	b=tgvIr9/rh5Bf+pgnUJZVIEBAUWLKP+Yj2XuPGtZUadIumGhUpxYoxF7iGDiwDJb+tODf
	 G5JIGUgsy9WLwO7+xq/b2Rq43WH7ZBh/udSdd1OQh0sYeOStdpay2tJ2iF9KBSyu9F3iZ
	 CID4CRmF/WFOyi2J5cIaF21ZLql2fT9xUnMd0O/+ydNBAHTGWvZzyEBWrEi+DO+qtCbcj
	 G8T3vj41W25qMf7L1drDaACqoLadYAafwquyBf8PgAJwX9ZgA315oQICneRfPnLU6pAiC
	 mLqpv3b4Qaa2sfL25oKYoqPCVau4qNXJlXvXcEdgm21YAw8iVub9frP//ZstQ+3Yj2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788688181;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=A3+FT/9S1Om9l45ZQyfptfalsUiJpJ6OSlC6cKIUwrY=;
	b=MxJNLIURjT5MrlN+b2sBKN7zxdETBGr2Ca00G98oSPRofW85MxQvF7WUiT4UwlQLRD2c
	 RSzAtdPTnYNPRSQTOf0IRHbL1SKEffuIpVCsxbVHx5ccT8FKVn5ViZz9O+/WIoPwpadih
	 Kb4dCZ7vgEtdB89fYm0kDK8rv7XW0J3ol21CIOrrkMsbWBet5LZhmiNWkq2Vi/cygYK8W
	 Vm2cmxODb1thBQ/hw4QJEGe5eKtLIrpJq/ZTghW8QjrHpgnIBjwaiVF2EZnQYDGCfwz7u
	 YufZhdizDKPC0VyPTCl5wSS50lx0qqXlov240PY0d38x+68MaoI9T3177TEh7nkw48Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788688181;
	bh=A3+FT/9S1Om9l45ZQyfptfalsUiJpJ6OSlC6cKIUwrY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bEq8BA0zODG5VlZz4BVOPVfz3aXIfM2guxweGsbnCrYunzPFPaozpyRPZIxXwW8t+
	 o3u9+LJPzTTv4nFLLyPLBRqpXi29pai3ut2ZyAWiQ9FwJgAQsR2mT7Rnf1pYMj7NIK
	 s3ae0I+QupcfMRQLMRPoObkXelkJz/iwYm+OPgatriJqwItUJLivz7bFEaV275eFLu
	 1+keVWgCvAyEqxQfTnk2vYCYqNsPIOf5petdQRK+uceS7mIjLA/Pow9q3IydeqWxqf
	 NFYlAjbo57/jHhgOx3aLhbjLMP5Mk6TO7VTYLmo1hmqCDKuED0xK78bolCjmP1w8NP
	 3SpNqN4S/hQwQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43AF4050E;
	Sun,  6 Sep 2026 09:49:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E4153AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1353C605F3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:49:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-EMiUwX0nZw for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 09:49:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EF10C605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788688179;
 b=Ky99xSC8bQks0OXK9IwuyvnP6Qb9OEcVuTm6chyukhRPtHV+grTGD0r9Z0vZTfM/TrZ0
 YJaUR8xvUF5xleQpcpaDIlhTGbv0a7JIXJOrW2aCUihYtY8dSc6SdOK6Q/advoHt6T1cT
 HPKvFKVNryNqPi6mDTOBzHfEqfSfmOBExLojFnG2u7UqTrIDxghS0e+1P7omXyZFa6PbZ
 2bdCrA88lImqHvx2VoILARfpto4qj2UmPNZFi030i2TqtXsgBoS5iFqcKJ87lKiFcAc/l
 w/oxH7f+xzk35K/99pRTVaElacGVsdjaXwO5inPtgnjBkERJkV2iPoYKM1ZqNVl2gdQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788688179;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zg7F8qDHc2AkvO9Ha/ycKgDwqVP4N3HEpgcpdREEh68=;
 b=JCw2NMmD4TneQmE6LHOUrCdWEUI4lXPRWsnYjIQ1DfEGcIqN/sMNk9B7ge6JcHUZVdaf
 Q3BBOo3p1fAQNZd/AgfDpA5D+6VXXrqE8gwWdwqPmwMXKRym94AeLOR1VH+2ZDZ64+XgM
 180mFg8bjkYWpGr+du1OE/yxME2rQ8gCb/H6XNzCUwWbFTh2vu4dWbnqtOX6CCf06yMq3
 SYIgSpd5MA/as1psw6L6KcO9jGUpVNSZDvY73TifFiAeBF/qd8uidsflprmbpmD64t1DJ
 zaAxt17j5XZxc5HAFkheaqgMtjArD8+IQE/4y93kppRS4b5YTyEPUEaJnMeSALLI3Nw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF10C605E5
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 09:49:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82C9E952F1; Sun,  6 Sep 2026 09:48:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 11:30:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64ed9e6c43fb531f011caf4b9aacc9e8c1f8dd00
X-Git-Newrev: 98258e3064a589812eee634dcdd44015f86b295d
X-Patchwork-Hint: ignore
Message-Id: <20260906094837.82C9E952F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llama-cpp: bump version to b10702
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/98258e3064a589812eee634dcdd44015f86b295d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ggml-org/llama.cpp/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llama-cpp/llama-cpp.hash | 2 +-
 package/llama-cpp/llama-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/llama-cpp/llama-cpp.hash b/package/llama-cpp/llama-cpp.hash
index 3967bc2fbc..87e2ec3a80 100644
--- a/package/llama-cpp/llama-cpp.hash
+++ b/package/llama-cpp/llama-cpp.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  4f9fdf018339783722936d537573d40cca596262e42714f597b1c93299113cea  b8117.tar.gz
+sha256  ff9ba2d1d7435f44c259361fbde6ea7bcb74e2d2581ad89e9fa4d7625f703cd7  b10702.tar.gz
 # License
 sha256  94f29bbed6a22c35b992c5c6ebf0e7c92f13b836b90f36f461c9cf2f0f1d010d  LICENSE
diff --git a/package/llama-cpp/llama-cpp.mk b/package/llama-cpp/llama-cpp.mk
index a368d9d6b7..8044ca05b9 100644
--- a/package/llama-cpp/llama-cpp.mk
+++ b/package/llama-cpp/llama-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LLAMA_CPP_VERSION = b8117
+LLAMA_CPP_VERSION = b10702
 LLAMA_CPP_SOURCE = $(LLAMA_CPP_VERSION).tar.gz
 LLAMA_CPP_SITE = https://github.com/ggml-org/llama.cpp/archive/refs/tags
 LLAMA_CPP_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
