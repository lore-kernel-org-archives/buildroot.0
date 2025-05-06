Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BEC9C3ABBC
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 16:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9A9E60AD1;
	Tue,  6 May 2025 16:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZP0BNpFhie25; Tue,  6 May 2025 16:41:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D579760AAC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D579760AAC;
	Tue,  6 May 2025 16:41:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A6FD820F8
 for <buildroot@buildroot.org>; Tue,  6 May 2025 16:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D21340B26
 for <buildroot@buildroot.org>; Tue,  6 May 2025 16:41:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NkSF7IPgSGGI for <buildroot@buildroot.org>;
 Tue,  6 May 2025 16:41:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A60241081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A60241081
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A60241081
 for <buildroot@buildroot.org>; Tue,  6 May 2025 16:41:24 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e6dd991a0e6so4339296276.1
 for <buildroot@buildroot.org>; Tue, 06 May 2025 09:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746549683; x=1747154483;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UiowpIgc0xebtrNzVwfNCjbZSH63kmayEFMnFhPW5pY=;
 b=BK7+1gf+YBCV0lJQ/xE6C2zCgTE7uCwb4aEq/Pwo9rAL8RJ+aOCbakBGzXXERf5nNN
 JwqIK2Lyz590Xqzl+5UjrSWJDHvpzDM5ETDcj4tZmgaEsrMHh6bIHx/Ljq/AHReNQ5jj
 lNyApX/T6g2chnnDlANiFdmztw0TZD9qWVVG7U5dQg8JEDWEZ8xuhdbkfEB6EVavkkuc
 KOIDTYwaE1S0TEE3s1FRUZgkxwIFp8kYSzY2Gryr/VHwnoP1W0N4nUCDt+UPFVrWx0QK
 qUq4LcUAXpsW1soVn6UUcuqVbfO3POC+bRWbVV0vCjijW1e3lPar17wZMo8iLl5fNkg+
 UXeA==
X-Gm-Message-State: AOJu0YxFWKnE85dJzRTlcGfQJ0s57aXz8M7HJhv70PeL0xjlCrW7cQdz
 IVlfsdv+KCrcdBtWFvVy+qlMCbLpuJ6YIfCDLVAVKaT257z9JRHk+sa8yQ7SdEUqHzgVCjn8bXA
 At5rYcrPT1YVeH8aZSKsHFcDx77Y=
X-Gm-Gg: ASbGncusrGg9wLzyKH3h4qRu21Lf790anhHyvu8YkblkXxIxo+JoHHsB2QUdi2mzUEU
 LYXPboTsdDGQFi3U1Kf+WRSwJunqZolUyiH4Anuv81doH4t+1DkDmeHT/SJ47k93UA3JEKW9c/x
 BOvQqkRKrXVaobinHdZVWH9AhxSrsh+GbnOA==
X-Google-Smtp-Source: AGHT+IF9D69EIBnpjSFvBoECXsOeYb/qZQ/ogv6ecfFzqIwIeY/QcOK7VY/tl5liL4wRL/m5si+//3ooh4HKM/4VrnA=
X-Received: by 2002:a05:690c:6307:b0:703:ac44:d379 with SMTP id
 00721157ae682-70a1da190e9mr723697b3.22.1746549683207; Tue, 06 May 2025
 09:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250506155716.213768-1-ju.o@free.fr>
In-Reply-To: <20250506155716.213768-1-ju.o@free.fr>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Tue, 6 May 2025 18:41:11 +0200
X-Gm-Features: ATxdqUF8sybif1WFe-8pjJhDjaJbFJ1i54Z7Cz_yITP4cSGMK8tsu1H36QVOHvY
Message-ID: <CAH+XeQb=F_3VfE-2vUPvru5mVA76xFCS=jT79R2oC45YuGBEuQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Vincent Fazio <vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746549683; x=1747154483; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UiowpIgc0xebtrNzVwfNCjbZSH63kmayEFMnFhPW5pY=;
 b=IaxT4nHjOhT/I5kbAh+kY/hvwDjqI2sfifrot2wgm5y64nAD32rv94LKR4TpAOmQ2l
 AgUJe6bwss1DS/Juf1RsRWsA2IjnZ6oGob6zy4KKwhM188mH3RmM1qgPPZGhkNkiz+G4
 tJ+EXUgG5RQRWtjnTeOaHBJsC48AvEA2bRM1SccwoE7cNRWI9ee2MIKZ7d8FF3WB5pw2
 7pdIXCg+jF/w2GMb7Fcgy3ogjDSLP/H0R6SukeCdrPqHaTD/7MfZZH1aI2SvKNvJ4qa3
 pqpaQ9hRxDihC8PQERe4pb2TPlbaeASRVS2XM/BPIBVrqQ7zAr3T4ZXqY1Fp4uWB5NPF
 sK+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IaxT4nHj
