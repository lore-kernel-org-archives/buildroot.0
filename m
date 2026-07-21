Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BE4C4452B
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D6FE60611;
	Tue, 21 Jul 2026 20:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vc13uOIVyJ7d; Tue, 21 Jul 2026 20:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B01F560632
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784664428;
	bh=iBICx/bUBO/d78nZxA5vFw8p3sKjP5FNDZtNApI581w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nDeuitBbVFs9MMNHZGSwbCUjEY7QeBJekjJPGWWFfAsXJnOu71YQxIGv7htwG3riA
	 3c/azXW3Qrk1Z9EcBQQNJdakOvOag2oXQazMZRyDl3EUq3YoTu5OnYwBwivd+6J0+8
	 66bOYWxOaDa8y2agKDgDcMF8AEeY6iatKSWMg7mZEm8VBp3+BoEQOvVCQRmIEda63Q
	 PZ+gMP44f4XVYNh9SZasH45J9Bl/98VFOT+KHyZNIMmMVC6cYlnowz7jcTJPFbw9Jx
	 3hunFcXR6jk902FsSWZRjuU3NRLF8N7rVZvPhi/4PNnygDiZDbsymfSjvZIaEXMYC8
	 Z4V7KeAfeCphg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B01F560632;
	Tue, 21 Jul 2026 20:07:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C385BEB
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B584760632
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2XM_LMl15eaL for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:07:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E028260611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E028260611
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E028260611
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:07:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id C96E2B00565;
 Tue, 21 Jul 2026 22:07:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Jul 2026 22:07:03 +0200
MIME-Version: 1.0
Date: Tue, 21 Jul 2026 22:07:03 +0200
To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: buildroot@buildroot.org
In-Reply-To: <20260721085038.1157693-1-fido_max@inbox.ru>
References: <20260721085038.1157693-1-fido_max@inbox.ru>
User-Agent: Webmail Free/1.6.17
Message-ID: <49aa4a0157cad79abde68ef9c3a1fcd8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784664424;
 bh=yWB66l37N1SDg0Izpke5TPvYq7Cs2t9jEk6QOzfNyjI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=uNwJmffhItI+02X61VcNxu1sGjGG9jIjz/QvUgUmEY/oZD0/PYmcWV+UEIE9WGEBH
 YJ/FAOVxvw75vBNOQEQ6C8UrmxwM9aAc3wyv2k8fiWpg3TREfkWuxzNkZ3Nqziw5lj
 UrJX+dbnyFqNHijxn0gw64AhlwKQB5b985oVohJ0R52JWYCm0sFFENRW0rmDS2kDrS
 AssPCW0sh01Xf6EkfPCPYDNPChj/FPpWd4Z/WBbNHpPBeLtzFBComnkNz6Nr5s0lj3
 TglNQP7HL71P1TvBX8wfQXbKqkmyfvGROchUeUNq/SVBHuWqs0BlQDmdgR8C2H/KZd
 lcUv+exSvEbgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uNwJmffh
Subject: Re: [Buildroot] [PATCH 1/1] package/protozero: bump version to 1.8.2
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

On 21/07/2026 10:50, Maxim Kochetkov via buildroot wrote:
> Release-notes: https://github.com/mapbox/protozero/releases/tag/v1.8.2
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
