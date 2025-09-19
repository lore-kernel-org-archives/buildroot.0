Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F15CAC592
	for <buildroot@archiver.kernel.org>; Fri, 19 Sep 2025 13:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2902C822F3;
	Fri, 19 Sep 2025 13:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ek61O3mTbwn2; Fri, 19 Sep 2025 13:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33FA782503
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33FA782503;
	Fri, 19 Sep 2025 13:01:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C667D7F
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E86840E0D
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jH_CzGgJX0Vs for <buildroot@buildroot.org>;
 Fri, 19 Sep 2025 13:01:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3DC5940DF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC5940DF1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DC5940DF1
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 13:01:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3ece0e4c5faso2537844f8f.1
 for <buildroot@buildroot.org>; Fri, 19 Sep 2025 06:01:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758286909; x=1758891709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zPS+uFQeedKKO59yfyODXBG6aNA7Sy03hc0BLdecfO0=;
 b=PdM75dUbHJvEtHruirhUmczkQrerTozH8HWsZpEwudh9stqstfGPWzjBx/+WqMHv5j
 YVEdVVKkqE9jdz1geQVf7KsLip9icAShxTgjnLvz60++dVYm+VNbW/p5oLfeM3GcNt7q
 jn+cDGA4iR40agiUFcU86+2ZBuROc5xDszDq8hgFwss7vcL0zhsYJV2spQWKVVOe3G7y
 4T7MLtY+HhDVJWxIaI1ePkPc+We4q1MvxrlH11/ZQMibzmILzoyDdQskQq9TZZgXUy+t
 OPdjhTDSwnpsvkuD9lVe0UICLzfmPhTM9jYI3Cge8x/bntEQyFB3wXAQ3NDJy5qQz5CX
 JAew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUszmm4LOv2rSKqGoJP+4FLRoJQPCnR04JJfoHpVnS6TrkPp0Q0/NjY2GyGf6RZ7Y4OzJpOBU/13Og=@buildroot.org
X-Gm-Message-State: AOJu0YzbuOn0YSeXYm2I7v2jT6PcZSKcyiZJ9Q9zvB73jmo8PTroxAoG
 0OhRhSfKSAeB5Oc6gzyM/DpWpk2STofl2GODrO3BYfMaalepTp5VWRTWn198uvlU+s1HNLQGPy6
 8Rf1qX0s=
X-Gm-Gg: ASbGnctKeb0WoRlcm1uK3fqnmWAqM5GtHnkydNzCL+cTrHElg7aIV0HFmv8nUuJNlkd
 ZyOtb0D0BLitbhsxyDTAcuByKKp7D8dXbf16pUgLWvgJhmCJpBf3aUCBwy7oSqEqOxknu8Vkgpa
 zVsozqTuvq4QhdFdfm0qtlhvqBLzUBEHfsqZgkGeATpnQU2LMpk4tHR7LXkV/Gw/vfqrcNxX2UT
 pFShz9BfO+tZOkLAPDKQmw3aaVNPtbPtQSLKm1hWlqAQ5bSDMLevyGW//uIEW230vZ4cO8qHBFj
 WlmPG/BB6SotC56nTN03oCk5F1m6VbppWhs0Ow0e6qOh6k7ml3jzv7yUksRoB6D9JG9jkbsL1LP
 jyWJ3HIO8pMZAc4g=
X-Google-Smtp-Source: AGHT+IFAI1j7SHGbPyfHLbd4HXmc3xCobKltFgKyooG3I8EbwpfpAI9nyE7HvgufnD8HCK18fwoQHQ==
X-Received: by 2002:a05:6000:2583:b0:3eb:dcf:bfad with SMTP id
 ffacd0b85a97d-3ee861f90a9mr2440920f8f.34.1758286909083; 
 Fri, 19 Sep 2025 06:01:49 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46139122cb5sm122700635e9.8.2025.09.19.06.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 06:01:47 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 19 Sep 2025 15:01:46 +0200
Message-ID: <20250919130146.139114-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250917144053.350712-1-titouan.christophe@mind.be>
References: <20250917144053.350712-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758286909; x=1758891709; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zPS+uFQeedKKO59yfyODXBG6aNA7Sy03hc0BLdecfO0=;
 b=cAmfKSs/PgNfuPz9Os4QmZJOGieYqbnW9u0CUTmraKwQLIbPcwQmmVt/cWJMqnWD0s
 /BjLQeLzYlZnSrJFNkLrulTCQwlP9Llx2bK5ddckT21zpOwlmzC6FuZMs+cTR84ASBPk
 8g3q6Y/gZdQ74/01wWWgzb1ztR6KcSMCQeiNgvIWzRNvDAsCFPcqwQWIKqidC/wBY2X2
 GFlQz8LryhlV7IkxtutmPZAUytxan5FtqLBajU691jaqCpQAo2ut7BYrydj+kw02YvB7
 a/2Cv5KOa2yeKGyh2plcy8byj1+aWLjLY36Bo1cyCPw8bDPo29VTls6eIuInGiAoxnjx
 Rd7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cAmfKSs/
Subject: Re: [Buildroot] [PATCH for 2025.{02,
 05}.x] package/samba4: bump to v4.21.8
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
> See the release notes
> https://www.samba.org/samba/history/samba-4.21.8.html
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/samba4/samba4.hash | 4 ++--
>  package/samba4/samba4.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
> index 21e5b6c9e8..9fff75bcb4 100644
> --- a/package/samba4/samba4.hash
> +++ b/package/samba4/samba4.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -# https://download.samba.org/pub/samba/stable/samba-4.21.7.tar.asc
> -sha256  a395414ee573ef3f5313b274d463866356a53acc7b5e48fb9b5ad83c6ad4a265  samba-4.21.7.tar.gz
> +# https://download.samba.org/pub/samba/stable/samba-4.21.8.tar.asc
> +sha256  e78c36653a37e9647513e5408fc8052375901560d36b8744cd21acc9e4d91fc8  samba-4.21.8.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
> index e5aa0ce31a..7895ec4a4c 100644
> --- a/package/samba4/samba4.mk
> +++ b/package/samba4/samba4.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SAMBA4_VERSION = 4.21.7
> +SAMBA4_VERSION = 4.21.8
>  SAMBA4_SITE = https://download.samba.org/pub/samba/stable
>  SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
>  SAMBA4_INSTALL_STAGING = YES
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
