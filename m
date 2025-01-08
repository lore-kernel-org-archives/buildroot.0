Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D267E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 380A680C19;
	Wed,  8 Jan 2025 22:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q85pzSU0DuBV; Wed,  8 Jan 2025 22:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 571F680C1C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 571F680C1C;
	Wed,  8 Jan 2025 22:58:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC7FC7AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:58:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABB0A40159
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrhyXZ17__HL for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:58:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B0AD400C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B0AD400C1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B0AD400C1
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:58:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id E2EEF13F880;
 Wed,  8 Jan 2025 23:58:40 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59862])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 08 Jan 2025 23:58:40 +0100
MIME-Version: 1.0
Date: Wed, 08 Jan 2025 23:58:40 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250108213411.2091627-1-thomas.petazzoni@bootlin.com>
References: <20250108213411.2091627-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dc3f5a8aef828568aa9894f51a21210e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736377122;
 bh=LmKexaUwvy7OLwYH85sWD6RReW2a0ZvjnbhGo9bqK9g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W3v45TZKtcMMrfglfQx7Ees0qxMPCEFdw1QFRMeM6mmrlWsqpICVzC5tBPiOXnD+7
 uCq0ALre77fPf7JYN1jllPx6ABuPmd6y78QUi2S/8jjBCb+/59BWLgT99V+kiX2G5m
 Fpvu7UrYmbJRCtvxxBoQXJL9uoZXO14BDg1y4F+rXoKiW5BHx7ggkgz4mv3wrZ4dEn
 YmB1m9fk9aAkMeJy0fJQSSbN2wnVrHknWePrND1xQThJsnwcJr7urEj6cimxUnOWec
 bD7yc5ekVdAeObS6FzOo8oFD5uNx/mxQroHU2ftaWAZexuhovy+vmguXxC/cI/dhnc
 7xhc4fM4mpfvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=W3v45TZK
Subject: Re: [Buildroot] [PATCH 1/3] package/linux-pam: backport upstream
 patch to fix build issue
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

On 08/01/2025 22:34, Thomas Petazzoni via buildroot wrote:
> We are seeing build issues with linux-pam in the autobuilders such as:
> 
> md5_crypt.c: In function 'Goodcrypt_md5':
> md5_crypt.c:145:13: error: implicit declaration of function 'asprintf'; 
> did you mean 'vsprintf'? [-Wimplicit-function-declaration]
>   145 |         if (asprintf(&passwd, "%s%.*s$%s", magic, sl, sp, buf) 
> < 0)
>       |             ^~~~~~~~
>       |             vsprintf
> 
> This is due to the fact that <stdio.h> gets included without
> _GNU_SOURCE being defined, and so the prototype of asprintf() is not
> accessible, at least with uclibc-ng.
> 
> The _GNU_SOURCE definition is properly in linux-pam's config.h, but
> config.h doesn't get properly included first everywhere. This issue
> has been fixed upstream in the mean time, so we simply backport the
> upstream patch.
> 
> Fixes:
> 
>   
> http://autobuild.buildroot.net/results/49b190b3fbae3cdca4c7a08b3ab5100a937ede9e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
