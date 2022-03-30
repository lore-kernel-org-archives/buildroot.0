Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92863C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 04:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 495EC40A93;
	Wed, 30 Mar 2022 04:21:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 64Rp4SZUpvIN; Wed, 30 Mar 2022 04:21:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 415A540142;
	Wed, 30 Mar 2022 04:21:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D83A1BF5EA
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 04:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C16684530
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 04:21:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rs1pyczurCNm for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 04:21:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B0448452F
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 04:21:43 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id x20so34864353ybi.5
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 21:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h29u33cgqIxgAJ6s33ED0ahuI7fXBB45buiYcvCoyyY=;
 b=Z6U0VFknQFiFpAA+d8IMA9yZzr0R6DX2aaaYsQIzjBKoX0sbJkS5xgziWhQmsbD1TP
 QeCBk7oBoHHR5qBoD+iylSbe25Db/lkx9AHLtWbUZD8i+fr0GA2RDV7jPplEu9Ua6DPU
 Wt2V++R803DWzrKqOu9FQWe+RisBYtrBXnizNW1jfjEk0pxVUbLfW3nVklR+pNcLnoeh
 kFQn+O2ppE2xh/0QR4w/0bIQTxCoJhwlGgvqzbkmQfxR9vqGb5DIY5ytnjAUZ1mRxpJr
 xVAJ8cjsUAGOV5QDnhcFQvcT2LnhnD3C9QZ9MTRtrs6Zc2MGVSe1AqsAGhpEh9VxAyyV
 nctQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h29u33cgqIxgAJ6s33ED0ahuI7fXBB45buiYcvCoyyY=;
 b=RWUTQORAdo98/GXz/4w/pW0xaCU8DKBXKLNdrov6Qvzmqrhtl/Lw5UrLGIdrAxPpDH
 lr1kArPtPSG+fSDN7lueA07AZ2J+uSyJQwd3B/O1VGh4RvCR8lxNEd7RfuH8llVnPn/l
 F7fR8wLT0jyc+o58okE8cDqCoqft0P5MKzw1AorlPvIESedj37WvavL/Z1eTsHlV2Qpb
 5JgLQUV+hn6cpmdbniBY8PaP8juRUx35Tr+S4v6Nkp6Tdg8RyQA9dBZAnpmt4l1EnYAu
 uPrHLfmfKS6GL7dcRHuksH/HExOcHCaPrhQESmfcXNp+/f0fNXUo/VzEph7nMXnZtwmX
 51PA==
X-Gm-Message-State: AOAM530m8U8tZp7RvxupbKoHUCB/yuDd38oQHFWYHeKW/9AxoPOhj3wh
 LmYTmoeg6FFolqkqiUDI/4cghSdEH3qlQWKIIqOiXBz0
X-Google-Smtp-Source: ABdhPJyXbO4txtlN+6JNLcoBJsjQQi+MfFgK9A+3fhddESU+6AzcmUBDa643Xe9MN6kaVwVkzCYmIhcOxC7n19jJWBE=
X-Received: by 2002:a25:d788:0:b0:634:dd8:49c8 with SMTP id
 o130-20020a25d788000000b006340dd849c8mr32232572ybg.161.1648614101889; Tue, 29
 Mar 2022 21:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
In-Reply-To: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 30 Mar 2022 01:21:31 -0300
Message-ID: <CAM70yxCGb7BOhaVnnNdeqUTCwBq5Q2oChBnq=XawR7a7bwTdEQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: fix PEP517
 purelib deployment path
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
Cc: james.hilliard1@gmail.com, yann.morin.1998@free.fr
Content-Type: multipart/mixed; boundary="===============8385491889479982012=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8385491889479982012==
Content-Type: multipart/alternative; boundary="000000000000ea37e905db67e1d5"

--000000000000ea37e905db67e1d5
Content-Type: text/plain; charset="UTF-8"

Sorry, forgot to CC the relevant developers (at least who I think are
relevant). I'm more accustomed to modern software collaboration tools like
GitHub / GitLab / JIRA, to be honest.

On Wed, Mar 30, 2022 at 1:05 AM Emile Cormier <emile.cormier.jr@gmail.com>
wrote:

