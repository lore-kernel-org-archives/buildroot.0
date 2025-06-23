Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E7B9C77B7C
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 20:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C99FE60AC5;
	Mon, 23 Jun 2025 20:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y7kwjar-nA16; Mon, 23 Jun 2025 20:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 179CD60AD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 179CD60AD3;
	Mon, 23 Jun 2025 20:28:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 118B5154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:27:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E69160AC1
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRotocN1QJhe for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 20:27:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F621606DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F621606DC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F621606DC
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 20:27:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 4896F13F86A;
 Mon, 23 Jun 2025 22:27:54 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 23 Jun 2025 22:27:54 +0200
MIME-Version: 1.0
Date: Mon, 23 Jun 2025 22:27:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250622173655.2741255-1-bernd@kuhls.net>
References: <20250622173655.2741255-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <29a403bed2d2bdbe83a6bebac0131bd8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750710475;
 bh=yY0Jyd8oQfBFuGNE1eKKCI5UZh3x0+8GLGd38RNsEfU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=APoFN33lUgygsm+Y4XIKY2LWK0rVKmJ4weezLLf9p8Lr/IBzMMW78KTpUm4E8mPJk
 2OJRs+jkgt5wke1Jy5eEKy6xcIW/lCw+lnJYfxs1sajt7OPU0dgPw64zzxx+CzRFZK
 /njygB6dQHMlol/8Gqsg10X32NdDNrSxSitVUs5JWCWTfXbDnlyXW1NCatFegPSaVu
 bNnn72JVqgz4SX2ouB0GNPiFnPlLeSVHEmYGk+2FiL8rFBkPcza3DRHCgHmIJtAXXP
 35TUg0wi1g+68aP8Xlw7PimehWouxMqI0Cty4FDeqt6Thk8cHlamhWsHZ3974g4IHu
 mOaOl9QnOfxZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=APoFN33l
Subject: Re: [Buildroot] [PATCH v2 1/1] package/freeswitch: rework OpenCV4
 dependencies
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

On 22/06/2025 19:36, Bernd Kuhls wrote:
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/commit/962081259d91fea1e9a59c1af85d9a85ba45d0dd
> 
> Fixes Kconfig warnings:
> 
>     WARNING: unmet direct dependencies detected for 
> BR2_PACKAGE_OPENCV4_LIB_OBJDETECT
>       Depends on [n]: BR2_PACKAGE_OPENCV4 [=y] && 
> !BR2_TOOLCHAIN_USES_UCLIBC [=n] && BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS 
> [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y]
>       Selected by [y]:
>       - BR2_PACKAGE_FREESWITCH [=y] && BR2_INSTALL_LIBSTDCPP [=y] && 
> !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU 
> [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_OPENCV4 [=y]
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
