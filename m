Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E970CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 17:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DADEB40C54;
	Wed,  8 Oct 2025 17:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGpreDIgvjeT; Wed,  8 Oct 2025 17:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96A1E40C44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96A1E40C44;
	Wed,  8 Oct 2025 17:10:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB85E226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 91CDD80F34
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 21pzf3ceomfs for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 17:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9DAD180D30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DAD180D30
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DAD180D30
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 17:10:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 304F32003CA;
 Wed,  8 Oct 2025 19:10:20 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Oct 2025 19:10:20 +0200
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 19:10:20 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251008151517.20205-1-bernd@kuhls.net>
References: <20251008151517.20205-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7757300abe13acfbefa5177a1ff95a11@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759943421;
 bh=AcTXUU1fxiOWId+n0z7FfNTbNNA6gPx3XkkjAnm5rhY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FpKSpGTr5tOtfYOIYZECtJHRvy1d5TfvwGZ/UwkEoNG4M4do7wok48aHXVZR9pVeP
 yFsirMMcEPDb9vl+alYstxeWpNzE/1lPGbtrx9hYETKCo185hZmDyLwRpXoeevXTah
 MrKXZzGLgwkX04VKmQGpO948GRO1VLK3nJVTjFT/fCeWACdNwWJVLi9ojbBr9h9yWL
 xsGednWxdcZCVBNQ9NuspphUkTUbrtvHdJFQYMo4v/GQI2ge8NHNyoCImbtyvn4G+D
 epDpKMk0Z+VTzCMGd4caEGakwvOd/c4Vja4xf+0Ywg9987fdUrNQ4ZW+2NZAeBTip7
 pV9oFWRJ8VNbg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FpKSpGTr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 6.{6, 12,
 16, 17}.x series
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

On 08/10/2025 17:15, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
