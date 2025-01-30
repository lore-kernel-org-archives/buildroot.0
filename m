Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E59C0218A
	for <buildroot@archiver.kernel.org>; Thu, 30 Jan 2025 13:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 965EF81BA9;
	Thu, 30 Jan 2025 13:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i-Onw7ZhAs7e; Thu, 30 Jan 2025 13:52:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 97D9980CCF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97D9980CCF;
	Thu, 30 Jan 2025 13:52:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4465B12C
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 13:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23BF1607A5
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 13:52:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SfHSmkQA91m for <buildroot@buildroot.org>;
 Thu, 30 Jan 2025 13:52:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 028386073C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 028386073C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 028386073C
 for <buildroot@buildroot.org>; Thu, 30 Jan 2025 13:52:48 +0000 (UTC)
X-CSE-ConnectionGUID: TusmWMJITKe7ZZNukjmNEg==
X-CSE-MsgGUID: X8T9DVHAS76d2+dTE1oXaw==
Received: from unknown (HELO opfedv3rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:52:46 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Jan 2025 14:52:46 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Thu, 30 Jan 2025 14:52:44 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 30 Jan 2025 14:52:44 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: oZEIoAAYQy2lKdRGqhVwLg==
X-CSE-MsgGUID: QSHclnfFS52t7kn7pgmPmg==
X-IronPort-AV: E=Sophos;i="6.13,245,1732575600"; d="scan'208";a="250785007"
Date: Thu, 30 Jan 2025 14:52:44 +0100
To: <buildroot@buildroot.org>
Message-ID: <Z5uELGjqLGpMrPNT@yd-6wlzhs3>
References: <7468355a4fc6ef9c9a9fa70efa9c4bdac89cfd3c.1738218734.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7468355a4fc6ef9c9a9fa70efa9c4bdac89cfd3c.1738218734.git.yann.morin@orange.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738245169; x=1769781169;
 h=date:to:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=4Um1r+Q2fq/qDZHKf6/NhxVF9jRIPpTaDPoZdS6BMjw=;
 b=QLOwG6uxH1pQXamutpzfIEdf/UY3cZkwCW4yPCzp2THVZD8ey3IgOdjE
 jCOPO2A2nPYSKQzUWhD5jUm11QWMrslw7Og0jnnlKe4OxsH11EjGe0yGv
 lIvHKi8YL50/JSzYKQiTsWzIY7grqa74tswJT2PLxbBcY1BYbbVIlRgqF
 yd+ugZP3aHxFGoNrD4VO7voyvPUh9vSebOKjLsCaSxQAfevwZqhZoCzVw
 XtM1sIb/reC/5JIb0/9jZUJ+dMrF5g+R8bWCXV/cp+BsJ3XS15b+yncKs
 5/CJjwEUqrirnsIOX1Ea5q19Pvg3RL4DfO4oxW777p4XR4SFPfhENbDj0
 g==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=QLOwG6ux
Subject: Re: [Buildroot] [PATCH] package/autoconf: fix parallel builds
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2025-01-30 07:32 +0100, yann.morin@orange.com spake thusly:
> Backport two patches from upstream, to fix highly parallel builds on
> very loaded machines.

I'm withdrawing those patches, as they are triggering automake to run.
I did not notice initially, as I tested in a context where automake
was installed, but of course it fails immediately when built in the
reference docker image. Sorry for the mess.

Running automake would indeed be required, because the patched files
are included from Makefile.am, but in Buildroot we can't have automake
before we have autoconf. Sigh...

There are two options, then;
  - consider the case sufficiently improbable that we do not want to
    address it;
  - build autoconf with MAKE1.

For perspective: in three year's time, with about 20 builds a day in
a CI, the issue occured only once, so that is relatively infrequent
enough that we could decide to ignore it.

On the other hand, autoconf is small enough that MAKE1 should not
cause much delay, and be largely dominated by running ./configure:
the whole takes about 2 seconds here...

Thoughts?

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
