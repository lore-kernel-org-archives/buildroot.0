Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97DDC4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9AD82726;
	Wed,  7 Feb 2024 16:36:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ktrpeJZCa7jM; Wed,  7 Feb 2024 16:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC4DB83C25
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC4DB83C25;
	Wed,  7 Feb 2024 16:36:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D556B1BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C24DE82656
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GoLOYf8kymr for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AAA9883C12
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AAA9883C12
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAA9883C12
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:36:49 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41008ab427fso7680265e9.0
 for <buildroot@buildroot.org>; Wed, 07 Feb 2024 08:36:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707323807; x=1707928607;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/Vf81fiNxy8EAWSjG6vcmxVnh/0IYzilM01kxfw/cw=;
 b=j7hd+Y0JT+L+bOUymnXDPxHcXjvxERHStQjIntqAp/C58yuhyK6Nbwacbb5cqI2886
 1bobvEoAoLi+RN1O9gRON7I9g80lZZyaZW6VbR/t/YXQlgVwabCYB6UgwoLC0gmbEb/q
 Op95b8Gz/8Qh7F1h3KaMEpI34+sbmBT/H/nvIxUBrAuGSXCFs2ysJygQJhyfDva8T3YB
 D8D/+ChXFVt4ZF8LUxwkva7EKA1SBecKue4wAY0b2CG/jiqOM+oklDf9PswI95czSHBI
 rENp7MfJB3hBuuk7Ee9v0Z5u+NEVLv+Sg7VpTwsrDzUI9F3j9IUS1KcoYyBccovQuHJ0
 Tslg==
X-Gm-Message-State: AOJu0Yzeqj+qzi9g9/kb3xfwI0SGVAV3yKU/oYmWurspiakpv39YhqHL
 hu9lM6nPh0DB2ZjVC42tBwf4EoXvuJqKXs/oQnMp6K0UFGOnve3CQCz2gDobNKLDvXD4PrXa8jU
 e
X-Google-Smtp-Source: AGHT+IHSqMl3okCmf+zl970x3r81w0P7mOHvUZVOj+0GhHJOVtCtjP/ri4T9I01EDmAzHRk3I0PvVg==
X-Received: by 2002:adf:f6c7:0:b0:33b:1f81:9bf8 with SMTP id
 y7-20020adff6c7000000b0033b1f819bf8mr4235739wrp.16.1707323807555; 
 Wed, 07 Feb 2024 08:36:47 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW1PzjMhqeh9BvOXfG+PZykskrllPrqOa2+W60lsgPVCzJRAnuzju/VfrB8LfpFgcUSX0sB1Co4FFhm4p2G3mIPslTQ/v/M4g==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 n15-20020adff08f000000b0033b1c321070sm1855608wro.31.2024.02.07.08.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:36:47 -0800 (PST)
Message-ID: <f43446f9-d68d-470c-b37b-c2bc2a1ffe48@mind.be>
Date: Wed, 7 Feb 2024 17:36:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240111062711.3041375-1-james.hilliard1@gmail.com>
In-Reply-To: <20240111062711.3041375-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707323807; x=1707928607; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G/Vf81fiNxy8EAWSjG6vcmxVnh/0IYzilM01kxfw/cw=;
 b=DYitIi/hTafvcMwIJEC/FKQLMwuedFKKVsrXrmHLyMRkaM7imtngl42PEiwxhDCN45
 Be4TFnd8qPFJ6G6lszAbFep2tSrALpkLEHgNKxuDTVDGUveRwVAuXiG3mDx4OpEi75m9
 ad+xB82OOge5W6bbG8HIyEA46jMcO3E1Tz4q4uWLYbgYtwmfBXcnmAE5asJa90ib+x4H
 qz8UK+X7U2igRql1g3Gg1V6gAoPski7BmIK5XZ3XmymzRsk1IeGeYRq+96wDj9afp+rS
 CFPkDWbQLg4BEMO+9Pgz6fCeY2r8IG+xOw/L4S75NU82kRquONHFufPBujAOirsmlPiw
 neAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DYitIi/h
Subject: Re: [Buildroot] [PATCH 1/1]
 package/python-setuptools-scm-git-archive: bump to version 1.4.1
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



On 11/01/2024 07:27, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../python-setuptools-scm-git-archive.hash                    | 4 ++--
>   .../python-setuptools-scm-git-archive.mk                      | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
> index 40b4b0e7f7..ce790a3d59 100644
> --- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
> +++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
> -md5  df3933d33c49c5d9aca06715b4c65370  setuptools_scm_git_archive-1.4.tar.gz
> -sha256  b048b27b32e1e76ec865b0caa4bb85df6ddbf4697d6909f567ac36709f6ef2f0  setuptools_scm_git_archive-1.4.tar.gz
> +md5  cfcdab6edbe6b710ab24ad355e7cf7a3  setuptools_scm_git_archive-1.4.1.tar.gz
> +sha256  c418bc77b3974d3ac65f268f058f23e01dc5f991f2233128b0e16a69de227b09  setuptools_scm_git_archive-1.4.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
> diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
> index 278fc972e5..153343788b 100644
> --- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
> +++ b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4
> +PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4.1
>   PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SOURCE = setuptools_scm_git_archive-$(PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/69/5f/7135eec07395c51d3dd6899251b277405ecc2f8f7a80ef80a483e3c5a2bd
> +PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/47/d6/c9a8d1ea95613f79b9b914cf9a5e8e420b7625fc54137c1d7c9cbbda5adf
>   PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
>   PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
>   PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
