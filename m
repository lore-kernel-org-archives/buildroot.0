Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5DFCD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 722CA60F6B;
	Fri, 12 Jun 2026 11:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7S-UccqVGILr; Fri, 12 Jun 2026 11:36:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92A1560F79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264213;
	bh=v0l5PVM96sLlxP+gDqXE0nUy0T0ZCtfIuo4TVFww4qc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RKGsbWjXcvY50u+bcuL9pC0eIFGtqZd8wVq/FJjWvpV+kmYXeTv7x/Iw4VFaQN0YQ
	 ufmGlxuEW3dyeQjDBEXeV082kteGOg4Rqpc0m8COEDfSTW3zr9y/EmN05warHLet78
	 fLLyRtsBxIHB657Tu+fmD6YpJ3S7fHgm/xVEE1qex4vkQCO+dvRcrBeqHgoIrx34a4
	 CzlpdWAxY1Yh/aMOO4z3KPKqjA9AOGFmkzXjaheepnGQQdPEwJTNNG+cQ466JDEBsl
	 YwinZUXYvDsNq0v3ULxB2DHfgB0Zztejth3qg5MVr+QdhH06iTtbM22TdywFxO+JYo
	 WLaIzcPHmnwoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92A1560F79;
	Fri, 12 Jun 2026 11:36:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B4304237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A672840690
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OGNcwgHY9V_Z for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8465E4068D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8465E4068D
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8465E4068D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:36:49 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490b8a97b11so10155305e9.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264207; x=1781869007;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kgykUaZ3sOjDOd5YcvnSR2y7ZGRbBBn+1jePIxksW0Y=;
 b=Idemrb0qxlMirbz0uVntkxV2WbbFF0EJqj1/v3J2JsxijLkA/mThmC3qXul8229S96
 4ncrt7+6LJRtwrccYiWtBsfqpWQcWnOkreHcAOW2IEFUDIUbQ+U3bi4WoYlDvp8A2yAu
 +DnfALbqb3M91IlTenlmhUlBXvLcqpT0jogqsrtKw5mznPzOLBplMMfMAQKvxrUcM1ga
 /u9w8LI/wGnvUQ4Mz4vh1dx3bD9uJwRqRyzvJIDpooWjC7uH33fH5/aZV6Too+sDpVNO
 eA3Tnf5bOJB7k94AFrLEb5XY13eX2D7lbuN5ImPrD+IEP8ggE7wlXNyZYAp6tM1n/hRb
 yBHw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+0UiBimuSyl8MNTvS+bPorrM3VySLn8ykufaB2O3gM2rj21D4U5e/CH9h3PB1F4yMvextk0hnUEzA=@buildroot.org
X-Gm-Message-State: AOJu0YxxZyEx2Dnm24Bod5wSh5oFnODTbUh6UJlzS5sUoy8Krnfpwwfh
 A5CjXr4Bpjj6mhUHsE/lY014A7E++5ewdOofM3GH+SjKyo6Kx4Yy3F1W0Ju6AcNk6Uc=
X-Gm-Gg: Acq92OGIU5J25BmVQQl8xXN4+irvOOdgtcPKX9boET+6zVliiYdF1reoBGgCXXNJKCu
 e1+cePo7H9B1MqHcL8ULd6JQe5dLxbXUL+I7IMGq+YjqcmfGVm6Lt+nrPEOxl6FlmO3yQpyNKt9
 7Gnye4YP6yC3sM3F7oyM35oPLf1OC7vqcV1PaBpoYNBbXl7Qt1At8aAz5rDsWmQsgI9ddHCFmHv
 4dbYtJigDrBJAn2c3P3IN6g5HEoFrCRf5WIaql9w/dq6wDcRj+N0bIZCkO0lKWX1fvw67e1XC/w
 iTBSC4cXhD09dSt+vxrDtRj2xZtBScb9ZFSUgGlVxAJZPtOqKaYm3vDxBIyEUJxcmcCMXFZCltd
 gmNKcZK+tnccNQZ8b1ClZOPGzsO+EPMWQFQXhCjegHey+axRmBqRrqudBgHzaKW5mu8TF2lXHkE
 JXz/3cVBKIlffhK90=
X-Received: by 2002:a05:600c:4f91:b0:490:3fdd:d353 with SMTP id
 5b1f17b1804b1-490ec4c3991mr32448715e9.8.1781264207368; 
 Fri, 12 Jun 2026 04:36:47 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c7ea52sm149122675e9.2.2026.06.12.04.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:36:46 -0700 (PDT)
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:36:46 +0200
Message-ID: <20260612113646.250670-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20250607021849.37636-1-kadambini.nema@gmail.com>
References: <20250607021849.37636-1-kadambini.nema@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264207; x=1781869007; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kgykUaZ3sOjDOd5YcvnSR2y7ZGRbBBn+1jePIxksW0Y=;
 b=b2ZON2PX51mr+ucifwGqV4kzU+QV29BzNlj918ZLHK6oQPUlOce8Fr8qIagRapO8AG
 iaO977Cnei2MZ3WL/EuUhIEpI642F2VEEvL9eCVJeRhkgHzgSbNlci+Xb7m1wLUj1vwN
 gg/sc9+KPOyU+8jgL5dquunjK6nzWLXa3mAqLgDESkbs+beCNJ4kRGIDRVoenMpFkA5L
 bnbOJa/YDoq/1cW8CAedA3P4JIuP2mdqGl5Klmru6HMRWB8x/38QF5xflkPqZYIkR60/
 DMhlPDH9F+Ur8cBWwbGV0vr8mHN4QBBsKopGiW/0wjkKtB8lGd0bYZGdO4eN2nHaCgT7
 kG7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=b2ZON2PX
Subject: Re: [Buildroot] [PATCH 1/1] package/libusb: bump version to 1.0.29
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
> Release notes:
> https://github.com/libusb/libusb/releases/tag/v1.0.29
> 
> Changelog:
> https://github.com/libusb/libusb/blob/v1.0.29/ChangeLog#L4
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to 2025.02.x. Thanks

> ---
>  package/libusb/libusb.hash | 2 +-
>  package/libusb/libusb.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libusb/libusb.hash b/package/libusb/libusb.hash
> index 3d51244b2c..4c76609930 100644
> --- a/package/libusb/libusb.hash
> +++ b/package/libusb/libusb.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  966bb0d231f94a474eaae2e67da5ec844d3527a1f386456394ff432580634b29  libusb-1.0.28.tar.bz2
> +sha256  5977fc950f8d1395ccea9bd48c06b3f808fd3c2c961b44b0c2e6e29fc3a70a85  libusb-1.0.29.tar.bz2
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
> diff --git a/package/libusb/libusb.mk b/package/libusb/libusb.mk
> index 3d809bfb6e..95ce8b17df 100644
> --- a/package/libusb/libusb.mk
> +++ b/package/libusb/libusb.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBUSB_VERSION_MAJOR = 1.0
> -LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).28
> +LIBUSB_VERSION = $(LIBUSB_VERSION_MAJOR).29
>  LIBUSB_SOURCE = libusb-$(LIBUSB_VERSION).tar.bz2
>  LIBUSB_SITE = https://github.com/libusb/libusb/releases/download/v$(LIBUSB_VERSION)
>  LIBUSB_LICENSE = LGPL-2.1+
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
