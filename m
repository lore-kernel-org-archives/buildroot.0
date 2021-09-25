Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14635C433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84E2A61284
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84E2A61284
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54EC5607CC;
	Sat, 25 Sep 2021 09:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U-e98o-EtNkC; Sat, 25 Sep 2021 09:55:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 846BB607A1;
	Sat, 25 Sep 2021 09:55:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 793B11BF29E
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75E69607A1
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:55:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b9BOSubWjoZG for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 09:55:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D3E16070B
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 09:55:24 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id a3so18202951oid.6
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 02:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PrTv1smNToh+9mITJxXzAwHnzFPpZ+8y/sNNcqGZCis=;
 b=fqVSMhm74l7JQdsytwDRTOWXmEU0RhvJd9Mm7j1+aID9Kval+2P4ItAedk9IYlA98Q
 S5SekKDvj/zGFyq3fN8jDVN/WzyycSmuNaj8iRTOti1Ko9wjk5bpenGbskoZbt/O6p8v
 X6PoW0KzbfbIO+Ez56UP6yP1oQcnuWVpvD5Fhe61ensHtm86Zm1ZTA/ex9Kn6J5016B7
 pmdMWr/a5rvujzjhrdYC/530KbkYLMwmRWMt4YKNAg/fKaX05LSbQjU38F8K22DmG8U1
 h5GMIZArDjyEyvrMZBNmK86X2GVbJAJ1nYObCdFmvhS+VRKFI03nlvg4mv7jtfkIIN/J
 iK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PrTv1smNToh+9mITJxXzAwHnzFPpZ+8y/sNNcqGZCis=;
 b=JtdAD/4T5m+Bi0x3f5KnyjmF3QuHI/WQGZDhIXibfQQs/iIJHMl9lgZ6cq5F3KvtPl
 VHJKcNPSpK7wMpqvZ+qHyBX7ImHKhC/n+0wEUW0ZyJqShNQK2Jj9Ix4azvcjIi0i8UOj
 1FMXsPBKGf8AsGimv6YZZFT8huR4LZYuWvd6YlHve2eBAVIMCqyZz9y7dOMaavOfaePF
 Qxzs1tGTsO9Splb7++SaATUvcfUvx0ylyg5UuCfp/cQZSCxkad3FLOVJwxXc2e6brcXt
 TjPYPiqa/U/U4qFHsBWYx1G6v2kqxb71gq/d73DYs6Dqf47M2Jj+ZuybsN7fh+7wsK+0
 woAA==
X-Gm-Message-State: AOAM531VAwroXsDIBD0xUxL2ZmjVSh4NlaPlg0JRkMlTKM6MbXi4T6Tz
 WUYKwJ7PX/fFUrFRpXeDUe5endBgV8XKBR2QwypyWE53E2o=
X-Google-Smtp-Source: ABdhPJya4rD/mj0XbMdNvSMUNp2vwoZ2PxAUiH+OvxtXRRtleBant3sq+HDIGi4R9v6eNqjo0SsNKDyOt4X3wzLyTzo=
X-Received: by 2002:a05:6808:1641:: with SMTP id
 az1mr4861425oib.67.1632563723519; 
 Sat, 25 Sep 2021 02:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210925094626.365400-1-asafka7@gmail.com>
 <20210925094626.365400-4-asafka7@gmail.com>
In-Reply-To: <20210925094626.365400-4-asafka7@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 25 Sep 2021 03:55:12 -0600
Message-ID: <CADvTj4rsyZVgC+fyjh5MPyhXDL2Nyoi=1bXKPxgZu+Lhwwu05w@mail.gmail.com>
To: Asaf Kahlon <asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-multidict: bump to
 version 5.1.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Duplicate of:
https://patchwork.ozlabs.org/project/buildroot/patch/20210922064758.190101-1-james.hilliard1@gmail.com/

On Sat, Sep 25, 2021 at 3:47 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-multidict/python-multidict.hash | 4 ++--
>  package/python-multidict/python-multidict.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-multidict/python-multidict.hash b/package/python-multidict/python-multidict.hash
> index 6b78301200..65af9a58e5 100644
> --- a/package/python-multidict/python-multidict.hash
> +++ b/package/python-multidict/python-multidict.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/multidict/json
> -md5  b1dab3349efe90934ae3612f1202b733  multidict-5.0.2.tar.gz
> -sha256  e5bf89fe57f702a046c7ec718fe330ed50efd4bcf74722940db2eb0919cddb1c  multidict-5.0.2.tar.gz
> +md5  df8b37f069809779214d6b80b250e45b  multidict-5.1.0.tar.gz
> +sha256  25b4e5f22d3a37ddf3effc0710ba692cfc792c2b9edfb9c05aefe823256e84d5  multidict-5.1.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  a1c5825513279d3085a0ba46880e148ea3710c149bbaedcf2d11605a5ed3c4ad  LICENSE
> diff --git a/package/python-multidict/python-multidict.mk b/package/python-multidict/python-multidict.mk
> index a7043643c5..edf9656043 100644
> --- a/package/python-multidict/python-multidict.mk
> +++ b/package/python-multidict/python-multidict.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_MULTIDICT_VERSION = 5.0.2
> +PYTHON_MULTIDICT_VERSION = 5.1.0
>  PYTHON_MULTIDICT_SOURCE = multidict-$(PYTHON_MULTIDICT_VERSION).tar.gz
> -PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/da/e6/50c7f52781f45c2b37c77e962c30a3944a9e79a46ea92956e826c24d3432
> +PYTHON_MULTIDICT_SITE = https://files.pythonhosted.org/packages/1c/74/e8b46156f37ca56d10d895d4e8595aa2b344cff3c1fb3629ec97a8656ccb
>  PYTHON_MULTIDICT_SETUP_TYPE = setuptools
>  PYTHON_MULTIDICT_LICENSE = Apache-2.0
>  PYTHON_MULTIDICT_LICENSE_FILES = LICENSE
> --
> 2.33.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
