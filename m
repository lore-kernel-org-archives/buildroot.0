Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98874EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 13:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4634961114;
	Sun, 18 Jun 2023 13:11:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4634961114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A9ZRLQR5Ne24; Sun, 18 Jun 2023 13:11:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78AC460B35;
	Sun, 18 Jun 2023 13:11:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78AC460B35
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D28D1BF59E
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:11:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 078E040363
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 13:11:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 078E040363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UyFnnc_D2L9f for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 13:11:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED639400FB
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED639400FB
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 13:11:20 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9829a5ae978so409322366b.2
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 06:11:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687093879; x=1689685879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QcPTo/uB2y68n9EQknE32Z33MgjvkyXO1IHslpEjTXU=;
 b=gkwAWOaCf8qp+SooOcqudOa3KK5h+QP/jjuAqy8aeAiMgu23m9ze2qSKwIsgnCvFHE
 i20x6pv/xPg1q5KxOiSOBzfcRJ5R6229bpfdZlFWpI+P88fGPA9mgWd7KJX2nTAHcQ0C
 wDvh6Plb/0DCM9lVHW2Bti8MEz4B+Qvo2kokRDJXQIUv6WCBIbQ3nvER4TU/NOsG8bni
 kT7xqizhwibb7+pcb06tmVhdYXCpS1p9pSipm7ZrwVP8149o0tBQI1FKAjeJhNsYaPEA
 o5WajDteZQwOX15y63pf7i2UEnd04txdFussqKtIqJ/s3vdkMMxiP/4mKCoQzKsFBlXY
 hsyA==
X-Gm-Message-State: AC+VfDzcmGp1bvmcnFM6aFCB0D4sc3GjOhPThwi/fs+C1lquj17F3uS9
 sQEMjq92v1hDLTpvn8YGKrZn5A==
X-Google-Smtp-Source: ACHHUZ5MX+q0gYk9gyQHVlklRA1/l2y524/km/vDvCv9VmGIkKMqTUFL67gusjADI1QsciOoJxTK0A==
X-Received: by 2002:a17:907:86ac:b0:978:4027:57eb with SMTP id
 qa44-20020a17090786ac00b00978402757ebmr7506106ejc.47.1687093878526; 
 Sun, 18 Jun 2023 06:11:18 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a170906945000b00988676bf5aesm1074800ejx.141.2023.06.18.06.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 06:11:17 -0700 (PDT)
Message-ID: <ac0c14a2-3c55-cc15-ddc1-3273275eacac@mind.be>
Date: Sun, 18 Jun 2023 15:11:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230605073734.1891816-1-james.hilliard1@gmail.com>
In-Reply-To: <20230605073734.1891816-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687093879; x=1689685879;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QcPTo/uB2y68n9EQknE32Z33MgjvkyXO1IHslpEjTXU=;
 b=WZKTBOY3+hrLbtEdut+NfyOR8ERMBnR+REgkwWHzrOJ/7q+io+D5bqK8WnE700A4f5
 uXsJgYIikqYJxjLN0OziFK7DhyMTxJiqGFwIHQfrXK23aR7LMKkdGVGcGSSmcje/93PI
 Ix1RxGqEgdzcnHoNTbJBN7KKLuFOENQIpzCJxTUqq1x4kFuFSZmyYiVqWs+Aq4M92Tjq
 LDzZHyW/qvbfKjxwTCJdsh73p30YXoWF8v6uroBT1xXkGUHzi31otyIOVCyYr1ngWgLb
 Rj7syA8BQ9Ms8ypAgzDtVix6griEmBPgAXO7bKk5EsYusdn9ULt5DjQSNU1DoEh9xMe9
 M1Cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WZKTBOY3
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyphen: bump to version
 0.14.0
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



On 05/06/2023 09:37, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-pyphen/python-pyphen.hash | 4 ++--
>   package/python-pyphen/python-pyphen.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-pyphen/python-pyphen.hash b/package/python-pyphen/python-pyphen.hash
> index 39af62e085..47b9009ea1 100644
> --- a/package/python-pyphen/python-pyphen.hash
> +++ b/package/python-pyphen/python-pyphen.hash
> @@ -1,6 +1,6 @@
>   # md5, sha256 from https://pypi.org/pypi/Pyphen/json
> -md5  a5039d1a4d8d4bad784cb864927f83f8  pyphen-0.13.2.tar.gz
> -sha256  847f57a043a58408f24670ae0184ff6edfb5fd5731743208228c028ddc514438  pyphen-0.13.2.tar.gz
> +md5  19e799bbf459ac675698c37c5fae34a8  pyphen-0.14.0.tar.gz
> +sha256  596c8b3be1c1a70411ba5f6517d9ccfe3083c758ae2b94a45f2707346d8e66fa  pyphen-0.14.0.tar.gz
>   # Locally computed sha256 checksums
>   sha256  9f0bffde4fbbbbc61c46f6577b6f472919dba9fdffabe74e8a7e44ac5dbef7a2  LICENSE
>   sha256  2233a3eecf299bc271f1a9f57f0b3198343ad4ab16571d70320133002c51496b  COPYING.GPL
> diff --git a/package/python-pyphen/python-pyphen.mk b/package/python-pyphen/python-pyphen.mk
> index 9ca064c293..9baa2e7b98 100644
> --- a/package/python-pyphen/python-pyphen.mk
> +++ b/package/python-pyphen/python-pyphen.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_PYPHEN_VERSION = 0.13.2
> +PYTHON_PYPHEN_VERSION = 0.14.0
>   PYTHON_PYPHEN_SOURCE = pyphen-$(PYTHON_PYPHEN_VERSION).tar.gz
> -PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/46/12/aeb28a1e1a3f3cede967cea98ef3a1da844418ab8296a4bb9513f232736c
> +PYTHON_PYPHEN_SITE = https://files.pythonhosted.org/packages/4b/52/46b119f94b3f68e4193ada36941606d8e26852b67bb6e099b0e310540b41
>   PYTHON_PYPHEN_SETUP_TYPE = flit
>   PYTHON_PYPHEN_LICENSE = LGPL-2.1+, MPL-1.1, GPL-2.0+
>   PYTHON_PYPHEN_LICENSE_FILES = LICENSE COPYING.GPL COPYING.LGPL COPYING.MPL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
