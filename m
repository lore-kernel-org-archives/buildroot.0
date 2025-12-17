Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AF0D66BA7
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 20:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F2BA80A75;
	Wed, 17 Dec 2025 20:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwIJ35pXJQ85; Wed, 17 Dec 2025 20:46:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF60580A66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766004366;
	bh=wAAW4P9qUexthapSgbk9Apd6rZ5lM7sF7iyOwtZ8kVo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cNJg8G89L/QC9fAWb3pZooPhTzKg4bFAUs0Yo8L8ZPSJUtsAiTNmGproDcnLXhP2M
	 AKWV2rbUM41++cxckTGv/MbbvSBC0BkEHRpl94ZYtRpkMtYFVcNTAS5usVNXa46Um8
	 Mk3wIXdwcF45U+xGFOsdJaPOC+NzFcrW1kE8utQbOCI4EBR2MZCVVZgxeADtMV1PHx
	 D2TQKWosrVLXlwvYP/hoZIvi45dCpvRzPTJflGGPdgOpeBZhlK1xtEleCcH1kLv6zw
	 6i/h/Yu1lop8pVSvjk/yAgtjCflXC0oW44FNrI0IEFc6/ubuKfFELjCGZMZI7N9Syv
	 EzdnRvmAm9+fQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF60580A66;
	Wed, 17 Dec 2025 20:46:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C29F0375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A791760886
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZcsGNEkg3ht3 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 20:46:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 506C360889
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 506C360889
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 506C360889
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 20:46:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 1AD02B00571;
 Wed, 17 Dec 2025 21:45:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Dec 2025 21:45:59 +0100
MIME-Version: 1.0
Date: Wed, 17 Dec 2025 21:45:59 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251216195002.3031273-1-bernd@kuhls.net>
References: <20251216195002.3031273-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <2aea3379ede0b00d62e8b00ea2db1c5d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766004361;
 bh=7G+7MlvFMr1GsVZ1SlMac8w1sLKx839Iue5ExE9DtXY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PdJxHB86vq4tEJo/EYVR1PuLL6tIsSatVJ3R9iHXT5xjvxN023YnZ5NB93zWyKfPD
 O4KMtm1yfF5qpviz6wYDfXQfjigNNgJweDrhcQzFgmQcWG4LbubYy8coJmZb5QdDMd
 07ouqzW8C+oPfHY4gyfPm5DUQsN2Vn6AWjKLAwJgabru0s88kHLPH2Co/rA1q9Sr3q
 DTrySv/M2wyv4wB98OaPFRtuZYIMYdrw5s0IIMVRX4JyQHaIkBbHxELftJfeD8dt3K
 Q+dWflnZO6t5EA3CaQfwPQAvuzHANXj3BM92Lf4W8aBGKxyMtiP8jV3xlXeRvcD7rk
 p9js4Y+JZIDLw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PdJxHB86
Subject: Re: [Buildroot] [PATCH 1/2] package/python-aiodns: bump version to
 3.6.1
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

On 16/12/2025 20:50, Bernd Kuhls wrote:
> https://github.com/aio-libs/aiodns/releases/tag/v3.6.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
