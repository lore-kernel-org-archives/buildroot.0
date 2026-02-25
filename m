Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED89AFD45EF
	for <buildroot@archiver.kernel.org>; Wed, 25 Feb 2026 20:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9EF7615CA;
	Wed, 25 Feb 2026 20:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vVJn2iHKyFKj; Wed, 25 Feb 2026 20:35:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C51E1615F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772051746;
	bh=JN8wwmnzdRTPWVXUE0oK9Q/LIfyQJIlOQhuRH9MjFv0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jaUDAvyfgGPYe7OfdNbJO6Li/MmDPoQiLdRQOy53kZQqlrND2bTf4UGGmS788eVBu
	 tpmpPSwYUABXkySBu0iTDi9YqGeq/XbDTFsu0tot/s7kE1QNCrEJqAI/nF+RjENfHf
	 skHT4vhZY7+Ruo/yqLboWOLTTECCRlJXu46bsurmRdiYWwcChuv7WgQYMXsDCPlBpG
	 L+oiqPBPPJfTYKs3+h/PRdMN2XYY/PdRB9NHrWFHVvS/fUUj6eve2rvlCSzKZ7m0BN
	 gHrXK7JlCkLwiS2DaNDSjYReN4LSygZJOg+SGzqQj6Sa1Oq+GbtwkVXimdzGnIJaXD
	 eOzohbPU2vVLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C51E1615F8;
	Wed, 25 Feb 2026 20:35:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D8C424E
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EFC741CE0
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NzfZhNpMhhnw for <buildroot@buildroot.org>;
 Wed, 25 Feb 2026 20:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DDFA41887
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DDFA41887
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DDFA41887
 for <buildroot@buildroot.org>; Wed, 25 Feb 2026 20:35:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C42C45FFB1;
 Wed, 25 Feb 2026 21:35:38 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 25 Feb 2026 21:35:38 +0100
MIME-Version: 1.0
Date: Wed, 25 Feb 2026 21:35:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260225191150.487199-1-bernd@kuhls.net>
References: <20260225191150.487199-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <09d31acf47a83f8ad52310f420b9c357@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772051741;
 bh=7rBo3F9Gx7LrvU7d3tb+aI3piXCVjZOti5thWJ+g040=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=djAK5+N3uwrck46bPk/Pv9AWZoC8XItczoVRw78QMoimb9RysUY5F+CxmD9bUGNih
 RQ5SrVm+X+wUprsxiWiHYXh7WTdtWtE9+5pMLvmr2yLVv4wg2v04GTdqYJYJvyhPhX
 lLpeJrDOzXHsPv4qmML7rUh9Vvp3oNfcy3IA71M9YyeBF1TSVT5PYDekyGPhAhnxub
 n4ul6gzIH1XHAgXATUO1/wez1/15iFnEnhq0j10eVjajc8JDK6/SS/m60MLVsVTDPw
 UluwLfb2POTZkXc983LFC3ZJzY3IxpZxyxHu42xAlRiR+8/WXWP5/LkIWmi52YqAFk
 gkMlEtf//NIWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=djAK5+N3
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: security bump version to 26.0.1
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

On 25/02/2026 20:11, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2026-February/000840.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
