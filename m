Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78674C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 21:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 227EB41E99;
	Mon,  6 Nov 2023 21:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 227EB41E99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zlpM4q5OAFUA; Mon,  6 Nov 2023 21:09:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D8B442098;
	Mon,  6 Nov 2023 21:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D8B442098
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 372AD1BF336
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CF2A612B6
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 21:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF2A612B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vG-AxArSEnIe for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 21:09:02 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E7F1B612AD
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 21:09:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7F1B612AD
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso762715266b.1
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 13:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699304940; x=1699909740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WTVkni3K6J2XaNh3ojiL5GiyTt8ojepaPN2IPH0CLjc=;
 b=MB89ATIHfHr3snGOImteMDVINZxKf8hNXG94bVNlFAZssKsC7bUdnAc8SD2vF0eykt
 1t2bGW9MZfIevQ+sZm4KYZpOlpKLQYTgKlbNdn2u4lU7gY+P2SL0YnNoLxKUm2zJ+cV8
 /H87NjT9Y7X3skOEORI2hbR4czBBrEtCL5UeKQFT0aNnpPanSuaL4f/us82KbzER7fVK
 osY6xZuKSAKFThKUnHYghrmGVW8Qn6e4RfIu+5H50yZqHBg2wqHcEOwEY3/cyllm+/f+
 xi+Ge2md3AmnVkWI6eXdoylo9uiXy5/1/cbhlk4uyOzqkgeTZ58HUYSEA84Q3e2CPcRG
 samA==
X-Gm-Message-State: AOJu0YzaMBgTMYSgWlpIpMEPq6Utf0Hx08fh12cn113PFMPoGKqJuouP
 GCkCv6wqAbGduqn1xDLGDXN7Pg==
X-Google-Smtp-Source: AGHT+IEzfM9WQijJp29YXUy4czdaiGv+ljMMHdxfsRpiP6aqgckNCZub5NmR4iS1COrk2JaYx9UoZA==
X-Received: by 2002:a17:906:ee85:b0:9bd:a738:2bfe with SMTP id
 wt5-20020a170906ee8500b009bda7382bfemr15778955ejb.38.1699304940050; 
 Mon, 06 Nov 2023 13:09:00 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 e16-20020a170906249000b009cd1fca4d68sm260281ejb.5.2023.11.06.13.08.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Nov 2023 13:08:59 -0800 (PST)
Message-ID: <5a1fea75-c601-4bbf-ae46-1120705a4f89@mind.be>
Date: Mon, 6 Nov 2023 22:08:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20231105021115.2740085-1-james.hilliard1@gmail.com>
In-Reply-To: <20231105021115.2740085-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699304940; x=1699909740; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WTVkni3K6J2XaNh3ojiL5GiyTt8ojepaPN2IPH0CLjc=;
 b=DspCVL19yu5ILg5sA3TIxNsvexp/gpSSuxfx9QsYJw5QUTmkiqREUnD9kyJiU4ntqf
 uvMvG9DKgups1QZVmVLXzxQu76aYsTpXgUskfnVaz9E4le6WV92Zmtxu06jE4yLDLb/n
 fd1fJYs7TouWCaARrbEOoL6NqtNT0UK2WeTEpnm95qwGMlGQV62wUoZYkl3GM87O6E7T
 NcPoj18h8rXDcD82pzVzntZceRCdm2XxQm07ORKRBOFzw7KFAw50jHMag24Gvte3gXPw
 daSeyajpkU934JfV31Ve4LlKQFlXiI4BaErrR9ufiO+iU7zSv9ExALXHT4QcTwnxmYig
 RVTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DspCVL19
Subject: Re: [Buildroot] [PATCH 1/1] package/python-bluezero: bump to
 version 0.8.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/11/2023 03:11, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks, along with:

3f43f74b0a       James Hilliard package/python-canopen: bump to version 2.2.0
d48b79f642       James Hilliard package/python-bsdiff4: bump to version 1.2.4
638de4c7b2       James Hilliard package/python-brotli: bump to version 1.1.0
2ab0e30b4c       James Hilliard package/python-botocore: bump to version 1.31.78
d796d916db       James Hilliard package/python-boto3: bump to version 1.28.78


  Regards,
  Arnout

> ---
>   package/python-bluezero/python-bluezero.hash | 4 ++--
>   package/python-bluezero/python-bluezero.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-bluezero/python-bluezero.hash b/package/python-bluezero/python-bluezero.hash
> index 6bedf62b27..e9ccb9133e 100644
> --- a/package/python-bluezero/python-bluezero.hash
> +++ b/package/python-bluezero/python-bluezero.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/bluezero/json
> -md5  efa07525f1bf6db9af66eb7d9775cdb0  bluezero-0.7.1.tar.gz
> -sha256  f146feb65ee9f6fd9f3638ff0a44df9fd6efb48cf66a39ce51a62a7d38ab5206  bluezero-0.7.1.tar.gz
> +md5  5c256c89c3973cfd20f340f095525af2  bluezero-0.8.0.tar.gz
> +sha256  9bd6706ff6b941c3bedd5b64e0447051120ae8eeac458fb65f56cc6730e1e598  bluezero-0.8.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  59319e80b4caa94ace4817c9f84aa16abc9d4d2b5f7866251b5fda92e87ccdef  LICENSE
> diff --git a/package/python-bluezero/python-bluezero.mk b/package/python-bluezero/python-bluezero.mk
> index 34efb6155c..8e078f1073 100644
> --- a/package/python-bluezero/python-bluezero.mk
> +++ b/package/python-bluezero/python-bluezero.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_BLUEZERO_VERSION = 0.7.1
> +PYTHON_BLUEZERO_VERSION = 0.8.0
>   PYTHON_BLUEZERO_SOURCE = bluezero-$(PYTHON_BLUEZERO_VERSION).tar.gz
> -PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/9a/66/d4a92869ed2afd9483a65aff200b2ba0ca4365429bc9a836c5803ab876a5
> +PYTHON_BLUEZERO_SITE = https://files.pythonhosted.org/packages/67/e1/15fc417b9828d38aa8e09ba06df61d6889740fe45867510a781df9a8ba35
>   PYTHON_BLUEZERO_SETUP_TYPE = setuptools
>   PYTHON_BLUEZERO_LICENSE = MIT
>   PYTHON_BLUEZERO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
