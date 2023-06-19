Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16A0EB64DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9786141550;
	Mon, 19 Jun 2023 19:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9786141550
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TvpIVcZAJNII; Mon, 19 Jun 2023 19:53:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C006B403F8;
	Mon, 19 Jun 2023 19:53:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C006B403F8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EBF1A1BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C041481F71
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C041481F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OtBkhzUY9nDk for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:53:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A94481F6E
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6A94481F6E
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:53:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3f9083d8849so31452985e9.0
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687204401; x=1689796401;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S0sVFpq4DD0vbVC26FtUtOj2xnZ9hq4ie8qC8jgkiFg=;
 b=ZihblTCHb3ksCkbGAZqIv5Le1TCZM1gEjqaPpCujhMTDCC5hnvqwdgMgJv1v2r6D8i
 sL8rBMTfxnyaeu7RmzPw/4cWf0KBqGFPGZldRkfr1Nl7atlUYkV8VsMbVajLK1PikeDO
 yVpsZ0k808ETg+Enx8Lf46Y8ANu9DdYCmLC7cqHbOUYjal5HWysy6YhfXIbmz5wHKpcv
 Zb5O/eaTS7fSzQ2xuwjk2yUQQ/5ssdn+vCW8Msnl59CkEjIRRuWkDZhzpqki0ZUfPHBR
 WoJQsMyo1yCd7IpIBy0jpvtNQRvSECPaWvne9no9FqYS5D6rpds05ZeokwnPqDpVUBGo
 N//A==
X-Gm-Message-State: AC+VfDyGzW7zopF+8Se3+FhHEDZigBDi2DSCuQodqZ0fiLAKEwB6vXla
 S6L6PIqu0euKDI1NAtIazMs8IolSqMQuMzIksrlJRadJWus=
X-Google-Smtp-Source: ACHHUZ4ddkfuLM8UEwcF0FugJkjYxBAnCHCdyIVxUMoXWKCopJ8zeI9ybYJaE7CR/25+wy+VHh/MyQuPhY6JtbrFq/M=
X-Received: by 2002:a05:600c:228a:b0:3f9:a4e:190a with SMTP id
 10-20020a05600c228a00b003f90a4e190amr5420390wmf.7.1687204401138; Mon, 19 Jun
 2023 12:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181458.1596060-1-bernd@kuhls.net>
In-Reply-To: <20230619181458.1596060-1-bernd@kuhls.net>
From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 20 Jun 2023 07:53:08 +1200
Message-ID: <CAFOYHZC9JSt7ogT1PtOyEn-6KC_NCMgpOrM2pWSQaCgd31yiAw@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687204401; x=1689796401;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S0sVFpq4DD0vbVC26FtUtOj2xnZ9hq4ie8qC8jgkiFg=;
 b=aJ7THe43UGoagUXTqeJw1HmRSfIByMqAIs3DiPKNvqpyFb339ivi+Wrw9B9A34vq4s
 KpS70j9bQJRGzD8tOkqxVBOdttTeCbzYuEO/byh/TeImuOHaZfuCHcsonwolPIt4SfJ6
 +FG0o5bdyOSKS3AIuaXr4134kA3jzFEmwXHw3A8k5YbObSexAPkfNFtlQ1Eme/hbjOwN
 Q0R5YJ2EAxaFLoKzzD7G2AQ0gtakCyjjYuvyZYiXMad1OaqAjePVcyMu38W3ks7VM4PR
 34X+RmH4Eax0XLcluLpzoUCeatGidd9TgX2tI9SOU7pMREe8yVKYALjm3aORPe9nvsic
 w7Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=aJ7THe43
Subject: Re: [Buildroot] [PATCH 1/2] package/syslog-ng: disable python
 support
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6977123813969643433=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6977123813969643433==
Content-Type: multipart/alternative; boundary="000000000000fe509305fe80e2ac"

--000000000000fe509305fe80e2ac
Content-Type: text/plain; charset="UTF-8"

Hi Bernd,

On Tue, 20 Jun 2023, 6:15 am Bernd Kuhls, <bernd@kuhls.net> wrote:

> Upstream added a list of python modules declared as runtime dependencies
>
> https://github.com/syslog-ng/syslog-ng/commit/f18345d2a16aea1a95d891ebb24a4ace9c652621
> most of them with fixed (and outdated) versions.
>
> Disable python support for the time being.
>
> Fixes:
>
> http://autobuild.buildroot.net/results/436/436e90bb1f77143b05cb98df78934555bbb7df35/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>

Thanks, I had hoped to find a way of avoiding disabling python support but
this seems like the best thing we can do right now.

Reviewed-by: Chris Packham <judge.packham@gmail.com>

