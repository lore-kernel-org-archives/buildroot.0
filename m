Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F08C9830E
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 19:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0290581232;
	Fri, 25 Sep 2026 19:17:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xo8g2piWyIur; Fri, 25 Sep 2026 19:17:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CC14D81314
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790363828;
	b=AfSDokK92cY7Cpj9WvW3Ma6qs5O1kzVMRFov41/YvHa3uJGvDPlllUgPRLHP+5nOpk6a
	 lFaEdexc8nSasOcBGgkI502Lc8SRNc8lSxS2QxEIpR9zlLojID9Rnvg5uOeyIaZT22XTi
	 YZjqB2oOk/87Av6GxMyrBVIXOLlvRmS91660zxQ9noOHkJ2F9qZTqrbxMOu9mf9pDfi0W
	 5PEEMe27smFo876JNEChYl/1PcmNeNogE9gKtDC4TABLjVQoH0ejQGsLi47nAn1n8kA7B
	 Kv4jnUmFdxGYWPeOR5/w1k9KFPOgNbcNwbyXp/gGgO0e4v1+g4LFtRxahUN96o04NWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790363828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=OSW6WbN8C9O4nPTJ7GF7sdjcJSSEDoCyfg6SVu/Q0MI=;
	b=qXmzNsybJoAKXLxXSTDVTXfBxOXXurpdpo1F2g2BdnJ5HrXSGYXdwVNEUMZAFwQtHAr8
	 3sV7BPRqn0Y1VrpVT2BxpM4H7wv9MeicijesItbl7qP/9UU2hXrASb4ejlPHglR1W/BGT
	 7KmLs5FPE8oKL8lITw7KSvLEW8aYPwWFSi0wCvGV4xfN/Y9xdQqCBR9imtuysdzzUhaW0
	 3GkHAZEOKHbUcvX/vanRHhGkVjZdSEdmj+vRNEQZJFvAy/H9fXaKwp6RC+MO4cxrXs77e
	 kAQxSd5H2DUAD6HrL0vEO8Wj+BGAtsUjBqr7yKHTcoeyXh3DTehk4HCvnfJN7lhxejg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790363828;
	bh=OSW6WbN8C9O4nPTJ7GF7sdjcJSSEDoCyfg6SVu/Q0MI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Hk6EQzpXbQDPSmpc0/sz7nLpdXdpqByjWUZCgLrAnr/W3fUvmBaPOn2vWFwUDNvOr
	 LImWEqBCq5yFrUvoioO7sllkJfMpyJVWZBCJZcrA6m4oyNiw6N/LhqmbXVoW6xn3cl
	 VumH4tMPYQ8H+04N2D8smouJSc83w9VKAwH508nQjtvDUNfDalxA9Rq3zn8WDVwY02
	 tnl6/aGv53A82O3SI5SvocX+JlOXqzh49XzsY31N64mXBMcCpH1YgJ0R5LIeGv2YKA
	 2GI7V12xTrhijc0Xr7Rm+tIWIhM4XWt5bER9eL3suLxy3eqPF1r6+wA+2rCUjK4pXT
	 cXVIO288OfT5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC14D81314;
	Fri, 25 Sep 2026 19:17:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C87B32F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02DDE40B5A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_E8aoDagfp0 for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 19:17:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4202640A7E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790363825;
 b=F7uH4TMoXv1xcUcPfNNYA51b0vxjpk3C8eamiOJppv5K1YHEDpyM0EwzyJFbDx0G4d14
 LEAJKSSwKvIx2tLkzH4PHOvHJAH5VIWTiZsvRly6e5Z14SNhNO9HrXWaHO6Vf8VtM5rJ1
 h3tk8X5jLeSslawH0vQ4+wCr6C3xY0C+9C0cv9WA270qSkaEes6HU+9Mc+Lnd02j3xLCx
 iVIAOSK1ZuFBpf0Y0PvldK8It1MQ4511BnBRf/ClDg2G8jZ1oJg+FCOZJEPukFNuML7nF
 uKS2IF2Xp2eKpeeS+Xz/EKze01AZr2sjP4IjZYAh+HLoPlYbqDGFxn1gG90PwtPHj+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790363825;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=28GqqVnI/l8rwnPyY+6ZU35N9QOK1vcP1DejGiQz8GI=;
 b=Lw0lvvxKGFWelZFFhU0rA/9gJki1/fv2o9lsmbux7d+EhsA3Kqo1/iKtGHXzXOpGkTNv
 1BkhGQ1A3wzR4p4w0coRq0Z5xxSqNztt7O1AvHn1smmXY0v/wpn5lkXQSzpKF4VIejZZ5
 /8ffZ/pLLsRbWPL9WBd2uvZemtiQOAwcv6Pc/744EnF/7BcxZKpxMfgIRun7ZwIG1FzQG
 kw6wNVZz8jTHQ5MlklCW6UDh2ZCdq+rohn1bbJx2+C1DPhUWpJfyw4IEmeifEykDIqwxg
 D/T4dVZhTqcKAzTAab9iCOly0koKePr7rTK9+SQnp0nbqfeRXKm4aKWZ5vid12YM5UQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BlZHxyXs; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4202640A7E
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 19:17:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3669013F86E;
 Fri, 25 Sep 2026 21:16:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 25 Sep 2026 21:16:59 +0200
MIME-Version: 1.0
Date: Fri, 25 Sep 2026 21:16:59 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260924214149.1533853-1-aperez@igalia.com>
References: <20260924214149.1533853-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <09fb47b002fbfb5755f6386833544d09@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/bubblewrap: security bump to
 version 0.13.0
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

On 24/09/2026 23:41, Adrian Perez de Castro wrote:
> While there are no CVEs for this Bubblewrap release, it includes a fix
> to ensure that arguments that receive a path are not empty (which 
> before
> treated those as the root directory: a bit of a footgun!), and that is 
> a
> follow-up to the security fixes included in 0.12.0.
> 
> Additionally, it patches a number of build failures, which fixes e.g.:
> 
>   
> https://autobuild.buildroot.org/results/2eb2d222daaadc2eb16b42fa2ec102ab0689f038
>   
> https://autobuild.buildroot.org/results/674413f089ce9b80a59058674b3ef6879e1d389c
> 
> Release notes:
> 
>   https://github.com/containers/bubblewrap/releases/tag/v0.13.0
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
