Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127ADC433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:26:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3C4A61100
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 19:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B3C4A61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8495B614E4;
	Wed, 22 Sep 2021 19:26:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQGeha-pVx8U; Wed, 22 Sep 2021 19:26:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA235614EF;
	Wed, 22 Sep 2021 19:26:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5EEB1BF321
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A61ED84021
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 19:26:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9q-Q1tXiobbE for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 19:26:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6AD4883FDD
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 19:26:10 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id c21so13838595edj.0
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/07GVuO/w2yZerCknFDH2ZRDaTvSso/fvfU1JpshdlE=;
 b=MXfOYtwAuohJ0toQMnKxGyMI9UusrApphydR/ZTErtg4VBCHSWhFK2VdFTRoMeDezW
 hWpPHWV8hS+vsG3TYjyR7LvuPO7VqnSVsBcXo5GpeRyaASYEjj8goUp3eapTxuZX4lwF
 eLKhXW6aqgNJ/YnnY7YhvCCGfpe4IN3rbB4CnIxi3umlXajRX7YqMxzna2p8E31VRj9V
 oBOufRGge7gB7SblD7t0BYPmELv5wggzyctts1IabE7d3UjlLMZCX5G3gml0e4VLJYlN
 Ptsvc6vTpjrnn62baO8tlHJ+X7e0udp58WmN96EsYc4gkmr4DdVKWCL8e56mQvKlMbTb
 8U7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/07GVuO/w2yZerCknFDH2ZRDaTvSso/fvfU1JpshdlE=;
 b=5ndXkULijVyF/Hk9YIYzQ6DKxigrN+NuQy13DcozJRDJQ2uThbg0vjoxIj1l6dyGi0
 ydEe+ML2ioyEgMfNUe/wtFmVf/ATS18fbaD7HJ+P+gqZrm+lWij5a0DmQLORjGZ+xo6p
 ySNQw8E26xKe30DGg0nabL18jpFWp5+je5CZ2b6jdqj4spjuvcbFF6nF83MmU9n1YtOR
 T/EUT3dJwknrX17xpXJOYRKhREffK8DQTeZsKHNwFdyhXEKcmnsDMX/LMG34bDpiRtsh
 q79846lGZnE/1d9115djguKM8fe6x242dE/+64qDjl5wiBzfHGa02JfHILSfaur79sJK
 Yhgg==
X-Gm-Message-State: AOAM533jcQvwDt4L6QGqn9t6UjGB+s+xO0EjnJkeAnP+EZOc732L6JSx
 NN8pVJcu7/m2sa+njlb5G6WytsBS44+3LA==
X-Google-Smtp-Source: ABdhPJzf7ac+Eg5vrtKEZ0GrWwNEc11/5qeiaaREbpzY2/z1K/lcQ9efYdhTQkGRhKsWMWrnsqheDA==
X-Received: by 2002:a17:907:20bb:: with SMTP id
 pw27mr959659ejb.438.1632338768637; 
 Wed, 22 Sep 2021 12:26:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id l16sm1453503eje.67.2021.09.22.12.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Sep 2021 12:26:08 -0700 (PDT)
Message-ID: <c77a7eb6-a492-aad6-bd47-63c0ff33dce4@mind.be>
Date: Wed, 22 Sep 2021 21:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210919193711.3990663-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919193711.3990663-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pip: security bump to
 version 21.2.4
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 21:37, Fabrice Fontaine wrote:
> - SECURITY: Stop splitting on unicode separators in git references,
>    which could be maliciously used to install a different revision on the
>    repository. (#9827)
> - Update hash of LICENSE.txt (update in year)
> - Update indentation in hash file (two spaces)
> 
> https://pip.pypa.io/en/stable/news/#v21-2-4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pip/python-pip.hash | 6 +++---
>   package/python-pip/python-pip.mk   | 4 ++--
>   package/python3-pip/python3-pip.mk | 4 ++--
>   3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
> index 58bc239154..69214110f8 100644
> --- a/package/python-pip/python-pip.hash
> +++ b/package/python-pip/python-pip.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/pip/json
> -md5	7d42ba49b809604f0df3d55df1c3fd86  pip-20.0.2.tar.gz
> -sha256	7db0c8ea4c7ea51c8049640e8e6e7fde949de672bfa4949920675563a5a6967f  pip-20.0.2.tar.gz
> +md5  efbdb4201a5e6383fb4d12e26f78f355  pip-21.2.4.tar.gz
> +sha256  0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b  pip-21.2.4.tar.gz
>   # Locally computed sha256 checksums
> -sha256	5ba21fbb0964f936ad7d15362d1ed6d4931cc8c8f9ff2d4d91190e109be74431  LICENSE.txt
> +sha256  23a7361c2b1581028bc623b9da2bd24997abcaa4781ace6ad444a37944f8dae1  LICENSE.txt
> diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> index 71f76e2842..ba7134e235 100644
> --- a/package/python-pip/python-pip.mk
> +++ b/package/python-pip/python-pip.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python3-pip/python3-pip.mk
> -PYTHON_PIP_VERSION = 20.0.2
> +PYTHON_PIP_VERSION = 21.2.4
>   PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
> -PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
> +PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
>   PYTHON_PIP_SETUP_TYPE = setuptools
>   PYTHON_PIP_LICENSE = MIT
>   PYTHON_PIP_LICENSE_FILES = LICENSE.txt
> diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
> index 58e3c06c39..5e20b06865 100644
> --- a/package/python3-pip/python3-pip.mk
> +++ b/package/python3-pip/python3-pip.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python-pip/python-pip.mk
> -PYTHON3_PIP_VERSION = 20.0.2
> +PYTHON3_PIP_VERSION = 21.2.4
>   PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
> -PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/8e/76/66066b7bc71817238924c7e4b448abdb17eb0c92d645769c223f9ace478f
> +PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
>   PYTHON3_PIP_SETUP_TYPE = setuptools
>   PYTHON3_PIP_LICENSE = MIT
>   PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
