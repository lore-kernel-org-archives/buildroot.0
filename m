Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB510C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 18:31:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B4EF404A9;
	Thu, 11 Apr 2024 18:31:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZIhCRrwkX1Pb; Thu, 11 Apr 2024 18:31:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19EBD41F00
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19EBD41F00;
	Thu, 11 Apr 2024 18:31:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D04A1BF3EC
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 18:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47085404C4
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 18:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub2jl5ugg6YC for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 18:31:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 259814044C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 259814044C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 259814044C
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 18:31:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B08C213F838;
 Thu, 11 Apr 2024 20:31:42 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Apr 2024 20:31:42 +0200
Date: Thu, 11 Apr 2024 20:31:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ben Hutchings <ben.hutchings@mind.be>
Message-ID: <ZhgsjkTpLfChnX_U@landeda>
References: <20240411152016.1185109-1-ben.hutchings@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411152016.1185109-1-ben.hutchings@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1712860305;
 bh=Zk6ut21mnKAFLwo/WiWATs2dP2jwliV/O9CeCArGc7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zbipt+/lihXBF1urbyyNiDZUVuDvSQ+jevMGiiC+I4OwqiDmS9SmGIKq7HLAHpTn4
 FovF3xphVnuPJAWDOQIELW6Lq7TV5/PUayr8JR96bActLTyAQy8Eeg+K1/Bfr0JPpB
 ig7ziNpzCPe3re21wI5oUpuDxSJE2+DaZPKUJw3vd02VN9Ay4C5wrFGDyDsfO3ROd/
 0s7tz5cyAMD9gtfLLW2a6nB/aumZjSxeZ2Mpr/p8V4SnYSUm642LMeusqIZn/QO/bP
 VVcQqg9/LSVpHjlYFNh/uObMG0Mb9p69XHyjzqZdnWPn/H41GZ2m7XVNfPKA16AErk
 fXU8mCyFYE1dw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zbipt+/l
Subject: Re: [Buildroot] [PATCH] package/skeleton-init-sysv: Set sticky bit
 on /dev/shm
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
Cc: oss-security@lists.openwall.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ben, All,

On 2024-04-11 17:20 +0200, Ben Hutchings via buildroot spake thusly:
> /dev/shm is a world-writable directory, like /tmp, and should also
> have the sticky bit set.  Without this, any user can delete and
> replace another user's files in /dev/shm.

Indeed, good catch!

> This bug has been present since /dev/shm was added to the skeleton
> /etc/fstab, but appears to have been fixed for systems using systemd
> by commit 76fc9275f14e "system: separate sysv and systemd parts of the
> skeleton" which went into Buildroot 2017.08.
> 
> Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
> Fixes: 22fde22e35f98f7830c2f8955465532328348cd1

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/skeleton-init-sysv/skeleton/etc/fstab | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/skeleton-init-sysv/skeleton/etc/fstab b/package/skeleton-init-sysv/skeleton/etc/fstab
> index 169054b74f..06c20fe9d5 100644
> --- a/package/skeleton-init-sysv/skeleton/etc/fstab
> +++ b/package/skeleton-init-sysv/skeleton/etc/fstab
> @@ -2,7 +2,7 @@
>  /dev/root	/		ext2	rw,noauto	0	1
>  proc		/proc		proc	defaults	0	0
>  devpts		/dev/pts	devpts	defaults,gid=5,mode=620,ptmxmode=0666	0	0
> -tmpfs		/dev/shm	tmpfs	mode=0777	0	0
> +tmpfs		/dev/shm	tmpfs	mode=1777	0	0
>  tmpfs		/tmp		tmpfs	mode=1777	0	0
>  tmpfs		/run		tmpfs	mode=0755,nosuid,nodev	0	0
>  sysfs		/sys		sysfs	defaults	0	0
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
