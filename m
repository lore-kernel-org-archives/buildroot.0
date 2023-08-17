Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBECC27C7A
	for <buildroot@archiver.kernel.org>; Thu, 17 Aug 2023 08:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0FB583C54;
	Thu, 17 Aug 2023 08:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0FB583C54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FryVY0C4L8eG; Thu, 17 Aug 2023 08:27:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F154A83C51;
	Thu, 17 Aug 2023 08:27:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F154A83C51
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5E9251BF3D0
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 08:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F2C983C50
 for <buildroot@lists.busybox.net>; Thu, 17 Aug 2023 08:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F2C983C50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H9E5p-hm0VjS for <buildroot@lists.busybox.net>;
 Thu, 17 Aug 2023 08:27:28 +0000 (UTC)
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CDD4583C51
 for <buildroot@buildroot.org>; Thu, 17 Aug 2023 08:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDD4583C51
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 10:27:25 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Aug 2023 10:27:25 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 17 Aug 2023 10:27:23 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Thu, 17 Aug 2023 10:27:23 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.01,179,1684792800"; d="scan'208";a="28430616"
Date: Thu, 17 Aug 2023 10:27:22 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZN3Z6ixzNKiu2JbS@tl-lnx-nyma7486-2>
References: <20230816092439.570839-1-jamie.gibbons@microchip.com>
 <20230816092439.570839-2-jamie.gibbons@microchip.com>
 <20230816142316.76d45449@windsurf> <20230816150442.GB1340200@scaer>
 <20230817094015.5324e023@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230817094015.5324e023@windsurf>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1692260848; x=1723796848;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=2aivSXOD1DAuLY+qN9HsiOaWLL0IDyEDXmi+6WRLLz8=;
 b=DNDCE0cfTZ87BShPEFrZBnBTt7EVIP775xaIrTowymoja4n8AbHorAyt
 lbLyOChcDilGrs7TdhQ5fFooMQwBmGFA0YM8SzihYR/8iJaprbrbq8foj
 h9aTBE1L8T59tV/tWpCM5ROF+Y/JsgeXND5fs3WjHKXRzkHpc8R09lX2H
 0WyqFgW9s/G/QI4nxj8cllHdXVV+iL+CRrvUm9fD6QH1Bej1yLfzb9utJ
 z15dKMNWd7V+WK/nEepDHxWcCXJXPV8nYsohxY0aBgcIcB5hGnKa714GK
 cSzyuH+r4ZNpj6fsAymXqPQRjIeWRKf+NafAor6Rnkq/n5wSWD5Jfo8E+
 Q==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=DNDCE0cf
Subject: Re: [Buildroot] [PATCH v2 1/3] arch/Config.in.riscv: update
 instruction set ext
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <Conor.Dooley@microchip.com>, buildroot@buildroot.org,
 Valentina Fernandez Alanis <Valentina.FernandezAlanis@microchip.com>,
 Jamie Gibbons <jamie.gibbons@microchip.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Jamie, All,

On 2023-08-17 09:40 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Wed, 16 Aug 2023 17:04:42 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > Basically, I think what Thomas expects is something like:
[--SNIP--]
> > Thomas?
> Not quite, because we want the IMAFD options to remain under the
> "custom" option.
> Essentially what happens today is:
>  - RISC-V G implies IMAFD, but there is no way to say I have G + C + V
>  - RISC-V custom allows any combination of IMAFDCV
> What we want is:
>  - RISC-V G implies IMAFD, but also allows to select C and V
>  - RISC-V custom allows any combination of IMAFDCV
> So something like this:

With the change Yann@home suggests, it makes it obvious and visible that
generic forces IMAFD, without having to guess (or look at generic's help
to see what symbols it selects).

However, why do we want to expose those extra sets (C, V) to be optional
for generic? Isn't that really in fact just defining a custom silicon,
which is the reason we have a "custom" choice to begin with?

Or do we want to interpret "generic" as "base", e.g. "base that is able
to run a Linux system without too much hurdle, anything else less
featured will not cope very well at build or runtime, or may restrict
the set of packages you may enable; you may enable further extensions" ?

Note that G is anyway a superset of IMAFD, as it also contains the Zicsr
and Zifencei extensions. In Buildroot, as for the I set, we expect those
two extensions to always be available (see arch/arch.mk.riscv@33 and
commit d479264b34f2).

Regards,
Yann E. MORIN.

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
|                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
| yann.morin (at) orange.com           |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'

____________________________________________________________________________________________________________
Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
