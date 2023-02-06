Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951EAC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 394A060A63;
	Mon,  6 Feb 2023 10:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 394A060A63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXKEvGL4Vhrk; Mon,  6 Feb 2023 10:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EDAB605AF;
	Mon,  6 Feb 2023 10:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EDAB605AF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9058C1BF2CF
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76A6D41526
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:09:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76A6D41526
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AC_vwmLCTYkk for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:09:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B544151F
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 71B544151F
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:09:21 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bp15so16835304lfb.13
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 02:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uyRfN8eMEnaLVhr9bYj8iaR6RvswS0cet3i+d/cT+n8=;
 b=M6DhkibGqbbAzaUAt3yDGtCVlebKztit5wqKtANoEMMx32r1CCblOYviM05IwuQQvK
 X1ikGPQP2Kwd4v+iK2VWxIUlMNvt238sF+v/yuaEsDV+K/OVESl1SXE00vgN1R+dpF55
 vS56/V4IWvnxedWxiWXiYwcnE6F3tOuaHqKVYaB0TbcM4OHbTXETmZ9wXsJWIxlBs51+
 /JlhBkOsYICyz1oWcGSUfBOJPQHPVqCRZeX7xRLX5IDCYhuz6aSMwIZCcxZZ8tKweFYJ
 V9XpckXNBtjvkrHDmFB1R4Ci8rqCprDeJjnVcKE2CoTw5sVAwyoJJshqt3IMfh80WlEp
 mZdg==
X-Gm-Message-State: AO0yUKV+gKrEvK29o/Pr4qmEEN/Q7MlZporMO3USIJo3rbQZa1aE6tJp
 MKtO++LjsjtIKRPiU7ZrV8DDEa7PdAAuc94tcI4=
X-Google-Smtp-Source: AK7set9iZlTNvrZMoPuepGJsQnV7YbXA84D4TZ6ofQT0fjcKmeUMb+GpfFN5SQQla92O6DCWY1vNwnBrFSXFF1CVHaE=
X-Received: by 2002:a05:6512:1091:b0:4d5:86a8:55d1 with SMTP id
 j17-20020a056512109100b004d586a855d1mr3553209lfg.155.1675678159370; Mon, 06
 Feb 2023 02:09:19 -0800 (PST)
MIME-Version: 1.0
References: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
 <20220920232154.1219792-2-KAMenyaev@sberdevices.ru>
In-Reply-To: <20220920232154.1219792-2-KAMenyaev@sberdevices.ru>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 6 Feb 2023 11:09:07 +0100
Message-ID: <CAEyMn7baiyYS3vN8nhu=odv0fvMA0F48oxo5d3i86O8SiuQMbg@mail.gmail.com>
To: KAMenyaev@sberdevices.ru
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uyRfN8eMEnaLVhr9bYj8iaR6RvswS0cet3i+d/cT+n8=;
 b=VZ+Ad8Rwlt9RFM0G7l1FTNDSjDiMbnURf0atXx7tyg4lEFReZgxp2Oq7qJLqfFdHzw
 JZLRj6s3S8Bdzi8R6NC+yNStctka7b8KfLK6yTTSHHenkdmYrL+b8AyyZYTmnNM+LJW+
 0sEJJbKrK6O36+6+FdFZnhTo78Lq+UVeB8u4djBBJl6j9UnMdHeEdR9GLCm/Pr4vQG8H
 zvHVu4V+ZOsb51/DmFdeN31ZdDps0KiRwGycVUWCiZMgvTZSdzGLEL6VohRPRQfWKE6B
 Tj7C7Nbe5Yv2g2UuAR6pRl5RYR//9gmELAMTvSrzqgUsDySDZ5+/GmV85cRwQOHIQsr9
 DWJQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VZ+Ad8Rw
Subject: Re: [Buildroot] [PATCH 2/2] package/crudini: add host-crudini
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>, sdfw_system_team@sberdevices.ru,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

Am Mi., 21. Sept. 2022 um 01:24 Uhr schrieb Konstantin Menyaev via
buildroot <buildroot@buildroot.org>:
>
> From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
>
> Make the host variant of crudini package. This can be useful in
> post-{build,image} scripts.
>
> Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>

Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  package/Config.in.host         | 1 +
>  package/crudini/Config.in.host | 9 +++++++++
>  package/crudini/crudini.mk     | 1 +
>  3 files changed, 11 insertions(+)
>  create mode 100644 package/crudini/Config.in.host
>
> diff --git a/package/Config.in.host b/package/Config.in.host
> index fb805577d1..055e846e39 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -12,6 +12,7 @@ menu "Host utilities"
>         source "package/checksec/Config.in.host"
>         source "package/cmake/Config.in.host"
>         source "package/cramfs/Config.in.host"
> +       source "package/crudini/Config.in.host"
>         source "package/cryptsetup/Config.in.host"
>         source "package/dbus-python/Config.in.host"
>         source "package/delve/Config.in.host"
> diff --git a/package/crudini/Config.in.host b/package/crudini/Config.in.host
> new file mode 100644
> index 0000000000..5e0040883f
> --- /dev/null
> +++ b/package/crudini/Config.in.host
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_HOST_CRUDINI
> +       bool "host crudini"
> +       depends on BR2_PACKAGE_HOST_PYTHON3
> +       select BR2_PACKAGE_HOST_PYTHON_INIPARSE # runtime
> +       help
> +         A utility for handling ini files from the command line and
> +         shell scripts
> +
> +         https://pypi.python.org/pypi/crudini
> diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
> index 7141e2b2a0..c376c5f777 100644
> --- a/package/crudini/crudini.mk
> +++ b/package/crudini/crudini.mk
> @@ -11,3 +11,4 @@ CRUDINI_LICENSE = GPL-2.0
>  CRUDINI_LICENSE_FILES = COPYING
>
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> --
> 2.37.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
