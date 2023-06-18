Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB223EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 590D960FFA;
	Sun, 18 Jun 2023 13:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 590D960FFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C2pw9nQUgres; Sun, 18 Jun 2023 13:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C6A6070A;
	Sun, 18 Jun 2023 13:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88C6A6070A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BBFD51BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95BFC6070A
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:13:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95BFC6070A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVhIu-NAUUtO for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A21605A3
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A3A21605A3
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:13:04 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-988a5383fd4so15021366b.0
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:13:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093983; x=1689685983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GQub35FMaDV+MeMetYauEeC/fQ0ysfgXljboNksXJC8=;
 b=N8WB7dr7w3uJulT48kYft7/fH/YwBFSf+B83/DC8x08Mg4ZzfXXnGrHUUnQWBVV06D
 cguGlb44AgF3vmb6LJIHelfM3AIuzPJDESkx64APckBZltY3Q0Wr5J3SY1auTVUIQXPV
 iApQo0HC1ANucFtZzw2BODj1PW8he3ziYGVQicEG2aWBYg4QVCuWvUvr3nkjpEHeHMJJ
 HDhTzZ0WT5q2rByrXqJ7uR8WgBpMPKY6S140Uh/jk663EM+MbJt6Z+Z/DmPlpgRGEl7e
 HbKqOBzJq4yMMbXs2FYp8CUFSg2CjI6Gg9p4vrlCkm4GOEAx7GcBvPrYmKnJjRFu3JVR
 GfOw==
X-Gm-Message-State: AC+VfDx4teeScERvuDfRAfriQj6WJ+RejE7fJsJM/rniJQzO8VGmmmXN
 wquWi5s2S1yH8+O4jdPZ3joGWg==
X-Google-Smtp-Source: ACHHUZ5rOWREBG1CphglDX6kti6ANLxzcj1rQjVOS3G5aTLjpBvXFxeAfg+y+GW6UvtgmYOqahXk+g==
X-Received: by 2002:a17:907:1607:b0:982:b253:dc20 with SMTP id
 hb7-20020a170907160700b00982b253dc20mr5863712ejc.27.1687093982837; 
 Sun, 18 Jun 2023 06:13:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v21-20020a170906565500b00987cd2db33fsm1782394ejr.131.2023.06.18.06.13.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:13:02 -0700 (PDT)
Message-ID: <a90392f2-fdd0-20fd-a1db-1e34dfc95c40@mind.be>
Date: Sun, 18 Jun 2023 15:13:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605074459.1897572-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605074459.1897572-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093983; x=1689685983;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GQub35FMaDV+MeMetYauEeC/fQ0ysfgXljboNksXJC8=;
 b=VXG3Ivn0XgIsCSvESLpVJwMIYKt8PcZGFdzMClggr5w5naE7ZbZvZ/r3Jw+eMg1Kwc
 1WV8dlFNGUcn48atsatfJtNp/bRogR8jBfsKFj6JFAyKpS6EJE/qACVqQE1hjDeMqUJ3
 X1Cqk7pq12MDOi0XXorHuLN/G8TWTgCoZfVfw8Lu/qG4Ps1Mbmj9JuvTEdrNF/c0tpMS
 R9SmvPpUk1X+Xjf1VbWHue22Sjx6WwvpjkhkmEdlJbvqMo2YpmF/j7rnETyfwzWl9qGr
 RjZdCKedWw/N0taXGqTj7vFOT0YJ6sK6hifQDeN16CHpmSWRhpIsyEdMT3UtkEGqF9Rv
 593w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VXG3Ivn0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to version
 0.6.0
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



On 05/06/2023 09:44, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pydyf/python-pydyf.hash | 4 ++--
>   package/python-pydyf/python-pydyf.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
> index 1b37e90e73..c01270be50 100644
> --- a/package/python-pydyf/python-pydyf.hash
> +++ b/package/python-pydyf/python-pydyf.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pydyf/json
> -md5  6b2a02162a3f4be9464d7b4043953d33  pydyf-0.5.0.tar.gz
> -sha256  51e751ae1504037c1fc1f4815119137b011802cd5f6c3539db066c455b14a7e1  pydyf-0.5.0.tar.gz
> +md5  6f06b2c08717e25f17de043a02b71062  pydyf-0.6.0.tar.gz
> +sha256  b44a38855d7e47b740b3cd31ab63a2f5b9b2793931d50b0ccaed3bb7b86912fc  pydyf-0.6.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
> diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
> index 6327a3efe2..8d8cf56889 100644
> --- a/package/python-pydyf/python-pydyf.mk
> +++ b/package/python-pydyf/python-pydyf.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYDYF_VERSION = 0.5.0
> +PYTHON_PYDYF_VERSION = 0.6.0
>   PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
> -PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/f4/4c/6d31b36a46714d8206b8ca84b8dc9aaf42093415b1f50471538552abe501
> +PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/9d/c5/d5e4536968c36c0838459b5c482b9228e9aae839847837623d0d04576ba0
>   PYTHON_PYDYF_SETUP_TYPE = flit
>   PYTHON_PYDYF_LICENSE = BSD-3-Clause
>   PYTHON_PYDYF_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
