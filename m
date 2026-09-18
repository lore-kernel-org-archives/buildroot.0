Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C20C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 19:03:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3379060E9C;
	Fri, 18 Sep 2026 19:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0Li0Wuzb9DU; Fri, 18 Sep 2026 19:03:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00CEF60E54
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789758236;
	b=B5wvpZ2BN+9n5OIKr35BzanmHtwTtfs0nSJRw/dRMeAsU//r63YcygfNGMDbsRe4q0E+
	 pZWIMkUrRg+neBTRD9MHO6trCTMm/dr2aBoT+40Y07YiwCI5I911FAST95liuXf7yjtbU
	 dFYSR49FtisyGTAUzQZiYGF8vH01Y/HsFJuzVBsa44WtruI5hOQZL7Hy7OU9XVAGjH28y
	 3iCy9Y0IKitbqGmEhk96mvh4O75aDeIRyoyfFjsPVAaUIxW2gX/+tbGDAtfjH4mjedVdC
	 4n9tyRij2I/YA1H5tb0/Yq+0p73nzmo7ec6h88p/5hlSZJPGqceGsXdT6DIVFguuutg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789758236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=N82YZF/iOHgZxAeRkY7xvbZoPNGMzE3gEVNqSIu/uWU=;
	b=ehyug6gCyi3yrPtCyf4SvxBh6pKc++S+1tQlOdvNpdWuE8uajAq2o2TtCevAvsXIBguD
	 vzbq74AUI95Fxx7w0BgSTZ70JTqIMydiurRp7lLY7imHLfjaPAFVhEspzau2ow1KkHz6G
	 08WknZJiYq03RRqE0MlVngxg7s3Yo1NLvpYgzh425p7vml3ys7EoRt3A92yYQDXfiEQY6
	 VElXRfiUEQPjYR+GopZkTAW02UUNx9vEVpnG8aDhuhNJSqSEA3ZL6LpnDmgR40GZfbO0o
	 Wx2NXb9kH6gUjiRQpDm+gjT5D+vipo93tFMEodhGdvooA5qC4khJX7RDdHtupsh3/cQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789758236;
	bh=N82YZF/iOHgZxAeRkY7xvbZoPNGMzE3gEVNqSIu/uWU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LjYBGQlaOXmKgTKQVsDIsHW8ZCmbiytp8cXBajsmCW98D6Rxg9cHYHoQN0X0dMWIA
	 2M9U69Zqcn61RHEg5XHNNvKyWNJlnaBBE8KU5JarHnvlk/62pJKXOicbOaktnHseOs
	 0/gTzxSHYrmRfyvL8+J5t9rQiewVAyF62evUtwlblrQypvu4R1j13sOPchj9e8voHo
	 PZLcr2NCulC75phEveKYhQWTlfqC/MX/g/inhcAtcATGzV6vuEoha0rbJ+ipdscRnT
	 yd0I16uUFBnrzMuFh5D2mZbgvrN6cbh/3GJm45crKblkrQ3Yz43q2pl8J0yw6ljO4O
	 B7f7kj/TmuxAQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00CEF60E54;
	Fri, 18 Sep 2026 19:03:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E473237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FC7C40CF9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JudkmBoBzvb5 for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 19:03:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 641C540CF7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789758233;
 b=H56s2MyzyeSEFN37HaYlzwdCWHHbYnxNtVg4+9vDjrZvfaoT1cJqxF8pQZqp0fk/ScSq
 1rSq5wzxDIgR1tIkDeRAKRDPENS3EQv8mAmLVn8eYThR/cQDB1ag32dOdOs0gapg8PTqC
 SD/lxHccxug5+2cwSl2Oo+vDb6p1Ia26WsSkd67A/EPCipjeNR7DH7zjad6VSzFTJUmrS
 XwJ1P+WiNR3OlEOuZmKcdQgzl//HmW9eInsee4UMHMEF495JnOjx8Da7xH2zo9b/MdCuJ
 dFnj++eqwhWpvjKrYQmNL8fr2VoFqRiRM2Jg3IF1YocBecsBwTDkEPFDLjhrmDkHBqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789758233;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ejDkfk2N5cXmiAc1CG7hiUfFXaTQUASoD7yC66wouXA=;
 b=T9kKhA22fVkZUg5srI7BeuPJiTkjPN/cNhwKEaqQ5KPRG2qC69u/pkkoxR+lpCHKCWld
 DxzlXNs9ViY8A13JmlPsAjWrr1lwzVEcqHUIYy0B3uIslNB6YSTHa0k8s6RQJVJVQOFzL
 Ew8UsgFKoq0G/HQyUW4UJWxzftjgKzUVPeuZK1m36nI3vQ7Rr4TWLeKQ1j+YYqljRVg+J
 2uc9jeQtTIcb/YZNxUx6H/8pZUiURa1Cur/D4mLma4JuKtfdTbtj7NiFbPQlxiP1tSjra
 HA0BzjEA8SX7YP1bxrzi5s6yRScZmOGNgvPRhO94H45HdkdPt596AJRL1szt1Dlj2+Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 641C540CF7
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 19:03:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E587C976A5; Fri, 18 Sep 2026 19:02:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:48:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9c0385972dfd2e244214ba4549e2e8d011a26565
X-Git-Newrev: 458441ad76c0a1624b113dfaadbda2c16eccd5bf
X-Patchwork-Hint: ignore
Message-Id: <20260918190245.E587C976A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ghostscript: security bump to
 version 10.08.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/458441ad76c0a1624b113dfaadbda2c16eccd5bf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://ghostscript.readthedocs.io/en/gs10.08.0/News.html
"This release addresses a number of potential security issues."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ghostscript/ghostscript.hash | 4 ++--
 package/ghostscript/ghostscript.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
index 94017262df..00cb1378d5 100644
--- a/package/ghostscript/ghostscript.hash
+++ b/package/ghostscript/ghostscript.hash
@@ -1,5 +1,5 @@
-# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10071/SHA512SUMS
-sha512  7b38ca10fa7ab648924f7db3e2e4933c3d18e04c8db1346fca4d4f7b85dfbd7888d5fc46f413613b46429fb47b675a593994c25e50e9de4dcdbee3bdd8a5e449  ghostscript-10.07.1.tar.xz
+# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10080/SHA512SUMS
+sha512  8006e2a32d03759a905b9548bdd83d4563173041006750e17e428b9eea24ad519aa4452ceecd7c073d3c420a68bf1b07ccc9e0533b1a05935f6b39ea8d9ce875  ghostscript-10.08.0.tar.xz
 
 # Hash for license file:
 sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index 08e2667981..288efe2674 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GHOSTSCRIPT_VERSION = 10.07.1
+GHOSTSCRIPT_VERSION = 10.08.0
 GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
 GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
 GHOSTSCRIPT_LICENSE = AGPL-3.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
