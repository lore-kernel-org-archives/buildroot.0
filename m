Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D78E0FF885A
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 21:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D07940B4A;
	Fri, 24 Apr 2026 21:43:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qQGW49zQhCPK; Fri, 24 Apr 2026 21:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4209240982
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777066984;
	bh=QKmUJ+IOx28YAgpUGMG4aQEdbumb3gpOZewQQTlIfNM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YzHVbCvG7VeymRWezjs4kjzGl030KZx+O3zfSDnb4EtAQEwFTLz4QM5J5nJFcejT6
	 2vl9trCryEtdMXk8ux1PYL8tf0FV4kEvCgUX3X1B9FA7TFBfUHvVsgPVOjYH883UmR
	 0uBB1lvJrE/dhRSZJYFrYEIPwzDizSXZo7WVHirfuVr24/d9+AlygRedSRoAnEFfpV
	 /sagTiQHwLrC65Ewi/8gxw76Nsl0ESSTVeakoJXIWh0aO5BKictg4ls4czt30f3xDC
	 SInPRi/SZWx1HIVZS8DRWUcJ58bsXKS8EJdhJkL2c4PbqA9+Euu1OTSWAH+wNkYtuP
	 nkGPZwgcmBlMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4209240982;
	Fri, 24 Apr 2026 21:43:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 91BA8194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 776A94022E
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PZ5eLKYgskSf for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 21:43:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A822D40073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A822D40073
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A822D40073
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 21:43:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id F016C5FFB7;
 Fri, 24 Apr 2026 23:42:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Apr 2026 23:42:57 +0200
MIME-Version: 1.0
Date: Fri, 24 Apr 2026 23:42:57 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260421183845.2456995-1-bernd@kuhls.net>
References: <20260421183845.2456995-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <6c1c20778b6378bf4c8c92481f9101a0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1777066979;
 bh=FN/OweDu6zAhzdBmUmUPZFow5rh1uKoeda0Hd9EnyRg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hSUrmYnQkGJiHgAK9UJSQjmpiqgK+8ZVUc4NiVZKpTkiSqlrCN7s6albXwjWZuYL2
 zCfD9crmLEnSVXjVTZxF7o6CRZOoZZOZUY/luHCjy2UgiwtqzaglHMDojNT5cIMZIo
 PY3bk44+j7PCcvYfz/hJLjO6rIPmFqmAz35Zw+zvg490VcS44JJ2PiX8juPZtpnBdi
 ctIBbKDUWpXwOsKatR6w6hwM+pd9dwMoqVkb2C67OvkmXcdOc46zzvNYPILQT6+KUb
 PJSPfVAlwR0OSJW4GIk0JaMQuiJFC1EAIMpe3Kc79MHkWrNZvI8/0WXEPPANKGCgZr
 iljh0qu7w3TSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hSUrmYnQ
Subject: Re: [Buildroot] [PATCH 1/3] package/davfs2: bump version to 1.7.3
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

On 21/04/2026 20:38, Bernd Kuhls wrote:
> https://github.com/alisarctl/davfs2/blob/rel-1-7-3/ChangeLog
> 
> Removed patch 0002 which is not needed anymore due to upstream removal
> of the neon version check:
> https://github.com/alisarctl/davfs2/commit/6b614bed3e814eb820a43a433c1f2c715c301f61
> 
> Upstream added musl support with this version:
> https://github.com/alisarctl/davfs2/commit/270607253e4cbfa40ff59fc67a850b252bf0b0fa
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
