Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62334C5B572
	for <buildroot@archiver.kernel.org>; Wed, 19 Aug 2026 06:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2ED380E65;
	Wed, 19 Aug 2026 06:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yqV83paJBmhP; Wed, 19 Aug 2026 06:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787122505;
	bh=XrG0rW6PSj88bRSxdoO/5MNlylMPjRb0B4QYYkBhM9g=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ac4k8W7UowRSErdvu55mjFMmZ2AMEJEAEgPPi3o5mPh25FMPzdjYxO3Gx1Kbuzcss
	 YE3g8JvuEIKBt/boT+VY9fGLTj/V4uN6/5g30IpELVXI3BmIM20dbJ9iam9VGKX6bR
	 nGdqMjmYJX6GRcNusVBpQ1GPWAsH0sW7gAWMHRgBxBpFXimB3pfXF83qfAedot8H6S
	 /WVGw4GQ1vrODfJPs6JLkBozLc9u8KMmzIScEZl04G1LsCBG9YiabWa+rOcwJqKgdp
	 ko0VuepwXdIID7zr8W0/XoWdd9/5LQZfB0/uWmnQutOSABvODHodwAfqElisuGWq6V
	 pNkq9F+9Yos5w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE23C80E5D;
	Wed, 19 Aug 2026 06:55:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B3421460
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 06:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4BE760659
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 06:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQMz-EjlGX0T for <buildroot@buildroot.org>;
 Wed, 19 Aug 2026 06:55:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.236;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=QwFMUaI+
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5469A60658
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 06:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1787122504; x=1818658504;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=X+CZo6I2jr6z3HMFcIvoHj5ctTDBBHpVFkWoCF/T56Y=;
 b=QwFMUaI+jQ6Qh4e1OfWLEEo7DsZvFSiI9G51gOs0mgsGLPn113vcLuRv
 851MWrCH76R9kdcwwOnKN2Pp9RrTtDynhotHVorZYlwiEh0xIypswNRZx
 OPHl7bvNlVSYr9HGXWx+UPc8AVCm5XT3kcdioQeE3DULrLI7M0KYtARR6
 OpiiPDqmlIBeHjN9a3NLCT8czs41ylJjctA42/kIh7nY4VAYdroNW9enk
 as/WV/q2KMXsQaHuUM5i/DKQSbXYyO8teZDKZY7RREFK2GtMDvKrLQVEs
 7fHC9Qlnq3ltKyxUTYcTQ259Q1re3Pz333+IM+Qi/0pJMsf1ilayUntte g==;
X-CSE-ConnectionGUID: yIfrEBwqQwe0MBxIEWCjyQ==
X-CSE-MsgGUID: +6LsowwPSXWq04ENfSQY5w==
Received: from unknown (HELO opfedv3rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 19 Aug 2026 08:54:59 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 08:54:59 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Wed, 19 Aug 2026 08:54:57 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Wed, 19 Aug 2026 08:54:57 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: REqIVQtoRGu+0vyszb7MUA==
X-CSE-MsgGUID: CUsp5gFKSTGqXgZnA8ewyw==
X-IronPort-AV: E=Sophos;i="6.25,231,1779141600"; d="scan'208";a="458263017"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Wed, 19 Aug 2026 08:54:57 +0200
To: <buildroot@buildroot.org>
CC: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <aoVTQYaWugRTiRoE@yd-6wlzhs3>
References: <cover.1786368449.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1786368449.git.yann.morin@orange.com>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH 0/2] support/size-stats: actually handle
 .pyc files
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

Hello All,

On 2026-08-10 15:27 +0200, yann.morin@orange.com spake thusly:
> This small two-patch series properly associates .pyc files to the
> corresponding package.

Even though rc1 has been tagged, I believe this is still material for
master, as this is a fix.

Any feedback on the patches, in case I need to rework something before
the release? ;-)

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
