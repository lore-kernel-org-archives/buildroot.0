Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FAACC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC32E405A3;
	Tue, 13 Oct 2026 17:54:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnsC77Ok46hq; Tue, 13 Oct 2026 17:54:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E058A4056B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914045;
	b=gKDaZ0w3bC98kjM4Ky6l+e1PbxD3/y9zeANpvSsJ29GzDuHcBmA03b0gPKIEp+/aFgo4
	 llcZJqTzEJ4wjDJG+ysGsVUDjzVvEWovlAkc/apLz5xkuwiyQ+wxYf6PkQnaVx4i22Ygf
	 dHtLvv7IPJR1dCRvQ3ZbjjgiC9GTdOOxqD/TIYXChlscPdj0YcyMrvr73tpn9Ec38/Des
	 jftKYHwkwBdMAOxmDB84H4AtfV3J2yS8t9KoxR8XWAo/XJ7OLqdvhtkHsPNkNwHMb4M2G
	 gwbG9yqrcgSg73nKM7UhE9G/BZu3hbu/SO9ByO8+Bb85ShciWWbnOokv4kIPieJ+ogg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914045;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9ChPrvrWNc/duJuOExcBA8GRI40NdpBsEmHXUprmjiE=;
	b=h1Uz7+H6s4Bi2YuXZNG8i3BMd+ViEWx81KXXqLdqXJzYEUnngNBwRo6TQrPuhu1504Kb
	 FdB8LxM32fwAq3zbDWfgod4vzv6KkJBd8jcf4njT4eKqwKUhuYqydslOfg6plmrFdZ8a1
	 Id2BKZ6FcNPbybrVDkliqfkREfsgv61XZ4Uc0tbIk81IaUJAHtS3+/EjbAs6DN8s5MkoP
	 5YIDhTx28wUpFR1rue6nqCy2AW+ddBsURVYTm9CV2hw8HU0yD4lhvkf42o6SF5/2rl7ih
	 G8TRLIy24qB/pRECFx3WUtIIjmL9xuwcCU6M6kxs9VQ7gu44Rnrlfa2/griXJDEEqZA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914045;
	bh=9ChPrvrWNc/duJuOExcBA8GRI40NdpBsEmHXUprmjiE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fFA43pDiC6yqvS/8ExzIkwjC2ZvLWDAgBW8SNU9Ee9SWMjjDYXetmcfq4Wv85AYmC
	 qKceRurf3XRP7EXLoQEgxdU5KFXVHGOe9EP6XEim9wSNu8digCVVl8NaKnL+yCU3nG
	 vI9Vn9++sjJRk9ZnKutrHcArQWSXY1E2zLQ5NO+JkZfgpq1Qsj4Wf78PxV05Bp+kn2
	 XJquYx2fVc/qkHW8rhBFJgg6Ao3l4YVUOwPRS2lh3A7qSNGK1SWhI0NGQfVPS593hR
	 jsUd6EruGM0ZSm8kO4CXVuwyd2lGyPQ9GnaSLQsAwcFkYeokx1ovJHP9mS6MELnuK3
	 nvUMMRwYyPG+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E058A4056B;
	Tue, 13 Oct 2026 17:54:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BF306788
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A61F26073B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c22D70Z5MOFI for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:54:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C42ED60705
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914042;
 b=gFe7TY/IM1jWD4F7F7/6sI21QZ/88NMsug9c3W1QAbmHC0daYQRJX338BkshEfS61nY5
 CPg6llM8oBRLOmq5Pkz2deti8AY+7beGnA8VtKNqES1Y0anO/r/9dTgaj9PKz1paWWdT2
 5nHnNGQaMIH3cInWk+n0HxAFbR5Hq9mA85qCpfu/Vy9lAUOAK6WrkDUKTSQHQCJz2IGNO
 ZX2Kwlfn/L6YLwdgdrGGhvtoKYtQbUaBXWB05Ivqf3IZIz8b6q0kGm3gYGqFu+VHHIlAf
 uEUiFx7H6pSPPLyVmfv4jEZm1F5BfgiXN2N3ikyjAx8FHXvXgoclgUAesP22FDVRiQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914042;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=UnQl1gWOfmav9H5uV6kKl6xMooGX+GW1G/+AWq95FN0=;
 b=emRlGcRAffaPOP1zYWyXty2PCB2I/MGA8uMhC0UBRrwMkIE0mvB3AXa9XWnFRpon7j3h
 Je4n2w0eMP0g9xMnoz/ReeaOhTLWYosLlh8ptH9/QndzZwdoLcnLs5+Q21uByHe2j/ndk
 povWE2aU3BsXzAVLUH6+uVcAKO5sRmodieZNS90v3EF3ZylYLrneW6duv+95RXENmX41+
 iS0ejpZu/cYYHp8u7XzZrW227LSNIqd524mtN6vDe0riiL7eurB4DjvObop/cYl19dX/n
 yb3all56weGnkO3SdMckuZYblmwGSxrMqXeIV/7NDUchgVtPSpEjd6qgNE1vVDqeIwg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=l6mY2Tpw; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C42ED60705
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:54:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E76974E41210
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BCDBF60362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:53:58 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 32CC411D717F3; Tue, 13 Oct 2026 19:50:32 +0200 (CEST)
Date: Sat, 10 Oct 2026 08:39:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Paul Elder <paul.elder@ideasonboard.com>
Message-ID: <asndmivt6Fwvdx24@windsurf>
References: <20261007201107.1693337-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261007201107.1693337-1-bernd@kuhls.net>
X-TUID: ywxaOUREmdd3
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 32CC411D717F3
X-Spamd-Result: default: False [-1.93 / 30.00]; BAYES_HAM(-3.33)[93.91%];
 DATE_IN_PAST(1.00)[83]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; RCVD_COUNT_ZERO(0.00)[0];
 ARC_NA(0.00)[]; MISSING_XM_UA(0.00)[]; BCC(0.00)[];
 MIME_TRACE(0.00)[0:+]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 TO_DN_SOME(0.00)[]; FROM_HAS_DN(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[localhost:rdns,localhost:helo,bootlin.com:url,kuhls.net:email];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; RCPT_COUNT_THREE(0.00)[3]
Subject: Re: [Buildroot] [PATCH 1/1] package/kmsxx: python bindings need
 python-pybind
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 07, 2026 at 10:11:07PM +0200, Bernd Kuhls wrote:
> Fixes configure error
> 
> Run-time dependency python3 found: YES 3.14
> pybind11-config found: NO
> Found CMake: /usr/bin/cmake (4.3.4)
> Run-time dependency pybind11 found: NO  (tried pkg-config, config-tool and cmake)
> Looking for a fallback subproject for the dependency pybind11
> ERROR: Subproject pybind11 is buildable: NO
> 
> using this defconfig
> 
> BR2_x86_64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_INIT_NONE=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_KMSXX=y
> BR2_PACKAGE_KMSXX_PYKMS=y
> 
> Fixes: 0710da403def5df6219c2b6a3f4cdfa5930b2a89
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
