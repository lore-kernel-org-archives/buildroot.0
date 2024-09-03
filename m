Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A19BCD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36EB460635;
	Tue,  3 Sep 2024 19:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fx-ffJurFS-Y; Tue,  3 Sep 2024 19:41:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2117D60683
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2117D60683;
	Tue,  3 Sep 2024 19:41:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CFDA11BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD25380E30
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:41:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RzzOzLiZ2IsG for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:41:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF45580CA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF45580CA4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF45580CA4
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:41:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BE76D13F880;
 Tue,  3 Sep 2024 21:41:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 03 Sep 2024 21:41:03 +0200
Date: Tue, 3 Sep 2024 21:41:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtdmT5wnGlYoBpkU@landeda>
References: <20240902210055.239859-1-dario.binacchi@amarulasolutions.com>
 <20240903213320.35490d86@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240903213320.35490d86@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725392470;
 bh=vNjZ64IcmEgK+jr7SUEblrv/gH6Kg7oVjXw7uFEy0VI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZpSkADGnY1PN2wPgOGJ4Adk6+tZpuHVjSWkAEpevVoP9R/w3ylsBnO39DjJCo6lt
 0DMektJK1FtMq8Twv1wAfCtb23LUFik4VWexUyAyqKaZIDawPJ58dvyOckoWpmjoLQ
 GpAl5rfSVHoa+KYsdD2zrAlyK3556xydON/nLrdkTVNNLXfwi1dLmnOgmx1aWcPum6
 UXl3GI8PKGpb+PKhzSz2IOYW2XTwRHMyudXAhOzn9PMdcEpPeXbjljEbRNsZsynCnP
 3/fciS89n07HF0QuKV6/AHV9WY6Xxf24KhumOC2MnrHTBv+dZbhLYYmeMGJLqPGxqn
 HOFMc+ljyzAeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VZpSkADG
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmitool: only accept local PEN
 registry
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-09-03 21:33 +0200, Thomas Petazzoni spake thusly:
> On Mon,  2 Sep 2024 23:00:55 +0200
> Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:
> > Following Yann's suggestions [1], only local files are now accepted,
> > removing the need to download the PEN registry and consequently verify
> > the hash's correctness.
[--SNIP--]
> I don't like this solution, having to download separately a file is
> annoying.
> Why not using:
>   https://github.com/larseggert/iana-assignments
> which precisely provides a versioned set of IANA documents, including
> that enterprise-numbers file?

Damned, I looked but could not find it something like that... How did
you find that?

Of course it is a better solution!

But should it be a separate package, that installs a subset of the data
files, or should it be an IPMITOOL_EXTRA_DOWNLOAD?

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
