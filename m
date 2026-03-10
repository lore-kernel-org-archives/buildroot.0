Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1899CFD88C0
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 22:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 167CD61593;
	Tue, 10 Mar 2026 22:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pULIq2hJoy7y; Tue, 10 Mar 2026 22:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2704760E4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773181097;
	bh=X6tfg8unk163fthQpWMYXDEAkrxANbeXiYlo5Ra4PyU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UwTKdg03GP9zFkmGTDvDCsuY5rjlpaeQPZVi4gRauwptK/+hG91yC3CM/wKHv+5x5
	 xAJ6Z0S1L8XGXrCD/QnOrQwi7ZahnPwLiW1+u+eFuzKqt+jvn5dMUFmtrgFRL0oVhj
	 piC6XQNlJ1oRYQvkwQQVFipv82nlTPTcQ+1sYGGrFk9Kx6tG0lD1HFBAK3c939sf4l
	 E77O3BrZbzqISqhSAoqq4gBoQXrHvYmtyomhAUpP/+CPEXg7/YtkTnMt2IHL4GHECe
	 bCV/3EWp7pL4qE/X5Zzcczd55hQP9Zb1nUaFXP0Ycahf86FDZYGax25zVSx5VT8Fz5
	 hrb54z2TRoKFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2704760E4B;
	Tue, 10 Mar 2026 22:18:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B9BD201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D09660E4B
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOZjv8JsIK63 for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 22:18:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D34760E30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D34760E30
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D34760E30
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 22:18:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BD4C120039E;
 Tue, 10 Mar 2026 23:18:10 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Mar 2026 23:18:10 +0100
MIME-Version: 1.0
Date: Tue, 10 Mar 2026 23:18:10 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260309183940.1662086-1-bernd@kuhls.net>
References: <20260309183940.1662086-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <a6d0a257802b054d946a765f67b25189@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773181091;
 bh=mQUqIvGaEc7P5E64lQXQRBFvpmVMq1p+g7spEThq4q0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=U9qZlMxpwdFe6AImB5FGk8C2PogN6GDRYfKGhFzM1huFL8Uf2EvM2sJqzDFFHLmnN
 yJHODAq6qRYpyzd3uVqIjqtZPKm+fsbzasnqkNImI0PmgjV++XU9V6xr5D7L8D51KR
 1Z+HPDJ+maShRfznfOj0Y2D7sX4FveNLx+jZA6HHjg4FyXlaxpQFf5jA/zWpK/7fn8
 C7Tf7jufLQ6230L3jIpWJ/u+d5M9UI5I9vDn9IeeBNAJFOQqv6fRdL7pu2e8jRwDQN
 CgC09ZqTrNDwHT3zWbNQ1mmLvSmcSvNeuvQzE+TPd8ljocRnSsmCGI07g7NCkkL6eW
 jDX1MSheV6Y4w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U9qZlMxp
Subject: Re: [Buildroot] [PATCH 1/1] package/libiconv: bump version to 1.19
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

On 09/03/2026 19:39, Bernd Kuhls wrote:
> https://gitweb.git.savannah.gnu.org/gitweb/?p=libiconv.git;a=blob;f=ChangeLog;h=62fd4ab5f345d8f0b98c9c385e34b19a0844e19a;hb=a8850dc314a906b7bbe49a7c60424c7b10f57236
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
