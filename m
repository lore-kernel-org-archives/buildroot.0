Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BA5CFA45E
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 19:04:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEFCB406E0;
	Wed, 23 Oct 2024 19:04:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTiJmRe-Qqf5; Wed, 23 Oct 2024 19:04:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99646406E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99646406E2;
	Wed, 23 Oct 2024 19:04:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B9A327F2
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A86F81224
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UPpCXGiyd2nT for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 19:04:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C91C81223
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C91C81223
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C91C81223
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 19:04:31 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 133DC2003C3;
 Wed, 23 Oct 2024 21:04:27 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:33722])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 23 Oct 2024 21:04:27 +0200
MIME-Version: 1.0
Date: Wed, 23 Oct 2024 21:04:27 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <172923728286.532453.7342561185071865247@ping.linuxembedded.co.uk>
References: <20241007192950.448350-1-ju.o@free.fr>
 <172838727715.532453.9966379310142996785@ping.linuxembedded.co.uk>
 <172923728286.532453.7342561185071865247@ping.linuxembedded.co.uk>
User-Agent: Webmail Free/1.6.9
Message-ID: <42501054a1cc779dce7c7222c521b4f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1729710270;
 bh=bGq80r2W6QGnsbzPUxXLABIOAO92kHv0kZhqvyiWX+U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BFlvchsK3LFaow+3XFAXjBoPZcRmU5savvOjy+pXEJOJO67D5W+pNfiMwjfnkxuIj
 qsh4QpoA6bWtHTadyV5bgkmVus+U0lm4+pi1snU0mgDNbufNplXpNCN0b200f1xO/D
 ITAuozgk03XVKjyKn1WM1i6y5zTArtam/v+T9KYlyd3Y57u1oopNqTCir1XbObaqnn
 4X48FihA/zbrM+6nj+er7/QEXnkWyiQyQIssj5TdFu5gjNdUG0QBax4/0Bfn3SmIgu
 VuWrTVzepESRfb+KaPx/Vtegv2uBce2TdBfNpJbS4m74BCSuO0NQtnBZX5/dmlUHIz
 bl8Y1+YlGBH3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BFlvchsK
Subject: Re: [Buildroot] [PATCH 1/1] package/libcamera: bump to version 0.3.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kieran,

On 18/10/2024 09:41, Kieran Bingham wrote:
> Quoting Kieran Bingham (2024-10-08 12:34:37)
>> Quoting Julien Olivain (2024-10-07 20:29:50)
>> > For change log since 0.3.0, see:
>> > https://git.libcamera.org/libcamera/libcamera.git/tag/?h=v0.3.2
>> > https://git.libcamera.org/libcamera/libcamera.git/tag/?h=v0.3.1
>> >
>> > Signed-off-by: Julien Olivain <ju.o@free.fr>
>> 
>> 
>> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Is there anything more I need to do to help this patch from Julien get 
> merged?

I applied this patch to master.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
