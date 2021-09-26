Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EDCC433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:41:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6A8760F39
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6A8760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59A1560666;
	Sun, 26 Sep 2021 19:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kqXpqYV-g5WB; Sun, 26 Sep 2021 19:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8046460708;
	Sun, 26 Sep 2021 19:41:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04E491BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1A8B81947
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eWUeojlVr5pO for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:41:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B00980F54
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:41:44 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id l8so12286640edw.2
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YAfnNdlfJkjIGyuzrYJ4T5YcXydL94S6uMKXUn1mNUE=;
 b=QdCrthKfD4WQZuHmqXBXKh9JsohoNHmInBksn7wQ2PVrv8wGxObdGyU/0aDnHsQbV4
 pfxr7zyGRzk/qtbEwsXFpRg5+qCPmEsPCuu2OGyTbRxrZr9/6utnYC3rLmRZNEGcnC1Z
 42CwdEjP1lUxXm19PvD4+SpZ6DqvI7slDWlb+YpeKtbT0XgxUqWsGMfMk5AV4yplLMRA
 b4FcB0tQyQzF15dq14AT9+loimDC1yR0ChFCMNMRBNjil4HtcI5fg8geJQTixYyy8ZCY
 i3DVNqI1HTgb5RVoJ04GVluusmRccWJFs1Bpomx1N8z96I+SzTMNMX+yq5wnJH7jjcpJ
 /yRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=YAfnNdlfJkjIGyuzrYJ4T5YcXydL94S6uMKXUn1mNUE=;
 b=C0xVGPZTq+F6gi8WgdakXgu8YgJvou+1d5ltmPmHKxcj4NC0QUts4pnLcSSbiyezKj
 TYAPZVlAHUS/9O9Ixa+dpQ9EkhG1SKeQCwjAa6OLqApYFq65fFUnCFZZQoM2cmLPTJoY
 N3YIcEPbj0t7LfGR2gdjF7nhwO9WiesN4/pk2IhITBmd7JejPGKV5nO27IQLLVzlW4ad
 0HP6Ovvsj78hko2k/KWBf/l/aPXJ25qXpPKIi1FAS3pYVv6DI/zu+7EFueGiRU+De9cA
 KVssL8QSiI93jXC6mAv3B2zQvRlCt0Tb/e3ZH8UyQxim0PTuXgUdToK1ZOcFHNCufRk6
 3L3g==
X-Gm-Message-State: AOAM532JxFPRmsAIfHtjESBWRWiI6TTpoY+DbDW7bBF32zbZDvQDygcu
 CdXD0y3GcD/OgWg+LTzCL1VSuQ==
X-Google-Smtp-Source: ABdhPJwHntZ8QA7Xsu3fi1iM7ejnBBEW+FFNWwoy/BFzr8cD5joFuISN61HgwKU9Z3hwWNSjExQl6A==
X-Received: by 2002:a17:906:8289:: with SMTP id
 h9mr5050799ejx.540.1632685302390; 
 Sun, 26 Sep 2021 12:41:42 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w11sm9529869edl.12.2021.09.26.12.41.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:41:41 -0700 (PDT)
Message-ID: <cea52bbf-04cd-8b24-5b7d-8dbd18bda42b@mind.be>
Date: Sun, 26 Sep 2021 21:41:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org,
 "Chan, Donald" <hoiho@lab126.com>
References: <20210925083349.3233388-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210925083349.3233388-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pip: needs python3
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/09/2021 10:33, Fabrice Fontaine wrote:
> python 2 support has been dropped since version 21.0 resulting in the
> following build failure since bump to version 21.2.4 in commit
> 3491f34d9ed97ac5980ff4a450367914b6985ff1:
> 
>    File "setup.py", line 7
>      def read(rel_path: str) -> str:
>                       ^
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ed74f4ca96332454af329fac23505000c379d4a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/python-pip/Config.in         |  5 ++---
>   package/python-pip/python-pip.mk     |  1 -
>   package/python3-pip/python3-pip.hash |  1 -
>   package/python3-pip/python3-pip.mk   | 19 -------------------

  You removed python3-pip which is no longer needed, you forgot to mention that 
in the commit message.

  More importantly, though: python3-cryptography still depends on it.

  However, there are a few things wrong with python3-cryptography.

  Since your commit 0c7e30b43a, python-cryptography depends on python3. So 
python3-cryptography already became redundant at that point. However, 
python3-cryptography is a host-only package, while python-cryptography is a 
python-only package, so it's a bit more work to get rid of it.

  Since commit c64abc693 (which precedes the above commit by a couple of days), 
James "stuck" the version of python-cryptography to 3.3.2 which is the last one 
to support python2, while the current version is 3.4.8. So a version bump is in 
order.

  Also, there's something fishy about python3-cryptography: it depends on 
python3-pip, while (target) python-cryptography doesn't depend on python-pip 
(neither build nor runtime). This has been the case since Donald Chan created 
the package in commit 7cee1f6e. Chan, can you comment on this?

  So what I think should be done:

1. add host-python-cryptography;
2. remove python3-cryptography;
3. remove python3-pip (which is now unused);
4. this patch.
(5. bump python-cryptography to 3.4.8 - pretty much independent of this patch)

  Regards,
  Arnout


>   4 files changed, 2 insertions(+), 24 deletions(-)
>   delete mode 120000 package/python3-pip/python3-pip.hash
>   delete mode 100644 package/python3-pip/python3-pip.mk
> 
> diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
> index 61d8d7d317..92c3e3bd46 100644
> --- a/package/python-pip/Config.in
> +++ b/package/python-pip/Config.in
> @@ -1,9 +1,8 @@
>   config BR2_PACKAGE_PYTHON_PIP
>   	bool "python-pip"
> -	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
> +	depends on BR2_PACKAGE_PYTHON3
>   	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
> -	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
> -	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
> +	select BR2_PACKAGE_PYTHON3_SSL
>   	help
>   	  The PyPA recommended tool for installing Python packages.
>   
> diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> index ba7134e235..81fc87d5f0 100644
> --- a/package/python-pip/python-pip.mk
> +++ b/package/python-pip/python-pip.mk
> @@ -4,7 +4,6 @@
>   #
>   ################################################################################
>   
> -# Please keep in sync with package/python3-pip/python3-pip.mk
>   PYTHON_PIP_VERSION = 21.2.4
>   PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
>   PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
> diff --git a/package/python3-pip/python3-pip.hash b/package/python3-pip/python3-pip.hash
> deleted file mode 120000
> index d90fb3d005..0000000000
> --- a/package/python3-pip/python3-pip.hash
> +++ /dev/null
> @@ -1 +0,0 @@
> -../python-pip/python-pip.hash
> \ No newline at end of file
> diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
> deleted file mode 100644
> index 5e20b06865..0000000000
> --- a/package/python3-pip/python3-pip.mk
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -################################################################################
> -#
> -# python3-pip
> -#
> -################################################################################
> -
> -# Please keep in sync with package/python-pip/python-pip.mk
> -PYTHON3_PIP_VERSION = 21.2.4
> -PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
> -PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
> -PYTHON3_PIP_SETUP_TYPE = setuptools
> -PYTHON3_PIP_LICENSE = MIT
> -PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
> -PYTHON3_PIP_CPE_ID_VENDOR = pypa
> -PYTHON3_PIP_CPE_ID_PRODUCT = pip
> -HOST_PYTHON3_PIP_DL_SUBDIR = python-pip
> -HOST_PYTHON3_PIP_NEEDS_HOST_PYTHON = python3
> -
> -$(eval $(host-python-package))
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
