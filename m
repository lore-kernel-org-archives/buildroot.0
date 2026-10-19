Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E06FCCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E82D580F82;
	Mon, 19 Oct 2026 08:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8Nw6MZfkIYi; Mon, 19 Oct 2026 08:37:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1CB3680F67
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399059;
	b=m8oZNcE7mpOCh6ZMNyYZeTvEzMtvdUlGFP1R5W0zwIWWuH2cceZfvYX3FmcUzhR1vxdt
	 5neY0iLxah6Ip1G3M0uZOaBket16dxdtp+yxiRxo3COhEO9CiymiOatq2TvW6NOfjsmYC
	 1EuhQyYIidfr4jhLYBdA1U6hhZ1GDcKSpmHB3IvyPiIl5p8pq7B+6zNTztDHDu4hN1OcG
	 LbiqExuWM6PyHG9SCqlRebeXpZHJQvK4JKxxMJCC3f39mlzhFiCOp4hET1UivWqDwqIsu
	 NTkal8k+CPhIE441i7vjwn1tBkiuM949pDOOUwyAuI9amx1wgjElDhPSym9sZqlF6PQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wRogh+2o1RbBaym52oW2i8Ev1e0cV8/vAftrkIgG5tY=;
	b=RkFyej48XVbc06MuZgSzmdKZ+7pN+WH03sH6jFLido3CFpsFk2y/tCzZvTb8mLZrDGAz
	 0FslV3aeuOFw+nRDs2SXHcp+q74Zfzsa9JIeWuho1VLQBCcALCG/Rb2nvUkt9eqoyVrqD
	 hUntyIlsHCrEfFqyMwT642YFxNetkUuEmHQPCZur0t3hqdTPLuMUA6GBNy6WW/4b/PAnT
	 cDMsYSU6EFgDJG+tjAlXv9R3xybNqm0rcAi8dGe9aUUSinlr/b/ffH5ZOaVow8sTNDrA2
	 nPoOjslZvISEAHefp7prFag3G02R5QSaEYxmtrVCqcOc3YwU48+Gcny4NwKDMbQAM3Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399059;
	bh=wRogh+2o1RbBaym52oW2i8Ev1e0cV8/vAftrkIgG5tY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CjEX5EiZoYY4TzgJ8vQRhrLpacVIgy9P1zxZ4peU5umG7a8puJtKeFHeSPRo5n38Y
	 NME+FNmRmLf72u5D1P1JmgkA6Z5KDzKc1HlCM0qw6M8OcPjBYL6afsUY95qNLaylLf
	 4+0CkTlJlEmWqZVYlS/PZkBe4ywI00wPPdB9tWtx0ElshyUKEnN1lgX2887mFDuY/k
	 Li05Q+NhYQn5SIG/LbC9Unkh1N2txXd3S6iMCNWS5Y/I08qoiTBTVaxoK8MeUv+Eqc
	 Tih3BE7Bk4JfEmXLxbPin2bllTGKMofo7tKBl+sqCJwWrA6JrRelwdBFzF9a2KJcpg
	 3c+tYVOvFw6ow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CB3680F67;
	Mon, 19 Oct 2026 08:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C143C465
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEB6840702
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsD1carniuPc for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EC13A406FA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399052;
 b=O/Ugh+khAdadyfG/KF/xbGA1GxQwImVjIBS6Cgt3UFbb7FtuquNR7s9fI+wnI+bjYuSi
 HRhySjpm06Gft0U+mRoXw6Nz6ZBEmwcl0qJhITpYWB7K4255zONFRR5kpw8hKIFzVKz5Q
 lmG6EVRpKbliDSIbMtIWNkBykzQd9AU0GoApKJjTFhiXRMLiPDSbVBc3b3fI5d6repsQc
 yumuuRARVVVdKXX5YNmgespDeY1N7njbMR9M0hZPAT4Y9+Swcn1JbgzLBgFYxci2f6TwU
 ubiZsiSp+EXmtL1B/mun9pxzcSG+xb/tWWiONDiULpxznMYnhG+JQ+FiI8tD1UoAoXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399052;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0Wbp3p0kEXoHxcbuTGf3pWyIx4EYfi79b/9o8bPl1Ko=;
 b=h/c9eRsNj/c6gWQEI7kyWgUpmBKpZG6CU3QM9mOiv29+dUW2VnT7Z+vhKmsK7Fc9swfq
 tl4qjZqJ2VhsajWyGJ6SB4f6xVoVd07jG1Ok4P/zo52k1vH7lqbNXGb/Kdq5Ok0vLzLKr
 tO0t/4iBlWEaVnuD0AbVkFdzH5LO1IE7yHftRKeVXjLriZmtxRKZ00BmQUXYxCRc7s9o0
 eoa6ZZG0r1B0ovIyYU4PX/LwrDSCOJsRAbiQJCm0EmuChjTMS04Ghg/4L5lSXt5+9DAbV
 s17SllMogJvj8qrYuoeFs8hQIMr6oZ+ctB0iekGqfVnf9Wy5iUjqicCq89EfWruGSLA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC13A406FA
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74EC698451; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:29:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52fc29ad9256db1bd5a71c50b09fe1d0b6f3e5c3
X-Git-Newrev: fbf4c4f0c4ed103866d00339093aa8abf08f77ff
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.74EC698451@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paramiko: bump to version
 5.1.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fbf4c4f0c4ed103866d00339093aa8abf08f77ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-paramiko/python-paramiko.hash | 4 ++--
 package/python-paramiko/python-paramiko.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-paramiko/python-paramiko.hash b/package/python-paramiko/python-paramiko.hash
index 3815f5888e..818f4cd909 100644
--- a/package/python-paramiko/python-paramiko.hash
+++ b/package/python-paramiko/python-paramiko.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/paramiko/json
-md5  5767a11ec78dc1da7cb9e99559aa0ab6  paramiko-5.0.0.tar.gz
-sha256  36763b5b95c2a0dcfdf1abc48e48156ee425b21efe2f0e787c2dd5a95c0e5e79  paramiko-5.0.0.tar.gz
+md5  ececaacb7fe9cd84bc611c8f8d752369  paramiko-5.1.0.tar.gz
+sha256  239b5f9b2a53006cd54f83cf8495ee742083708ead947882c8dd2786de79f39b  paramiko-5.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5fa25bf5f395fd26e701c2e1de4ca7d162816986dc791c22f8f4226857ad1bb2  LICENSE
diff --git a/package/python-paramiko/python-paramiko.mk b/package/python-paramiko/python-paramiko.mk
index 6f313ecf3a..a0ed755961 100644
--- a/package/python-paramiko/python-paramiko.mk
+++ b/package/python-paramiko/python-paramiko.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARAMIKO_VERSION = 5.0.0
+PYTHON_PARAMIKO_VERSION = 5.1.0
 PYTHON_PARAMIKO_SOURCE = paramiko-$(PYTHON_PARAMIKO_VERSION).tar.gz
-PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/62/93/dcc25d52f49022ae6175d15e6bd751f1acc99b98bc61fc55e5155a7be2e7
+PYTHON_PARAMIKO_SITE = https://files.pythonhosted.org/packages/76/cb/b1fde76618d84b1acf54d3d03d2b833ba5878afd12b9899346cc080f209d
 PYTHON_PARAMIKO_SETUP_TYPE = setuptools
 PYTHON_PARAMIKO_LICENSE = LGPL-2.1+
 PYTHON_PARAMIKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
