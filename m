Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3738D6DDC4
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 06:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 117FA84516;
	Mon, 18 Nov 2024 06:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vS3Jr0SwPlim; Mon, 18 Nov 2024 06:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36A008451D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36A008451D;
	Mon, 18 Nov 2024 06:42:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C085BDB2
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 06:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB35740181
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 06:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYfxH-qLOyCJ for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 06:42:26 +0000 (UTC)
X-Greylist: delayed 429 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 18 Nov 2024 06:42:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 062F24015F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 062F24015F
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.123;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.123])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 062F24015F
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 06:42:25 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:35:13 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Nov 2024 07:35:13 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39;
 Mon, 18 Nov 2024 07:35:12 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 18 Nov 2024 07:35:11 +0100
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.12,163,1728943200"; d="scan'208";a="217392676"
Date: Mon, 18 Nov 2024 07:35:11 +0100
To: <buildroot@buildroot.org>
CC: Vincent Fazio <vfazio@gmail.com>, Nathaniel Roach <nroach44@nroach44.id.au>
Message-ID: <ZzrgH0aiaAv/amXV@yd-6wlzhs3>
References: <cover.1698657764.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1698657764.git.yann.morin@orange.com>
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1731912146; x=1763448146;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=7rJAsETSOAVoEOtGuHFLb08iGSY8HTd2eFSQ9CNctwc=;
 b=JF0JXtKRYRkNLZyaZBVQZolzBxyJp2EVxCqM+dkg30rb3ON9JtDHLbwD
 mSJ7o4GVicQRi7Af+6UsG6ZRBWYjGKhAgMxCiYsDmGEnBOujUSNk0VyH8
 QceUElPb+KSKffpN1zHsu5OD/hZ9xQLQrv461yWWEZOLq81e9QZOGhRgB
 MzM1QEjVQD8DepehFA/L2YeDslhSldLpGA7fucKCvmTSda5WE2auN7TEU
 F0RGUF2TpuL9eUSeZWcXJoT7+qo6Hu92JOR+kghp68u7FmxQLjRcha/yR
 z3644RBnIH6zrLE4gYo1o9zCVbRj36A2XFnamybf0/D1nyCOwPYYhC+gk
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=JF0JXtKR
Subject: Re: [Buildroot] [PATCH 0/2] package/filebeat: new package
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

On 2023-10-30 10:22 +0100, yann.morin@orange.com spake thusly:
> This two-patch series introduces filebeat, an ElasticSearch-related tool
> to grab local log files and send them to a remote ElasticSearch server.

I'm withdrawing the filebeat patch, because we are no longer using it,
and thus we can no longer maintain its packaging in Buildroot, as it is
a bit too convoluted for drive-by maintenance.

Nathaniel was interested in it back in the days, so maybe they can adopt
that patch and update it to a newer version.

I'm leaving the extldflags patch open though, as it can still be useful
for other (out-of-tree) packages that have the same requirement to pass
arbitrary extldflags.

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
