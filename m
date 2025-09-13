Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80678CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 17:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48D0C83FA7;
	Sat, 13 Sep 2025 17:42:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ag1y2Ygnqu-Z; Sat, 13 Sep 2025 17:42:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41E2183FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41E2183FA8;
	Sat, 13 Sep 2025 17:42:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 77A5812D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:42:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D07883FA9
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:42:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hh1hBYl7M9Nj for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 17:42:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3BAAB83FA7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BAAB83FA7
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BAAB83FA7
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 17:42:53 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-724b9ba77d5so29180047b3.3
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 10:42:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757785372; x=1758390172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9Si9FVBCW2oqKaZzC4vgQHmo7b+RUafLAVeAAEFby/A=;
 b=QCWN7//2EyHLErIbEF1A4LmT53SOXpaoD0ebMIjVwC8J/Sv9m/URT2JqSu4ZhZmjwM
 WNpWhM2akgRnJmOSJk931UWRIST+xCC7NtSgQQzFVmcJmNewJ/WHSDUtp3YjU0CCIm8K
 ebQlvmfeJFM0JblsPacqdbfiyXeHfU9tSdlsB+NnNs/OTLzbfI09mE+UnDL6ftccO4Ty
 MXT7G4OT4kwZ4t38IL4y6qzr9WYahFTBPs0yuCzYwgW+44orCI4AtjSBrctV2KvIrwXG
 2tHo36DNaN8Hfyi7PPc+rw4+lTEnXShsvtOQqyIJ3urABM1Gtoc7DHtspJv/tksMzcqI
 GPyg==
X-Gm-Message-State: AOJu0YxMMWNo1hKr9FQkQjn3HQVxDvwuv1v/8Gh2lvpLer609UNEUkzC
 doO/tEj9UT9AyuyBHeGmhaDcbBTQGqWapEHRxYBgyB1DTWWO/FsIuUiQNzXygPkdFQJ4aUoieC4
 OutGJdI0kCBj/ui3p+5hKj8Eqb5oKvssW9Q==
X-Gm-Gg: ASbGncum6oli0u1liNn2cSBMQg2GmUH2dTdxC4ZCR+hcC02lpbvMMoKDVWNvmZec2Gr
 kwQU576SN4tMh4B0zTHWIqc1DSJGcOGrvy4dN9WQbK20t8sy/xvjV1bJANx33r3VUzmUx4X8Q6v
 AcLX3EyB+tpwnPGhDmEzaeXuHOG4U+hxGm0gWnCnd0M7bbNggeARBJJjChrKDhh46f3uploO73h
 5eU0to=
X-Google-Smtp-Source: AGHT+IEtIwifIIjqwgkoNKnFZuvZFzyqwTg9Xa74rbHin7bMCg/X26bTPEavm90zitqMkJGeAsxkRqeB/V4vE1KZcg0=
X-Received: by 2002:a05:690c:724a:b0:723:c010:c3ac with SMTP id
 00721157ae682-730652dd1eamr67781957b3.29.1757785371713; Sat, 13 Sep 2025
 10:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250913173311.2624001-1-romain.naour@smile.fr>
In-Reply-To: <20250913173311.2624001-1-romain.naour@smile.fr>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sat, 13 Sep 2025 19:42:40 +0200
X-Gm-Features: AS18NWAQcxS6bMndpkdZyQf_Pmk4dzwg2J1WMN-qnjyPcjxE6eH9YhubXRH0ZMI
Message-ID: <CAH+XeQbB0dt4w35qafBkrSd62xXTr7VB_-BW5oeg9PoxN_-XDA@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757785372; x=1758390172; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9Si9FVBCW2oqKaZzC4vgQHmo7b+RUafLAVeAAEFby/A=;
 b=m5CuCAHr4e14mSq+g6iVV88jcPVrJIzqSfJS3//1D/Hg4XncOliB8qr2qCKeH+XjW0
 Qh6SPjeI7C2IHQh+pk4cHpx3JSqWtCMTjfK7klTgJE/i1wYocpf3ECszJ73O72WCIuHk
 82PhdRN76e5AfcIMof641Mh1lblWF0dl1YFge13Af+C4OcHmKWDE5GyEp8OwOJLO78Ul
 kywUTsdTNARSceQyjnPEn4pIomHlcGpb0sz1wRRIsGOSbQuwNu7Ulj42JrUZHXNVYhRj
 YWAcfhNZHW5I8wtL3MMdpjEeGWPne/UJUfjTu7uqfujnLvW4MmVeCCOpZW8hYd7cqkvd
 qagw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=m5CuCAHr
