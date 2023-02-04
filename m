Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCE2C61DA4
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A69C660FB7;
	Sat,  4 Feb 2023 19:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A69C660FB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ds9uNLWSpvgi; Sat,  4 Feb 2023 19:54:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D254760FC7;
	Sat,  4 Feb 2023 19:54:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D254760FC7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 545E81BF2A0
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 19:54:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF36060EAA
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 19:54:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF36060EAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-gKHv31-XhE for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 19:54:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6A1160FB7
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6A1160FB7
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 19:54:39 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so11835786pjq.0
 for <buildroot@buildroot.org>; Sat, 04 Feb 2023 11:54:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vJ5SEIF7kO4pWPxJ0K53tHAin0Ti52uk4t7UU4dplZc=;
 b=pgugWOHx864oq4Ku7zPEEDVKCzDttTRGdeR3GtxhgYK6U8vQbWIDYyakYsiqF73rcG
 fCkBemYFFKEDC9/dwjyjA4vwAukj5EUSL4O+6NduEBHaxJnHbSp+7rPKtKpt1bzEEuM7
 SiDq03tYmnhRr19Dx5RwpE5M+OTMJibFI9WZG5vKTcyWNHxIQvcuTY2Px8lvl9CkX1EE
 MjyHpJDSOVrPS896tHLat5WCUeFLVY2FnJVbE3rBPsL6K1RkPLfMHGhnTHhi0J8NI+27
 FUNXXFFhT7xCZjXdEkFSNjzwWG/QQfy4n3nBAmRuJSdAIfiVSAen316jW7Q7gkHFhloN
 FVGg==
X-Gm-Message-State: AO0yUKWoG4vwqHEI95WFByljT6RwQ9BrC+qMrIukQCiDg3Aqf0buIseA
 JpoxALIxzEmCH24/iP9WLwW4XeYMFj4hkfweX1uGtEA/
X-Google-Smtp-Source: AK7set8khu4mOItumMPWngKtEQ7bHHA4oDx4JWhRvFaOVrKW4XZpdz1UlLCys3G3kBQJ61o4lN1uDnZ4hctRYzAs6+E=
X-Received: by 2002:a17:90a:9903:b0:22c:7e3:6d9f with SMTP id
 b3-20020a17090a990300b0022c07e36d9fmr2188940pjp.21.1675540478710; Sat, 04 Feb
 2023 11:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20230202152743.3916949-1-arnout@mind.be>
In-Reply-To: <20230202152743.3916949-1-arnout@mind.be>
From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Sat, 4 Feb 2023 13:54:27 -0600
Message-ID: <CALq67GCHdrUwsotb-tUTSsGnsbYp30dCgfxcHhv_zZ4xLueVNw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vJ5SEIF7kO4pWPxJ0K53tHAin0Ti52uk4t7UU4dplZc=;
 b=O4VgtXqwkrlnR46rT/U6hPdy8bjzKNvgo32pUUarmm2Ln30K4ATsiyjAld4gKXQmdY
 tSHKCpyzz+gJ1psr/2lG7FBCc4rwYxHSyoNdT7n1VTIRmCLEjVuPM9ejY+5ttZcG7K96
 fV96cn+CXOzageNoY46npeJsJwEJPryFRl4SIaD9ynNR3sJjImfyIN6g9xpldOtetJnR
 kIoz/nOLiRizsPZlMnfToti+w7Ky2Oc3GO/AhpRyHGHJPHQBQxmJtb4Wair/ksE/bmQJ
 Y3DWXw2zmLZLqDrfwBn2FO9Yi3aEiIXF/rOd71gdKWKshAgBniVMrPdOSvlk+8vIzURT
 J9/g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O4VgtXqw
Subject: Re: [Buildroot] [PATCH] package/python-pytest: remove runtime
 dependency on python-toml
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

On Thu, Feb 2, 2023 at 9:28 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
> Since version 7.2 [1], with Python 3.11+ pytest no longer uses tomli to
> parse pyproject.toml but instead uses tomllib which is part of Python
> itself [2]. Note that toml was replaced with tomli in version 7.0, so
> the dependency was anyway incorrect.
>
> Note that tomllib is unconditionally installed as part of Python 3.11,
> there is no PYTHON3_LIBTOML option or anything like that that needs to
> be selected.
>
> [1] https://docs.pytest.org/en/latest/changelog.html#pytest-7-2-0-2022-10-23
> [2] https://github.com/pytest-dev/pytest/pull/9741
>
> Signed-off-by: Arnout Vandecappelle <arnout@mind.be>

Reviewed-by: Ryan Barnett <ryanbarnett3@gmail.com>

> ---
> I can't be bother with sending a patch changing toml to tomli for
> 2022.11 - it's going EOL in two months anyway, and apparently nobody
> noticed...
> ---
>  package/python-pytest/Config.in | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/python-pytest/Config.in b/package/python-pytest/Config.in
> index c3956c76d2..9bbc9ea2d2 100644
> --- a/package/python-pytest/Config.in
> +++ b/package/python-pytest/Config.in
> @@ -5,7 +5,6 @@ config BR2_PACKAGE_PYTHON_PYTEST
>         select BR2_PACKAGE_PYTHON_PACKAGING # runtime
>         select BR2_PACKAGE_PYTHON_PLUGGY # runtime
>         select BR2_PACKAGE_PYTHON_PY # runtime
> -       select BR2_PACKAGE_PYTHON_TOML # runtime
>         select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
>         help
>           pytest is a framework that makes building simple and scalable
> --
> 2.39.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
