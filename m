Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EF7CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9682C40963;
	Sat, 10 Oct 2026 12:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_Z-DfCPHMel; Sat, 10 Oct 2026 12:10:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4C12D40952
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634259;
	b=TWfjRKuexTDgNbtGNQh9u//NXL+fXs7FehYAUlj8PBq4w+f818hI5h/4NmF6vMxlf33t
	 OYEiEEfZfsADTi9iP0bfv1UtDFktTdjoANYLvEFq3bAZeFE+5GpB0JNcA09N6KAfy83Tm
	 YciBgTFn96bSFS9Fy2ktqmR1LFizzM0UFMx9ILcAe1oEuEYBraPL4aGAIR1GTL6vD2VPM
	 ZEHQACYVJmCa2OOZqE82LC3wlwZrkYK8G04AXVrO/zfILaUfdcuVY120Au3sIBLzyJldy
	 L4qe7JPxWu1vIxVLV3Gp2TI63jGCC7qQu+CE0dy1PclkdWnDE6+HrirZiCGkUAIxi9A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634259;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MqvG1cE7sDQRbiyT9z/ToX6hBZZi3FufJHWeI5Qfy2g=;
	b=gSBPVEiEEkopiwXn7bVU02mkSfoRvcUr/tF9MWZyAOzjowUyJej4fIQzEtVs0VJdWjGV
	 YWc+tx+BY3bpmlgqY96IZlFknck+kj7fqIuAP2YQz48AaFNiCRDG7wSL3IitKtidopNLq
	 ibldHu3aD6odSRYnk9L4OF2kShnERL2LqiHUZW7SmgLk7hQX4orpVDIRQFfR8XJ+MzdyM
	 UaW94iYeoAJqcK1mNQcX0tDVNNMKzPuhwi1sjghRyyFDsQJjp3npoT3RgeCgIn9Y9wu3H
	 q7hFJjxAGXZF9tVCfNVfNHiMSg4chTe+jAYCABgAujM6PfOJ4cHi9OB1+Et369SD6ww==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634259;
	bh=MqvG1cE7sDQRbiyT9z/ToX6hBZZi3FufJHWeI5Qfy2g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dIDkmgP7WQotS3YJklBBpm60V4OEwqiqDvJ2/pU5HcrgmKYQKRrc1bN3AMkctx2dj
	 lkc0ioe9DQsF6zMpoz8DZ/ePfkQfuFzwxvjvPnHCa7Yc1wEQVKl31KQynfZZ2FHjSU
	 mLDfWybwewFd5DcSJInKcjeys72cumUakoYJTvp4QFtN9eU44HZXnp9N2ZL4s7d6BR
	 2A1+1S0jD9Uga92mc0NWw0seFxxSyLGhoAJl4YEJf4mXBk3uFImwx/K3Scg9bvOWaH
	 Pnl8ZqXnvCSReVk5SE1bn1qKM6FU8eVFWZqakeR8MYOfGX3QLCjPqfQMlOApY5qgcx
	 AGz5DxfDDa1Og==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C12D40952;
	Sat, 10 Oct 2026 12:10:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D22BB9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B509D4017B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iKPn7HUYG7Bc for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:10:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F3E2B40116
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634254;
 b=CLMXHJVXoEvvg+RrDImGxnGN6z08wS9LoJGhswFpHl/hT+jiWysqKPKUBj4mbVcvm13V
 eEGO+hDeeL0uylT43wJWVxCqOmAGD/pi1S1ki7a4c/gbDEwH0tzPbDwL4msi6010XcGDA
 XA2TRwm3r4ARYgVJPku4tskNsLfPQanzKuZBE5BK0lOe8+hyvz0RjugB1JNvF5P84fzpK
 q4xuLcSyQSQGIhCFmfoJj4/KGS9QlHRkNn8DPOekkTLLwLc1w+gB10/gbrFVQFSnqAb/l
 6bDwG+lGvqfdRy9z4UWeP3neRn2ChYJnQxt7Oaoqn8Bo/sITy2s9X4gN9L44E7Py0JA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634254;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ln5wIq3chuQA51V5b9Wo+PNEp5mYQpJ1UU5luXoVgD8=;
 b=acdvkfLUW0xIL5oSVCC4B1ULSgJVwZu3lCD1cwzH+1S6nW89dJ97tDlgH4TK5fheRJEB
 3KRsfb7+SOMDPR+QG9npKCAhbsGoyJcKSqgG4UT2RRLHowxPDczsH2UnzCmGjYsfvuTbm
 r9KlFn0eBG5ZSaRO0XZagUgTVKpQFaHIP4czSq9KBjXVk+e0/YRaJDvv2bD3MqbOaNtWQ
 8jVx0GebniTeavwxI6yk3RHSj3elgHamMezHg6InpJKo9L3TOMKERpLLtgE7IoYuR3rIO
 4YRcW/fXPt/A3XDKdySamGw3nXXReCFDROvBULg5Bme/Ixg9MLlhXcfYgeqI6W9emoA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3E2B40116
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:10:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEBD191AA4; Sat, 10 Oct 2026 12:09:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 14:08:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 40172529d2524f82c7a8503dd6871736b1071d38
X-Git-Newrev: 7b6b90b7747fa667293b0da0554e809f01f510aa
X-Patchwork-Hint: ignore
Message-Id: <20261010120935.CEBD191AA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/circus: bump to version 0.19.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7b6b90b7747fa667293b0da0554e809f01f510aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Switch to the flit build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/circus/circus.hash | 4 ++--
 package/circus/circus.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/circus/circus.hash b/package/circus/circus.hash
index b9e1ef2e68..db7de203b7 100644
--- a/package/circus/circus.hash
+++ b/package/circus/circus.hash
@@ -1,4 +1,4 @@
 # md5, sha256 from https://pypi.org/pypi/circus/json
-md5  9887ddafebef7475c08ff2c8e5cc2fad  circus-0.16.1.tar.gz
-sha256  dd7c011eb67785a1c96a4db94a56a22810c6ed608cebf301152dabc771654c5d  circus-0.16.1.tar.gz
+md5  e737525ca9196708ac4ea71ba55cb816  circus-0.19.0.tar.gz
+sha256  fbe6a5029998ac1239b17ebdd38251ac8b22627d30e4ec6f68cb10233911b0f4  circus-0.19.0.tar.gz
 sha256  3df739c05a4eed7efdf4987142658d2a4f1243e5f08e72a5ecedac5749c92a49  LICENSE
diff --git a/package/circus/circus.mk b/package/circus/circus.mk
index 8f650de1e7..f56ac9c146 100644
--- a/package/circus/circus.mk
+++ b/package/circus/circus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CIRCUS_VERSION = 0.16.1
-CIRCUS_SITE = https://files.pythonhosted.org/packages/09/8a/44a0b6b35ecf5dcf22bf51e4bcf188ec9e7ab9dd4c14330ba1b8bea51102
-CIRCUS_SETUP_TYPE = setuptools
+CIRCUS_VERSION = 0.19.0
+CIRCUS_SITE = https://files.pythonhosted.org/packages/94/97/824bfce6949716ea93adcd5ff8aa4c277f40a735d7f644669674ec132ae4
+CIRCUS_SETUP_TYPE = flit
 CIRCUS_LICENSE = Apache-2.0
 CIRCUS_LICENSE_FILES = LICENSE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
