Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59D05C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 19:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD6440242;
	Mon, 31 Jan 2022 19:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sGDwv7gjCmiY; Mon, 31 Jan 2022 19:33:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 043B6401CA;
	Mon, 31 Jan 2022 19:33:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 92BA71BF379
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E73981B53
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 19:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9-4q37Ecg_Z4 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 19:31:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF1F081B26
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 19:31:45 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id q186so28715946oih.8
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 11:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ietv1maS8PeyCxVoSOScSr+dDJYFvQc4/1VBXzFtD3s=;
 b=GlGyxcra/x0NnPKZAvCQPt0JyIsyyTFwpKLuE27DfymO5gUF97c7TUFLdhJ4B+8Lw4
 1XL9iZV+esOR91HZPNMU6f2X8GfeRXZzNEWwJvqaoeJoPj20BO4CwQCryc3Vl9a0fJTL
 Str/VBZ9UxjG4nUKwaxrnGn3mFSe0ICuEse79hJU2/KD6bnZJMK5/zaRJtLzqApIcsgU
 i3W6f6kNFtOB5N154zekPYie5BQIENKp9lKTpTAtzQjX7vXrTTLAWMAOREubyq8OE61r
 COqzuUuBW+J0QqRkxpkb+E1wIvdGE/io8pLGsD5P4YoZjFlg/cDR1Rv4USzPDMN+bJCZ
 pcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ietv1maS8PeyCxVoSOScSr+dDJYFvQc4/1VBXzFtD3s=;
 b=cVh5qZ1g+lLNtO24g17fBqZMO5oQDdWM0MhU+VQ2H1uROxO41m/roDPrtwmcNHt7Z4
 1JSoYZzOhbnpku6X3yYSSCHpeSNpl8LHAyE313RBFoMyDEMTqxIH95FHBKCBDJ5SoReU
 B6DexyBiQU9G23OGGklqqykcqR3rlV+JJ2qR2q13dJpTjC+9qxS4EIwUG+fm28rnNPEK
 OqdtRt5ZJrmr0OxUI7xqlzz+rBI/v0PMyDFPzIjB8fdn+Xowng7bSbXMKOJ3RXtndJGb
 W45e8IwetRqPW46DzhiYHyFf4DvR2MMetEJ1VVrhd6sG04cUDzTflewW1iv3khN9WZYd
 e2Xg==
X-Gm-Message-State: AOAM530O1kWlbAguASnVBN49jwfH6GEFWncBOE/xUmIWeq7NTbNnl5EY
 GBa7XfvKDIfVFXtMiAgwRSDYghPmkT1SOS95kzg=
X-Google-Smtp-Source: ABdhPJzXwa9qWkpZ1Q/nYuSswFFKuZw+8apa2O4YBfLSz9Nbayne0JyZL/FkHVAtWGwA5aBckqzmQ4Q/h/OtJHmnSRU=
X-Received: by 2002:a05:6808:15aa:: with SMTP id
 t42mr18459442oiw.227.1643657504788; 
 Mon, 31 Jan 2022 11:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20220116214955.3231899-1-fontaine.fabrice@gmail.com>
 <20220116214955.3231899-3-fontaine.fabrice@gmail.com>
In-Reply-To: <20220116214955.3231899-3-fontaine.fabrice@gmail.com>
From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 31 Jan 2022 11:31:33 -0800
Message-ID: <CAFSsvmp-7X3iCbwHHbQ-uJZVDjsNw0sOO873nPT=+57+3o=3Yg@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/3] package/qt5/qt5webkit: build shared core
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?B?R2HDq2wgUG9ydGF5?= <gael.portay@collabora.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Reviewed-by: Adam Duskett <aduskett@gmail.com>
Tested-by: Adam Duskett <aduskett@gmail.com>

On Sun, Jan 16, 2022 at 1:52 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Build JavaScriptCore and WebCore as shared libraries to avoid a build
> failure
>
> Fixes:
>  - No autobuilder failures (yet)
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/qt5/qt5webkit/qt5webkit.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index de3c428fbe..565c57e813 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -42,6 +42,7 @@ QT5WEBKIT_CONF_OPTS += \
>         -DENABLE_TOOLS=OFF \
>         -DPORT=Qt \
>         -DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
> +       -DSHARED_CORE=ON \
>         -DUSE_LIBHYPHEN=OFF
>
>  $(eval $(cmake-package))
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
