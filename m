Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08BECD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B28A6422CB;
	Fri, 29 May 2026 08:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KxAyzCP696GZ; Fri, 29 May 2026 08:29:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 402E2422CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043392;
	bh=Ys+pX5sWOTH8bxwKu9slI2sY9qjzKyZ/Q+8hu/CgqK4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nod9tHEBqYbTigc9fnf2l76VjbtR/Q/bM/rYN8BgVinF0czRDT5sUHF+hDugPEmiq
	 N4Fk5ru7oQ6XQsZkfUBm7DpmgVRhnYlV4bOEOpDZhSThqmsM4saPsfthsoVD2J+W7N
	 CT3JTsxS35YSzaBFtLsVAFpB5NLkYtqHf3GBw52yVk8QNwdF5F/J6XWsNT6rwomzqz
	 0GjBvgWtjfjCJIKK+Mk7NacN9rFD/+ZdkZRQKq8vJtv8Zok7Z54RYxSyGzegQJxLl0
	 OsvQ6j/ZaKgH0DzZ9AcNCYyKo6qazv65eNXUrCmPgdh8e3VyCZXa1uUGBdNJ3AZJsQ
	 gF/qvvLMSlRkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 402E2422CD;
	Fri, 29 May 2026 08:29:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA9F828E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9CA84070D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NgPbdz0vUXVu for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 920FC406F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 920FC406F3
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 920FC406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:48 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4909e3fa4b2so2773065e9.0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043386; x=1780648186;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SECXsSVKBOQQvRua/etw+Lu9whafIwg4tx2bDVOydhc=;
 b=afjRwwlP/5HG1LzppofzFFUjkVpoi2Nir4v6uGAe6NLAwRvp3ZHSE3hgNHlE/lpFHV
 mfjJ+0VsHcgR0g7VZzVOooe4NTu1TTQMNnzSrWCB+RBXo7cMxUeiqD2oSAxBozjqCSSN
 JtHxgYCBjbdTseflNydUubNBpB9XjWgx1oHnrGGSqm1LLKuszNESXxBdrSSezIzlS6xA
 oJvkvb9I96MN9Q3vWRoCX91ifEWbYMYi6x08Uwzolxf9JEWDiXS/WsxvBjWDTuVMDYpR
 97AmVac4ZxnY7899kui2WkyZvtVusv+kzOi2y7g7AD466VhkO5KUDyPRasqmk7OMNm8T
 ch2A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7mJyP7acTCLE0wFP1krMUqS4rMU0bdZIlK3f77P27glesYz/yeUkR4apWA9Ymx1oIAT5qZsvNtKc=@buildroot.org
X-Gm-Message-State: AOJu0Yz+sT0h0gJKkJ4UMdwjCPV9M36ikxtg8S5tJ+dsUCyNXETlqVzK
 fl9LOppQdzosg41dEzDAUH2SxGOwaXbxrRBPJ4/KWucyKZXjBXc163gBSQRinQwRzio=
X-Gm-Gg: Acq92OGzm3ICJpWSwQ05P/mp4eDQYYd64SBXdLn9fWp0uPbVDETQUPq8UhM6r6s6on+
 MB9M0+Hb/zmARp/pcpY00fLC30GewwwcahYv476O1gtoJ60Z1OK5J5yi/VFG8mYaEZ93iO6ohrP
 qxVOCm3SWnLrd/uFkkeZVkxvgIC62/OOJ5FeO7ZaPnOZv6VEOLQYnXX4pI8UMt35e3Kv/c2PtbQ
 WdtLFitjPlfaw4OfFqI3xUr9RXQC/iDdka7YQuxuHa34CeHEiE6Ki3KM5LJm1jUoa81NZ+JRVRy
 r93sQikwHeTtAWUD64E+cIbbcBmjT5ZOQAM9sorVYHBEaAJF72OEwMae78O+/ZzGgObJpJsDUW9
 n/qshZ/R/g5ZHt4enK8HWxc6o5B7XGFl+L9GAWx7CZoWV1X+iUXSAD7SIGEfGQ5cB5OX9p0bHYb
 1KtZDgeyHRnpMVWtpkyV56sbrDUTieRxAvJE0H49EcpuwMpE1VQGgvr6+ZfQ==
X-Received: by 2002:a05:600c:e489:10b0:490:778:4fe4 with SMTP id
 5b1f17b1804b1-4909c0c570bmr24026685e9.26.1780043386510; 
 Fri, 29 May 2026 01:29:46 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909cab0e94sm28678965e9.12.2026.05.29.01.29.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:46 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:45 +0200
