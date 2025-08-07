Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E3ECA0EC2
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC4D580428;
	Thu,  7 Aug 2025 18:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMMCtralRY7M; Thu,  7 Aug 2025 18:24:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23963806FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23963806FB;
	Thu,  7 Aug 2025 18:24:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D2AE4C4
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F367400B3
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nE2wtjXxHKD4 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 64B3440057
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64B3440057
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64B3440057
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-458bc3ce3beso8571605e9.1
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591047; x=1755195847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMzUT44NrihQb6ejSjW01WAc5NYnn1Ci0Uf/nRZxj1c=;
 b=gmKzEk0rRBybTvPteWOTkW6MZ2VgWgQSJmCIRF9MfThvRXJFdq4VIc65fiGAtIxA0d
 4a+4Dr6Qg4qX0VtAoqYYd6ehis+D/43H3677JJotSRq+f2jgLmcvwnNphxGiYGyxF/as
 cWI7Q9h48EUnVeTcuDJiRKMcTE+fpWV3wTvmPGfydljGiSFNDfjHcxZSdq48qnjzA5QT
 QnvWTc+6mXhM6qPgB3fFzF01e4kav0klO0nshR4xDHuvuQClzLMHaXh9lHacX+oYiOER
 S26KrOxWtA5lGCWYUiTm/Y/YN3tp4L1WGNn2UbG6ayYhFvTOzy3vsed2nFf2cJalcTvn
 0h8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiVOS4WHcCJuaT4uL/jAcAlOQkn1YlDL3kQk8WRlZ04jBbGCEIh/Mk3ToyjjzKZkiFmz18zmQrqc8=@buildroot.org
X-Gm-Message-State: AOJu0YwzCd9D43rVX9NtxKWsqpoEKNgLeYWLlQx5i6+y9sqOMoBFiZlc
 E9yznVHBrGbNdT3Kzw2+L8fn4Q15jgAdm4Pz2BE0TxvWTklQqDP68fGKUL2HiFQVt1Jji5WAuZv
 BM4Bs
X-Gm-Gg: ASbGncvRieOEqZ+NIbK5u4ewIjSBns7OZy6uj1gNShqouCJA+pdDYosf5OHGWZNBA6w
 mRlcfU4lqFVLUjSEN7FO3qpVvYR9LGLuqxZmZjN3ZA8BGrxqidMKfD5kTQeUL4MvbRClV/IOL5a
 F/idSf9P89U153YmkpAcspYKt/HfFkPlOaBCaIEw4VnLJD1ZH1U9fEzrY0Gmyd56ZtaqT/PQuuO
 qsKvN4zYsbqj/5HyU5dDSosWG6Mb6YC+mmoj7cd93a13IZWqfTPDIw3URNnFCs1wqVkjRoF/cG0
 8Yd671U5oTfSp6Lzt7M/kcwKC+QgzFdbThX5Uopu/e8ZKoRKQAecfB+HERDELg5pQ2DUeFTRzHD
 A0vbpC4WeL8dAdJQW4HnJ5PmF
X-Google-Smtp-Source: AGHT+IGRA5z+HeS6OlHM2M3trJJhJl31GJkJF7QUQS5/zIujKSenaKgetc+1jj3agCkKF98heUF81Q==
X-Received: by 2002:a05:600c:1912:b0:459:e094:92cb with SMTP id
 5b1f17b1804b1-459f4eba4a3mr184745e9.12.1754591047447; 
 Thu, 07 Aug 2025 11:24:07 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459dc2647f6sm86486985e9.2.2025.08.07.11.24.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:07 -0700 (PDT)
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:06 +0200
Message-ID: <20250807182406.724491-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715231957.833460-1-james.hilliard1@gmail.com>
References: <20250715231957.833460-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591047; x=1755195847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMzUT44NrihQb6ejSjW01WAc5NYnn1Ci0Uf/nRZxj1c=;
 b=aYE9ReDrxNh0LJ+yzuwO9XhVm1deS7tO/psb2qPjss4hYL90A6xf0LxnWEt+HneflY
 anlnTHdn5C3YNb4BfQxuDkfqHPOwWwnLIMZhBkYbzDRg8CtF58W1fzl3b0kSWCxzGGrW
 /dlzc54+2L69tWYWXqv/Iitd9uoxM1BRlKYpztVgY8khJMizBTMS/j2MQwjd9QdT0/kT
 b92m++A8n490tAE+1AF0sLGwGgoNYHzAItvWdEI1wzHiY11BLCNM3iVVdjy5yfJ0XEWi
 K4RiaxfO7Riy0zdiAvE245DVp3bwWCakEPRweouBzTj0hUhURBYFWmLPfOhyZ/IoLQmP
 201A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aYE9ReDr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cython: bump to version
 3.1.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/python-cython/python-cython.hash | 4 ++--
>  package/python-cython/python-cython.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-cython/python-cython.hash b/package/python-cython/python-cython.hash
> index cd320eaa2a..25fa1d93ba 100644
> --- a/package/python-cython/python-cython.hash
> +++ b/package/python-cython/python-cython.hash
> @@ -1,6 +1,6 @@
>  # md5, sha256 from https://pypi.org/pypi/cython/json
> -md5  388b85b7c23f501320d19d991b169f5d  cython-3.0.11.tar.gz
> -sha256  7146dd2af8682b4ca61331851e6aebce9fe5158e75300343f80c07ca80b1faff  cython-3.0.11.tar.gz
> +md5  6fb2dc869f4d00b4a13e130ec1197bfd  cython-3.1.2.tar.gz
> +sha256  6bbf7a953fa6762dfecdec015e3b054ba51c0121a45ad851fa130f63f5331381  cython-3.1.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  9568a2b155e66ac3e0ba1fd80b52b827b9460e6cf6f233125e7cbca8e206ddc3  LICENSE.txt
>  sha256  e1eb1c49a8508e8173dac30157e4a6439a44ad8846194746c424fbc3fc2b95d7  COPYING.txt
> diff --git a/package/python-cython/python-cython.mk b/package/python-cython/python-cython.mk
> index 51086bedab..cffd613787 100644
> --- a/package/python-cython/python-cython.mk
> +++ b/package/python-cython/python-cython.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_CYTHON_VERSION = 3.0.11
> +PYTHON_CYTHON_VERSION = 3.1.2
>  PYTHON_CYTHON_SOURCE = cython-$(PYTHON_CYTHON_VERSION).tar.gz
> -PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/84/4d/b720d6000f4ca77f030bd70f12550820f0766b568e43f11af7f7ad9061aa
> +PYTHON_CYTHON_SITE = https://files.pythonhosted.org/packages/18/40/7b17cd866158238db704965da1b5849af261dbad393ea3ac966f934b2d39
>  PYTHON_CYTHON_SETUP_TYPE = setuptools
>  PYTHON_CYTHON_LICENSE = Apache-2.0
>  PYTHON_CYTHON_LICENSE_FILES = COPYING.txt LICENSE.txt
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
