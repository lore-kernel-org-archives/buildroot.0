Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264E5E7718B
	for <buildroot@archiver.kernel.org>; Sun, 29 Dec 2024 12:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C71F74053D;
	Sun, 29 Dec 2024 12:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzBjWDAmc9Mp; Sun, 29 Dec 2024 12:01:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B291A404CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B291A404CC;
	Sun, 29 Dec 2024 12:01:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F4B7C8
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 406DF80DB5
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DgzebBUxYoUf for <buildroot@buildroot.org>;
 Sun, 29 Dec 2024 12:01:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DB69B80D9C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB69B80D9C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DB69B80D9C
 for <buildroot@buildroot.org>; Sun, 29 Dec 2024 12:01:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 66269B00592;
 Sun, 29 Dec 2024 13:01:11 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:50294])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 29 Dec 2024 13:01:11 +0100
MIME-Version: 1.0
Date: Sun, 29 Dec 2024 13:01:11 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241228200754.4012273-1-thomas.petazzoni@bootlin.com>
References: <20241228200754.4012273-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dd4594c37ac7158e85f68e3db1c6a31f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735473672;
 bh=BDOj5I5r4IVL3mbqLon2e+QhT/t5qtM8mstyJLjB53w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HSqD4YXNECbNczO1BHJiSShORc30tsy0CTfdmWxeQVxJUFWSZ4DUha0ilwjnFplcg
 3dQGO/ryM8AS257cGUECpWzpIPtZfwlxcmZmhbwGEUjTt+yKX/k8HKvFgZ6kfh853+
 KrwMoDGxVQKl62HxsoB5LRkobR3w5g0eoio0rbhqBpQ8IHxmT97hqlzubsXfWS/o6n
 NEsy2RrvlGprMt++fJ4qBT88+oQUDIi5CQdDz4lXtLtM4elqVKM0jd+eo0sfUeVyVF
 LVyV1EgZYr3ns5cFaQFIpNfHhaHZmflDjFVSMrNjB6QLHPXcT0fxyg5vkut39YzHzu
 379dcxjdGVlAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HSqD4YXN
Subject: Re: [Buildroot] [PATCH 1/4] package/wayland: bump to version 1.23.1
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

On 28/12/2024 21:07, Thomas Petazzoni via buildroot wrote:
> From
> https://lists.freedesktop.org/archives/wayland-devel/2024-August/043760.html:
> 
> This is a bugfix release for Wayland 1.23.
> 
> Joaquim Monteiro (1):
>       meson: Fix use of install_data() without specifying install_dir
> 
> Kirill Primak (1):
>       Put WL_DEPRECATED in front of the function declarations
> 
> Sebastian Wick (1):
>       client: Handle proxies with no queue
> 
> Simon Ser (4):
>       scanner: extract validator function emission to helper function
>       scanner: fix validator for bitfields
>       tests: add enum bitfield test
>       build: bump version to 1.23.1 for the bugfix release
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
