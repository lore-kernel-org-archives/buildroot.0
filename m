Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CC2CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F7DC80E83;
	Sat,  3 Oct 2026 13:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AFy3up55mXkT; Sat,  3 Oct 2026 13:57:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2A1D580E35
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035839;
	b=JZyXUNyB1lhG5F3WfKLBmTnR7IEB8ORRhvyJBAixBr3FBfc7V1dh3K/Z18rngkhDsAk7
	 maOwAXBa/7ZALzPR902ObnKxtOcUTRWhV+iHHBjsmCfr3ECTlSezRqw6vJiM/9QQ9FvwP
	 HdDpb5Z0YZnxijR3G/eNFC2hpTTsXH9KpQ1zeZJqGD0bJA8BRnYLNx4EoendliodflGVF
	 tas0lELjcSCyRI5CNHCLvpD/XE9jPq1qFAvetdSf1eGdhPfMOUYuMGpqAZtwjYbIj2sD+
	 CqSovUqX9uKDUsI4irP5Io0bYnvxPbSWyUDXOG91YFKVpeErWiBo36awK2MgphswHEw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=X9PMq5aHj3XFHKej7wrA3RH2fnx2yloRiQI1a0rqSi8=;
	b=NHHAkO/CKk8uYSxS1C2PQ7AywEyd2F+Wtx7D3jgwEJHcNTZVz/EOApkIT6J8I9jc+nYw
	 PnsakyRcIq6qgdi+YaDLxjDyWH4uR0RavkDOSew5eKRBIWoJcSuayTv4GU2a9ArHhfn0V
	 WlyxWl0KHv/LXnOtiT6qdUIJYFdehahqTZ1oncfGQbtd5mrpqnOGn2HYjaItGmd5FbpDo
	 g+G1INsbB33GCl0VQrIiReEXGuXtVP0P6FWsyhEHGqYFxZh+sMaI6xRlUqOB/yFlh7PKu
	 HN2bp6vYqMXiyN/PA2sgCjl0KZDRH0e7BqmxZ6khOYHnj/UbNVP1STjjnjfdiFgRQVg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035839;
	bh=X9PMq5aHj3XFHKej7wrA3RH2fnx2yloRiQI1a0rqSi8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kkohp0k8Oxb+fxZN68rMkSbGiZvVxMBX/a2jQMxBNxelV0nQhLhyO9iLz11JKt8Dn
	 1ZSW0b/fc9+PdDfhdyo7XK7jpR7LfVoRb/QjMMkwOQtj+EAQvUPT2zpVVARt4D05Nh
	 4ni9QbZveG18Lk+Bp5o1iIgnaHcFUCWGxvJYQJ7WpINrzBJ9RXaB6bbqqK/sAmlA4k
	 uQJY3jRwQhSlEDFuRPNzhnbBw/UvdT8C58Nng9gH8bU3R7EU8jeFO3Uipv9eg4ham2
	 gGrerhGjD3g1bcUPXyqnCEOEgchESebFs5QECluHG5tl5X5eZxyTdoCn2qh4rnRFYs
	 4o/kQg/aSGN/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1D580E35;
	Sat,  3 Oct 2026 13:57:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABD6A179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 948E7414F8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UaY5CixpZE96 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9509C414E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=ZJcvuL34LyxCs9CcH+JfzP0zTbZNx1bFHU6nOvUudPGAD73vxohLEcrZJ00tUCnxTQju
 OfFGBScl9crltbbTUt0PG4pRJgXaLP1vVUNV3QDnDTq0ZM3eNlk00iZpKtdQXeM1MQspf
 5KawSxIVZcyhBXJ04Ly6Ajez/jGQafKhbV8Pz20vdM8//GYbzJCDpyJ2sRjygm832IBQy
 WkVR9+TdXq/WeK4iCgdkXsd55Vv06mq3dV5kA8LM29ExaxF6W8gbExOoFom7xPDfQBrC1
 fbZF3tu/8qBEjrw5mVdhqyCtFqndnO/gp2ff8ZBuCaaRkIeb7agbaDtz9KEjhtYvQvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VANA75I0wtwETcJOKHSw7QnpoCq9r1XXgzcYC9Nwfo0=;
 b=KDt0NhtA7E+0D1g71pLJwHn0l4+x6NZ3hfskAOz7jx/A8B9WmIqibzQGPAo9uuf+pWjQ
 gqMssmUc5coK/96lbehK0fW88oj/JCfb5zaDm8b0ZWgB24ebDOU1PryeFMiXMYg+6CbIP
 z3S16CgLo7wgIlS5XCgcRyK+qca8JucqMoNzmO9QRNzVr4+7fp9ECOc4NbCT7khgj4SvS
 5ax2xMf24Wc7n/488sa8BCg5QBMzsy03a4IgLuQp+/Z0DDV8nQpgSNY5o03HmviZElcYG
 JoU+DLPQse+qKe3NYZyh7D+yMedwbceQRmwYWFwWfOj51EPgNP6SLsGYSUtE7mGLAxw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9509C414E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0AF88A318; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6bedb0de293ac88558d49bf3ea9c4d0ac14883da
X-Git-Newrev: c0b216e6ff696b374416da25bfe20d142fbfb8ee
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.E0AF88A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-propcache: bump to version
 0.5.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c0b216e6ff696b374416da25bfe20d142fbfb8ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-propcache/python-propcache.hash | 4 ++--
 package/python-propcache/python-propcache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
index 347f232927..1564f0591e 100644
--- a/package/python-propcache/python-propcache.hash
+++ b/package/python-propcache/python-propcache.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/propcache/json
-md5  9efab9358cf05265dbee69297e0de96a  propcache-0.4.1.tar.gz
-sha256  f48107a8c637e80362555f37ecf49abe20370e557cc4ab374f04ec4423c97c3d  propcache-0.4.1.tar.gz
+md5  a0ee7b9105e3b9a423278af3816c1751  propcache-0.5.4.tar.gz
+sha256  ff6b113f50bc066a698db5d944d2c6dc7507168dd3341e255a8892fd0715a558  propcache-0.5.4.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index d1f659498e..90f1cbacbe 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROPCACHE_VERSION = 0.4.1
+PYTHON_PROPCACHE_VERSION = 0.5.4
 PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
-PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/9e/da/e9fc233cf63743258bff22b3dfa7ea5baef7b5bc324af47a0ad89b8ffc6f
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/b3/9a/9fbf4e4ec0c2d7f1c32519fff782ef467859b8faa9fbc5331a96f6395d43
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
