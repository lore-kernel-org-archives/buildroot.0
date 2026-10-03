Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2027ECA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FEE58148E;
	Sat,  3 Oct 2026 13:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id szk1vzHC7sIl; Sat,  3 Oct 2026 13:57:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8118D81498
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035825;
	b=bymJR/3wuNng31KcfJMlwuX52wt+p8vEul67pT3XvYhkR9rLCdawb9I//2YPKH/NBQ5m
	 e5Pj/AZAPVLUwZ8FbpH13hKS9Tl+XiDSuYTcCA4lLalEEMrPu0IggxQqIhYrsSjn8QVRe
	 DdWJcF+JPkQ2M8XpF3UhCpWFx8M43s53SK+lF7FR2UC6JiyY82I681DRrP4tDpTcCmRLJ
	 y/rJAqW85GMkC3sKJ+JyX+GzFeQWaLwYSXdHxa/K5sJC7fhzgx8tQK4W+XgFhqn/9+Pl1
	 G+RtFcwNaBJ4QX63VLo5FKi+MIezBI4ynUAMzKeyxsyhqjB3EtW8Xid5iDzA1mf4SKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035825;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vuYuaxqzFpKGJ9yCQ9Qw8XJqXYnnrteWo9vBqu20rkg=;
	b=sO7lVXwd17NsXAjA+CZjBZqWAl8CMJRHSQLXLAOBJ1wJ96Co7uiQ1yyEt3kB7in4TAo/
	 Wzm/s0gyfiUJAM2+vjlJLekKglkbL8FQQvJzrlekJN69FuO5pfv64uwoxKJ1afH8lojio
	 8eD2AdM8XADS3qwQoQPVcrKLdFlaih/d8KC9hoFMeDzEV0DYMVJP+rHGNEXA6NLf3681P
	 71kHu9nu+KO5UOWNaolWs+QXMpa1d/X4CLrt/Ql+bOVAHMbnCNkljIpzyEc7b+NuOquNv
	 kgtiwPDC4Yks4zbkcxSqX82djffU0xlawS4pjC1vJLMKGzHLAemHRdmfMgcSxf0o0zQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035825;
	bh=vuYuaxqzFpKGJ9yCQ9Qw8XJqXYnnrteWo9vBqu20rkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gjh7KwAsvtKp6LxEJSQ1VbG4mJYudIVtBZwIdnMJgfeUbOuCIypErd5iKM+F7YHfm
	 IrVqQlzKa46t/3XbgQ7fLzZlSDVS8dHmcjUsrdiDEqbBj4wUJs5hg/N63vbf4pVr69
	 08BQvdVwn1/pliXOIwRod37T0h5nAR8F6mF9ZJDQsXzywmJnsdhG2IcUd5YVur0bvR
	 g/dHFqhhbYPMPN3rrb9enkPGWcxZEblHDT7G0B96tuANgJeCme9nlyh7ITrAzR7XcB
	 rsr5Pw3kV07zszplUJLf3p47t8WyqfD8H+VTM+5WosKOIgMQuc4riKw0IcS4bo4/j9
	 QhXb5RQ3/tE2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8118D81498;
	Sat,  3 Oct 2026 13:57:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEEBA9DF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC34C414EA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6a1XpAYyfZJ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3BACF414D3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=VVisVCqvawAwZHv2D3XH99n9U4Cb1BvA7rDZc+d8Qnn7hLncT2T2OsYjSG1wOk2lUTel
 6o5yiODbyMyHa89PBvy72Uy5N/wLjmsH8d1wtyLonIoi8cWodakeoWMBzql7A/gqL9Xsu
 MwmiaDwt6JJkG+O8s6/TBcgzw+BMBBSza2pA6nL7TnyOWGa90HQLKEzH/KxDe6GvUg/k7
 ifPYna9Ndo4Dac0SefRIaSlPL2S/ijEsuobnN2SlcM/cm8ANSK04UBNhen4JVllcooHGd
 kiEkfExXrn1gPMxLK3Q4785FWaax8a/xaLXBhy2ng7nAgbwzSEUFQvDLd9YMVzUBeMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=k6fx4odTKNyqUKPVzjN5aWkCdhmvvWzM7KMenhNv7lE=;
 b=OFzCl09Klc11R8CgvnxC4kW6637wpWMTUkOid95RknR+ebGIvYp+gq/m+/5kMlicXq6L
 I0vbU0OpZfzvtRtBrxVawmYQuqf4AnL6+pU3rFmWaqxGpcNVfXK85Vk4PSiL3UNfspPrt
 A1OCpwQpLSFJFMQNjpCLbZQTPR/S6ylVYJ16UqvnGRdkiU3UF+8Jjz4Ej8cxFHtV2abyW
 3lTfZlilASrdN83qEPCVix+Ayt7dN/e54pBP2fG5Xpd6eBCVXdfmbOHqtutxfsowLzKdk
 85i2h7RT58H46c9NwmOlwYANfShqd0qRizPtbtJcBCBGs3AewlWV45OSjMZZ8K+Q0ug==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BACF414D3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8716E8A318; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e73e8b7042eb58c4ad3f940736b588dd5ced85f
X-Git-Newrev: e801ebe04f3a4fa7d7f9f53c4325319b6baf97ec
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.8716E8A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dotenv: bump to version
 1.2.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e801ebe04f3a4fa7d7f9f53c4325319b6baf97ec
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-dotenv/python-dotenv.hash | 4 ++--
 package/python-dotenv/python-dotenv.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
index 53ab12e11c..3e9be0ef95 100644
--- a/package/python-dotenv/python-dotenv.hash
+++ b/package/python-dotenv/python-dotenv.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
-md5  72b43685c14b492ced7ed6fb1e3f1d63  python_dotenv-1.2.1.tar.gz
-sha256  42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6  python_dotenv-1.2.1.tar.gz
+md5  ef4507c345544f1b9ef984b8e31eaad1  python_dotenv-1.2.4.tar.gz
+sha256  f0d53e69935a851c0dcc78f3ab7aaccd8cabef0b92382b576b824212902873c0  python_dotenv-1.2.4.tar.gz
 # Locally computed sha256 checksums
 sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
index 6ebc4f6c8c..253fdc1e3f 100644
--- a/package/python-dotenv/python-dotenv.mk
+++ b/package/python-dotenv/python-dotenv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOTENV_VERSION = 1.2.1
+PYTHON_DOTENV_VERSION = 1.2.4
 PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
-PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f0/26/19cadc79a718c5edbec86fd4919a6b6d3f681039a2f6d66d14be94e75fb9
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/74/26/2fbeedb218a787a5eea551c7532cac4e009f83d689dd2faa0d0353473f86
 PYTHON_DOTENV_SETUP_TYPE = setuptools
 PYTHON_DOTENV_LICENSE = BSD-3-Clause
 PYTHON_DOTENV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
