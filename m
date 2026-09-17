Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89157C982D0
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 08:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43B980EF6;
	Thu, 17 Sep 2026 08:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Fof10L6HTmB; Thu, 17 Sep 2026 08:58:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7457F80EEF
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789635481;
	b=pk4LSjC/kpy9g1P8wIfKL7WgylQi0yUnCQfotqE+tAuTn2ZPVP8GDDY0hzUt1sZU6Jmt
	 IEiIfarpIHCcJ5OygwPHRjiGPYSnqRW0nn/O3DHIzR71Z+G4R9vVMNx7F6iehXxMp4puZ
	 9Cz8P1Rds7WoWZfDYlLLPuzh7J4RSMgPiGepxrRdeWbu7U2J0VHh4QZQ/r4pTpfeMLvDc
	 2GV6YSyr6PAbgcOM/aPMy8j0URxgW+PIB+yrbpAL8Wb+3O1MnsFlOdgsZuZjSnLSd8ohr
	 kS2sABKGlIHwfBnhyzlMG9uNB7nOByphshwccSrLXCfpIwHYkBhZ+CCnKl8w1G0ptAw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789635481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:Received:Received:
	 Received:Received:From:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Date:To:CC:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:X-Originating-IP:
	 X-ClientProxiedBy:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=KokDLpRiuo1ZNnFeRshy6//0hTYhGGeR+RnluVqqyns=;
	b=P4GJbiDrZlliRSMQkPpSa5Q2EC2x/lPvWeH8ys3HxbfjGZV7yCBYMoVrQJ+7SrPeCwXh
	 n6L2yXP5zIIcV3AttLR51tH5pSA/LYrfns6d2Vb6enngwtgZyVkX7bNqYN0n82i+SVNlw
	 ATS8W481QdwTeezjsA1KQR0DRVTZfqAyHepzaEHfay5V4NNm9hkLO7Qh+b/dGosKAEAAx
	 sFzT6Q6a5obPJXZFzre0UVCuht0al9+WWub3HrXWjzmI5HNanPM2t0DdbiX5S52GBEbFn
	 7sY/fJ7uOgTSrvBIVPLAzPF1GTj7EtjXBoIMdJX3eVIz5l4AaN4uTFU4PmQDM1gFDgA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=orange.com;
	dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256 header.s=orange002 header.b=PU1hKhVb;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789635481;
	bh=KokDLpRiuo1ZNnFeRshy6//0hTYhGGeR+RnluVqqyns=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BubTKeEy1rZBw5xnB8nkeU7jhxldETvCZ5DzVqXRoQOGXCV7GCKtVD4WbIsMOu7ux
	 GuhIdzp+/Q3KaPzYCEHdAGhuzdvLpiW4p9FXGEjz+hJNps3tPk/uqnNhzX/w9y6hkH
	 IV1+wuGJcE/QK9ovDMyKWimxjg5xUIPT3jnsedWHDkJfGQ+enNUlm2s2XHRCv3uVyG
	 OvhCWGF2F8/Z5fWBhmutGomvTwGdo19VCbf1s5/kmSviMBZIy9T7AGL6PMYDxAVLwz
	 pLL4F7CWXuipoa+UpvOqkwdymmh1+KTeh9P63dX4O1ak+gNAx65pBTnIxXaY1NJJrY
	 8DAaDvYPxFSqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7457F80EEF;
	Thu, 17 Sep 2026 08:58:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 61C6A224
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A36E80EEF
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lf-Q62IDaSPd for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 08:57:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A4D0D80EEE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=80.12.210.121
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789635479;
 b=ETitUluU5Z5c+0MoEDoNQxaZL/ofuv+aGNdziGGgF58s0NwPE8YJUeKGpdPC22MUDtCM
 00PuzGC5yVoXxs3X8GMpPI3KlE06j1UzOOYJzPzvK/LkZdyk3AANmoxq+I7Qb2Ws5rzOE
 MLbNilO/0zf115+eEMhin2N8XICyK1A1+sZ1f/dC9cJvcR7C9AuKeXI55/haVWIyh+bld
 sLmYRJflO+xGJ/5k3P9RHJqCPNHhRg5/f58SJ42CXnHsSeN4TF4KoJfTQLN5L0ztqhhSn
 NOBAOkfyLA6e6H0vP1Ub6/L2NQgnrrON+jSmWvI2BqsL3PQYcjokRBcniUkrX1tMHzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789635479;
 h=Received-SPF:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
 Received:Received:Received:Received:From:X-CSE-ConnectionGUID:
 X-CSE-MsgGUID:X-IronPort-AV:X-Amp-Result:Date:To:CC:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To:X-Originating-IP:X-ClientProxiedBy:
 Content-Transfer-Encoding;
 bh=NwKDHKFcdLm/XKFFeP9+84q0mXNCvBQbqSg1oulPfuM=;
 b=NHuMJAA0Ntaexw/HVCk3VdeztIIHAmM7VorL2PyHLeDLkj/FjI7jxbf1cWXipUalK9EC
 w+YXwC8kxRRm0lZyVTnwJ+0WU7MX9rcA4AWFo5rnei32WQJLO7nseV/B4kwWxwpKAeotp
 4j+iGYpENzorgdVvWLMKIbZz6kkQzLf66d5wTMU3oO59lnGyPstSfWboMXfheZwsQsF0L
 Cq49FqkrxBIZZLNfy/fP1Po2sK0EkWTd13+Ouy7s4tL1dtZKph7LXiGI+rZL0mf3eJnSq
 4oZQMiEmJs0glc20On0bcMo1YTubfbfUYvnF7hzPqPe7uA0g36xrnS0PZweGsH88fmw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=orange.com; 
 dkim=pass header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=PU1hKhVb; 
 arc=none smtp.remote-ip=80.12.210.121
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=orange.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=PU1hKhVb
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4D0D80EEE
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1789635479; x=1821171479;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=NwKDHKFcdLm/XKFFeP9+84q0mXNCvBQbqSg1oulPfuM=;
 b=PU1hKhVbrMgKIN9Ha8wHCJH9/Y0henhorJEaoSbjvgwV2pfj7uO//D++
 ZZte8TF5lFs5HeMhor9qy84VTiNOGLbplUaDkWmvzHw5hKz/20iPfIQ10
 ndv6YP/Dqfqx1caHAJk1L1wt4j9a6jmoegDkgxvCmfEIDiZEOZ+Hu4rXe
 LcqhpTh3A0g7r1a8620JYaCRmcURHP4RUmroxSVIXjGgSp88mu9glQPEJ
 etW/EUwTPkqw4saZAcy27HdTP2mzlcFwiFgOmoMFL+W2q3HoEiFG5z1WJ
 YJcHZzzlV8eV7JGEpi37E/f+LkEInmY4BFyy0csieEmlHtQQepirfzsso w==;
