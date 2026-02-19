Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DEA3E9A055
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52F57811EE;
	Thu, 19 Feb 2026 17:26:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDxAil94xJsl; Thu, 19 Feb 2026 17:26:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ABD783BA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771522008;
	bh=k7is+KH3iyJpRM4Ocf39oS9XRKwCNMxjrb9msfQtU2I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HRfduIStpIItIZEZBZm/l0Eabj1g3q0067foJSqGtJNw9Bwo4ujA0YikZSy8+Ezi0
	 cJDtUwlEOh/zNpKlGM6sNPZTZ7D0IUoh+W9Ep8OBBX4uLjG1SJlVD5vFbjk6ZyOFjU
	 6/aqxzGZwoWcvGvTVaDK1M64LCRxEOd1Ti8o1u5tep7KaCvfWufoXMhoeP8KEo3gwl
	 pwX0cn66393d9yDBLa0L/DJ68uavYflLk8CMQEjGN4bwTXztzPdryo/qNC2kn9jvRC
	 Eq4gL6iGoKFShGm3ume74RckuZv0mkq/A+vKVm9nmqsXJKwTGaC3NpBnLxrbCnbUFZ
	 K+spzeRhD3YBg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ABD783BA0;
	Thu, 19 Feb 2026 17:26:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 799151CE
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B9A04045B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKE_dtMFE5z2 for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 460964083B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 460964083B
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 460964083B
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:26:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4836f363ad2so12579615e9.1
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 09:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771521997; x=1772126797;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ifKP/ny9MCaoe7/F0YYymkM7t2lVhwHUk+h7yYy4Suk=;
 b=Qn1tSIdx3ayDZEP+DACuV6MH0C3b8oGcjQRmZI3lhfh7Z+PXAMF0ow6tJ4nkzxVMQF
 h6Lm2yr3ufK4r5LMyuXUREk1nleLvPiiH2jvxV3z3O7xRwT7g6GqvOm+pXg6o5r3IQCn
 f2LzRkV5WGyYQdZR976sGTENJjNIAaJthnXp5whVDurRlG4B5qIWD4ZhkpfAvJUuHED8
 0+jbCYsz0F4dIp3XBQkdpiZXUxrvEfEXZffcZPAzKP49PkrswUHQvNpCwwMXeqS5Qi84
 s5hX2RH7amiqr3pR/Dp0fRSVPt0QxQVn3X/a2pCKAESDzKPdhNhaVYpssx49S00Pyw0L
 D9/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWAxoJlfapWvhkURUoVA1CSjHhpLAN8PZWJhFncBPyNNTgoRXkLI68/ykbUPH2IbGH8f82uMkTRSy4=@buildroot.org
X-Gm-Message-State: AOJu0Yybcryni8cadXB5i1VxvWuKnEgr57bC2fhgp1lC0Rypi9vgwX8u
 bH49TGb6YE6f3YvJ7m16ZN8mUiop/ZZhSONtLt1sHNbgdqwiYCRoJ57XBFkZZ+6alaA2GyPcp3u
 MU+QX
X-Gm-Gg: AZuq6aJULJ1Vy59rcBC/98p7ogJwkwUFAlv+2RqCOKJ0QfsXIBTa7bn8i6yWiboxAmO
 xuZZE5LhxITQM/Eo/iqk9MdhvVa+IdozBR/RZDlDxw73qxLy730OF9uw+15j8nXukiKVKKfkQVb
 y7IBbV5OzKfIlONpbSb4ZdrV6g7gFuA8FpGHhNb7lJwxLOlF8vu6KABn4rSFj18wOvyygnL+/eB
 R+9Ilu3KIgc6O7GNuQHgIngv+HMjov4qG/cTeNdIwKsu4fSz0mEBRIfPT2aziirITQRqLSewxEZ
 Qx59BoFQZsenoy2x4zUgzjtorq/XEuj6m9upepr2UzOhk4TLNYvCL6U2IaTunV+nBQ2FGpm4hWp
 uLxYB8epGRjGiWnVVAB7KJHwVMiPetvBa53h0fKzDulCbp8EYvnENca85q3jQDyqvqOlECwfuwk
 tKkJRARmcdoFSajh4=
X-Received: by 2002:a05:600c:4686:b0:477:b0b9:3129 with SMTP id
 5b1f17b1804b1-483739ff981mr381263115e9.3.1771521997250; 
 Thu, 19 Feb 2026 09:26:37 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a31efe02sm15373245e9.10.2026.02.19.09.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 09:26:37 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Feb 2026 18:26:36 +0100
Message-ID: <20260219172636.341069-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260212192740.1895472-1-bernd@kuhls.net>
References: <20260212192740.1895472-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771521997; x=1772126797; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifKP/ny9MCaoe7/F0YYymkM7t2lVhwHUk+h7yYy4Suk=;
 b=BnKTlU2jIjULNQXy4h/IEMSF6X2B10KiF3muuYTSxobGX/k1e+eu01qLHotJlKOZPi
 nLLybXtjB7Xd2xSyEDJObIKG9wYy/AVWyKhj6v6+FHGtV4qWfHTk/VQJMZnwYkd9W/7W
 5IyUGZWJUCVraw9SYfFDvIWB9EIjsN2sWSFRBJlgELq7mMSVqA0Q+pRu+PccTJZRlaPb
 pHXwLSJslfSsxCiB1dkvTyrgtqC1jU35Z9k5WltiAKUBdcAjAZXH15xaxM5RIqYLWIsJ
 OZIIIEMATax8zOFOY2Tc/POXNQ6mTdoyUfwBqeRA3g2HB0opBNZ4bPEiBh+3XzAshluo
 IjMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BnKTlU2j
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.9.5
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
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.5/ReleaseNotes
> 
> Updated license hash due to upstream commit:
> https://gitlab.torproject.org/tpo/core/tor/-/commit/2b0be077600beb95066ffa5f06094eeca906851a
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/tor/tor.hash | 6 +++---
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index eeafd49058..a4b0af12b5 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.8.22.tar.gz.sha256sum
> -sha256  c88620d9278a279e3d227ff60975b84aa41359211f8ecff686019923b9929332  tor-0.4.8.22.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.5.tar.gz.sha256sum
> +sha256  c949c2f86b348e64891976f6b1e49c177655b23df97193049bf1b8cd3099e179  tor-0.4.9.5.tar.gz
>  # Locally computed
> -sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
> +sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index c0785ef2b1..36be7967bf 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.8.22
> +TOR_VERSION = 0.4.9.5
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
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
