Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB59ACC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA77560867;
	Tue, 13 Oct 2026 20:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1XxMOWogq2c; Tue, 13 Oct 2026 20:53:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 90A4560849
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791924789;
	b=pzGQnjbNdHhXTEcVwojtGooet1htN5n+BkdnQXMkXd3Fdx5hYzZkHTktslxqf6HxOPV4
	 FG5dHzyWB2MBMYUf96zFBkeIkMB4bT0S9T3foszYqI3ENMpBvC8JJgbLJlamTX9jUEOmj
	 vS2HzManOLkWJ/v6L5jnpQLzw8pEzB3QQ4M+S9nGKBHwLeo5q+3U7G+7BO22zNoSP5fy+
	 KY9cBMe5p0XVHUUm7SM8W2qVNOlY8kgqZYtdSsddO2kzW0M1XBkQyAzahBc6SQ2yrbddL
	 /xXCqA0MY3gKXDp4ArvQxYbIkc/iVL/4h/sEIGmnz2aD/StvkiLqu/+P2ZkbJwxygdg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791924789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YYzr8QtJE7Jlj84ZIYpG2rVxaHVvnuLC6NlSio5BIKE=;
	b=q/EJraNjYo7QClqOZFQrEadKbW4fNHyiSD10jZTz9vP+eX/MySidTJk5ONx1vlRJkKy7
	 ejhjZPkKSrLcpVEKglVpka9JnQSDRS8xlJqepVkn3r79+xPbDWOAzFb5lkgWSutqAi6Zu
	 clnTjCFW41JK6JsbOMBH3nQ78OPPfv64KiP5JSrYXPFL7+g4zSfHolBWQAlNyKxF84S4t
	 HbwFeVm6/a64PwkQKkJJdLCibLyEzv4TLie2qlYDO8R3bkqG62+uMINsT8MM1jamXe/C3
	 DtVDq0e0nA5suXLjDXiH1QEWEd/vKCHGM/x3o1A/dGJj+d7OIpjuecTv0Ww5eTSJLEg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791924789;
	bh=YYzr8QtJE7Jlj84ZIYpG2rVxaHVvnuLC6NlSio5BIKE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e7sEvbFGtYsXibyviS8CfUIOHJ5MXvBOUPo/i2H4jPqrImoLl4TbFZOYVYGy6StwN
	 +G2JVRgfU7VoSe4z5pM6dYcbYW2V5b94l/21+XKwFi3GjcPirv3+6QZEQwe1aQm135
	 SEYTMxcFW1gVvvPjsdmH5Ab2vs4kAqLsu5xWqPZZFvZ2vD9zXikcraVIaH4o9epnY9
	 us5imy9lLRGHmdn6f1UX9gR+D8747eJDo+vyMuDhIWmSfsc2PdKblsSvCEUSVGLCqT
	 7RGHdrugPHbmcPQHSdP8eemE0pbHEJyA4LuvusGawOQNt7u/y3KuXLNXOw8kf2gmSb
	 clmTgOza0BEmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A4560849;
	Tue, 13 Oct 2026 20:53:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA5A8788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90EFA60705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xar7Yk7xCLv for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DBDF5607BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791924746;
 b=CkngXo8wPUgLHJY/O3xYKPUDzbQ19HamQbMCPhjQ8D0ptC1zhmJ6FOaM9F07PINwZ4nI
 sH+nP2IXBr1sLzb8Wc5qlGWAk6dQ0sFw2qKraFVKxGXa+jHnoxBv9O/Z2JMepYe+A1kux
 gtGU1bLTHroqlM7P0OMcPPmDSbHMW1wT9Z3ag4rxaUF0QEA2YQGqHi6vcNNssgkfhZV+l
 Uw/fgd8PDoXZTNMiVsFCDTFFDw2QhKsobwr0h4u3av4+/4RYz25Ra6nSOb8LQL9D0LK8D
 CNgfxsuyNARmexapHm2iQiG50nYMTyxR6tWQqIFqX0i275a1Voptge9EursIbx55fzA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791924746;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WuRvIdypIyfx9AWq6kMihj/oo5p0rID4XsewQPfaKpU=;
 b=aemeY0aWN6el2wkA66NwF++QZ6pMmnkiBtDLghgG6rn5Yl6EcaxDjb1LpbvbAuIz3CAd
 3HUthAV9cdzRsz0zUo63QOESGIOzO8rq6HgwIt/9TQtqJBP0GDeQEd2WDosSoQDK+RVNm
 3VX/6LRPJL+FbE5IqDZpxCLUicux2K5j09YBKkY5NQ6T39h3tYEz3/olB01IPuUCX2aX4
 wrbna2nj4n5eE+HHvJLH6iStYDhiMUok1pSxsuCRTlnpi2MTU1YjvpJX7w7Sy023kGC5G
 SrLBRuS5tBt15AGM2TaiUUh82hEST6SfgMUPSz2UIE0BJnSjxG9UiWz6+8xYz0nFJeA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBDF5607BA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C4095654; Tue, 13 Oct 2026 20:51:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:46:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bd71152b32c39338a17fa9b46530f2914d795fab
X-Git-Newrev: 76785a3f6c7baa5689a2fc691a9ceb2e0914e964
X-Patchwork-Hint: ignore
Message-Id: <20261013205107.21C4095654@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sqlalchemy: bump to version
 2.1.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76785a3f6c7baa5689a2fc691a9ceb2e0914e964
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index b9f597861d..aec7295d88 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  2b235deb7bfe0a97a716c99c66ba3964  sqlalchemy-2.1.3.tar.gz
-sha256  ade5281df06038c6394f532590d592d3381ee5d11b9e0006a2570aef41145118  sqlalchemy-2.1.3.tar.gz
+md5  9f267c2c350584b2b9a52d17611a4d25  sqlalchemy-2.1.4.tar.gz
+sha256  7bd7ad604487daa7eab8716471c29a7185f17b5287ce73bb7bc79fea050d8cfd  sqlalchemy-2.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index e38f49a4b4..2920680517 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.3
+PYTHON_SQLALCHEMY_VERSION = 2.1.4
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/02/4b/81d972a46c9f1d978af1795e2abc988855c711453552cb45d75f6e4abbf5
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1f/44/311bac6b6ef81e4dfd0287d04900108b1f5c00c9761dd3c0a2b7b9d0f86b
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
