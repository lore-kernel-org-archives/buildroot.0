Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A805ECCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 13:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ACC16064D;
	Sun, 18 Oct 2026 13:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKsjKYoe159b; Sun, 18 Oct 2026 13:54:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 66DC160601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792331677;
	b=LRp+e3bkRoWM/PMBSvvuBr+++14KPmiwBx4SI+sGuV+uAOuL3nSz2cUSq2SJAIVfYBBM
	 EsAYCP1OX55ccDlI8YlaU/sParszkOG551uIdo8MouSq+7QO0WaBNtCCIzlvQgYZTFmwl
	 ed59oMVKLoLEJicZwoPxkuzhJcwd+43r+V0CgRG47UDSFU4A7FKqUtTBTut9MGdgbsi7a
	 notLPB/sMVoOiN2WD6A17GZGkMQnGN+wQD6m27GteTIWlTv+JaGLDM0oXCbhu/uF6xIl2
	 8Bxo6dPkd37EWuO+Cu5CFSM+QJquLyQuCENfFTHmIP/LJM9mDB6Ha4FxyOPwdShB1cA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792331677;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=eK0eul4Kyeu15ykLSTCppQsOj+seKLsmyUHd4ZY5LWo=;
	b=Qcvf46By7LnP12QwxzIMrGn8LDflOs0olQWfNeYucI82v+4cGRM9FP/4SJ10ImCL6TDP
	 IYX5XTAYv2WzSQ4wR8Jwu5Iic8FdIh5H0qJIn5gqXO5dqhnFgxS1o8Lbm6GPuZ9S8IhRb
	 9yQXAsbkezRym73owGlTvW8oZ2KTmFdcGpY9wGA92CQySALXmpAfZ5WPjvCyLq5lVFt6C
	 wcdMwiRofAsx/8n9pyXEacoX4ABmvMGcbZ4x4gxwgCSEfJKnP32HvvmwzhA1pnGNz5zAu
	 TgKxAxypZPyOTYA8gpnSkHgG0mIIDzqyGMTYC8URrVi0R5q/kbVW7OSQBgXasNLYq4g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792331677;
	bh=eK0eul4Kyeu15ykLSTCppQsOj+seKLsmyUHd4ZY5LWo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K4uRrjUsy2jzx3Ugiby6gf9XwXuGXm3G1W/u4IQrRdJ3Fi9n54kv3mzX/Fe4AAYha
	 Z6uQDDZTrWZFqB7OvfCQ4CAhCyEQYgsu3jifl9UprJuujdGxXG+EryU5E0KSt6FCfW
	 330LEpQghZoCkoPTt2/g5ipr4hxZJ8JoU1UU2Pg6VZ5Xt5mYwCPMeWbYP3KOoADgEd
	 VpLE4+dtL2ok/oa8J3srSqeSn7/D8zVUlefitmHDtAhNHBA3z/byArBq42tdZK0FlD
	 GQbbKyxEMLRKfnK/zicfq48poyNVqcD7/oJJMApQXITSQCbst7tRa+3DU3odWLQw11
	 1s3SdYrDlbpVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66DC160601;
	Sun, 18 Oct 2026 13:54:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41F6A255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33B8960607
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:54:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 66TL9Xd1rjqP for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 13:54:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 87DCB605FA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792331674;
 b=U7pqOIMxDUIYEHncCeJyiNP0u0c8GkFjHwStjFRbeFtY8RCxD0eIp+DX3CoxRSdOwiJB
 aQ4JT2jxzUFGSqgnXOcdUv4QQR3pXYfczumD9Gj8SRd0H1mA3p7pd21WLR2eomfWyl3XP
 0wiJlTf6QlfPr9ptbNtmZ6rKkTUuIGGUzYDhbtARbiyNGKlhj6BC+J9jUuBijmB20fACA
 y8fVsws2XVv9kWSvo8q7g+ktWhNVy56RmzDMD7yO9KbJ8dcLhfA57rhbl7EW+j302EWCA
 5klLgOenHc2cCelyh8acPj3P8vmpIY6hwLG1eHEaGnUIC4kR4dgNAt0LdeAWrtYP58Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792331674;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wt5u4OWIfvIomj9SmPiA6hCmyLoXF8ceIpmp16SyX3U=;
 b=Q+FRpTrSHLTsnjGLeJbUPvf2M2bcVrt5fAE5Kqg9f4GyTj9/bRb55p/3dzKYzG3JIOFp
 FQVLW2nYaEjPnjh4GFhTX3zj3qDWMq07B4yOpXuecVZfT0y/72xnlevDyEQmYTal30I3w
 i/0XfMPvBvbM//RT1OPDqX2v+E7wwtOZGS9wIs98nOWDpLgqeu1nDT1PaPnreD8DrMisn
 mp+Xbe30S3QcmU1YsU4yUtMV3Ia2hCjdELt4NCUvjbOAQzZNEn+h9qPX8FYJCzeo9b0Jg
 vkTjRyWipzhjP/xxp3e1i7BZhAOUpEIKVQSNPLmW81iyb1kZsR6RM0u74NuT/4Ty3Hg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87DCB605FA
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:54:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 713F8976B1; Sun, 18 Oct 2026 13:53:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 15:42:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b15dbb532608a0a6f247cc7079d47fda283d6356
X-Git-Newrev: d56efd0b179f6888ef8bf18cfe1d25397c7edf02
X-Patchwork-Hint: ignore
Message-Id: <20261018135312.713F8976B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.43.114
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d56efd0b179f6888ef8bf18cfe1d25397c7edf02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 51be01c029..2f298bcd54 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  a05d160b6ea2e3b8d54919585c414752  botocore-1.43.112.tar.gz
-sha256  9ce0d70e09fabbb3a2e1126d3ec79ed67d14c88bb3f064e62ab2881d5eaf3c7b  botocore-1.43.112.tar.gz
+md5  2e223cba9b8627048a80de7eae77d5aa  botocore-1.43.114.tar.gz
+sha256  f366fa4db518775632ad1eb128cd8203ca46396cecf37209d904f0bbc049ce90  botocore-1.43.114.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 376c400332..e029532f9c 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.112
+PYTHON_BOTOCORE_VERSION = 1.43.114
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/0e/49/58187bfb510831e4cdafd7ced8e2a748097da81e8b9799d93f8d6ebf9f61
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/ce/c8/b508359d1f3846a918c06807a9ae27eee063f904559269e42ccde9de09ea
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
