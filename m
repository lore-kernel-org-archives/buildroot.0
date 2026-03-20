Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE7610987A1
	for <buildroot@archiver.kernel.org>; Fri, 20 Mar 2026 15:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD99C84880;
	Fri, 20 Mar 2026 15:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tq_003S4nAkW; Fri, 20 Mar 2026 15:55:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1C2984898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774022123;
	bh=e0kDx9lCcx5OoflkqL1OOGKxcuM+HJ84QhBdffezql4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bR7qFRIDTJ8ANZup0nfetFwOIOHgsA9DnUNvz5tkAtbw9k9WSzaTqboPTO1K0WM71
	 dcUVZd5UjVOHgCx0S6ONaX0Oj9lrJxrPkMzD5rh/kl7NtQvu4L/O4HmBqjQ1kuWXUa
	 I11PKUmiiUM9Nk8ZulerIXfdb1NGJhw7bPIb6l3edx+bjn7k/7wDNa4T1jdLXev6AJ
	 Nm0TZXf0vD3vcN58gtPs4tqe6X4HiMo1RoSE4EMCjW/GLOAqtCa/5sW56Ucuwk2/gT
	 UfGoSm+jUrKhaIluq3IfywLOc61SBfCmCYx70i87EKUSC2bBYOTlLqnmWD2Y2H8TQg
	 EOlg+SS0FzbXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C2984898;
	Fri, 20 Mar 2026 15:55:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E90B1B6
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 055A8414E4
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jN3G7A4h_Cur for <buildroot@buildroot.org>;
 Fri, 20 Mar 2026 15:55:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0CD5140139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CD5140139
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CD5140139
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 15:55:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48374014a77so19862135e9.3
 for <buildroot@buildroot.org>; Fri, 20 Mar 2026 08:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774022113; x=1774626913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GSWwzSJ4BIF8TR8piFQt+aGDeD5ucn2qe71YQ1WwpAU=;
 b=ikEC68l0jDg2uL9+24f13RB6EbYkXffpclKS7jmNdbvSwnfkSWIrJftNFwI8dlMago
 RGd33EX5vboTG0WHXMXpjYhQAT7sRTkSdO4atK5q7kzXv8sya0N5JRLNBiKXf1528IsV
 P6dzR11CPiy7RVOIO7A21GlVCZ8wD+NOD/yRcOcRowj7bYqbCHPy1+q+mQ1tPKw3uO93
 qxMrIuxYXuhkLkMeoiotVAq4cVeop/z7oYv8BJjhbFONhHpjpwyTX1Jvxs+7sR+5Ub3L
 h06yWgZ4IyedN1UGMHmDN01woLEeYNDZwIMbWuY/+B8GL9VBrmdxYhuOa1uRJgcvID5T
 fMrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3RwDmyjJ6J6eaLBeHCg/FIZDWHBTV7IJLB3eXJLZxN33AhjOM4OzHTlto22iL4p4Zm8MNCyhfFLc=@buildroot.org
X-Gm-Message-State: AOJu0YynYF2ykZaqdZaNZ+7Yp3V7LSXgMikmmoDSPk3OY9gU6iWBcjZN
 8gmiRa54ujSSOUgqV+hRuqL0yABiaLNGMgxzA0pR80now8Aq6vlUtA4Cjgi7X5q5Gt64Rw/33Nj
 yh2019Xs=
X-Gm-Gg: ATEYQzysNwfFkjHlUz1xSHzO1ckow0zLN0T0RhWdwSx1oCJD8047W8ok8qLIczZrMhW
 wu9OBagItbYIwxZX2C0IZ5kK7fBYuoJ1fPEvtiIZr0GhrXUJ4v0aTWWiX+4JD/4Tkfa2DOAmAL/
 tQlk8FKRBR+x4lpu49eNJRlR/gRN5YL12+2NIYz4JZcIWTwKr4Ph/f9wA13xc4QZVXYQ4FLvYEi
 /l25c/CVIH2peVFnQQ2TvZ+EzLEZ/rryK0v4/OS959X9w6FfuVE1cd7y9iDHOUpNrTfbeJvX0Z8
 8wmFY/M4hQxK6CZuVMXC9HfKSGuZNkeyqi/kxYBh3Hb2lhsnMry/Q/GiPjGEiYpvMx+JHc4SwZL
 eHtKBwcavjSvtpH0gfYBXlz4mbCjInqCckg1uJb7k0JXt/n2+NlxIU40kcf4bLbQmgwcpDIbmkw
 OaCxyrHN32bL2rqLlj
