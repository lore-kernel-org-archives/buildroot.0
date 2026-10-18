Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F2CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 10:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F8DD4095D;
	Sun, 18 Oct 2026 10:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mzjwBOgGbAaN; Sun, 18 Oct 2026 10:37:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DD10A40805
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792319852;
	b=Floc9D6d7B6WyCbGKJ4Tzana75ckg693ZQqjj52x8n2FAwj8LJJI+fWSmOIj9r04WJfY
	 QG77OxSkIu1o6A9gUpP07onF5xot5DSbxYjovq0wZC9tygKRZ/PtatFBebNrlRPowTUE8
	 /IAM+TgfTh602vW1eahApQKSv8cWFjVYi+ilHecxfAxhI/0NdDsiU7qgYPpcYLCPJXumE
	 hHmUM4vmxAW+VPhwW9jLk6pIELdasc+X/bcv0mZJjxJ3VFRInkG2u83X8aDOVhpwgQQyW
	 hGsuGP1VON3vmAyBd3CMW2lkeXz64/94kNmUfZdbcrnaFiySwq62l49TojR3w6KDl0A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792319852;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OlGeIveLKijmoMDaXLfDrXq5JHQmqlNzOHJ+ZJC3DTg=;
	b=ni7TPb+K0tTsUmWM3um2KLSI63sTNq2nEnT825VZTiYw2ImqspRWgHPIT5TFVFlVbKS+
	 nWZUHuDaJ8LQzICdORtgHCAhjsd/KMzv2AzKRGXAfZolSgQXo/g+rXJgZsxAii2ukqFWz
	 oagXmMj/UG3nOxVnk65BxKCcE9BYXasB4k66JjsDEiEubmUxz/Rl3VaNgMx8yrazY4uOn
	 hcxEkFqQ1W6WqpweCrz7Y0VBKjO0iYCX2M2EP3DHc29xFx8DuSLVbsaE1eP0rDHj//3t+
	 PRW6Ve6RR78yjTbDOPDc7VRl+39JgJZ5zNw9/4o4QwenS4zcxCeKcn0wRAhmGuT4lHw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792319851;
	bh=OlGeIveLKijmoMDaXLfDrXq5JHQmqlNzOHJ+ZJC3DTg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=diNfgqUDSpOh2x5/5GB9ozNLGPIQJzhddUJ3Akg3jGnkS2Z6sz14RMV8w45aVizWJ
	 kPcHug4VGHk9hsKb1B2AMD6edC9AHykw6aw3R62hlRIbPC90VbTWX4s6cV+v0M8aCr
	 BoFZ4dXUP1iz9qVVusCgkiSU/vU7Wa73WTy0/BDyV+GCzPZeIe1NDVFjJ8qMsI2nqW
	 5OD++AxGjnHiafXMb15QgyYwSZHsbdiaR9MzDfYG6bhA//AnU8pWXsBquOoWDCTnXV
	 aVkq57/bL/Gzp8LZ96dMXtnMwfB0xVaRALw5tQTTViEv5dmzjFtizKOAtPyEf/+5N7
	 Lai4zGhonV5Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD10A40805;
	Sun, 18 Oct 2026 10:37:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA93C79D
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD30C401CF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3BkPTa2_hSqZ for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 10:37:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DCCC6400D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792319847;
 b=fZnXk1XLBmwQxgmmcV6FI1e1QMdajhg+h5iSs1SVs9U7v8NOUy7jZomDmybETN/nfwLN
 qI1g0LRV9ti1giuSr4HaiNKJ3wFDucNVTa4zuYi5bNvlxOAMhDGk37zDH/XIjWp1EmYw+
 xpcpQNnuDRgSrv4Q+K57ktUlfPtoSdILj38S84bVlTMaHP52Lm6z2bUtuWx4ukudCeEwa
 f9GyRN7+p59hQQjOJWjO7T60cK9tlCF3cS3LcOYKnpuNhVghKvkLDwz/6qfbO2rtGALGn
 OK/L7nbhPK7LrSGswE/RA3fURkLptlm/7bd4YSE4grss3yqLKwfMojRBfY5/6KS63YQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792319847;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/cGE8P46apeuGXvqVhFHNsXTMUAU6qbNOtTHUepvfqM=;
 b=I50Mk+hbXZ73pCPWPmH27P3HUGd7g0377JnMifCwTtOGrr2oyuUoXSvoIeFTDCb7T6qJ
 tqhO5eZSLcqNB35q500bx1/9AX3e2qW/jFDe7mnLJcbIy0TLYVhpZHEVwimRcFMp0cdo2
 4NjuxvSE1v2nvpDUJF2FW6AaAD6vqEW3pM9Qm0AbJBz0uYLha/VSvCEF/q0fdGXYdVpC2
 mxaLUvX1RSnyUDZyNhG/rQknNxrbFYJMKhcLDfK17JwaxWPkZ7zvZT8bY5kafghkLWPwv
 iWVD5B8ehdPJJp7SvHqyxF8Lk5ohp7A1TiDGuR1IOmCoYniH6/VNyCVrr1H21xWS2ow==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCCC6400D8
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 10:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D00A796AEE; Sun, 18 Oct 2026 10:36:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:23:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b5fbe8f6e7869c41616bb7e1e97b20f52f9976a
X-Git-Newrev: 13a2060ae802260b47597aee66f623083e08a87a
X-Patchwork-Hint: ignore
Message-Id: <20261018103605.D00A796AEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysklogd: bump to v2.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/13a2060ae802260b47597aee66f623083e08a87a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Adds support for injecting structured data when forwarding to remote syslog
servers:

    *.*    @[ff02::1%eth0]    ;RFC5424,sd=[device@32473 name="kilroy"]

Also, a bunch of fixes for, e.g., UTF-8.  For the full release notes, see:
https://github.com/troglobit/sysklogd/releases/tag/v2.8.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Julien: fix hash source link in hash file]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/sysklogd/sysklogd.hash | 4 ++--
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index c74d7f9ba6..69a39c3068 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,4 +1,4 @@
-# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.2
-sha256  bc410ca64551a11fac6518b418fb6b8afbd888a70af2c5eb353334a706727bca  sysklogd-2.7.2.tar.gz
+# From https://github.com/troglobit/sysklogd/releases/tag/v2.8.0
+sha256  67f49c6b2e9d75ce15202db815112719f4af0db8901032f0c3a0cec1b9f65551  sysklogd-2.8.0.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index baafc38083..554033b671 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.7.2
+SYSKLOGD_VERSION = 2.8.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
