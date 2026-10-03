Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E072ECA5FEF
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 976D781702;
	Sat,  3 Oct 2026 13:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqlbIcsvbNmE; Sat,  3 Oct 2026 13:58:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 975C581763
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035880;
	b=VmDVt0wrjG1jo6/DeYHrPXBjj233Qrc9H5sGs9Y/9BT7jDwnPbjNtNQrowWBHkWzCk6j
	 p0xlL6k3wtoKNtHKPF/AVZ4+yTt9EMEYG6wKaBc9/OtL8ImdidiAGnVMS2zisQyjK4v+4
	 JXqJxLgGFodohxeQ+PWZjQ3iUhtYLLGqwg83Byo/GejDmpRSp4T13sKob3U9ZrFaG/Csf
	 QERYfUGd1lgLt8Hly4eTmIg8BRQCH5DOlrYGByxjGiPmF3jx5NgfZZF0Vr+RfwV2SN28b
	 fNluEGGWhX6l4OGG73qpdX19huFoGZtFUJHhRmj5fMXcYg6jvnMc6HDj9WwLt8MHUhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035880;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gSpGhW6TdgSIhE6wPoudEe/3GFysIRL4yUivTTXnbo0=;
	b=jr4n2xULYXyp45mEj1auqu1R7jFEbsaj9J+BZYHVqX1gSCYaX6Oh3KJx2xp2JS3V0eVM
	 arJa7pf2IxIuQbvjS8aNiUHHzL7AOns4QEObDvy1WWjN4pJGPBgsHfz/uL4zs0D8q5Wmw
	 W0NNfYzGSeI3h6PVgcjxx0x1M54ql6TTTuuYwdZeqlvoHtLDK3xyrieedlESBS9NDQQR4
	 iSYC8kDKcrM+JFBi2VXPu/YACE2mlhWZODATl0177S9UKxK+BqMj+yxTaetcqvjVrZ0hq
	 Lnp2CbiR1v9ZILKrO5oQsLp53jQ6/Yv/rJDcgxLCKdJd6U6J32ypWycIqZDbcbog0HQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035880;
	bh=gSpGhW6TdgSIhE6wPoudEe/3GFysIRL4yUivTTXnbo0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gj/Cs1g5A8Zi1G911T9GBHZyapCvKVmv6OfvDtAHRqEh1U0ZN2PtXn4trqHOqyjKz
	 244QHOtrFfVzwAvyBxbg2KClziZyBbwomDTIVp+WHsTY6qn33JdUgUxUCOYofa5pmI
	 VQyUHsUfjDFcNJ8i+Rhq+1GwRA1W7SDd7RgCPpKCRFItkRykXbyRJieMRkxyBrhx+J
	 AwL9DaFVXUwxEotQVkp7NquBbHW/g2BROmChg/x53/anY0Iux811DvbwcY3tPH0rdj
	 iZQRXSCKAJaXVZtTGGInNxYc6qa8FdjN7mI7FvCxUoy3GptoZlPfa95R8IvXTfRmta
	 I00KQsAUern4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 975C581763;
	Sat,  3 Oct 2026 13:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C4B87179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B1D1414E1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWtP3atDjEfE for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F108F414C6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035817;
 b=LFOZoPze7IRjxmEgdR+VjNByC9HIOG+g5byAEHRKJbWjQdTFrd1pszbFHXuN0GTZzUgn
 U8GdnThtpy47dWWXDVkuSGO91vND1NXz560W7yVghs3c+xpX0gnFly15HijrcyoGNhh7R
 aD7FewUuBVlitEcMDUcu7BltttfffhEGEm7R/MRURRwQExJU2UWCyZXCfE7wWLuB4e/hn
 ajAJqqsDZsJFNrOay0HWqkXJofwEzwy46R84UMUZnV5Ym2n/gGr51lGaTJImH6NrWRxbC
 REHrBvYIOjeVkI/QtpUyAo6m6luemJonYrFg9WzYUo4R/xcTXnstVBVSmu4tt0scLaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035817;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ZEC0Gm22DAQ8H3Ywn5uK54JgVt42sVtHhUgYTUZC8XA=;
 b=hG9+zdqM0m+s918d6EqhpnIjdm1xqKICDu0Bj2HUC/JCi+QueXYfiXFptebYxHBilPsJ
 UU5wl6RO1t6Nk2YazU5q2W4qi6piu0hwcUfFay3iRVIcj1S7tU0tEWy+ifjyCCR/cVvz2
 21PbskHt6Qr8VJ1rPjZETR+djbMRCWfclUJElGnZlPGOtkAyCFJneNSoie8Zr3VVSwGTy
 uge1sVzilVSXqzb/WV+wm5WsYgpZnkerKhxfaze1cmAGBSU7ibyu0kZjEMOj0K1DMkOCF
 W7aAAsOE76Jha4kp5zVfMFsDCoyHeJuGui9//R2PBxz5nlmgNE4HmShS3k8xiC1o+Dg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F108F414C6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4857888FDB; Sat,  3 Oct 2026 13:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e3abb7f05a47f425cd1d2ec26cfb027f8d02ff54
X-Git-Newrev: 76d891b48389ce06d7330798b840774245a6e753
X-Patchwork-Hint: ignore
Message-Id: <20261003135542.4857888FDB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-multipart: bump to version
 0.0.32
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/76d891b48389ce06d7330798b840774245a6e753
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to the inclusion of the full Apache-2.0 license
text:
https://github.com/Kludex/python-multipart/commit/bbfbaa2f2239f3ab05e6d040c14475a74d24d8ba

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-multipart/python-multipart.hash | 6 +++---
 package/python-multipart/python-multipart.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-multipart/python-multipart.hash b/package/python-multipart/python-multipart.hash
index a5bc988b02..5163c82fa6 100644
--- a/package/python-multipart/python-multipart.hash
+++ b/package/python-multipart/python-multipart.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python_multipart/json
-md5  0debb97a2b5d68f8dd5119bd200f4010  python_multipart-0.0.22.tar.gz
-sha256  7340bef99a7e0032613f56dc36027b959fd3b30a787ed62d310e951f7c3a3a58  python_multipart-0.0.22.tar.gz
+md5  93ad538d98ed5604845e537d8a0cb369  python_multipart-0.0.32.tar.gz
+sha256  be54b7f3fa167bb83e4fcd936b887b708f4e57fe75911c02aebf53efaf8d938e  python_multipart-0.0.32.tar.gz
 # Locally computed sha256 checksums
-sha256  a8e833176cd617daf00b9d6d39fa15ca8edebc6d1643079cd2f4893c0c289be2  LICENSE.txt
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/python-multipart/python-multipart.mk b/package/python-multipart/python-multipart.mk
index cdaae6ef67..7572dc4a83 100644
--- a/package/python-multipart/python-multipart.mk
+++ b/package/python-multipart/python-multipart.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MULTIPART_VERSION = 0.0.22
+PYTHON_MULTIPART_VERSION = 0.0.32
 PYTHON_MULTIPART_SOURCE = python_multipart-$(PYTHON_MULTIPART_VERSION).tar.gz
-PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/94/01/979e98d542a70714b0cb2b6728ed0b7c46792b695e3eaec3e20711271ca3
+PYTHON_MULTIPART_SITE = https://files.pythonhosted.org/packages/5b/42/55c32bb9b12693c092ad250a0e82edb5b31ddeda6eb772de5f308b3804ad
 PYTHON_MULTIPART_SETUP_TYPE = hatch
 PYTHON_MULTIPART_LICENSE = Apache-2.0
 PYTHON_MULTIPART_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
