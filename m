Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33A2E9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BF6361179;
	Thu, 19 Feb 2026 17:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M3nd_stFb186; Thu, 19 Feb 2026 17:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D377F61056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522001;
	bh=1RKzFCgWlcjyvktt6Oo9MG1+k5RtcsGa4NhyQqFlkiE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BPoWewKzVpsl2N1d3ahG5o+X6BTChFMWLVaRx1Ez4ScE9Qa7R+hItLmV4jQGqVeln
	 AuglXLpU+NkmPVD++owvcJ7ZQttI2onDxjeyBaLtw3BS9zxpkmZKu1K66PKXP5nZVT
	 +rJV+VZaiO7xOFFy0kR0VrOJaZeMVCPLAGTemFGfMx4d5hsABoh3j828nDC83iD/ju
	 N598Mqd+BfDUOnIzaZMq/4fMT6CZHOliPxetGp22Z85EJfHUjEWNrK3iTOm2ynjpJ/
	 WorzatQFI82nDbKL/UYNCihejPsZlLwcPUywBdV4XRzzJZETgepEtvVAaC/WoAuk26
	 WT7nJpS9qZGnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D377F61056;
	Thu, 19 Feb 2026 17:26:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18A6F206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2D50406CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4drWqv97Nnp for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D150740642
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D150740642
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D150740642
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48371119eacso11233725e9.2
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521993; x=1772126793;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mmB7lZv41xRSvjojE0E1czMcs9HljK4YtbWZgXNw/mM=;
 b=gPYVcrX0D46+TDnCBavV9VZVnVuuJ/4X31/o9ZsAQxZrfKiaxKI+GgOsMgO6C/O5eP
 xlP9zo8g1HHG6WTUJ60fQQ0vCng0cfTJICGv5U2fr9ulrvi4b9/O+jodcSm/Jro7zjMR
 By9jSff+UHohzTZ3erlXlfkN+WXqSgN4hCxPlQu+ESfikUMAJe8YBplfo0y003NTXC1x
 txyhxQ1LkC6GbZqjtNf/lxR95q/XzV8qTc3O3U5MEIaHAJmeN+tQsMSJw8knEDWmfeve
 0OJcdpnQy+zmga+iUlXXkcAVqnujAB2p9Zif9dNlcO0JNlKjDy+jMng+4A4ghFffexKy
 tW4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXC8wjLsX7xzzpQwi6pG4ffC+iLG5J//G4Bz76sHQbrWdGT9x3FUBbRJNn5U7o3fM5OOsAxfyGQS0=@buildroot.org
X-Gm-Message-State: AOJu0Yz2Iwa3wfxRuyEE9yBZ2BJ41NWBRlA9435Xk8NJdT1w7soZdcz1
 ejlJtCMbKFJRcVIJINmspjZh20V21FqSABQDYj7WJM1w83X4jWQYksTCIwVnwrse6lk=
X-Gm-Gg: AZuq6aIJfByM6yvcsg0oMJdlSkVxbKPWThVrX3p+r9HiMCpaDudgPugyAZuZ80tiqGO
 IBJItdK8a8fVws8/c/WOlDBRh5G+TWr8qEoo8R3B3b+EEs/bzcYgij8NDZmaTBEym8lXdyJQMRt
 E+ZlFNb1foGqdi8V2Kq22IMoECLzt6zzjfTmtMwxNL6KQwMVx7VZMhHQt9XhLBHrCv4ocQkXPQ6
 rEIe1kVhZkCk0PRy2pIGi2HZBAzn08Eo/pRzQ2SQt2eAhxKNINFYXHtcrHQ/M15L+qD0276ZUih
 cIGvCpu4rrJazVmsR4ts5YBStzQBNHcF/QOsjIGb6wSg0ym61d53Qq+x3ncQ0BvUPSCKhcraIIp
 ObKh/LiG4fAC+hO7ozvXtXisExLEp+zbUw74QpNvObi4gQin8MRT4JchLtmw2zDtiVacabC7Gpt
 GQOiZYdfwr+G6JFaE=
X-Received: by 2002:a05:600c:c4a5:b0:480:699c:abe9 with SMTP id
 5b1f17b1804b1-48398b879c4mr98775125e9.37.1771521992689; 
 Thu, 19 Feb 2026 09:26:32 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a5b07fsm50979306f8f.2.2026.02.19.09.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:32 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:31 +0100
Message-ID: <20260219172631.340904-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210070129.516990-1-peter@korsgaard.com>
References: <20260210070129.516990-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521993; x=1772126793; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mmB7lZv41xRSvjojE0E1czMcs9HljK4YtbWZgXNw/mM=;
 b=ZUESuC72c6rP3F3HOgSPkbIe6mRQkKEjprYEjHvlulpe153NhT+XKbRNiz5xYeMpQe
 UEs8nHROLXkxkb9DBYQ3oiWnDQRDC03eapbTNy+/371/fDbux/ei43r8BxKYc4wFW4RU
 9GdflEd1YNdEDIDzc6tGX9GVeQ+5J4wYRnnytf71baTR7QRpTpvkd05R4RY+k6ZjtYal
 eYvCczlZbohIHGlHMJe4s48o4OBkSRCvZB1DakfMH/cbIio4Q272v+8cf/79fFoeYz90
 92lyU9+wWdJDU08IS4SB+9WzWLMkU7BHeO22RGXUX516yKePbqZzxorMglpV+slqWjTx
 MlPA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZUESuC72
Subject: Re: [Buildroot] [PATCH] package/libtasn1: security bump to version
 4.21.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Fixes the following security vulnerability:
> 
> CVE-2025-13151: Stack-based buffer overflow in asn1_expand_octet_string
> function
> https://lists.gnu.org/archive/html/help-libtasn1/2026-01/msg00001.html
> 
> Release notes:
> https://lists.gnu.org/archive/html/help-libtasn1/2026-01/msg00000.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/libtasn1/libtasn1.hash | 4 ++--
>  package/libtasn1/libtasn1.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libtasn1/libtasn1.hash b/package/libtasn1/libtasn1.hash
> index b9c9dad131..f099b7bfd6 100644
> --- a/package/libtasn1/libtasn1.hash
> +++ b/package/libtasn1/libtasn1.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.20.0.tar.gz.sig
> -sha256  92e0e3bd4c02d4aeee76036b2ddd83f0c732ba4cda5cb71d583272b23587a76c  libtasn1-4.20.0.tar.gz
> +# https://ftp.gnu.org/gnu/libtasn1/libtasn1-4.21.0.tar.gz.sig
> +sha256  1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87  libtasn1-4.21.0.tar.gz
>  # Locally calculated
>  sha256  990ef6a87f29a9d3db33698b94ea026a5d0f81bbf9806333d73699a250b7e5d6  README.md
>  sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/libtasn1/libtasn1.mk b/package/libtasn1/libtasn1.mk
> index 3154e500f1..9a853e2312 100644
> --- a/package/libtasn1/libtasn1.mk
> +++ b/package/libtasn1/libtasn1.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBTASN1_VERSION = 4.20.0
> +LIBTASN1_VERSION = 4.21.0
>  LIBTASN1_SITE = $(BR2_GNU_MIRROR)/libtasn1
>  LIBTASN1_DEPENDENCIES = host-bison host-pkgconf
>  LIBTASN1_LICENSE = GPL-3.0+ (tests, tools), LGPL-2.1+ (library)
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
