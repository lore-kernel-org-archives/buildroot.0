Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 425BDE63C8E
	for <buildroot@archiver.kernel.org>; Sun, 25 Jan 2026 12:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DFB82EB4;
	Sun, 25 Jan 2026 12:32:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZwstdqSqi4XC; Sun, 25 Jan 2026 12:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E479B82E14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769344360;
	bh=47uIYRxxZ/N32KvLBsGpZuVovRPsA/SI9WEsP8t7N9U=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UX8uZFuRc4Wy5x6EesqP/2WYEsr1eS7H0+uoIvAgal+9lhN2/j8VMKsb3Ji7i3Gis
	 kl3BZzAhs5kOMSZCnrmA+4CvesovmmkViiPUe4uYm4f/TYXC9U9ICdXT3UoeYmdAev
	 aLCqmxcgJkWABfUWmchfQhMOqftANzQ3Z5vKNbDiVl5Ciknf5TDLnOF0+peG/yyfuW
	 ZFAixOqeIKpWBfmipGt8KOFo+qiGk3yl8VNoHtlJB+zdeX8iue7MaQ3lMLUT46iZkJ
	 fFpdjCGGrhCClU+XWqXFqv1QtZJ+z9Rk0MRFUbBR7Dt5J7F0V8ZPOwZfAJt+c+zbAl
	 EYR1sV+zenrzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E479B82E14;
	Sun, 25 Jan 2026 12:32:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8065111B
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 619FD4090C
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRwOMYNJLeio for <buildroot@buildroot.org>;
 Sun, 25 Jan 2026 12:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=michael@michaelcullen.name; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 05051408DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05051408DE
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 05051408DE
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 12:32:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-59b6f267721so3380112e87.2
 for <buildroot@buildroot.org>; Sun, 25 Jan 2026 04:32:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769344354; cv=none;
 d=google.com; s=arc-20240605;
 b=K18nu2mAQSjGR53xfmViFcmG10QdAvAS14dFfM14AGCBBnK/PyBp+Xgv/t/dKu6Ej+
 Cbs3ifvewUQS8UzrVjNILjXnZg6GqARYBF3BQo+L6was/dTbw/Q9Sfx130PD82a3vAX1
 F/5uo3n0C6hD42/R4ZqMbG3LV+7tyUI7xk2J+qeZPffHF6tGexOOuYEGdkVpWvv960/C
 VUydBB9cztPxHgr0lDkUBlJIptXijbkqxU0gUBJpGS1YY3pIbDBJNrSoptJj/nCetsE0
 wIVmaNHo5pnCCle3w9nJ7m09pGWryKwzZ+yRVWM2Y5OyAIdXh49zV1eyYLDQKMGPCzfi
 kRmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=NlAhx0sB3GdYw8E7LQSs8Bh1zsWTFq6bpgvvG2WMpTA=;
 fh=Y987ymzdQodEpuwJwoUCVOp290ZhPaFjdRQ79rj8o84=;
 b=HsMGqLk32rBk/toMzUEnWH7qqXEWrXEs74Xizq1egusdmgeBIORLPv8nX5EssD6giP
 AFQfXsDihEMIXqOW7ARoxJwbeWSHkM83Ir4p9gZyR3u40jWDmqERVvISoeSCo4sKqDVC
 mNJde8k0zUMPXPV4ul5M4zfHv4hm3Cysc2PcjltjLph7jpqFqEPmUUp5FDm7H6jiYmqI
 jpR14jTjRDQkOQCOlljbY//r6YwDYj3a8d7RLiG08pr5vUJ7HZVxK9JtAStaL4uelJvj
 Vlif45z5la4sKqwCwurvgcbkMNHVz972jEaFdyQsoyt27H6C4cpVtqvp5khLk2pa3T3W
 cqHw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769344354; x=1769949154;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlAhx0sB3GdYw8E7LQSs8Bh1zsWTFq6bpgvvG2WMpTA=;
 b=rmdt90eXjb4e8eA8zqdkFTqpLIrYZiIQcN3T1HomOVthQz4Ssv4epdWi0ABme/q9ME
 814g1gjbTkGsrvCtsx2y+DCHveo0EhdAbz4ZipBkD+KQHW1SxLJpd/1izVi85f9XziES
 /Hf2jqHFQX57if0L7fg7lTtZHc13ISJZMj92MEdeKVmB3rH+drvXE0Tpfd0vMQKSeL2i
 FXrKxjxkkO3LPFd2vBgP+CEhZGX+RpU1Zik3rZHLJOOasdPT7h7r8QDuu5UZJQDXyWWL
 3lSiaK6DpDQZPKX1+D1As1hJR9cjrbZ/Vx6d4yr/bEylnUOphIs/x50D8FoFVbCbWzWh
 R5UQ==
