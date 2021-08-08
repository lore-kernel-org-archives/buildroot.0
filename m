Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEEAFC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 13:16:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 601DF60EB5
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 13:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 601DF60EB5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11DF4402A9;
	Sun,  8 Aug 2021 13:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4eFjviMXpMw6; Sun,  8 Aug 2021 13:16:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53CF5402BA;
	Sun,  8 Aug 2021 13:16:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77F351BF588
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 13:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72C686064E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 13:16:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F9iv8gXuXDSO for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 13:16:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A90B0605A8
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 13:16:14 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id e19so24083622ejs.9
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 06:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kWf5SjFSAVShwPiSHiI9CeZjmBC1/xiPCtv2FQ9VZP8=;
 b=HnLWJd0ib/2w/Ey/08pq3TLrkmCz1jSax2mCL5MuXAT1Fq0TiO0TGLy1rWv3MZJWYb
 cID6Kmje5rNU3Mt30//XYrRSH9y9IFbwY6W1QACA9acEB/uLcOB1LtFcxEHsBF/ZY6ic
 smjKV2/gXMOAP9EIMbUiKnVXQlFCGU0vLGCeNdKKo6QggTtrOlIh2RGixjSrMiFFZXc8
 hhcr2EEGLbHQPgK2TkDUD+gDMjUWWuyGemrMNa4a/1hk1GwEtX1Ub45YDofGmE/JnbZI
 uIHjfC4lPJ+2VIvyFqv/Gym8txRN01lVWYU+ecrjFzxZsfTrxyEEjfd93kBg72kKz5Kx
 PKnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWf5SjFSAVShwPiSHiI9CeZjmBC1/xiPCtv2FQ9VZP8=;
 b=NJTcWkUHWh8ruvkcep2FTefbD4LREKzvgzMx1cYdemoFQD2Wc2XOa4gQpr8ifBtkkg
 9QlgLUc8LZX+fkPk44LXRJQv8rCOuEjPhr85qphChwkx5dsKSktx27xAhYOZuDcOxN3S
 +LOr8S3dhFjhTCZIgj+M5rEjlIt4awaDgFOnkbjYd1VYaoXb4NjVUjDZqsZfaKX9lMYR
 onuFS59gWIEWX7PGYWq5JLJTF3oU/Gw4TJKQm0DMlVAtpcWxgN1d1KIktTKcnfWDEzr2
 00CD0aQmsuKZTp5WV79W8V3Uhdl0sORh4Lo+oDrWnk2JMry/RT8W9rZJAfq26FXn1O/H
 slfA==
X-Gm-Message-State: AOAM5328wevo1eJN+ouhdsO4nWUi5Fu/d/N6I67H6yliBVw4AHWShIv2
 fS3YQ0mi5u5hCA9lVkEr0e1BNWUn6UU5QZdxFJA=
X-Google-Smtp-Source: ABdhPJx7J9fY3tHFm/ISNvS8K8fZxdIWzszjJMBgAWBQ50x+8seBK7Y0XmCxwrLTtzG8r7tRT5G12MpTlEjuqxHZEF8=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr17916824ejb.382.1628428572286; 
 Sun, 08 Aug 2021 06:16:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210808101650.3501748-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20210808101650.3501748-1-fontaine.fabrice@gmail.com>
Date: Sun, 8 Aug 2021 15:16:01 +0200
Message-ID: <CAGm1_kv06JDSMtrUHG+6w_FqsB-+4xaXb3hBUyR0ypY36c3RhA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 datarootdir
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@busybox.net>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Anisse Astier <anisse@astier.eu>,
 Aleksander Morgado <aleksander@aleksander.es>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi Fabrice,

On Sun, Aug 8, 2021 at 12:19 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> datarootdir has been removed since version 1.66 and
> https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a88b1ac548516ab25140a2e9dea8cac894bbac93
> resulting in the following build failures with autotools-based
> applications using introspection (e.g. libmediaart or libsecret) if
> gobject-introspection is not installed on host since commit
> abc110e3624aa4e8a9bd8595b3fdc0aec60845e0:
>
> make[3]: *** No rule to make target 'MediaArt-2.0.typelib', needed by 'all'.  Stop.
>
> or
>
> Makefile:2917: /usr/share/gobject-introspection-1.0/Makefile.introspection: No such file or directory
>
> Fixes:
>  - http://autobuild.buildroot.org/results/70585b81fd6aa78e2aa6e5173f35c0f26a1408a9
>  - http://autobuild.buildroot.org/results/95aa8e189f3326ecae6133e298c56ffcbbc3198f
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Tested against libqmi and ModemManager.

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Best regards,
Yegor

> ---
>  package/gobject-introspection/gobject-introspection.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index d8138b2e96..fbc545b3c7 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -116,12 +116,12 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>
>         # Gobject-introspection installs Makefile.introspection in
>         # $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
> -       # build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
> +       # build .gir and .typelib files. Unfortunately, gobject-introspection-1.0.pc
>         # uses $(prefix)/share as the directory, which
>         # causes the host /usr/share being used instead of $(STAGING_DIR)/usr/share.
> -       # Change datarootdir to $(libdir)/../share which will prefix $(STAGING_DIR)
> +       # Change datadir to $(libdir)/../share which will prefix $(STAGING_DIR)
>         # to the correct location.
> -       $(SED) "s%datarootdir=.*%datarootdir=\$${libdir}/../share%g" \
> +       $(SED) "s%datadir=.*%datadir=\$${libdir}/../share%g" \
>                 $(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
>
>         # By default, girdir and typelibdir use datadir and libdir as their prefix,
> --
> 2.30.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
