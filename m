Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB71FF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56EE841C1F;
	Mon,  4 May 2026 14:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EFa4O5tSwIk2; Mon,  4 May 2026 14:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 630D641C22
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906080;
	bh=CKhz3NejMYg3x+0Es7WCa7SQufxuT3bp/5DAf0K/PR4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j/P9mnl4hvivX27gnDM459j0U439XiR0Yext+0qfcpG6qotOtHL56z8aM0rqRkyGm
	 4vsu8qaglHaKK5X+RCk9dKJNhdAtVy6u/Yh8rMonZe2MMl2CcJiTeLAFbsqTMhUhGo
	 +gtwk7BlxYc5K07lf46UlX2KSA9GoNh84hZh/4O870N4ADILlv+qmV24PkLyg2g2hy
	 Gun3MeYwVfNZhPfjd+9xw4/CBR7Kc17Se/5GP2MIv2zNF4GOZkQNwMy8QUbiMoF+Xz
	 RlWuehvY6qsxz1XMINMbBsRVOr3nTMhER6ZZWutR1HqK/mGPD481WFem3ZlYo7aZTb
	 Pb9KxIohlh95w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630D641C22;
	Mon,  4 May 2026 14:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EDAE190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C606740B70
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njJdgL22mx4z for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:47:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BAB8B4079C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BAB8B4079C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAB8B4079C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:47:55 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b0046078so34221965e9.1
 for <buildroot@buildroot.org>; Mon, 04 May 2026 07:47:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777906074; x=1778510874;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Ifh5gzOWreLJjQdGHiL1gDj77+7l1hdptzvI/6jd46s=;
 b=nJ3zt47NosGX3SzZt0Wrixa3jmoKZI4GQapJdgb4xqe6HU2lp7hjziJoTZMdZ/EpKT
 +yXpousG89aAkX+gtG4R7JxYB0iDmyUnlM6hjo2vDU4UHgDF2/SsAEOlrhRIJpQRraUY
 K3ivDqQaARMbiJ/TqgUehFHTnnfIy29IGZRBWgrQR71RTHqZ0q2j8lvEWdhE7vgQZ+tC
 CnUMjxSG+dVL/YsuHM5ehBsVaMqYVHhUviWhkW+k3WFisKDFa3lls7POL1FSy7AceO3n
 twXkWx2WKYutZnvlmD2+SIkPq0UVUKEcmh/Gcbdvm/OKXHOUwHhZKgpXzMb3PCDOkw8o
 ncEQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9eYDpht/Uz2Ktjkc9eKkan9JlB81YZoh16nEOenOBY2Fbf7Iw0HOW7hXpmMg6YVqVCB9LQYGh4SNE=@buildroot.org
X-Gm-Message-State: AOJu0YwsjFFVYeQ0J9hubCrG7FAcncmPVyWKdNG9Dyi1mXeIzho+6YKy
 d4fqInaiTH/nrmJBbex16BYs6w2QKqvH5mFhHLUko+uKIipHl6EHE+IN78wSbPscYtQ=
X-Gm-Gg: AeBDiesROA96Sjd6i+PFfYYw+6SKtJQmBBVfDEEFFRIQ3kiHKiMydp+xA22//FLom/6
 5F1vL5CGJ1CrCOR6JDRbgdhktVa3NU6ADbkbraWYp/K8EUYphmqz7zlNYku1da1I1uxKWpEAY4d
 2Hz0HB/tP7uW4EZDdbEiJDk0wIWHIN6B57aG53T+lCNu6kTIh5d/uqZRRhMu0mx+RMPBfYIKacg
 mKvLKtjR+rfxiRiG7g5emjc+pOrK4RmMy5RKUGkTEOhrnWFvCA8nV8p61z0MBHzL9d09rzr4vrm
 NsXLkdkpr4UKlbgggyKV7rShzfQgFnrmk35EqFloavNZkxHhFsgBfTpbnzYekqMetMBTCtm+RG0
 jJ1TdiCmNjQBg2psygQgJh0HzqEzE1WfwIE6grenfSV7TbUKAAGtI+s7RTWKUaU9/nTJ5be3pIw
 n7CFoBrqUvYkRP4ybABwxam+LAmg==
X-Received: by 2002:a05:600c:c0c5:b0:488:a977:8de with SMTP id
 5b1f17b1804b1-48a9865e95bmr127734275e9.16.1777906073657; 
 Mon, 04 May 2026 07:47:53 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a8eba8487sm273389785e9.11.2026.05.04.07.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2026 07:47:53 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  4 May 2026 16:47:52 +0200
Message-ID: <20260504144752.10713-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260426144339.1530435-1-bernd@kuhls.net>
References: <20260426144339.1530435-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777906074; x=1778510874; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ifh5gzOWreLJjQdGHiL1gDj77+7l1hdptzvI/6jd46s=;
 b=B3CUCpSEQk89Hoaa1FPTpjpgXpJsHBoPZNfP1qPEJvgM+ier9mB109yeRGoCYvrsvK
 /9NkCw9gExlk4H0hcArkBtDA685x2TliECX1CfmW4NjH0whEjphmvi6A8eUxKN8NNoh9
 juZfVnBBnw4EJ5EB5wqmTOnEdmR23AfUIfibnEemcNJ6Q+yKd8hH5WTOteo4XVWvwZJN
 mB4VXPTp0IFJco7B8kSayspu1s/UEb5S3axlR/uoQPefc9c4NPqoRTJOD2QCFClmoseJ
 EmVcEbwzYz3CsurpKbPPmsJuAtGp/4EEYOCqKOxojn3Jl0k60qdL4+2jirQXP3bMmpK9
 /nhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B3CUCpSE
Subject: Re: [Buildroot] [PATCH 1/1] package/sudo: bump version to 1.9.17p2
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
> https://github.com/sudo-project/sudo/blob/v1.9.17p2/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/sudo/sudo.hash | 2 +-
>  package/sudo/sudo.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sudo/sudo.hash b/package/sudo/sudo.hash
> index 3bbce74cbc..340d155346 100644
> --- a/package/sudo/sudo.hash
> +++ b/package/sudo/sudo.hash
> @@ -1,4 +1,4 @@
>  # From: https://www.sudo.ws/getting/download/
> -sha256  ff607ea717072197738a78f778692cd6df9a7e3e404565f51de063ca27455d32  sudo-1.9.17p1.tar.gz
> +sha256  4a38a1ab3adb1199257edc2a7c4a2bd714665eb605b04368843b06dada2cfcfb  sudo-1.9.17p2.tar.gz
>  # Locally calculated
>  sha256  41eb34d6b184c2638d6d32c6e7f70b8dd6423e68b91da959e0cf773aa01f62d7  LICENSE.md
> diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
> index 0aacd8207d..8602e62b0b 100644
> --- a/package/sudo/sudo.mk
> +++ b/package/sudo/sudo.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  SUDO_VERSION_MAJOR = 1.9.17
> -SUDO_VERSION_MINOR = p1
> +SUDO_VERSION_MINOR = p2
>  SUDO_VERSION = $(SUDO_VERSION_MAJOR)$(SUDO_VERSION_MINOR)
>  SUDO_SITE = https://www.sudo.ws/sudo/dist
>  SUDO_LICENSE = ISC, BSD-3-Clause
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
