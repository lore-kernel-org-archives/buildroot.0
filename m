Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9554C54F54
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1458410D6;
	Fri, 31 Jul 2026 12:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HpbAo9_WZDNA; Fri, 31 Jul 2026 12:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBA84410E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785500530;
	bh=wn7q3lJ+x9U8kqbM65XrggA9TDIjuSnTVV/SNaosoAc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mWETIb6Ysmo0zHg4+FcD8CX1pp1C0aX7Q1Kb5b1FyxJPSRivWGudURJbo50pBRwwn
	 jE2tOUq/6KEGmr4hxVaoC6xq9/DKzDm5p4/O8LyXYNf1v+0shIhORp2kVj1TtsTNRb
	 4UvFEi4FjJECgxzzt6Ab22oua+Pz2rr0vKqGN3QmpI4oAghLbkHA/aZO+JvCsZKdKW
	 Ao8Mwc8AGtxnOJELWFshAjiVgbOdjOuxczuAXtoQymnsYqCbKgwopaXZlAQxhukZUS
	 csM7420MAKVL0G9xLKKynMtlU6DoAQU50xfT6FBHgyQRWThygpc/wa5qZT7uOKXqhD
	 jPr6HH81jUIEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBA84410E3;
	Fri, 31 Jul 2026 12:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2353036E
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09E33410E3
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w-xbZRPkv-Cg for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0C9D9410C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C9D9410C4
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C9D9410C4
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:22:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47f93b2fe4cso584307f8f.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:22:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785500525; x=1786105325;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e8MsNMdXhVERP20GlmK6iaTZz0WrjB4ndraBn1IPfTQ=;
 b=SSgg9W/nGIcPzimavUj9OKvKH2M6I1jHJrOURZ9FZyKg6dTQ5UzvVW4pUo4+57xZ7l
 bVkp5lUb8BQXRQAn/vtPm0qtyCoiM1PX4/f1jpJayggeu83ulX4gpMW0KEg6u7QkNwV7
 6qMPLUN802QnEsS7G5hRwcKlrx23q/tKpmLQzHI6XQtOt97mW8J9NsaoVnvfwxsgSqnc
 SYayztPx+GGwLA1/yQJm+69T5gXDTFrCtve8NYJHB5wmR2kPsfsPT+Mrd7GC8xUAjpfr
 8405Zm7llycuWTaIQlFhJKqg+ZJNoEDxrU6+xzoqoVK7XakMSkmAxQKJNUyHMFJXYY4X
 qslA==
X-Forwarded-Encrypted: i=1;
 AHgh+RpCmj3+szFwNHJ7w8iLAW1Ik7pSt3VimjpM/WYX1G2YAsX2jua9qwayiYTOpKZ0zUESptdaiZRbaGk=@buildroot.org
X-Gm-Message-State: AOJu0Yww/v92GZImtGH4DhgatHFXmBc22Ayqez5YEq48Ijdc6A2uBS0N
 7HfdM98QJulIsla081eAf3fDS/Ze8vyGhhF9dmKXG4zMn4dhYMWp87ZptcJODtt/IjREycQe6xK
 m0Ktg
X-Gm-Gg: AR+sD12gojsLzWJUuqud8nspPg4WYaYafImmngi1uH/SckAb4o4lB3shlTz7WR8hah3
 WONhRPXXB+cxSDbIL3Odw5ZsuVye0T4jTEj/A5EDOyhvDh9fQbsFM0/AP6qn+iWD/rHmBTqp0if
 qgVbuDdlMI89Ey5b+OBIWdRR7Pmf9IQWpZfw+tiny/qOn0acUnKvOMIreMZS/VNQHhzjDEmM9b9
 4QD6Ss8DtKgkIkX2MOmloJVT8qICzrCuGwNrDdx9DOdhNxFLn0w6lsIkhLhS4ONXhqb/BRFrnED
 /CPKeu5ZSsOJgioGwAgdD9GyXCscEp7GZINIJBzHJEdDakpZ5Thf7GLoMhmOK7JAJ5XpzrJW4ty
 7ZRFUIUEgqHBCDf29IcFSW+bCrQXoXQKvGaNLOPRJQNWFwBXS5HW/bMhwhUBupWxa5gUEppQEEN
 iyGF8obPed1Awehj/0PhIUBHSM1YHsYnppbv+Q/GyOHMCsolRiXt0YFwPyIxLigFv95y197UEkU
 LTxd1QWLDUOiqRqOyVkIA==
