Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9065FEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D7F81E74;
	Thu,  1 Jan 2026 09:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtOHiM2ie1fr; Thu,  1 Jan 2026 09:48:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B3A882051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260926;
	bh=02iV57XcULe66z910fa1MJKf1pZLdUDx17n9NXEa67A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GiYJ50h9RqObsWt3TeQlecHA14uHjfJAqW5R8u9YYLNYstGrYMMbj98i6xpmCxG55
	 73YRct53MxLalMAtgHIE+Rslye60HkMl7eyomj+lHfgATr0IAyfngjiFB2q8/pKky8
	 BGhvrAypA22BoLoQU5e7CvUR65ndujcqM+8hxH77ojhl+s2BkbssQcHupzzsPlf2E4
	 Px7EBN4RQ1AKyq4EBLv2Go6hqcN2Swl8lSz8mJOosntbdYc6tOSJHAVLk6Adq88595
	 I0EzW90A/AafDrPZy84u+KGQqTl1IcOisupV4WjhtVy6rRSGDds9dhHKpy24XW3u6d
	 xsXQbC13kXfZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B3A882051;
	Thu,  1 Jan 2026 09:48:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1922B351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B39382060
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8qmVFnZIhgGw for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:48:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D83D282043
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D83D282043
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D83D282043
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id F1E814E41ED2
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:48:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C860F606B6;
 Thu,  1 Jan 2026 09:48:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 26BB2113B071F; Thu,  1 Jan 2026 10:48:41 +0100 (CET)
Date: Thu, 1 Jan 2026 10:47:29 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20260101104729.28bf70c7@windsurf>
In-Reply-To: <20251231232442.756169-1-james.hilliard1@gmail.com>
References: <20251231232442.756169-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767260921; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ghh9KPSSBQYLFOCcPkN4w6/3TcOQQtUS31m760DCusg=;
 b=2CNDyD+Kj2UqetYHDXzirLTkdRpvMZWon8SwTC8z30ynh4IGlErzULD52V997MZCgwsDzy
 ffms8WuhV5ukOTtqkN0LGeXlibkqcSjYCCpgni4wsDPiAufAqrr6lnNWDhtSFmSDNfboS/
 nzpkNjlulFmcEGoq/w6qAne0Ii+SgA23SSZjyGXrhurlMARKa+20vrsksQE5GVPlnnam/K
 GSmfVcNob3oyDLSz/CHYjPdATT/A3f7ecFvE7jlfxgJ4i4K09rGcKpJ9LzNrSMechyoWE+
 ao9VS3KRlpXKQemrSog+8E/NSWu3/GBHa6iUuRdxh3c/kqnNPFb9/HNFvWAmdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=2CNDyD+K
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pbr: bump to version
 7.0.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 31 Dec 2025 16:24:42 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pbr/python-pbr.hash | 4 ++--
>  package/python-pbr/python-pbr.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
