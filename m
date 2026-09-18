Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C65C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CED7D40CE9;
	Fri, 18 Sep 2026 13:08:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8f2qO3Mhj9C8; Fri, 18 Sep 2026 13:08:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DF62740D29
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736910;
	b=BOdMIuGAxgHMp2GBvkSMy7vly5nUW8BDdRUViqOuZFF8nZNH6G5rZzZfPDoQB2xtRM08
	 /PEQsQFIjqLshxCjhSlVqge4IRyOaDbrZQAC9pZ5fh92LDj7h5aU6LXhzUS/Ps0aDu1ls
	 JKtC/ppP4K7fKUOm2gkpADVsoMDzgj3V6oB0GSJ8joAoGMPynXDdhwnqtfIZtjgqDLETk
	 jQkGIOu3KPGZ3owyeTFaRN+4D0U5PV6/zXSkAXZ0AxUooD6jRTeCmWm93WeVJZRklPULE
	 3t4njECm0//oT/WtVwJc9vOYsDbbgsCyRKgvbGcenxD+0tCTM8GqYZH4iC/rOaFqhVw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UjFbMJZ6XIAFaz/pK2XDhifZLV3kmTo5svCme5akWMw=;
	b=KbIXD8iJS7mopooMceIZxbfu1NtsJvBP19qQ0DiiHpeKj7BJia1v4AJmMRoclwyUNi7H
	 sZWlyArraYRU4B1sn5wPNf0WtA5GvPkPUSEs6G+JOQBq7wBcwUO3h2jTF/nsba2YoWHkG
	 6hD0V9ajfc7jwNdrSrZxA/EA1F9azO7Km8nUJiBNEym79JszfqPmfVH/h8MfVKh+GPnUp
	 1d6EW55pUvbZXIvRhNmtRkA2EVbYXpibitx0PbEi3Dh4xtRU+rhvVeNjJBMUmqpAevKWS
	 QPnrbmYtoIrRrVcchhoLaxlN3OyieW3ABFVnJ6PCg4dHw8stSQlUM/F3uFC7XyvXB7A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736910;
	bh=UjFbMJZ6XIAFaz/pK2XDhifZLV3kmTo5svCme5akWMw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=W7JVQgLhajNOvv5kyiu8oxqd36sO5xGSlIIQRho9FetmM2bvsm/1qctLJTt7nFnNI
	 VKrj2aEkgPUbpI98JCmXS0jgzKkAOm9W2XCn1/kAHagDZrhoBGXb57NIk5NB0auJiY
	 gkcqW+Kfn8+8dZsz8bx9p6uEhmZ0j2swr/PuX11iNg/r+36piw0srnknQBQas/OpUb
	 waYt5Z4RIp9Hwu5/EZ1/REi5mwHuQ+bs9/06Ooni3ATt7dDrT4iXsiBo07YBAITotP
	 wBzdfUAaUEwBWJWI4gKui8YjApUaQ+mgDghuPFC5b8fQ7UrBVdQ2e7x/OI+TJcLL4c
	 pfzhVEC5gCjXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF62740D29;
	Fri, 18 Sep 2026 13:08:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3810013D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3520A8124B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EnQOdvpPrPFY for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0014F811AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736900;
 b=DVkwbamMPc8qG1lV7qlAfE8nz1pBXzLcj59eog4shgBYfZGa3xmtz8YuxGIJQQVSaeAE
 8GL56LSGk+nHTP0wPPllLyDUpngT9zLjenRlSMkn9bPmcjV2RYwo7dCrF45zEDVrZv576
 gL0QE8fzcUaVZi1nSzv+CfgWH3yht9VlQIIxhwIsO2rxeBY1zSqd1EKm53sFqsaib1gMR
 05J6uP1zz6z49ZpL6flcgWSjYUr9A6zxslsPWQznWrjnZw+ZRmEW/3Z0EYKCg3sixYrZ8
 nEkzhTNYGi1BuKfh62tMcPlIacdZKZSSEzJYFSqQEmgiOGaY8JdZKpm4KeomUsLqkcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736900;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=KZQfLVUmREPkMZMvT67bkk2kozPtx6uRpRCz+pTkij0=;
 b=is1EfE04N8P1CShKZBptF//qlScdy4CyAM0cY4zo6M5pkXkM2rtQAXI6UjQyBZXYdIQn
 j9t26B7ErfeDocIjBpsg6XTPJ4BCELYngHiAuR/tWDeZKt563MAqtQt/ebMdWw1FDAahp
 i1XxMUyQfI8bckNUCGV0kHUwdPOWVTo0AaSQAcYPYFcaOvxmNHrIMuk3KnzddLoUBFH3L
 dCqeHA5skS+268B4LrvgXd6xQb3i3mjIluk+u4sV5iTfxIRmXpDO32zGvF7mE68K0qI2I
 N7AtZ58UqErdMyHiwdzCSbZxYTAiLCfZDE5dURKx46A3xd6cfZ22E8Rf2uANAmzVLCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Go2CEabF; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0014F811AC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:19 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so5459175e9.0
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736898; x=1790341698;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KZQfLVUmREPkMZMvT67bkk2kozPtx6uRpRCz+pTkij0=;
 b=Knd4C8wzTwz9+HSAw3hTZZ0FFfbcRrlHGmfhEAM/x1lYU6+242zeIqCNISFIE8Y+dY
 iy0BI8yHcwJ6y7flvtz3pLp1JBoTALj0F7LIp1254deSISBL8OjmRZCQYLZxWDEvyYbT
 3XIpxb9Mx0HjA3OUBcYFkTG7LkmfWfsYaccy6jCUAgxrk2nFkUbfAn1Kxrk/H/O9T03s
 B7SsfQyqlrsh1wTaXlDYH0a0y65vwIbEesTe6GKWjNQ1yXbltbyLl7TJcpXA9KLRQfu3
 GBYZwBT31yroTeDTHO7lqJSDP9gDOpMN0nkaOHIPxp9isyoT/yKMxQASnyNk7Vh+BFKG
 r4nw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzz+doBKlwYzhSGeG3U1HL18/TGJTQZu7G8bJeZVpCItjD+B1ffUmBmzvpD9J1fXT8O4JqGpLqD2sI=@buildroot.org
