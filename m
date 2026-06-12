Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698C7CD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6E1360814;
	Fri, 12 Jun 2026 11:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id imfxXayTRWzp; Fri, 12 Jun 2026 11:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1BFE60F61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264284;
	bh=NthmnIc4YlGXeBk5vfnpKwPunbLISJiqYr/tYDefRY4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QQHqBH0UEugqv9AJl01DVRX5FXzMD9ictMM9X9V1N3pkCx/XPWRXSQcSPef3KH+7E
	 70jIurM6RWGETF2Ru5LpCSk63dKTDt9mNFZcqCuNiqLbxDCKxRK+hknlznViCjus1a
	 bHIzc5LZNerrHRtSUpbaBN8+FcUJZC7zkYeggLJH7X2LGl6pRPrE9aQHweOe91KHnJ
	 bPVZJkhdW6ZmgiIUVAQ8m3pVAi7lFaq6hAajHlBqV6ID2WIB7hNL6i0gYJozkKF/q+
	 BnaRSbx9rCXUIkvgliRxHV3FoqAlFfa8kYEcwoYPF+dwK75omwPtiq7Qi7/qtpMjxc
	 tdXfBqoZOA6PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1BFE60F61;
	Fri, 12 Jun 2026 11:38:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78C03321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E4DC83336
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJW1NKwb9G7b for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 40D7083330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40D7083330
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40D7083330
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so18026145e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264273; x=1781869073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=maz3nFgc7/TO5RsjR9+XV9YaWdajh9NeFanqgh+yTt4=;
 b=jRJHSDJAFr37yOu6a0C+3l/dyBDjeIoPfx9sR68VVbQPpK0bn0VMC+IR7Fv7HV/jqA
 V5MGgX7xxjDU6av48k9JM8Ky5grX9WPssBG02RU0tM9cjd4GQwab5puo3365yHk8inEq
 kIzK4VKZ9bpg8bgkXPNCVbBL1KDBDzhcv70/FFAkdl5PAg78HcKmJP0SYiRXG0G+Q9AL
 eCBYuK0Hrvn7ljWz9iYQb6lEPv0BCxOQ+m41liTyzp39SBNRl0i9q3oPYb4jn+gpi78D
 VQloootCI7uTy8+IW/EAaTd7orh5nzOo2aUSfeGg+oPxBtp1LyM1xRSqahd4QcaRUcKG
 CzgA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8pTFFYBQf0QaB0i54HIWx3mdmz+hWdnXowu6EAeY97DA2D6JxftZmuBDIVxaQArHXNFWn0eixrnXY=@buildroot.org
X-Gm-Message-State: AOJu0YzmmxQl88fazj8bg2jQxTxmFACcKBwMECpA5qxlqHDaeEP1lgF0
 kTojO0fU74D2Utwnq5PD00H2sJOVkiOnVQM9g1MVnU5P+9euoxeBhy/0NFfpIxc+15U=
X-Gm-Gg: Acq92OFjc648YIAM9hWwYRit1+xEOe7dzgL4FsVww/V7x7V/xBK6UaeL7vi1ArGyPTe
 +7d1cvI+s74PjVGrB4t9giVPyIAuMvNkCIz+/Tt09RYrGt+PxHYUWv1yN3iqT6HidMxK+mnh+YW
 9xL2cpOJunmffmh2svGSKyIx2jsebCYqHNQmDBpYJWMcUAQ4cZ4ymQuiDTBVHtP1dibBrBIAevz
 wDKoEx+QbpHuf8IOOUWSKjAc7A7GetgvC+IwTFskVh+Qrsn80ZO76wW6dPxBmeUZqdAjiqSN0HO
 pC5bxR10tmrnh/fuR4xRc242z0UdUtV9GiBR5joseOX/LL/JvL+WwU/USLPRqgzQQeLRnx692xL
 T3g5V/IMxF2pXrK53hcbxN4PPpmG/OU8vzPIO3i9WkzLDGh4g2zKxym1m46HM/Vkr+KcoKqrsGe
 +Ymbhgr3e/k487FD4=
X-Received: by 2002:a05:600c:8b5b:b0:490:7df7:9190 with SMTP id
 5b1f17b1804b1-490ec49f2bemr25928595e9.8.1781264273337; 
 Fri, 12 Jun 2026 04:37:53 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2c907ddsm142009675e9.6.2026.06.12.04.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:53 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:52 +0200
Message-ID: <20260612113752.252179-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260531202439.1471287-1-romain.naour@smile.fr>
References: <20260531202439.1471287-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264273; x=1781869073; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=maz3nFgc7/TO5RsjR9+XV9YaWdajh9NeFanqgh+yTt4=;
 b=BPQTRnZE7v6QlrDCSGrP0JMWMAK5dzy01CRdRGN1K/hazortYcIIj/s/lWtSJXzZ/o
 6mvx2rNSBhdYVU2RJKhzmNFb8wmKdVOBmrSxKRXS0WraCFGCqd4+OmZDKenpzVq48ejr
 4ObA/g+6nNQCGRdExBVqEFhK7iqBRaXmD8Bc42OgX1A3dwNDaEUMjxdsZHVp6tl+MjgF
 wLOyugseANFzb1HZ2Y3KIjxss4M+pMzWljzuY0hHgC8WwAdT+6Dvgun9gT7O2eZ5wMwv
 +s1fCr9bPe1jv6Tk+DPicDfLuF6xHq65z2X5FSLjymzKEK/Vx8IYfFI0+gnz3JIsq2/k
 W/Ag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BPQTRnZE
Subject: Re: [Buildroot] [PATCH] package/libmodsecurity: needs host-pkgconf
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
> The configure script was regenerated for the 3.0.15 release but it now
> error out if pkg-config is missing.
> 
> Add host-pkgconf in build dependency.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335870 (TestNginxModsecurity)
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libmodsecurity/libmodsecurity.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
> index c06d890979..8920cb012e 100644
> --- a/package/libmodsecurity/libmodsecurity.mk
> +++ b/package/libmodsecurity/libmodsecurity.mk
> @@ -13,7 +13,7 @@ LIBMODSECURITY_LICENSE_FILES = LICENSE
>  LIBMODSECURITY_CPE_ID_VENDOR = trustwave
>  LIBMODSECURITY_CPE_ID_PRODUCT = modsecurity
>  
> -LIBMODSECURITY_DEPENDENCIES = pcre2
> +LIBMODSECURITY_DEPENDENCIES = pcre2 host-pkgconf
>  LIBMODSECURITY_CONF_OPTS = \
>  	--without-pcre \
>  	--with-pcre2="$(STAGING_DIR)/usr" \
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
