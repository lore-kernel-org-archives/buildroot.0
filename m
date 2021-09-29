Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A7BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 07:10:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5F01613CD
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 07:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5F01613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91D8881B10;
	Wed, 29 Sep 2021 07:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXpecZ8sD9Kk; Wed, 29 Sep 2021 07:10:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A81C81C6E;
	Wed, 29 Sep 2021 07:10:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 211D11BF4D5
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 07:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1769840323
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 07:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB0MN_amxiVY for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 07:10:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9ECE8402EF
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 07:10:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y35so4861413ede.3
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=gZEpLoU5HpkEX+D+MSjhzGk9CzxBsuUH4Tl5et3NcbU=;
 b=XtoO/xGaVS2xq7hvvo/4cbljLHD/lf/hDyBNiDewts1Esv4ufUnD3gKdrrQFfWaX9o
 K7mPD4lBtL9ZTp2tQ21IUm+b2+iFqw3Jfc2/K/BE37P6qYKvMgpOVrdqhL5wOlnofH9V
 9w0xVu+XFXn0zl/fEfPb0VxlRCylYUhJ5CaTcUtYHF+dBdnFYl1cbJbA3jWcos7U3swZ
 x1kqKcvM2/UMTu3/RpmTtIZ7g0KATHKocpXbWlZPOfo0tqW1b/n51mOxStaNPLoee6bR
 wCJaP1ZBVMD5/Up4L7DomweYKivfslKviwvWGP5JtKBILrJJazzcnUkuRO5LoQXN582Z
 7Bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=gZEpLoU5HpkEX+D+MSjhzGk9CzxBsuUH4Tl5et3NcbU=;
 b=jG9kHJopJQNAtxKUdozK2E/K6Eazx2jwxSE+9Euj1sMR+F6W2tmcnX2AtW4tHy+ErM
 G3J0iFlSJicmMsf0C9IaXKwQW+3x71ciojX4yFgswe4pARSyYdc7Rucu5v1Qz8eH6pzy
 sy5zPxL879fz4SJgrgI5pYGtgY8BfaCJOEo852frcP7QrKkiqUrvg8LrW3fEbQmGpaMW
 OCd2GcN/18ap00zKquLUjl9y1+dCAQzYFip7v4FX/VZ2pZzFdfLq6Z7IHBoQGYIBx4uj
 p7+6oCVfqlqBZE6v1p92kx/gH0hU3TRlKIU4got3/ncKgeStftJDIYsYWxQedjcyPQUq
 y+Jw==
X-Gm-Message-State: AOAM531CI4+F6C/SeblU/DI3QV0KoMx+OrbwaNX5xWtEys26QrHPTj9U
 YtuMgOTcihDsX13ZdvinKnLuP6EuWzMPG0dPsPi+DB65KTlmMQ==
X-Google-Smtp-Source: ABdhPJyE4vCIbVtJUAlvK3PDFqixxc8sce/QJFkrVnGgw4fK5NjK3NjAac12qU1HQUFGXiuwXvyFxWEUSRz0W+xJPt8=
X-Received: by 2002:a17:906:6403:: with SMTP id
 d3mr11793306ejm.37.1632899441622; 
 Wed, 29 Sep 2021 00:10:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210922113820.3628-1-jose.pekkarinen@unikie.com>
In-Reply-To: <20210922113820.3628-1-jose.pekkarinen@unikie.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 29 Sep 2021 10:10:31 +0300
Message-ID: <CAJPV9Mp4qTv_GVK=bB1cim8xEeJ-8JXiFNVsyORPdz89O_sLCQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH v2] package/wpa_supplicant: Allow mesh
 configuration
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
Content-Type: multipart/mixed; boundary="===============3598423274853306157=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3598423274853306157==
Content-Type: multipart/alternative; boundary="0000000000002c1d7605cd1d07aa"

--0000000000002c1d7605cd1d07aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Any impediment here?

Thanks!

Jos=C3=A9.


On Wed, Sep 22, 2021 at 2:38 PM Jos=C3=A9 Pekkarinen <jose.pekkarinen@uniki=
e.com>
wrote:

> wpa_supplicant defconfig doesn't enable CONFIG_MESH
> by default, and currently there is only a path to
> disable it in buildroot. This patch will restore
> the logic to enable it.
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> ---
> [ v1 -> v2 ] s/CONFIG__MESH/CONFIG_MESH/
>
>  package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk
> b/package/wpa_supplicant/wpa_supplicant.mk
> index e9078b9f89..3c0b0c1dfc 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -104,7 +104,9 @@ else
>  WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_WIFI_DISPLAY
>  endif
>
> -ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),)
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)
> +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_MESH
> +else
>  WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_MESH
>  endif
>
> --
> 2.25.1
>
>

--=20

Jos=C3=A9.

--0000000000002c1d7605cd1d07aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><blockquote st=
yle=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Hi,</div><div><br></=
div></blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding=
:0px"><div>Any impediment here?</div><div><br></div></blockquote><blockquot=
e style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Thanks!</div><di=
v><br></div></blockquote><blockquote style=3D"margin:0 0 0 40px;border:none=
;padding:0px"><div>Jos=C3=A9.</div></blockquote></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 2:3=
8 PM Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com"=
>jose.pekkarinen@unikie.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">wpa_supplicant defconfig doesn&#39;t enable CONF=
IG_MESH<br>
by default, and currently there is only a path to<br>
disable it in buildroot. This patch will restore<br>
the logic to enable it.<br>
<br>
Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@u=
nikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
---<br>
[ v1 -&gt; v2 ] s/CONFIG__MESH/CONFIG_MESH/<br>
<br>
=C2=A0package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"no=
referrer" target=3D"_blank">wpa_supplicant.mk</a> | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" re=
l=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> b/package/wpa_supp=
licant/<a href=3D"http://wpa_supplicant.mk" rel=3D"noreferrer" target=3D"_b=
lank">wpa_supplicant.mk</a><br>
index e9078b9f89..3c0b0c1dfc 100644<br>
--- a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"no=
referrer" target=3D"_blank">wpa_supplicant.mk</a><br>
+++ b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"no=
referrer" target=3D"_blank">wpa_supplicant.mk</a><br>
@@ -104,7 +104,9 @@ else<br>
=C2=A0WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_WIFI_DISPLAY<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),)<br>
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_MESH_NETWORKING),y)<br>
+WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_MESH<br>
+else<br>
=C2=A0WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_MESH<br>
=C2=A0endif<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div><=
/div>

--0000000000002c1d7605cd1d07aa--

--===============3598423274853306157==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3598423274853306157==--
