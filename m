Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE405FEFB58
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 14:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80C9C82244;
	Fri, 27 Feb 2026 14:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fRinBwx2WQam; Fri, 27 Feb 2026 14:33:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B4A98223F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772202827;
	bh=EK/7jZ5T49ArN7bu+JmQD+U460YrK68p4GYpEiiUyvQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ayF9E60xXDFlOlIDd3/H/2brR3TgWVXzr4Uu8ZHISxpTZifXwqUNGAo65Nb0cbz67
	 nxSqempF34x1u4easi5aBFqoAG49lRLEOv8KJhA7KNFrcvdT0HX0fe+knykqrUNFuW
	 I+puqKuhzBd1kvuxl87ashgUtpMOqaVmbjS1yby84Yl5DHSL+dvh20ZiIRu2XIBdAA
	 gIvkCl1gZEWsOzGCNZbAbGHy7vWBDAnRACJfOBZ0xAtvIpk/60EoTJQHJNTyATRFOa
	 pVazGMGow87+fsD2217hZCdozdwXJyh/ux2WGzKEG2IzHKj8pxmLX/JeViCvrG1ZtR
	 qqu/3lFWK5mug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B4A98223F;
	Fri, 27 Feb 2026 14:33:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A20241F3
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 14:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8833E60AA2
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 14:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id id0vqDqSoJ6E for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 14:33:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=46.105.35.92;
 helo=smtpout3.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D8F660AA0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D8F660AA0
Received: from smtpout3.mo533.mail-out.ovh.net
 (smtpout3.mo533.mail-out.ovh.net [46.105.35.92])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D8F660AA0
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 14:33:44 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net
 (director1.derp.mail-out.ovh.net [51.68.80.175])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fMrRT55DFz5x2H;
 Fri, 27 Feb 2026 14:33:41 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net
 (director1.derp.mail-out.ovh.net. [127.0.0.1])
 by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <thomas.petazzoni@bootlin.com>; Fri, 27 Feb 2026 14:33:41 +0000 (UTC)
Received: from mta7.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.0.133])
 by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4fMrRT2q3Hz5vcm;
 Fri, 27 Feb 2026 14:33:41 +0000 (UTC)
Received: from mailstore13.priv.ovhmail-u1.ea.mail.ovh.net (unknown
 [10.1.8.13])
 by mta7.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTP id AC650B813E6;
 Fri, 27 Feb 2026 14:33:40 +0000 (UTC)
Date: Fri, 27 Feb 2026 14:33:40 +0000 (UTC)
From: Vincent Cruz <mooz@blockos.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Vincent Jardin <vjardin@free.fr>, buildroot <buildroot@buildroot.org>, 
 Heiko Thiery <heiko.thiery@gmail.com>, 
 Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>
Message-ID: <2078026576.1752075.1772202820527.JavaMail.zimbra@blockos.org>
In-Reply-To: <aaGXv_uW9n3CCdm1@windsurf>
References: <20260218124726.120001-1-mooz@blockos.org>
 <aZ1Cc77UDKkaGWsM@L30177.local> <aZ20SDo5Dxnta4be@windsurf>
 <693104517.1118565.1772186066394.JavaMail.zimbra@blockos.org>
 <aaGXv_uW9n3CCdm1@windsurf>
MIME-Version: 1.0
X-Originating-IP: [213.36.7.12]
X-Authenticated-User: mooz@blockos.org
Thread-Topic: package/sysrepo: fix build on riscv32
Thread-Index: TLODmHDdLJvUjplM5ntfugFvJglpOA==
x-ovh-tracer-id: 12341270354523376491
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGH/3jUXN/urZJsKSsKqViEPxD/1rqu/WyaKV6UTpGwmF+7Ii8nrGJW3CA8cMSVw4b5j3cUcHPTbKLcuNqBw0DPWtNR3I66v9sv36bEHHJ8Y9e6OXBYiPpWG2ccTvqnzWYuNHegzyx7vX1zVBua3EDluP0QvzMn5aD/sFcd8+kax7KqueIV1/f8lGO7OCwPDNNevrZelIbya2HsArtyyJcIzV4YLsx/r3yFbV/2bjankLnHygg/PWWpoK3ttzhJicdipsNHfU4fShOBYmw9ig6IMFHXDHGZ6Q20MLC3g+Q6DqsCMWDqBdZZ/ApQz0bDC716b5UToYPcL7XfvwK8fSJ0dW/3YSPBPpcIptoYzl4Mx5pGnWrRLV6PX+GRTdK0iGMjGtQtITkGhav8xpNu54hOJpV5h2ktLzGF9xXylABg0s8wqgkC3BF9tSkltnVeIvQWcRfhnfh5ViWFH+Xuj0JV3gfgEyuoxjVYlmpJNdGExtooFPbu+okUALaLjBjBCMZZef5qTTZRHx+m9QdgvvNd3lu68hCczSDkJpJONei5T3MY0AmUDuJdDviGSTVA6LjG4OKCLa0pG0GKCgngsNuf/hMm6eCE1G0ulOOUSOSGGQ+ikJDEPOrxgrArfSnzPthhsPWP/pGseLDhd7S2VZuXkp4Sd1tMiI2EnZnPhHlSlQ
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
Subject: Re: [Buildroot] [PATCH] package/sysrepo: fix build on riscv32
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

----- On Feb 27, 2026, at 2:11 PM, Thomas Petazzoni thomas.petazzoni@bootlin.com wrote:

>> Do you mean dropping the patch file and making the package use the devel branch?
> 
> No, backport the patch to whatever stable version the Buildroot
> package is using, and add the patch into package/<pkg>/. Don't forget
> the Upstream: tag in the patch, pointing to the upstream commit.

Ok. This is what I did in this patch. I added a patch file with the fix and the Upstream tag.

Regards,
Vincent Cruz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