> package/pkg-python.mk: fix PEP517 purelib deployment path
>
> This allows the Python interpreter to find packages built via the new Flit
> infrastructure and fixes bug #14721.
> Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
>
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index 52ce402281..6aaca1f465 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV = \
>  PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> - --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> \
> +
> --purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> \
>   --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>   --scripts=$(TARGET_DIR)/usr/bin \
>   --data=$(TARGET_DIR)/usr
> @@ -135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
>  PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> -
> --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +
> --purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> \
>   --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>   --scripts=$(STAGING_DIR)/usr/bin \
>   --data=$(STAGING_DIR)/usr
> @@ -149,7 +149,7 @@ HOST_PKG_PYTHON_PEP517_ENV = \
>  HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
>   --interpreter=/usr/bin/python \
>   --script-kind=posix \
> - --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> +
> --purelib=$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
>   --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
>   --scripts=$(HOST_DIR)/usr/bin \
>   --data=$(HOST_DIR)/usr
>

--000000000000ea37e905db67e1d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry, forgot to CC the relevant developers (at least who =
I think are relevant). I&#39;m more accustomed to modern software collabora=
tion tools like GitHub / GitLab / JIRA, to be honest.<br></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 20=
22 at 1:05 AM Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gmail.co=
m" target=3D"_blank">emile.cormier.jr@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">package/<a =
href=3D"http://pkg-python.mk" target=3D"_blank">pkg-python.mk</a>: fix PEP5=
17 purelib deployment path<br><br>This allows the Python interpreter to fin=
d packages built via the new Flit<br>infrastructure and fixes bug #14721.<b=
r>Signed-off-by: Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gmail=
.com" target=3D"_blank">emile.cormier.jr@gmail.com</a>&gt; <br><br>diff --g=
it a/package/<a href=3D"http://pkg-python.mk" target=3D"_blank">pkg-python.=
mk</a> b/package/<a href=3D"http://pkg-python.mk" target=3D"_blank">pkg-pyt=
hon.mk</a><br>index 52ce402281..6aaca1f465 100644<br>--- a/package/<a href=
=3D"http://pkg-python.mk" target=3D"_blank">pkg-python.mk</a><br>+++ b/pack=
age/<a href=3D"http://pkg-python.mk" target=3D"_blank">pkg-python.mk</a><br=
>@@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV =3D \<br>=C2=A0PKG_PYTHON_PEP517=
_INSTALL_TARGET_OPTS =3D \<br>=C2=A0	--interpreter=3D/usr/bin/python \<br>=
=C2=A0	--script-kind=3Dposix \<br>-	--purelib=3D$(TARGET_DIR)/lib/python$(P=
YTHON3_VERSION_MAJOR)/site-packages \<br>+	--purelib=3D$(TARGET_DIR)/usr/li=
b/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>=C2=A0	--headers=3D$(TA=
RGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br>=C2=A0	--sc=
ripts=3D$(TARGET_DIR)/usr/bin \<br>=C2=A0	--data=3D$(TARGET_DIR)/usr<br>@@ =
-135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS =3D \<br>=C2=A0PKG_P=
YTHON_PEP517_INSTALL_STAGING_OPTS =3D \<br>=C2=A0	--interpreter=3D/usr/bin/=
python \<br>=C2=A0	--script-kind=3Dposix \<br>-	--purelib=3D$(STAGING_DIR)/=
lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>+	--purelib=3D$(STAGI=
NG_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>=C2=A0	--=
headers=3D$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\=
<br>=C2=A0	--scripts=3D$(STAGING_DIR)/usr/bin \<br>=C2=A0	--data=3D$(STAGIN=
G_DIR)/usr<br>@@ -149,7 +149,7 @@ HOST_PKG_PYTHON_PEP517_ENV =3D \<br>=C2=
=A0HOST_PKG_PYTHON_PEP517_INSTALL_OPTS =3D \<br>=C2=A0	--interpreter=3D/usr=
/bin/python \<br>=C2=A0	--script-kind=3Dposix \<br>-	--purelib=3D$(HOST_DIR=
)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>+	--purelib=3D$(HOS=
T_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>=C2=A0	--h=
eaders=3D$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br>=
=C2=A0	--scripts=3D$(HOST_DIR)/usr/bin \<br>=C2=A0	--data=3D$(HOST_DIR)/usr=
</div>
</blockquote></div>

--000000000000ea37e905db67e1d5--

--===============8385491889479982012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8385491889479982012==--
