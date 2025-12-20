Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C5CE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 20:27:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76E8760E03;
	Sat, 20 Dec 2025 20:27:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GSFZBS_WR7ow; Sat, 20 Dec 2025 20:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D378B60DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766262428;
	bh=WJtdKqaItZ+QPLfepSV4oVvSGI4IXDce6dwhMC3Shng=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lFwz5qxcJw1TofPwA1ZXFE+evJQTWMi9GtPa2576XNvJHggVOrGThW8F0vXKyV93M
	 3vatVMw5cgzlQPIz09i+fOnZI1GNyb2OHsbTqOv+m389HfhaDeZsvsBkhi1uR8OaYf
	 XkV40nVqdFfA+F3wH30Jl9kdNu/4ripkwsxpCJ7y+zFMhlTLeZTc5Vk6F739Fj18vq
	 tUrniS7K49g0LsnDsNIkXLX6EUy4x0ERwMreUNNnr/oFvUhrWGV0xlsc5lf2tcXPfr
	 xOsBiRQabx1vOH/ocVSmtNuirez61LYI1foBNUgE5thjlKKKOUlL3JpRpUrgCDGbCC
	 AhNPbtNB7dj0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D378B60DFD;
	Sat, 20 Dec 2025 20:27:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B17923D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 20:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 413D740586
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 20:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n3D8qjTPCis1 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 20:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 46AEC40583
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46AEC40583
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 46AEC40583
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 20:27:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A7BBB78034D;
 Sat, 20 Dec 2025 21:26:58 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 21:26:58 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 21:26:58 +0100
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, yann.morin@orange.com, Fabrice Fontaine
 <fontaine.fabrice@gmail.com>, fl@n621.de
In-Reply-To: <20251215104452.480722-1-yegorslists@googlemail.com>
References: <20251215104452.480722-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <17989f1d3463df79495d5384db30929c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766262423;
 bh=XAuiNd3KporODzXlFgedDyt0ayy1lD3cJ2ySiuS8a9c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MYxSFgWiWIIxPw881ZRstkiqw9VGNrwqsqgivepbxyPmVQwvGRaShZz631aindr4l
 mE64zERCYYaDjV6kxVDwsBHtB1wPMyhHY7K5rB6FCTOAuUdr/08i4SP7PxQqXmZjG6
 6omi5CTWtRqn/nF8E4WthxUuwOJrKdkHCZJwNthEZpqZAl52izrt/5XqgMF8uC1Zh8
 rpnWDmr2RoRd5Ofa6a1JuMsS0EitTA/jcVMk3r8m8Za9p/b2fpJ3+5Y3jO/R3DgrTq
 Iv42r1suUv6wD+fNwbnSj6Rhd+dZGKIeS9h71eoHA14lg0Rp20nQB90OGaSrnBatKv
 mUnVrp4N678xA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MYxSFgWi
Subject: Re: [Buildroot] [PATCH] package/libconfig: bump to version 1.8.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/12/2025 11:44, yegorslists--- via buildroot wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For change log, see:
> 
> https://github.com/hyperrealm/libconfig/releases/tag/v1.8.2
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