> ---
>  package/syslog-ng/syslog-ng.mk | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/
> syslog-ng.mk
> index 1c4cec6adb..ecc8eeddce 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -16,7 +16,8 @@ SYSLOG_NG_DEPENDENCIES = host-bison host-flex
> host-pkgconf \
>  # We're patching configure.ac
>  SYSLOG_NG_AUTORECONF = YES
>  SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
> -       --disable-java --disable-java-modules --disable-mongodb
> +       --disable-java --disable-java-modules --disable-mongodb \
> +       --disable-python
>  SYSLOG_NG_CFLAGS = $(TARGET_CFLAGS)
>
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
> @@ -39,15 +40,6 @@ else
>  SYSLOG_NG_CONF_OPTS += --disable-linux-caps
>  endif
>
> -ifeq ($(BR2_PACKAGE_PYTHON3),y)
> -SYSLOG_NG_DEPENDENCIES += python3
> -SYSLOG_NG_CONF_OPTS += \
> -       --enable-python \
> -       --with-python=$(PYTHON3_VERSION_MAJOR)
> -else
> -SYSLOG_NG_CONF_OPTS += --disable-python
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBESMTP),y)
>  SYSLOG_NG_DEPENDENCIES += libesmtp
>  SYSLOG_NG_CONF_OPTS += --enable-smtp
> --
> 2.39.2
>
>

--000000000000fe509305fe80e2ac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi=C2=A0Bernd,<br><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, 20 Jun 2023, 6:15 am Bernd Kuhls=
, &lt;<a href=3D"mailto:bernd@kuhls.net">bernd@kuhls.net</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Upstream added a list of python module=
s declared as runtime dependencies<br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/commit/f18345d2a16aea1a95=
d891ebb24a4ace9c652621" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://github.com/syslog-ng/syslog-ng/commit/f18345d2a16aea1a95d891ebb24a4ace=
9c652621</a><br>
most of them with fixed (and outdated) versions.<br>
<br>
Disable python support for the time being.<br>
<br>
Fixes:<br>
<a href=3D"http://autobuild.buildroot.net/results/436/436e90bb1f77143b05cb9=
8df78934555bbb7df35/" rel=3D"noreferrer noreferrer" target=3D"_blank">http:=
//autobuild.buildroot.net/results/436/436e90bb1f77143b05cb98df78934555bbb7d=
f35/</a><br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank" rel=3D"noreferrer">bernd@kuhls.net</a>&gt;<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks, I had hoped to f=
ind a way of avoiding disabling python support but this seems like the best=
 thing we can=C2=A0do right now.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Reviewed-by: Chris Packham &lt;<a href=3D"mailto:judge.packham@gm=
ail.com">judge.packham@gmail.com</a>&gt;</div><div dir=3D"auto"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
=C2=A0package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">syslog-ng.mk</a> | 12 ++----------<br>
=C2=A01 file changed, 2 insertions(+), 10 deletions(-)<br>
<br>
diff --git a/package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"noref=
errer noreferrer" target=3D"_blank">syslog-ng.mk</a> b/package/syslog-ng/<a=
 href=3D"http://syslog-ng.mk" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">syslog-ng.mk</a><br>
index 1c4cec6adb..ecc8eeddce 100644<br>
--- a/package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">syslog-ng.mk</a><br>
+++ b/package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">syslog-ng.mk</a><br>
@@ -16,7 +16,8 @@ SYSLOG_NG_DEPENDENCIES =3D host-bison host-flex host-pkgc=
onf \<br>
=C2=A0# We&#39;re patching <a href=3D"http://configure.ac" rel=3D"noreferre=
r noreferrer" target=3D"_blank">configure.ac</a><br>
=C2=A0SYSLOG_NG_AUTORECONF =3D YES<br>
=C2=A0SYSLOG_NG_CONF_OPTS =3D --disable-manpages --localstatedir=3D/var/run=
 \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-java --disable-java-modules --disable=
-mongodb<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-java --disable-java-modules --disable=
-mongodb \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-python<br>
=C2=A0SYSLOG_NG_CFLAGS =3D $(TARGET_CFLAGS)<br>
<br>
=C2=A0ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)<br>
@@ -39,15 +40,6 @@ else<br>
=C2=A0SYSLOG_NG_CONF_OPTS +=3D --disable-linux-caps<br>
=C2=A0endif<br>
<br>
-ifeq ($(BR2_PACKAGE_PYTHON3),y)<br>
-SYSLOG_NG_DEPENDENCIES +=3D python3<br>
-SYSLOG_NG_CONF_OPTS +=3D \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0--enable-python \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0--with-python=3D$(PYTHON3_VERSION_MAJOR)<br>
-else<br>
-SYSLOG_NG_CONF_OPTS +=3D --disable-python<br>
-endif<br>
-<br>
=C2=A0ifeq ($(BR2_PACKAGE_LIBESMTP),y)<br>
=C2=A0SYSLOG_NG_DEPENDENCIES +=3D libesmtp<br>
=C2=A0SYSLOG_NG_CONF_OPTS +=3D --enable-smtp<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div></div>

--000000000000fe509305fe80e2ac--

--===============6977123813969643433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6977123813969643433==--
