Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEC8EB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC5F661149;
	Fri,  6 Feb 2026 08:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHIyBggAs_mt; Fri,  6 Feb 2026 08:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23DC56119E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365498;
	bh=CN+4e/zmdnu3rHttg9wDfcl8IGxlvT6wm7QqdB1oMcM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HRb9AcaZ2cltuTcx47Ady20eGvLIJMWPHWfRY4H/ODw4oAAyZwEE9czho/3NYrMYQ
	 KVPEoL9LujF08pSZUwzg9K9GcRP8KiyE5tW5tQ3DQ7nt1j6Pvu1twgewFwzSJ6PkzU
	 CoqcHxgbjeq/cGibBoBM9AXE5uaE6YW/HgX583iucfuClyt/VNQgYHdq4u4XY/UODs
	 ODwTPo8GVv16IdhpuuADC4bA8HlWgyuZvvwHM67ZgKLmMyYH5oIk/w+OfJRCpuMdAr
	 RMczBNy7mmaY4RDfa5JkJNFzuikTLNJjqJSeHuaFht0Y3tmBhw90UHOIaQPfxi9a0i
	 OENC3M0GdFSrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23DC56119E;
	Fri,  6 Feb 2026 08:11:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AC5F7173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D9FE83412
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jIF0Pv6CZYk for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F5D3834C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F5D3834C7
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F5D3834C7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-47edd9024b1so3827105e9.3
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365489; x=1770970289;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jo4poV5eiSnjZ/UgfBv9ulWZ2ZkWYz4PiuhaHpBsAMs=;
 b=tR84ibpQcWHl+XD5AWj/tJ2RhsRur0FmFHqK1Pq8MBhDjC6CQdKAAmiRSbcNtGE4Zn
 8qXBpICq3SR/ITRDioJHS7renKpPqjledUdk2GO02WMZpS32Dqcsq+Wo7Ah+7N7rz5o6
 NRPDDeLHFKFbXxQSm8t2Lv7h4DgaqFSX3YRJzBqo1iEIvzRJJYjpKirJCZxkGVEpFpUy
 24nFuH7gucvTIbwkkFf3lMQv9scpzSWzSN2focUR/SWGIjxn4of29SCUUzelf/VXn8zk
 IR+ubmYKnjbUnMf+WJWncOy5oiBJp3XSml1cmG8aI8dhDHM1oYZtbVbhDYe5lYiJ9eph
 JWNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvJ4n+Q6pIFOR9ouF3bzeMjWTSCVKh6TveX8wgFBN/eFZBQBCTNQdRSqgFgplK6k4PfxcSMLrkh1k=@buildroot.org
X-Gm-Message-State: AOJu0YwABfDjpn721L8uzpY8PvzUM9oZatQ4OLaRMie+QHsntc9/vLJt
 zxGroamp1XJ2QsjwN7qx7j7wHttEUdVKCMXcggCTwdzciX4/g842PG2ZulLTlhRjTHw=
X-Gm-Gg: AZuq6aIhiy0RjUTwIA6PzEXaHcgahuvjbEEzO+Orvh2YrUcKwGDuxS/gWJ8sbzeGQBg
 BsRw0MHjrkwk+acKeJYAbRrF5Q4Xp1DchhkeH1HviPaVXNCmfdnOm9fjX+t/dkBiqTj7MMWMsoB
 oXUsdqiYIZ4x+Pyl9jscH/8951k85Kjys7SkmQANZfDOlrIjwHm1L6ULHHZzJk/FuZ6PkdLaugO
 Z7n3mAO+8VpNaCacO43EWrRWBxmyUi39tC4/riAxWVudplbCjBS7TWefeN0OgkwYr5AF6ZJj365
 aheIgnCmnq0/MVD6ltYgARzPXdXOaRmbams7ICiQcar/rESkgzwYANCSbLJ6L4CTJGQ7UNXWOSq
 XW9X0f4d9iwpzwaBDX0pdWPBgZyQv4nit0LTOCE1kDGaMhwtqWJDTWIRV9qlYuO4HsdoJzCe2Ia
 QagDk=
X-Received: by 2002:a05:600c:5253:b0:477:a978:3a7b with SMTP id
 5b1f17b1804b1-48320212d6emr25326765e9.22.1770365489128; 
 Fri, 06 Feb 2026 00:11:29 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483206ced0dsm32360155e9.6.2026.02.06.00.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:28 -0800 (PST)
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:28 +0100
Message-ID: <20260206081128.31647-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <aXCZZRkyVbbN8ou4@waldemar-brodkorb.de>
References: <aXCZZRkyVbbN8ou4@waldemar-brodkorb.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365489; x=1770970289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jo4poV5eiSnjZ/UgfBv9ulWZ2ZkWYz4PiuhaHpBsAMs=;
 b=ewoDSPrdRzRl46SZtJv7LJqJCuRyEq3a2QE8bfGfjCNhsNASVxsOErjyh+y/wLdEF9
 i6ZmQkT33pxUcbwMbl4u4aa1vE81VDDsIO3SZQd9D2ZaZjsxYvkOVRX2An+5e1+z8yKP
 tusrW9cNLgCcHLMUadXkffQkW236iVLUHNucDdRs5cL9Z50Bk+QMtRfeTcQgrNvMAL/w
 L4F8MT8x0ANJyjI1yVkd5Nfzu6bCLQLWa5DO2ESH80aWWOc9nFGA7AUxKwkTGik62pjj
 HdofQ13oezsRTA0bdzmt8/RBLr1gU26zv3eJxpPB8okKEdeHGkPUwPtp6KJAonE6Q4lm
 W2jw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ewoDSPrd
Subject: Re: [Buildroot] [PATCH] package/{glibc,
 localedef}: security update for 2.42
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
> Fixes following CVE's:
> CVE-2025-15281
> CVE-2026-0861
> CVE-2026-0915
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to 2025.11.x. Thanks

> ---
> Should be backported to stable branches.
> ---
>  package/glibc/glibc.hash       | 2 +-
>  package/glibc/glibc.mk         | 2 +-
>  package/localedef/localedef.mk | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
> index 538f8b69a7..a58bb7b9a7 100644
> --- a/package/glibc/glibc.hash
> +++ b/package/glibc/glibc.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated (fetched from Github)
> -sha256  a364a548ebda9c570f5bf62bf5e4ad3240a90056455b9edfbf1472a7254bd1c0  glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e.tar.gz
> +sha256  f63ffa06cd17ee8ff891f6de41de6e189b96edc6b2be2807ae597291f4464388  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125.tar.gz
>  
>  # Hashes for license files
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 9c3ff7124e..e3453b8cc2 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>  # Generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>  # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
> +GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
>  
>  # Upstream doesn't officially provide an https download link.
>  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index c34fe22b5e..254a79026a 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>  # Use the same VERSION and SITE as target glibc
>  # As in glibc.mk, generate version string using:
>  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
> +LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
>  LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
>  LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
>  HOST_LOCALEDEF_DL_SUBDIR = glibc
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
