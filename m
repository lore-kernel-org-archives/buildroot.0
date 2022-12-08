Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7920AC3A5A7
	for <buildroot@archiver.kernel.org>; Thu,  8 Dec 2022 07:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1167481F2D;
	Thu,  8 Dec 2022 07:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1167481F2D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdiIM12YIcYQ; Thu,  8 Dec 2022 07:37:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 357F781E25;
	Thu,  8 Dec 2022 07:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 357F781E25
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1EF6F1BF41D
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:37:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9282408E1
 for <buildroot@lists.busybox.net>; Thu,  8 Dec 2022 07:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9282408E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jTMKq_o3gbXz for <buildroot@lists.busybox.net>;
 Thu,  8 Dec 2022 07:37:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58062408D1
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58062408D1
 for <buildroot@buildroot.org>; Thu,  8 Dec 2022 07:37:17 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id s196so561736pgs.3
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 23:37:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TTf+E8bCsXCMqt2oToBGTXEJwcb1MQuiEVttoJE8iXE=;
 b=vM3vgGkLkJQ3wLOA1KNO7O9x+XfDCpAs1h9ZSUXpFaTTNFLKvBpb4h1d7xMk7e8pWy
 +A7Nmjl0Osm7hXbVCPnc9bZkZ34xFNMKFfMs6+f8YT6Yo0HKemyYoHioVIp4GbCsnKIq
 lf7Kji2bCkr8XTTl+gC4AsnAq8IEYDvvTt5FhvY7N3CVkcjNnXHM9+eHCZwK1IMiiuum
 e+pCJLBIPXNhlrrVVMXavPYBbbQmWhktU6LXp1QQ4LwiDeCaYaRlNv9ZcMyYHytvKPlB
 5ageXVmFK/ZjPd/ttMzTqGjSJY5tNIbTM6plTXtKYVH8MYFCL1znjMFwKP9Xm4Q+ryk3
 iq8A==
X-Gm-Message-State: ANoB5pmNFxnOZtX+sd82xWtTImasUJFOKI2Q0JQbZnYv3Reyz2gfBo8B
 nas+HE0kzKARDnYEdS3xxrUCb8rdOhng0lY8LJU=
X-Google-Smtp-Source: AA0mqf5ZrBavbQ/jIKPfz2Zn5lSrl0vCuYXEpomiTHKN3ZJlEcwNb22MfXkBiaT4W8DOZUYtmMVZCw==
X-Received: by 2002:a05:6a00:1409:b0:56c:cea7:88ef with SMTP id
 l9-20020a056a00140900b0056ccea788efmr1942879pfu.18.1670485037228; 
 Wed, 07 Dec 2022 23:37:17 -0800 (PST)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172]) by smtp.gmail.com with ESMTPSA id
 p2-20020a622902000000b00575acb243besm14625866pfp.1.2022.12.07.23.37.16
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Dec 2022 23:37:16 -0800 (PST)
Received: by mail-pg1-f172.google.com with SMTP id 82so587510pgc.0
 for <buildroot@buildroot.org>; Wed, 07 Dec 2022 23:37:16 -0800 (PST)
X-Received: by 2002:a65:4c42:0:b0:477:f872:8b6 with SMTP id
 l2-20020a654c42000000b00477f87208b6mr50002136pgr.457.1670485035830; Wed, 07
 Dec 2022 23:37:15 -0800 (PST)
MIME-Version: 1.0
References: <20221208072843.6806-1-heiko.thiery@gmail.com>
 <20221208072843.6806-2-heiko.thiery@gmail.com>
In-Reply-To: <20221208072843.6806-2-heiko.thiery@gmail.com>
From: Aleksander Morgado <aleksander@aleksander.es>
Date: Thu, 8 Dec 2022 08:37:05 +0100
X-Gmail-Original-Message-ID: <CAA3JqEeY1-E-gdw6oYMTDQ1o2pyT9YusGuA6rLUgt8EieZaWvQ@mail.gmail.com>
Message-ID: <CAA3JqEeY1-E-gdw6oYMTDQ1o2pyT9YusGuA6rLUgt8EieZaWvQ@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aleksander-es.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TTf+E8bCsXCMqt2oToBGTXEJwcb1MQuiEVttoJE8iXE=;
 b=c4wu/DH5w5PmKb3Z0PmIo9Fzz5vdQxw4mxqUPdNYOeJxNfposOr6+0PG/vcKnKtY8U
 juyiVLRFxbJodL4FMP7/G2cS/8veNQ82pUNi8mYviA6J6mz8tV6MipAQhvQllh4esrqq
 aISLWNtXp2dZQ/GuCg0E4aQ7bNqA3LV3Zt+zPryldeOYs7YIRh8By7vbkPtED+zQNfM4
 kp/IUj9Ldr4FqYnvLv+6m7SZQhHgrpXOvHLvck2PcQ41PQi5ycClWaFpCQYCX6nXEKAJ
 /THFFSfDKatXkc+WttMk58H2niMEBjUhi35nx1OHiNoXE+LPdARpLdS4UCYw5QIb6FPQ
 z5aw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aleksander-es.20210112.gappssmtp.com
 header.i=@aleksander-es.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=c4wu/DH5
