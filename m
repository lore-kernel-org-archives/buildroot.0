Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F73BCA5FC1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 12:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3AD3413E8;
	Sat,  3 Oct 2026 12:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pnt1yZnpcHZS; Sat,  3 Oct 2026 12:54:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 23FEF413FB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791032079;
	b=qq+R0aaz/aJO/1NF4z40AH6w8AW0VP+d9AkPtvmufzYh/wT4o7mB1H7Or+5KZISaBJn/
	 jZkzvwC6Eg6rhMgR7Z2AQVjCSO0r4Ch8XWbwfmjpo98NXscMw6hB9Nx1zkk2NVu5hs+NA
	 yI6xZvJd4JeruMSWqEE2l9jasOh2yOMOaNgo44VB+Yoj541uTlS9k4jWA9p4aBgfB9X7t
	 Cg7xY5AZxf+KHjUu/wV2qEkmDmPfiO7ZOaloRtr8zoskHF9iUw+PnwPuWtylaQLhgP6mq
	 TbVOJ/vvY7QQb6srVjQV3RIpgT5MGleU2Ck+HpB0/Se37gfe69FuTyS9j9Hofmh142g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791032079;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MFPIhYrIRhR6Q4cH3oHchSb47U5+O0hC+26fuJRHENc=;
	b=g+3vpbc/5wT4fJ+p/SnnwMjYvrha5VsWc+mbhlCMz3utesBYYb0g/zFN/SqQ9L8fdkVy
	 /dt2K73hZGWWDB8owRmnGwV4cTLgfWmXoidtC54tfa44a3nt9S+poRi6v5JvUSMQmuKG4
	 PgHj631ifhObwJ7p90bKDESDo+JQUQVDdKxzi+urZv0lRpUUaQdROabbW47W+vO1GGOJR
	 r0RvPVwF5g/a9FWw58tq+rWU/9mrFWtiXr/WT4P6LUwhXlgG+dBOWGBLE1cgm6Fhvz53p
	 sMtZxOgo5omMJ6vKbfts8JB1TNf+3aDL5aiUair130MsjjN7p4Z0y8R8+5bnstIRaew==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791032079;
	bh=MFPIhYrIRhR6Q4cH3oHchSb47U5+O0hC+26fuJRHENc=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bFyQpgvO2dyZs0zcUDMkXMdsLMVvzO17qo8vnC9NhOxBswDOOczqnBKEXQw/Hi4OK
	 et1vW2UeGcdIElZMQllW6mKVXMHQF5TAkjhqhaW/WAg4KpAb8cxR/5Cwvp5UHOTDWS
	 BOtHZ8/BhVCKDB2IZ2VPxqmYYi+HpmrkATvt8a8ONih8io+oBXYEcFCnDN4qNy4+Im
	 XVL8q8eRYZJlmaJCmzo1Sa3AwlXQBcFJFJ/a6woEP97EVT4GO5zX3rcgYnpOqVqa6n
	 PxYI57qPSSYYJjJHY8RmisgW5nEL+OPXRH9q5I8BHN6k/zSYnoKncYB1WBlbTqKKWA
	 qXItcAjAHCHpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23FEF413FB;
	Sat,  3 Oct 2026 12:54:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AD338435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F50B81368
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w0L_3QY9_oc4 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 12:54:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D69B681366
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791032076;
 b=Tt81dj+88Cq9DfOMvzaaIo9nNfrBmrzWwc3TrOMtPpD3piNJ0nWEoyZo+HxpNxEE+MdL
 Qpr5iSRV4ciUMw2Ol6gxG51QDPTTUAfPvh0dhnfB5ydM10z8xhL9vHy+QATRYrqPhrN0s
 WaWzEs7mbyv6tjCjOa6IRdZrJDfTY0NWvyxCxcvm6GkNaVnJe/timmY4w58RIhHThNE3l
 LvBNIYw7dn1n/QxfoQZbEHqqKJRi8S4yaGnvSSyGwIJicVS+IwxLbwUVIrfzivFefvze8
 /PucERPCFWbZeVZ853VJYUuZIm2wTOHILqrmP4cLm5A+WMAM65pPPGp0/khTqlO5FEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791032076;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=CFgMrFWqElB6ypLlJAzthWW1aXLw6VRsQHIPkj96IFs=;
 b=AxmB0KrO1BaYVzDCiG0MVDdg3PG7cYV8ZZHibAMTHMetSps4sXP9FEnJTATAamNjnpFz
 6PQp3uTxwf0ww7zAuIrSpUsDnUdxUho4JQVLuGFEF3h9wLzjeKgQFrYGpaRStsQf+euI9
 OEKNvMl7dmi7O1jP/1A1sDlAGI6gSlZcvKDgMIxJ34rGiK7wmhT5upLZ60Q30hadAOIre
 bKiqgOKtICRJ66tZZ/IDAD62axZe4ASUowE3EusN22xhreFXqd+HpMTMD4iwQmzP5PVGe
 ThjaWaYAlW+SNs8lRtVdXTnrjQ3Jw/AzhzTLoKptlk9SVxOD/PfYxkKmvt3RMEj6Lsw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="HNjWZwu/"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D69B681366
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 12:54:35 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CB1484E41129;
 Sat,  3 Oct 2026 12:54:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9A744604FF;
 Sat,  3 Oct 2026 12:54:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EE6A710328318; 
 Sat,  3 Oct 2026 14:54:32 +0200 (CEST)
Date: Sat, 3 Oct 2026 14:54:32 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <asD7BFmrTbDBklYy@windsurf>
References: <20261003084453.545653-32-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003084453.545653-32-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-webob: bump to version
 1.8.11
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

On Sat, Oct 03, 2026 at 02:44:17AM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
