Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C56CCF2DB
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 13:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F0180F9E;
	Mon, 19 Oct 2026 13:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrUruninETiu; Mon, 19 Oct 2026 13:36:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4FBC580FA8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792417016;
	b=CPb0DI4rpYKpiCKjS+94mxwyd3onwwJZW+0ID19t62Q6s6tM2ZS8WfZSmKWQ1Di1rKbV
	 sD6/oRZJhMAcxFK3LWjOdH0FhLiHR3+EVFwwyKBFS9gmy0Py0JGZmHlhF688hLQ8jvUmI
	 gA0O+92ZMfngozaFqbJ30ZmixL841XFtL4WHY+RbyMcWWWvr5M02OeVf0cnhRKEpFUCAD
	 zizDP8U8OfMd07eRPE+6nxxRIs78HMauawKnC83pAlL6UUmtAvzjcTSIuhwQa/nl8v9N4
	 octuvG7J5WpWTwdfJtPQTyYJ0eGpAdLY1zdnyLQ10hn917ff1HQ5ii/opXmtvesTekQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792417016;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=mrj/tTUxim7/1J4aymhtKFBp9GBhfPHjXQu3hNXX9Cc=;
	b=CYtpbRF5N8R4EwX0eMu1fKGqNH/ayu2ZOlvPdvmMk/N5jVXUk0KZPLNxiG+c+BH0w6Bi
	 8AaY5qFU/cWKARwCQIWSdn2+oMDg6NelKFl85Nt3QWGsyuHDRA3b6Thg7W0/l53RstUV+
	 WZQk+a5bPG0K9cCfiyQ1J5TjaDmaNgd5p8us/05In6iA+S1J5cRlY0DXaksi2HJxMM6jI
	 4UkUlyzbmGRYmh/OpgyN67R517jXMNRntspj0f5KnKRSLdiOAdHB1tEy8oldQp6NAEK//
	 Li3ZnlSpgw1UZuUwA73Fm1WTiMHPoZYphXc8fMV1uvXy2JpTvxjw7SzdoLS92WpD5+w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792417016;
	bh=mrj/tTUxim7/1J4aymhtKFBp9GBhfPHjXQu3hNXX9Cc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I4IJyfrr9i4B1FSlgDi9T60I8T9kqgxZes3JM9kwrMWljeDtlS/ke8WIWyGzTC1FE
	 +zEvYMPgclguElDrTwdkYRNFDmrPUZE3xdc8MMQAgZYAMJPVEw1behp43ycYX3LaEW
	 3d9DLqSIF+WiMc+6Lvj87ZC8a3nl1LSiX0ABECfBHC7cvT47E/jZwD9Mjd0BwhLSI8
	 9sKn//mZCDNKEncExs15fV837QlktjQXNryROpDFaec3//ui0rptfIEXa0VUCox/1D
	 Je87p0ApjgSgqLJI0iYaOTZG+zfeg6cqelz2OncsJBsYpG9HoX+yWDDXjxy08R2xfe
	 PjLfO5boNg6TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FBC580FA8;
	Mon, 19 Oct 2026 13:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C3AC2263
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9C956069B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M6ShTCtwZ25h for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 13:36:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E54746068F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792417013;
 b=TxnfhoJst7yCL3nfvME6TzDo7rDS7tCFrdCNjOW7ck9k64Pz/VUAN6S01vg6RWwT4+AD
 rg0d5fTjEAY2hjnF2/gPJ+ACRqvyswRHJx3ydguJZaRkD7NZ/aB61ERdyWr16xrHAAYaP
 vxX9T/eAi1sqXdQCo100YUs/hXHiXY0wuzfxD4HbVlsMilPw8DJQPYjTnBc177RhHJz9B
 RaKVz9f1DIdo9KL0coedwWdVcTb9pDTT5XK3+f0QmQqge4ekV56i2urd4quOGS3ynKiDy
 aN2jyznoidnHOvJ7rlm7zSKopxgkkkCGKk9olW+x+Ts8HynXBazfDnualdv3xNB2FDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792417013;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dzITMl79RLTlgb7rnABolUnzyfrFzsht6//UVZX7Xlw=;
 b=m1EER3XP6vYqvXiToE/iymi6t7TZT4wedwKgBOiEMTkaFaxD3CeO0YQzTwhoWwvMUWi5
 iFqx3Z+YvgbwvWJP/Y6dJYDbbdnuc9k7mqC0Yrq9LidElMmElKZ6ADumSNoFZQakgUQlS
 jYhjd/cqwqTm9TH7mpLf0elUPZI/efWaRDa+I/9T8UE9BHfJvM1QYH8Z9gxW6TLvYIY4H
 FCwsJOPBNIgbRsNmSjW0O8ESAkA2/QBYQFkCaI1ia4yyxNdbk8MnGzzH4kE6+3/mcyo9N
 xqZeGUmhDj0hMZc2Oksmg10ClDPTRgoG8srdYrIJSjsxKbua1egyZo9ZCl2QFIvVBUQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E54746068F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 13:36:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 509D798637; Mon, 19 Oct 2026 13:35:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 15:34:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c80305aa9db6c6008ac0c017f342132057a5926b
X-Git-Newrev: e3415e639a89b33e9a6603694e0d58b72aa63c79
X-Patchwork-Hint: ignore
Message-Id: <20261019133531.509D798637@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hyperfine: bump to version 2.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3415e639a89b33e9a6603694e0d58b72aa63c79
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://github.com/sharkdp/hyperfine/blob/v2.0.0/CHANGELOG.md

Changes in v2.0.0 include:
- Add support for alternative performance metrics (peak memory usage,
  instructions, CPU cycles, cache misses, branch misses, ...).
- Add --env to set environment variables even without an intermediate
  shell.
- Benchmarked commands are now executed directly by default, without
  an intermediate shell (--shell=none).
- The JSON format for --export-json has changed (schema version 2).

Refresh the vendored cargo tarball hash for the new release.

Tested using:
 utils/test-pkg -c /tmp/hyperfine.config -p hyperfine
 (Result: 6 builds, 3 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/hyperfine/hyperfine.hash | 2 +-
 package/hyperfine/hyperfine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hyperfine/hyperfine.hash b/package/hyperfine/hyperfine.hash
index 0bd5a1b873..6abfa53fa0 100644
--- a/package/hyperfine/hyperfine.hash
+++ b/package/hyperfine/hyperfine.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  10ef59c1ae8c368f3663cecff219f872ada90dd6bdd52d07e544bf9bdf777093  hyperfine-1.20.0-cargo6.tar.gz
+sha256  09a95fe2fab6d647acd5f8653e686650ec6fdd629c0d639fb8ac840e622ef68b  hyperfine-2.0.0-cargo6.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
 sha256  1dfee18c2ff07ce551de4d6a1d2db158c0380746b488a7f0d08c8e0d3568b7c3  LICENSE-MIT
diff --git a/package/hyperfine/hyperfine.mk b/package/hyperfine/hyperfine.mk
index 8af6e0298a..59e503d094 100644
--- a/package/hyperfine/hyperfine.mk
+++ b/package/hyperfine/hyperfine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HYPERFINE_VERSION = 1.20.0
+HYPERFINE_VERSION = 2.0.0
 HYPERFINE_SITE = $(call github,sharkdp,hyperfine,v$(HYPERFINE_VERSION))
 HYPERFINE_LICENSE = Apache-2.0 or MIT
 HYPERFINE_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
