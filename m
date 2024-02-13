Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC7FC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3D1860672;
	Tue, 13 Feb 2024 17:00:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5iA7hKVgRmcj; Tue, 13 Feb 2024 17:00:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E00460805
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E00460805;
	Tue, 13 Feb 2024 17:00:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 143D01BF28F
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0ECAE8212E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L7iQWzFnPJpI for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF6638211E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF6638211E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF6638211E
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:00:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 16A2413FA47;
 Tue, 13 Feb 2024 18:00:41 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 13 Feb 2024 18:00:40 +0100
Date: Tue, 13 Feb 2024 18:00:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <ZcugOP8E783em4Cz@landeda>
References: <20240213143025.274988-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213143025.274988-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707843645;
 bh=o2pqW+9KySBuEn6dQH0YJkax+IjhKxcsPGjSXHgCoHA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rZf7Hr68Gvownsodq5a/sygKkBFIQPCiWnm3xgKJiUZXLINdY957S6nQMQ1cdepol
 aAYTumFHUsfTn0yinb1yFZMQ9fqmDEC87z8uTNwWMctovZP/MIlZfLHSNylWKgwIS6
 jQIrYKP9WttbsN0MV84CeIXGdj2C7lq9+a4rxXww9HUdswMtr5F1fx5BipWQ12jUeQ
 jAy8mYAenZ7NDooF3sR66RvD0KJSo+eC/Idi/l3QDSy/s76ap05cei278uFoEKm0i8
 FsyzDhiKFJpcFqKKZDK91yM2MsYM0I16bZ08uSQfQkE+m3YLFpf+UeFR+xAm/O9ndb
 +/RZBu3AKAirA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rZf7Hr68
Subject: Re: [Buildroot] [PATCH v2] Create a .gitignore file in the
 CANONICAL_O directory
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yegor, All,

On 2024-02-13 15:30 +0100, yegorslists@googlemail.com spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> This .gitignore file ignores all files in an output directory and
> hence doesn't change the git status.
> 
> The .gitignore file will be only created if $(O) is a subfolder of
> $(TOPDIR).
> 
> Remove "/output" entry from the main .gitignore file as it is already
> handled by this general approach.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
[--SNIP--]
> +# Create a default .gitignore file that ignores everything and doesn't make git
> +# repository "dirty". Perform this action only if $(O) is a subfolder of

s/subfolder/subdirectory/

> +# $(TOPDIR).
> +ifeq ($(realpath $(dir $(CANONICAL_O))),$(CANONICAL_CURDIR))

This only accounts for direct sub-directory, i.e. $(TOPDIR)/foo, not
$(TOPDIR)/project-42/board-27/debug which is arguably more interesting.

What about:

    diff --git a/Makefile b/Makefile
    index ac625152c6..ba76949e6d 100644
    --- a/Makefile
    +++ b/Makefile
    @@ -65,6 +65,13 @@ endif
    
     CANONICAL_CURDIR = $(realpath $(CURDIR))
    
    +# Create a default .gitignore file that ignores everything and doesn't make git
    +# repository "dirty". Perform this action only if $(O) is a subdirectory of
    +# $(CANONICAL_CURDIR) (aka TOPDIR, but it's only defined later).
    +ifeq ($(filter-out $(CANONICAL_CURDIR)/%,$(CANONICAL_O)),)
    +$(file >$(CANONICAL_O)/.gitignore,*)
    +endif
    +
     REQ_UMASK = 0022
    
     # Make sure O= is passed (with its absolute canonical path) everywhere the

This is quite simple, and accounts for arbitrarily-deep sub-directories.

Note: since we work with the CANONICAL_* variants, we know they do not
end with a '/' so even if the user calls O=/path/to/buildroot/ , we'd
find that it is _not_ a subdirectory, and thuis we wil lnot overwrite
our own .gitignore file.

Regards,
Yann E. MORIN.

> +$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
> +endif
> +
>  REQ_UMASK = 0022
> 
>  # Make sure O= is passed (with its absolute canonical path) everywhere the
> --
> 2.34.1
> 

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
