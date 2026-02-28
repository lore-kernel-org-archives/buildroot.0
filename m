Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E46FEE4EF
	for <buildroot@archiver.kernel.org>; Sat, 28 Feb 2026 15:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8420B41867;
	Sat, 28 Feb 2026 15:21:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rIAZRDh0t7X1; Sat, 28 Feb 2026 15:21:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8F31418A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772292075;
	bh=HDueKLkg2vv6qNXiBgf4eLgpMLN9WQcAyAJ3sa8flKs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mDVZvAZUPHKE+tv+t5ASumEtQnpTD6pKNeOYwnxZX9F9WLpKltHsGTE63CZIXZ0vM
	 Ivw2hXrSpFGMgjh3Hv4ufE3oP67uV1DEXCUxZ8JVC+heRjNFuzmqvAOMobicq1v6Z8
	 bb10M1ayhwVmzNdXVrQpcnmaAgsBV/6jDyFEaVYmMkfXrdFYY1IpIUeVQBFAggaRdP
	 Zu1SoWQ+0dCog3sil0cddayQcIFHXWySUimXZ13AZTmKkijdF1D5NRfSqyqfnFgAFi
	 PEbaq07zYDhfU2OyxqYousVo1YQRqwkUwu2rnQMweq0e6AHDIGZAMIrFOIoDYO49n4
	 Y3o65xIGsglEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8F31418A1;
	Sat, 28 Feb 2026 15:21:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B569F1D3
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B870418A2
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBpwt7reJz7m for <buildroot@buildroot.org>;
 Sat, 28 Feb 2026 15:21:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A725F418A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A725F418A1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A725F418A1
 for <buildroot@buildroot.org>; Sat, 28 Feb 2026 15:21:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 17390780371;
 Sat, 28 Feb 2026 16:21:09 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Feb 2026 16:21:09 +0100
MIME-Version: 1.0
Date: Sat, 28 Feb 2026 16:21:09 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260226202147.2021977-1-bernd@kuhls.net>
References: <20260226202147.2021977-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <7570e0c96407bcc3d586b0784520b3fd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772292070;
 bh=rpC5VkZvzfHin1uuXEIsid6bebZgdbvH78nXjxvhzzY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YJsLK2DoipKUs4luJ4stzZTQjVViS/d93B1CH26qr/SdIHGGXvIZOjnX4GMlm6UTG
 dxjrt8j3UoX8HfaA8EYuL5ghukBWYmupPc71cHZV7gEOMoQ4Ru5euHjsACJK+GYtIZ
 CZ7bNUBLQXSsw8QByHWzGbIcqfaPaQ2e6HlgCaCcEBxBbVGdnEWhHeY7wOxW3jDKch
 8yCEdMZdZckL4S29n8vXuZNclzaE5PYIwK3WOugJsgcsegq2GdLJGjYuX8fGu4wwpV
 p+s6V751U/4UwZtVVD0eSTkkHr7dO0+2zkuCa/GNHx+bdAo03KN/yX0s9eH5jJkKd1
 Mx4vqfnJ7cufQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YJsLK2Do
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libnfs: bump version to
 6.0.2
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

On 26/02/2026 21:21, Bernd Kuhls wrote:
> Removed all patches because they are included in this release.
> Added two upstream patches which fix build with glibc 2.43.
> 
> Added optional dependency to gnutls introduced by upstream commit
> https://github.com/sahlberg/libnfs/commit/c9215365ef932af39f3a84da071979b199b04db7
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
