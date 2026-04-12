Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80848E937EB
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 16:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5495B8456D;
	Sun, 12 Apr 2026 16:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gY_TVaH1Bt6d; Sun, 12 Apr 2026 16:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B7D084566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776009696;
	bh=e1YJVzQPUmmfHVvGnU0aSZrjD1zAnxGqV0KgJrFAlYo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ig6WLozmZdSzLUJw4p42/nutinhaNx3bttSUEzBs+JXvxp5AItzTcKExdKhq1061D
	 KqpKM7NDJVV5tT8me2szui6p9An0p5JO+/nRalx9hlMhiNJYfls6EeOO/PHOhFoxdS
	 M6nqa5kpuhJP9DaK6VJXocEhAEml1/4BLo+d2BglBZJHSt1YLaGTN4h4PkMe6xGsCO
	 sGJqyFjClF5H4WNeVA3oxjARuc2oGsf/ih/9XJoxNvGf7tXOZOZhO6540STCrpXMUZ
	 5l27AyTGEIELdQZIakOc2ZV0KpKZTTVe7e2PoXuT7fQLVapyICI1yXWUGOJhPZvqAY
	 C42ZcdKlTBPQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B7D084566;
	Sun, 12 Apr 2026 16:01:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08F38237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3533422D8
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HvqXqOzmHLvN for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 16:01:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7A6F422D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7A6F422D3
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7A6F422D3
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:01:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 83CB860137;
 Sun, 12 Apr 2026 18:01:27 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 18:01:27 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 18:01:27 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Michael Trimarchi
 <michael@amarulasolutions.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20260410162639.1447900-1-dario.binacchi@amarulasolutions.com>
References: <20260410162639.1447900-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <46035949587f893cdfa2188daf202908@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776009690;
 bh=C9pZBTJ4pZv0MtNu215Y3MQo8i51KugDla9OJ8JTw6g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W046UKoME+DbGLwvNZc0ueeiU8UebU3wR3Vk6Jrn2B/6j3/zT9kzQPOXeg75P7uT/
 kJd/khQd1kbSlAn13Z4cspTrvmZUshgD7MtIgUgffGxZ/1qQkjxntb/kpA+pVGW41s
 wcXM90tknZLGrOzs5qjesZA4sgO0RIp6aOpl/65Xw64CzD4q5usgnHEypIeQsve+1q
 sk09ihrrKnrK5ZynhvA/PQgZRQCBcGHjpNsOFiQLmKXoS2A4+CV3+A9VxUTvt1bsBn
 t9yVjM9VbSrDkAjyVXIqPAayxq6bvvUq5M/BX60CO4mKCUw9CztCYuW8nFhDHGpHy4
 eHGL3Cz+5gt+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W046UKoM
Subject: Re: [Buildroot] [PATCH 1/1] configs/imx8mn_bsh_smm_s2[_pro]: bump
 Linux to 6.12.80 and U-Boot to 2026.04
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

On 10/04/2026 18:26, Dario Binacchi wrote:
> The patch bumps the Linux kernel to version 6.12.80 and U-Boot to
> version 2026.04.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Could you consider updating those defconfigs to use Bootlin
external stable glibc toolchain please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