Subject: Re: [Buildroot] [PATCH RFC 1/1]
 support/testing/tests/package/test_zfs: fix uclibc test by using
 bleeding-edge toolchain
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============5390476594536003070=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5390476594536003070==
Content-Type: multipart/alternative; boundary="000000000000734aa106347a49d4"

--000000000000734aa106347a49d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Julien,

First, thank you for your patch. It fixes the ZFS test compilation issue
correctly. :thumb_up:

Now, regarding the second issue; it seems that the python3 binary is
somehow broken. If you try to run /usr/bin/python3, it will raise the same
problem. I am currently debugging this binary.

Greetings.

El mar, 6 may 2025 a las 17:57, Julien Olivain (<ju.o@free.fr>) escribi=C3=
=B3:

> Since commit [1] which bumped Python from 3.12.9 to 3.13.2, the runtime
> test tests.package.test_zfs.TestZfsUclibc is failing with the error:
>
>     WARN: defconfig can't be used
>           Missing: BR2_PACKAGE_PYTHON3=3Dy
>
> This is because Python 3.13 requires time64, and uclibc supports it only
> with toolchain headers >=3D 5.1. The stable bootlin toolchain is based on
> 4.19 headers and is no longer sufficient.
>
> This commit fixes the issue by updating the defconfig of the runtime
> test, to use the bleeding-edge toolchain (which is based on 5.15
> headers).
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/9922591461
>
> [1]
> https://gitlab.com/buildroot.org/buildroot/-/commit/d63e207eb869063f82c86=
7658676c2903beb08cb
>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> While testing this patch in
> https://gitlab.com/jolivain/buildroot/-/jobs/9935681972
> it appears that it does fix the initial build issue, but it also
> reveal a new runtime issue. The Python interpreter (from the
> arc_summary script) crashes with a message:
>
>     Fatal Python error: _PyThreadState_Attach: non-NULL old thread state
>     Python runtime state: preinitialized
>     Thread 0xSegmentation fault
>
> So even when applying this patch, the runtime test still fails (it
> just goes a bit farther). The issue now seems to be only related to
> python 3.13 and uclibc.
>
> Does anybody have an idea?
> ---
>  support/testing/tests/package/test_zfs.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/support/testing/tests/package/test_zfs.py
> b/support/testing/tests/package/test_zfs.py
> index 1b907ac4de..5c8fc58ac5 100644
> --- a/support/testing/tests/package/test_zfs.py
> +++ b/support/testing/tests/package/test_zfs.py
> @@ -74,9 +74,14 @@ class TestZfsGlibc(TestZfsBase):
>
>
>  class TestZfsUclibc(TestZfsBase):
> +    # This test uses uClibc bleeding edge toolchain, because it
> +    # selects python3 which needs time64 since 3.13. time64 support in
> +    # uclibc requires toolchain headers >=3D 5.1. The bleeding edge
> +    # toolchains are based on 5.15 headers, while the stable
> +    # toolchains are on 4.19.
>      config =3D TestZfsBase.config + \
>          """
> -        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE=3Dy
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_BLEEDING_EDGE=3Dy
>          """
>
>      def test_run(self):
> --
> 2.49.0
>
>

