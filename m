Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7AF7C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7881F81F83;
	Tue,  2 Jul 2024 07:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaZW4aKiNgpG; Tue,  2 Jul 2024 07:43:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C6C581F97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C6C581F97;
	Tue,  2 Jul 2024 07:43:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 69E451BF365
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F9B3404D7
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S0jUc7S7jps for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:43:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 156E740460
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 156E740460
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 156E740460
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:43:27 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-79d879dc431so150368985a.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 00:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719906207; x=1720511007;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=telBQxKvaw3SB077wYaS8hrdbF4nxcNsBIUyFgDjmBA=;
 b=reJpb3RGbeniVUKMOSZ2w1G4cCFmxrbfQ7YQJEkMetwquXPzIhMV/3HOi4IWhLnnYc
 wMrzFKQYQC4ck9wNDEczxnjgbNL9C5o575lihed+WGmbZoqZUsN5pFEaTtyRcDfyF9k+
 7Ns2uJugaz+4lQz8Asmzrz3jpw3T2JTd3utYMrR+V8riWuToJvuFvMxxM+8ddISKmJLC
 mAuaMP+OABPSw4pltXvRot2fjiJxrJKbypG6fkW7bsYutgKvL+ITVQMgy0BmotOGsQEt
 9XgwJ4KTVV+T4Utrj59MXCxjT+7HFTs75hcjT7GNu2EYhtEqaxCiSPCpYGxWgs3aREuw
 cDwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVv3jqSn0I+ifLXRuOkXdVaZVSNLa2dYtOHELYcpcWzW43yT92t+Dl1u3DMwqnW8MSBAb2tNW23nKdUaxNbP387gu9TEwaqlA==
X-Gm-Message-State: AOJu0Yywb56RKKcbo55ulQDm55DVwcP1+DjHxsnDvHQk1WwTij9LGk49
 TMwsIwr+nnZK78sxDhKx7mq1khaEykZIGdVMrAqkOISLD/kH9/pGXiC+6S4Yho5/l/y65GpyrY8
 Z
X-Google-Smtp-Source: AGHT+IGpkeOCt8HMfG5Pt/yTy8+jFzgSDTh2/xW40i68qYwlemiW/Es4gm++1Q73flm+l5CdKZ8ozg==
X-Received: by 2002:a05:620a:2402:b0:79c:3d5:9c9a with SMTP id
 af79cd13be357-79d6bacd95amr1736277185a.37.1719906206791; 
 Tue, 02 Jul 2024 00:43:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-79d692edd54sm429804485a.97.2024.07.02.00.43.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jul 2024 00:43:26 -0700 (PDT)
Message-ID: <aecacbb6-053f-443e-be88-f4c57747992c@mind.be>
Date: Tue, 2 Jul 2024 09:43:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240701185150.1754085-1-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240701185150.1754085-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719906207; x=1720511007; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=telBQxKvaw3SB077wYaS8hrdbF4nxcNsBIUyFgDjmBA=;
 b=hpbhqEfLpXCQgD2f7zHoehHzwE5PBWNnQtX+SyxgdwjsUB45si+pUGZ7uyJKe9Y0/Y
 7NLSmVuvhMqCmOwwAHoSWPr17Z11Y6jJkPnsI+WhD2Tt2VP4a5S5L4w7rqyzFON49bjI
 Z4vH831BfrbMHym1WZyxxUjRXKC8ix18t2MJ+lvMVvMLqonIyp47otcfgQdItOCOjDua
 tvz26qU/8Vxn4iBC5/GdBiMw+gzyLgN2kpRdokwNrxRjmDnJsCFTPIyST/wjKVk2gdy7
 UyxaImmzds13hIW18g8FHaGqajsCpalLvApqTwHMQQHDSQVUFnLqP3HE33bWR4lm/r9Y
 WV+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hpbhqEfL
Subject: Re: [Buildroot] [PATCH 1/1] package/python-jinja2: bump to version
 3.1.4
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/07/2024 20:51, James Hilliard wrote:
> Migrate from setuptools to flit build backend.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-jinja2/python-jinja2.hash |  6 +++---
>   package/python-jinja2/python-jinja2.mk   | 10 +++++-----
>   2 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/package/python-jinja2/python-jinja2.hash b/package/python-jinja2/python-jinja2.hash
> index 2ab343cce6..2b32f5cce4 100644
> --- a/package/python-jinja2/python-jinja2.hash
> +++ b/package/python-jinja2/python-jinja2.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/jinja2/json
> -md5  d31148abd89c1df1cdb077a55db27d02  Jinja2-3.1.2.tar.gz
> -sha256  31351a702a408a9e7595a8fc6150fc3f43bb6bf7e319770cbc0db9df9437e852  Jinja2-3.1.2.tar.gz
> +md5  02ca9a6364c92e83d14b037bef4732bc  jinja2-3.1.4.tar.gz
> +sha256  4a3aee7acbbe7303aede8e9648d13b8bf88a429282aa6122a993f0ac800cb369  jinja2-3.1.4.tar.gz
>   # Locally computed sha256 checksums
> -sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
> +sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
> diff --git a/package/python-jinja2/python-jinja2.mk b/package/python-jinja2/python-jinja2.mk
> index 209ca2e25a..780b693281 100644
> --- a/package/python-jinja2/python-jinja2.mk
> +++ b/package/python-jinja2/python-jinja2.mk
> @@ -4,12 +4,12 @@
>   #
>   ################################################################################
>   
> -PYTHON_JINJA2_VERSION = 3.1.2
> -PYTHON_JINJA2_SOURCE = Jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
> -PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/7a/ff/75c28576a1d900e87eb6335b063fab47a8ef3c8b4d88524c4bf78f670cce
> -PYTHON_JINJA2_SETUP_TYPE = setuptools
> +PYTHON_JINJA2_VERSION = 3.1.4
> +PYTHON_JINJA2_SOURCE = jinja2-$(PYTHON_JINJA2_VERSION).tar.gz
> +PYTHON_JINJA2_SITE = https://files.pythonhosted.org/packages/ed/55/39036716d19cab0747a5020fc7e907f362fbf48c984b14e62127f7e68e5d
> +PYTHON_JINJA2_SETUP_TYPE = flit
>   PYTHON_JINJA2_LICENSE = BSD-3-Clause
> -PYTHON_JINJA2_LICENSE_FILES = LICENSE.rst
> +PYTHON_JINJA2_LICENSE_FILES = LICENSE.txt
>   PYTHON_JINJA2_CPE_ID_VENDOR = pocoo
>   PYTHON_JINJA2_CPE_ID_PRODUCT = jinja2
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
