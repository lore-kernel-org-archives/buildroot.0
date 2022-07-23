Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAE3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 15:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE8D661AD3;
	Sat, 23 Jul 2022 15:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8D661AD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fbO7qLfygmeA; Sat, 23 Jul 2022 15:03:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3B4261AD5;
	Sat, 23 Jul 2022 15:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3B4261AD5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C0061BF859
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56AFA849D9
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 15:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56AFA849D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XHkFh0OLD3Uu for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 15:02:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4233984BB2
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4233984BB2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 15:02:56 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id n12so10082032wrc.8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 08:02:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+j8X9XvvCtdkGB3WpZkrQF0ZqImakU26fhVGHY3XbFc=;
 b=VlQRIb8lvtse7dQX9lCF7PmUrVszXLZ6lvkpebs3VCyIXKMP3hPQO++hPyDKAGbqZp
 Mm4ldeU9j9mXJDeCJjfiL97jtVJkqbYIo1fxYDQdQC/xyimWiLH+6C48hUtzlTZatXJl
 2vpp3Mc9x/duhye4rD+GsTH8yn3TeAo7hvF1dktWNEsLWwimHQrDWL7Q4RVpMlGSkiQj
 Fw98zfuX4Mn0KBQbD8jJeXQZvKeJ/6mX3iTB7jXp0afSKBIon6lPB+M4e1MklQuhchro
 Awu0lQwh0J3ceRQD0LgDcq8azluG3TR7JepSDAE0Jhb2qtrusUhx6F1lQx7uen1OkZ4G
 hVSw==
X-Gm-Message-State: AJIora8eDvkf+s5U+U/VjFPtOstJyBpW+3n4OeARwb7jslxr3VFuOrxr
 dms7gwzmjSBAd7DecpljZu8Iyw==
X-Google-Smtp-Source: AGRyM1v6ExIdNtH4+2om7Vdm3rl4fCVpWIqrfpvZNijpikB1a4UoLNbOVLSsgWIDrzM/jSAuOLkb0g==
X-Received: by 2002:adf:dd91:0:b0:21e:4e97:c146 with SMTP id
 x17-20020adfdd91000000b0021e4e97c146mr2948703wrl.281.1658588574531; 
 Sat, 23 Jul 2022 08:02:54 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a5d548d000000b0021d8b1656dfsm7206611wrv.93.2022.07.23.08.02.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 08:02:54 -0700 (PDT)
Message-ID: <573f48c4-57a2-7719-9a06-b92fe50a4115@mind.be>
Date: Sat, 23 Jul 2022 17:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220718222208.3119150-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220718222208.3119150-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+j8X9XvvCtdkGB3WpZkrQF0ZqImakU26fhVGHY3XbFc=;
 b=TPZX1S4Xi4BYfcuLTv58kQEpD0WY9cX0kKCMkO8gdI8ks4xqnq8P+yDvk5pM69R1zC
 r+xEkfSKc8VwX4oMLgernPE0bKSC10qVBQcKb1xxWYRIDDmLTsgtkvR3rJ7JWLQkoVQB
 5F8g138xtf7hkGivK2HT96qc8irS1xdVjfQmPRaxfGib5LCp5odaHDzKyj0zTNlfDaoT
 Z8HL0lL+G6PDEzF3EpjkfvFgqP4nZx3gTTW3iOAhBKV9+Qm4VNFTNdhRtdM3j78qfz6o
 5unH3kxvJUCdX5tu9tqkistm6ubMpE19Ebb0XwvYhaqMzeKN+SnIamlYSkqO8OMTOPbX
 0Mdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TPZX1S4X
Subject: Re: [Buildroot] [PATCH 1/1] package/python-smmap2: bump to version
 5.0.0
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/07/2022 00:22, Fabrice Fontaine wrote:
> Update indentation in hash file (two spaces)
> 
> https://github.com/gitpython-developers/smmap/blob/v5.0.0/doc/source/changes.rst
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-smmap2/python-smmap2.hash | 6 +++---
>   package/python-smmap2/python-smmap2.mk   | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/python-smmap2/python-smmap2.hash b/package/python-smmap2/python-smmap2.hash
> index 9ae758fc62..424fa58e8c 100644
> --- a/package/python-smmap2/python-smmap2.hash
> +++ b/package/python-smmap2/python-smmap2.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/smmap/json
> -md5	61882572be57023980c36f5493523077  smmap-4.0.0.tar.gz
> -sha256	7e65386bd122d45405ddf795637b7f7d2b532e7e401d46bbe3fb49b9986d5182  smmap-4.0.0.tar.gz
> +md5  82b22288dcabfe257d4c1f04c83c7fdd  smmap-5.0.0.tar.gz
> +sha256  c840e62059cd3be204b0c9c9f74be2c09d5648eddd4580d9314c3ecde0b30936  smmap-5.0.0.tar.gz
>   # Locally computed sha256 checksums
> -sha256	88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
> +sha256  88e9d93f708d110b328a834302dd1d5c6afbda530e7721d15d80b3511d86f235  LICENSE
> diff --git a/package/python-smmap2/python-smmap2.mk b/package/python-smmap2/python-smmap2.mk
> index bcf20206ce..489cf0f758 100644
> --- a/package/python-smmap2/python-smmap2.mk
> +++ b/package/python-smmap2/python-smmap2.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SMMAP2_VERSION = 4.0.0
> +PYTHON_SMMAP2_VERSION = 5.0.0
>   PYTHON_SMMAP2_SOURCE = smmap-$(PYTHON_SMMAP2_VERSION).tar.gz
> -PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/dd/d4/2b4f196171674109f0fbb3951b8beab06cd0453c1b247ec0c4556d06648d
> +PYTHON_SMMAP2_SITE = https://files.pythonhosted.org/packages/21/2d/39c6c57032f786f1965022563eec60623bb3e1409ade6ad834ff703724f3
>   PYTHON_SMMAP2_SETUP_TYPE = setuptools
>   PYTHON_SMMAP2_LICENSE = BSD-3-Clause
>   PYTHON_SMMAP2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
