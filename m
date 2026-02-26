Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A017FD9E0A
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1112B6076F;
	Thu, 26 Feb 2026 20:47:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yQiA1N3XKs3z; Thu, 26 Feb 2026 20:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417426072E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138827;
	bh=ZywArh1NjQKO9dpa0iJp98aDFHgSXw8/a7yj2XLyHpQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wu8gM3YPkK3dbZ2YGC7Ysrj5zmfuF0nbsBJoa8NQscSkTQCtJFx4ZC98Hsqan2y6s
	 y53ixYEwZLqTwlElNwhpBfe5hhlT45FGuqdZNn4m25CWEVKpH81WBzl9+DdLRbhhAc
	 HtZNVdEVvv26vzXIRNmyROzbTzifK5ZF2D9W/calCiEVYcOx6KKXTn8pY6TkdbPImh
	 u9gdKmg7Ba/zBJUQ62PGcvGrcq7haLProCGRZavsoTYQnv0Kz0Z+y2yu0HqZP5sJMJ
	 7jlEXzDUd/tm66ACN4dgxjUfZ/jeUwoJEnzH6Ni1tYMsjAojRMBx9SrfNdUdNNRgae
	 OVe/1uzKOki6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 417426072E;
	Thu, 26 Feb 2026 20:47:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 84ABD23D
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 767EC4026C
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EK2Rx2JhiWW7 for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8D5DA40122
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D5DA40122
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8D5DA40122
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:05 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-482f454be5bso23071655e9.0
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138823; x=1772743623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JEzYJgQkWC21gWGn0hgFUnbOrefqnMYEUt5JzRfPNAc=;
 b=IV7mRZGKMem2xT2+haAt++EVmXkBk45UUJStTtfadt2GkGpmget3ZzVFdpZfKSY532
 sfpta++OGrR9iLvOck37wzTDUDIyEMSn3/if9ywPI2rM44JGDD7atAjWlwgcWwLLDy7q
 ZcFBSZVzy5sIkGe37NgUWApvIpX6JZryvaonCOeDzUHi5xiqQ5RBYsxU7vk3t8/XM3yo
 S4FwSBS/3k+D0vMkijqXpHZsStfyE7krRWRpG+xniHkdbbyEn+6xh8iIJ43ydPTVrdZH
 YfVyJyW/RRuOF4ROcL/AA1h8uc0unpNlCkLzxAkXpC6zD20mp1QSwMf7f3LwIzUP0HlB
 Gr1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh7AeIn/tfuZPwFT6yJb4YoASKqCq45FbVio2A0xumXzYq1T6NG4h5Mbe4qTPINZR7nioL9IuQq2k=@buildroot.org
X-Gm-Message-State: AOJu0YzRDZGYcC67ywvoldyQiawcHNOVrcw+KCRhUYMHSIKBs95eHFnd
 oEFMLuELa6QPRyHJTarOjfHD9m1SQ7rp2cRxd8883WdJihtl3cRo1drjsG+3RwdLq+69tZkzAWj
 E64Jb
X-Gm-Gg: ATEYQzzUx6eR5g/ng5zcRl7r8hy7w8RVdHtHsmi357vAcPQn0ycvv5Ye5EiwSH6is/1
 tEBnmR1VNmd0jPXPTW6WnGwVk0w0Fhidi31xLGrVvV2n7lMQ05vbFI9XWTqa2fYhn1Y1CepKTRD
 uGgXhHHByM7Dvw391rarGP0UiyxKqrfGgPDiiqLUdwWrorPTndqbmOYFyTq66H4d0q4/arUNiw1
 JyNID+2SeJoVmWv8eYlBr5xai4l3juzKzt7wP/jFrSTHw5LXf5cckDOq7bdqGu0F4X8e8ATRFMV
 M4ar72EuHkPZOYdyWcdObvsW9sRDIfFiUGP/PzocQC7aS/D1AL+wI051XfAo6U0FU8J0p15KDdJ
 E5suDYIaio1v90K6LihCF1YoUlaCVlq7WOyiEVD3Erdd1JY5KM62TKSSzbjpiuU/ZDae3llE/8v
 BkkYf0qqaCKwSXXu4=
X-Received: by 2002:a05:600c:820c:b0:479:13e9:3d64 with SMTP id
 5b1f17b1804b1-483c9937b2dmr6589075e9.15.1772138823397; 
 Thu, 26 Feb 2026 12:47:03 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd702e7bsm188164115e9.5.2026.02.26.12.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:03 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 26 Feb 2026 21:47:02 +0100
Message-ID: <20260226204702.253541-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260215105358.2089856-1-peter@korsgaard.com>
References: <20260215105358.2089856-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138823; x=1772743623; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JEzYJgQkWC21gWGn0hgFUnbOrefqnMYEUt5JzRfPNAc=;
 b=fOncKSPPBDLJ4TDV4SJQPYWIx8mFIZ5TB0KMAr5XgA0lhWZlNEb8XCwCbQlPiKHpGL
 6zZbLrlAEO5mBOhnvC6b4dQ8hagFqUERa+fmAfXXkeMes4cHXFJ885lzvxOlXXNkC/IA
 LeNDrPRYBUNhsz+xel2Z2eE8wLEZKfmSPEbBW0x230FNwqKY416nccBHkitTnnK8oJPU
 bElRgjdMTY5eVYGXH33fm098jLbXb5wI1q5Y5ORuEC6KmvLLWvqAWIhHKeaN0FLegSgI
 p/d1JMxXEWkXv1Y5sfYJ9mnNDAjku79zJzOq+XZZsDkE8jZhXbmF0gWsWqOzBxsSzs9V
 tIAQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fOncKSPP
Subject: Re: [Buildroot] [PATCH 1/3] linux: make license option visible for
 _CUSTOM_VERSION as well
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
> Commit 50958bcdac ("linux: Add support for custom license files") added a
> default value for the license files and made the option visible (E.G.
> editable) when a custom VCS or tarball version is used, but it is also
> needed for users of an older _CUSTOM_VERSION (E.G.  mainline release), as
> the referenced files were only added in Linux 4.16 with commit e00a844aca
> ("LICENSES: Add Linux syscall note exception"), so change that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  linux/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux/Config.in b/linux/Config.in
> index 9d96b346d5..c136084afd 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -152,7 +152,7 @@ config BR2_LINUX_KERNEL_VERSION
>  
>  config BR2_LINUX_KERNEL_LICENSE_FILES
>  	string "Kernel license files" if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || \
> -		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_TARBALL
> +		BR2_LINUX_KERNEL_CUSTOM_SVN || BR2_LINUX_KERNEL_CUSTOM_VERSION || BR2_LINUX_KERNEL_CUSTOM_TARBALL
>  	default "COPYING LICENSES/preferred/GPL-2.0 LICENSES/exceptions/Linux-syscall-note"
>  	help
>  	  A space-separated list of license files related to the Linux
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
