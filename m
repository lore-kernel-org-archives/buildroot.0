Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCD5CCA464
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 19:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 10D3160A7B;
	Thu, 15 Oct 2026 19:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HUOk220wiw1G; Thu, 15 Oct 2026 19:55:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B573760877
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792094122;
	b=BPHDdY3H7lEfe3g38aqjga/qYm1/gqD4n2L80t+fATn7n+bbMrWui7VZF80mYwR5KrxN
	 vAYczDdg1H4Hyc9zPmxhXsuYXuYcsgAA4I1oCf8vvGvjC061rIpPeFNqMALDD3xM647Bt
	 tc1WHc3DLWownJrtAdiUktaT6XjjrK+C0WyFvgxZfmVU/vglY7+F4o10XoHTF/YFBNW7g
	 +WsKQ6AwaHETzi3DVBf/uMDCUbh7/7bajoeM6DAxqncek7PDZxySexoKbvaYAdsw19FFa
	 dDrlWKAUHIa/35D9DoTyxtdv2oKyoLkt0BXvXPyjm0obOZ2JnDNf7ozz2RaK+VsCQmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792094122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=I1YOGtsk/n3aibNTA7xFXM1YorL5ncACGNb261SBMIM=;
	b=NUW0EfZKQUASfeM7S+tz/n4lqerGHqgISPiWDCsrper+QYWKC8LtMLoxtNMp8YaQQDN+
	 rqpmK8BCkxedSzrwCige/VpcZK32PSIQG4kluvejmrdmPG9FOOgml0Pi40TGlEnLmtIeW
	 R2XCFmTaamr4NpV4pezRS0UHCH72m/Iuc+fWoVbDXRAKd5nJw1Ir9lpm37fL2tKEggMU8
	 JcfRBHKtjTgCUnn1SnSKPdzdl/4VT37ZAQ0Rv0nO2DzKmdyCpcGeGhN+82pFr+bIQ8Q4R
	 iuZACdOU7r5rx7bOQpGAgeOiEo4FZQaCM7kLMx0awO6vPuNnCLqgcYdkWxrS6oQXr+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792094122;
	bh=I1YOGtsk/n3aibNTA7xFXM1YorL5ncACGNb261SBMIM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=eiPaxtFHnPChmz5s1/qQwbnOjCRAU/YmvubcVpDjlnigQ/TOF44ZB6Mu3c9LIgo4V
	 MozifIuLZ0nmeRlfnoQ4QOCpnsuOJswBzyNYu3xAzIh+kQyNqaStrVDwuq6v3HvImY
	 ON06dZgksT4oeV/5bg14Mwnz+F8uj3EW9ALr6nXmt1PiJ2hfAxQ0Grc7Vb6kBIX0UE
	 BnAZF0Nfpi0wKTdftWlSzEnnLS1Gi9+MWjNKq3XKBH+PcAjvLH5aVDlE9liWYi46KP
	 8Qw+pv0jIOYfya5R9DaB7TqEUXanfpjnmb8kg6BlLtOGnREXYywj5OE9+0ZBbneHqF
	 BpZ3JgsvFVrvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B573760877;
	Thu, 15 Oct 2026 19:55:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 730CC28C
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 591934081F
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:55:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnVCElRq4YMw for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 19:55:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C2FE940817
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792094120;
 b=K7SBNLc+7zDcinIdPXJtNI6Wm5NrOYHuiCHqXdcHWYBvf2wiur4O7zmiM/H7VK0z1BYP
 4vZgts8vc+jR19BDVlL1/ocS98DE1SS8h7Q7+FPgfvVUMy32DlpTw8OrR4v/zVYWbSIVd
 +qpWF+LxxDznDLIEIL3oL6TYrePSrgcDseE2sfxLxNOyQV3cOSpNnUIzr7POdqxdKij4N
 AELO+LUcskejBxaZJ7eRbxwHen61SCJZcDRdyRP08hMy/eJ8w1u6VOW5wsRn5lAsJU4IV
 Kj3PKu7txBRkbqJ5sMiBAmk3BlU32q8zKTUf6dYQwWR7nBcMyPV5SgKpCh1QaOEYTZQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792094120;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=nOCYdeDel4imyzEq2yo6eJ1yQRhEuMqkcv175WaK1zg=;
 b=h2Ens+DG5zLzLeczPbUb93F0lh+hCJl3sGfCVVQ5NriduLwj6SaHZX1KB2vLJVTB67o1
 JQL3DMdQtcJUKWKuvIJJJ5C6Q2TeVOYuB7nyyuTJyxWNuMjioeuqJGGqt8Dg03xJ1wExs
 IfRio74dRREF0apEaUK0939balGKihEo25MA2kcUv5/2xIJTuerypLKOL27Eg8C2Axv/Q
 V1BiBAGTCqLCIIabmQ/EuthRtTjdPsfuGbPLIoW6r2+iVGhdOEECd0x1aJEaI3xf1xAW9
 Sixjwb5aLE6YnJKn1o0gxfiWI4vg7okL/T5q4XGWgD3y8Kj6pw9e99bySQ0pnLUHJkw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=wzQ6iMXL; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2FE940817
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 19:55:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9F6F0C63449;
 Thu, 15 Oct 2026 19:56:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 21C0F6075C;
 Thu, 15 Oct 2026 19:55:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 25C7310328BDA; 
 Thu, 15 Oct 2026 21:55:09 +0200 (CEST)
Date: Thu, 15 Oct 2026 21:55:09 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <atEsbxorNgbUC57M@windsurf>
References: <20261015193243.3299884-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261015193243.3299884-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/9] package/python-setuptools: bump to
 version 84.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Oct 15, 2026 at 01:32:35PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-setuptools/python-setuptools.hash | 4 ++--
>  package/python-setuptools/python-setuptools.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Thanks for your work on this topic! Shouldn't this patch come last in
the series? Indeed, if you bump setuptools, you break the U-Boot
build, and the whole reason of the series is to figure out a solution
to this problem before bumping setuptools, no?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
