Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C974C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 21:09:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B959416AF;
	Wed,  5 Feb 2025 21:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tr0azCAtIUem; Wed,  5 Feb 2025 21:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D43F74167F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D43F74167F;
	Wed,  5 Feb 2025 21:09:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3B9FCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF6D282B9F
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLg4Nzl0M8qC for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 21:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BFC8821C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BFC8821C9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BFC8821C9
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 21:09:41 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so1341075e9.1
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 13:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738789779; x=1739394579;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yYm6ROb6gl+57ujgL41Tg+PVigFkarjIkJZcQtgte3E=;
 b=eDocY/sSPbEmlHgC8tghDcSio7r/iQD+bfJB2WJN2zShydVbzNPwgJhSTlo++f2/4Y
 otLTlIv5nhPRfOVqPAKCYrQZLrD4OhLuTfSoK+DFxFzdr4yOm0s1vlXV0U1k9crj2qTN
 5ECwUwbDksh+p1y5SoG4kXIiQ8iRlIB8U6ImQY4HatzzilmJCcya8uwpERHL2nP5hFb0
 4IARg3WklzvOowHC8dMxe1xuPiQEj4WvMlJ3kzWLYhX8w6znt6gjMtUXyRUyTz1PziHH
 ArrNqTg/a7uHfPSXhwklxDLcEWlEfb9Ik3p90fQKtC9ZPHc7QFqNvXiV/xrpEuGIUWu1
 oK8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtd3QjKKVC5xgC0T+tyu21d0MTaJQKL9BPbXX+UQFTJpoMl3d3G300A1nsgdJGsRI5oil0iePogs4=@buildroot.org
X-Gm-Message-State: AOJu0YyQ3jsbTS0nQG9R4H8lUvGHL7i4r6rqRO3FYe4pBFgTkBJ6llO+
 N1v6h8nLJ313KELL+Z9U6dym/KJzEA3iOPuW/eWbSxSwKxRq5oBKtxHcJKKgdkk=
X-Gm-Gg: ASbGncv3pXv7G2LKU5CFlkMS+7Yaq6zuxYHjw2vogxibfTBfps3bkwqK+KM7y0U0jCo
 VMOOxnvYgpz/NNusVg43o6Pub7WDDTcjl9OwTG7gztWvb3xf2cH4d6pw9Ab7i1WqdplrxIRUvVw
 UsFE64izq6eOyWgn36XzJfpAeMTHXgMITladaNv4dBgnqx765p+vmNpS/iCVdV/mjUv3Rcwafw8
 ozV9lxRrufGP0wCP5UGDMITjYfh7SF0PMsrlZMKLe7ZC3f0q/2BfFoa6w+dKZbMzQ7R17oAmAy8
 XQNwrrGCyRM3mRBaYQ+UsDLdAWRxGa0Hz3oTx/7NGUsyugLGogh+5z7XcOIWCaJxA6Ccl0wHJEA
 mZglv+wXyVKr6u3SvmwwBTy4TFHPopw0d9NQCYIZvMZP5qQ==
X-Google-Smtp-Source: AGHT+IFUw8o65qpwpb6xdXqzZ6HgSxMMi96fLUYHCbCXD6m27N94Fu7wKObDPV68w8oE8Fn/Arj1ww==
X-Received: by 2002:a05:600c:14b:b0:434:a734:d268 with SMTP id
 5b1f17b1804b1-4390e38afe7mr39231565e9.14.1738789778832; 
 Wed, 05 Feb 2025 13:09:38 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391400b6b4sm561555e9.32.2025.02.05.13.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 13:09:36 -0800 (PST)
