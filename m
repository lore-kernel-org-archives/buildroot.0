Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B1FAF588C2
	for <buildroot@archiver.kernel.org>; Mon, 20 Apr 2026 12:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935C2610F2;
	Mon, 20 Apr 2026 12:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NfBEztpGv0AT; Mon, 20 Apr 2026 12:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8458A610CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776688245;
	bh=FrNw0rCt7glPEf1g/VE9gWl+sPOZb3HC2KjqZ/6AzQY=;
	h=From:Date:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mE+Za4UUEndYjJsCX2NGiFv6f8CAnQq/OODnQoWLCpU+WpDBDw/NXun10ZoF+BmCR
	 FB+JGbhnoLlhN4fJ8ztIUAKdDDqPP2racsCQ7nyE4Jpha7z8Eau9Iylb8uvnLrqPae
	 BtoJZAPJpOuS3L4fZlMoU+MV4h/xel1PhzYEXfsM3dlatH2q+nZ6xyFsUk2x4ymbGe
	 ZiIFif7q1u66zwcZBimHGIZBYZWk8IrpAcHifJrnwySGv/Mi8ISHA/Hnow4wzD0qct
	 guFik04kPrnJn4JkcE7dIDL4BTqJSzdhbFIRI/VJIhNb2fd2eMUfZYEryLZiUiFUJ+
	 /ILYFsmbPIBBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8458A610CD;
	Mon, 20 Apr 2026 12:30:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0006A259
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1D2240519
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:30:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id esFcwgDizMfz for <buildroot@buildroot.org>;
 Mon, 20 Apr 2026 12:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5541140142
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5541140142
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5541140142
 for <buildroot@buildroot.org>; Mon, 20 Apr 2026 12:30:41 +0000 (UTC)
X-CSE-ConnectionGUID: u/PGsmI7QaaAeZg5UC2JOQ==
X-CSE-MsgGUID: ISlgYQg+T9Sm3b2QipkXrw==
Received: from unknown (HELO opfedv1rlp0b.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 20 Apr 2026 14:30:38 +0200
Received: from unknown (HELO OPE16NORMBX604.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0b.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2026 14:30:38 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX604.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Mon, 20 Apr 2026 14:30:36 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Mon, 20 Apr 2026 14:30:35 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: h70r4gnQQXSbQT1IutsCmA==
X-CSE-MsgGUID: jiQqKFYUQwOPRK3Qbja7kg==
X-IronPort-AV: E=Sophos;i="6.23,189,1770591600"; d="scan'208";a="419005198"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Mon, 20 Apr 2026 14:30:35 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <aeYca+H1LnQGAuPs@yd-6wlzhs3>
References: <69e59cd7.050a0220.1ab584.974e@mx.google.com>
 <aeXymikPfNmmnA67@yd-6wlzhs3> <87fr4qhreo.fsf@dell.be.48ers.dk>
 <aeYSHz0oMG2Lx3km@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aeYSHz0oMG2Lx3km@windsurf>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1776688242; x=1808224242;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=ipIUmNXWKsc/3m2p7dWjYD9XcqxxdcanrZ5rF2U2DYg=;
 b=cAZlnp71RFp/ZHKgbfAadIYtaTkS++4x8T8CuuoaFPPdSDvZRc55mCu0
 gRCmSvcxCS3E5YkDi4nkC7OZOLou7EO/ZTWSnQlHEQVCb+80qPcQR+Xdd
 +piwW+HKr6lFNrJ5ivdsno9HVtL8nmiPpyYhqRvKZXjzRdXuo4Kq4HCY3
 twVVShrwP3W/sLyE3H/4HuiWt10LXFtRWE0vdJqWuEZOFrviE3daQGCsh
 AhVRMcdKz+d+T/3Z+XzRoPxjsfK4DDfX4sCIeweRnnnKhGFUcxi+wpxA7
 pBKICnx4BK0GaocpveQXbE6Dfk91LAL5xj7/vu+X8XKh8uTiD1ZnG9INi
 g==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=cAZlnp71
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2026-04-19
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
Cc: Julien Olivain <ju.o@free.fr>, buildroot <buildroot@buildroot.org>,
 Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2026-04-20 13:48 +0200, Thomas Petazzoni spake thusly:
> We figured this out with Titouan earlier today. The "next" branch was
> still referenced in the list of branches in
> buildroot-test/web/branches, and the script takes the "next" branch as
> the baseline when doing this "outdated packages" check. But since next
> no longer exists on the main Buildroot Git repo, it was using whatever
> old next branch was there.

Ah, thanks for the explanations.

> Immediate fix: drop next from buildroot-test/web/branches (which is
> the file telling the autobuilders which branches to test).

... and maybe add the commit sha1 that was used to generate the list
in the mail, so that it is easier to see what's going on?

> Long-term fix: somehow automate this.

Maybe ask an AI agent to do it in your stead? ;-) Arf-arf-arf...

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
