Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C546ACDE001
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 17:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9498F825FE;
	Thu, 25 Jun 2026 17:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AntyxREoLGDn; Thu, 25 Jun 2026 17:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AECE825CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782406838;
	bh=/X3RTZ0o0Q3WZ+TYwGAJz2JbBBGKMWHwvUI7Y7lmT2k=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qPpw6dV3P7U10RpVOISq0vbtaYN6vDhiJtpKaklm/B41FF2rp+ATHaA8Xmt6einYv
	 9N4o5TNKFcdRAoCGUNDJ+jvW0+CVr38zlFeA9GPaGc12VCCJtRkdx8J6AFqiKl7Iql
	 8+BXslZaJW1FFLCV4zGPfnUKKxfk0alLjRw1kqZ/T7yKkEWeuhSjycu3wj8DAOvunB
	 sIX6ihUoEGxSNixoQEI0x976oYa+2qKPs5OAT4sVmy2XV47tiqHbwu6XvhCViphtQL
	 ihpUxaCjvlGCjoafIJwCu6nSOYpFpZm6iBzBRGI/oX029AEa2WdFmW04+0lkNdNJoj
	 Y4FIXyFWbPHiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AECE825CA;
	Thu, 25 Jun 2026 17:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D1D5254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E4E761057
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s-O05RHAHxcA for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 17:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D567C61056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D567C61056
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D567C61056
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 17:00:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8902478050A;
 Thu, 25 Jun 2026 19:00:30 +0200 (CEST)
Received: from 2a0d:e487:119f:5231:6cab:f084:5c2d:94e1
 via 2a0d:e487:119f:5231:6cab:f084:5c2d:94e1 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 25 Jun 2026 19:00:30 +0200
MIME-Version: 1.0
Date: Thu, 25 Jun 2026 19:00:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
In-Reply-To: <20260620070414.86981-1-bernd@kuhls.net>
References: <20260620070414.86981-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <89f9362212a171f66d0aa9a6487b3baa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1782406832;
 bh=VStW9BkkpZoR5yDdtwdSnG+kuh9FLD0OCKr20X3733s=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=dG6Tp+OvQZ4QEUt6ZAvbL6hz0tZMWgv/aTaZ4E28PhzqB7Judwx8rC36RXGqwS4qP
 IynsPgm2WcRiWngde1zeudohyBlb9Tn4mzFHbq2rnOAr7q5V7M2CfgpDv2NPGinvJB
 xi5z5drjj0JWzTK0PSyOpY7sZd8z6+RBDsb45CiliX4pvHIrCl6usfLG7yWHuToISr
 sQMwf+IhwArHQUeqSArbS0+plJU7qm68jS/pAmTJfmF8QJeHjLco1bULiLIjitb/uj
 QkbPm6G72RFVKjvsfVu2SxSeN7JfIEqhjskhyvb3v7U76Vb85ecauFYbqqqqzd2C84
 b51rP+fSjRpdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=dG6Tp+Ov
Subject: Re: [Buildroot] [PATCH 1/1] package/cpp-httplib: security bump
 version to 0.48.0
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

On 20/06/2026 09:04, Bernd Kuhls wrote:
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.48.0
> - this bump includes a security fix for the Mbed TLS and wolfSSL
>   backends which are unused by buildroot
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.47.0
> - this bump includes a security fix for the Mbed TLS and wolfSSL
>   backends which are unused by buildroot
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.1
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.46.0
> - this bump includes a security fix
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.1
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.45.0
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.44.0
> - fixes CVE-2026-45372 & CVE-2026-46527
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.4
> - fixes CVE-2026-45352
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.3
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.43.2
> 
> https://github.com/yhirose/cpp-httplib/compare/v0.43.1...v0.48.0
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
