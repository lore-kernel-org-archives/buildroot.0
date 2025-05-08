Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71BC6C3ABC6
	for <buildroot@archiver.kernel.org>; Thu,  8 May 2025 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F4F481FD7;
	Thu,  8 May 2025 19:36:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GeIcCYD6rbl6; Thu,  8 May 2025 19:36:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C469831D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C469831D6;
	Thu,  8 May 2025 19:36:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E591439
 for <buildroot@buildroot.org>; Thu,  8 May 2025 19:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A05A4149E
 for <buildroot@buildroot.org>; Thu,  8 May 2025 19:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KUKn2yvaWi3j for <buildroot@buildroot.org>;
 Thu,  8 May 2025 19:36:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70BFC414A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70BFC414A1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 70BFC414A1
 for <buildroot@buildroot.org>; Thu,  8 May 2025 19:36:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 5D14CB00573;
 Thu,  8 May 2025 21:36:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 May 2025 21:36:31 +0200
MIME-Version: 1.0
Date: Thu, 08 May 2025 21:36:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250508180134.93333-1-thomas.petazzoni@bootlin.com>
References: <20250508180134.93333-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <73462c6548bfb4dec3b77e082ff3f4c0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746732992;
 bh=qll95tv+9UR8P4dBb9CtS2xnGYnfmLdZMPJtJdsE7Nk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FU3EA7Vv4vbGCr6vRtozfndA5uX0xpgS2qUwjI+8UxkuR5Ec49do8wwQ1VK4rDp03
 2meNMNs24dwMVoPBIuuGTf0CSKwvnHGxhCyfKZTbFK6Lef0/ydLhZVQ9Dg4qMitjVz
 +l793g5h2d3GKBs3SPvBlp79xM2qk76fmuKSxe1IH765vrzIJFvw6xZk5XFW4ACXbx
 hxjusjgZo66+hiuC6vst4GkWQm4YDUJNiZHExFnojp03UcJWZyAxA246xlvbEbJkLR
 ntOiuHdMtA1KqFXZqd/ceA7dcilKYDkdLYAVkOfb3XMLLxeMHD4SHDMhdPLnaJ12no
 rfH8EFHeofeCQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FU3EA7Vv
Subject: Re: [Buildroot] [PATCH v2] support/dependencies/dependencies.sh:
 awk is needed by Buildroot
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 08/05/2025 20:01, Thomas Petazzoni via buildroot wrote:
> A basic Fedora 42 container does not have 'awk' installed, but it is
> needed by Buildroot. First by check-host-python3.sh:
> 
> support/dependencies/check-host-python3.sh: line 6: awk: command not 
> found
> support/dependencies/check-host-python3.sh: line 19: awk: command not 
> found
> support/dependencies/check-host-python3.sh: line 19: awk: command not 
> found
> 
> but then even building host-expat assumes awk is available:
> 
> config.status: creating Makefile
> ./config.status: line 1404: awk: command not found
> config.status: creating expat.pc
> ./config.status: line 1404: awk: command not found
> 
> Since it's a pretty basic tool, make it part of the tools checked by
> dependencies.sh. One minor annoyance is that check-host-python3.sh is
> executed *before* dependencies.sh does its thing, so when 'awk' is not
> available, we end up seeing:
> 
> support/dependencies/check-host-python3.sh: line 6: awk: command not 
> found
> support/dependencies/check-host-python3.sh: line 19: awk: command not 
> found
> support/dependencies/check-host-python3.sh: line 19: awk: command not 
> found
> which: no awk in 
> (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin)
> You must install 'awk' on your build machine
> make: *** [support/dependencies/dependencies.mk:27: dependencies] Error 
> 1
> 
> It would be nice to have the awk check *before* it gets used in
> check-host-python3.sh, but that's a topic for another patch.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
