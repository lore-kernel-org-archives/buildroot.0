Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56BFCCA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 21:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E2A740541;
	Sun, 11 Oct 2026 21:04:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KnBBYsM3yYGK; Sun, 11 Oct 2026 21:04:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 383F54057D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791752687;
	b=bxVy1acd/y/WxZKkUalYrnCK7pcRtwJYYjfB8dcMaNsFoxxnILAGB3+s0+vlRUpkN7Le
	 lyq6IPu1J1wLKY5nAhElaR9V+NW8pgD6NoLCAVq5xT5QrPqJIhoYudNP0FIWB3Ky1AxuH
	 qmo2SU/pTd0GK6H5UqYdRknbbiRsJjYAInPG2DGtJC64ba3D3BrMTrVU5OS6/TMNcxM87
	 9oYjaWfc821n10EwIWwfRyuF15+I7wPpo0mKMYdiq3EAq72g6qFVFLOo8JlFgLf9J0QC0
	 3ds6BuF7dzDcZSHMHZD0SvclZGomZvetaFLmLxirCEiqj/aF7C/7iEJAI29gCNefUAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791752687;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PwB7URgHncTvu82k12hZF2SN47CSXbsl5u0e9FNxtMY=;
	b=J5tGbhbn9ee5/l+xBD+uLIIucEC2G/4Tw957oxu8F/UnRf5FI1cbgBPDUQqZo2KBIcJl
	 no69M0vLmKzeZvvQmoV96+oJc9tgH5SiaCnMFJ4brz08F5oR1YWcdrH6Ft4I9/M3sZ5xk
	 wW+xsSNYsBer0x/S3aZEb9QUNh6GnCP0CvVtE3YlwQsSGCiLkmRhpWL51meVGSKplbyiQ
	 Nl0dHq2AdvrEU93HNsEq/Czm5MJRGvMLdm6I1WDmL4KS2APmq9/qIv0PmpVK0UIjfSGDX
	 0Bmcn9rXdaHu7yd3zRiAUG8e2tBPwdUU0rt6ZLE4uVDGtuxTF+BVXWVsYpiQHYy6NZA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791752687;
	bh=PwB7URgHncTvu82k12hZF2SN47CSXbsl5u0e9FNxtMY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=skDGnNGl7Lqo7W0PsUS/k4m4OWoaBGYv2aXKjdIhNEgqvb2e6/EohAUIbxFyd1QSZ
	 RdkXplyuP1XsAGe/CFzufLrr0Lr0TxT85ednFMXZ9zzuWLhCK1lYDgmZFagdptfiLy
	 8Mpr+It3aPpFigvkmb9jmc9zs3Xa8Dg38WSoAqpMC8rSqtl94WA9MshX9KAU5VknI4
	 n0g7YAvyfG+sN4bpSy7oRkAOL5wFT2Hb3oXw3EhQoExFAJHvA/OCr/8ITY+mV5I1nz
	 TxHX3S6+3Xj3qJTUZ1TuMEVrCzKB1nZuWBnqTe2rFcDs8cN9BHBrjV1OunCagR0zi3
	 WhNdD+vFadBKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 383F54057D;
	Sun, 11 Oct 2026 21:04:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C9BCDE0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DCCB809CE
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JlsbF3dWVVDM for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 21:04:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 96B6C808C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791752683;
 b=pj8qb5YOH2Pw+Gvj3zRo8WyX3vPnIhYpI1ZKLBnfRx4DHesMrd/018x9NZ5DudLN7eLT
 5lbt/C+lsd4UcV0S0IYetteb0nck+kSg6DHnhABWx26LXBAPm5LoFT65yOXbFn1hLnsma
 CwhlP3m9UVARmBPBplQt2JRUHGTuiLsz62iQLv7jvCybnxe379Il/s3b6ywdQ/WIxZOf8
 vTDeMXKJlf6FhbP3GOIVcUpkhZ7rLCDXV/cCOf+VjKwh8+NfSPdCxQT2gEItd7s1BLUPQ
 XwdXdcS+yA9T7EPLaMM4j8CSBGW14V/u77q5Vjvk9nHaGHQY6rCxGbPhT8/IIOz2IaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791752683;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pZnN+0l07Ip+FGK4Hrx8xOiBTOpM3PDI00r+IAB6riw=;
 b=VTIMVLFEKRxm/vETuD92nU6BON1q9/kb0HY/2EA/vsH0mtBrzD24vs1FpkfRWtnkflE5
 gvoi9y3xyhERwRWskeyUx1EVkDJqbn9hgiBRl/s7BwcmPdVSh4pQJqmH1FqclWcL1ecpg
 mwrReg3UCWAIejvk7rANuHZMCYlw10AxWc+477FQCgu2282aLTnsHcAf1BR4E3HDrSqqX
 tnJbfQtUcQ/ye7hOKYOBKvj0bBO1wOoDzZFGVlzAepWEKS7MNqOreLdMrSl+icFMP7neP
 faPmJUNh9hRDBVYzEZpXAjGToGd+57f2njCFStPApVcAFU1TZPaMXVYkjJRTsyxbmyg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 96B6C808C1
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:04:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AEC8F95275; Sun, 11 Oct 2026 21:03:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 22:59:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f665c89778550d659ddb7614eb5b791462cb904
X-Git-Newrev: 9f0aacb6346083db480478c59711507263455aed
X-Patchwork-Hint: ignore
Message-Id: <20261011210324.AEC8F95275@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webkitgtk: also disable internal
 ccache in the build step
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9f0aacb6346083db480478c59711507263455aed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

WK_USE_CCACHE=NO is only passed to the configure step
(WEBKITGTK_CONF_ENV). During the build step, ninja can run cmake again
(e.g. when a cmake input such as toolchainfile.cmake changed), and that
run does not have WK_USE_CCACHE set. WebKit's WebKitCCache.cmake then
sets ccache as compiler launcher again.

That outer ccache runs without the CCACHE_BASEDIR that the toolchain
wrapper sets for its own ccache call, so the cache keys and manifests
contain absolute paths, and the entries only match in the same checkout
directory.

Pass WK_USE_CCACHE=NO to the build step too.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Acked-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/webkitgtk/webkitgtk.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index ee9e707cb5..192a340d0a 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -22,6 +22,7 @@ WEBKITGTK_CMAKE_BACKEND = ninja
 # Buildroot adds support for ccache through its
 # toolchain-wrapper, so tell webkitgtk not to mess with it.
 WEBKITGTK_CONF_ENV = WK_USE_CCACHE=NO
+WEBKITGTK_BUILD_ENV = WK_USE_CCACHE=NO
 
 WEBKITGTK_CONF_OPTS = \
 	-DENABLE_API_TESTS=OFF \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
