Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C80FFEE4F2
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 16:23:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E678660EC4;
	Sat, 28 Feb 2026 16:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h29AH3Da-Cr6; Sat, 28 Feb 2026 16:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61C4B60E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772295784;
	bh=BegoT4FfkQDk0YrBj1PlDXdQ+pa69+doS4UFw9yx9PI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OVvVNlNqomTPnCcT2lNHirVSLdRPqnG/6OdYq1FPpUqy65Ygg9V/QZv9d8ILuG+Fw
	 HoaUkt3d9N6oF97cVnhznXczkL2vfxlVfxicyj0egICMJ5V+3/qA+T01VjUd9ITmuO
	 LTi8kbXN4ejawTdaa9UdExb29GysFDaZFH+raH/bwp5jFvEzNMZBgbHkQ1FHTDSRDK
	 YNivR6+ydGycDCZn3Iaf0FB4Iv8hu23EHrkaZUwQyLcKGVg0qrCGEAi99BIKb6e+v8
	 sRzT0uS1FS+FkibTyC09U29hUO/xIx7XK5v3mK5d0mnCJO6Lr2Rzmivk4vA5fLMjRE
	 wy82DspV5S09A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61C4B60E9D;
	Sat, 28 Feb 2026 16:23:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7699524E
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C9EE40317
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jW1n7gpBFZLK for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 16:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55CB740027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55CB740027
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55CB740027
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 16:23:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 38C4678034D;
 Sat, 28 Feb 2026 17:22:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 17:22:58 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 17:22:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260226204121.3547356-1-bernd@kuhls.net>
References: <20260226204121.3547356-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <bc4a2dda62d046ecc51dbea22f3ab483@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772295779;
 bh=i3g9vc7RJLYKJv7950pR6kX2U83GDfTRNIj6jRRaz6k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Jhq5wXjBH9s+kV87Tufm6I/FSNJdPq04wI2iBZGwHEPLd8DCDEp35mn750I+el3bQ
 b/lOVrT0kwNukdyvlLF0ICE4QUBTVggsdjSbYOnu2YJn8EDKJUJ9J8qE47Huvmyz5j
 tWSQFRS13javhlMtqXPrlwx7hf7B2nxCYQ0rLlyZcYyHDMPbXMrM9e7Q/GSsyxbKe5
 b3sXbQ2Xjrq53NAPJChgS8PHctpm7Uj7Bri8UOQSq4vKuIPXOVM2JYT1e8Z7uMT41R
 lM6Oc/phHymsa0KFLYZosHfKsQI0bi0fyrwsTw2D3KpgwG/cKPZ9CDZsJ3UzKm9m2E
 1noOYRx1EU6cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jhq5wXjB
Subject: Re: [Buildroot] [PATCH/next 1/1] package/gkrellm: bump version to
 2.5.1
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

On 26/02/2026 21:41, Bernd Kuhls wrote:
> https://git.srcbox.net/gkrellm/gkrellm/releases/tag/gkrellm-2.5.1
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
