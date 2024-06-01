Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB32C25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 15:54:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9482A60808;
	Sat,  1 Jun 2024 15:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LLAyDQaj7ipr; Sat,  1 Jun 2024 15:54:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C6C860876
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C6C860876;
	Sat,  1 Jun 2024 15:54:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E97EC1BF2EA
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D671560876
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 15:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfQPLvZRK45F for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 15:54:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB6DC60808
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB6DC60808
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB6DC60808
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 15:54:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A7DBF13F88D;
 Sat,  1 Jun 2024 17:54:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 17:54:23 +0200
Date: Sat, 1 Jun 2024 17:54:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Perale <thomas.perale@essensium.com>
Message-ID: <ZltEL9dTTP0P4cws@landeda>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240415162229.1357491-1-thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717257267;
 bh=4RSgx6FsIZ7wXvxpr1ufieSTiP5OWvjCkBxzo56nC5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=smxbf8EFtIBVEeGn+ZlT5hgOuyPNw3HNocHL9rncxjHpbbfVoU+TLXqVjA8v6FLOn
 2GAttrBeCmkJAAMrz/ap8upwHWMYS3j96xKTWtFHAvEH06HFw3oEbvSjTpC6Cs3j/N
 phSyf8eEcHS7r+2KpSd9Ei4gFkxeV5B1XKCQW3mF64nxrVj+01JQNvYg0109V8yWNt
 6RnwX6/On1TXnC4ugCuRS7ZbB45dct3VOccty+UcA3oFDStAo6GoMoWAuhSQO8IHYK
 eH37wjMKqnlKL1inwQ8cZW2NIPr4TM7YiNKWRaQh7qeVYWxyzmZG0JK2kBJ/f/7Y/k
 K51oOLfsFDFdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=smxbf8EF
Subject: Re: [Buildroot] [PATCH v2 0/6] support for a pre-built Go compiler
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@paral.in>,
 Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-04-15 18:22 +0200, Thomas Perale via buildroot spake thusly:
> This patch adds support for a pre-built version of the Go compiler that
> doesn't require users to go through the different compilation stages of
> the Go compiler and speeds up the overall build time.
[--SNIP--]
> Thomas Perale (6):
>   DEVELOPERS: add Thomas Perale for 'go'
>   package/go: new subdirectory for go variants
>   package/pkg-golang: select BR2_PACKAGE_HOST_GO
>   package/go: make host package a virtual package
>   package/go/go-bin: new host-go provider
>   support/testing: add tests for Go providers

I ended up applying most of the series to next, except for the actual
go-bin package, as the runtime test fails (see my reply to the
corresponding patch).

Still, I applied the rest, so that it is easier for you to rework/fix
the go-bin package.

Thanks for an otherwise good series!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
