Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDCF2C48BC4
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 19:27:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E528820F9;
	Sun, 18 Feb 2024 19:27:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pgSDn4m4gle5; Sun, 18 Feb 2024 19:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76CDF820FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76CDF820FB;
	Sun, 18 Feb 2024 19:27:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 62B801BF83B
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4FD84406A2
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m652s6aFSa6k for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 19:27:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2E6C240698
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E6C240698
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E6C240698
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 19:27:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A5EC513F899;
 Sun, 18 Feb 2024 20:26:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Feb 2024 20:26:58 +0100
Date: Sun, 18 Feb 2024 20:26:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZdJaAuIOfOXyhDUn@landeda>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708284429;
 bh=fNGPSubG7xHg2Xm7hX0WOH+XeliXNbxcpY7jlXoKUWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WJtpDRTxtQNkdvICV71HIYW9S+Q7qr2vxFp4leccp83jmgFicI3kpgH6h6B5W0aw/
 7qIG1m/MKSQHLu2mWILvICnbTIHUIcIihnzlrz8NCPO+pQZ/vAQbKIAVrGzqWTTVMs
 zh9VrkWAcP7SZ2UKa+bQy2TE6cJdDMai1ZQWidagwofPVlLHbRILagHLPx4+Jva5N0
 i9XM0OKxlX6zUYDAaMtDsb+tlg6Zs2QUBpW1TeJi8PLySGvLz1ptK5Da+ZrqhrPbKb
 Q4ZF4KWIC7C7B15D0eDEnTG59h4rTp2Co1rQmX45MgI4q7VEAlXIhdMSLkoSGcu4Z0
 WhnNzWrrjriQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WJtpDRTx
Subject: Re: [Buildroot] [PATCH 0/8] Patch and remove Nios2 binutils bug
 27597
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2024-02-18 19:45 +0100, Giulio Benetti spake thusly:
> This patchset add backported patches for Buildroot Nios2 binutils bug 27597 and
> drop packages dependency on it. Doing this the external toolchain will fail
> building those packages, so I'm not that sure how to deal with this situation.
> The same happened for OpenRisc and as far as I remember the first patch of the
> series has been applied, then Bootlin toolchains have been patched and rebuilt/
> redeployed, in the end the remaining patches have been applied. But here we also
> have Sourcery CodeBench Nios-II 2018.05 toolchain that contain the bug, so I
> don't know how to deal with this situation to avoid build failures.

My suggestion:
  - keep BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
  - make the sourcery toolchain select it.

For "soon" after BR 2024.02 release::
  - drop the sourcery toolchain: it is going to be 6 years old when
    BR 2024.05, so it's going to be time to drop it.

Regards,
Yann E. MORIN.

> Any ideas?
> 
> Thank you!
> 
> Best regards
> Giulio
> 
> Giulio Benetti (8):
>   package/binutils: add local patches to fix Nios2 bug 27597
>   package/gdal: drop nios2 binutils bug 27597 dependency
>   package/kf5/kf5-kcoreaddons: drop nios2 binutils bug 27597 dependency
>   package/libcamera: drop nios2 binutils bug 27597 dependency
>   package/libgeos: drop nios2 binutils bug 27597 dependency
>   package/pistache: drop nios2 binutils bug 27597 dependency
>   package/postgis: drop nios2 binutils bug 27597 dependency
>   toolchain: remove binutils bug 27597
> 
>  ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
>  ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
>  ...ertion-fail-in-nios2_elf32_install_i.patch | 125 ++++++++++++++++++
>  package/gdal/Config.in                        |   4 +-
>  package/kf5/kf5-kcoreaddons/Config.in         |   1 -
>  package/libcamera/Config.in                   |   1 -
>  package/libgeos/Config.in                     |   6 +-
>  package/pistache/Config.in                    |   6 +-
>  package/postgis/Config.in                     |   6 +-
>  toolchain/Config.in                           |   6 -
>  10 files changed, 382 insertions(+), 23 deletions(-)
>  create mode 100644 package/binutils/2.39/0004-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
>  create mode 100644 package/binutils/2.40/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
>  create mode 100644 package/binutils/2.41/0003-PR27597-nios-assertion-fail-in-nios2_elf32_install_i.patch
> 
> -- 
> 2.34.1
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
