Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D465C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:43:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E478060EE7
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E478060EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 949564028A;
	Sat, 11 Sep 2021 20:43:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fN97OvRZi1pP; Sat, 11 Sep 2021 20:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACC044042A;
	Sat, 11 Sep 2021 20:43:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7A941BF2CB
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE7B4826DE
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:43:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xsJzfA6F8mJ for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:43:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB03A82640
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:43:41 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id h9so11767099ejs.4
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 13:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vlcXpZiN4pmxSwaWhrXORgMsjJXlke7MmYy4OIkVmHo=;
 b=M37ca8IaeShkF7kza8pEU/LNok6GTKVyHQSnjB9HiSeP8iyojVpAul0KFb5zS5Z+dh
 9CxzYtVTDBtYrCLw2mOjOXE+Y1LfSI+fcBS/hfS6176SOjHg3R9PhunvRKlRWe0fKXZ2
 +VlU9TPzBEPtlM6puoVkGxnUfDvd0VP7hxzBSDpuvTDvqo9WVgcisOLBFZ75i56eEtdL
 C5aKQdOHxI8oha6mEVcCNJ8fheVNC0t3duvPtn56bUFdKlvXlZxVT/7JX3qWe+Ez5+c/
 kmir8mZXC7N8ZBm9cZznsdnRPZgYfYQPf8ZdEg5OZmoqEUtTudXzSoUgJtpGV8/9vM/a
 BjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vlcXpZiN4pmxSwaWhrXORgMsjJXlke7MmYy4OIkVmHo=;
 b=iPOWlfrgZndqBdorQTvmBhWb1qDCThrwPQFyGI5fBZ7FvQNTM0cggh+/vePdvEIUjw
 qb39nSUCqX1yTLJgm8ELMXuKjDbqyEQ7X7U7H3lNUzwIs2cT105qsGGTI+jJfyBMUmgV
 YWYT6D1pxQilEAZQYN0pYIy3cZlZF43JbywDoEglN/16bChviBV+CX5spt5HsUMUTr2u
 v2SZqg4Ld4zfTTExq2yDJ3scmYnv3F5SeZWJWO8LYjdwXd/sbTO5HBsrv0Ki7Qj7lVcO
 v7omkfQBT8HOVe8wyd55iiByzlyL7pQrMLt5921o7zFN3yWGSySTvcHmaDjN64MovJ/b
 XGiw==
X-Gm-Message-State: AOAM533BisTB8r8VGNzaGU8AWeGH2amx6iTLAGH195zAudwtE3Gec578
 IgeztUKxl/w4B1lbqpVX46EkbiNgeYgzHw==
X-Google-Smtp-Source: ABdhPJxmLdYXLP8xpR2NHt86A+xfUjrJz6hMJoyeJd//7m9V2jxji036+kYIgfnh8s9R1PLm8FqQCg==
X-Received: by 2002:a17:906:5959:: with SMTP id
 g25mr4363821ejr.501.1631393019913; 
 Sat, 11 Sep 2021 13:43:39 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g13sm1372497edr.76.2021.09.11.13.43.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Sep 2021 13:43:39 -0700 (PDT)
To: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
References: <20210905013520.15960-1-james.d.knight@live.com>
 <DM6PR08MB39932194CBD408DED013FB81A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <2a1bc48e-37d4-b977-f3c9-5613a04eafae@mind.be>
Date: Sat, 11 Sep 2021 22:43:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR08MB39932194CBD408DED013FB81A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH 1/1] utils/getdeveloperlib.py: force
 foward-slash for pattern matching
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 05/09/2021 03:35, James Knight wrote:
> Force relative file path resolution of DEVELOPERS file entries to use
> forward-slash separators since pattern matching assumes forward slashes.
> This is to help permit uses invoking `get-developers` on Platforms where
> `os.sep` may not be a forward slash.
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  utils/getdeveloperlib.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
> index b205817033d1d488c13e88f3b1bdbf82aa6b1224..fb8c7546d74f764468e6ffeb0d18b169aefb80d9 100644
> --- a/utils/getdeveloperlib.py
> +++ b/utils/getdeveloperlib.py
> @@ -249,7 +249,10 @@ def parse_developers():
>                  if len(dev_files) == 0:
>                      print("WARNING: '%s' doesn't match any file" % fname,
>                            file=sys.stderr)
> -                files += [os.path.relpath(f, brpath) for f in dev_files]
> +                for f in dev_files:
> +                    dev_file = os.path.relpath(f, brpath)
> +                    dev_file = dev_file.replace(os.sep, '/')  # force unix sep
> +                    files.append(dev_file)
>              elif line == "":
>                  if not name:
>                      continue
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
