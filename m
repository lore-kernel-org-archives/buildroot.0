Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71961CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9314941120;
	Sat,  3 Oct 2026 10:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LIGxxlV25i2H; Sat,  3 Oct 2026 10:07:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7CFE84114B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022038;
	b=aBbRlv5hFVXBc57yWJZ1p8WsqvH1njllBsQWkGAmxQsnmW5D92eciHPWGicUDgDlY2dC
	 69Uc+OwDnHS/8AUIfpxCeYtx+rNxpzgDYB2UlwUfsp2guOWZUyd3Hv67pob4M8iWxHW9t
	 ib+YQ57uNvTS/SxRqNakk8jDT1+8J1j4UQb8EFDYjBpvMa8Hr/uGKeDultZopiMImzPWk
	 7L56+T3oKhjgKJAuFarkB+3kfKG6rqCh4NriDnbGMpyukG3lGTWVG9f+5bGG4yCweFDBO
	 1NIhUxgtjNvzaqyWEKMvZ4YL+XuhLAzGKrMHcCCrGXTaiWoss5zvfZ36kPn2TrydN1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=QWpyeoBBjLfK6Aa8G2m3DL+OkQ/qOYanlCt/y/ytJoQ=;
	b=Vcjm3fPM+E0aywC3LNk8y/C/Ks2LrqDxR5wZx2efjVstfg6Tkbh7T+Pz2Gg1d6pMEnXY
	 7Y4OF8MzDVbl/rmZJ4S4Asah/k4/5OVTPZDmf0x8BKc2cBz3IJ/M3z3Og13/bUg5+l+2d
	 P5uchWjeUEGbbTB3QCHmls1DC94wgGNtH8grbXqjuG5vDoGanSkfC+bbi9qXOfVIrClQu
	 ijiPDkitoArLxTpsuHYrR1ubnnHTc/0+I/2yOxI9SE3a6nXA2SSVoVC5bM6jhfxHsqORW
	 JqcAwQl2acvkDQFbfL6JQh+2/LqSOrErgdvSq3CDhv9keD61pRginT2K8gXDctOko9A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022038;
	bh=QWpyeoBBjLfK6Aa8G2m3DL+OkQ/qOYanlCt/y/ytJoQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I/d2XBlYJ2JYwDl0/gddxiW2d7j+IQ6N608CRS2h2IyR1+ljYoCnzHjXl/+cGmeai
	 tPb+jy9YmtIaKWC1hjLafDe5Sg9fMDO4iGCp9tpQPNE2plhH/Ytbs9krWbCJyeSfAg
	 Wnqls75beZ8pnI0Oo2YTUTvjilV55vWffXBR+g/KWSOF0eFz6Azsxg7RgS7A3YWHTV
	 cVP7oKD3lCYlFJJMk022NlfCjGWqohr5p1AHPeR6UZyw9UMMOOrnSSr1AIGfZqhrqe
	 xQQmUAJKi+opX2lV1ZAMO631+O4owFlNnkmdFc6HZnLaWlBznejoz6wYMORcPoTf47
	 5fqUL5Pk3iq0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CFE84114B;
	Sat,  3 Oct 2026 10:07:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DB030335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD0E781231
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bVOGtj9YcKa for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 327A28122B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=m+rABtGO3dsa2pgnl5263/mq7kUkdexvmRAyJYuEr8oWKiZao0aBy+XstWz3TbqSDFin
 sXwnyvJkdqRCHd2otmbZ/PxmYtbu+phrB/1ZuJnbH5PcefO9TXCpknqiBZfRe2IQEJYwT
 i1/qUWFVN9USQCAtL5BKXvhDKWIdItzIQyhC53wykNW33yTGxCQ2UmD0jNdnziN2iwu2S
 0remEL4RZ/qWIfixGfFa5UmhgaDZSVZKV6CpIm0XV6TIqdcFQPAZieNt/UZRfFVrEz4tT
 DiYCn9405/DjwhPMDHDhFGVoh4y82Rg18TXE2SOia3MJ6NWvyEnOd9NZ8tgQxql1kFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=654OPYzCNVDvZnUY2BvcUujgkW1hM1+JefLsJ4PnF5Y=;
 b=iZSPiXZVypsMC7OJPVDWo5mBMq2ubgeyNs35Fyhx6fWcKa94J+J11uOLIAsjln4eILa1
 taj4BgR9mv+59iTSajzhOw8mihpFSWcOYR7J3FoRa8WSmDhVl+wv06vMC0jBU7oW9srzn
 cquOcac8tYs/FUy4pQWIxmuBQugS4SQprm52smGzgshBja2nn9N9wrrrFnbt2h4r/0aJF
 YRpajs57In3Tscg3UWk7qCWAEIsn3R9y0BmASgfPk9jDEDdETVRGG4MSWnnU1uvHBU0gq
 4g3gCjSRakWUHs/5ieAm7skudon7cLX4qXx3R4IDwNnkWvopJJ0T3p/aKdQ+JXsJKgw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 327A28122B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90FCD88801; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9907533798ecca28c12068605fbb9d751880691a
X-Git-Newrev: 2cd3be96590717be41c8df499433bc3f0611dbed
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.90FCD88801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-networkx: bump to version
 3.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2cd3be96590717be41c8df499433bc3f0611dbed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to copyright year update:
https://github.com/networkx/networkx/commit/92392ba712131f01652a822b7dfb127e0762ee14

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-networkx/python-networkx.hash | 6 +++---
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 5c39a1ebbf..c2a6b64708 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/networkx/json
-md5  eb7fada9285b28cc9d6327c19240a793  networkx-3.6.1.tar.gz
-sha256  26b7c357accc0c8cde558ad486283728b65b6a95d85ee1cd66bafab4c8168509  networkx-3.6.1.tar.gz
+md5  c5d993f3052c946b77a36904d92229c0  networkx-3.7.tar.gz
+sha256  fd77a511bd90f39f3d016351345b52cf5319b813bdca01de3f755d3cca62e96a  networkx-3.7.tar.gz
 # Locally computed sha256 checksums
-sha256  3cf7c3a179d817b23b8b8568211769fefdf93797d207d984b8b2fa24d0220b33  LICENSE.txt
+sha256  6025f323ea29dc2f0ee0abd9523bf910186f55b0e148e6ebf646c55566278e2e  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index d2495590be..f35e3677c7 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 3.6.1
+PYTHON_NETWORKX_VERSION = 3.7
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/6a/51/63fe664f3908c97be9d2e4f1158eb633317598cfa6e1fc14af5383f17512
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/dc/76/3af777226b63a5e64a6b36b1ec5855c14e2b94a37096d4760e595fc43511
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
