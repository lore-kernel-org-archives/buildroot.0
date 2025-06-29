Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE013C7EE30
	for <buildroot@archiver.kernel.org>; Sun, 29 Jun 2025 10:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCE0161010;
	Sun, 29 Jun 2025 10:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id upmL-qwxteYe; Sun, 29 Jun 2025 10:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D06FE61005
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D06FE61005;
	Sun, 29 Jun 2025 10:16:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E7B841C9
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:16:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD895411FB
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-4NmeSwL-yn for <buildroot@buildroot.org>;
 Sun, 29 Jun 2025 10:16:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C06F41122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C06F41122
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C06F41122
 for <buildroot@buildroot.org>; Sun, 29 Jun 2025 10:16:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B680D13F899;
 Sun, 29 Jun 2025 12:16:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Jun 2025 12:16:02 +0200
MIME-Version: 1.0
Date: Sun, 29 Jun 2025 12:16:02 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
References: <cover.1750845702.git.yann.morin@orange.com>
 <6250e91113bf6a48ab5035b038cad4db1931d57a.1750845702.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1b61fab1a3d17e9cb757e12dc9958b51@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751192163;
 bh=jNFMuwgtfveIvPvVgHKDrFa94gsZTo/ZHKIhKzNvVsc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QHAgWRKg708xzbxcksNFmEvWuFsbpvOvwcgdPMDPFwPTDNu6EQFXrivMegU8P8kuC
 GyUkarRJJGJQbD6MbSHFmKsiktICZsi+/fMcGbVRzuO896sX+Ac66LWqwyn4QCjKDe
 2mP43ZRporDO9tqFXdV2R92xUF+MgWJw3ESl8qqhYEEt0nvOXe5yRUzc/jt4fss/bS
 IwHga4r+/RTWW5gDVY3csSFTk8dkx2QXW6om6c/WyOBBqNJy8B9tD7XOvyn9vfrf+2
 npEIr2/qmEVYSgMfq0KacAPJrUZgTspW8HupZpC3tZyew+17mV0WJSf6REQOh8nGDS
 pM00PwWdye3Fg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=QHAgWRKg
Subject: Re: [Buildroot] [PATCH 1/2] boot/syslinux: fix install with
 top-level parallel build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 25/06/2025 12:01, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> syslinux is... special. It is a target package, but it is installed in
> HOST_DIR *in the target install commands*: in addition to the boot 
> files
> that run on the target, syslinux installs a set of host tools that are
> to be used at build time (e.g. extlinux, to prepare bootable media, 
> like
> an iso96660 image). Then, from HOST_DIR, the actual boot files are
> copied into BINARIES_DIR (i.e. images/); we do it that way because the
> boot files are scattered about everywhere in the build tree, while they
> are all packed together in a single directory once installed.
> 
> However, there is no dependency between the target and image install
> steps. So, when using top-level parallel builds, there is no guarantee
> that the target install commands are finished before the image install
> commands are started.
> 
> We fix that by first installing into a temporary location, as part of
> the build step, and by then copying from there as part of the install
> step. This ensures that the boot files are easily available, without
> needing a dependency on the target install step, that we can't express.
> 
> Note that we do not change the actual installation into HOST_DIR: it 
> can
> be set up differently that our temporary location, and we do not want
> to duplicate that setup here (it's going to diverge over time).
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Series applied to master, thanks.

For info, I fixed the commit title of patch #2 (by adding the
missing "l" to lpxelinux).

Do you think it would be worth extending the syslinux test to cover
this new option?

I'm thinking about simply adding BR2_TARGET_SYSLINUX_LPXELINUX=y here:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/testing/tests/boot/test_syslinux.py#L23

If yes, could you send a patch doing that please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
