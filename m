Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDFEC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 12:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 878F260FC2;
	Sun, 24 Jul 2022 12:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 878F260FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmoNb-dA3ImE; Sun, 24 Jul 2022 12:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7BE60B05;
	Sun, 24 Jul 2022 12:19:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E7BE60B05
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C209D1BF344
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:19:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C1B160F69
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 12:19:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C1B160F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6pA3HbkHuTk3 for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 12:18:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4135F606A9
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4135F606A9
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 12:18:59 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 b21-20020a05600c4e1500b003a32bc8612fso4836537wmq.3
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g/s7l6bcVnlweBppAcZI7JHd3JljlqMfM6QXEopRfLY=;
 b=67Rf4+vlo8mcItiNolpO7HYuZ6jFGX/s+vimSDnmeC3e63isk1x3RUwiE0TwXLK3Hq
 MiOenHO5038uTq7alPp3hAMrJE76Mn0iAo+WvFpn5/gzMY6XSoEd1XnCXYFk7zVZNnYm
 nUyR1EbxfEp7LsghxzNChW+rR5Ph7iCKXwinPeEMi3oqKmZNrOqMTzmH/IsVALMpNt29
 Asb9vYqM5xgLADkRdj4CjhDkeiPQ886RPN+Q9Dw0n4vE1qi4vNgL+9OXSFsex56Hx2+G
 awvjAr8Y50ZssW7ZQYIEMLsUV5EViPAYXkXsADQlaqIddvMLcRPHqbMtOlomgG4Ze+Cb
 ILeA==
X-Gm-Message-State: AJIora8QBUGtrDIc351FfJ4qpXOaJQ6cfTRKlx7eE2rfl5dfyU61H6RH
 DqzYO+FqvMWqvgaiowf2kEA9Gw==
X-Google-Smtp-Source: AGRyM1tl6dflJZyWkUUWnceaeCJ9X02UyfA3Yz6xmCJ0B/7BtLHk/nXARfpUkhTOz+NpOJzjvAI/+A==
X-Received: by 2002:a05:600c:4313:b0:3a3:2c86:9b5c with SMTP id
 p19-20020a05600c431300b003a32c869b5cmr5466500wme.65.1658665137175; 
 Sun, 24 Jul 2022 05:18:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b003a3442f1229sm7101729wmq.29.2022.07.24.05.18.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 05:18:56 -0700 (PDT)
Message-ID: <7c8dfd17-1f82-9667-d85d-e16724c111fe@mind.be>
Date: Sun, 24 Jul 2022 14:18:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220723230920.364671-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220723230920.364671-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g/s7l6bcVnlweBppAcZI7JHd3JljlqMfM6QXEopRfLY=;
 b=hC3w2xb7cTMRgzllLZgLdlc7qAnckeEOL+nMXV+goustLbU0g0U1qlE+5XlFsGy6rG
 iVVL0srVtPiiKzFLMSg03gueib7zRj7/c11DWT7D+mdvmTJ6Swae/XXVYPiSjhC/b4sC
 gWg0s7PJ24G6IhYAps9jrfkZi+3UXCytO4WcV8lpnn8tFmorA7oKDwLHCsGXLnacaW8P
 G4VS4vS+wY8EfipHR/jwkZ4nYz9WK+9UNGxEXP4Rn6VGizRk4rSxLhLWjvPSh6EF72qZ
 SyzHHtdm6xvS8xJws2nIrHKF3dwfmZ65VO0Ui66DjzmJ6EuTdZYSl8sFMXe56uLQV0jy
 F2lw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hC3w2xb7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.4.1
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



On 24/07/2022 01:09, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied this as well as the other N python module bumps to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
>   package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
> index 2375c7528f..3215f2b65d 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.hash
> +++ b/package/python-setuptools-rust/python-setuptools-rust.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
> -md5  9760ac511ebe33c759b76efb0a1299dd  setuptools-rust-1.3.0.tar.gz
> -sha256  958c5bf4ab6483d59dab888538121871cc5006354a42fb0fbd50acf03caad1de  setuptools-rust-1.3.0.tar.gz
> +md5  c51ca03d0a6a91ffc3a036822a2deb54  setuptools-rust-1.4.1.tar.gz
> +sha256  18ff850831f58ee21d5783825c99fad632da21e47645e9427fd7dec048029e76  setuptools-rust-1.4.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
> diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
> index c342773476..44c736ed11 100644
> --- a/package/python-setuptools-rust/python-setuptools-rust.mk
> +++ b/package/python-setuptools-rust/python-setuptools-rust.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_SETUPTOOLS_RUST_VERSION = 1.3.0
> +PYTHON_SETUPTOOLS_RUST_VERSION = 1.4.1
>   PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
> -PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/a9/55/5db4a5b137af2afdc23a6e251d5ebb3b4e04c8deb68fbb5ffdacbd134c0c
> +PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/ed/c6/8effd679eb1cb6d3fd9fc7837cf86c6e4c1ba7a33c3e5e35c741c04016c5
>   PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
>   PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
>   PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
