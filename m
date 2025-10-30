Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C00CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B5FB83F79;
	Thu, 30 Oct 2025 08:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z967kqKoqYZu; Thu, 30 Oct 2025 08:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B867E83FA9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B867E83FA9;
	Thu, 30 Oct 2025 08:23:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB3C0160
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCC254105A
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ot6v93b3ceVu for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:23:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B7BB40FFE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B7BB40FFE
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B7BB40FFE
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:46 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-429a0d1c31aso460088f8f.1
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812624; x=1762417424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zuOMht3WMGJUOQUASvTibu8SKNcnB1NWvNG85cwuL/w=;
 b=NToHFNXVlj2l1CxLiw+KGCWIkHXfHrltuMfh4qF0fsRKVy1kHvnTI8lIde/sTvdwj2
 gDoGDRYLpa45i26Kgl3x+RO7HfKmVa7lhCh/ZHQ1YR3a1/8C0dffkNH1J/iB4Fjig65D
 krnLSRZQnFnVOSRAvniDpdEole9MTzU5O7r9agTPI8yEZlAbGxew0fq9eCxQQHEBlXd+
 O0EWZcLw7l0KROKwn5LA8iTrUgO3QeYNZwzWkRaF3bjinhldKd86ATx0iDCz566C44j5
 +QEopN1HgKJTguPM7Bagv/u8OxviITi7l7oxrNT9nuxeOxRnQ6i2vynYBdBkdQQY62uu
 jrVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAip6Qj8Rb30UKmiZrePi8vus6zpCgAZRzq4mieW2PTCzqUJgCGivbiUsHp7tHCkF8EbrAzNtIBz4=@buildroot.org
X-Gm-Message-State: AOJu0YwmlvxqIbERMPVPQQgPWUcf0k/xm651469PAdR8wow38s7qE/Of
 +SUh+k0aFfkNn5D+TeAUNytvmVVJaEfZ3mGDvRvXZ/O85RN1g987sKyNxSDfJ3wuqWc=
X-Gm-Gg: ASbGnctiXsOJmsGU3IIIxzhbp0nSeCVW8MypKZYCb6l8lSl7e3+V6TRPKnlBvTj90Kx
 DSSMwiAyVcemVg7g+zbObqYMZfkxXieiMOUeymMVCOduqc/eFJf8DfwB3ThBTkQiA3AIc8fAqP9
 2LH2qege+sPEVgg9edy4hlsrwolEoIqabaU2E0M4TOZjZVQBRuu9/q4U/f2YExjOCFwSBJQZfap
 FLGeYTv14YksDq0h/+Dw23RjsgqbxExtEWuxlr7FgTs20rqdTBmpbuRpN2crbDd4ySP1LDtKU9w
 Z+xOjYtkv6qa0NSHthN+/Wf9iUqJToR4szkrUSLBHT3vibnqdiOannwwo1/h7bKU/DPmUtGT2Af
 OaC/tjHpF9/u419yWluNYmRTWYecPbM67HOcMcNuPwsHrj/7Ji0muf4RGxKz2vZr6nzcvGebftf
 +uxzVkCdxF5WYa53N4I/3nUelLVdin2vvjum93
X-Google-Smtp-Source: AGHT+IHzfkLgr3LtiscHRwCYQ9jHgc2UQVjXdZvrE1mye5jeh5iKQa6a7BNigpCLYDDQIEQdcdbdOw==
X-Received: by 2002:a05:6000:2890:b0:427:537:39e0 with SMTP id
 ffacd0b85a97d-429b4c56b39mr1858061f8f.14.1761812624312; 
 Thu, 30 Oct 2025 01:23:44 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772899991asm25905315e9.3.2025.10.30.01.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:44 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:43 +0100
Message-ID: <20251030082343.34814-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020203428.2751864-2-bernd@kuhls.net>
References: <20251020203428.2751864-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812624; x=1762417424; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuOMht3WMGJUOQUASvTibu8SKNcnB1NWvNG85cwuL/w=;
 b=UuOp8NC4dXkxlnFplTdecUs3yaturTlrET1HNUkvNbRkhIZUl9uY5KDiu4gz6Vg2r2
 nAFco7YUciGmzdFSqqEIxqpejee0E6DaVEgAifmq2Qgs3rKBKDJOi5CrPXulxNfZz7Ze
 SPO8+u1OXT0/9EpecJCC/TJZ4uudY9wiqCyETWbqwfCA/F6bzItZwKBoicEfWX6/g9Wz
 55/D9YVL16/GDStVDMAmRq1HoBc7AHW+mV/3E4bCqBIZq0qw5CkN1RdJeiNf7m0fcvpA
 IcoaNniVrAhwlBEZYjDixi7/zMIvCzyLiaHuMQr8JVeWWSWPLNH7KTyobJMmmLff9knk
 NIIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=UuOp8NC4
Subject: Re: [Buildroot] [PATCH 2/4] package/dante: security bump version to
 1.4.4
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
> Changelog: http://www.inet.no/dante/announce-1.4.4
> 
> Fixes CVE-2024-54662: https://www.inet.no/dante/advisory-2024-12-16.txt
> 
> Needed for bump of libminiupnpc to version 2.3.3.
> 
> Updated license hash due to copyright year bump:
> https://github.com/notpeter/dante/commit/53727f08eec6cae55c4ed6efb88c3d688839f2cb
> (commit taken from unofficial mirror)
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  package/dante/dante.hash | 4 ++--
>  package/dante/dante.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dante/dante.hash b/package/dante/dante.hash
> index a76018fdb6..c9d86608d9 100644
> --- a/package/dante/dante.hash
> +++ b/package/dante/dante.hash
> @@ -1,5 +1,5 @@
>  # From https://www.inet.no/dante/download.html
> -sha256  418a065fe1a4b8ace8fbf77c2da269a98f376e7115902e76cda7e741e4846a5d  dante-1.4.3.tar.gz
> +sha256  1973c7732f1f9f0a4c0ccf2c1ce462c7c25060b25643ea90f9b98f53a813faec  dante-1.4.4.tar.gz
>  
>  # Hash for license file
> -sha256  05e2db26147a8575005f090aada119ea6cb40a4382164929d647f00abef3bdfd  LICENSE
> +sha256  49034b51407f6e51a07aed87c3c00c0889294348cd5e99d78d6b6f62746ff3fc  LICENSE
> diff --git a/package/dante/dante.mk b/package/dante/dante.mk
> index bae46c5a71..2f4e75d1e5 100644
> --- a/package/dante/dante.mk
> +++ b/package/dante/dante.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DANTE_VERSION = 1.4.3
> +DANTE_VERSION = 1.4.4
>  DANTE_SITE = http://www.inet.no/dante/files
>  DANTE_LICENSE = BSD-3-Clause
>  DANTE_LICENSE_FILES = LICENSE
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