Message-ID: <20260529082945.58201-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260524070704.2828646-1-bernd@kuhls.net>
References: <20260524070704.2828646-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043386; x=1780648186; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SECXsSVKBOQQvRua/etw+Lu9whafIwg4tx2bDVOydhc=;
 b=LdRQkUKe4xdwwKiqkrUOVnKpoZCvfwkNUW6zgWCAxNRn/I68VzVYM8A1KfdStPcJJ9
 Vhf7WIccAkIRAKxZYyw3xuqsSjqNMeIHpVT7PHF8DczsE5fWEoBAycLKeMg72LA3lmsm
 WhbKLH/OzVYIzE6qke8+2JXXuxB1UQPj1MKoMLOWqLwxA6mc64pMnEaQxomYi6J8nhky
 Vca4qwlAga95CS8Ji/j7GaRzMK0GPMW8QUt0+xBMftfnGdMS6g1NDsJcFY/P7AlBqa5O
 aIblpd5fAFLLqP5AX9ynfU0CJ8HsLE8Vd1PeesxKoHYvc9QEIjVYkvGg3UbyFrQm4s/C
 nm3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=LdRQkUKe
Subject: Re: [Buildroot] [PATCH 1/1] package/putty: security bump version to
 0.84
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
> https://lists.tartarus.org/pipermail/putty-announce/2026/000042.html
> 
> Updated license hash due to copyright year bump in upstream commit
> 995b63a82bac4f6985958cb92943e807a9f35736. A link to this commit can not
> be provided due to the shutdown of the upstream gitweb interface:
> https://git.tartarus.org/?p=simon/putty.git
> 
> Switched URLs to https.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/putty/Config.in  |  2 +-
>  package/putty/putty.hash | 10 +++++-----
>  package/putty/putty.mk   |  4 ++--
>  3 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/putty/Config.in b/package/putty/Config.in
> index f89283b99a..f0484ec20f 100644
> --- a/package/putty/Config.in
> +++ b/package/putty/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_PUTTY
>  	  and puttygen are built; enable GTK2 or GTK3 for the
>  	  graphical client.
>  
> -	  http://www.chiark.greenend.org.uk/~sgtatham/putty/
> +	  https://www.chiark.greenend.org.uk/~sgtatham/putty/
>  
>  comment "putty needs a toolchain w/ wchar"
>  	depends on BR2_USE_MMU
> diff --git a/package/putty/putty.hash b/package/putty/putty.hash
> index 33a9666bc2..362467e2d7 100644
> --- a/package/putty/putty.hash
> +++ b/package/putty/putty.hash
> @@ -1,7 +1,7 @@
> -# Hashes from: http://the.earth.li/~sgtatham/putty/0.83/{sha1,sha256,sha512}sums
> -sha1  f9fd9ab5e3849bf8c22b218cdb7697dcdd1d8c9e  putty-0.83.tar.gz
> -sha256  718777c13d63d0dff91fe03162bc2a05b4dfc8b0827634cd60b51cefdff631c6  putty-0.83.tar.gz
> -sha512  4781616b7e9c5a779a54e6a8486513e0aa947d4a36e9dbfd4ffc0d32981a5ad4868cddbde0363467236ed67c43f990408a9326d10354954be716a270d587c0a6  putty-0.83.tar.gz
> +# Hashes from: https://the.earth.li/~sgtatham/putty/0.84/{sha1,sha256,sha512}sums
> +sha1  d3ed01106667b42de322b266266e0d21b70adf12  putty-0.84.tar.gz
> +sha256  06057862ae198f1dbd219d0c7493080d59f606194bb5056c549e342aa01b69fe  putty-0.84.tar.gz
> +sha512  647c84490c01f8c0f9cf02f565081d80ea2ea4fb90207cfb2fbe13ba5e8c3cea7c4807504363d3d3a851df5edb6087c3b39084820bf20e818dd551db54af0765  putty-0.84.tar.gz
>  
>  # Locally calculated
> -sha256  c18aac5045fd30bff639b07884be44cb8c68eef16efe8c5e18deda1f58cacdfb  LICENCE
> +sha256  3b02f87e0063430289d9681727a98818c844fc8a4d79b24b76047fa061e77f13  LICENCE
> diff --git a/package/putty/putty.mk b/package/putty/putty.mk
> index 9071fea208..82b16b250c 100644
> --- a/package/putty/putty.mk
> +++ b/package/putty/putty.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -PUTTY_VERSION = 0.83
> -PUTTY_SITE = http://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
> +PUTTY_VERSION = 0.84
> +PUTTY_SITE = https://the.earth.li/~sgtatham/putty/$(PUTTY_VERSION)
>  PUTTY_LICENSE = MIT
>  PUTTY_LICENSE_FILES = LICENCE
>  PUTTY_CPE_ID_VENDOR = putty
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
