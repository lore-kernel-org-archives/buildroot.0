Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E6BCCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54FAB60E5F;
	Sat,  3 Oct 2026 15:56:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iS-shi6F2Coi; Sat,  3 Oct 2026 15:56:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1E79E60F28
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042960;
	b=hGV2wFJthpTIaGGUTSpzkOWwtex9VGQAKFUQl7nNCy4Rg6ciRf39/GBN8AKIfcwGgrPH
	 xFa59i/TKRfeYYzV2dWZTDuvo894nhep/gZ+65x4IboHgSvg1N3zMfcX6gjH4/2TmDsqU
	 AJKJ0Li+ouMdA10Liz0T3pSma+oJ5QHENH6v1wEAee57Qkm36q0DUY7+XfkKwU/IevfKe
	 JjDKqCJtcjX29G6JOpPx03J4gCOzkV3Ni5eltJnh0IzXuzSMy8HrboZId7mhlQPPjr+Zj
	 jQzQE4NXsswE7HKxcRdjjjTx4iR/2KuJQj1zT/dvNp5JwmArWuckPrtpOOOJirnDsSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042960;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=O+q8LHHovM/+3U0D3QOYCEHq/ze4pAVMl8HzH2Np+aU=;
	b=G47bCrDgwTdKFQsVLWncsP3VQmnxok7s2HVny58+16ReFvhODdeVXGn5SC7TWXKg/wxo
	 l2+srb6JfRWtoG5cf7UykY3kapFrpPjn+62qkUK8RVHeo5jUbFSr2z1ECg70sHwPAlA6j
	 raq5CjC+Lc4GPJoTF3arH8yaLbv90l3zX9fmbEtF8Fq4iz5rdmtRBjJnrj0161Mvl593a
	 +E7fnhME6FxwEOwK/E1lukDTzAPfdqJE39NHpyNEFpc0B/DyzgNOp9zZ5hYJLSWlbwa7O
	 KcBdBE0bA8sGzb1Lnafv4/TTDiUHmhTma3MJmmBvN9BK+MXv6U0ahWQNRCGhH7UtVVA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042960;
	bh=O+q8LHHovM/+3U0D3QOYCEHq/ze4pAVMl8HzH2Np+aU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GpATXJvK0d7VMu43u1jea26MRwkXPDAO7F5Ebvw1QZp0N3UwoZZU/GuGhOaQNY2qj
	 SCm972GFePT2liMGkaKftlHZojMVCnIiixFuLJwbwpluy0c9gv9HeHcOSgpPMhsRV1
	 Y77tWcrj/BvqSnWgjxeJh/Ybjs0b1/1IIA9WRvQb+8C/QU82XiH7o4OadfIJ4ZSBVL
	 RV9thhf23T6MHgFUm1LHAgWcc5R4cphoYsXRTdSdutCb8QAW2svaogcBLGiVa3GxfX
	 Pur2izJMB4rul1RiI4Gpckr6DIHLixe8nlCK2QXKD4x7Vm58tbuPqWxwgiO09Jvp5l
	 rmmh8I71g1X7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E79E60F28;
	Sat,  3 Oct 2026 15:56:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9713E335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85438606DC
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id owaQdvJbQRDF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EE43F606BA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042846;
 b=R8qfU0rb6PkKfSuxyGQzWt59NdRqwRo8THKrU1iFQAMfQHtIdDjUd80bDK/sjfQ9oaGC
 FJVya5WQpsS2lBPRe5KZLzdvCthx1/3IrlTCzKGCUfHmrnjki9y977HcJCO6tgqIvmtqy
 Tfrn+GPgNeWPt6VKoPZzj0WLVIYzPS+g9i8Od5LGFYSTsN48nCl4NMKW88dywiALIM4Lg
 g3E3kc4DfRYShCdNQv0V+877kAvZMj6fmCrwYSXNS7K2ON8bqIEpUv4p9nCf5qFZxZK99
 AkktYOFUch1kmD9ZFLELc/18vV5sR3+Ks58K4L6PrbvnbVjS+Axgx4wvPG4cH0ATpew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042846;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=GBmHzJlBAFilRvRvR33an59zbp8QBZrIefzUmSqmECQ=;
 b=O3CeHsp23VcRhEgXuGqN2QPoeaUoHeInAliB006aBE5kqTqj2WXNX6NmjCqivkcphoB5
 31Cs/ZftHjqXhkMxiMjrMSwFKR96XpirIe7YdJePjKzUrkSQeaA2lt9MGB9AanaJAjThe
 aYIn064TxZF4//s32oo2DPCzFM8ZtURYTlpnz+wndlJErQ33McM+dHw1Bj44ZouldFlUe
 NULXNagaEDXfLOzZxcFhIJE0iSNGSfa8N3vxKsr5sZNAxZisEM6iZNtLaw+uqm3RgA7ji
 QZphnQQBmFkKr2PKOcAkodF3FyBl2hfj9LXCQco4lETqILiGsXYctzKi5ShJhkxuztA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE43F606BA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C1A58A30A; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b4d72a38cdcb307c52097a168b636d2b2c48f02
X-Git-Newrev: 12e3d4bf5be8bed7299c2e6183ed9020bbbf5652
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.3C1A58A30A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typeguard: bump version to
 4.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/12e3d4bf5be8bed7299c2e6183ed9020bbbf5652
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-typeguard/python-typeguard.hash | 4 ++--
 package/python-typeguard/python-typeguard.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typeguard/python-typeguard.hash b/package/python-typeguard/python-typeguard.hash
index 004bbdfabc..8301b99b9b 100644
--- a/package/python-typeguard/python-typeguard.hash
+++ b/package/python-typeguard/python-typeguard.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typeguard/json
-md5  c4953b5b4dc1d6a49d6cefa4f47f7465  typeguard-4.5.1.tar.gz
-sha256  f6f8ecbbc819c9bc749983cc67c02391e16a9b43b8b27f15dc70ed7c4a007274  typeguard-4.5.1.tar.gz
+md5  97f7a6d47ec36c36217889b2a57a0e0f  typeguard-4.6.0.tar.gz
+sha256  e7414f09111317de3e335de92cd397c5c0ca00b1cc1676de12e1d444a79b3f21  typeguard-4.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6163f7987dfb38d6bc320ce2b70b2f02b862bc41126516d552ef1cd43247e758  LICENSE
diff --git a/package/python-typeguard/python-typeguard.mk b/package/python-typeguard/python-typeguard.mk
index cf07bf345b..8a543eee68 100644
--- a/package/python-typeguard/python-typeguard.mk
+++ b/package/python-typeguard/python-typeguard.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPEGUARD_VERSION = 4.5.1
+PYTHON_TYPEGUARD_VERSION = 4.6.0
 PYTHON_TYPEGUARD_SOURCE = typeguard-$(PYTHON_TYPEGUARD_VERSION).tar.gz
-PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/2b/e8/66e25efcc18542d58706ce4e50415710593721aae26e794ab1dec34fb66f
+PYTHON_TYPEGUARD_SITE = https://files.pythonhosted.org/packages/b4/de/4420db493fa8fc0856d5e5c1b159c63a323d2de2317babe36b01568928e8
 PYTHON_TYPEGUARD_SETUP_TYPE = setuptools
 PYTHON_TYPEGUARD_LICENSE = MIT
 PYTHON_TYPEGUARD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