Subject: Re: [Buildroot] [PATCH 1/2] support/testing: remove TestZfsUclibc
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
Cc: Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4730995055776638935=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4730995055776638935==
Content-Type: multipart/alternative; boundary="000000000000ac2574063eb24cf1"

--000000000000ac2574063eb24cf1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I would rather remove the Python command that checks the ARC stats than
remove the uClibc test entirely, as I have used it numerous times to check
future ZFS versions and to ensure that OpenZFS compiles correctly with
uClibc.

Greetings.

El s=C3=A1b, 13 sept 2025, 19:33, Romain Naour <romain.naour@smile.fr> escr=
ibi=C3=B3:

> As reported on the mailing list [1] while investigating the
> TestZfsUclibc Gitlab-CI failure, the python 3.13 interpreter itsef
> segfault at runtime:
>
>   Fatal Python error: _PyThreadState_Attach: non-NULL old thread state
>   Python runtime state: preinitialized
>   Thread 0xSegmentation fault
>
> This issue is related to the python 3.13 version bump [2] were several
> internal changes were added [3] to support PEP 703 [4].
> PEP 793 is about CPython=E2=80=99s global interpreter lock (=E2=80=9CGIL=
=E2=80=9D) removal
> for multi-threads support that requires a working C11 "thread_local"
> for thread-local storage [5].
>
> Remove TestZfsUclibc since this issue is not related to ZFS and since
> we are going to disable python3 package for aarch64 uClibc-ng
> toolchains.
>
> Keeping TestZfsUclibc is possible by using another architecture than
> aarch64. But it requires to update TestZfsBase.
>
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124859
> (TestZfsUclibc)
>
> [1]
> https://lore.kernel.org/buildroot/7a4d245d-1556-43c9-8997-6b1f791afbfe@gm=
ail.com/
> (TestZfsUclibc)
> [2] d63e207eb869063f82c867658676c2903beb08cb
> [3]
> https://github.com/python/cpython/commit/6e97a9647ae028facb392d12fc249735=
03693bd6
> [4] https://peps.python.org/pep-0703/
> [5] https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Thread-Local.html
>
> Cc: Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.com>
> Cc: Waldemar Brodkorb <wbx@openadk.org>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> ---
>  support/testing/tests/package/test_zfs.py | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/support/testing/tests/package/test_zfs.py
> b/support/testing/tests/package/test_zfs.py
> index 1b907ac4de..3833838e3a 100644
> --- a/support/testing/tests/package/test_zfs.py
> +++ b/support/testing/tests/package/test_zfs.py
> @@ -73,16 +73,6 @@ class TestZfsGlibc(TestZfsBase):
>          TestZfsBase.base_test_run(self)
>
>
> -class TestZfsUclibc(TestZfsBase):
> -    config =3D TestZfsBase.config + \
> -        """
> -        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_STABLE=3Dy
> -        """
> -
> -    def test_run(self):
> -        TestZfsBase.base_test_run(self)
> -
> -
>  class TestZfsMusl(TestZfsBase):
>      config =3D TestZfsBase.config + \
>          """
> --
> 2.51.0
>
>

--000000000000ac2574063eb24cf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hello all,<div dir=3D"auto"><br></div><div dir=3D"au=
to">I would rather remove the Python command that checks the ARC stats than=
 remove the uClibc test entirely, as I have used it numerous times to check=
 future ZFS versions and to ensure that OpenZFS compiles correctly with uCl=
ibc.</div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Greetings.<br=
><br><div class=3D"gmail_quote gmail_quote_container" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">El s=C3=A1b, 13 sept 2025, 19:33, Romain Naou=
r &lt;<a href=3D"mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt=
; escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>As reported on the mailing list [1] while investigating the<br>
TestZfsUclibc Gitlab-CI failure, the python 3.13 interpreter itsef<br>
segfault at runtime:<br>
<br>
=C2=A0 Fatal Python error: _PyThreadState_Attach: non-NULL old thread state=
<br>
=C2=A0 Python runtime state: preinitialized<br>
=C2=A0 Thread 0xSegmentation fault<br>
<br>
This issue is related to the python 3.13 version bump=C2=A0[2] were several=
<br>
internal changes were added [3] to support PEP 703 [4].<br>
PEP 793 is about CPython=E2=80=99s global interpreter lock (=E2=80=9CGIL=E2=
=80=9D) removal<br>
for multi-threads support that requires a working C11 &quot;thread_local&qu=
ot;<br>
for thread-local storage [5].<br>
<br>
Remove TestZfsUclibc since this issue is not related to ZFS and since<br>
we are going to disable python3 package for aarch64 uClibc-ng<br>
toolchains.<br>
<br>
Keeping TestZfsUclibc is possible by using another architecture than<br>
aarch64. But it requires to update TestZfsBase.<br>
<br>
Fixes:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/jobs/11271124859" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/buildroot=
.org/buildroot/-/jobs/11271124859</a> (TestZfsUclibc)<br>
<br>
[1] <a href=3D"https://lore.kernel.org/buildroot/7a4d245d-1556-43c9-8997-6b=
1f791afbfe@gmail.com/" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://lore.kernel.org/buildroot/7a4d245d-1556-43c9-8997-6b1f791afbfe@gmail.co=
m/</a> (TestZfsUclibc)<br>
[2] d63e207eb869063f82c867658676c2903beb08cb<br>
[3] <a href=3D"https://github.com/python/cpython/commit/6e97a9647ae028facb3=
92d12fc24973503693bd6" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/python/cpython/commit/6e97a9647ae028facb392d12fc24973503693b=
d6</a><br>
[4] <a href=3D"https://peps.python.org/pep-0703/" rel=3D"noreferrer norefer=
rer" target=3D"_blank">https://peps.python.org/pep-0703/</a><br>
[5] <a href=3D"https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Thread-Local.h=
tml" rel=3D"noreferrer noreferrer" target=3D"_blank">https://gcc.gnu.org/on=
linedocs/gcc-15.1.0/gcc/Thread-Local.html</a><br>
<br>
Cc: Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salvador.joseluis@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">salvador.joseluis@gmail.com</=
a>&gt;<br>
Cc: Waldemar Brodkorb &lt;<a href=3D"mailto:wbx@openadk.org" target=3D"_bla=
nk" rel=3D"noreferrer">wbx@openadk.org</a>&gt;<br>
Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@smile.fr" ta=
rget=3D"_blank" rel=3D"noreferrer">romain.naour@smile.fr</a>&gt;<br>
---<br>
=C2=A0support/testing/tests/package/test_zfs.py | 10 ----------<br>
=C2=A01 file changed, 10 deletions(-)<br>
<br>
diff --git a/support/testing/tests/package/test_zfs.py b/support/testing/te=
sts/package/test_zfs.py<br>
index 1b907ac4de..3833838e3a 100644<br>
--- a/support/testing/tests/package/test_zfs.py<br>
+++ b/support/testing/tests/package/test_zfs.py<br>
@@ -73,16 +73,6 @@ class TestZfsGlibc(TestZfsBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TestZfsBase.base_test_run(self)<br>
<br>
<br>
-class TestZfsUclibc(TestZfsBase):<br>
-=C2=A0 =C2=A0 config =3D TestZfsBase.config + \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_UCLIBC_=
STABLE=3Dy<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
-<br>
-=C2=A0 =C2=A0 def test_run(self):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 TestZfsBase.base_test_run(self)<br>
-<br>
-<br>
=C2=A0class TestZfsMusl(TestZfsBase):<br>
=C2=A0 =C2=A0 =C2=A0config =3D TestZfsBase.config + \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
-- <br>
2.51.0<br>
<br>
</blockquote></div></div></div>

--000000000000ac2574063eb24cf1--

--===============4730995055776638935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4730995055776638935==--