--000000000000734aa106347a49d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Julien,<br><br>First, thank you for your patch. It f=
ixes the ZFS test compilation issue correctly. :thumb_up:<br><div><br></div=
><div>Now, regarding the second issue; it seems that the python3 binary is =
somehow broken. If you try to run /usr/bin/python3, it will raise the same =
problem. I am currently debugging this binary.</div><br>Greetings.</div><br=
><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D=
"gmail_attr">El mar, 6 may 2025 a las 17:57, Julien Olivain (&lt;<a href=3D=
"mailto:ju.o@free.fr">ju.o@free.fr</a>&gt;) escribi=C3=B3:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Since commit [1] which bumped Py=
thon from 3.12.9 to 3.13.2, the runtime<br>
test tests.package.test_zfs.TestZfsUclibc is failing with the error:<br>
<br>
=C2=A0 =C2=A0 WARN: defconfig can&#39;t be used<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Missing: BR2_PACKAGE_PYTHON3=3Dy<br>
<br>
This is because Python 3.13 requires time64, and uclibc supports it only<br=
>
with toolchain headers &gt;=3D 5.1. The stable bootlin toolchain is based o=
n<br>
4.19 headers and is no longer sufficient.<br>
<br>
This commit fixes the issue by updating the defconfig of the runtime<br>
test, to use the bleeding-edge toolchain (which is based on 5.15<br>
headers).<br>
<br>
Fixes:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/9922591461" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/buildroot.org/buildro=
ot/-/jobs/9922591461</a><br>
<br>
[1] <a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/d63e207e=
b869063f82c867658676c2903beb08cb" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.com/buildroot.org/buildroot/-/commit/d63e207eb869063f82c86765867=
6c2903beb08cb</a><br>
<br>
Cc: Vincent Fazio &lt;<a href=3D"mailto:vfazio@xes-inc.com" target=3D"_blan=
k">vfazio@xes-inc.com</a>&gt;<br>
Signed-off-by: Julien Olivain &lt;<a href=3D"mailto:ju.o@free.fr" target=3D=
"_blank">ju.o@free.fr</a>&gt;<br>
---<br>
While testing this patch in<br>
<a href=3D"https://gitlab.com/jolivain/buildroot/-/jobs/9935681972" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/jolivain/buildroot/-/jobs/=
9935681972</a><br>
it appears that it does fix the initial build issue, but it also<br>
reveal a new runtime issue. The Python interpreter (from the<br>
arc_summary script) crashes with a message:<br>
<br>
=C2=A0 =C2=A0 Fatal Python error: _PyThreadState_Attach: non-NULL old threa=
d state<br>
=C2=A0 =C2=A0 Python runtime state: preinitialized<br>
=C2=A0 =C2=A0 Thread 0xSegmentation fault<br>
<br>
So even when applying this patch, the runtime test still fails (it<br>
just goes a bit farther). The issue now seems to be only related to<br>
python 3.13 and uclibc.<br>
<br>
Does anybody have an idea?<br>
---<br>
=C2=A0support/testing/tests/package/test_zfs.py | 7 ++++++-<br>
=C2=A01 file changed, 6 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/te=
sts/package/test_zfs.py<br>
index 1b907ac4de..5c8fc58ac5 100644<br>
--- a/support/testing/tests/package/test_zfs.py<br>
+++ b/support/testing/tests/package/test_zfs.py<br>
@@ -74,9 +74,14 @@ class TestZfsGlibc(TestZfsBase):<br>
<br>
<br>
=C2=A0class TestZfsUclibc(TestZfsBase):<br>
+=C2=A0 =C2=A0 # This test uses uClibc bleeding edge toolchain, because it<=
br>
+=C2=A0 =C2=A0 # selects python3 which needs time64 since 3.13. time64 supp=
ort in<br>
+=C2=A0 =C2=A0 # uclibc requires toolchain headers &gt;=3D 5.1. The bleedin=
g edge<br>
+=C2=A0 =C2=A0 # toolchains are based on 5.15 headers, while the stable<br>
+=C2=A0 =C2=A0 # toolchains are on 4.19.<br>
=C2=A0 =C2=A0 =C2=A0config =3D TestZfsBase.config + \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_=
STABLE=3Dy<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_=
BLEEDING_EDGE=3Dy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0def test_run(self):<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div>

--000000000000734aa106347a49d4--

--===============5390476594536003070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5390476594536003070==--
