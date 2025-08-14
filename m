Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED1B4CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:31:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C01DE80E06;
	Thu, 14 Aug 2025 20:31:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ey2AyyjEM9CL; Thu, 14 Aug 2025 20:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3089680DC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3089680DC3;
	Thu, 14 Aug 2025 20:31:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EEB11BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8265B60767
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9aN8O-HKR9Q for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FC6960760
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC6960760
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FC6960760
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:33 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b098f43so8908165e9.2
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203491; x=1755808291;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BAbX8wDNVBtxyRO4wxQRhadXiMZB2EJrj2HdxPp5aGM=;
 b=k3HpSUbbeUe/+ocZosyTFjuPqegqk0UwyquhcoWbuk1sF6v0Y4jL6lFbB7qjNillsn
 AX8EdgnRDzYc+kzaDBHmKGC7iS77t2iFkByg9lGY3wYt6SXR0M1r+RG62l2aksNbHby4
 ELkhxMNpMDDSMUQUL+EvsTb7ilJQ1JV8gXneglnTv5ByJAdN6sejtuM8FYP9hkDDuXdP
 DURTbUVuZN9MUnV4vFwR2iTNYb5m2uw7dFxle+bgxpNa5tfqTtfkw07gYDIjbnjMmf5c
 F1Kb93AVu8LiYQptcjmvWyFP+aLSta8VnAddidhRyADaobs5ixH/5RKiRlL+/OEIJJe6
 iDGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXxXe1S32n+vn95MVuDUUYUip+vuMwRB3djW0bPMvLwDUgHCePk53PxTmCEhcbQ3HtHIb2tmsRFvQ=@buildroot.org
X-Gm-Message-State: AOJu0YweHSlXIvXxeIwMF8jCSNch+pFnAzSBArUZnx+jbEU8BXjqx6hu
 /SModCQE/W4NNhzlAqDGGq9qUsYFueriXilChwrLgofP4nhnXach45RoyVIbz/x9oJl+z4Di+sP
 1vtJwi2E=
X-Gm-Gg: ASbGncumgrk6i59wul7+HuieVlACQayjO0XXwdGaaxqq620ATDYVAui103lly68aF9l
 N/cNztFAT9HjEasOcn7TF6AwCNJFzrbQXTxmdV0ALwipXGrGg0wV4mb4rCHma1I+CWG097kelBL
 Z87z23ooaG4vAbK7EwGWLDas6JnrPkLui8y2Ppt64PlujU8xxlSMHgb9shasMCP43aheg6SULP1
 ALRStc5/XBFMBcTN0AtsH9Mbt87XU3E5+ZvmXZE9YsPVGRktZVPX0KD1IVWn+skBpqQXxGXO4TA
 VihdKBc0nLDdovj9xm8kPvnPDNJacMoQchcRjJS7JKSgGOKdNS8+9c61acxDW5po8Ol2cOljTLU
 kZwBtytYaWFP7nWHhrStl9S5y
X-Google-Smtp-Source: AGHT+IF5TRR8HRR/OXeWFCwilsb7oa4AyKC+foMvEBM/NHSluiEcMq+fek0Zxi4YtrU4UnJhjxg58A==
X-Received: by 2002:a05:600c:4fcf:b0:458:6733:fb5c with SMTP id
 5b1f17b1804b1-45a1b66f072mr30309635e9.28.1755203491399; 
 Thu, 14 Aug 2025 13:31:31 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c76e672sm35630655e9.20.2025.08.14.13.31.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:31 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:30 +0200
Message-ID: <20250814203130.2815056-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806122510.3950409-1-peter@korsgaard.com>
References: <20250806122510.3950409-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203491; x=1755808291; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BAbX8wDNVBtxyRO4wxQRhadXiMZB2EJrj2HdxPp5aGM=;
 b=Sb9RRW6FXARQs3ZfWiIGk3dIIjjrjZf0uSHD1b3LAiUcZICQ2Vrn7hANRgF21vOGFR
 6IPU5wkJvFMJnD6Wio11aefNEJ+TG3mIfm5vzoeX6adA/7dMfbxyKNbTXDBCZ3F8PbjO
 Dyn9csBEQzgEg0GtUBf7wtlzdigks8pn+AC/F92Q5uwZDfG0F+fCc+/fcFQUVlFVtG6F
 oiiOFCQhpW9OupNSnId5/XSwsSsiqpiJjM5ond8Z17JMkbumr4DvoRHveVYrchDI2ARw
 AnV2iCzqcvL/0tOfHHX6mbAKJn/pF1Y2E09GZuQ60fBor2FUloroTeFQDCY3BOFPMSH6
 PKkw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Sb9RRW6F
Subject: Re: [Buildroot] [PATCH] package/libopenssl: bump version to 3.5.2
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
> Bugfix release:
> 
> - Miscellaneous minor bug fixes.
> 
> - The FIPS provider now performs a PCT on key import for RSA, EC and ECX.
>   This is mandated by FIPS 140-3 IG 10.3.A additional comment 1.
> 
> https://github.com/openssl/openssl/releases/tag/openssl-3.5.2
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.05.x. Thanks

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index 1675d72fb2..7f3795e1ac 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/openssl/openssl/releases/download/openssl-3.5.1/openssl-3.5.1.tar.gz.sha256
> -sha256  529043b15cffa5f36077a4d0af83f3de399807181d607441d734196d889b641f  openssl-3.5.1.tar.gz
> +# From https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz.sha256
> +sha256  c53a47e5e441c930c3928cf7bf6fb00e5d129b630e0aa873b08258656e7345ec  openssl-3.5.2.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index f3521b3cf3..38d04ea924 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.5.1
> +LIBOPENSSL_VERSION = 3.5.2
>  LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
