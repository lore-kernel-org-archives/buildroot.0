Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4DAD3CC86
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 22:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DDB383BD1;
	Wed, 14 Jan 2026 22:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TUNtQMMRO60w; Wed, 14 Jan 2026 22:26:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 185D6811C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768429568;
	bh=RDinUicz0YF2rQmkzCPuA18nEC/gBlu4s5DN/fdwvGg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z/fu6GYXLUteuUztZkDcHDQ63/J43UMPtuS0sNLV1utSK5XaT5gtd+IFXbK2cRybq
	 MPmezxGbFAIE33X/l1OvFiX2ky5F1qWBZKU+ieyFOreXtlkauHDZufDulcQDqaS9TC
	 BdMarQi2lRIgB+1IDRmkNGWZ0Efu6LqWbFvBwzX4vEbYBS7D9/GQbJd2UC5UgRJGDp
	 jaNtSVY7MDfUJcWw6yHspKdp2ZMIubvUVvEqAIBc7Y8g7yUJs1coCvuW4NPSBy5y1l
	 y93pBfqVC9YkOEQVLXzui2x+L0etwG5ZXFA3u9q3vFHIJ214LiyLeA7kRj1R8V5qda
	 meVyeBhaezO6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 185D6811C4;
	Wed, 14 Jan 2026 22:26:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EEB41C3
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 22:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F8A2401E1
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 22:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2E3NkX4hbWKi for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 22:26:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 615F640250
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 615F640250
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 615F640250
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 22:26:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7C6835FFAF;
 Wed, 14 Jan 2026 23:26:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 14 Jan 2026 23:25:59 +0100
MIME-Version: 1.0
Date: Wed, 14 Jan 2026 23:25:59 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aWfSSZEdw71k0XrO@waldemar-brodkorb.de>
References: <aWfSSZEdw71k0XrO@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.12
Message-ID: <ca11a151af9b22d4aa1d3f516c7c78b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1768429561;
 bh=h/6ExuhHEIZkvlUrWC6XL4Dr61VMGfzvaG45mkncbLY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pLlMmixT1+oJam5dOKRF8RV6M2qs6csH1X8ktllrVblzcsftlL6hgJ8kmf4ICiuRX
 qVBoIM7uhOIYeKvSSTUIsl9/tpqujzwkgj14ISsCAsStIiTDJ2ZrhxXd2ITwwLF2IO
 XA2MShe7EdJdQmi2lceGcbMDM9OBeJwmGRT7vd71pp6BJtqCKEMuKOfAPyud5uE4XJ
 L3w9dAdZtC3EE0a6uCkshQFcJABk62qPD81Jj7XIoV+qRaZURgMLh3Dv68ylAAFiGS
 p+gjSvBbIOJPxikEnKBKx35bUeEYYd/JZRq2lEmxjhFpG8/2W2T3mTzqPctf4TNZKo
 LCpIkk5V3CLWQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pLlMmixT
Subject: Re: [Buildroot] [PATCH] package/ruby: bump to 4.0.0
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

On 14/01/2026 18:28, Waldemar Brodkorb wrote:
> See here for a Changelog:
> https://www.ruby-lang.org/en/news/2025/12/25/ruby-4-0-0-released
> 
> License files were updated. Apache and Boost License were added.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
