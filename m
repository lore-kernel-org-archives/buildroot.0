Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FA1EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B80BE817FD;
	Sun, 25 Jun 2023 13:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B80BE817FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ukGPoAAHNWxz; Sun, 25 Jun 2023 13:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D00F181767;
	Sun, 25 Jun 2023 13:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D00F181767
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EA66F1BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF9B441568
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF9B441568
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bo_Ouav24SYO for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:43:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5ACDD4155B
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5ACDD4155B
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:43:47 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51d95aed33aso206833a12.3
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 06:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687700625; x=1690292625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qh2iFd/97fNi7IXWDph71qB0igpo7KaA4lZRoAngxhI=;
 b=X9VoCDISmWtJsMhW9zeZvIK3XvXFAYINB2I/LtVhab1hREYlSIabhx8AONelrJmQ7H
 V8IrqWs6Hp6ckJ7unlaMqSlFQ4cFj0w6Za27WsFcibuZd4YHYFvwLm0cNs44aWqiQF7b
 rVXQ4+xfA+PLCHp2aQziA/j4vn3zTci7KeGsJHXQddxrOo3DCfhDdt+OJ70nM0lo2Vpp
 tgYeSu+IyuJNZwpsy4Ex9dV8h62kf37jghxDpbjU+jJnYfYVAbvb39LkLZgWKUuhOVmF
 BLcgM/AHmCKWfvwgZRoiX5zfzy+AnBbXBBhO2hRO9Joy+9Ne55GRttRQ5JYNvnh2sJQd
 x8Mg==
X-Gm-Message-State: AC+VfDw6KTXIIlZPdogaYxbKmgl2Zd5RAr/+t8D7F3F0emhgIlIvwokl
 Wmyg0s5Kb8cQvnYKn3QY89LBp0vhTEhRcJen2/o=
X-Google-Smtp-Source: ACHHUZ715JFGkCOuHSR57hnlsGrg5B3ggcMZFLBvVT9Bxl+mvM2upSqmnSn0PQEZJIu/CxH+Zd9u5Q==
X-Received: by 2002:a17:907:31c3:b0:95e:d3f5:3d47 with SMTP id
 xf3-20020a17090731c300b0095ed3f53d47mr19022451ejb.48.1687700625381; 
 Sun, 25 Jun 2023 06:43:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 qp18-20020a170907207200b00988c3e96294sm2070401ejb.30.2023.06.25.06.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 06:43:44 -0700 (PDT)
Message-ID: <170f1f90-7d7c-3135-3f65-61ebcdc6d50f@mind.be>
Date: Sun, 25 Jun 2023 15:43:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Marcin Niestroj <m.niestroj@grinn-global.com>, buildroot@buildroot.org
References: <20230622052731.3216143-1-m.niestroj@grinn-global.com>
In-Reply-To: <20230622052731.3216143-1-m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687700625; x=1690292625;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qh2iFd/97fNi7IXWDph71qB0igpo7KaA4lZRoAngxhI=;
 b=bpzELEZsrQozGvKhIeou4kOiYrObYTBrxcKHQGFsKyCZZNW7K2qQNCvE9VXK8YTwYa
 bRmkNlq2HfpBNo1XqSVAev/rH+ayDAlNk3rtA/mXC+xoMa0+nTh16798PWuNInvUtEUZ
 18j9VM5NAQ6+1TgzUcgINRpefjviDGfSto2J2tp7W05Fk06JDHP5YTp1vkcj95zT3sjc
 eUf0Zj1SAK/MbFrrqcFTLnE36+Yp8YlBqykUHC6SbPLhDpZ1twXJbLEz0pop3EMp9JS3
 Ne8rzEZy5IXJlCJlBgA9u7KMoqqC/Na2yzyZL8B1be5ZR1VBkzBUNtoCYWzaoiSHwiLL
 DlHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bpzELEZs
Subject: Re: [Buildroot] [PATCH] package/python-packaging: bump to version
 23.1
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



On 22/06/2023 07:27, Marcin Niestroj wrote:
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-packaging/python-packaging.hash | 4 ++--
>   package/python-packaging/python-packaging.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-packaging/python-packaging.hash b/package/python-packaging/python-packaging.hash
> index e10c11904b..0e339ea573 100644
> --- a/package/python-packaging/python-packaging.hash
> +++ b/package/python-packaging/python-packaging.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/packaging/json
> -md5  806414ea4c6f17b029a7911b622062e8  packaging-22.0.tar.gz
> -sha256  2198ec20bd4c017b8f9717e00f0c8714076fc2fd93816750ab48e2c41de2cfd3  packaging-22.0.tar.gz
> +md5  f7d5c39c6f92cc2dfa1293ba8f6c097c  packaging-23.1.tar.gz
> +sha256  a392980d2b6cffa644431898be54b0045151319d1e7ec34f0cfed48767dd334f  packaging-23.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  cad1ef5bd340d73e074ba614d26f7deaca5c7940c3d8c34852e65c4909686c48  LICENSE
>   sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.APACHE
> diff --git a/package/python-packaging/python-packaging.mk b/package/python-packaging/python-packaging.mk
> index c9190ccfee..aac4d76ee2 100644
> --- a/package/python-packaging/python-packaging.mk
> +++ b/package/python-packaging/python-packaging.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PACKAGING_VERSION = 22.0
> +PYTHON_PACKAGING_VERSION = 23.1
>   PYTHON_PACKAGING_SOURCE = packaging-$(PYTHON_PACKAGING_VERSION).tar.gz
> -PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/6b/f7/c240d7654ddd2d2f3f328d8468d4f1f876865f6b9038b146bec0a6737c65
> +PYTHON_PACKAGING_SITE = https://files.pythonhosted.org/packages/b9/6c/7c6658d258d7971c5eb0d9b69fa9265879ec9a9158031206d47800ae2213
>   PYTHON_PACKAGING_SETUP_TYPE = flit
>   PYTHON_PACKAGING_LICENSE = Apache-2.0 or BSD-2-Clause
>   PYTHON_PACKAGING_LICENSE_FILES = LICENSE LICENSE.APACHE LICENSE.BSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