X-Gm-Message-State: AOJu0YxV8a3ZtGOaOHjEXy9CIUTHRZVekZQa63zyNNwdMQPXXZiAR8yW
 F7xmipX3JhkVt3V5EuzPpgVYfkKXrrtyuahBPu0BkT54+gFc3fZF9JyzW8zgvcEIQmPwkbPhNi/
 Ivp5uefPjMnhQ3GjcRbBDfp7kHAcnd27wDucl0QtItDzBl+tBSDhKiw==
X-Gm-Gg: AZuq6aLZnO4STAGFIri4UhHUlZ5a5FkXTVO68ed+4qZC1/hHFnL60hwJ6Jt4TONsGhO
 bsMoerajR2SV9yrR973WHRVUy/7zBcTVQ23igjGSiLY1rk/z4a20aBjE79pk0S4HUS+dJ5rLSbL
 C6cO0AlRjCVD3WtKwA7lcXqo2BmqGy8oGriwfZK6+uLAybFRB5bgsn2E0kM68M9+NFsGYeveuVw
 yJ9vFRv8f1EoLx222X/EdJaDpoPXwgMqMtyy1EgSgKZSjggnFYsb3kGQc/YI1hNQB6D8pSeCrmx
 5Vpe21gY8czdf6jrkoGxhedVdToGKfkqVKFIApHbliiiQ0mf/0CjaA8Ohg==
X-Received: by 2002:a05:6512:114a:b0:598:faf0:66e7 with SMTP id
 2adb3069b0e04-59df390daa4mr529251e87.26.1769344353871; Sun, 25 Jan 2026
 04:32:33 -0800 (PST)
MIME-Version: 1.0
References: <20260125104501.433268-1-bernd@kuhls.net>
In-Reply-To: <20260125104501.433268-1-bernd@kuhls.net>
Date: Sun, 25 Jan 2026 13:32:22 +0100
X-Gm-Features: AZwV_QhaQMid7a2pih5P3b1E3-vncW83PCZJDGGlc2gyT2Ylm98fWhhpuQ2Yjog
Message-ID: <CAAqDjMGegHP7L4pU2Oq7CkgvQMy5H2KppGdfVr3pOXGhODo51g@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=michaelcullen.name; s=google; t=1769344354; x=1769949154; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NlAhx0sB3GdYw8E7LQSs8Bh1zsWTFq6bpgvvG2WMpTA=;
 b=PGh8WFmLLTcDKMcf7et0J6fCO1B/DgJeT1K7y9ZReG6I7BPOWW9arhZ8i0Xh1mEcxh
 txPy1ygIiyjRCT9xMFnBWXdJMSYe0VzWmYoX5VhDUD3vkpfS+HNEUuMFzlTnfNl0M5VW
 A/zUJ35LsR0Kt2YbJS7FVX3LvkG0tqOf+vsUx2xSxVmxngK6M5WNPLzZk72Jnp7GW8b3
 DNG727uQIA7K9H45w3ez4eUkJg8aZggQcnXvNyfiDzsv6lL1qdyYWBlGUy2Au6Mn4TAa
 W3cPflqdjDW0tVfernnaLHOeM81FGYh3Y3C8HmUAI0jXRwwi2VUCCIXql7Ia1M6Q5iBu
 lJkg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=michaelcullen.name
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=michaelcullen.name
 header.i=@michaelcullen.name header.a=rsa-sha256 header.s=google
 header.b=PGh8WFmL
