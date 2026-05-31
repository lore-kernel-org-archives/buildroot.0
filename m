Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42346CD6E57
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 16:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0285E60FD8;
	Sun, 31 May 2026 16:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsRQAdees_sq; Sun, 31 May 2026 16:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1270B60F79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780244577;
	bh=bu2eES7kd29+VRPsQdt6iRsov08xyT6eFpA6oOdcxkE=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=QjkLWp01K/IcWVNTMccrTaDewHuP2cDutRLi2WS1wpMGOdBdaNh5vvJsljJ7H5nlP
	 vPk5d6O0cX8CkWR+sD6MhwFOvJKaCtsIOQcAcF/L0KezL8Cw51O5SM1F1EoQLMEHEw
	 0FA2Z3YLZq/X+NRgRZQqgcSdNBzUukPQ4s973Q1O2IMzAPtE9gx2z52dyQjcS3Dk37
	 gekcl41pj6597/NviZ4Oxemx/M121jWdp5ED+cDv2htvDRKhMKxnKC8PDXQ+1U3iJP
	 y1IGGYDVuBwZAozvZIXRXdUmQQNEq9WQ6PM/ur1+hCN9l5X8ZhDZxDPCY112NVL8Q+
	 tjOKsH4PhCNAw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1270B60F79;
	Sun, 31 May 2026 16:22:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E92652AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 16:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B244F42B56
 for <buildroot@buildroot.org>; Sun, 31 May 2026 16:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfhFeJBmgtcf for <buildroot@buildroot.org>;
 Sun, 31 May 2026 16:22:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D61CE42B5A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D61CE42B5A
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D61CE42B5A
 for <buildroot@buildroot.org>; Sun, 31 May 2026 16:22:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 2312A4E42DB4;
 Sun, 31 May 2026 16:22:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D54D560230;
 Sun, 31 May 2026 16:22:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A75FB10888CC7; 
 Sun, 31 May 2026 18:22:45 +0200 (CEST)
Date: Sun, 31 May 2026 18:22:43 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <ahxgJkG0qqeRJf29@windsurf>
References: <20260531153557.2375580-1-titouan.christophe@mind.be>
 <20260531153557.2375580-8-titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260531153557.2375580-8-titouan.christophe@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1780244568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=6TwsKoTwcWVItWyEYBXWjhR6cd5qF34GI4ZHx2va0yo=;
 b=doDyqjHCev5Wxrkg/6SU24ZlgpFs28s1+b+tQBzoVe/FV4mZokgAfwTLei+KC/vrCd5bxr
 WUCGkGukdLOGNh9VWLkS33u4Nqzzhx00/SXJapjAdNVSlMkmeYN6ovqRBZXgncoPlI6faf
 yOjhl+hSnN/BiFnBCx0CKwf8dXnYxZDPdz/XSC2QkAeGbLSCpl/opOGCVsp68IJp/sOVB8
 tTPDHn7+3EJvAH8EaQRk5i63xZW8HJwvz6A08QqgbHOM3fgH7ip+HbpN5Gmr82BCL0g2vT
 JV9i0XWwdoOdW0LqZjriwD11n0L3F8sWwNW+npbwX/2q/UK0t058kLyNzSAvPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=doDyqjHC
Subject: Re: [Buildroot] [PATCH v4 7/9] package/openssl: move
 libopenssl/libressl/.br2-external.in.openssl source statements outside of
 the choice
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
Cc: yann.morin@orange.com, ps.report@gmx.net, petr.vorel@gmail.com,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, May 31, 2026 at 05:35:51PM +0200, Titouan Christophe wrote:
> +config BR2_PACKAGE_OPENSSL_EXTERNAL
> +        bool "from an external tree"
> +        depends on "$(BR2_EXTERNAL)" != ""

Hu? What is this thing?

And what about the other packages that are like openssl, i.e virtual
packages that may have providers in BR2_EXTERNAL trees?

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
