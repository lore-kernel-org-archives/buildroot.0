Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8167AC4320A
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:53:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 361CA60F9C
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 20:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 361CA60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3EA4839E7;
	Tue, 27 Jul 2021 20:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id URCa4tGDwx-z; Tue, 27 Jul 2021 20:53:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DF27839DC;
	Tue, 27 Jul 2021 20:53:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BB791BF860
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:52:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 978674051A
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 20:52:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id he02GSTyKYqG for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 20:52:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3373340517
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 20:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1627419172;
 bh=eNamC8xrrQU+AmencAm6lx0u5EJ4Sv/ya+jiW0diWCM=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=CuefuWqqsXDN13LvmNTQQAfugW6qM1H3nQ0JVpqS5TB0FAEqH1dhcj5H9bC6QAkET
 /9O95BbWe2VGkyHQTJIEqfpxTA+iFNG1h+knTUJNvYD8gZqUTIw9aXVmzBmQ0la6FM
 Ewf5eG5fRQ/wbYnyAuMVkP3wolLZdZwt8oO1MBt0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.64]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MF3DW-1mNq8q2PBw-00FPLO; Tue, 27
 Jul 2021 22:52:52 +0200
Date: Tue, 27 Jul 2021 22:52:51 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20210727225251.19b7a798@gmx.net>
In-Reply-To: <20210725215756.059e125f@windsurf>
References: <20210620205607.25904-1-ps.report@gmx.net>
 <20210725215756.059e125f@windsurf>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Bav1FaMW+jGAO9Hmd6pVtWbWpNhIBE3BJrWEcejTeUjY3a7Ihy3
 cQBdQlTJ+UTLER6HMywjcU20kNISxX5aZ8VJnadJCbTm22zyUdBCFnqm708A/hHwpCyi2D3
 Y2pGScYpXa4NnGwIm8lBVobYKLXKtZuNDhTVkI9BC1oInpbaKXQt97lkL9XAIAQirWWLUXp
 jeMB7/BrCn7kAMahOW3sA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:PgW/HyqVztk=:LqM72oj53jEGQNoM+OJPSO
 /Gk+ji1b8qpthgo0e+sUCFVFz2/t+vPuTgaqE1QTBt3odzVzRNLTJSZ2KiLfMdB8pIN3z9vFn
 YCV7srFrzmiCA9veM4Zqjipqu8uo8lr/QQ2PHdTN/ADRXTGvYlbFAsFeJGZGuohvXMDaNFboS
 qUFgYpcbyTUJHd1KCzfxB40fYuU4Cq53mK4d8psK4vfTLN1aVvbpI//IRBbhwKFh4kZQwEFbf
 dCLVftlmZ2zsuzG1gFsxQNHRG0N/MCixFhNjb7bqy9g86lpdMVUmJvdetMnu2MnbW+Q4sTXBY
 XiNcZsD4yl0HcVEQr9EYlJhiEaV3x/Ki2qfa4lSrFFVTlXwdWm3GrS2eP/NETtnFLVDzGnqrD
 3sNM/lPklllrIxonqEFIutkk+Suf8Rmn87QUlRc1XNkEt4iLWnuVHwtimnyLwxH7aRt+APyvH
 qh2asI4MiMjnjjeiil3eVfVJedzjqWLn9f4cQ1+heID6pqu7VGlN5gfZ2CFqgyNUii4F7MHDa
 moPYsTK3eIXK1z08DTsSd8jl/Rq0/oQm5mE1sOxtsYHFKqGux5DFH4kBfyba240VimKoPNMAe
 mEr0yIJ4/IkC5+qOewGVVlgif5A7CfyWNSdJZGA7ae/T378Z872Nq1RMKgGYkNZyCam8sodvs
 Ii0XTxXk2m/3/2Kl8QBuaqofrB+LlZu40RdTXZTya6hgt3GVh02Y+kMGsjyFcc3v+7A2PbqeU
 5blEUWqi8BW2GKn6vYaLdOBH2PftzGeRDfuOBgmRO37z9pWlEdpqlrXLqYjnNfMQK0L9NTDRK
 pHz/cf2z2aM+PPnkqNF78+Y3YDd7e7q8jNNE5Cs6f+OqxKf6PfpS0LFG5cPKubwVg9z1EeGQT
 H9IeyOZl+JpLcnSDeJEGaw1awcaT9dNiaO08d3nozdIyBYIkrf1DY5V7EV5UFmKBZVOjKnyhS
 GC0tCaGkpsfH6+en8KEQHuDDbcphY7XWJdBsgBkGEvSHOaNJc6Apm+f6lXNuTumkYW20bp285
 JvOva44aVoJdFZCKPCLJtguBPgBSj23RtbolH2gmCguBGe82e+Cp/Xpj0SvyKuXKz4dh+eUNj
 FsBvisap6M7XDF2nsToA6VPsmhkWlGSQL01
Subject: Re: [Buildroot] [RFC v1 1/2] package/iptables: add option to enabel
 libipq build
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Thomas,

On Sun, 25 Jul 2021 21:57:56 +0200, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> On Sun, 20 Jun 2021 22:56:06 +0200
> Peter Seiderer <ps.report@gmx.net> wrote:
>
> > - add option to enable libipq build
> > - as libipq.h includes linux/netfilter_ipv4/ip_queue.h install (not
> >   provided by modern kernels otherwise?)
> >
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>
> Is it really a good idea to add an option for this library?
>
> Debian dropped installing libipq 5 years ago, as this library is
> deprecated:
>
>   https://salsa.debian.org/pkg-netfilter-team/pkg-iptables/-/commit/bf21537d27ee72cc69ca0883059b315ceaf9737d
>
> Also in 2012, iptables developers said they would keep this library for
> 1.5-2 years:
>
>   https://git.netfilter.org/iptables/commit/?id=a624e0a1b2d075253b599ababd4ea1351ef42b2a

Did the patch as part of porting an custom (very ancient ubuntu based) project
to up-to-date buildroot, but hope to get rid of all legacy dependencies on the
long run..., no problem with dropping this patch...

>
> But then, when I look at the nrlsmf source code, I don't see any
> reference to libipq or ip_queue.h. Am I missing something ?

File smf-1.1b2/protolib/unix/linuxDetour.cpp:
 15 #include <linux/netfilter_ipv4/ip_queue.h>

Mhhh, maybe I mistake it because of the ip_queue.h file found in libipq...

No problem dropping this patch, see above ;-)

Regards,
Peter

>
> Thanks,
>
> Thomas

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
