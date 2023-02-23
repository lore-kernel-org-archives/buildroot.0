Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C46BC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 06:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA4B281F9D;
	Thu, 23 Feb 2023 06:58:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA4B281F9D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vzkGk7WD7SCm; Thu, 23 Feb 2023 06:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1518981F13;
	Thu, 23 Feb 2023 06:58:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1518981F13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 75C831BF842
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 06:58:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F5BE81F13
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 06:58:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F5BE81F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EshIu7496l7C for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 06:58:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A93681E3A
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com
 [209.85.217.41])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A93681E3A
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 06:58:42 +0000 (UTC)
Received: by mail-vs1-f41.google.com with SMTP id x14so13444522vso.9
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 22:58:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uZBo3yWk38/nxsYmH4VIlZGQHE3dbtTIgGbNiV5mZmg=;
 b=NxqvABIxWOpl9hUjjVKrzer23Vfynoh4csUzu9pKFhXfT7Xoo1zi3kzsS1xn8Y7oIA
 ma0kLvcVybJ1L5xXbIIM496pTPQh/3yEIc6OY+xIHKUJfVT7cbFlFYFhjALCPg/g4SxI
 BcgC5Tgb6axgpgCzVVdsF+DNqA1TVXLzRCpTNFf7vH3PAqqrZ/N+9P8ctNY3Bmj+AHg2
 UbijueRQLWCI8Qo6zilddMs7QzQlgATYyfENyYewbZpbwwyR6m0zggQieh1yEZwlcDaa
 9kthGFsYtywS4O/FRobEum4pq9CZwroTQfl2Yldvo7F7DRz0H6Dt683V1Qi5GsyNgrle
 OlRw==
X-Gm-Message-State: AO0yUKVHiJCUn22dnt6LCsSjbESyGR/VkYig1cLRNOxcaL0XtMy5TiDv
 xN8ze15TOtARZOSiNM9Kp0bRVg7dPYEByI4RVahvww==
X-Google-Smtp-Source: AK7set+EW9ublo0BCcNAvPQcp/tWp2YRChfgYNcBzo9L3XCzotQ+8xgfQgpt3R/EFjvOXNTYMjTI+aJi06TDNnwMbSE=
X-Received: by 2002:a1f:434c:0:b0:406:1ef2:7bc7 with SMTP id
 q73-20020a1f434c000000b004061ef27bc7mr206319vka.2.1677135521708; Wed, 22 Feb
 2023 22:58:41 -0800 (PST)
MIME-Version: 1.0
References: <CACXRmJj0nSjChCdU8+fDQsiqVw5gUn-91wqLXhYpcc4GfA-Cug@mail.gmail.com>
 <20230221192802.4117856-1-thomas.devoogdt@barco.com>
 <20230221192802.4117856-4-thomas.devoogdt@barco.com>
In-Reply-To: <20230221192802.4117856-4-thomas.devoogdt@barco.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 23 Feb 2023 07:58:30 +0100
Message-ID: <CAB0FRstzoQ-p1TJjBUzN-hou=t-Vs7=u5XeLxdXZggzq7OxAmA@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Subject: Re: [Buildroot] [PATCH v3 4/4] package/libgtk3: only
 update-icon-cache when the demos are built
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: multipart/mixed; boundary="===============0418021890248224285=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0418021890248224285==
Content-Type: multipart/alternative; boundary="0000000000000315d005f5588b89"

--0000000000000315d005f5588b89
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 21 f=C3=A9vr. 2023 =C3=A0 20:29, Thomas Devoogdt <thomas@devoogdt.c=
om> a
=C3=A9crit :

> Similar to:
> https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/4358/diffs
>
> Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> ---
> v3:
>  - rebased on
> https://patchwork.ozlabs.org/project/buildroot/list/?series=3D336254
>  - needed to fix the webkitgtk 2.38.5 compilation
>    (
> https://patchwork.ozlabs.org/project/buildroot/patch/20230220090923.21556=
35-2-thomas.devoogdt@barco.com/
> )
> ---
>  package/libgtk3/libgtk3.mk | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
> index 2821c7eb52..b78578d568 100644
> --- a/package/libgtk3/libgtk3.mk
> +++ b/package/libgtk3/libgtk3.mk
> @@ -145,11 +145,13 @@ endef
>
>  # Create icon-theme.cache for each of the icon directories/themes
>  # It's not strictly necessary but speeds up lookups
> +ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),y)
>

