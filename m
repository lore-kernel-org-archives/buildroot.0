Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75046E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 478E260E9C;
	Fri,  3 Apr 2026 17:35:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GyWQ29ISNak2; Fri,  3 Apr 2026 17:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E39D60E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237723;
	bh=CVWh8diZ+L8zVEsYQmWFsCFToW2wJAMshXZmIdbxFNA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Zrz7he2raRYs37crV4SpuIiMtPgPcvDP1XwrgznePZICEHgX3CzuH60Lz/nQIZojl
	 YDavF7r3T7W1l9F6K7+snX2+uc7VA3KTcJUPZrnO4MN1479FHJ8scxxXTAWArf8TJ8
	 Ph1rsoH+TkFvyaHBmVNskM4ikAn+NbdstnjSa67kX9nVv67GQlCXRqUw0hxxyCD4Ky
	 6SScPGpySscFe95JzfZW1OF4+wn4VA2N/jhecptKIWjj+MFlEIcSfzgGsqU1v/GTV+
	 Y6y4JGVoqiGt6B5mLRw6YABsCDYlOHVP/u4UdfwQ3AMJbTSlSCCwJsPwDb+cJwqW75
	 7wYxH14xStTlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E39D60E69;
	Fri,  3 Apr 2026 17:35:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75B462CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B9F740226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:35:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suUFIHpm0JMk for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:35:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8BB0140202
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB0140202
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BB0140202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:35:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 5F240780517;
 Fri,  3 Apr 2026 19:35:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Apr 2026 19:35:17 +0200
MIME-Version: 1.0
Date: Fri, 03 Apr 2026 19:35:17 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Simon Dawson <spdawson@gmail.com>
In-Reply-To: <20260402175948.2779682-1-bernd@kuhls.net>
References: <20260402175948.2779682-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <2eb043e1a75c01046011eaab156024a5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775237719;
 bh=2GYGE4ye7xVde1+vUrV+ctlAD5h7+I7JX+BGTx51f30=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uHfEsvfpgedEPPNxFrUZ8YtS6feNXaI99em0qPp5ks2SKSgo/77kS3+zz7aH91cqK
 Khmimz5FuPFJMjkD/e5MotFImvXKteY52iZRL2YYwNogKmELtVO/vOym+gNMDEJv/G
 GmbIzXQvsohV4MNouhoDN7p0hDGQRTjOIjy7KAsBFuywlUK7eGTioYQKXUDEnPysrQ
 ef28wSICZqcgNMFyxXqNDra2cYnY8GkZCnjPYIXsfOKEbMODMI1whIZDvePWiEodhB
 GhckTyJt8ZVqoW4zFZa3bEpPPhKsfxkaVyrrSAnSkj4m0p8HvM4p9gGgRplquLl6KL
 zbKRdB2HOVNgw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uHfEsvfp
Subject: Re: [Buildroot] [PATCH 1/1] package/jansson: bump to version 2.15.0
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

On 02/04/2026 19:59, Bernd Kuhls wrote:
> https://github.com/akheron/jansson/blob/v2.15.0/CHANGES
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Updated license hash due to upstream commit:
> https://github.com/akheron/jansson/commit/2297a2e320ebecc6dc98f7034a2f38509ad1d7f5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