X-Received: by 2002:a05:6000:2408:b0:47f:8817:eb7c with SMTP id
 ffacd0b85a97d-47fd2b55221mr4168256f8f.42.1785500524827; 
 Fri, 31 Jul 2026 05:22:04 -0700 (PDT)
Received: from arch (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd458bb4esm4701327f8f.30.2026.07.31.05.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:22:04 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:22:04 +0200
Message-ID: <20260731122204.155764-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260724172400.319609-1-bernd@kuhls.net>
References: <20260724172400.319609-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785500525; x=1786105325; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e8MsNMdXhVERP20GlmK6iaTZz0WrjB4ndraBn1IPfTQ=;
 b=OzvLcTm17eJkoP+q7G/s8Hkdgm7qjGrMCzPTCLV0wj8FJckUryuPa9BU5sGBM6NTv4
 HZKk5BbQZiwzhdNTPC8xSO9y7G1LHOcnz0xmchK5eVz8quiSrjZG6txzEFiBuZKWLoph
 1/TnlWHxbHhZQq/uo0dr/c+lMNeEDAGrIOfxMR7b7TKuZ3rhI37nO0JtIUKBOiFGKe0d
 qSLQH/GEG/gwiJGx4lWl1J/B+Ggyww/WX9wOuYKqQv7U3lL13/YVCu+oczRGmMERZgMc
 IQhb04HIy+jBe96thlO6zZEfX7tLrmEMG0YMeU7SfC9jY9s6twtERORfMkKOXfKsgiTu
 DB9g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OzvLcTm1
Subject: Re: [Buildroot] [PATCH 1/1] package/libass: security bump version
 to 0.17.5
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
> https://github.com/libass/libass/releases/tag/0.17.5
> 
> Fixes CVE-2026-61626 & CVE-2026-61627.
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/9ccb7989abf5ef6cc74c643bcd8aedf81bdc1c50
> 
>  package/libass/libass.hash | 3 ++-
>  package/libass/libass.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libass/libass.hash b/package/libass/libass.hash
> index 2f4f718813..467c9b3816 100644
> --- a/package/libass/libass.hash
> +++ b/package/libass/libass.hash
> @@ -1,3 +1,4 @@
> +# From https://github.com/libass/libass/releases/tag/0.17.5
> +sha256  2dca25c0e0c837ddf00b52011b3f82cac1e4ddd3ad018227806b0c2288864acc  libass-0.17.5.tar.xz
>  # Locally computed
> -sha256  78f1179b838d025e9c26e8fef33f8092f65611444ffa1bfc0cfac6a33511a05a  libass-0.17.4.tar.xz
>  sha256  f7e30699d02798351e7f839e3d3bfeb29ce65e44efa7735c225464c4fd7dfe9c  COPYING
> diff --git a/package/libass/libass.mk b/package/libass/libass.mk
> index ff42c6d621..3675a75f93 100644
> --- a/package/libass/libass.mk
> +++ b/package/libass/libass.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBASS_VERSION = 0.17.4
> +LIBASS_VERSION = 0.17.5
>  LIBASS_SOURCE = libass-$(LIBASS_VERSION).tar.xz
>  # Do not use the github helper here, the generated tarball is *NOT*
>  # the same as the one uploaded by upstream for the release.
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
