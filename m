Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253E2CA5FED
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6A481778;
	Sat,  3 Oct 2026 13:58:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YyKpn4jYDt6n; Sat,  3 Oct 2026 13:58:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org EE57181756
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035884;
	b=QdXkO48TLHsDJQCldk5mgjgrvy8QA2QMGdgrDV3hU39gHiUL+6ck6TJ1SjGvwGH+Xr5O
	 ZO43SRD0RZ/4saJlblB9/GjFHUBj2S9D6znnZqEadOPhaFbYXkSBRSzGl+6pfVwDG8Yw9
	 SwUd+GweJMkgBrD2VetEpzbsIpdQkR8Zf1aPNDqahaQRb7iRf7sDvGjRzbSd64hyYd3oV
	 t2gzOESpKkL5f3wk6mYwq2Yv9ldgQt4OKVoEyfsO5jiD53kFFPjFSeFO/C3Vxp3oE4JBT
	 hoo8ee/lb5Bmlc5yZstkxDND/LTczuT+jJIwSHu0B/3tz6+FVlxsoIziwLI/B1BSUtw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035884;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=X1K69TEIfg0uMxVXUuIAYe1TACVyKHq+vZEpOlZWlZ0=;
	b=gSuTSNSHD5pPzpzVBuLECeKInsjmysdYVO1ntl6dHV6zmXaLeE9OlmxK6bls9ONRhBR8
	 CUq9Gpcdb7mpkZIUgrBIDdiKXOr6gNrrz5DFG8FNHwDY8bcdJ+Ar9MBBz000wJiYJP9mx
	 pG+M2JH2OrAPy0cJ1PQPYiFwwesu7/vx0T7iTkGlaoK2hePpNJ1iY/iFzM/yA8GQ5XoXp
	 kCgVKQRD0DOkNrmmdLcfaFxQmt8dSJx7ElZzBaITSk07mkoy5r/t5CXBIH/vdOV2Kt2Xp
	 03Xvg1xtAxkN4Z9VxjEG8eXJMkD12jtWST87leT9e9r6445X5LojHu0bgb8GL773FoQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035884;
	bh=X1K69TEIfg0uMxVXUuIAYe1TACVyKHq+vZEpOlZWlZ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pZ4lDxADg9t/K0qN/EQEBTfhvXekdgwDbxFJNwsOfsXt8W/N+er9Do0Xm0BjcNMt8
	 kZka2pqCLaXZNnzTct3dMX89DZLkDu7bT0jCEj04J+9mRbm0VzyXH+QDThQI7smuxJ
	 xG9PMGXTg3ATc8DZzlhZ6DJhPRtXkZrghphjYazy3pqRXqd15PALsnFZYCS0JaEBEl
	 9A9NG2H3acRqF7aIgfzvDxt0gjf8ONvJOvwTlQy5Qa4PjBl7/WvTmAQla1mmCBuRIu
	 uGQIAJHR+47BN3QryI2pysLGqbkzaz3NLWWk056sWUcdAjOgP4SVx2DhHwPZDBhJ8W
	 HGS8mzyOcdTRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE57181756;
	Sat,  3 Oct 2026 13:58:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C8FBC9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B38A4414E3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eYcA0XrcGqAc for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DA9AC414FA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=aeG5LmLIfO7au35rOfoh5BtgY9KJsSh6lpZQJh9K/A6DDJO5bBS2jsbvf22NQLxxIGJ2
 nETI7+Cvb2Lpel/3PjJhjxEKmsPO8qx5Q9T6XECNWWKy6Pynu8bHB27nXy0DiEAwSDDf5
 QIOpB7VrNSj47KQcECreUsoHM+UE4M+f3iLHB9JXf1F8P5HN4SnXWBx5YFKAZhOpYTEy8
 lD/7ZOjde5WQbCB6C6t2atlc44F8HWt6NrUw4NiPAm7BKDJuN3+aDhAX+OhP8nd3D0Q1D
 XI4EhcNv1NxxSPg0kACoX1c5bFQCjoIc0AjbU6yap7HOQw3qEqa2nnOXVLM164xw5pA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=DJRb4G2XAq3zUFteOdbDm/2uVJ987DjbNW8/RF9fELY=;
 b=PIIdJGCbp83ZR+vV6wxiPqIk40AU13XvFc0qYtsTxpxRSE5jq2bVduWmt95c8JY1PEaz
 mFhYi+blXMg07V0780WasqLPSWgG1cMfywve0z0qQii/D4Q8WfhLuJ8mr097xU6mu+HAz
 NMRqiXSNDgJYuf5NeNq/I6hCfMbndknNUUVC6mLQnXffJqG2yA2dTYRkigs+nrcuA/z5E
 wTgj1gv/OItMefE97gtT2B+Hv02oykvxra3C5dD4SAutFNsfYe2f2KUS9aGIz15HU4yO+
 vIUPee0u2ogVirTtZ0106aY/lkYeAMhUbDzS65dzMryGhf1uYD5Edtsza0ZnkmbVceg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA9AC414FA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3136C88731; Sat,  3 Oct 2026 13:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3bb3557f667b756f9eed14a161679d0f9306170d
X-Git-Newrev: 5764b6893677086932ca6fa7595f413d3ac17b8f
X-Patchwork-Hint: ignore
Message-Id: <20261003135542.3136C88731@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-mako: bump to version 1.4.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5764b6893677086932ca6fa7595f413d3ac17b8f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/sqlalchemy/mako/commit/155f9568dfd5e46b8325b8fd466227dcedf07202

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-mako/python-mako.hash | 6 +++---
 package/python-mako/python-mako.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-mako/python-mako.hash b/package/python-mako/python-mako.hash
index a6aa68ee34..39bfca8cac 100644
--- a/package/python-mako/python-mako.hash
+++ b/package/python-mako/python-mako.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/mako/json
-md5  92390c7e8897e69da67a593a96e88c71  mako-1.3.12.tar.gz
-sha256  9f778e93289bd410bb35daadeb4fc66d95a746f0b75777b942088b7fd7af550a  mako-1.3.12.tar.gz
+md5  4b7555300a75b951bf99aa067cbb3633  mako-1.4.3.tar.gz
+sha256  cd6537fe88d5fec315c55c2f8529bc4ce7a9a352ad7db3eeaa6a66e2dd4ec37a  mako-1.4.3.tar.gz
 # Locally computed sha256 checksums
-sha256  68d7064e53e3ffa8e9f420a9e604bd2e2059d9c330492fa6ebd4eb3d48111689  LICENSE
+sha256  8c1d171bc5d341ad9cd33d5e2c39b96a82c7bd49b3ae89a470c37e5822232054  LICENSE
diff --git a/package/python-mako/python-mako.mk b/package/python-mako/python-mako.mk
index 0f52fa2185..c008967bd8 100644
--- a/package/python-mako/python-mako.mk
+++ b/package/python-mako/python-mako.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MAKO_VERSION = 1.3.12
+PYTHON_MAKO_VERSION = 1.4.3
 PYTHON_MAKO_SOURCE = mako-$(PYTHON_MAKO_VERSION).tar.gz
-PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/00/62/791b31e69ae182791ec67f04850f2f062716bbd205483d63a215f3e062d3
+PYTHON_MAKO_SITE = https://files.pythonhosted.org/packages/5a/09/e07c4b5579a79f4b16f8d4f29f6c54514ac787c4ad506b8c4f28a0e6b0bf
 PYTHON_MAKO_SETUP_TYPE = setuptools
 PYTHON_MAKO_LICENSE = MIT
 PYTHON_MAKO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
