Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03528C2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 06:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 784E66058D;
	Tue, 25 Jun 2024 06:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qK3Hb9rm6CAr; Tue, 25 Jun 2024 06:21:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A143E6068B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A143E6068B;
	Tue, 25 Jun 2024 06:21:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87FE21BF3C4
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 06:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 745D24026F
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 06:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yCXLpT45DPc for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 06:21:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0252840129
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0252840129
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0252840129
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 06:21:43 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ebed33cb65so56508091fa.2
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 23:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719296501; x=1719901301;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yDsija+E5GP0xo0r5ak67jhgaYb3QbKDCX95MRJRsbw=;
 b=fONGQhqVppPImneLUfWqZzNB3qbjkP94HNLTLZE7ShDaSOjQx4ggeOlmPUzBohd6Yb
 P8vtlu9hNMxZfQ/zzObArFJXYYHpO7f1vlXD3U3OEAgec9QeAuE4ebjryDo/K92D1sc8
 PkHrEzNH3zDyWi0uEU/YJA4P+535ekh3lZj3gOOjbeUk+V2xA2hw0YBRUEmlDE71pxYm
 0r+TQXso+PLo3GbLHMoEB1l1Am9xtUHJH5kpqfs++I2s2blbXtXYfBKQXouLExqGjln7
 1jZ8k6f9NOEV4NkzHvloGl4jFVgbb9l0UyetbCXTrsYjKBqW6ODnBwQVqJ/E0AFqSUX9
 OFFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvUkKNCe+GOcatSuA0Y4tt4vFVaq+z4UC82IOUm8DQ1j9Pxe2m8cAgQ83L6RGXa1Olzy4ddX/9hgRKso8NpwsIewWzijMPow==
X-Gm-Message-State: AOJu0YzDtXivViSSnWuOQI/SrKvnHyOr4Zm2IIiAE9V+8o3V8eFO6nBq
 QaHfWILGlefy5UyaIlmNECO52Jxqnj1XqDLv9+W2GNSaHay4XsdGtVpzaDaVSX8=
X-Google-Smtp-Source: AGHT+IEEzpolBkVRjfKUIrjDV7fJRIUVWRxtBnxpWqisH/97kdv/hRv217j+NR7i0StbxuiUw1x9Hg==
X-Received: by 2002:a2e:9d8f:0:b0:2ec:3dd4:75f9 with SMTP id
 38308e7fff4ca-2ec5936fa45mr45941731fa.35.1719296501014; 
 Mon, 24 Jun 2024 23:21:41 -0700 (PDT)
Received: from ?IPV6:2a02:a020:386:66f3:241f:56d2:bb9c:350?
 ([2a02:a020:386:66f3:241f:56d2:bb9c:350])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4248482f1c4sm144521395e9.10.2024.06.24.23.21.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 23:21:40 -0700 (PDT)
Message-ID: <852e6bae-dce6-422d-98f2-947c4a71e6c2@mind.be>
Date: Tue, 25 Jun 2024 08:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: jacob-chen@iotwrt.com, buildroot@buildroot.org
References: <tencent_7A5A407C574E45921E432385B01446CC4506@qq.com>
Content-Language: en-GB
In-Reply-To: <tencent_7A5A407C574E45921E432385B01446CC4506@qq.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719296501; x=1719901301; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yDsija+E5GP0xo0r5ak67jhgaYb3QbKDCX95MRJRsbw=;
 b=Y23d+FtEYlXpFhHs4tl1fg8DuCA4GuFIOFs8QR5S+hzqELZevzkTvmZiCsy2zUSJiM
 MJK3jMhcFWFBmnUkSvijWrRAmVrJBG7C0zVcpFGONRUqPWVjZeOG+Km1pHHeMhBM7xe6
 MqdVAdSCNkwEjU2eItC7ojeQNTpsADqJfWMC0sQXdCkBarSsjyM6Yh/XQcuOVyzojQTS
 4Mn5kOuXbF511/oJu67MTs0uKC/Qtp3uyU1Iia+w8HzUeOzrHFM+0ZKN/+wgNc7W5KBa
 ZmFGwS+k0nkcEKe1A66XAg6n8dBKXmOok10Pr7ZOiUt4Ze+/L5UhJNLDhyI9q8g5e36P
 gwLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y23d+FtE
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-utils.mk: fix incorrect
 handling of per-package rebuilds
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
Cc: chenhao <chenhao37@lixiang.com>, zhouxiufeng@lixiang.com,
 thomas.petazzoni@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/04/2024 07:09, jacob-chen@iotwrt.com wrote:
> From: chenhao <chenhao37@lixiang.com>
> 
> The current per-package enabled build process incorrectly handles rebuild targets,
> which break local development workflows("make package-rebuild && make all.").
> There is an earlier report regarding the bug( https://lore.kernel.org/buildroot/20191212130253.2cb543ba@windsurf/ )
> 
> To address this issue, we change rsync command used during the finalize step to use the 'update' parameter.
> This ensures that the most recent files are installed into the rootfs.

  This will fix the issue, but may break other situations. If a file is 
installed by both package A and package B, and package B has a dependency on 
package A, but it doesn't set a newer timestamp (e.g. because it's a script that 
is copied directly from source, not a compiled file), then the --update argument 
will cause us to use the version from package A instead of the one from package B.

  I don't know how high the risk is of this happening, but IMHO its impact is 
far worse than foo-rebuild not working.

  I also don't see an easy solution to the problem.

  I've therefore marked this patch as Changes Requested.

  Regards,
  Arnout


> 
> Signed-off-by: Jacob Chen <chenhao37@lixiang.com>
> ---
>   package/pkg-utils.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index 6181ae7a99..be1db37df1 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -227,7 +227,7 @@ define per-package-rsync
>   			$(if $(filter hardlink,$(4)), \
>   				--link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/, \
>   				$(if $(filter copy,$(4)), \
> -					$(empty), \
> +					--update, \
>   					$(error per-package-rsync can only "copy" or "hardlink", not "$(4)") \
>   				) \
>   			) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
