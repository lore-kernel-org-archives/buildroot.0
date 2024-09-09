Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB02CE7AB0
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 07:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7085402E4;
	Mon,  9 Sep 2024 07:18:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WLiG_ZdsUL-S; Mon,  9 Sep 2024 07:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2850402C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2850402C0;
	Mon,  9 Sep 2024 07:18:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AAF41BF3BF
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 07:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 186B080C25
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 07:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z-zGEtNHCJ7D for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 07:18:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a34; helo=mail-vk1-xa34.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C798680C17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C798680C17
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com
 [IPv6:2607:f8b0:4864:20::a34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C798680C17
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 07:18:51 +0000 (UTC)
Received: by mail-vk1-xa34.google.com with SMTP id
 71dfb90a1353d-502c8f50c5dso282597e0c.0
 for <buildroot@buildroot.org>; Mon, 09 Sep 2024 00:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725866330; x=1726471130;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dSY0j57dQPyHXg74/duhVTxdNxEPYFOikXPQ1tpaqcM=;
 b=TeTER4Ejs26HmhcT/UEi31+uEhsexMqWa3sWBdfF6NFzRsZxWuSa+UYSb9nop7fcmQ
 3a4ACPMRvGM1hW4tCZ2BCcAUCD5vpVc7UdULUuea8NnYh1R8/xxX3csUuQYwJjP6ckI3
 ks5S0vwL2rsL8YOUYilSuTi93ZMAJdM23sdcGKP0UlXTCoZADeoRygYEBbpfMBeNfQEr
 vG+BKKr9orm7xhAqa4zyuqUJjDPNC02S08/6LLnjaRgb22osT69y0E4LUnaRDZUZOTw0
 6VZTnzNd3uZ2PW1HfGDgAgWp7PloU2gkN7Yihym6Yrg90uH/oZmjMrTpW32+RpKLp0sO
 ys2A==
X-Gm-Message-State: AOJu0Yys8nzPRaW1z77WSzBPg7IC5x7bA1uywTYKtzJsXIKZg012vS8s
 vHnFQcAky7BS7mg/L5Oc10kxS9obD1vgHKuDylwuSpRcgyMiqT0xh3orQIW4Uq5l5WcppB5U8Mz
 PsGxEUryIEXExfo3e89l4YoyBuKhnqOZKKHgM+VVEFldnAGOnbZQ=
X-Google-Smtp-Source: AGHT+IFjUJJ+03Wv419/8Q8B6wlPrs6rRO79cd3G+C9I3KawSz7lL5mSHxh+eBRC/ObugNyQc0ZQaOLXd2c4aJTADDY=
X-Received: by 2002:a05:6122:3123:b0:4fc:e4f5:7f83 with SMTP id
 71dfb90a1353d-5021423527dmr7944116e0c.9.1725866330065; Mon, 09 Sep 2024
 00:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240903100952.3789698-1-lars@underjord.io>
In-Reply-To: <20240903100952.3789698-1-lars@underjord.io>
From: Lars Wikman <lars@underjord.io>
Date: Mon, 9 Sep 2024 09:18:39 +0200
Message-ID: <CADqW+qk-VLMa2m510NvmTZv927DWyt8dgD6ir55ZHeHtS8AzKg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725866330; x=1726471130; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dSY0j57dQPyHXg74/duhVTxdNxEPYFOikXPQ1tpaqcM=;
 b=duDuy3eWvMSuHaSL6amZ6LjYJsXgcZq12OMrBCWYWJalMGiUXfQ6RwroBNW24U2CAz
 RDtiqX+hFnG4UARjWLXPwWnlCgr/qRi0V41uNAxx0+mRRDQkoI9+wTtpMdqeqAeKHU7L
 xyppd+E7xUfISk1eeeG0f6RPIpNzBvMKQOI2HZ/r0Q6L0K2wAyD6uU8XK4G2qtYoFnmi
 zfkrExBao0VZuqQ6+xxA++NCyUK9zCe0Nh+tL2SK8JItngsM4z8xBIfnpxnw6GaAB3dj
 K8aGtYjjCQGLJy+D0l2gGuAsiCy+GIhd8LunfWzoEO4h0dS69wQMumO0pV/k8e2keXlV
 KuIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=duDuy3eW
Subject: Re: [Buildroot] [PATCH v3] package/wpa_supplicant: add Smart card
 option
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: multipart/mixed; boundary="===============3142339494427672830=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3142339494427672830==
Content-Type: multipart/alternative; boundary="00000000000088a6ad0621aa9107"

--00000000000088a6ad0621aa9107
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

I submitted a v3 which I see in patchwork but I don't see it in my sent
email so I'm uncertain about whether it reached the list okay.

Link in patchwork:
https://patchwork.ozlabs.org/project/buildroot/patch/20240903100952.3789698=
-1-lars@underjord.io/

-Lars

On Tue, Sep 3, 2024 at 12:09=E2=80=AFPM Lars Wikman <lars@underjord.io> wro=
te:

> CONFIG_SMARTCARD was unconditionally disabled which has meant that
> even if OpenSSL is compiled with engine support and the supplicant
> is configured to use an engine it would warn that it was compiled
> without engine support.
>
> This mechanism is used to enable the more secure forms of 802.1x
> networking authentication such as EAP-TLS with hardware-delegated
> cryptography and private keys protected in hardware.
>
> It is still disabled by default in case there was an original reason.
>
> Enabling the option will allow delegating private key access to TPM2,
> ARM TrustZone and other specialized secure hardware for establishing
> a network connection.
>
> Signed-off-by: Lars Wikman <lars@underjord.io>
>
> ---
> Changes v1 -> v2:
>   - Change option name to focus on smartcard  (suggested by Sergey)
> Changes v2 -> v3:
>   - Change setting disabled to match convention (suggested by Baruch)
>
> Signed-off-by: Lars Wikman <lars@underjord.io>
> ---
>  package/wpa_supplicant/Config.in         | 6 ++++++
>  package/wpa_supplicant/wpa_supplicant.mk | 9 ++++++---
>  2 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/package/wpa_supplicant/Config.in
> b/package/wpa_supplicant/Config.in
> index 92953f69f0..2aee108fc1 100644
> --- a/package/wpa_supplicant/Config.in
> +++ b/package/wpa_supplicant/Config.in
> @@ -175,4 +175,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
>         help
>           Add introspection support for the DBus control interface.
>
> +config BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD
> +       bool "Smartcard support"
> +       help
> +         Enable the smart card support. Required for OpenSSL engines
> +         to work using PKCS11 and 802.1x
> +
>  endif
> diff --git a/package/wpa_supplicant/wpa_supplicant.mk
> b/package/wpa_supplicant/wpa_supplicant.mk
> index 984959f679..6199e584d0 100644
> --- a/package/wpa_supplicant/wpa_supplicant.mk
> +++ b/package/wpa_supplicant/wpa_supplicant.mk
> @@ -24,9 +24,6 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \
>         CONFIG_INTERNAL_LIBTOMMATH \
>         CONFIG_MATCH_IFACE
>
> -WPA_SUPPLICANT_CONFIG_DISABLE =3D \
> -       CONFIG_SMARTCARD
> -
>  # libnl-3 needs -lm (for rint) and -lpthread if linking statically
>  # And library order matters hence stick -lnl-3 first since it's appended
>  # in the wpa_supplicant Makefiles as in LIBS+=3D-lnl-3 ... thus failing
> @@ -180,6 +177,12 @@ WPA_SUPPLICANT_DEPENDENCIES +=3D readline
>  WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_READLINE
>  endif
>
> +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)
> +WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD
> +else
> +WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_SMARTCARD
> +endif
> +
>  ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)
>  define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
>         sed -i '/ctrl_interface/s/^#//g'
> $(TARGET_DIR)/etc/wpa_supplicant.conf
> --
> 2.34.1
>
>

