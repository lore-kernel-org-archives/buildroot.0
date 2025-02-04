Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A27C0218F
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 06:27:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11E96403D2;
	Tue,  4 Feb 2025 06:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id glOqoInvEUPB; Tue,  4 Feb 2025 06:27:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 256DB40348
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 256DB40348;
	Tue,  4 Feb 2025 06:27:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D1EC185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:27:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CC7740331
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:27:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JdP7y1CYMbu for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 06:27:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00F43402ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00F43402ED
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00F43402ED
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 06:27:34 +0000 (UTC)
X-CSE-ConnectionGUID: lMDytsrPSHW53QAf830MRw==
X-CSE-MsgGUID: CerTjVGuSimd49+q+eZYAQ==
Received: from unknown (HELO opfedv1rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 07:27:32 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Feb 2025 07:27:32 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Tue, 4 Feb 2025 07:27:30 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Tue, 04 Feb 2025 07:27:29 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: zUASimevSsSGCsytckCjbA==
X-CSE-MsgGUID: fWlUCkX+R766PMgFigmAKA==
X-IronPort-AV: E=Sophos;i="6.13,258,1732575600"; d="scan'208";a="247291267"
Date: Tue, 4 Feb 2025 07:27:29 +0100
To: Christian Stewart <christian@aperture.us>
CC: Fiona Klute <fiona.klute@gmx.de>, Thomas Perale <thomas.perale@mind.be>,
 <buildroot@buildroot.org>
Message-ID: <Z6GzURTwV7ecNYx0@yd-6wlzhs3>
References: <20250203120130.2332720-1-fiona.klute@gmx.de>
 <3dfa6faa-9307-4091-9a8b-f327a0be19be@mind.be>
 <434ed0ef-17b5-48af-9c93-1c7bb75c857f@gmx.de>
 <087a8c52-81f6-4031-b0ce-712fc8857034@mind.be>
 <bf504c35-cbe4-40dd-b56d-bfa3b62e552c@gmx.de>
 <CA+h8R2qSoHp-YPNDAtNiCMrsEEULhYZGZa_EveNnUuPHkeucMQ@mail.gmail.com>
 <CA+h8R2qfjy2PWktigLvq96Tg-GHvVk=uxicdkgW_pp84OvZBCg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2qfjy2PWktigLvq96Tg-GHvVk=uxicdkgW_pp84OvZBCg@mail.gmail.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX101.corporate.adroot.infra.ftgroup (10.115.26.2)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1738650455; x=1770186455;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=/fl2oxKYYaXqaT7pHRkMon8VkP3B0i6sjH1JjrY6kno=;
 b=Q/rRY8F0rlZn7QiIOskMQaosw/2tXHJ/eB1ok8mruQbKdON1UZeL2ooE
 e+ZXCiRzMGhiF6aMQmbOoxFp7nOXPn5FEuoCVOUzTBq7+XJk9QJ72/4sS
 6ZaYcibAvgotMk3pAfdFDE02st+S3oNxXk3zjMMFnQjFmPbYrH6SDUfhk
 gCPitPxUCJeuNFNwQJKAtPI7XB8tsKalJbGygkxYqeJCO+JrQaa9hUjjS
 Yy3pVspvWyse3WF+VNLg16BngIPzFu+Mn65dzfJuqj0OYKTDxer1KzE3F
 oGEAunzxURqGAbjmDmqXYwr2i5L25z+beP1Ynvg8aQcTpIGHydC0M6rnn
 g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=Q/rRY8F0
Subject: Re: [Buildroot] [PATCH 1/1] package/go/go-src: stop forcing
 binutils-gold dependency on aarch64
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

Christian, All,

On 2025-02-03 19:41 -0800, Christian Stewart via buildroot spake thusly:
> Does this PR more correctly address the situation?
> https://github.com/golang/go/pull/49748

That would still not solve the issue with go-bin, as Arnout mentioned
earlier.

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
