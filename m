Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B83C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:55:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9424E6105A
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:55:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9424E6105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EB46607CC;
	Sat, 25 Sep 2021 09:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8F7ukwjL-0Qy; Sat, 25 Sep 2021 09:55:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2D77607A1;
	Sat, 25 Sep 2021 09:55:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E6F81BF29E
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BCC1404E7
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yKuWV01Oi3E8 for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 09:55:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F3DC404EF
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 09:55:51 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 l7-20020a0568302b0700b0051c0181deebso16621309otv.12
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 02:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bFqrlIVOJWqLfUrDR7s3wm2cSgZBEIKcTvUyPkDHD+Q=;
 b=plAgKnWwbZ5WHez+W1ymTVIyGPsj3ODl5B19BdPOY8mJXJhaK6D9DlI3F53Ph6+pNu
 HMRAJs3DlRgVvYYMB8Y2gc1gRSgUnJ9TDCtQD+hSHB4gaz72WMQzstesWBLooURThEJO
 n8Og+EdEIT+Y8KOW+0vGnea42dwR6Fxriqf26DE5F8XN3v9kEbAzHknjMYJnUXY8JAAU
 N2WWmMJ7dDkFekg/D7tvUbizr2zj2hzCbP+aIjW7WQsmR+oPElpklEzyjPIZw3oUcOlP
 gUFwCY+LlI/8Yq8w46I5Ph5vsaHCzEwDKXWvmwPgtrsUMBWOFP6NsCrOn184zx4XzJ/S
 7Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bFqrlIVOJWqLfUrDR7s3wm2cSgZBEIKcTvUyPkDHD+Q=;
 b=LKQb30LpFhHczSznB9a1EVR+yNNApUKF/DRAqI8SQ7ABMS4hM1BeR2IZ2UYGb0fzFZ
 fOkCkiYmuziDZWiAzQ96dYSPoXzQR78bz12DkufcnXfklSteM0QWC1cCkw4lCWv/7D9h
 nD8fLgg0DBssgjpZJwPy4YvtYJR4Llx+j95iFQUBsjl6wdKyMBzh2b5hNTRZaIH+ObjN
 LY3XNmZU1ZqSJXx2Uua/f+vJljWuPk6GbwR73UGdVxw4E4oSv7dGkHYYgKF1LUmSplJt
 wmhfCEo0mMRfFuXGlS9rXP8e4zV5FUslBoX8ZazGFo9h+2XAf+l/jgYb6ghzDrC+SsbU
 dRvw==
X-Gm-Message-State: AOAM532WxAwZ7FLq7BbXDhZiPeP3PFYPdQsV2JUwWzxZ1aKi9y5xb19C
 vvkyW0P9y/SnArqYMJ5czRPPmfnUwXQU/g+UCH0=
X-Google-Smtp-Source: ABdhPJxDUL0RC5P8d7Dsdsn9YcCa5xRYq7wG+YQPi4yZo43q94ntCdcdAQhuVMgYFfQOp0VzRBQDh9+Yw/hNgBefJmA=
X-Received: by 2002:a05:6830:1f11:: with SMTP id
 u17mr8207803otg.151.1632563750452; 
 Sat, 25 Sep 2021 02:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210925094626.365400-1-asafka7@gmail.com>
In-Reply-To: <20210925094626.365400-1-asafka7@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 25 Sep 2021 03:55:39 -0600
Message-ID: <CADvTj4oS3c2HEjG2r+afe7eLoQKoz_B3SCSmp3nGQKbjE2g-Wg@mail.gmail.com>
To: Asaf Kahlon <asafka7@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to
 version 1.1.1
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
https://patchwork.ozlabs.org/project/buildroot/patch/20210922063238.3953328-1-james.hilliard1@gmail.com/

On Sat, Sep 25, 2021 at 3:46 AM Asaf Kahlon <asafka7@gmail.com> wrote:
>
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/python-frozenlist/python-frozenlist.hash | 4 ++--
>  package/python-frozenlist/python-frozenlist.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
> index 0ecc5f9cdf..d8ca0d8b3c 100644
> --- a/package/python-frozenlist/python-frozenlist.hash
> +++ b/package/python-frozenlist/python-frozenlist.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/frozenlist/json
> -md5  2a83a520014203d0a56993c332ff7e23  frozenlist-1.1.0.tar.gz
> -sha256  d167a5050628323fcb3db410375eb06390ab135454fd85fd79c5832f5ec2b8ed  frozenlist-1.1.0.tar.gz
> +md5  3d6747897187eb413327168329ecccde  frozenlist-1.1.1.tar.gz
> +sha256  32fa8c86eee5c6f11b44863c0d3e945b2b1a03df3bf218617e832f1f04ba3146  frozenlist-1.1.1.tar.gz
>  # Locally computed sha256 checksums
>  sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE.txt
> diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
> index b113c38080..e17578879f 100644
> --- a/package/python-frozenlist/python-frozenlist.mk
> +++ b/package/python-frozenlist/python-frozenlist.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>
> -PYTHON_FROZENLIST_VERSION = 1.1.0
> +PYTHON_FROZENLIST_VERSION = 1.1.1
>  PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
> -PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/12/0e/119f1f186e93c21d078db1ddd7b21247a8a49261689d9284dec28be3b08e
> +PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/ab/bb/80e0fdd91fe4018c6c11a1bfe9bb8cb1da8dbb2ed3faa3c1317161d056fa
>  PYTHON_FROZENLIST_SETUP_TYPE = setuptools
>  PYTHON_FROZENLIST_LICENSE = Apache-2.0
>  PYTHON_FROZENLIST_LICENSE_FILES = LICENSE.txt
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
