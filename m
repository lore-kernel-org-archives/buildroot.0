Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82029C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FD961205
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 13:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1FD961205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4979F83F6C;
	Sun, 19 Sep 2021 13:08:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jolsea4jCCbe; Sun, 19 Sep 2021 13:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DBCDF83F8C;
	Sun, 19 Sep 2021 13:08:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75D5C1BF5AC
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7287C83F8C
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xg_kXrJnYin9 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 13:08:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1776D83F6C
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 13:08:27 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id t6so49662664edi.9
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 06:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4tkUxshnIVyWtc/DhG+d0QzQJavuITZRzeqkG9Aa3Kg=;
 b=h+9D46IAfwR3VKIPKv8erD5K4ulyY5f2KiNet/sbTL7EN3A6MwjARYFUo63ZJoy8cP
 1m89QQQR+8uhotHmomKGMHmGMkfhZXlbH77pRhlos5rT4Gw37Bz8stdrH+MuZvhwDKBv
 ZNRSF/EUDsVrLJFs6X/zwI+RwO2iucUfHsj45Atf039TbKptU8OmAvVGpT2+Hbb7bd4q
 dSi6KMBOOTb4oLXAzp1DfIwhnEh2obIjsN8djcuuUHbv7WDAPdk49zwodb65qHOIlyzs
 DFAJeuKKHze+PDt4j6x92svEqYMIEZ4bRPCSQdp2JPs53WppPU7NWbfTlU/mw09AZD6j
 jrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4tkUxshnIVyWtc/DhG+d0QzQJavuITZRzeqkG9Aa3Kg=;
 b=7pxHHSJCy0P+TGODPYP+R2GodKSjZVPSUDGww+kn30R0109qhPx0kwvKD1/0rITFzt
 YXgiFmyp0MZvVN0XmU8WZ3IfC6VuH0FPWj8Hlukc5wUGAcrjdqjTC+OMY8CSKfDF5bq0
 wmgM4n/xxAC0ot47R+ADBbARecC1O606tqmH4GP5t8h7LPfzR6U5q8uoZTS2K3gIWMn1
 0n8g2+b1b1vaGV4JQoEox9CSjsOrADb4qeUgOtiqAvsEUMfUCaWaoC5Tc08trl1T66TA
 dC5L4qLQ0XnGobKjNMjquphQxY/kiwD+//0V81p4GUiR+WmXsmYW3vEB38OF2i/KyKhR
 sD1g==
X-Gm-Message-State: AOAM530ef0AntqZxVPlFUC7Mx9/jasZ3OuT5I1YT99Dgf0/g91sweLAR
 Zy3oCCCBaL8WzekhIgWSN7tM0w==
X-Google-Smtp-Source: ABdhPJye/uFIpAgHVAB3bFD8z4VhnJQ7Ae8QGGw/8UXK+CfUP7YXdZrDfQG8TCvPzgKGCUG1PJlAWA==
X-Received: by 2002:a17:907:7613:: with SMTP id
 jx19mr23830514ejc.453.1632056906031; 
 Sun, 19 Sep 2021 06:08:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z8sm4934406ejd.94.2021.09.19.06.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Sep 2021 06:08:25 -0700 (PDT)
Message-ID: <16560399-1dd5-f0be-5258-b5843c714ac2@mind.be>
Date: Sun, 19 Sep 2021 15:08:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
References: <20210908081927.694201-1-asafka7@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210908081927.694201-1-asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python{3}-psutil: bump to
 version 5.8.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 08/09/2021 10:19, Asaf Kahlon wrote:
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

  All applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-psutil/python-psutil.hash | 4 ++--
>   package/python-psutil/python-psutil.mk   | 4 ++--
>   package/python3-psutil/python3-psutil.mk | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-psutil/python-psutil.hash b/package/python-psutil/python-psutil.hash
> index 1a053cc368..552ced55ec 100644
> --- a/package/python-psutil/python-psutil.hash
> +++ b/package/python-psutil/python-psutil.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/psutil/json
> -md5  50bf39b4faa268ba1da8a9730bb38bb6  psutil-5.7.2.tar.gz
> -sha256  90990af1c3c67195c44c9a889184f84f5b2320dce3ee3acbd054e3ba0b4a7beb  psutil-5.7.2.tar.gz
> +md5  91060da163ef478002a4456dd99cbb4c  psutil-5.8.0.tar.gz
> +sha256  0c9ccb99ab76025f2f0bbecf341d4656e9c1351db8cc8a03ccd62e318ab4b5c6  psutil-5.8.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  24c12984500caa07ffdce19eebc06396c5e6d244b573bc6c438f4a6ef8e56c1b  LICENSE
> diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
> index 9dbc472213..3bba7ca343 100644
> --- a/package/python-psutil/python-psutil.mk
> +++ b/package/python-psutil/python-psutil.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python3-psutil/python3-psutil.mk
> -PYTHON_PSUTIL_VERSION = 5.7.2
> +PYTHON_PSUTIL_VERSION = 5.8.0
>   PYTHON_PSUTIL_SOURCE = psutil-$(PYTHON_PSUTIL_VERSION).tar.gz
> -PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1
> +PYTHON_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/b0/7276de53321c12981717490516b7e612364f2cb372ee8901bd4a66a000d7
>   PYTHON_PSUTIL_SETUP_TYPE = setuptools
>   PYTHON_PSUTIL_LICENSE = BSD-3-Clause
>   PYTHON_PSUTIL_LICENSE_FILES = LICENSE
> diff --git a/package/python3-psutil/python3-psutil.mk b/package/python3-psutil/python3-psutil.mk
> index 029e1b1c12..1304124f57 100644
> --- a/package/python3-psutil/python3-psutil.mk
> +++ b/package/python3-psutil/python3-psutil.mk
> @@ -5,9 +5,9 @@
>   ################################################################################
>   
>   # Please keep in sync with package/python-psutil/python-psutil.mk
> -PYTHON3_PSUTIL_VERSION = 5.7.2
> +PYTHON3_PSUTIL_VERSION = 5.8.0
>   PYTHON3_PSUTIL_SOURCE = psutil-$(PYTHON3_PSUTIL_VERSION).tar.gz
> -PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/aa/3e/d18f2c04cf2b528e18515999b0c8e698c136db78f62df34eee89cee205f1
> +PYTHON3_PSUTIL_SITE = https://files.pythonhosted.org/packages/e1/b0/7276de53321c12981717490516b7e612364f2cb372ee8901bd4a66a000d7
>   PYTHON3_PSUTIL_SETUP_TYPE = setuptools
>   PYTHON3_PSUTIL_LICENSE = BSD-3-Clause
>   PYTHON3_PSUTIL_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
