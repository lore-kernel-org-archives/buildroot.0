Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CB8CA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F8BF80D52;
	Sun,  4 Oct 2026 15:59:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 61zQ-bMzo0Mm; Sun,  4 Oct 2026 15:59:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 26B5E80DAB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129590;
	b=QDn6ZOKwm97ovz+BqFz7LGh/AIVqGMHWmaU/pLtxHpU4gFbSRD+3cZsvi3+QFgktU6St
	 ph49JuFUVa47GVDfT8+3x8jEFUForFqSKnm+U0Z9RSRMI1Uxbok1rICS+c+/hxZGrQb+7
	 UEcD8nKbHmGzIK/oVE8CfGiKJW6hUId1BsGeJsxtuAld1qkSyzCzEvNXFq+akQKNTjNis
	 GFfgs81G8BQ86IaWw/BBGfOraCH6HZS+B8fnFs+B5M1UturKJpsPoWdYugZ1ErNIBmdF6
	 eHIyfxcho4RDZsTVx6DzliayQGgu4/371WUODa8l3hqEIHKaiFW7AEuRVEnBdNjwX/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129590;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PeIQcy2m+WJWCldA87eYmIRiRt9q57q/XmOzt+NFUYQ=;
	b=ABTLqRE+Fo6XpmALUNdPYUogp/JUQTJQY3UQpr50eUxe1xDSghNk8IcrKWZ6XwBHTgzv
	 VThNwTr0/fUTE/bCdeFBNCdsabhxvdwAR0crnwI4jBl69sJ16frQ2p4nv7EF1CXbyZ/NV
	 oC3Tn987GmRqpMhS54gugY09a8JCUQF3C7rarrDFPjs1sEvw8HpXYgTgjd+9B0tH47DRT
	 gLlCAktJz6dX2GteIMu94wMuwhc8j7+h2wOkSk1sT6cMP7qFvi0EsfITaCbIeV/jzzaRg
	 +sSfZuOYYRcfLywyzZLZrQ95EvErYXPBvLjRNy4TtMTh4RWaPYOp6xCp1bewDhDMwkA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129590;
	bh=PeIQcy2m+WJWCldA87eYmIRiRt9q57q/XmOzt+NFUYQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Zo3/psxAfbKAaZp/vfAwL9IdH1tN+lPtUhXS1HJX3zCf52aMWpuBybZz8h9fdb1q4
	 AnkIpwXWttBYz2KHQolB3Ewcfb7boGu2mgzrLSlpHUD+knVI/tW41c0PMiQg16S19w
	 oh8ZEouCOm4AXVzvlofnPVVXFxP+yBgHvnv6IZK9z55xE6LbIfRRgin3VzAda+mhC4
	 CBnD4VnYHigq7EToFH8LcMvgBaC5oZQn91/Bw5ITCXJbMMs3KpOC13afPPM9c6+SjL
	 oJluHa+X/42eAai8n1K1hS01m1ExHDb0i9KdC9H48PaqraUeBMsykGbzfikxXX2Hyd
	 JR2+DkjxRaGvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26B5E80DAB;
	Sun,  4 Oct 2026 15:59:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C09FF2E0
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF8614059E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R926l4B2x0OO for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C7F40405B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=Q56llx8YrAul0CN3xxhRlRYtycSIRUmazZY+xyTp8aGk/Tf9fooXX7+1/RB83wSF/DDu
 LZY7cFUNt3gv3mmMZlUYANk2R2p0GrMp4QgSwmcHRTIhfjSN785lYSq2z0KOScDHbP3bV
 R0G2Paz3NjBWwIuue5o7jqGXF+BcsyB3+h8Ey3le9iq2pzmAtwLkcdT0XCnwsITd2uszd
 UAIgTYjhG0iF0ugEAkNLYN5K6veifk++S0pFZIA+mb3keQvnfn8FRAQEalQ0kWFc6hPQd
 Bbk9B/55zCsLpl5k+0iP2BlfS+ETndHbDqC4FKU5NdWJE6FIDZtlrmNU9S5cnuSkMGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LT6lqrGtZ7SSTvM9Vqo0P+3ypTDV4oaFP3xACVDQa68=;
 b=gek1OEzZPBoy1/KQg6W6YegGCc/M3/JlGXnUy6JUZh4QcKLuURQekru72IAJj/UcwJH8
 vUOrv6m6doci+01+1ep8bCnNZrbmj3/Pna2UIhtPxCvUTtYNeGc2S2SLhdZOwuwE7/g13
 VquB+jSTrl0E+NMEnWV6UTzwpbxAv+ercccbPGuDwNqWZ9WFCFgdItTMpFlNAiAYXF3Id
 SiPN8YYhKaBUxaetRdIB3kdloqLf3RmSkj5aVYkzB2JYgqb4wPGPsSwH8okSGdqUs1D3O
 wc61CWfbLocI7mADDOUP+6tmEZYzyX5eife/F/uzrs2uG32hreoU//Aa9kmVGl3mAKg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7F40405B6
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8EE39886D7; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6738864261aba4061b99f0685a1a77828393dcc2
X-Git-Newrev: 933507e0d95d5f5c2a0b0f3418653fe5299a30aa
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.8EE39886D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lmdb: bump to version 3.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/933507e0d95d5f5c2a0b0f3418653fe5299a30aa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index 62ffc2e446..7fa4ec63eb 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  0fb37c0c840141773ac8b4b0e9679fd9  lmdb-2.3.0.tar.gz
-sha256  260f443640ee2da3cfd059a84258659319ff39ca912c16bf9748c324076b9d09  lmdb-2.3.0.tar.gz
+md5  62c3f8e65608912c94a48299e3634fb1  lmdb-3.0.0.tar.gz
+sha256  06dda0723545e14d56ac7dcd6f582d9922c2ed5e16f1c3f8d0e670a96ec2ee65  lmdb-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index b5a0db5dd6..88364b447d 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 2.3.0
+PYTHON_LMDB_VERSION = 3.0.0
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/aa/0b/17f271b2d2d314da9c9bc7620676ede1feca5f565f3a46045319351f7bc2
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/1f/80/24a4064047b1c98ac73c0ad806f16bcd2d800c2eb460d6e6c2961034b8a1
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