Subject: Re: [Buildroot] [PATCH 2/3] package/libqmi: bump version to 1.33.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7280664948894624407=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7280664948894624407==
Content-Type: multipart/alternative; boundary="00000000000029d50c05ef4c1bda"

--00000000000029d50c05ef4c1bda
Content-Type: text/plain; charset="UTF-8"

Hey,

On Thu, Dec 8, 2022, 08:29 Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
> ---
>  package/libqmi/libqmi.hash | 2 +-
>  package/libqmi/libqmi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
> index dee2a94d93..79fcf08a12 100644
> --- a/package/libqmi/libqmi.hash
> +++ b/package/libqmi/libqmi.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> COPYING
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
> COPYING.LIB
> -sha256  b2e0285690f94fe6d0cc3c422514117b187c8ddb90133c2900993e13343f5a5e
> libqmi-1.30.8.tar.gz
> +sha256  0a9c0209a0d62706c05f8e585812956924d7930a25032e1ee93352c59317a00b
> libqmi-1.33.2.tar.gz
> diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
> index 6b7f45729e..ee1e424a99 100644
> --- a/package/libqmi/libqmi.mk
> +++ b/package/libqmi/libqmi.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ################################################################################
>
> -LIBQMI_VERSION = 1.30.8
> +LIBQMI_VERSION = 1.33.2
>  LIBQMI_SITE =
> https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/archive/$(LIBQMI_VERSION)
>  LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
>  LIBQMI_LICENSE_FILES = COPYING COPYING.LIB
> --
> 2.20.1
>


Please note, 1.33 is not a stable branch. The stable branch that works
along with MM 1.20 is libqmi 1.32.

>

--00000000000029d50c05ef4c1bda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hey,<br><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Dec 8, 2022, 08:29 Heiko Thiery &lt;<a hre=
f=3D"mailto:heiko.thiery@gmail.com">heiko.thiery@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">Signed-off-by: Heiko Thiery &lt;<a h=
ref=3D"mailto:heiko.thiery@gmail.com" target=3D"_blank" rel=3D"noreferrer">=
heiko.thiery@gmail.com</a>&gt;<br>
---<br>
=C2=A0package/libqmi/libqmi.hash | 2 +-<br>
=C2=A0package/libqmi/<a href=3D"http://libqmi.mk" rel=3D"noreferrer norefer=
rer" target=3D"_blank">libqmi.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash<br>
index dee2a94d93..79fcf08a12 100644<br>
--- a/package/libqmi/libqmi.hash<br>
+++ b/package/libqmi/libqmi.hash<br>
@@ -1,4 +1,4 @@<br>
=C2=A0# Locally computed:<br>
=C2=A0sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a40401052=
1b880643=C2=A0 COPYING<br>
=C2=A0sha256=C2=A0 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab=
032fe551=C2=A0 COPYING.LIB<br>
-sha256=C2=A0 b2e0285690f94fe6d0cc3c422514117b187c8ddb90133c2900993e13343f5=
a5e=C2=A0 libqmi-1.30.8.tar.gz<br>
+sha256=C2=A0 0a9c0209a0d62706c05f8e585812956924d7930a25032e1ee93352c59317a=
00b=C2=A0 libqmi-1.33.2.tar.gz<br>
diff --git a/package/libqmi/<a href=3D"http://libqmi.mk" rel=3D"noreferrer =
noreferrer" target=3D"_blank">libqmi.mk</a> b/package/libqmi/<a href=3D"htt=
p://libqmi.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">libqmi.mk</a=
><br>
index 6b7f45729e..ee1e424a99 100644<br>
--- a/package/libqmi/<a href=3D"http://libqmi.mk" rel=3D"noreferrer norefer=
rer" target=3D"_blank">libqmi.mk</a><br>
+++ b/package/libqmi/<a href=3D"http://libqmi.mk" rel=3D"noreferrer norefer=
rer" target=3D"_blank">libqmi.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-LIBQMI_VERSION =3D 1.30.8<br>
+LIBQMI_VERSION =3D 1.33.2<br>
=C2=A0LIBQMI_SITE =3D <a href=3D"https://gitlab.freedesktop.org/mobile-broa=
dband/libqmi/-/archive/$(LIBQMI_VERSION)" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://gitlab.freedesktop.org/mobile-broadband/libqmi/-/arc=
hive/$(LIBQMI_VERSION)</a><br>
=C2=A0LIBQMI_LICENSE =3D LGPL-2.0+ (library), GPL-2.0+ (programs)<br>
=C2=A0LIBQMI_LICENSE_FILES =3D COPYING COPYING.LIB<br>
-- <br>
2.20.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Please note, 1.33 is not a stable branch.=
 The stable branch that works along with MM 1.20 is libqmi 1.32.<br></div><=
div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div=
 class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div></=
div></div>

--00000000000029d50c05ef4c1bda--

--===============7280664948894624407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7280664948894624407==--