Subject: Re: [Buildroot] [PATCH 1/1] package/netdata: needs C++
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
From: Michael Cullen via buildroot <buildroot@buildroot.org>
Reply-To: Michael Cullen <michael@michaelcullen.name>
Content-Type: multipart/mixed; boundary="===============3439705522680533616=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3439705522680533616==
Content-Type: multipart/alternative; boundary="000000000000b2b4ac06493595aa"

--000000000000b2b4ac06493595aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Looks sensible to me!

On Sun, Jan 25, 2026 at 11:45=E2=80=AFAM Bernd Kuhls <bernd@kuhls.net> wrot=
e:

> Buildroot commit 9cfcd906cff299ef83b48681e50bcef9df124ad4 bumped the
> package from 1.33.1 to 1.37.1. Upstream changed the optional C++ support
> into a mandatory dependency with commit
>
> https://github.com/netdata/netdata/commit/b6d2a3662dfb683e9e95203ef3b21f8=
e31238b06
> added to version 1.35.0 causing build errors with toolchains without
> C++ support:
>
>   GEN      netdatacli
> /bin/sh: line 1: no: command not found
> make[3]: *** [Makefile:5502: netdatacli] Error 127
>
> Fixes:
>
> https://autobuild.buildroot.org/results/7084a73d5727a86ca55eda3d1f01ea4d5=
b8ecf65/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>
Reviewed-by: Michael Cullen <michael@michaelcullen.name>

