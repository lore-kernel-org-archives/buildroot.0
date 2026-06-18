Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F4FCD98DE
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 05:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C6541326;
	Thu, 18 Jun 2026 05:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gSuBybagPTtW; Thu, 18 Jun 2026 05:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60F1041317
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781761921;
	bh=wVxGRiUCS/YTly9k2FP8D0YIjBOgnI3/Nj3cIyOvMGI=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YYj+jt1NChjeRBeGFQ7ck63751FCNLu+5xJTis4nagsbH39Df1V0WUYsp9acpeqlO
	 7B7YabxzeLJFMWM2y3ZVvdaa4DZt5wl8WRWAe+xHslAjtBJjz6Z7HchOOD1zSNVEqO
	 vonRj/0dLyr6pOcBlF6a4WF/sbCyHSZf8EpC85FpHJLbp2v+sOtUHLql2AaYObIs3K
	 LW5x/bs1i2rchAn6pPH+a7CR1Akl+2yIrhQ6OJkl1RWGYpa632VhPjHaA3lPtETIC5
	 oEyVIk6jc4hZWTeJVrb1Enmwgw8/jCxHUdBUtdCt20a8J6eMKchH+ybj0A1uXMuKtv
	 RMRR0yX89dZIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60F1041317;
	Thu, 18 Jun 2026 05:52:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2581A1F3
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 05:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10A3F6108A
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 05:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hcFp2pFS6Ou for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 05:51:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.126.239;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 774FC61089
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 774FC61089
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.239])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 774FC61089
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 05:51:57 +0000 (UTC)
X-CSE-ConnectionGUID: O5enPUeMTueNP09X2cH7Wg==
X-CSE-MsgGUID: rgZaedhTTs688a7Qnzy1uQ==
Received: from unknown (HELO opfedv3rlp0g.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 18 Jun 2026 07:51:55 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0g.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 07:51:55 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Thu, 18 Jun 2026 07:51:53 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 18 Jun 2026 07:51:53 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: HrRG/ap+SqGsybfcBvKFHA==
X-CSE-MsgGUID: GYwgVT0YR22yGk+NpJvg+w==
X-IronPort-AV: E=Sophos;i="6.24,210,1774306800"; d="scan'208";a="436257428"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Thu, 18 Jun 2026 07:51:53 +0200
To: James Hilliard <james.hilliard1@gmail.com>
CC: <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Message-ID: <ajOHeaIobPebbK+f@yd-6wlzhs3>
References: <20260617174208.3968183-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260617174208.3968183-1-james.hilliard1@gmail.com>
X-Originating-IP: [10.115.27.53]
X-ClientProxiedBy: OPE16NORMBX508.corporate.adroot.infra.ftgroup
 (10.115.27.28) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1781761919; x=1813297919;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=/VCUzoZ6itrLUAiC2wxU9viTEFZcPgUXrmEpuzTTR4o=;
 b=cvI+VqEKUNezMonn2sKJ4nULS0wa60nyC7dOiEgPFbbbIcJYxciWzgXW
 mAgp+5v7Bx3wr0mN8Y2DVCZ/4fukF//DhNma54K0GEkvwOv1Me1dFCjZ1
 TrhKuTWRHXJgCgQ4sZtqUON5UkPlJEPqnsciVpe1CVwfjHj1zCMF46ank
 0C8dOEmRMa7ejbfbz7Mw/+ZIl3ZU6+fJpwvcjBPk6kNnq9Zk490UND9/+
 CtXhYXQmBcgqjkpEQPesMDQJs7fjYxfDco314ipT5CtK3kSlWau9gw9JT
 Lgjz5/3Vw/9u9P8oQ9nWjpSkq2kerEyOwEULz9F/14aXgsO5yZniauAuI
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=cvI+VqEK
Subject: Re: [Buildroot] [PATCH v2 1/3] support/download: add blake2b-256
 hash support
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

James, All,

On 2026-06-17 11:42 -0600, James Hilliard spake thusly:
[--SNIP--]
> Teach the download hash checker to validate blake2b-256 entries using
> b2sum -l 256, and update check-package so the new hash type and length
> are accepted. Also add the CycloneDX hash spelling so generated SBOMs
> can include blake2b-256 hashes from .hash files.
[--SNIP--]
> +    if [ "${_h}" = "blake2b-256" ]; then
> +        _hash="$( b2sum -l 256 "${_file}" |cut -d ' ' -f 1 )"

b2sum was only introduced with coreutils 8.26, but we support running on
systems that have an older version: we already check that ln supports
--relative (introduced in 8.16) and that realpath exists (introduced in
8.15).

So, we probably want to add b2sum to the list of tools to check in
support/dependencies/check-host-coreutils.s and then add
$(BR2_COREUTILS_HOST_DEPENDENCY) to the dependencies of packages that
have a blake2 hash (the python infra can do so, for example).

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