X-Received: by 2002:a05:600c:3490:b0:487:300:d9ca with SMTP id
 5b1f17b1804b1-4870300db54mr7122965e9.31.1774022112988; 
 Fri, 20 Mar 2026 08:55:12 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486ff1d35cfsm17750455e9.31.2026.03.20.08.55.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 08:55:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 20 Mar 2026 16:55:12 +0100
Message-ID: <20260320155512.176951-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260312164456.3185719-2-bernd@kuhls.net>
References: <20260312164456.3185719-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774022113; x=1774626913; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GSWwzSJ4BIF8TR8piFQt+aGDeD5ucn2qe71YQ1WwpAU=;
 b=YWf9Bc2mPAaxOMRNLce/oMU9VV6KyzDFkHBAqiwbE+eO5wrAgjwYSRTp3JJMpLHUUE
 bFWBZwjaCUAujE3tyAM393w/K7z9seEFk+pBTnRQIUHo5hEq95RU+4liTAT9kxY9YGsH
 9gOHFNQupb7CjdzFC/Ck9PvDn31Vq2bJW7v8jP12KY9XxFf/biFgyGyP/domovUMtd7G
 How+zcYfuoX2EEITPlcsk2QVaIKWEwuR5ilFn5gzr41vT7Iv4O6NBgkVYI+XVDS6f/Us
 KP+9v/TjIElChd1fiW4qblUOPrK93+PwWklMtSWYHPbZcSfdhAJX4yPxL2eU+/72AZsD
 hWPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YWf9Bc2m
Subject: Re: [Buildroot] [PATCH 2/2] package/libcurl: security bump to
 version 8.19.0
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
> https://curl.se/ch/8.19.0.html
> https://curl.se/docs/security.html
> 
> Fixes the following CVEs:
> 
> CVE-2026-3805: use after free in SMB connection reuse
> CVE-2026-3784: wrong proxy connection reuse with credentials
> CVE-2026-3783: token leak with redirect and netrc
> CVE-2026-1965: bad reuse of HTTP Negotiate connection
> 
> Switch to sha256 tarball hash provided by upstream.
> 
> Updated license hash due to copyright year bump:
> https://github.com/curl/curl/commit/e83c82f05f9b714086e62db9fe2ea9be522239bc
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libcurl/libcurl.hash | 9 ++++-----
>  package/libcurl/libcurl.mk   | 2 +-
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
> index de3f2402e9..5aec080ef9 100644
> --- a/package/libcurl/libcurl.hash
> +++ b/package/libcurl/libcurl.hash
> @@ -1,5 +1,4 @@
> -# Locally calculated after checking pgp signature
> -# https://curl.se/download/curl-8.18.0.tar.xz.asc
> -# signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
> -sha256  40df79166e74aa20149365e11ee4c798a46ad57c34e4f68fd13100e2c9a91946  curl-8.18.0.tar.xz
> -sha256  e18f1989333b70044b2adfb7dc2f905d0119dbdcac3bc9f4bc9d540e3a29de5b  COPYING
> +# From https://github.com/curl/curl/releases/tag/curl-8_19_0
> +sha256  4eb41489790d19e190d7ac7e18e82857cdd68af8f4e66b292ced562d333f11df  curl-8.19.0.tar.xz
> +# Locally computed
> +sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 7ebf26c3b1..3d00a4a33a 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBCURL_VERSION = 8.18.0
> +LIBCURL_VERSION = 8.19.0
>  LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
>  LIBCURL_SITE = https://curl.se/download
>  LIBCURL_DEPENDENCIES = host-pkgconf \
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
