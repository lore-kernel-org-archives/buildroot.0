Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DA9C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:18:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02EE76138B
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 17:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02EE76138B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B89796082D;
	Mon,  4 Oct 2021 17:18:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FzM5Jtg30lPW; Mon,  4 Oct 2021 17:18:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27BBC606DE;
	Mon,  4 Oct 2021 17:18:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 775491BF308
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 659CF83B8B
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 17:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YDMCjqfbScS4 for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 17:18:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 710BF83B87
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 17:18:38 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id bm13so17437750edb.8
 for <buildroot@buildroot.org>; Mon, 04 Oct 2021 10:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FI/Hy5v51mPraWip8gutaQmbIu83PzGh/cI70ENxaJQ=;
 b=T9DwASlEC/AKFd2I9xQ7hli4A99EDW74NhvzzUUflmotyfmIQjpr9PpP8ObIi6EV/a
 Y+zB3zaXXNbRGfXaKvzWyLLVR4tWYeFKQevNN6nNstk5C5imn1tMVXShCnxrrMWPsouM
 IeeFmyK+qxaG3cM5gPro0UXMufYXYZaR0jwNiEOez2n5sIMbzRqzEFYkYsiCAaV0hqjv
 vU/2NJijqX9NRxYz+6OQMFyEUQmotwTV7QBabcI0I0dg4bnApRJAOQDfLVwnzwXQfhmZ
 1gZ34hTfXOKKY6Xf3zEbk9OJPv4yiCh8l3nvm2g9q+a0ONvK0KlrGy+pGQPJtQQM5yxT
 AT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FI/Hy5v51mPraWip8gutaQmbIu83PzGh/cI70ENxaJQ=;
 b=A8mLh2wL9Y+kKVXG6Gi2adBMCwuTDqwznvCVSFK7S4dhacIyRt+RPc+B670HG7RaUn
 j6a2EZCo/xXhQJsceIWDpMCbN004+bQgRZcHDD69u+caT+TrHej4KouHB1PXGrJ9/LlM
 3Zg2DfdkudtcwX03YrDTHwzVkG1aLJ/kSdH3hRmYnfKQU2AXovC/GkMGz/o9C7O8W5sZ
 msnNZ0Su0V9TBeeNVyeGLov0moPaUuoEcpJkCP8jtI/HhJPSS1YyNd0fLI86bjrkqC/7
 NzmMwy/iWui4SkY4ReEs6zbUSlAdYOnkvfmnP6ze0bJnpR8hlIbNDn8hdJdrA6D6+6tu
 zw1g==
X-Gm-Message-State: AOAM531WOdyQvkTD6M3j8kTZTb3QZZVxoLvuq32Uy3hhtGEGufG3OAaq
 8QqjVYBzvzNp+uRnEv9mXpSutD9vHzF76EcGOOfo/OEnuY4=
X-Google-Smtp-Source: ABdhPJzdCkufap5pKgB4gaJO3JvfXcVU7FjjyBHWh796nSn/tUeK1U7a+zofzT/u5IFRuX9v+ojIzBflFawxxybm81o=
X-Received: by 2002:a05:6402:1551:: with SMTP id
 p17mr19706072edx.388.1633367916647; 
 Mon, 04 Oct 2021 10:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210927210238.1489991-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20210927210238.1489991-1-fontaine.fabrice@gmail.com>
From: Asaf Kahlon <asafka7@gmail.com>
Date: Mon, 4 Oct 2021 20:18:25 +0300
Message-ID: <CALFsTFVN-UrfuTJeS_S=oU+7=ADwfffHU8nu6h3a5JQMMamTVg@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-ujson: needs python3
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Tue, Sep 28, 2021 at 12:03 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> python 2 support has been dropped since version 3.0.0 and
> https://github.com/ultrajson/ultrajson/commit/0673d237cf5589a2a059771f694d5fbc5a293b13
> resulting in the following build failure since bump to version 4.1.0 in
> commit a47f332a20bf3f79ef4903c8ddd2b7917217e354:
>
>   File "setup.py", line 37, in <module>
>     with open("README.rst", encoding="utf-8") as f:
> TypeError: 'encoding' is an invalid keyword argument for this function
>
> Fixes:
>  - http://autobuild.buildroot.org/results/0737c4db63efe2205cb01984af72c270447fe085
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-ujson/Config.in | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
> index d185c98532..aee1d75fce 100644
> --- a/package/python-ujson/Config.in
> +++ b/package/python-ujson/Config.in
> @@ -1,7 +1,8 @@
>  config BR2_PACKAGE_PYTHON_UJSON
>         bool "python-ujson"
> +       depends on BR2_PACKAGE_PYTHON3
>         help
>           UltraJSON is an ultra fast JSON encoder and decoder written
> -         in pure C with bindings for Python 2.5+ and 3.
> +         in pure C with bindings for Python 3.
>
>           https://pypi.python.org/pypi/ujson
> --
> 2.33.0
>
Reviewed-by: Asaf Kahlon <asafka7@gmail.com>

Regards,
Asaf.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
