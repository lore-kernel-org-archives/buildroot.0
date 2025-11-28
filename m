Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5737CFD376
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 12:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AE3861B04;
	Fri, 28 Nov 2025 12:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TByL-oBDZ4WO; Fri, 28 Nov 2025 12:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C9D561AE8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C9D561AE8;
	Fri, 28 Nov 2025 12:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F948967
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 12:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5E82684730
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 12:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hbv9k1pWXvbk for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 12:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DC1568472F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC1568472F
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC1568472F
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 12:28:33 +0000 (UTC)
X-CSE-ConnectionGUID: 7+K81eQEQu6axKud9pyMYw==
X-CSE-MsgGUID: Fj914bLDT0ulXy+H0BsA8Q==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 28 Nov 2025 13:28:31 +0100
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Nov 2025 13:28:31 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61;
 Fri, 28 Nov 2025 13:28:29 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 28 Nov 2025 13:28:29 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: /QkIdQFtSKGA0gWpJH4alw==
X-CSE-MsgGUID: 1sVhCr9wSTeXdOosOxBWMg==
X-IronPort-AV: E=Sophos;i="6.20,232,1758578400"; d="scan'208";a="362881909"
Date: Fri, 28 Nov 2025 13:28:29 +0100
To: <buildroot@buildroot.org>
Message-ID: <aSmVbUtMCleLKNbs@yd-6wlzhs3>
References: <87faaefbd593a016f9c7c8489f3c8e41ba5fc315.1764331632.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87faaefbd593a016f9c7c8489f3c8e41ba5fc315.1764331632.git.yann.morin@orange.com>
X-Originating-IP: [10.115.26.51]
X-ClientProxiedBy: OPE16NORMBX301.corporate.adroot.infra.ftgroup
 (10.115.26.10) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1764332914; x=1795868914;
 h=date:to:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=vQmgkF2YfwsOVfw1mdiBE2SZUui6lLR5L3OQa+3gfYc=;
 b=dV8ktXYbHjE5SoOTR9S8DhUYWBjhm8efh+yqJ+PUHQWiEnET90hMQlBy
 bATGtqF6ze1d2SkxPMoeuCNMG72KAwwGBaPLpckEGNDOx8HeFrh9qrbYw
 4NAYFmvn2bPjDZN7EJuedicu9swFLafwdlXdwJLi+XjcoVKwB6p9DQKh2
 uE+eNLDQbreRmGUaV7JLx0BVGRZTsHOivvWIfdlL7slcP03X2NXGCKQUW
 DdFz2LVabNnAW5cBL5DX+XZFtT1m02ZoOfj1GDWS5YAC0gK0AypdumWlo
 g1xqPHryO/vN6+BlJ7SdQIta05N4Dxn7LQZKGOHDD/mOsfp19SDUDqInn
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=dV8ktXYb
Subject: Re: [Buildroot] [PATCH] fs/rootfs-common: depend on host-mkpasswd
 if enabled
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

On 2025-11-28 13:07 +0100, yann.morin@orange.com spake thusly:
> From: "Yann E. MORIN" <yann.morin@orange.com>
[--SNIP--]
> So, rather than trying to be too smart, just add the dependency also
> when the host package is enabled. That way, people using br2-external
> trees can either select host-mkpasswd from packages therein, or they can
> add it to their defconfig files.
[--SNIP--]
> -	$(if $(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)
> +	$(if $(BR2_PACKAGE_HOST_MKPASSWD)$(PACKAGES_USERS)$(ROOTFS_USERS_TABLES),host-mkpasswd)

Not sure what hapenned during my testing, but this is in fact not needed
at all: host packages that do have a Kconfig symbol, do get built before
the rootfs, when that symbol is enabled, even without an explicit
dependency...

I'm withdrawing this patch. sorry for the noise...

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
