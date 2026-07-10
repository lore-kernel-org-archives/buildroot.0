Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93607C44501
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6454040AC2;
	Fri, 10 Jul 2026 20:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K3edfHV1JTt1; Fri, 10 Jul 2026 20:48:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 776A740AAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783716531;
	bh=mrJtDCWGrQ5pacazxU1nsHN9ferQR/LqTtxqX5RGo5c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YIfhSJqpH/fZwnjbAIK/ZkgHzcBT7IS8+dpReouDcHNmDpYZxoKr7UYGo2L9PNQUJ
	 oc18tHimqoDWuiDTFR1lMraFOnBygJdxSFSK8eLToHbvl7E+SviGRYXGS5UoBllmde
	 kG9v34U/t6SqtBn4nSJ/dlkFZraDfWalNeQdvk0ibqlMPe4h4aPAuP3LS8qNYFbp24
	 GQMaCrpdMLvrnRQ52njD4SGgsh0wLmzcgHJBUPqlfiHNSEbGZYF5LnMtK9rat8y/Sa
	 EqvJyuOwqmm0kUe9uXoD4Pg6qSDYUucgFGrVDxAu4mHK9no+18KoNJF6XM8q6IgTHp
	 eTG+FFJ45RIuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776A740AAC;
	Fri, 10 Jul 2026 20:48:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D112372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12C7B810F0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xbyQzT43X347 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:48:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 43DDA810EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43DDA810EF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43DDA810EF
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:48:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 37A585FFC0;
 Fri, 10 Jul 2026 22:48:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 22:48:45 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 22:48:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260704085239.2901837-1-bernd@kuhls.net>
References: <20260704085239.2901837-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <3da4a52ba48013a59f9dc82e3f8b9d63@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783716526;
 bh=FJyCBeKD9ZjwfNk8X1XblManDPx5NthYs1jrJfdrhGQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Cz8hdFtkiaTFApKi/1VvofrEdcpIEnNw8OC7dhtrULDFfbLtGfOJ/L5SgEhnqr46T
 Ad9CPyKbjUtROy0WCoNzplzRH+ZFUvruU5Goz1pnsPDyFd0KP9xBMpxY1XGjWKOybQ
 l2e3NK9klERA/+YIhgdy5sZiwObTluaXuzpqFNkMF9bUEJ7doO7XIkJ50BkT1MWc0e
 uyHfVxNtrbhRaajV1Is+F3fnnFCQroa1N8HGfNFqD+liFesCMPHoeymgIYnLcGSyha
 YJox4uM7y1OXJZnZPIA/ijhuUehyMP/iCTZSXArUfExDKwt5fute6PhraJSdxDOAyr
 qT7KWB+PttVfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Cz8hdFtk
Subject: Re: [Buildroot] [PATCH 1/2] package/samba4: fix build on m68k
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

On 04/07/2026 10:52, Bernd Kuhls wrote:
> samba4 uses very big switch statements, which causes the build to fail
> on m68k, because the offsets there are only 16-bit.
> 
> We fix that by using -mlong-jump-table-offsets on m68k to use 32-bit
> offsets for switch statements, but this is only available starting with
> gcc 7 [0] [1].
> 
> Only one package selects samba4, mpd, but it already depends on gcc
>> = 12. As such, we do not need to propagate that new dependency.
> 
> Fixes:
> https://autobuild.buildroot.net/results/b60/b606da691bb462879d4f9769928b5a40b9170837/
> 
> [0] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c15
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57583#c16
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