X-Gm-Message-State: AFuF++mkl4c/BY3CuEEVxuWLZUe0iW0OInpWnERVU8hfGSnBsvsM+b//
 HrYmW93peWk5aa84OsTsrU3yx4Xkv+kiX3BjGB/iBoLWziFBqMQyT1c85jQOOlBvWh02rPzTvE/
 RZ7qI
X-Gm-Gg: AYBFou04CIlCcRcFR8A27ZotLggN6xJtpYipoFgI4Ff7N+QQSWU4z8LH9yadOKMOi4b
 5hnwNKuJLWAVfkzCS2Buyl9AYQFpN+fVr8zD94ZoPbekDRQ5yroJTg92HGzqy8KDGpK8JSbdRLx
 dLrbPf7MzD2neMI577AnBO9Xh02cCc+U+YJXH6C1za97gG3dQ8PMW05okpGqXSidE9mW/3Or2a1
 HYPc4dulIqS9Vk6SQGp2DkdVR9qvVioqsYbuBmZFMyQuyjrhVMCnTTqLPjT4jsOxFsZO7x6LBTx
 EehYTKW+KN68zYqrL8ED/OoXIMcCa905t+RIb7Yvch/VUVeU2AB0g+4igvQaspTTatay1UT/jjz
 1GRHurikvvKWy0gdA0sDY4cRnExTFTSPi7DrRNg8PtVSlz9mJbWwDGd8tOuCIVyv9AFbFdW3XJr
 L5Px1XG0NX4m6tmre8pGvhxsZ/8gckCBSXFF2/uw8yAyRLGgO/xuUr4y39Zv6ZdzVD
X-Received: by 2002:a05:600c:34cc:b0:49e:6c27:d093 with SMTP id
 5b1f17b1804b1-49fc56dbafdmr32885775e9.15.1789736897813; 
 Fri, 18 Sep 2026 06:08:17 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fbd204c1asm152635425e9.4.2026.09.18.06.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:17 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:17 +0200
Message-ID: <20260918130817.161769-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910073701.6776-1-bernd@kuhls.net>
References: <20260910073701.6776-1-bernd@kuhls.net>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: security bump to version
 10.48
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
> https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.48
> 
> Fixes the following security issues:
> 
> (Security fix for specific API usage, GHSA-2p8c-ff85-vh9x)
>  If pcre2_jit_compile() is called with options for some match modes, and
>  then pcre2_match() is used to perform a match for a different match
>  mode, an out-of-bounds read can occur if the match is attempted against
>  invalid UTF input.
> 
> (Security fix for pattern conversion, GHSA-q8g2-wprr-34m9)
>  If pcre2_convert() is called on untrusted input on platforms with
>  32-bit size_t, an out-of-bounds heap write can occur.
> 
> (Security fix, GHSA-3r4p-g7gg-ppmf) Fixed an out-of-bounds write in DFA
>  matching when using a heap limit; also fixed possible integer overflows
>  which could cause under-allocation of the workspace.
> 
> (Security fix, GHSA-fmgr-6ggq-9859) Added bounds checks for several
>  integer overflows while compiling patterns on 32-bit CPUs, which could
>  cause under-allocation followed by out-of-bounds writes.
> 
> (Security fix, GHSA-9qww-pwc4-77qq) Applied lower buffer bound to
>  prevent two out-of-bounds reads while scanning backwards through
>  invalid UTF data with PCRE2_MATCH_INVALID_UTF.
> 
> (Security fix for specific API usage, #937) Fixed a leak and later
>  invalid free when calling the fast-path pcre2_jit_match() function with
>  a match data object previously used with pcre2_match() and
>  PCRE2_COPY_MATCHED_SUBJECT.
> 
> (Low-severity security fix, GHSA-q7rw-r7qq-2hx6) Fixed exposure of two
>  uninitialised bytes from malloc() via pcre2_serialize_encode().
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/a621579b98b143ec2e87173d63a45f475ccbce08
> 
>  package/pcre2/pcre2.hash | 4 ++--
>  package/pcre2/pcre2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> index 17f15c0fdc..90991322a2 100644
> --- a/package/pcre2/pcre2.hash
> +++ b/package/pcre2/pcre2.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature:
> -# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2.sig
> -sha256  47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7  pcre2-10.47.tar.bz2
> +# https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2.sig
> +sha256  b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed  pcre2-10.48.tar.bz2
>  # Locally computed
>  sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
>  sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> index f2b5608150..ea841f482e 100644
> --- a/package/pcre2/pcre2.mk
> +++ b/package/pcre2/pcre2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -PCRE2_VERSION = 10.47
> +PCRE2_VERSION = 10.48
>  PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
>  PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
>  PCRE2_LICENSE = BSD-3-Clause
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
