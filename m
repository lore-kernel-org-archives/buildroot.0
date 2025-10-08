Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A35FCAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 19:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 689A480DC4;
	Wed,  8 Oct 2025 19:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uLVNtMhNZ48; Wed,  8 Oct 2025 19:51:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A8DA81F1F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A8DA81F1F;
	Wed,  8 Oct 2025 19:51:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FC10226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81DA4402A9
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:51:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8ETOhpOVkiM for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 19:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 37A8140C6A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37A8140C6A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 37A8140C6A
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:51:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0865619F5B2;
 Wed,  8 Oct 2025 21:51:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Oct 2025 21:51:18 +0200
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 21:51:18 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251008151448.20137-1-bernd@kuhls.net>
References: <20251008151448.20137-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d26751ef8a94dd0c9acebe8c054b4163@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759953080;
 bh=pEFpglYToL+G8yAMsb8lOIPQ71YnmjjJ/Xf6aVWrNmg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ca2UCMvcDL/YomSWis1af6nFacNe7E6R5jsEHJUncf/HGKOCfSk7LkuZ+vVjjzF98
 5BxmdbsZARHh0ADdUJQzep4sWLnT+PMRNVDoh7YtF89ogWoBzuOqdvDKCUgCD1J8oU
 pue03JAghMMraXJapWW//oD5pgNz09C5d54cWjiGUySEu41ypZCiKx54adzNZyo3kO
 6XTOEZgTGCtnnJ2ZM1UxkE+pqbom4d8KFyHuRQus+rLMCxnsVSnGLpvB8yDMh0+56e
 eJUGIkj7DZYyoTANQMSgm9QbyIktgmSjgTwaiIx7oXKQyRivrK7wXcu7/Rot0y7UiG
 KgZ/qSp/GUT/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ca2UCMvc
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: bump version to 1.5.0
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

Hi Bernd,

Thank you for the patch.

On 08/10/2025 17:14, Bernd Kuhls wrote:
> Release notes: https://blog.clamav.net/2025/10/clamav-150-released.html

This new version introduces build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2088905409

For reference, the current version v1.4.3 is building fine. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2088936819

Could you have a look please?

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
