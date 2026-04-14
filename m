Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1573DF9D0F6
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 20:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0518835FB;
	Tue, 14 Apr 2026 20:31:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a4G2Q1OSSrYY; Tue, 14 Apr 2026 20:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A8B483C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776198694;
	bh=Yuzkc4ChGJt9lELxC6j+j59wreeFCJMcwB1BCmxPgbs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nurhhYODlogBDxKT33PN4TGUn6N22lOinTtn5yjem8MiWAB12t6EVd5XIetymBofn
	 V0+wzZhei/aP19a18L9Q/h/tpi/0aLpnWqSmt+PTIZYH7tEL4xkXGz/85H50plUQlb
	 6uXuYeOeCI9XxLL+8tKCJzwDg3VT34TSwLUB72uOfuqU7VLIR6jwAg4NtmkMxF/xJi
	 zV9FU5GCozOc+80tnsN7H6tGAj0iT8p282sGvX5MKlRF4nmfRJ64jNxTtkyLzMCD0S
	 RB+5mkN0snDwZYmN01OgCKhJOxlIjasbeJ96Xid7Ga2rzH37e7bnJZLKL8lH6Oz/3E
	 L3jlPjVOD9FLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A8B483C61;
	Tue, 14 Apr 2026 20:31:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5E296375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55BFB84525
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zd1kpMoL0GM0 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 20:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92086835FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92086835FB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92086835FB
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:31:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 490AE78035E;
 Tue, 14 Apr 2026 22:31:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 22:31:25 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 22:31:25 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Dimitar Tomov <dimi@tpm.dev>, =?UTF-8?Q?J?=
 =?UTF-8?Q?=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>, Sergio Prado
 <sergio.prado@e-labworks.com>
In-Reply-To: <20260414160708.2041081-1-bernd@kuhls.net>
References: <20260414160708.2041081-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <353b88977ba0eb5b8fb7434fc4b3c76e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776198689;
 bh=0na0aSRGyNVgMtGlPpu3BbNp39uB5vfbrOY7KN8C/WE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vNgFwgmNKZ4o84u0wHn1wfK+2sG3I0xIyHixl8r+Hr18LaptTTnFHS6B58WDxUo/f
 iVurtl4UlqQGN7NnDZjpwIaPnYZ32WKpQYuBg/ylpaJGfJdq0DeLNxYBxrLUPncA/U
 sVYE44Uip9t8OzkR6Olyquj5kIvsB5DQc+oA+9Rfj/9Bx6ERRsqpNfnSXU0XNgQo37
 Xx161ad1YMGoqBOvrlmCRqMcFK+wJbrbD+M1tmSufrQO75eLVxpL+IQk09NWJI5o0+
 Qjjr9FMSCVcBmJB0I0wi3k1Aapv5JLWGI69e1XURWrLBD6M+yxubp0L9ge9Pl+SfTs
 d7TpIYsLpuKzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=vNgFwgmN
Subject: Re: [Buildroot] [PATCH 1/5] package/strongswan: remove unneeded
 wolfSSL fix
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

On 14/04/2026 18:07, Bernd Kuhls wrote:
[...]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
