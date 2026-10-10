Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69701CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 17:23:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19EB080F42;
	Sat, 10 Oct 2026 17:23:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivjfxqECHUDf; Sat, 10 Oct 2026 17:23:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27EA580F3A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791653038;
	b=N5JjvjZy13avy/Dszue5ssVb9RRu8ct64aY3mucsl5cJtHFR873bkjNCXV03zKHf2vos
	 nTjUwJY+yVydTNJSskBihvAvVTC74QWjgRbXT1twcilstYwUWCjBvMo1iaznyKSeWXPPs
	 yywo04tG68VE2N1QiEMWfulx9Rxr8DIP05OskbcpEGBC1n+GGB0JGgfkT0twUbpGvluYM
	 h5tADgmol5mCRYUb/NQgvc6wh3t+mulLfTlmvaJ/fcpusZ5NoIV0v0zuH3x+71k6+wkyf
	 ifU9shKwPgbv+AwmeicLSUvYqJ2XRyCOu5vUrmbm330L1KAMfq0kgGD3vJrVOXWUWMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791653038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PTl5medDywMAIJ2mNsJ8ck9jCCNAYt1gsxyX/8HjLsw=;
	b=I7J+DmnX5qizpXRF/pc0Vu/rChODYp3BmlrrECF6Qz/yXWFC0bsbJMWDvux96d60TrG/
	 Iw1rYAD/UsWpYJS7b8cAzdex9BszvUIljADhGEopMBIFGKDNDEb91EigiuJEnOpDB4N9U
	 XQYrSB92ZH5M4GSP7iu4YR0aG4ns4HTm0swULS/9EXx1qVZoFmJ/bBVTsoGIZGPxDj64h
	 dCBM61u5Gv0fvV2Ghvu5T4F6AguB0kj2/R0pvDMChFaDHlpq5EC3xf/8tSBa0me2D1oQU
	 hte4efvpJNK9zLR10gzXht/qWquVTcFPH7txpUDjZo4SqK+3/tF0Z9jlj3Nj72pHQUQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791653038;
	bh=PTl5medDywMAIJ2mNsJ8ck9jCCNAYt1gsxyX/8HjLsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UCRAtc4IDm5DgurDbnKml1Oxzxg3WrcJERWGWBnFucPT+WVd+29L6fSUNKSlfS6fT
	 0XLM6Tvtg0CyeVWqnAZhbmKRCewYeS/esQdij6ZL41Q/fynjoPhvUSi/9vSP9JM6ES
	 71RDi3GaEwWcHOOB0iqEXij/HzI0polKtPR0L+mG1XuOjadKjJ3B5HJdspqYBmpseD
	 NsreNtEZ1dwuZxwPAOBfi6t8C4p16SK17YkqjTf3nVgpiBs1JxtA9oOcE3EoCpU4W0
	 1qS2u28YvOOgse/Q9aFnr1RHXLM1J6nUUEsGU77Xqr11dHdK7vgD0CNTKox29nhmMy
	 kCtvuwgMLBrOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27EA580F3A;
	Sat, 10 Oct 2026 17:23:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D1B2D9D1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:23:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BF9794080D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:23:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rap3B_wOYPFM for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 17:23:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0E8D040809
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791653035;
 b=IuO5lj8TVFP+ritq8GQA7mlfyRQ1Z7pW1RWofgylJkMT1h3Z+UfUmLHrsKp8E/bjRzni
 F4vAfMeW9NuHvOaW6dNHaSi7g8o9JfA7jFezVEIy3Cfljcn8H/0DfHebq0XXrD3zdl3Dd
 I+6tNW0fTm78c6HUQLU2mrX1b9XFZAltC/lEr8oyBfHNF28ea4C4iiM3lN5D9bSzzUR64
 yE3hmvhx63EQxTlI5qscy/eyGk/CQ2S6ArlROlDr9MVl7bTvsjHVUEdrgjAMRqtR4v8N3
 DT/ARudgGzLP9gnoQqDcNpRZW7A7tZ84nR6cpSp4uud1bjJ4zAKJfzgjr6gt1+I9bvw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791653035;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4tMOhClpbxFP+28QJ+UOYEF9uOn+juaLxZxuiKg78gk=;
 b=H+LsvX+PoLerxBOlsFKafMw/RUXnSsLAo7akpNdrQxeOJISCAg5yM2SZ+uyntDjZAPNw
 L8lAD+srxNGnsMxgNDCBHMnD58t9FOH73Vekb+F7V3lZTyyii+XzK2ZqHT8YhAYaExgFo
 0aS+U4M2V5GGEmGAvmblEXh9BhA34ZoXKcYQAeZEgqZsf9ybhUtQegU5tz9lwt8ofjR8S
 EqYNBadm7YrH7t5gUhE8PrNOJtIQy5Ifl+u8C3DdM4kwUAkAotEzVsjqKatKkvolCmw+i
 7+mgizAbEZJJZPQcAvAVex+ZE22OSP124f6j/KqkuDKzfY7XNOcgGvD5AktjW3WAFvg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E8D040809
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 17:23:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B55D492405; Sat, 10 Oct 2026 17:22:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 19:23:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b9d1a8aa671982583864ca050380120ccf6ee53
X-Git-Newrev: fc23067ac65890428a85f71d604c816f560cb728
X-Patchwork-Hint: ignore
Message-Id: <20261010172236.B55D492405@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iproute2: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc23067ac65890428a85f71d604c816f560cb728
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

iproute2's configure script enables HAVE_RPC as soon as libtirpc is
found, and misc/ss.c then calls getrpcbynumber() from its RPC service
resolver. Since the bump of libtirpc to version 1.3.7 in Buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3, which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
that symbol is only exported when libtirpc is configured with
--enable-rpcdb. On non-glibc toolchains there is no libc fallback
either, so linking ss fails:

  ld: ss.o: in function `init_service_resolver':
  ss.c:(.text+0x2558): undefined reference to `getrpcbynumber'

Select BR2_PACKAGE_LIBTIRPC_RPCDB when libtirpc is enabled, like lsof
and other users of these functions already do.

Fixes:
https://autobuild.buildroot.org/results/390b7ed00da20c2349fe069ade4a65404834a484/

Fixes: 3f3d6e43de9b4aac7df8545fd811171256f878d3 ("package/libtirpc: bump to version 1.3.7")
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/iproute2/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index ab9e515eca..106a0aaf2c 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # __kernel_{u,}long_t
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	help
 	  Kernel routing and traffic control utilities. Provides things
 	  like ip and tc.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
