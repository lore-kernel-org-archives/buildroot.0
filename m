Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527D9CA5FDD
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 19:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D898135A;
	Fri,  2 Oct 2026 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q1z42NdLKJHk; Fri,  2 Oct 2026 19:35:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2091681354
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790969723;
	b=b+nLo8E9b1rdqXx8aiyGNqTr8+8n7cfBfgOL2sS9HJf2AYPKjHUEpc3hZmBZa5RJOGfc
	 r5PqUGVhaLjUxKP1SpGrjgtQMDm1U63FKq4u9CL3T9qaZpJtvtnJomCFmZgQoqF+VeNXP
	 TTnuwr30we+TkdbQftbBBKWtLQrSiYjXGSCUt9g+S8SnTNm+0eS3scyz5BX/5Y1q5y9g6
	 8v76zYM5JZshjcRuXSbO2PJhEdyOf2a4oPRADPsEiOBEUi0Yq3wRcn9bUPBka7LS9v0Kg
	 b8CJePvvvmiCi+6h81kk3ocdLLm6opUCnNHb+Of4i/AlD9Mr5/OmFiOiMuyToe3U4oA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790969723;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vByvkTHhGgazqZpWbsMbhSqy6a7tOrJmmNqR8m8Serw=;
	b=eeSMS2C3l1ocjZc6IhhGlHzz4vxlg6z3zBO02SQ+7CyuB50Q5rkkRMdxYc4+l1wZvDsR
	 +Dke2ciKY9cjgu6+o+KDmoB2WyUT4FPOKWgH7ZwQhT+k34narZyDVSz646K9GHzrD4w3m
	 Pvwp3z+0qUHJGF8UhK1SWCqzlP5KN63PeHYSNcsUisaMlMoC8hhEWaFQhuJv9RCbi/gJr
	 ywVq8bVQIk6QIgrVETrUNRxuZ7UDD/UxCfIli7/7yHifpTm69Bi1AQ/CinZZtNYS+E7VK
	 +qVys+4797ZNq1laaHkG+mkCF6sFpVUrqJVO4GEOr2XlW5ra1pnSltk+R9COpKj23WA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790969723;
	bh=vByvkTHhGgazqZpWbsMbhSqy6a7tOrJmmNqR8m8Serw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X4bzYvJPzPmvlF0Ym/i8IQCfKmZhostg+jeFoFC+OOtBeKotBjDjDrAEh/f4oWhhm
	 PgX+gtaQcItftgQiTW0wNceclwqAWm+fK+/8xbb+omdzxc4ygQtsm5Qz8SMhqYiaaj
	 devEJ8ZsHZI+D9dxxnd2vtZ9uI1aJrqZZV5wec2vOEYnwYrDZf64UTEjJq5qesWveq
	 qZKaMjA7JwZrJ99yRMwpDml2fFVtsLkhANuPR4gEcg13sjyPzj4/dO6frPfWQuBILE
	 YE5VnSp5+tYye3FKZOYtG8m77N+YaDpPFA4fiTjIrxJc8Fs5aEJiGplqUx4/A4vDeG
	 N+5WSqVd9ew/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2091681354;
	Fri,  2 Oct 2026 19:35:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 62F66282
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 554D540B78
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0L0blRq14wAX for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 19:35:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4EB2340DC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790969718;
 b=lD84rzyewgAnAn6kCgFY/g2gshGrFI1WaqJVrWLiO4yDmpP1nn8sOPS6f4Fd1xL0sccp
 Hr7KPhz14IxKPOmvCgd5OrcuZKpA44bfx6yO+FBCNArTZp5MmAGAWPK3ToBlFq/7hu7a4
 PhhP6oGRMYkgL8ERfRITwKWg1peUJCibSy7yea4AzAEvTkcbhLOqGVfWCX8SA3K2LiFct
 RxgHgASLrd8m4dsp1sIVKvCLzPiHLRtzuVHwg6zOb+48D6awgOi6e1uY2uDS42M8yt2fK
 1GbeOMbNq3NZojMaOWL+ZSbSt76mLhzmtJnxCBDyVs+QfrCUdUAQnpTg89lS/lJ8KLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790969718;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=iLtSoGhPP8GtcF6b6QWc55gkdCs50yqJYXnOS9npXnY=;
 b=A+OCT3GoeYYuTrdjIlIK7IM9zTccs66Fh+Pov2VtWCEyZU/AunTq1yYoRF7RIFRpC4lW
 snd4NGlDPg1M3eHem+CmZ8CTa5gZ8D2+CNL0NaqogIB+3SeY9iOj83KYNS+ronintf/Jf
 7zbi0ST9UlqLx+bqqywN9Uu9IShVPKbn4HNhdPQP4oATCWDqWBd7ExMhOf5vReRa8ZC1x
 I07RARRdA3SaheOAPVZKwiO+zTX8VW9iN4qemGPWwHdC4o029FCSnq+NCCHXLHLK3wp8c
 BLkMFb/+DUq1+JYs2jqDvcd43jQPPKqaiEHxH8ac4XY8ENQB/QWEa+IHCPnNXS4hJ8w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EB2340DC6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 19:35:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00086886C3; Fri,  2 Oct 2026 19:34:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Oct 2026 21:34:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe21a5fe307239c842f5a095fe4f8e53c5c3e352
X-Git-Newrev: 845982a4f4a5057c88d5a88f59642ee97b05638c
X-Patchwork-Hint: ignore
Message-Id: <20261002193404.00086886C3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lzip: bump version to 1.26
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/845982a4f4a5057c88d5a88f59642ee97b05638c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

- bump version to 1.26 (for details see [1])

[1] https://lists.nongnu.org/archive/html/lzip-bug/2026-03/msg00005.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index ec8a86b29f..64829c3ce7 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html
-sha256  09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f  lzip-1.25.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2026-03/msg00005.html
+sha256  641cf30961525cbe3b340cc883436c8854e9f5032f459f444de4782b621e6572  lzip-1.26.tar.gz
 # Locally calculated
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 9c8c54a8b1..de8cbf038f 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.25
+LZIP_VERSION = 1.26
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
