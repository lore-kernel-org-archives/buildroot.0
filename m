Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AA8C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 237B040A37;
	Fri, 10 Jul 2026 16:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FdqdMdMs2hg; Fri, 10 Jul 2026 16:55:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 355CE409FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783702510;
	bh=ecHu07l3cY2JsU3mIcGhkOMWTRX74OAOJkhgZxgyM9w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jLkTgmZbG+JUSlqepTEn4ndhBwTWafGvxdPe4BGfxr2ZM9JdLGEhBOlX7rSR9WOAV
	 JZgQlkKX58yz5U5NYNp1TNiag+ewE5AlFJHSepMgYKiN4WmZopAqYhxIGjPZmtB4rR
	 S0nYopbrj3J63G0rhGjI1gI1HxxbmZJ7F6PzyM17XUl52YsgdVxjCXTMI9aiKGiidI
	 dOJ1pdYJ365r39ocqp7PvAIY2fPH5rbEj89oi0kp21JOZnZdooFBmGKw0LVNUk5Mse
	 Cwqo1dQj588hODXFZJX23WIgSMUq7AW+ySabzLwkwQDUKgSut5G9o3DZ0h/1jhiyk3
	 FMA0dwow9i+sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 355CE409FF;
	Fri, 10 Jul 2026 16:55:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 197902FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F407740362
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwjY74XIOnpN for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:55:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2CE6F4033D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CE6F4033D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CE6F4033D
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:55:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 2907E2003C3;
 Fri, 10 Jul 2026 18:55:02 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 18:55:02 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 18:55:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Alexander Clouter <alex+buildroot@digriz.org.uk>
In-Reply-To: <20260709191738.408892-1-bernd@kuhls.net>
References: <20260709191738.408892-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <9af16bfde7f7a6f32feff5ef1c0e25ba@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783702504;
 bh=+btu15J8Twn0mli55ZYCMJP0+Ce2AdkSBhpgEowNNlA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ALt7PELMXOJAgBBhUKDfJIcstRNUGDXZZLZmLlKdbyrR7qYhOWyutHR5RHGLQ6PEe
 Tuth2VJRsmOBLv3Bs75Xe4eA4qEyoHtEDc7MX+7E4aX5oKsxu3MeWP06fhLoafK3zM
 e14N4sxdws+1FXj95Va+8Rb+4peae8OvKF9qyhujwv56jAdX1CYeYPU4uldwE9Bms5
 6n77C8qD1iQGKYyNNDN7rHSXcOF2xLaBJQqJRcIG20PzLmgZeLUqTELq++Uj4LUDfz
 YBQtzdYtbhjSmgZbMqjzDMT58E22bajMMxgncxruk3xDgpMbaXPulAWh9Q3iHXQ35J
 44EUqx8BQl6iA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ALt7PELM
Subject: Re: [Buildroot] [PATCH 1/1] package/odhcp6c: bump version to git
 10a52220ae
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

On 09/07/2026 21:17, Bernd Kuhls wrote:
> https://github.com/openwrt/odhcp6c/compare/f19dd37fb467c9cf10cad57aefa0d048312d7dfd...10a52220aec9d45803518d8cc4d63e552484ed61
> 
> Removed patches which are included in this release.
> 
> Please note that upstream committed
> https://git.openwrt.org/project/odhcp6c/commit/?id=10a52220aec9d45803518d8cc4d63e552484ed61
> instead of patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
