Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F32CEFC42
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 19:51:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1B288112C;
	Tue,  8 Oct 2024 19:51:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6htxxYr8IIl; Tue,  8 Oct 2024 19:51:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DD7981133
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DD7981133;
	Tue,  8 Oct 2024 19:51:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4ECBB1BF42C
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 19:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A31A405BF
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 19:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANpn0UneE5yp for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 19:51:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6FA004027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FA004027C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6FA004027C
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 19:51:34 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-42cb6f3a5bcso81017285e9.2
 for <buildroot@buildroot.org>; Tue, 08 Oct 2024 12:51:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728417092; x=1729021892;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iss8veR399mQMsEi3NmvgRI8hFSpX8ypvgA7S0sD6uU=;
 b=a9N0CO2sd5DwrkdGr/ZAP7x0/2nCSyl7BYJQyJfX0TavnAn1C0bmMRLFwwnWLBS5+Z
 Cz/WrDmJPSdIBzLVe8dQenCMUjHIBrD1v6x8gOPLp6xjDeVNXzUWxsg4nZtqbXvXqq7Q
 8ZyuVDWJcMQwPvjcl/OjxlQnEmHebdnMDkZWOWKE160P8No5cDQ9Qhhg+vUEFxo+yU8+
 V9Tr7GbD5ipsZf3IXJbvG11NBGCWBvNVg781EmzyJyj/z1rjmWJAh+zacfbuwr0shx+w
 3atQYfnG4aptFdpvKPh0gfhrCbac2Pe9GXWB//8AbV6M0JX6UUIV8UqiivEVLbKeLSFR
 rGYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUN81jJm34QKZLCUuIC4ctZ3oQ6ylaqwcZv1swyk27eSZwhPwEmYkF+8RYqDCye3GkK3mUTSFXPTAY=@buildroot.org
X-Gm-Message-State: AOJu0Yxex/vNEkN6L9H94XViJVhq1NrPIGqYopAcvxYWf6Xd3wJzzNWK
 mG12MZXAM+6G8O9n28sP19aE0KgcB2W1mTFHrso9w3T15KckE55+HG9p0d23z1cqKd8TIBlyEaU
 d
X-Google-Smtp-Source: AGHT+IGsGHpXC9IzdCsOvqtwKj7jqzorgnK6mdOMQNrFLlwb0rkl1JcOlP3MUGOYBU1CT224siywmg==
X-Received: by 2002:a05:600c:1c90:b0:42c:bcc8:5882 with SMTP id
 5b1f17b1804b1-42f85a6e05dmr169200945e9.7.1728417092327; 
 Tue, 08 Oct 2024 12:51:32 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d3a14bce4sm171747f8f.92.2024.10.08.12.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2024 12:51:31 -0700 (PDT)
Message-ID: <a2ed6255-b50f-443c-9125-50ff68a3adc4@mind.be>
Date: Tue, 8 Oct 2024 21:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20241008-check-package-requirements-v1-0-a137acc133e6@collins.com>
 <20241008-check-package-requirements-v1-2-a137acc133e6@collins.com>
Content-Language: en-GB
In-Reply-To: <20241008-check-package-requirements-v1-2-a137acc133e6@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1728417092; x=1729021892; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iss8veR399mQMsEi3NmvgRI8hFSpX8ypvgA7S0sD6uU=;
 b=VKVqOXeb/lEnkZWs2iIvl7CPJCFwgUBsFXM89U3d1FQxL3aGcFhewXlj9JrMNiHbxR
 XxyGe6nO/RbqjG/B8y/7HFZDXkbSLdxPnmIRi89Z6nA6jqpGfzsG0oJV4un12XT9uiXq
 rXlOAqxr9UPqjq1m9XPa0fKNYLpr75SG30yaBgin/gjIRFVsrHEA0H3XP1yk3VKKOhmi
 syL9rLDZq7qXiLkUDhTESsLaLA6p/4E8NhqdNNsDvjHLqnznYxyzwvTc8rj254S3lwnC
 L+8cAFHcv4CUCTaKzKsGa9zqcIzpS1MNLqwKZwhXsqhBRDT0U3qPb2QlKC6oCsWfCkez
 2u3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VKVqOXeb
Subject: Re: [Buildroot] [PATCH 2/3] utils/check-package: add inline script
 requirements
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/10/2024 17:57, Brandon Maier via buildroot wrote:
> The check-package tool requires some PyPi package to be installed before
> it can run. This is typically done by manually installing them into the
> user's global Python environment or setting up a virtual environment,
> then manually installing each dependency.
> 
> Python recently defined a format for managing script dependencies as
> inline metadata[1]. This can be used with the `uv` tool to run a Python
> script and automatically install the minimum required version of Python
> and PyPi dependencies.
> 
> With this change, it's now possible to run check-package with
> 
>    uv run -s ./utils/check-package
> 
> Note that, because check-package does not have the '.py' file extension
> we must specify the `-s` or `--script` argument. That argument was added
> very recently in release 0.4.19[2].
> 
> I set the minimum python to 3.9 as that is the oldest version still
> supported[3]. I verified 3.9 works by running
> 
>    uv run -p 3.9 -s ./utils/check-package `git ls-tree -r --name-only HEAD` --ignore-list=.checkpackageignore
> 
> [1] https://packaging.python.org/en/latest/specifications/inline-script-metadata/#script-type
> [2] https://github.com/astral-sh/uv/releases/tag/0.4.19
> [3] https://devguide.python.org/versions/
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>   utils/check-package | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/utils/check-package b/utils/check-package
> index 872e66c126b8ec4d5207235d69f0c02ad1757a06..227d9fee8666636e1b0c7e5b3d89015b8e850c51 100755
> --- a/utils/check-package
> +++ b/utils/check-package
> @@ -1,5 +1,12 @@
>   #!/usr/bin/env python3
>   # See utils/checkpackagelib/readme.txt before editing this file.
> +# /// script
> +# requires-python = ">=3.8"

  Above, you say the minimum Python version is 3.9...

  Regards,
  Arnout

> +# dependencies = [
> +#     "flake8",
> +#     "python-magic",
> +# ]
> +# ///
>   
>   import argparse
>   import inspect
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
