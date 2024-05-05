Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F4AC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 09:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08BA660619;
	Sun,  5 May 2024 09:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hgc2qcIPN1Lp; Sun,  5 May 2024 09:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D65360626
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D65360626;
	Sun,  5 May 2024 09:57:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EC081BF4E7
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B23A400F9
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 09:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ik92KSPDfFL8 for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 09:57:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B464A400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B464A400DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B464A400DC
 for <buildroot@buildroot.org>; Sun,  5 May 2024 09:57:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5EA6413F8BA;
 Sun,  5 May 2024 11:57:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 May 2024 11:57:09 +0200
Date: Sun, 5 May 2024 11:57:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZjdX9RhyxRyCVdbH@landeda>
References: <20240503183132.915691-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240503183132.915691-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1714903031;
 bh=0/P4U4NuZkv3b/YxKZQYfSJoeHO+AQ68r+rMGfRWHrQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O60vrIjnv7j2LIYE0ZNHs03qiuLQz0WpMPFqe/hGKOnc3ZhoEnqWF70zQoM8E1nfE
 povOJozm1H33ggLQ93iAXrAQ4oHidQK6YiBtVitX/IiE4LhQrGEWNEolZXScr/uIL8
 GmzoNC3Tv4DPRmdw3EFtNrOY1pDaznFFRbUoIvKOJmTcZRS3WtCpjL6Mpe4y82NE3E
 USqkejWtj41yA4dsz7AA5tCdlsjmXiQCOvOq9t2F2xsTg86FmT/YlWAwRzuNHnhZgc
 PHfOxpybVoh7hzpNKEGNiUzcUux7vhQnFskil+6qpD/02BjUr4Pov4nwIo/qh8n7Xz
 DwYzvKGM5u/Gg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O60vrIjn
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: update atomic patch
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-03 20:31 +0200, Fabrice Fontaine spake thusly:
> Commit 929bffbf4bf8fcb91bda446777f907f32c782656 forgot to update patch
> number
> Moreover, replace it with a new iteration to follow upstream request [1]
> and avoid the following build host build failure with br-autobuild-1:
> 
> /usr/bin/ld: cannot find /usr/lib64/libatomic.so.1.2.0: No such file or directory
> 
> Fixes: 929bffbf4bf8fcb91bda446777f907f32c782656
>  - http://autobuild.buildroot.org/results/a12b9c4436594818f4ce128595b429adf7d90e31
> 
> [1]: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/3606

This has now been merged, so I tweaked the patch to refer to the actual
commit rather than the MR.

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
