Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F8FAC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:04:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B958661269
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:04:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B958661269
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59E17607DE;
	Tue,  5 Oct 2021 16:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPs38r0M7rXx; Tue,  5 Oct 2021 16:04:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5C68606E2;
	Tue,  5 Oct 2021 16:04:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE1E1BF385
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C67B407EE
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xISCwns6h3W2 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 16:04:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AF16407E8
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 16:04:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:19f9:cbe2:8053:b89b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5116419F4EA;
 Tue,  5 Oct 2021 18:04:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633449845;
 bh=l/GRB6Rrov9XZWpUZ0ZZvoXsJTXA/Xa0gr+ttikZm9M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=huSa8KUMaFN6AYYNh7QUTjYDixUNx8BXhOdDCLKZfkmAmPKdCKzmCKq4/kNw0IFYg
 2up9Zr+KIzXglwYo+8sRhM3Ezi3VcRHSXeDQgPGzTBN7b4DaMW8I4klsoPofer+Clp
 2kMqrmgD5VjuogJurfLlcHFi3g58t0Mx+cTqJwIMPEpUh4wUYDCQplUfsNXDxh5IxZ
 jfTScyqAXGqt7rLaV2NJNsInZ/f+Jzp0nsOCRbtX0gKFr2SY7prjRfftY0peSzCsMg
 03+1y2WfEm3Srt2S18FMeXxGkFxghhcmAChP/jqALeszEPPCpRMEl5YgNVBkyo12L5
 9PA8jJZmvEtaw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Oct 2021 18:04:01 +0200
Date: Tue, 5 Oct 2021 18:04:01 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <20211005160400.GB2081069@scaer>
References: <20210919141053.3afc7389@windsurf>
 <d2a735d1-aadb-2c28-72f3-babef83448cc@grenoble.cnrs.fr>
 <11632800-793a-6d2d-8ee4-0182092c8f35@grenoble.cnrs.fr>
 <878rz9j97a.fsf@dell.be.48ers.dk>
 <d39a8eba-8e49-a9a2-6ec3-62c6969a0af9@grenoble.cnrs.fr>
 <20211005053351.GG1504958@scaer>
 <e21124af-b549-cdae-9e72-d991ba660404@grenoble.cnrs.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e21124af-b549-cdae-9e72-d991ba660404@grenoble.cnrs.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Issue with capture of emulator output in runtime
 test infra
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

Edgar, All,

On 2021-10-05 10:54 +0200, Edgar Bonet spake thusly:
> to avoid the command line wrapping, Yann E. MORIN wrote:
> > What about actually telling the shell the size we want::
> >     # stty columns 29999
> 
> Good idea: it seems indeed cleaner than starting a new shell. This is
> actually telling the kernel's tty driver about the terminal width. The
> shell then gets this info from the kernel, via the TIOCGWINSZ ioctl, and
> it uses this width unless it is overridden by $COLUMNS.
> 
> I just tested on an actual board running Buildroot 2021.08, and it does
> indeed prevent the shell from wrapping the lines.
> 
> I will send a pull request. May I add your name as Co-authored-by?

As you want, I'm fine either way.

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
