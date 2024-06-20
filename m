Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6EDC27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 18:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6063040103;
	Thu, 20 Jun 2024 18:33:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fbs_meYZzbxB; Thu, 20 Jun 2024 18:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2650F404B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2650F404B3;
	Thu, 20 Jun 2024 18:33:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC0471BF3DD
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58CB404B3
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 18:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSy4Jc8P20q9 for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 18:33:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 250BE40103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 250BE40103
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 250BE40103
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 18:33:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B7CCC13F88E;
 Thu, 20 Jun 2024 20:32:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 20 Jun 2024 20:32:59 +0200
Date: Thu, 20 Jun 2024 20:32:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZnR127FvpqH5sA-q@landeda>
References: <20240618201216.2538433-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618201216.2538433-1-yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718908382;
 bh=zgUYfiXIV3u15ANzP1fbckri4Y/tHpbnErlFOinOP4M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b2GkX0vr1E4UfBg8cGZc9nDwhCL0j7BJAtoc5FV36tbio8Jj2EDjcgRxD4zEaajpT
 m8nJu6PltYoEehRehpzWtJ0GV2RYRQMBPPI5IE47UhEG2goeSaeNC2im52PB6z1X3Q
 KuOttV2K+qaGICQBsh1YqIuakIPj6Lxn3jjkgt1PquFruVoHWILNvRec4A2t0nmBFs
 rxH2eMI28fnTT0Bo4KNo29X2J98QUrqVpkAKML9KfOzL/jejV9P6VBSg9TznrFEFZF
 aODcrhoVM1rCOcR20n4GwDXdQIDAo57OnMJE7EyKagx/iFIM0PhkIgDTFAULgCsLs+
 6VuOzDBhStcTg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=b2GkX0vr
Subject: Re: [Buildroot] [PATCH] package/go-bootstrap-stage3: move missing
 patch
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
Cc: Romain Naour <romain.naour@smile.fr>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-06-18 22:12 +0200, Yann E. MORIN spake thusly:
> The patch was added in commit 25991c843c3f (package/go-bootstrap-stage3:
> fix go-bootstrap when parent dir contains invalid .git). Then all the
> go-compiler packages were moved to a common sub-directory, in commit
> 0290c543dec8 (package/go: new subdirectory for go variants).
> 
> However, the patch for commit 0290c543dec8 was sent to the mailing list
> before 25991c843c3f was applied, so it could not have moved a fiel that
> was only added later.
> 
> Move that file, now.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Perale <thomas.perale@mind.be>
> Cc: Romain Naour <romain.naour@smile.fr>

Applied to master, with the typo fixed, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename package/{ => go}/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)
> 
> diff --git a/package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> similarity index 100%
> rename from package/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> rename to package/go/go-bootstrap-stage3/0001-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
> -- 
> 2.45.1
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
