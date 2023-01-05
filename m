Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8656EC4708E
	for <buildroot@archiver.kernel.org>; Thu,  5 Jan 2023 22:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBF2D60AE8;
	Thu,  5 Jan 2023 22:54:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBF2D60AE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R5Ivb5FPKhXx; Thu,  5 Jan 2023 22:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 417B360AD1;
	Thu,  5 Jan 2023 22:54:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 417B360AD1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C3FB51BF295
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 22:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAA72419B6
 for <buildroot@lists.busybox.net>; Thu,  5 Jan 2023 22:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA72419B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C3dep5_0Jp-r for <buildroot@lists.busybox.net>;
 Thu,  5 Jan 2023 22:54:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5532C419AE
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5532C419AE
 for <buildroot@buildroot.org>; Thu,  5 Jan 2023 22:54:34 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1442977d77dso44644644fac.6
 for <buildroot@buildroot.org>; Thu, 05 Jan 2023 14:54:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EQ01kFMnNd4kB0mWZ0ojouII/vWQts72PQRKIYbBQFo=;
 b=MOIoe10/t99+KZE0q9MdQswPfCDMA32n9fA21M0LwnUrqc5KZJZEFcZ4fu2/ohPKGy
 C5f9DSBQSC+MW2squKWylPKXTmDyKxCwHEv/lfIOwp8ifYrcAKCgAvV26bizdE7pDbQY
 0eQdGV9oyMa7oF49sEQObTbcsAOWq5mLIn2fWc/Yhm1DnJsKptEVg/OJ//RSat9PRCy8
 vsrb2k00mXQ75AT9+E4iJRt5ycKyudpFdfhoY2M/gJ3t1YkkCggAgUTZlSJ79v3enXKe
 TF/INdMPlwHxujvex5We3Ord5JnT4GPmaRqTdZnOsOFlz6+4vyM/bcpZXZieyZaykqZX
 bG9g==
X-Gm-Message-State: AFqh2krdjxhLn2gqLWVSqeCnGK5+++VA5nEkx6fxHjkarLr5hu05WTTy
 5ogy00qlC3LfMkC0aeYyWIVMCZhlQv/vOsEkBWn40SWVFLn1Gg==
X-Google-Smtp-Source: AMrXdXvzWe3ckV+k3Iogw64gRk67FJxZqKjSrRBIOGjyBPsSZ6WYpr1PnCSzRw8tTAMEtFYQnDjYxOeQpe37fQcdl1E=
X-Received: by 2002:a05:6870:8304:b0:144:9744:2be3 with SMTP id
 p4-20020a056870830400b0014497442be3mr2498808oae.93.1672959271745; Thu, 05 Jan
 2023 14:54:31 -0800 (PST)
MIME-Version: 1.0
References: <20230105185140.622799-1-bernd.kuhls@t-online.de>
In-Reply-To: <20230105185140.622799-1-bernd.kuhls@t-online.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 5 Jan 2023 15:54:20 -0700
Message-ID: <CADvTj4pxi8ZaaGfUAXiKL_WS4ZsT454Q5mACeg=iTZfw=17b-w@mail.gmail.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=EQ01kFMnNd4kB0mWZ0ojouII/vWQts72PQRKIYbBQFo=;
 b=ZgwT5PDquyttGQlM8y8ZItAxa5uXXBAbAEntfsnmOfluDOPg9LtRBXklhRTBdhjwej
 OfhsF6RFJ3bQlSImizEEy4yOOuMKDFJNZjLPF4Tm7LVSsuUrDVH79RDJzhxuNZ/3PB4c
 tlMZQoO9ANppn9hZ4CwQ3ERl0w3ghzgP3yol3LWZNVN7PgJQvrefNuNGnEaJmWxHDsF8
 F8LfFLr25nZVmSXNc0vhXx1RWxVetyo+9sVJXHqO1f6G9eVRmizf2yl8hxpv13amMimV
 vQ/+XLlHHPhMA0fAj/JKH56uCmS+1cIrOKztGtHzdSmuaxMcgsu/hIADp4/OaJyERrHQ
 LSXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZgwT5PDq
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpg-error: add configure
 option to install gpg-error-config
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 5, 2023 at 11:52 AM Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Upstream commit[1]
>
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commitdiff;h=0b47de9c719b0ed0da0791f0525de073737bde5a
>
> changed behaviour: "gpg-error-config is now only installed when enabled"
>
> Fixes:
> http://autobuild.buildroot.net/results/bc1/bc1566a0fa42f68f1f15f74a61d4081e269e1689/
>
> [1] included in version 1.46, added in buildroot with commit b5bdcb4cc5
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libgpg-error/libgpg-error.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index ab3c7c3bf2..3f4a45a7e4 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -15,6 +15,7 @@ LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>  LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  LIBGPG_ERROR_CONF_OPTS = \
>         --host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
> +       --enable-install-gpg-error-config \
>         --disable-tests \
>         --disable-languages
>
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
