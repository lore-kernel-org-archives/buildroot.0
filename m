Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43AE8CA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 14:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 465EB40557;
	Tue,  6 Oct 2026 14:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D7O7QIh-Psy1; Tue,  6 Oct 2026 14:30:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 36F5540659
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791297030;
	b=qiduAsxE6GokoaQgOZFD6W8WWgxKIFxkSANaKWq6cZqcRn2g1u6FcoLJ163H+YV+Enos
	 IMs0Ylmkf4XDon59hVdMeSAs7oVQzH1g0xCEyUKPPzJFDBuNgqBl3W7oQdahDJl8C0BuV
	 bqZLayh60QKF/UFd1qAocv/wI/HRQUMcvPZjDWoQt9A9C4gsLjvZTpB+Lq8WPZfHQxB3c
	 r8nVa/SAjEShhOd7nxy8eKrurcnAoBU2XnbDWHj0UZlgbzZQBWi0ipn7+/pk5fjUQF2ZY
	 Jw/NBIFI5erQ+C4i2u5gwUwfRTD4oHqQww5I2baQ/7lc79WZF+wOa7IjScf8ALq6sVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791297030;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=qchfnfzEyQk7NQ+ED3P/Jk7Vi+QSId3HYVyVi2C+g7c=;
	b=J3gaKaue6R3AB6tVzXYvfDccpAzfO+wSD5/W40kKb8MJxRdiRAejSOEYkwc2iKpWLKFG
	 6+e+9rgvcWxIsvmWiQBalAVd5HR9+dPBRLVWGTjKYYRb9LxdZODuwQzJK5Tq2ZWi/YuzI
	 wSDnNdOkTu+nhnQDDW6+DgFeFrX3Uax19L4LC7NyqyU7GLia2yhbcY0BE0eofvjIu/x4E
	 zh4TYhFOspigOpPgkAMfSsU5XSygPKAjUmLGbAP0yHsQ4ZjimeF45cVcFxRWzvgoV0JRr
	 +nur34zLIRFksQZ7qsGIe/nVrb92M8LkEkLjd0p6KrMT1WVAf+L/a10gL2MRmJQjTqg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791297030;
	bh=qchfnfzEyQk7NQ+ED3P/Jk7Vi+QSId3HYVyVi2C+g7c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l1yU1fGiTgCiBDfUvpMMLkTJtEKgbGWdkvldoGEUALluuomjsOxM0oTmEsb2eY+zc
	 IpJS9djO6noax2R+xQ4ER13aufirzzVCl76vYAQSYnHSWMCPc4mEFmDeiOOrZPEU11
	 h3IXK75S6Y+IOLpIJsQ056DZIl0yVicC+UJk7ErGu1RMEPw7QkcC247BSMcqDM9lKa
	 064lWek1x2ZN9iz5qY84NEeZQUBx1jp7KQdO4qLwfjmqrqZE+I/UVk7k3AqdHC81P0
	 HkpFmdI7set9wtYD2dSRMexkdEXVX3nhuEYhHaqdRSLELniZM0jvr0IU8IfpCKqbw/
	 0ootDfi++hWjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36F5540659;
	Tue,  6 Oct 2026 14:30:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 960CC317
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C083607D8
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnnTOC3jPajS for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 14:20:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 15D0A607CA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791296451;
 b=bxM3Cf2FiHhu0ETPALRxFRYBWEXJSI9jKbVvRjWAAFasbd5EV8Anx/Tv7kEh0FNVZamu
 4/37sjSpykCAlxooK3gHVkGwIDqJJ8M2YCLzZ4ZUrYzwWP9yTbcGfexxf26C/B0krg1wL
 RTpK12DYfPdONxA+y4hdLbU+blqb8KvKB1qu6/i1ZZR7CO79XUbuN6CNoxzHdGxIzLn4m
 XwPWYCImKFGabpyjY+ebQi2ODJ3x9+OK6nOdKP3+V4yTVn2hCSXPRy1ZcnLX13rlsP5Ly
 lezY2uggJuVD6DUvpwEfegDvWKkFqIJzEzYr2+pbWMmQanttYBK1lYkzypkpgEUtI0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791296451;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=qW5bgGRIVG5q24O6RRyHKPd4oF2UgAnFGpCbm3ZGfiQ=;
 b=UepcGSbIqcgdwN+E+3xfyGjmH+pBJCKjsf8MrUMj45Uft+Sz27H7j/HNXs6bRV14E2R9
 BCvLtCZr2IDZy7JzaamkrKDGebi64JqijT9ySPxv8JRKv/vcj6Wkszov223Hl13FSBAVH
 Y36pdrFnZtUL065Rc24Q9myl4hhMaOERPp20cBiOuQK2B4H7A6+Q9RyBk7iNeAYl5fGQk
 MWpBkT6VhRIadla39rAIbU5eNCkUYy5ubQMUkHz4wTPzbC8/Dhm73AfmzAG+44EfZ15N7
 45p1iiIAIA2iiDOuJ4yrwEW3TyT+XRrUS9wyhp9qR73qU9zT2/WUYXzFmccPWQKgh7A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hZsDzZWj; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15D0A607CA
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 14:20:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id AFEC560128;
 Tue,  6 Oct 2026 16:20:46 +0200 (CEST)
Received: from 199.151.230.94.awnet.cz ([94.230.151.199:37496])
 via 199.151.230.94.awnet.cz ([94.230.151.199]) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 Oct 2026 16:20:46 +0200
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 16:20:46 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20261004181326.1944737-1-bernd@kuhls.net>
References: <20261004181326.1944737-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <1598ccd35ed4ab19e57a09f96a949ea9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/gerbera: bump version to 3.3.0
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

On 04/10/2026 20:13, Bernd Kuhls wrote:
> https://github.com/gerbera/gerbera/blob/v3.3.0/ReleaseNotes.md
> 
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
