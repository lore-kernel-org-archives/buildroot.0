Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11CDCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:58:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C547C611BF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 19:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C547C611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11A46076A;
	Wed, 13 Oct 2021 19:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X5xxNfRYaCgG; Wed, 13 Oct 2021 19:58:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD06560D6E;
	Wed, 13 Oct 2021 19:58:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F9391BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BC4E40219
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 19:58:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JHoPfZ9ywqjy for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 19:58:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4601640155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 19:58:46 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id z20so14943831edc.13
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 12:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aEfBbU/EaqCyFU2RzxY9UQG2f0G/HH46VGJlgQRFPl0=;
 b=PxSx02vEi6a5mkRqrIMW+gIuSDHRXj5FWJS/0MIhOwooNzCA9IUlIigtE4EXx3/Ppt
 gEr6V3LAVdxLRQ4pQXFy09b/YVBfq2MCaW1hxkFkdRrLetFiAvQbNsulh0aCs05d/a/p
 H+n25afHvCSnqJezgLxLrVlruql2SwB2w0StuQnaAJ6bAk8/olAw4OOcC92TozAqQdfG
 ghLTdRipJlPjDDGoBW8XTaLf9t9JkPG1ELmlXwIuCmIll05bbnKXRQk4h48PCHva3yAn
 sE/EKjUQ81qqqZiTV+H5xARufLv1GGv4ZMKRmu4ehRK+5s5OISmtpDji3lSSzki2dnUJ
 aj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aEfBbU/EaqCyFU2RzxY9UQG2f0G/HH46VGJlgQRFPl0=;
 b=QJatK/BLpwTQ4atXV8lujs5QGKIhUIawK3Jzdj5nHh/JVEXKv7z0iGOLSDoHNMWyqJ
 ARmwd+KokHAjeE7T5DhFqZL0O/zn3C+SqpPy4RM6JVc/qV0+i3Dq/DqZkBPy18LmZC5e
 CoQeaRkcsZXCgUFkyMblTTWqCgHEgQKOpLA9W/vkFUN9jRePVMoMqgXHYh6nF8KZ1NUn
 dKg7gcXuWs9pfxQcDe6r56Bg0vNX5fba7DtPn1zhDFisu7sWxDt2g2YKXJEydJpoMRHw
 vzFOKQdTDmIwr+hIhcv5wQMTl5u7/io+oofYl5lrR1TqZP86pQY3Z54cZaWrExXlViG8
 Vg+w==
X-Gm-Message-State: AOAM530xwgkztHtUND+NAUtDePj7gNsPp1XKy+kNN7zDmQZVP1NiOZvN
 sV51exwdKvaipMFzjO9d5w47QQ==
X-Google-Smtp-Source: ABdhPJw5C6A0SAGogjxDzOsFaFAXzmsfjtwMXDMOwnO5y84O9FEpPD0fpCviH24tduDQkPRNFeOefA==
X-Received: by 2002:a05:6402:3585:: with SMTP id
 y5mr2001207edc.323.1634155124374; 
 Wed, 13 Oct 2021 12:58:44 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id z1sm452142edc.68.2021.10.13.12.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Oct 2021 12:58:43 -0700 (PDT)
Message-ID: <fe9fadee-1f34-6d57-e43e-7569444ae111@mind.be>
Date: Wed, 13 Oct 2021 21:58:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20211007181629.3240272-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211007181629.3240272-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version
 4.2.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/10/2021 20:16, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-ujson/python-ujson.hash | 4 ++--
>   package/python-ujson/python-ujson.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
> index 8dd52fd6fa..fc897c381b 100644
> --- a/package/python-ujson/python-ujson.hash
> +++ b/package/python-ujson/python-ujson.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/ujson/json
> -md5  f8223127259c6a1f7d0e750fc88d19fd  ujson-4.1.0.tar.gz
> -sha256  22b63ec4409f0d2f2c4c9d5aa331997e02470b7a15a3233f3cc32f2f9b92d58c  ujson-4.1.0.tar.gz
> +md5  9a90e2e9f1d465c2121b8d10f837f53a  ujson-4.2.0.tar.gz
> +sha256  fffe509f556861c7343c6cba57ed05fe7bcf4b48a934a5b946ccb45428cf8883  ujson-4.2.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
> diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
> index 88e220b1a7..68781c6170 100644
> --- a/package/python-ujson/python-ujson.mk
> +++ b/package/python-ujson/python-ujson.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_UJSON_VERSION = 4.1.0
> +PYTHON_UJSON_VERSION = 4.2.0
>   PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
> -PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/2c/8d/63b4afe82d646a606cef838855a6110c7a3a012622e656bd29fb2d15f1d1
> +PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/df/69/e8f615e1a779e2d2d23d29d56dc55bbb1db2a828f0ef36d10bc697d63968
>   PYTHON_UJSON_SETUP_TYPE = setuptools
>   PYTHON_UJSON_LICENSE = BSD-3-Clause
>   PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
