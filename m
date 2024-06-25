Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F150C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 12:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9132541976;
	Tue, 25 Jun 2024 12:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6cLKz4rIETf; Tue, 25 Jun 2024 12:03:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04F2841979
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04F2841979;
	Tue, 25 Jun 2024 12:03:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 646BA1BF419
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 12:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F8FE41979
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 12:03:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYPFy3I9wwjK for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 12:03:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A19CF41976
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A19CF41976
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A19CF41976
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 12:03:15 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 14:03:13 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jun 2024 14:03:12 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 14:03:11 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 14:03:10 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.08,263,1712613600"; d="scan'208";a="161017578"
Date: Tue, 25 Jun 2024 14:03:10 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <Znqx/oPuJx92BomS@tl-lnx-nyma7486-2>
References: <e2b3835bcee63a27b24a757a2db3e9103faebc63.1719316003.git.yann.morin@orange.com>
 <CABGWkvobc38thMwekt0fsHefa6QSADKdemyZ9Mj84EgYB6UbXQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGWkvobc38thMwekt0fsHefa6QSADKdemyZ9Mj84EgYB6UbXQ@mail.gmail.com>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX407.corporate.adroot.infra.ftgroup
 (10.115.27.16) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1719316996; x=1750852996;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=BYU6cvEE2dK8zadYSXF9evh/zQwZ6vUuMjCJRC7Eo9c=;
 b=VfTmkr4QJy9qqNFJnZenGP1G6TvNG+vM2+56qT5Ph+ghW8lW10Prmm2H
 CQ5FO9QxVzM1DAfzT+uSI/SMNIda0Dn9baP64kcnCRuya+t8UU4q7yjY3
 /c1oZ2U6Od4UN4s+wW4bEEZmBlmv2tvujxQsII8YMTaww804keAgi5OCg
 Omp9HfX3IlA79od8+QbNVFK26IkJjTsa4D3R/CenThAJqMRRrUqTKxMez
 pFjpNnj9fCDzywHp+JR0odU4AS694PDgCUV4FqcZk9Y40cKumU7u3wBbo
 Hc97HfEBvARRv3ShKatKniCSpAjdwnyynhqeapcR8HiZus1B8rTzzIjdJ
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=VfTmkr4Q
Subject: Re: [Buildroot] [PATCH] package/slang: fix patch fuzz
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

Dario, All,

On 2024-06-25 13:56 +0200, Dario Binacchi spake thusly:
> Il giorno mar 25 giu 2024 alle 13:46 < [4]yann.morin@orange.com> ha scritto:
>   From: "Yann E. MORIN" < [5]yann.morin@orange.com>
>   Since commit 8f88a644ed7d (support/scripts/apply-patches.sh: set the
>   maximum fuzz factor to 0), we no longer accept fuzz in patches. Before
>   8f88a644ed7d was applied, alot of patches were fixed in preparatory
>   commits, but slang was missed (although the patch has been present since
>   2017.
> what configuration does contain this package?

    $ make defconfig
    $ make allyespackageconfig

> I'm on holiday and I don't have my PC with me, so I am not able to check it.

No worries! Enjoy your break!

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
