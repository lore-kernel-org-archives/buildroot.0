Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2850EE98DEB
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 06:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5AE84073C;
	Mon, 23 Feb 2026 06:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WkYm9W47vyhh; Mon, 23 Feb 2026 06:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB7B340B36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771827730;
	bh=+OLfs7WLL6dFK5T36wcwFZ1jlQEVClz/UVmOK3bvTHI=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XAQfqzJ/eFKPCNYnQhAouyLV+GaIdhAzLusoq+aarukMdNkU5ysErOP+JZk3EcY23
	 GxLntQRxQ/WFPr7LthuavQUmFH8ZndAHgLgFfak3g8PziuFalPiKo3OpiLHSm76XCG
	 Pioy16/66Lyh5CNAY+IFvlhbbKr28uCiVcNqzHEz9t79M8ceHx9B19i4qQlSMh24x5
	 bY1Zy8Bp4QTptpqLRpk8g9peq5MxMPmD0oLzXzbf55TYtyMymQjevm8NUbgcPLPHwQ
	 0t/3iEZoRb6egXj6yYGGgbRH4/XgdWn9udKHS37bLkOMvuId36P6WfYrV/3ua08G8z
	 GwEmmzLuixbMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB7B340B36;
	Mon, 23 Feb 2026 06:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E0D0237
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 06:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73A9A40B36
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 06:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8PWwXq6HwIo for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 06:22:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 03C824073C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C824073C
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03C824073C
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 06:22:07 +0000 (UTC)
X-CSE-ConnectionGUID: krSZNpkgToWSx+tMkV0mgQ==
X-CSE-MsgGUID: oNivmrgcTuGqJRp4Viy2Ag==
Received: from unknown (HELO opfedv3rlp0a.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 07:22:05 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0a.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 07:22:05 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 07:22:02 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 07:22:04 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: Q8xEEnGqRByeWTCtmFD1JA==
X-CSE-MsgGUID: qEAcc1YfT0Kqc7L2Jajkfg==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="395159526"
Date: Mon, 23 Feb 2026 07:22:04 +0100
To: Fiona Klute <fiona.klute@gmx.de>
CC: <buildroot@buildroot.org>, Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <aZvyDIf5TwafuKj+@yd-6wlzhs3>
References: <cover.1771588390.git.yann.morin@orange.com>
 <ab05c9e4712a533a581a956f978c383aa18ef7ab.1771588390.git.yann.morin@orange.com>
 <03570aeb-5b6d-4a89-8280-9767c7df1f60@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <03570aeb-5b6d-4a89-8280-9767c7df1f60@gmx.de>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX603.corporate.adroot.infra.ftgroup
 (10.115.26.31) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771827728; x=1803363728;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=y/XPURxoVkHcbedNYjzPXgGaHm8rYjeeJ3RagEKjvRk=;
 b=gW77ctb53qGWrGCcGmB6pSxXN7QsXCAliv1OLduhWlUQx2Wopvpgv1yB
 5pzvkPkEqhbbs2RJ1AiSZjRaUo1rraPVvx9K+ordUmfaz18Cf0iKTEqYJ
 iOmGn1IT0bTaTf+Y9ot27Z2AAjOIw+Jh+7v90dMd1Aw2CIpRDF2rEf6vA
 oidjU+sBa97xizjjTYt5tTZs9vo27YrPTA5MPMDDTJWFkjyF4T5V/Zft/
 6GPt4lcwYXa0GScKU60Y4IPKYmttN9XIRwCYW6FqftF409OIFzow8EzSk
 AQ1e4nm//UNAv3asMSkWYgA4NbCrdi/8MkBXCwoAoIo3MYfEjTAY2/b3X
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=gW77ctb5
Subject: Re: [Buildroot] [PATCH 4/8] package/mosquitto: add option to build
 broker-related apps
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

Fiona, All,

On 2026-02-20 18:15 +0100, Fiona Klute spake thusly:
> Am 20.02.26 um 12:53 schrieb yann.morin@orange.com:
> > From: "Yann E. MORIN" <yann.morin@orange.com>
[--SNIP--]
> > +	  Additionally, when TLS is enabled, the following apps are
> > +	  also installed:
> > +	    mosquitto_ctrl
> > +	    mosquitto_passwd
> The "when TLS is enabled" confused me at first: There is no "enable TLS"
> option for package/mosquitto, and passwords might just as well be used
> without TLS (of course better not over external network, but via Unix socket
> or localhost it should be fine). Looking at the the previous patches &
> upstream code it's clear that mosquitto_passwd is gated behind WITH_TLS
> because it requires OpenSSL.
> 
> Could you rephrase this to make it clear that BR2_PACKAGE_OPENSSL=y is what
> will enable building those tools? It might be helpful to include a note like
> "enable BR2_PACKAGE_OPENSSL to build TLS support" in the main
> BR2_PACKAGE_MOSQUITTO help, too.

Thanks for the feedback! Indeed, this was poor wording, and I see where
it can be a bit confusing.

I'll fix as you suggest.

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
