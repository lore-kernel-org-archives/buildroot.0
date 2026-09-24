Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FB2C98318
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 19:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2BEF81212;
	Thu, 24 Sep 2026 19:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgYZLXA6y4lG; Thu, 24 Sep 2026 19:04:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E317B81216
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276690;
	b=aDeNZxUHIlpnP8droKR/IGTvyFKgiUGJlK2yfr/WxH/habu9NjFszq9xqIBz8R07bukN
	 LaZJLRmOPY5R5fbYeM16pBgpoJ50V9W6Hp3FAkOIQc28qmKxj/6d+TMDkMgpF1mGftliJ
	 HYHqj2KY+aRulmtfDde9ZmYrNPef79wCr1en51hhajS/7h3PsazLttCm1VoOadNavfqxK
	 NVJcAM2IHDYK0p0ojeS604jvZGnkpQLTxBOSt/72GKUqgIhIoEQOf0ca0/Yvv+E70oOVf
	 l+6in/dHG7lM4Uq5Y4fHykhJkW3c90k5KJ/KDN9j2yWEJMkegqat3dCgVed/qCDwzsQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276690;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NMQ/pQB9Q05e8WfNgSDTLuVzNsf0vFYW2PDAOSVJaoE=;
	b=CHMX5CNGJOW98XnZHcWfoC2jXyIQ8Fi3uNFKn1xSGTJGb8gklchQK5/txwA/kdgn6jIo
	 L3S1xE7ifLGXgNyD3mImRWIVW0v7T+vm5tTiO7gH04cYdxnYHGqu6L3nvifmK8y6xX5y2
	 k4yf1HchuARt7UrQWgxtLLmWlsdJPLFmvOdsCk1X+b0NOAXav7KiC2kuPaRq9bGMIgZsm
	 UOsHtBu1d3EwRHRFoTBwnWuSL24gJuYvyrujgOMzRIQFLb2yTpKZ1WVlG51JNHeozVRdV
	 RzKj8/QzE/lHu+tygk+gZom1/FIlOh3HWdX/kPqxoKkfWg4JSnVM5Q00pw2+v3hIGRQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276690;
	bh=NMQ/pQB9Q05e8WfNgSDTLuVzNsf0vFYW2PDAOSVJaoE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LlZgjaASpvORzW5bnwXDYIJOeka2kNWs1FxAUYCTzItFj7UVWUWPjE4Hjsi3Nof/+
	 AS17W+VE8BqTiKivJbDA4aMLgVK/n5wbi3ZIfW8Auf/qCm81DfS+BLQJzE+gK6BNVr
	 MMkRfkNtPmZu0kWdBFmnIyUjZfTgLUT6uErapsO1hh6fWTzme3BxTZSWiNZFjnVWLU
	 dO5YULle+ilkVXyre3CUDVpystFEmbrUG7SUbKwt4kzKn3tVMhhZTMobyIla5cWZv4
	 mdSDWDL3RG0Vi9Zz9rRvPllVHuQ6MzOSJBKqsSpWTAMsFTIjwdPcmoi/ZSoIS8rPXB
	 oRRALZ5GG5/cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E317B81216;
	Thu, 24 Sep 2026 19:04:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F28C9355
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFDBC40AE5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRa-GZvRZD0u for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 19:04:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org F073740AB1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276687;
 b=FuHFGwDEcLCEtsgAmwR0uIIyAeu8Y8VaQ17FkASspDpVP0+3EoCNJ1QrBhCni+H0SzbL
 rdt9Aq3yt0HuQx9+AZwR/12IZZJB8QxHcvr73VPsWR8RLgM1Lji11PXdcRfqnzj0JUiv6
 54ZaSNy/FLh2I8RUS2Q0OYj3QvEMreda8wobwJbCGmjy2cI436vPFJn63kgVI2TwjA7sE
 je/l4yZNLLF+ZOcCZzvk44Viteb1IC/g6wutjAXHBwJesyI0RpoE5TZxl6rtKDgsMKZ6H
 +B3GpbkHrUPTjwt5+UrFDjxo3E86E0Cr+CuW5JGfycOjVBjXt7FHZDsti5v3Tpg3Spg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276687;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2lLy8LObiCMJl/WVQJkMH0+vHAm9A1pKFPBa0ly3XSY=;
 b=q/ORIoNFDz9u4UtaM6hVEhczMuxUY8H/1o8x7ykZCBHGKWq2pY+cChpcr5aeoNrXEtjU
 iNxR4BYzgod1G+RhIA5cj+OXEAvOPEkLrj6gA4mcCXK3jbBjd6XBXl3d4+5ZMK8kODl/g
 YDRtQV4xTHxYI7zi5ude0tYmjsAMFFNilRArF5gbQX7DIENNOfGnCBZ8GCH5UWNOmcQU1
 shDuDDDxJKOtr23cDipsaNJsxwLikbPyHTUQ49uJlJqcF8NsPGzkAldkZZi/tkTH4u9N3
 w+GclaHBIb+VUOewrS+OztIi7EJSVAnCYp/g5nL4bWF0kED7F8tcAolVoy4x7EAr0fQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F073740AB1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 19:04:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 840269838B; Thu, 24 Sep 2026 19:03:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Sep 2026 20:29:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08b06173bd3c95f0fa532b38533e10e558eec602
X-Git-Newrev: 15ea2f82218a3adda63b97339c5d46e9019dc028
X-Patchwork-Hint: ignore
Message-Id: <20260924190336.840269838B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/llvm-project: bump version to
 23.1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15ea2f82218a3adda63b97339c5d46e9019dc028
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://discourse.llvm.org/t/llvm-23-1-2-released/91895

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/llvm-project/llvm-project.hash | 4 ++--
 package/llvm-project/llvm-project.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/llvm-project/llvm-project.hash b/package/llvm-project/llvm-project.hash
index c7e1a8bff4..d092a2cf94 100644
--- a/package/llvm-project/llvm-project.hash
+++ b/package/llvm-project/llvm-project.hash
@@ -1,4 +1,4 @@
-# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.1
-sha256  ebe9be46fe8756d58c5b198ffad0fa2a766257add81a4dc52179bfacc7888ee6  llvm-project-23.1.1.src.tar.xz
+# From https://github.com/llvm/llvm-project/releases/tag/llvmorg-23.1.2
+sha256  c98bbef08a2b4c2613cd50e9aa9ae7b69b1fe6c16b2c40373bc0ab6116fdf78a  llvm-project-23.1.2.src.tar.xz
 # locally calculated
 sha256  8d85c1057d742e597985c7d4e6320b015a9139385cff4cbae06ffc0ebe89afee  LICENSE.TXT
diff --git a/package/llvm-project/llvm-project.mk b/package/llvm-project/llvm-project.mk
index 850bd78720..e3eb03468b 100644
--- a/package/llvm-project/llvm-project.mk
+++ b/package/llvm-project/llvm-project.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LLVM_PROJECT_VERSION_MAJOR = 23
-LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.1
+LLVM_PROJECT_VERSION = $(LLVM_PROJECT_VERSION_MAJOR).1.2
 LLVM_PROJECT_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLVM_PROJECT_VERSION)
 LLVM_PROJECT_SOURCE = llvm-project-$(LLVM_VERSION).src.tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