--00000000000088a6ad0621aa9107
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>I submitted a v3 which I see in patc=
hwork but I don&#39;t see it in my sent email so I&#39;m uncertain about wh=
ether it reached the list okay.</div><div><br></div><div>Link in patchwork:=
=C2=A0<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20240=
903100952.3789698-1-lars@underjord.io/">https://patchwork.ozlabs.org/projec=
t/buildroot/patch/20240903100952.3789698-1-lars@underjord.io/</a></div><div=
><br></div><div>-Lars</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Tue, Sep 3, 2024 at 12:09=E2=80=AFPM Lars Wik=
man &lt;<a href=3D"mailto:lars@underjord.io">lars@underjord.io</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">CONFIG_SMARTC=
ARD was unconditionally disabled which has meant that<br>
even if OpenSSL is compiled with engine support and the supplicant<br>
is configured to use an engine it would warn that it was compiled<br>
without engine support.<br>
<br>
This mechanism is used to enable the more secure forms of 802.1x<br>
networking authentication such as EAP-TLS with hardware-delegated<br>
cryptography and private keys protected in hardware.<br>
<br>
It is still disabled by default in case there was an original reason.<br>
<br>
Enabling the option will allow delegating private key access to TPM2,<br>
ARM TrustZone and other specialized secure hardware for establishing<br>
a network connection.<br>
<br>
Signed-off-by: Lars Wikman &lt;<a href=3D"mailto:lars@underjord.io" target=
=3D"_blank">lars@underjord.io</a>&gt;<br>
<br>
---<br>
Changes v1 -&gt; v2:<br>
=C2=A0 - Change option name to focus on smartcard=C2=A0 (suggested by Serge=
y)<br>
Changes v2 -&gt; v3:<br>
=C2=A0 - Change setting disabled to match convention (suggested by Baruch)<=
br>
<br>
Signed-off-by: Lars Wikman &lt;<a href=3D"mailto:lars@underjord.io" target=
=3D"_blank">lars@underjord.io</a>&gt;<br>
---<br>
=C2=A0package/wpa_supplicant/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 6=
 ++++++<br>