Message-ID: <038c5a04-9245-4722-88f3-f27016f1fdc3@mind.be>
Date: Wed, 5 Feb 2025 22:09:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20250205140740.3085885-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20250205140740.3085885-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738789779; x=1739394579; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yYm6ROb6gl+57ujgL41Tg+PVigFkarjIkJZcQtgte3E=;
 b=gli+MYEXojpkj/aT5QeCHUdSd9fUqgC2jmpsj/OFgdmlfLTS5a/OmdieEdUaVhUrbc
 2svP6z5OpJNJKw1bnsi/Ii9tSrKenIQx3srn6SBKqLCjWbUUviZlgJ9LSmDG4KdK3kZ5
 PrY7grQ2yY/HFvNuRRjjhit0eAbnCvGMaX62kmiF0iLoC/n9PysrXw2+Rq83MLv4S6uC
 bGbizzbee1LdL2Z3QkjHUFB8f2lJ67dUDsEkWfv4zvqpu+kVDsBebjMOqs2lEZhErVN6
 R0YCIxExhryUer90xCi+jg/vWW7NoapgvSUd9CXbH2IEZ5CNA2kRpfpxKjTCq2DdgEuX
 /QZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=gli+MYEX
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: fix protoc version checking
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/02/2025 15:07, James Hilliard wrote:
> Backport patches fixing protoc version checking.
> 
> Fixes:
> checking protoc version... expr: syntax error: unexpected argument '2'
> configure: error: protoc version too old libprotoc 28.1 < 2.3.0
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...-protoc-version-checking-since-v20.x.patch | 35 +++++++++++++++++++
>   ...rectly-match-multi-digit-major-versi.patch | 28 +++++++++++++++
>   2 files changed, 63 insertions(+)
>   create mode 100644 package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
>   create mode 100644 package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
> 
> diff --git a/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch b/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
> new file mode 100644
> index 0000000000..ee98c5569d
> --- /dev/null
> +++ b/package/ola/0002-Fix-protoc-version-checking-since-v20.x.patch
> @@ -0,0 +1,35 @@
> +From d4414feefd95adf9c91d7eaf1e94380296c35f7a Mon Sep 17 00:00:00 2001
> +From: Peter Newman <peternewman@users.noreply.github.com>
> +Date: Fri, 7 Jul 2023 15:57:35 +0100
> +Subject: [PATCH] Fix protoc version checking, since v20.x (cherry picked from
> + commit 2e55aa88756718d8ab4a4c8fde97d620542c2c98)
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +Upstream: https://github.com/OpenLightingProject/ola/commit/d4414feefd95adf9c91d7eaf1e94380296c35f7a
> +---
> + config/ola.m4 | 9 ++++++++-
> + 1 file changed, 8 insertions(+), 1 deletion(-)
> +
> +diff --git a/config/ola.m4 b/config/ola.m4
> +index f838ab70a..51b6c825c 100644
> +--- a/config/ola.m4
> ++++ b/config/ola.m4
> +@@ -44,7 +44,14 @@ if test -z "$PROTOC" ; then
> +   AC_MSG_ERROR([cannot find 'protoc' program]);
> + elif test -n "$1" ; then
> +   AC_MSG_CHECKING([protoc version])
> +-  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
> ++  # Since v20.x we only get effectively the minor and patch versions out of protoc.
> ++  # Treat them as major and minor and everything should keep working indefinitely.
> ++  # See https://protobuf.dev/support/version-support/
> ++  # So we've got either of these:
> ++  # libprotoc 2.4.1
> ++  # libprotoc 23.3
> ++  # The first sed ensures all versions have major, minor, patch, by adding a .0 on the end of ones missing it
> ++  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
> +   [required=$1]
> +   [required_major=`echo $required | sed 's/[^0-9].*//'`]
> +   [required_minor=`echo $required | sed 's/[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*/\1/'`]
> +--
> +2.34.1
> +
> diff --git a/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch b/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
> new file mode 100644
> index 0000000000..cee2c7eb43
> --- /dev/null
> +++ b/package/ola/0003-Protoc-check-correctly-match-multi-digit-major-versi.patch
> @@ -0,0 +1,28 @@
> +From 546d9ee8d970c4e5b33d9d28b4acf6eb34f27a5d Mon Sep 17 00:00:00 2001
> +From: Peter Newman <peternewman@users.noreply.github.com>
> +Date: Fri, 7 Jul 2023 16:14:21 +0100
> +Subject: [PATCH] Protoc check - correctly match multi-digit major versions
> + (cherry picked from commit 69a2946622cdfce54cb6ed7f2210df2be0ec5576)
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +Upstream: https://github.com/OpenLightingProject/ola/commit/546d9ee8d970c4e5b33d9d28b4acf6eb34f27a5d
> +---
> + config/ola.m4 | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/config/ola.m4 b/config/ola.m4
> +index 51b6c825c..eacee5d94 100644
> +--- a/config/ola.m4
> ++++ b/config/ola.m4
> +@@ -51,7 +51,7 @@ elif test -n "$1" ; then
> +   # libprotoc 2.4.1
> +   # libprotoc 23.3
> +   # The first sed ensures all versions have major, minor, patch, by adding a .0 on the end of ones missing it
> +-  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/.*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
> ++  [protoc_version=`$PROTOC --version 2>&1 | grep 'libprotoc' | sed 's/\([^\.0-9][0-9][0-9]*\.[0-9][0-9]*\)$/\1\.0/g' | sed 's/[^0-9]*\([0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*\).*/\1/g'`]
> +   [required=$1]
> +   [required_major=`echo $required | sed 's/[^0-9].*//'`]
> +   [required_minor=`echo $required | sed 's/[0-9][0-9]*\.\([0-9][0-9]*\)\.[0-9][0-9]*/\1/'`]
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