I disagree with this logic.
At this time, icons could installed by 2 packages:
- hicolor-icon-theme which is selected by libgtk3-demo
- adwaita-icon-theme

From my point of view, this finalize hook must be always enabled as
actually,
but it must never fails even when there is no icons.

Fran=C3=A7ois



>  define LIBGTK3_UPDATE_ICON_CACHE
>         find $(TARGET_DIR)/usr/share/icons -maxdepth 1 -mindepth 1 -type =
d
> \
>                 -exec $(HOST_DIR)/bin/gtk-update-icon-cache {} \;
>  endef
>  LIBGTK3_TARGET_FINALIZE_HOOKS +=3D LIBGTK3_UPDATE_ICON_CACHE
> +endif
>
>  $(eval $(meson-package))
>  $(eval $(host-generic-package))
> --
> 2.39.2
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000000315d005f5588b89
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 21 f=C3=A9vr. 2023 =C3=
=A0=C2=A020:29, Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com">=
thomas@devoogdt.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Similar to:<br>
<a href=3D"https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/4358/diffs" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.gnome.org/GNOME/gtk/-/m=
erge_requests/4358/diffs</a><br>
<br>
Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@barco.=
com" target=3D"_blank">thomas.devoogdt@barco.com</a>&gt;<br>
---<br>
v3:<br>
=C2=A0- rebased on <a href=3D"https://patchwork.ozlabs.org/project/buildroo=
t/list/?series=3D336254" rel=3D"noreferrer" target=3D"_blank">https://patch=
work.ozlabs.org/project/buildroot/list/?series=3D336254</a><br>
=C2=A0- needed to fix the webkitgtk 2.38.5 compilation<br>
=C2=A0 =C2=A0(<a href=3D"https://patchwork.ozlabs.org/project/buildroot/pat=
ch/20230220090923.2155635-2-thomas.devoogdt@barco.com/" rel=3D"noreferrer" =
target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot/patch/2023=
0220090923.2155635-2-thomas.devoogdt@barco.com/</a>)<br>
---<br>
=C2=A0package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk3.mk</a> | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"noreferre=
r" target=3D"_blank">libgtk3.mk</a> b/package/libgtk3/<a href=3D"http://lib=
gtk3.mk" rel=3D"noreferrer" target=3D"_blank">libgtk3.mk</a><br>
index 2821c7eb52..b78578d568 100644<br>
--- a/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk3.mk</a><br>
+++ b/package/libgtk3/<a href=3D"http://libgtk3.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libgtk3.mk</a><br>
@@ -145,11 +145,13 @@ endef<br>
<br>
=C2=A0# Create icon-theme.cache for each of the icon directories/themes<br>
=C2=A0# It&#39;s not strictly necessary but speeds up lookups<br>
+ifeq ($(BR2_PACKAGE_LIBGTK3_DEMO),y)<br></blockquote><div><br></div><div>I=
 disagree with this logic.</div><div>At this time, icons could installed by=
 2 packages:</div><div>- hicolor-icon-theme which is selected by libgtk3-de=
mo</div><div>- adwaita-icon-theme</div><div><br></div><div>From my point of=
 view, this finalize hook must be always enabled as actually,</div><div>but=
 it must never fails <span class=3D"gmail-HwtZe" lang=3D"en"><span class=3D=
"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqvb">even when there is =
no icons.<br></span></span></span></div><div><span class=3D"gmail-HwtZe" la=
ng=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryN=
qvb"><br></span></span></span></div><div><span class=3D"gmail-HwtZe" lang=
=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=3D"gmail-ryNqv=
b">Fran=C3=A7ois<br></span></span></span></div><div><br><span class=3D"gmai=
l-HwtZe" lang=3D"en"><span class=3D"gmail-jCAhz gmail-ChMk0b"><span class=
=3D"gmail-ryNqvb"></span></span></span></div><div></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0define LIBGTK3_UPDATE_ICON_CACHE<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 find $(TARGET_DIR)/usr/share/icons -maxdepth 1 =
-mindepth 1 -type d \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -exec $(HOST_DIR)/b=
in/gtk-update-icon-cache {} \;<br>
=C2=A0endef<br>
=C2=A0LIBGTK3_TARGET_FINALIZE_HOOKS +=3D LIBGTK3_UPDATE_ICON_CACHE<br>
+endif<br>
<br>
=C2=A0$(eval $(meson-package))<br>
=C2=A0$(eval $(host-generic-package))<br>
-- <br>
2.39.2<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000000315d005f5588b89--

--===============0418021890248224285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0418021890248224285==--