X-CSE-ConnectionGUID: MxoFdIWqT/CaKxM7RdDNTQ==
X-CSE-MsgGUID: Oedr08BBSUWMeKYRTK+MwQ==
Received: from unknown (HELO opfedv1rlp0f.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 17 Sep 2026 10:57:51 +0200
Received: from unknown (HELO OPE16NORMBX506.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0f.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:57:51 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX506.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49;
 Thu, 17 Sep 2026 10:57:50 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Thu, 17 Sep 2026 10:57:49 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: Yz8TkClOQ0KwRofptBDuiQ==
X-CSE-MsgGUID: R/VhOEGbQtq4etVvSrWQzA==
X-IronPort-AV: E=Sophos;i="6.27,103,1787004000"; d="scan'208";a="473682944"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Thu, 17 Sep 2026 10:57:49 +0200
To: <buildroot@buildroot.org>, Peter Korsgaard <peter@korsgaard.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
CC: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <aqurjVe5-DeDVRh6@yd-6wlzhs3>
References: <cover.1789390115.git.yann.morin@orange.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1789390115.git.yann.morin@orange.com>
X-Originating-IP: [10.115.26.53]
X-ClientProxiedBy: OPE16NORMBX502.corporate.adroot.infra.ftgroup
 (10.115.26.26) To OPE16NORMBX506.corporate.adroot.infra.ftgroup
 (10.115.27.26)
Subject: Re: [Buildroot] [PATCH 0/2 v2] support/size-stats: actually handle
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

All,

+Peter, +Thomas

On 2026-09-14 14:48 +0200, yann.morin@orange.com spake thusly:
> This small two-patch series properly associates .pyc files to the
> corresponding package, to account for the PEP 3147 layout.

Weird: this patch series did not end up in patchwork, although it is on
lore:
    https://lore.kernel.org/buildroot/cover.1789390115.git.yann.morin@orange.com/

Should I resend it?

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
