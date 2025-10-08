Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F74CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  8 Oct 2025 19:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7900880D41;
	Wed,  8 Oct 2025 19:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LZgaDszuvrmx; Wed,  8 Oct 2025 19:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2412F80D46
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2412F80D46;
	Wed,  8 Oct 2025 19:22:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0D71226
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E2374403B8
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4gazsjhyUMpz for <buildroot@buildroot.org>;
 Wed,  8 Oct 2025 19:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C326F40360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C326F40360
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C326F40360
 for <buildroot@buildroot.org>; Wed,  8 Oct 2025 19:22:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2C622780331;
 Wed,  8 Oct 2025 21:22:19 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Oct 2025 21:22:19 +0200
MIME-Version: 1.0
Date: Wed, 08 Oct 2025 21:22:19 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251006083326.889345-1-aperez@igalia.com>
References: <20251006083326.889345-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <90e0faee5b156ddea22fbe215a9d41d8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759951340;
 bh=HloYTOpGSJMNRPplFROcM5W9IM2gvWueuR4AE9TVveo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R+MxHG3p5vaqPzalWlfH1z82xVcE5iczXdCVsNncYSD8dGXmS965WJIk2xDYLonbf
 KznLJ/BT7WNI70jVkY5LGYxBLEmKNe6vpnh2ykCAavuLJ9h3N1FlvRpSFwNH9B+7/9
 LngGpApzFkOtCOzO9iTpb6Vi+TY3QA6InURf7FC2KTqg6bETa6hPP4SnsE37T6vlul
 1RkLcHSGJ6XPFTqCZLyTdwZNW29bkUq6nlfPWhU/ZwkQa2NJ5UeYP4wZO/V035F7Rf
 n9ao6XGtHhOjSbcHdTpfDkmevqAQnFdL6HRanryPblFLipPyoWz2G350iTU0sI16RN
 gGvMBpNTi2Evg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=R+MxHG3p
Subject: Re: [Buildroot] [PATCH] package/libwpe: bump to version 1.16.3
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

On 06/10/2025 10:33, Adrian Perez de Castro wrote:
> The main fix is being able to compile with CMake 4.x.
> 
> Release notes:
> https://wpewebkit.org/release/libwpe-1.16.3.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
