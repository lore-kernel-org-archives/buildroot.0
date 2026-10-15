Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CF6CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 835D561321;
	Fri, 16 Oct 2026 13:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-hHpT9jxaU3; Fri, 16 Oct 2026 13:13:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 836F26132B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156395;
	b=j3e1q22bfKPRlGvEz4fXjbvQqqbgtA84nnm7hKvRoCLg1BEps/aKEnCdQFwkiON9gEeN
	 0YztbSt7dSzcPutA7BJxuVZFUInGg7JTvZYeN82zFj4UOcQJ33+kwgf1NT6MX9wnMpRt0
	 a+qSbRwB0WcuGtwubY8beU1mki03hx7qZ8a37TRbBGyOJMT8UDAZpd36kLUKgDl4nDiRe
	 NM4NEoszj+Ux50xJYuS924qIgP5QAmexZ8NFP7cmZ3u9n0WjwE5EPIuuxWxE6B96HDYK2
	 NSf+si43h6buR99MyECL6VAKNg7xisUJQRcjD7mhf2cSzJRqxN5BpBsdA+INRJ3/fFQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156395;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=G40fb3uoN8p1e9ijgPb2TRZ/oYSKTbOQNxRuGLHgcYI=;
	b=DzfQmtwMgPRwEeXbmp5SXnARMPezvrEx6JR+TBiQCCrtvqVHIto74M79Qc2mT/f+TO6N
	 vvz43/UqEgu0xefw6QFxsrkrmzgkD7GTv+tWx0fT1EamJvo463LSbrxJNVRwWY8CNYvRX
	 CitceLmhtTmxcdDvcla0j2eZXuwFvrhSOWu8PcEWUL01+oSiyiHtWh3xYGci7q2n0Uxkm
	 ERRLIfW8LcEdfo/sEqsRmN8j/+nKRPvLWCdJa58XgyYljj2CahV0k4dS1tb0x+D67Ev0Z
	 1L6KA5c80rhHL1kC7VVK686yCcBHfBgyBiimyS0Uvc8JmX/pZYrBHx0KDQf7qQJ3Z6w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156395;
	bh=G40fb3uoN8p1e9ijgPb2TRZ/oYSKTbOQNxRuGLHgcYI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HI8C/DsCJxAF7Ti1uesbv993NjdDai3R6qSP9RR+rb7LW5KBv5hnVnSb8ZkMfAzl2
	 QoEPZVsihAcWUUDBSit7d0lAc2bwzr5s5LN0b5B+Z8U7tuLzoyzZMRmGu8aO5lz9RH
	 unZKQVnoWew7Er4BxA8qSjAqivZj/K/C77i56Lwj8BID9tU4HxbfrF52JBOBhphUg7
	 ehA5xcd0Oj5cNtfB+U10G00oeYggKNUve8Fr6xnDSOEbJtyfTq0VEtbfbFUBVxFn2y
	 GyQQ3FHpN1QhK9nrVccasBEgaT+PzAdLXqFxiO+4hOYdzqFJ/7XyvXgq+sreL7bY8a
	 uN6csEcTnY2bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 836F26132B;
	Fri, 16 Oct 2026 13:13:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B286769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD3960AC3
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teeaNMyoCtZp for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B539560B3C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156191;
 b=AHdIaMpRlEbEHm71/kjC+cP1MdHIiCYnPapxYeA+1DTvGgI4kfQlPG7KcBFe7y9QmE4d
 eNv7IQm3b67dQ8bnN9PKl94tw83syTpCr8PJmICRmjnnaaABXk4VfOQklHFrwFBWIdNHW
 9YYjycxYKxoVmFr5k1Qj/6vNcUe44S2R2KJCbwKSKQ+COMMEttB2LxAnUr7Az51le9xR2
 c6wRrPYv+j/sk7TB8WFQrruzTk95et3OUZCflB4OsllAke+8XrZHNkCxtUM8pVZdozDsm
 5PpYh+Ei4fIFxiQyNTpE+g8hOjbXokrMcg5PN1E9k/oHTo9XyIyCrxdu1HDZaFhMwhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156191;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=87INp8xRDTB3Qt9/f6XSepVom4og3RsH7+37mR4nqnk=;
 b=nPbOidcd0G2KDgppodBm7EQygP89Ij1XLTAcHznNghGjJTKhBKNVfWnqax42t6/t8SEp
 VU8EqAyGAkDskfStOFQHEbdcX10qiA9IBwyPTMZg45rMcnwxgSU7vXVJjeY+ViBNYo2F8
 T3wvLJkUPCblMzBVG7HKr6njbRF/v0uG5cHDkD86ZByTTjDEzCtoBNrDQnUtbq5zyKK9p
 n+POHHKWzLMr4N7JrYQvGeXY27XanhhqHrRk9OBzwzPV4LEqY4nRr5cAGNxmP4aI4Lr06
 TQihXDugVSIONKe2Uu3ixiUrKbPFbCbDhAeifowY9Psb+vCzD+hrPKqj/nBfvEg/7Dg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B539560B3C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4782960D9; Fri, 16 Oct 2026 13:08:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:11:26 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 3f859c10afd3c5ad5c0f3b7978acf2f97464ca79
X-Git-Newrev: f87d354fe656b0e62e55daf8888318aaf9dc2986
X-Patchwork-Hint: ignore
Message-Id: <20261016130830.A4782960D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/linux-headers:
 pass --no-print-directory
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4987697399522782998=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4987697399522782998==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f87d354fe656b0e62e55daf8888318aaf9dc2986
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since commit 5fc10e76fa2a9 in linux v6.5-rc1, the kernel does a
recursive make call to add the --no-print-directory flag if it is not
set.

Buildroot sets MAKEOVERRIDES empty, which causes none of the
command-line overrides to be propagated to sub-makes. This only goes one
level deep, so it is not a problem. However, if the user sets
MAKEOVERRIDES in their environment, the environment _does_ get
propagated down to sub-makes. Therefore, the recursive call from within
the kernel will not get any of the command-line overrides we give it.
As a result, INSTALL_HDR_PATH will not get passed down to the kernel's
sub-make, thereby breaking the installation to staging.

Note that if Buildroot itself does a sub-make call (e.g. because O= is
set, or umask is different), --no-print-directory is already added so
the issue doesn't occur.

Set --no-print-directory explicitly, which avoids the kernel's sub-make
call, which preserves INSTALL_HDR_PATH. It is only really needed for the
staging install, since the local install in _CONFIGURE_CMDS just sets it
to the default value. For consistency though, set it there as well.

Setting --no-print-directory when it is not needed doesn't hurt.

Signed-off-by: Francesco Mancino <francesco.mancino@tutus.se>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 77faecb13afa7255bb04a6260201fd535e88887c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/linux-headers/linux-headers.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index 15724090ce..ed37410ea6 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -135,6 +135,7 @@ LINUX_HEADERS_DEPENDENCIES = $(BR2_MAKE_HOST_DEPENDENCY)
 define LINUX_HEADERS_CONFIGURE_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
+			--no-print-directory \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \
@@ -146,6 +147,7 @@ endef
 define LINUX_HEADERS_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(TARGET_MAKE_ENV) $(BR2_MAKE) \
+			--no-print-directory \
 			ARCH=$(KERNEL_ARCH) \
 			HOSTCC="$(HOSTCC)" \
 			HOSTCFLAGS="$(HOSTCFLAGS)" \

--===============4987697399522782998==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4987697399522782998==--