=C2=A0package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"no=
referrer" target=3D"_blank">wpa_supplicant.mk</a> | 9 ++++++---<br>
=C2=A02 files changed, 12 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Conf=
ig.in<br>
index 92953f69f0..2aee108fc1 100644<br>
--- a/package/wpa_supplicant/Config.in<br>
+++ b/package/wpa_supplicant/Config.in<br>
@@ -175,4 +175,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Add introspection support for the DBus c=
ontrol interface.<br>
<br>
+config BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Smartcard support&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable the smart card support. Required =
for OpenSSL engines<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to work using PKCS11 and 802.1x<br>
+<br>
=C2=A0endif<br>
diff --git a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" re=
l=3D"noreferrer" target=3D"_blank">wpa_supplicant.mk</a> b/package/wpa_supp=
licant/<a href=3D"http://wpa_supplicant.mk" rel=3D"noreferrer" target=3D"_b=
lank">wpa_supplicant.mk</a><br>
index 984959f679..6199e584d0 100644<br>
--- a/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"no=
referrer" target=3D"_blank">wpa_supplicant.mk</a><br>
+++ b/package/wpa_supplicant/<a href=3D"http://wpa_supplicant.mk" rel=3D"no=
referrer" target=3D"_blank">wpa_supplicant.mk</a><br>
@@ -24,9 +24,6 @@ WPA_SUPPLICANT_CONFIG_ENABLE =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIG_INTERNAL_LIBTOMMATH \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CONFIG_MATCH_IFACE<br>
<br>
-WPA_SUPPLICANT_CONFIG_DISABLE =3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0CONFIG_SMARTCARD<br>
-<br>
=C2=A0# libnl-3 needs -lm (for rint) and -lpthread if linking statically<br=
>
=C2=A0# And library order matters hence stick -lnl-3 first since it&#39;s a=
ppended<br>
=C2=A0# in the wpa_supplicant Makefiles as in LIBS+=3D-lnl-3 ... thus faili=
ng<br>
@@ -180,6 +177,12 @@ WPA_SUPPLICANT_DEPENDENCIES +=3D readline<br>
=C2=A0WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_READLINE<br>
=C2=A0endif<br>
<br>
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_SMARTCARD),y)<br>
+WPA_SUPPLICANT_CONFIG_ENABLE +=3D CONFIG_SMARTCARD<br>
+else<br>
+WPA_SUPPLICANT_CONFIG_DISABLE +=3D CONFIG_SMARTCARD<br>
+endif<br>
+<br>
=C2=A0ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)<br>
=C2=A0define WPA_SUPPLICANT_ENABLE_CTRL_IFACE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &#39;/ctrl_interface/s/^#//g&#39; $(TARG=
ET_DIR)/etc/wpa_supplicant.conf<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--00000000000088a6ad0621aa9107--

--===============3142339494427672830==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3142339494427672830==--
