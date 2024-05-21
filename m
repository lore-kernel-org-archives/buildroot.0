Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF797C25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 20:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 768DF81DF7;
	Tue, 21 May 2024 20:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IPyE9Zkd56zb; Tue, 21 May 2024 20:36:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6642081DE1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6642081DE1;
	Tue, 21 May 2024 20:36:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B65E1C555C
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 20:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 27A146090A
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 20:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tIRGeoaW6pYD for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 20:36:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08162605CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08162605CD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08162605CD
 for <buildroot@buildroot.org>; Tue, 21 May 2024 20:36:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4CB3913F89C;
 Tue, 21 May 2024 22:36:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 21 May 2024 22:36:39 +0200
Date: Tue, 21 May 2024 22:36:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <Zk0F1wBKRDcTJl86@landeda>
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240510215442.3475120a@windsurf>
 <CABGWkvqz7-bnCJ6JBjp3rpbeSnDEZw55jNNHOmpbyGA772xDvA@mail.gmail.com>
 <20240520112336.7431520d@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520112336.7431520d@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716323810;
 bh=MZA7d8KjPB7qzJX6r3yypl2RXpV/HOuBH8mtnGIteaE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JdSMYV4DTz9EJrfTZ84tzyF3587MRnlF1wRU7GmC/n4Q/DFBL3J1fz68EP3qQCO/a
 uMAte62xUl+JXyCwtq96tAG491ATg/2BAcbjHDgA5bsK1YBoUfmcvAh9Tg4afDsPdF
 Xsplowamdt9CVeRlNl+AZDjD9eVch8fEqB4BfEwTUPy7rU92KPIfEqkS0u7uv4+zi2
 oNvwPduw5kbHLdGcxzK+sdKg2vvZdI757IUHPuvYIm7jnYvNWoN8UGPl/qoUEhxHoq
 am1ZGh97NdZZkg9TN1y+FyDz4uPDaRR+sarDswcmGs/FohYb34XrSY+qGN1AI0/7lF
 B0Bjjurg4z1+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JdSMYV4D
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: michael@amarulasolutions.com, quentin.schulz@theobroma-systems.com,
 Xuanhao Shi <X15000177@gmail.com>,
 Gero =?utf-8?Q?Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>,
 buildroot@buildroot.org, Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Dario, All,

On 2024-05-20 11:23 +0200, Thomas Petazzoni via buildroot spake thusly:
[--SNIP--]
> Yes, the first patch is reasonable, but if we can't apply something
> like the second patch, then it might mean that the approach taken in
> the first patch isn't correct. Indeed, if we can't enable by default
> the generation of bmap-capable images in defconfigs, it kind of limits
> the usefulness of this bmap-tool integration.
> 
> I was hoping for the other BR maintainers to chime in with some opinion.

Given the issues on existing setups, I am of the opinion that we should
not enable the creation of bmap images by default, in any of our
defconfig.

Now, do we want to include that support in our somewhat-generic genimage
helper script? Technically, I don't have a strong opinion against,
except it would not be exercised very often. We could have our CI jobs
turn it on explicitly, though, so that's not too much of an issue.

However, users will not have an easy way to turn it on, except by adding
somewhat-arcane command line options in the post-image script args.

Also, it is relatively easy to add a site-local post-image script, which
can be added to the list after the bundled one, and which will call
bmap-tool, e.g. something like (kinda pseudo shell in places):

    #!/usr/bin/env bash

    getopts for -c configfile -z -j -J blablalba

    # Only the last image is interesting, as it presumably contains all
    # the others
    last_image="$(
        sed -r -e '/^image ([^[:space:]]+).*/!d; s//\1/' "${cfg_file}" \
        |tail -n 1
    )"
    image_path="${BINARIES_DIR}/${last_image}"

    bmaptool create "${image_path}" -o "${image_path}.bmap"

    if -z; then
        gzip "${image_path}"
    elif -j; then
        bzip2 "${image_path}"
    elif -J; then
        xz "${image_path}"
    fi

Ah one point: I think our generic geninage helper should ignore unknown
options, rather than error out. This would I believe help with users
adding site-local scripts like the above (notice the -z -j -J options
for example).

Still, my opinion is that our defconfigs, and the associated scripts,
are a starting point for booting known boards and somehow show-casing
Buildroot, and set the user on tracks for them to further customise the
configuration and the scripts to match their needs.

In this case, I don't think bmap-tools provides any special interest for
that goal, given the integration in Buildroot is really easy, and very
use-case specific (i.e. I know projects for which bmap-tools would be a
drawback, given the generated images have zero hole).

> Do we have a way to detect that the bmap-tool generation will fail, and
> in this case gracefully skip the bmap-tool logic?

I kind of disagree there. Given we won't enable the creation of bmap
images by default, then it means the user will have to explicitly
request the creation of a bmap image and thus, if we can't generate it,
then we must fail explicitly.

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
