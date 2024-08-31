Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A2ACD13DD
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 18:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E35419DA;
	Sat, 31 Aug 2024 18:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkfL0N162CiT; Sat, 31 Aug 2024 18:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3650419A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3650419A1;
	Sat, 31 Aug 2024 18:14:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4323F1BF316
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 18:14:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D53B400FC
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 18:14:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdG_ivNu_sL0 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 18:14:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A89D400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A89D400E4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A89D400E4
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 18:14:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BF39F13F8A2;
 Sat, 31 Aug 2024 20:14:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Aug 2024 20:14:09 +0200
Date: Sat, 31 Aug 2024 20:14:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fiona Klute <fiona.klute@gmx.de>
Message-ID: <ZtNdccT-tuO4Epk2@landeda>
References: <20240713192207.873065-1-fiona.klute@gmx.de>
 <ZtI7NyPyq9rU94RT@landeda>
 <ae8a1d19-00a8-4be4-a16f-a951cba5e9f9@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ae8a1d19-00a8-4be4-a16f-a951cba5e9f9@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725128055;
 bh=iXLqqSWWNKVje73+K04H1PZtpwQ84HlRrdZHOA+2jZ8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yr5wn1Gn8pv4zHlyjv8PHFaFdipmsQE7oFXWKXZbwsLNZZHKTIWMqyR+ZAkPZW/P5
 6AK61ox28pec2DjBxFKyN0wRIk1yNFktOZ2TnFmU5hhU5Gxm1wN2DV1NGvN7EQxy/j
 eQfEzPzigruCEtWYhYQV/LyWGXdv6w3rvq5hdwADxG6qxZY3UAu040k9C9TEUq+y36
 EZ9D4WZ8Ln1W7ZRkR559W/bC+kXRgCUl0qpxJfQk9SLg6pCCkROsa7LCZWheQHG6pr
 GHD59bCBqaQ2JvjfhNvJM11O/2quS61nTfFHnywuqH0WWpKeqZYT5zxJyT/KAmo0YR
 TfYJO/X4Z0upw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Yr5wn1Gn
Subject: Re: [Buildroot] [PATCH v3 1/2] utils/docker-run: mount and pass
 BR2_EXTERNAL dirs
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fiona, All,

On 2024-08-31 18:57 +0200, Fiona Klute spake thusly:
> Am 30.08.24 um 23:35 schrieb Yann E. MORIN:
> > On 2024-07-13 21:22 +0200, Fiona Klute via buildroot spake thusly:
> > > From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> > > The BR2_EXTERNAL environment variable is passed into the container,
> > > and each path listed in it mounted. This allows using external trees
> > > when running a build using utils/docker-run. Testing the existence of
> > > the variable instead of a non-empty value allows passing an empty
> > > BR2_EXTERNAL variable to disable currently set external trees.
[--SNIP--]
> > This commit mixes multiple changes:
> >    - using process substitution with a while-loop, instead of the
> >      command substitution and a for-loop
> >    - passing br2-external and mounting trees in the container
> >    - handling br2-external trees with spaces in them
> > 
> > I see you have a second patch with support for br2-external trees with
> > spaces in their paths. If at all, it should come before this one.
> > 
> > However, I don't think we should support paths with spaces. We currently
> > do not, and the rest of the code base (as your second patch states) may
> > or may not work (hint: it does not, it's broken in a lot of places, and
> > the buildsystems of many packages do not support spaces in path either).
> > 
> > Also, BR2_EXTERNAL must be a space-separated list, as it needs to be
> > split on space from Makefile context, so no br2-external tree with
> > spaces in paths can even work... (unless I missed something...)
> 
> According to the manual multiple paths in BR2_EXTERNAL must be separated
> by colons, not spaces, example copied verbatim from
> docs/manual/customize-outside-br.adoc:
> 
> buildroot/ $ make BR2_EXTERNAL=/path/to/foo:/where/we/have/bar menuconfig

Supporting both colon- and space-separated lists was the worst idea I
had when I implemented and coded support for mutliple br2-externals.

In fact, the manual has an example with a colon, but nowhere does it
explicitly states that it can be either.

> support/scripts/br2-external splits BR2_EXTERNAL by colon, or rather
> replaces colons with spaces in the variable value and then uses the
> result unquoted to create a list of parameters.

Note that the code (which you quoted in your reply to patch 2) is:

    do_validate "${outputdir}" ${@//:/ }

So, it is going to split the words on spaces. E.g. passing:
    BR2_EXTERNAL=/path/to some/dir:/other/path

will result in this call:

    do_validate "${outputdir}" /path/to some/dir /other/path

which will be three arguments. And that would fail:

    $ BR2_EXTERNAL="/home/ymorin/dev/buildroot/misc/br2-external-tests/br2-external-1:/home/ymorin/dev/buildroot/misc/br2-external-tests/br2 external" make defconfig
    Makefile:194: *** '/home/ymorin/dev/buildroot/misc/br2-external-tests/br2': no such file or directory.  Stop.
    make: *** [Makefile:23: _all] Error 2

(I need to polish and push my br2-external test trees to gitlab...)

Also, internally, BR2_EXTERNAL is saved back as a space-separated list:

    https://gitlab.com/buildroot.org/buildroot/-/blob/master/support/scripts/br2-external?ref_type=heads#L124

    printf 'BR2_EXTERNAL ?='
    for br2_name in "${BR2_EXT_NAMES[@]}"; do
        eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
        printf ' %s' "${br2_ext}"
    done
    printf '\n'

... so that calling 'make' again without specifyig BR2_EXTERNAL will
still use the BR2_EXTERNAL trees used at configure time.

So, definitely, br2-external trees with spaces in them is not supported
and is not working.

> That means
> utils/docker-run must split by colon, too, no matter if we want to make
> the handling of the individual paths after splitting space-safe or not.

Damn right you are, damit! ;-) So the code could just look like:

     docker_opts+=( --env BR2_EXTERNAL )
     for dir in ${BR2_EXTERNAL//:/ }; do
         mountpoints+=( "${br2_ext}" )
     done

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
