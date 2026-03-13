Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D56107BCD0
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 17:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4DA40AA0;
	Fri, 13 Mar 2026 17:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fmV377WOvXgV; Fri, 13 Mar 2026 17:23:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E12D4072B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773422626;
	bh=z5cCb0Uo8++p1azucqnkS1wAeH3jfID/t1Lw74j6OpM=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hwyE7iz1YWsKvFvRaFYr2y5wEJMGywsCbJZode4tNo950Dwn+racig1mEU4QctB28
	 dwtQsxkJFOCht+pZd6X/r5GX7alCbLE8XlBfDaWA514neCUlXtj+NjVONlu87qKDjS
	 SpjRg6ShxxvG/eTJbNpnWJ8Xe9XRY+wW6WFCIJbeKPVG91AzredqhUixZoUV4w4U7W
	 ZGplH/5swlRqlqE7Gs5O8/kZAyZVUm3ZJ3hZsceu4r1ffiPp9OhBycFHILU2LOZmIU
	 eaxX4YSvmdA4vo+XTsy2TnketHxsC+5TbOYzTcbcL+JEij/8fszJX9NXlFP3jnmd2l
	 OOVdc+PbsXOCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E12D4072B;
	Fri, 13 Mar 2026 17:23:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98D11786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:23:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 897B660C1F
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:23:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFK5D3MJ-bQW for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 17:23:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D41C460BA8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D41C460BA8
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D41C460BA8
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 17:23:42 +0000 (UTC)
X-CSE-ConnectionGUID: d5X+wG39RwmrMybYg0U7qQ==
X-CSE-MsgGUID: zfZmpRzlQqGIB8mGKBo9XQ==
Received: from unknown (HELO opfedv3rlp0e.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 13 Mar 2026 18:23:40 +0100
Received: from unknown (HELO OPE16NORMBX602.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0e.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 18:23:40 +0100
Received: from OPE16NORMBX204.corporate.adroot.infra.ftgroup [x.x.x.x] by
 OPE16NORMBX602.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Fri, 13 Mar 2026 18:23:39 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX204.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Fri, 13 Mar 2026 18:23:38 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 13 Mar 2026 18:23:37 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: iVIja1ZSQDGx5Jbx5Fhp4A==
X-CSE-MsgGUID: A3jZCcEYRTuVWuc+c2YwuA==
X-IronPort-AV: E=Sophos;i="6.23,118,1770591600"; d="scan'208";a="401724702"
Date: Fri, 13 Mar 2026 18:23:37 +0100
To: <buildroot@buildroot.org>
Message-ID: <abRIGedNNu+5ToQM@yd-6wlzhs3>
References: <cover.1772121240.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1772121240.git.yann.morin@orange.com>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: ope16normbx505.corporate.adroot.infra.ftgroup
 (10.115.27.25) To OPE16NORMBX204.corporate.adroot.infra.ftgroup (10.115.26.9)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1773422623; x=1804958623;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=7s/mM287kEzMzKvBBiHgP8XcVIPJLsn3CZrxeiCCw5k=;
 b=Ky7/MEGjL9rAtHVqmSBh0Fr9hMUWJhut3pDIO6zJ4iAa8aMmf0lrYeI2
 S1mAcXoiaAhPca37iEpfLlbvMy/29RmAPvIvndfcHb2qzMFlnBsji1HmG
 o/StLUacwzhhH90kenCt7DJV9U46gVFW8mVyXFL8E62UfuGpadwdpdIlu
 7w42Y5MKRdpOel86cnpx1TWeZ89RQaYcK5HRYTWXn0nEN7oIfaVsd3/20
 tkgxfVgrwEgEsdLTpUlnf5L26cuknF8ZlQN5EBxpZ6uPnpSPkKKkCBnlv
 Sw7oreWnHeDIBPK/o/4amvImHvXky5qUzd4DAwXgEtyrHlY2S2Ew7bmFN
 A==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=Ky7/MEGj
Subject: Re: [Buildroot] [PATCH 00/11 v3] package/mosquitto: bump version
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
Cc: Danomi Manchego <danomimanchego123@gmail.com>, Titouan
 Christophe <titouan.christophe@mind.be>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All,

On 2026-02-26 16:54 +0100, yann.morin@orange.com spake thusly:
> This series brings a new version of mosquitto;

Ping? Any feedback?

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
