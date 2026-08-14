Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57A7AC5CFC1
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 04:32:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E726407CC;
	Fri, 14 Aug 2026 04:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8udBGzGO3yr1; Fri, 14 Aug 2026 04:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 482FB4070C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786681926;
	bh=l24E/CMM3sbxknQUkskeEasqQutMDl32g+wvg6KqDC4=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a8Pu00udwb8eQ+ABqAXtJVoaBi6HBQLI974OxcUwVu+jclA/yLcuXWaZCfRZ/OYyx
	 AldLPnL4b3O6XnLXXig6aoQFbFaAN+uXEdongjrg+DnafxSxNH6f9wiDQUzHcI7okI
	 l+sBNJTsdtFBqzKeLh490IYNLbce7/enLGMLWnXwOai2cRZ9exgob/eQ/CkxkgUcPF
	 dDFgSdgPiErywYHlrLaCUejeHCsjL6gFVjOOckpyU/dy0FW5vmXIKqZIMJ6mYUwKGY
	 CkgEaUFBG2WWrkdKuvkAATATlOJF2ctjdgd6mbMTYKdViCEmIo2IEdDP5qhlNAv8cY
	 8RJlao4bCjmCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 482FB4070C;
	Fri, 14 Aug 2026 04:32:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E2C4282
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 04:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84E8380F5B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 04:32:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBVWLafjQI14 for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 04:32:04 +0000 (UTC)
Received-SPF: Temperror (mailfrom) identity=mailfrom; client-ip=80.12.126.238;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD26380F91
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD26380F91
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=o8nI9owU
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.126.238])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD26380F91
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 04:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1786681924; x=1818217924;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=rgibS5BPsvwxO+NMYzgX2f18QBBlIhxYWdfzaWpwv2Y=;
 b=o8nI9owUOI8eVOIidpZ7vIu22QeKdtLlb2mryzpLn2iVJtN+6YkPHEQ1
 QaPKVObHS20/vQ9yq6MYQJg8CAZsV48jtV6/jxYpf3ADPevs58zDtwbFi
 80dP1msOBLCUI7nu3SPrRkd8d/124pteuKvSEEI+9FS2R3vtU/m0yy2Z1
 vfsxnGOe6sHZ7IjO+VzE6PA2S4bQEn3ArQpy1GU6oC440OEHLsru3MIi6
 KcRWfWujDjsJpZKsePIhDw3PidCyQujuNKPcD8OaXIS4ihZKYiNiAA9NF
 kXM92n/4OXhlTVOmFxOEkW9HPnQhafYis3AMmv80t1/7r8xKLG7FrES7z A==;
X-CSE-ConnectionGUID: 140DpnBcQ+Ko0guTfzJYUw==
X-CSE-MsgGUID: c4DuYCujQsCgZhtXTk1PVA==
Received: from unknown (HELO opfedv1rlp0d.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 14 Aug 2026 06:28:59 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0d.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 06:28:58 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45;
 Fri, 14 Aug 2026 06:28:57 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 14 Aug 2026 06:28:56 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: qMWRF9blSqad2STBuWrrGg==
X-CSE-MsgGUID: f4zuKpY+SmSSayJKuclTPg==
X-IronPort-AV: E=Sophos;i="6.25,222,1779141600"; d="scan'208";a="464891809"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Fri, 14 Aug 2026 06:28:56 +0200
To: Thomas Perale <thomas.perale@mind.be>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
CC: <buildroot@buildroot.org>
Message-ID: <an6ZiFqeluAkBNbH@yd-6wlzhs3>
References: <81e1623bc37fdedb5cd3e4b9268fa03b45af65a6.1784526170.git.yann.morin@orange.com>
 <20260731122151.155473-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260731122151.155473-1-thomas.perale@mind.be>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX602.corporate.adroot.infra.ftgroup
 (10.115.26.30) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH] package/docker-credential-gcr: needs NPTL
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

Thomas, Thomas, All,

On 2026-07-31 14:21 +0200, Thomas Perale spake thusly:
> > docker-credential-gcr calls pthread_getattr_np() which is only available
> > with NPTL; i.e. always available with glibc (where it originates from,
> > since 2.2.3), always available with musl (which has had it since 0.9.10
> > in 2013), and only available when uClibc has NPTL (since 1.0.0 in 2015).
> Applied to 2026.05.x. Thanks

This should also be backported to 2026.02, to fix the following build
failure:
    https://autobuild.buildroot.org/results/aa5754a547f6dea3165e598f8e22b6cbe3b38f5b/

Similarly, the following commits, related to the other docker credential
helpers, should also be backported :

    882c35f7388a  package/docker-credential-acr-env: needs NPTL
    7a7b0522b34c  package/amazon-ecr-credential-helper: needs NPTL

Either that, or the 2026.02 branch should no longer be built in the
autobuilder is it is no longer maintained...

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
