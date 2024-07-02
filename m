Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17510C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 06:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D599881EF8;
	Tue,  2 Jul 2024 06:51:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OsgpFGl8nI7S; Tue,  2 Jul 2024 06:51:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF37881F41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF37881F41;
	Tue,  2 Jul 2024 06:51:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 799401BF32A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 726B081272
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 06:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IMRjl5XHfaZL for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 06:51:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1AC3381F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AC3381F49
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AC3381F49
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 06:51:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ebe785b234so38630801fa.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 23:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719903063; x=1720507863;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hK20UpiUoOuqkwu9sx1wlv9NsbsnoIdUrUU1znjBTJE=;
 b=gX7ND5Crzwy/5Udf62K7sF6Kxf4XxXfXHj2nGV2Mo+1WglRWedZ6MLetkpR8qZpun7
 Ah2y7G9Mpn/8TxqJ6sBhvYCcVTpLgPM+rBoUT3zhV8UR49kI+INaHR3kqvfbaGkPh/Uh
 vKYM4j5XZipXlq3rseHU7NPHgW7t6/8yIc0NMcCyjNqtBCDpkN0K16r55Vtv9KJq0SFD
 T9+ZYzkYn60WIbDS6cpMcG3ovag7mrRPyYK0kPw/aZjEP+yaqurDhbtsYZIB8NYTc5WO
 el+Nkk+rPZqk/b5hycryFpk5UYCxtVUtgphHfz5olxN4SKkcFOGSY+1GPBaeum8BmRbV
 5Sqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9IfzPhAfqNiMcqxI817gvDqhfKm7wTGmXprxcuEdgSQB2GquRb1XCuEggo14ob+JX5B1M/xfCUkHcYzdJabHsVIxl7Gn5+A==
X-Gm-Message-State: AOJu0YzBLOjxKJaft+GR0zYx/gJzwtU6f9TUOEMJMz1kQmnuDJQmaQfT
 7ncsT5bHqo3c+CIZLZYbBcT3Nx0n2RGNkVfZACv2s8pLF5HEgZd58c/zvsnxOByCtCuOcdNynCh
 x
X-Google-Smtp-Source: AGHT+IGJNSKFeS7J84k3nZHhjIt9rqoF3HJqtEijID4UOC50q6JsA3xuP+pRvj+9uQt9igo3mF7E7g==
X-Received: by 2002:a05:651c:b0a:b0:2ec:140c:8985 with SMTP id
 38308e7fff4ca-2ee5e6f2889mr66571791fa.36.1719903063048; 
 Mon, 01 Jul 2024 23:51:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256af55e61sm182138765e9.20.2024.07.01.23.51.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jul 2024 23:51:02 -0700 (PDT)
Message-ID: <0375507d-b3b6-4b14-82bf-af7be6a75258@mind.be>
Date: Tue, 2 Jul 2024 08:51:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240702051805.830216-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240702051805.830216-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719903063; x=1720507863; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hK20UpiUoOuqkwu9sx1wlv9NsbsnoIdUrUU1znjBTJE=;
 b=P7KEKOLBmICvOKqmDPY21kCqfoA1FS8PJ0EuP8s9IXxa8h94T+IjCFtXA8Njy1zNDn
 Jc8ftL5oG+cQ4mL9FfHtKLY96FCkyVizCkZLnKdOPDZ/k/qk2YkqT+5Rgo43azocbmYX
 h39myWWqR/HWijuufy5aG28Wdp0TuJxrrDFiEOXsO8TeL4ygUVunPR5PAlJJVZ9dLXx/
 AzVzyYEY29Jbsjc6uUCttwiU5sJqHlfvbJ6V7QdC9yiUjtarcMlxvD1j2ecMrcVm59kx
 9Go/b6z5hJMF8Ph6mqkAXBSGhDQbXextWsdIhCOSKB0ZaVEDacZ9lpznbyFhlnjg6WzP
 pZBQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P7KEKOLB
Subject: Re: [Buildroot] [PATCH 1/1] package/libsoup: fix set c_std to gnu99
 patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 07:18, James Hilliard wrote:
> Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
> fuzz factor to 0" reduced the fuzz factor.
> 
> Due to this change, libsoup fails to build with output:
> 
>      Applying 0001-meson.build-set-c_std-to-gnu99.patch using patch:
>      patching file meson.build
>      Hunk #1 FAILED at 2.
> 
> This commit fixes the set c_std to gnu99 patch so that it applies.
> 
> Fixes:
> http://autobuild.buildroot.net/results/4ee/4ee68145143df02c46034b4ca291fea469a6f58a
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
> index f2e8f7701d..a999f5964e 100644
> --- a/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
> +++ b/package/libsoup/0001-meson.build-set-c_std-to-gnu99.patch
> @@ -26,9 +26,9 @@ diff --git a/meson.build b/meson.build
>   index 4dfd8c15..a5ebc63a 100644
>   --- a/meson.build
>   +++ b/meson.build
> -@@ -2,6 +2,6 @@ project('libsoup', 'c',
> -         version: '2.74.0',
> -         meson_version : '>= 0.50',
> +@@ -2,7 +2,7 @@ project('libsoup', 'c',
> +         version: '2.74.3',
> +         meson_version : '>=0.50',
>            license : 'LGPL2',
>   -        default_options : 'c_std=c99')
>   +        default_options : 'c_std=gnu99')
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
