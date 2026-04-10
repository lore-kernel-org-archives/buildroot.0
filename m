Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A987F364DB
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 11:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A9D980AE8;
	Fri, 10 Apr 2026 11:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AGoxYn4snX4G; Fri, 10 Apr 2026 11:05:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD73E80A96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775819105;
	bh=R2ScncdKmNuFyeucopbgUZiSwC/11tQzlDK6Mc2Na5E=;
	h=From:Date:To:CC:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mKKj7Iv6RGgiXQu4QkKaBwT//0vChkYv5piL1q02+1xMNlN6xKrrP0ClSiJGULsLy
	 reNLczgCRRfgiOcNEYH7fhPq7VZtL83x/VkFS1ULyKgHQMsh4r1N2CJsoNuzRp5e8D
	 VmP4qdcd15r2A/gXmEMTN3nVcP0vgHX0cN3+bUQWcpTahgWCwoNQpdP5i/T8Otzm3R
	 ywt/+6dx1LWwxZJIA0LZSK3BV1bnmNK0O17MUaiPZTH1qQQ3gkRvKW4yr29q+q1Rlb
	 ZN8asWVQANyyCmPWRgcLhkLIXwRQtQSZWbxd+rovMdf1yp7QdfPZWfSRVPV5izDqIb
	 TqHWezw1v7naQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD73E80A96;
	Fri, 10 Apr 2026 11:05:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B58D71F6
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B3B860707
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:05:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jsruoUT5wD3 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 11:05:03 +0000 (UTC)
X-Greylist: delayed 431 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 10 Apr 2026 11:05:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33009606BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33009606BB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.121;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.121])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33009606BB
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 11:05:02 +0000 (UTC)
X-CSE-ConnectionGUID: BsLqJgJxRdWGSKH1UVZ2rg==
X-CSE-MsgGUID: xzua+R4fS4i36rTi9hqHUQ==
Received: from unknown (HELO opfedv3rlp0h.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384;
 10 Apr 2026 12:57:50 +0200
Received: from unknown (HELO OPE16NORMBX604.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv3rlp0h.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 12:57:50 +0200
Received: from yd-6wlzhs3 [x.x.x.x] by
 OPE16NORMBX604.corporate.adroot.infra.ftgroup
 [x.x.x.x] with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37;
 Fri, 10 Apr 2026 12:57:48 +0200
Received: by yd-6wlzhs3 (sSMTP sendmail emulation);
 Fri, 10 Apr 2026 12:57:48 +0200
From: yann.morin@orange.com
X-CSE-ConnectionGUID: 3DIZ63vGRLKnSpMlerLA8g==
X-CSE-MsgGUID: a4ahrRfjQVCXdDi6vx/kPA==
X-IronPort-AV: E=Sophos;i="6.23,171,1770591600"; d="scan'208";a="411440387"
X-Amp-Result: SKIPPED(no attachment in message)
Date: Fri, 10 Apr 2026 12:57:48 +0200
To: Thomas Perale <thomas.perale@mind.be>
CC: <buildroot@buildroot.org>, Vincent =?utf-8?Q?Stehl=C3=A9?=
 <vincent.stehle@arm.com>, Joseph Kogut <joseph.kogut@gmail.com>, Titouan
 Christophe <titouan.christophe@mind.be>
Message-ID: <adjXrNxDLUVWCwz4@yd-6wlzhs3>
References: <7b86fd0c400abfa616573d98d996c3a32cf87135.1775020521.git.yann.morin@orange.com>
 <20260410102629.144216-1-thomas.perale@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410102629.144216-1-thomas.perale@mind.be>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX504.corporate.adroot.infra.ftgroup
 (10.115.26.28) To OPE16NORMBX604.corporate.adroot.infra.ftgroup
 (10.115.26.32)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1775819103; x=1807355103;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=AM9LdtOLLSZg1IhckAVWFqID+F+UYV2tTYPnUGjnNxo=;
 b=fC7yYalKf5+v+AH2RhRkfQL/oI/+m0GeEtWu1AXpNSU2Uvkq9EYKLcbt
 +QqqipS7FWmA3gpT3tuI/h9giPOLcbA03Feg5zDOkPCv+sDqVFNYf6tr8
 z1+8FyyDSL6zA7qcHQsMZob3/qQvNbV/ZTIQSCs++vuIs5CJig24z1+B8
 heeP4posMbLxeHueSbbRJ6omwL0j7rzZG1tur+305EQYV5s09N/6Apo/B
 ch/O3WOjMyZTXozfGS7zHEpu5bHxEjRJrb44Tm7uoSH73157x6sjijecd
 is2E31XHZ/Hy376n5YpxN5boU+b0Dn9hjTQIVR1IxWDSRFY1Hct7NiD+B
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=fC7yYalK
Subject: Re: [Buildroot] [PATCH] package/mosquitto: disable building the
 crtl-shell for host variant
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

Thomas, All,

On 2026-04-10 12:26 +0200, Thomas Perale spake thusly:
> In reply of:
[--SNIP--]
> > Explicitly disable the ctrl-shell, to avoid build failures when the
> > host has a mixed installation of readline or libedit that is not
> > compatible with ours.
[--SNIP--]
> To double check, does a backport to 2025.02.x needs to be done or it's a result
> of the recent version bump ?

The control-shell is not present in mosquitoo 2.0.x, which is what is
packaged in the maintenance branches of Buildroot.

So, there is no need for a backport.

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
