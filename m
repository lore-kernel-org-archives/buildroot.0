Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C75C433FE
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 03:20:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B23D960EE9
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 03:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B23D960EE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42A61400C7;
	Tue,  2 Nov 2021 03:20:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jlS7n1dQjEuM; Tue,  2 Nov 2021 03:20:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2ABBA401CA;
	Tue,  2 Nov 2021 03:20:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE1051BF3A7
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 03:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4ACC402B7
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 03:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHwGrUSFtwTv for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 03:20:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4DEC402A6
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 03:20:22 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w193so28031740oie.1
 for <buildroot@buildroot.org>; Mon, 01 Nov 2021 20:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qtguilbp3WbzBSknbNuyQxzBC6MQoOD0SOM/Wx+OZJE=;
 b=Tk8JnzllDLbz5ayoNBIj2lNKB1Fh6jxBU2aHCUtPI8KbP1xp0JmXfkaIo+BSPAt1HJ
 Ulnz4W8EroUb4zMIjlNj6GKWafteUmbp+FX7QHoOheXVgOnLVn001wyrhqj35Xqt22kU
 oKRZvJrmmlBDzcJOBGCrM8vhC/ZKCwB340eWySAZPeFtwzXnWaSUOsC0qwRMrtsn3eoL
 RB+TcBMKpHbgaN/Tbg5AD+peYkkXXImP1F+9e/BFlCOvFTbi+8n9WGHd7bBJMGvaSV9c
 oBFWYynoJPda50pp5h6G3nsRUKYVSt5+4b2Iopak+nD1omUr2xUTcw9TGECUIqenzDjz
 a7Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qtguilbp3WbzBSknbNuyQxzBC6MQoOD0SOM/Wx+OZJE=;
 b=qXBZ4lYvUxGa/yagovajPtmESvWhJF0Y3be4rgBSV8YMJQ6dBBRrDM9IILuHmgJyVd
 x7yvMkxl+zxa6U/9yINMdiv8UY+60rAqn8Am790Z8fsZrj15g29C5leWZ/4e3yWyi3Lm
 jlnj+5ujCo2Q8O6i+uTY5OrgMPyDnTRCVjwlBvYsAC2SunQNrF/tGiOGl2hbg6x4G4RO
 8Z2umIxoIr0yjb/AOgUMFLVtHkt88MmCyMGZcOXwJ+gmSCBeNr5Fu7qj53SMnFd/4up/
 aubalnnHeII3kVbJUU/HikL8yS5uLvCUTEbksoH0CHxSqO7AO88RXVhEFkVQBe/xjx2L
 vPfA==
X-Gm-Message-State: AOAM531o8L0xaX52l/hfcLwOt9IF7RnRkQWxpj3tN1p45Yy2/OoDET32
 i2tT0zKJ03j7uvKuFCPcPaT96QRGIGpMq0kGAvg=
X-Google-Smtp-Source: ABdhPJwPIjzFukPtOw/a9k44DoWuzvMkDFMvxk60VDmdRVS+v6paY1L6dhDMw/TNaPWsKV7jpSujtNYUWdxMOzD6Dko=
X-Received: by 2002:a05:6808:118c:: with SMTP id
 j12mr2632425oil.65.1635823221611; 
 Mon, 01 Nov 2021 20:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211101133359.2228115-1-romain.naour@gmail.com>
In-Reply-To: <20211101133359.2228115-1-romain.naour@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 1 Nov 2021 21:20:10 -0600
Message-ID: <CADvTj4oZ4LFS7Z-teBPr99gBGnQ5nn0H==YpXpgvsxx8OS1YVg@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/ca-certificates: add missing
 host-python3-six dependency
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
Cc: Martin Bark <martin@barkynet.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Nov 1, 2021 at 7:34 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> ca-certificates use some python scripts during the build step that
> requires python-six for host-python3.
>
> python3 certdata2pem.py
> Traceback (most recent call last):
>   File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
>     from cryptography import x509
>   File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
>     from cryptography.x509 import certificate_transparency
>   File "/builds/buildroot.org/buildroot/test-output/TestDockerCompose/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
>     import six
> ModuleNotFoundError: No module named 'six'

The failure appears to come from a missing cryptography dependency
so I think my fix in python-cryptography may be better:
https://patchwork.ozlabs.org/project/buildroot/patch/20211029065957.3084528-1-james.hilliard1@gmail.com/

>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/1734417711
> http://autobuild.buildroot.net/results/d14/d145f997cc6db17a8eab14d9ced8fa35332c4969/build-end.log
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Martin Bark <martin@barkynet.com>
> ---
>  package/ca-certificates/ca-certificates.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
> index eb75d23f44..e21ac5d907 100644
> --- a/package/ca-certificates/ca-certificates.mk
> +++ b/package/ca-certificates/ca-certificates.mk
> @@ -7,7 +7,7 @@
>  CA_CERTIFICATES_VERSION = 20211016
>  CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
>  CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
> -CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python-cryptography
> +CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python3-six host-python-cryptography
>  CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
>  CA_CERTIFICATES_LICENSE_FILES = debian/copyright
>
> --
> 2.31.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
