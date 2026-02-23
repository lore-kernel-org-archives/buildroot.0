Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCC1EA4FBA
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 14:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F20E1405C2;
	Mon, 23 Feb 2026 14:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GXcG5T1_fx13; Mon, 23 Feb 2026 14:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19F3D40637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771856483;
	bh=4crFn77pFxzU9GKX/aV4fezFsuufowI0lkd77VaBGWU=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JjvNzYImKEfJhB9wdZZuQgWTDmjeQxzn/HbpMi0LJ+yT8XVwraHRJNlEl+QpRBsVC
	 pbZX6qSnL+6wuh3LbQGLbj9j3Z17E0q/Bu7qrbwssBjI+UzKdsmgzxHaMwYVeGvATh
	 aaLOi55ozhs+a+EoVEE98RWb2HZgNIJ9m9nNPb2z6C7mKikcZrdc+QutBvd8WVyW3U
	 C865PjnwwIQ9lt9UzDyr0sYg3qWeZyEWrqcax46r0yzgai6xeu6XNKtKxWSkRwew8e
	 6lqt3NWIQF93Cv3PKPz/QYzT5gcLLwX+whEB3DyzweUhg4CAy2m+Iz7KQSlHsVFGsj
	 ReZhBxBkvkx+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19F3D40637;
	Mon, 23 Feb 2026 14:21:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31F6A249
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:21:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 238BD40251
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:21:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id is-AwtqErcIV for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 14:21:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C3AB74024A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3AB74024A
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3AB74024A
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 14:21:19 +0000 (UTC)
X-CSE-ConnectionGUID: 75TPH5XeT4qKdVptTX/6HQ==
X-CSE-MsgGUID: c3oMfX1PRDmDIw9T0Td3hQ==
Received: from unknown (HELO opfedv3rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 23 Feb 2026 15:21:17 +0100
Received: from unknown (HELO OPE16NORMBX503.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 15:21:17 +0100
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX503.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 23 Feb 2026 15:21:15 +0100
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 23 Feb 2026 15:21:14 +0100
From: yann.morin@orange.com
X-CSE-ConnectionGUID: vNWmE1WjSLq9T1Dnvre0Qg==
X-CSE-MsgGUID: FkKaErCnRfePuJB1b7hAPQ==
X-IronPort-AV: E=Sophos;i="6.21,306,1763420400"; d="scan'208";a="396030138"
Date: Mon, 23 Feb 2026 15:21:14 +0100
To: Fiona Klute <fiona.klute@gmx.de>
CC: <buildroot@buildroot.org>, Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <aZxiWjuS+5JFqKP/@yd-6wlzhs3>
References: <cover.1771588390.git.yann.morin@orange.com>
 <ab05c9e4712a533a581a956f978c383aa18ef7ab.1771588390.git.yann.morin@orange.com>
 <03570aeb-5b6d-4a89-8280-9767c7df1f60@gmx.de>
 <aZvyDIf5TwafuKj+@yd-6wlzhs3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZvyDIf5TwafuKj+@yd-6wlzhs3>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX503.corporate.adroot.infra.ftgroup
 (10.115.26.27)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1771856480; x=1803392480;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=XQqwQ+5HrdX36LW4Va/53nSAQOynfpL0T5CKbcgS91E=;
 b=hk6RijqGuhF+IJNkNyhKd3bHVf3MLjYg6uw55PE7XYMOtDISqEZ0Epgk
 RzI0WUBPen0IqB05m7pFx7nWIgn/6U1CNSOhbFikVQHCIR6/SLZcRVg0X
 OkT0hpw+m8XQ188lPy+or2Dwyh1V2ciErcvOdv/ibcTatDz34SGaZV4Bm
 C2gxD4+mhiaSAmxldErNo/AmO7dCrVFFhnT+PafcJO5MiUJs5suHX99nq
 9J+fL2rRJGuFfOJW8EBkYDgFsZ/c5cDNFjd0Cvw1hY0JI9hhCAQnq+8oY
 STy2eFDPwv/QNiEniKOZr5VtO8Ua/0+AmZluGXpcO5+FPktanCDlnkRPJ
 w==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=orange002 header.b=hk6RijqG
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

Finoa, All,

On 2026-02-23 07:22 +0100, MORIN Yann INNOV/IT-S spake thusly:
> On 2026-02-20 18:15 +0100, Fiona Klute spake thusly:
> > Am 20.02.26 um 12:53 schrieb yann.morin@orange.com:
> > > From: "Yann E. MORIN" <yann.morin@orange.com>
> [--SNIP--]
> > > +	  Additionally, when TLS is enabled, the following apps are
> > > +	  also installed:
> > > +	    mosquitto_ctrl
> > > +	    mosquitto_passwd
> > It might be helpful to include a note like
> > "enable BR2_PACKAGE_OPENSSL to build TLS support" in the main
> > BR2_PACKAGE_MOSQUITTO help, too.

In the end, I did not address that part: we don't mention it for any
other server that has optional TLS support. For example, there is not
such mention in apache. It is indeed somewhat obvious that, if one needs
TLS support in the server, the implementation of choice is openssl.

Of course, it is somewhat different for the tools, where it indeed makes
sense to have a note about that, so I changed from "if TLS is enabled"
to "if openssl is enabled".

Thanks!

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