> ---
>  package/netdata/Config.in                     | 10 +++++-----
>  support/testing/tests/package/test_netdata.py |  1 +
>  2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/package/netdata/Config.in b/package/netdata/Config.in
> index 3603eb071c..527d4d39af 100644
> --- a/package/netdata/Config.in
> +++ b/package/netdata/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_NETDATA
>         bool "netdata"
>         depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +       depends on BR2_INSTALL_LIBSTDCPP
>         depends on BR2_USE_MMU # fork()
>         depends on !BR2_STATIC_LIBS # libuv
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
> @@ -22,22 +23,21 @@ if BR2_PACKAGE_NETDATA
>  config BR2_PACKAGE_NETDATA_PROMETHEUS
>         bool "prometheus remote write backend"
>         depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -       depends on BR2_INSTALL_LIBSTDCPP # protobuf, snappy
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
>         select BR2_PACKAGE_PROTOBUF
>         select BR2_PACKAGE_SNAPPY
>         help
>           Enable prometheus remote write backend
>
> -comment "prometheus remote write backend needs a toolchain w/ C++, gcc >=
=3D
> 8"
> -       depends on !BR2_INSTALL_LIBSTDCPP || \
> -               !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +comment "prometheus remote write backend needs a toolchain w/ gcc >=3D 8=
"
> +       depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
>         depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>
>  endif
>
> -comment "netdata needs a toolchain w/ NPTL, dynamic library, gcc >=3D 4.=
9"
> +comment "netdata needs a toolchain w/ C++, NPTL, dynamic library, gcc >=
=3D
> 4.9"
>         depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
> +               || !BR2_INSTALL_LIBSTDCPP \
>                 || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>         depends on BR2_USE_MMU
>         depends on BR2_TOOLCHAIN_HAS_SYNC_4
> diff --git a/support/testing/tests/package/test_netdata.py
> b/support/testing/tests/package/test_netdata.py
> index 6b616398d3..42bcbcdc6f 100644
> --- a/support/testing/tests/package/test_netdata.py
> +++ b/support/testing/tests/package/test_netdata.py
> @@ -6,6 +6,7 @@ import infra.basetest
>  class TestNetdata(infra.basetest.BRTest):
>      config =3D infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
>          """
> +        BR2_INSTALL_LIBSTDCPP=3Dy
>          BR2_PACKAGE_NETDATA=3Dy
>          BR2_TARGET_ROOTFS_CPIO=3Dy
>          # BR2_TARGET_ROOTFS_TAR is not set
> --
> 2.47.3
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000b2b4ac06493595aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Looks sensible to me!</div><br><div class=3D"gmail_qu=
ote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Ja=
n 25, 2026 at 11:45=E2=80=AFAM Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhl=
s.net">bernd@kuhls.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Buildroot commit 9cfcd906cff299ef83b48681e50bcef9df12=
4ad4 bumped the<br>
package from 1.33.1 to 1.37.1. Upstream changed the optional C++ support<br=
>
into a mandatory dependency with commit<br>
<a href=3D"https://github.com/netdata/netdata/commit/b6d2a3662dfb683e9e9520=
3ef3b21f8e31238b06" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/netdata/netdata/commit/b6d2a3662dfb683e9e95203ef3b21f8e31238b06</a><br>
added to version 1.35.0 causing build errors with toolchains without<br>
C++ support:<br>
<br>
=C2=A0 GEN=C2=A0 =C2=A0 =C2=A0 netdatacli<br>
/bin/sh: line 1: no: command not found<br>
make[3]: *** [Makefile:5502: netdatacli] Error 127<br>
<br>
Fixes:<br>
<a href=3D"https://autobuild.buildroot.org/results/7084a73d5727a86ca55eda3d=
1f01ea4d5b8ecf65/" rel=3D"noreferrer" target=3D"_blank">https://autobuild.b=
uildroot.org/results/7084a73d5727a86ca55eda3d1f01ea4d5b8ecf65/</a><br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank">bernd@kuhls.net</a>&gt;<br></blockquote><div><span class=3D"gmail-=
term">Reviewed-by: Michael Cullen &lt;<a href=3D"mailto:michael@michaelcull=
en.name">michael@michaelcullen.name</a>&gt;</span>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0package/netdata/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
=C2=A0support/testing/tests/package/test_netdata.py |=C2=A0 1 +<br>
=C2=A02 files changed, 6 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/package/netdata/Config.in b/package/netdata/Config.in<br>
index 3603eb071c..527d4d39af 100644<br>
--- a/package/netdata/Config.in<br>
+++ b/package/netdata/Config.in<br>
@@ -1,6 +1,7 @@<br>
=C2=A0config BR2_PACKAGE_NETDATA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;netdata&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU # fork()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_STATIC_LIBS # libuv<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv<br>
@@ -22,22 +23,21 @@ if BR2_PACKAGE_NETDATA<br>
=C2=A0config BR2_PACKAGE_NETDATA_PROMETHEUS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;prometheus remote write backend&quot=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_INSTALL_LIBSTDCPP # protobuf, sn=
appy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # proto=
buf<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PROTOBUF<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_SNAPPY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable prometheus remote write backend<b=
r>
<br>
-comment &quot;prometheus remote write backend needs a toolchain w/ C++, gc=
c &gt;=3D 8&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_INSTALL_LIBSTDCPP || \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_TOOLCHAIN_GCC_=
AT_LEAST_8<br>
+comment &quot;prometheus remote write backend needs a toolchain w/ gcc &gt=
;=3D 8&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS<b=
r>
<br>
=C2=A0endif<br>
<br>
-comment &quot;netdata needs a toolchain w/ NPTL, dynamic library, gcc &gt;=
=3D 4.9&quot;<br>
+comment &quot;netdata needs a toolchain w/ C++, NPTL, dynamic library, gcc=
 &gt;=3D 4.9&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || B=
R2_STATIC_LIBS \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| !BR2_INSTALL_LIB=
STDCPP \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 || !BR2_TOOLCHAIN_G=
CC_AT_LEAST_4_9<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_SYNC_4<br>
diff --git a/support/testing/tests/package/test_netdata.py b/support/testin=
g/tests/package/test_netdata.py<br>
index 6b616398d3..42bcbcdc6f 100644<br>
--- a/support/testing/tests/package/test_netdata.py<br>
+++ b/support/testing/tests/package/test_netdata.py<br>
@@ -6,6 +6,7 @@ import infra.basetest<br>
=C2=A0class TestNetdata(infra.basetest.BRTest):<br>
=C2=A0 =C2=A0 =C2=A0config =3D infra.basetest.BASIC_TOOLCHAIN_CONFIG + \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 BR2_INSTALL_LIBSTDCPP=3Dy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_NETDATA=3Dy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_TARGET_ROOTFS_CPIO=3Dy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# BR2_TARGET_ROOTFS_TAR is not set<br>
-- <br>
2.47.3<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000b2b4ac06493595aa--

--===============3439705522680533616==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3439705522680533616==--
