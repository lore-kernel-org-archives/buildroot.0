Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFE8C55173
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 21:04:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACA744119E;
	Fri, 31 Jul 2026 21:04:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0RPLhbAo8Sm; Fri, 31 Jul 2026 21:04:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9581D411A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785531862;
	bh=VQPyyWMKa69D4RG+5HUF50sW1ZwbR/EpYjaulmIG820=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VmekQAPqNvMzaVx00jOUbxnfgpv4zutXYrPbAekBeJPQLUKz7GYxKxZ65gmQVKP3N
	 zfV2ER7fqENLMSk+pw3E7BYM7Refh6pU90O0yAhRZAbbOl5Gr1ybYJDnUjnj/nnkmH
	 7GsFTrDNHL9RH0RKO4opWsDp4wrLtf+IAs7pYvaUmrBvJjUPZen9ndDh9RNqBtfaUd
	 0CWiGuNTjytKSlsUtHsxLbyUjZQ7zwWoztsM/+tfJtkS9P+RIafBzQoBgiv0YC26Ut
	 bQr0OsivR2NVN12wXm/UJEbpCUk4nz1Xv8a0fCj/v3ifMJEoPz+Pqy2E9XZNQ+YyVH
	 yQnKDJgOPZzmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9581D411A4;
	Fri, 31 Jul 2026 21:04:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D995D3B6
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 21:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB5AE400F5
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 21:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sf_4rrw7glAU for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 21:04:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c36; helo=mail-oo1-xc36.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A53AD400E5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A53AD400E5
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A53AD400E5
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 21:04:19 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 006d021491bc7-6ab06473488so542967eaf.0
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 14:04:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785531858; cv=none;
 d=google.com; s=arc-20260327;
 b=fDXHN1MohmHFryaFRHDYzTjOR/YeIGo1ghndeQUTAb4fKyN6A9ZtwSBroj5upYOiVr
 5y3TAOTiR3Nja6XEUFkuwevTobUhNIJuYDLoeexPd/aD6ngNu5+Ww7QButp6DFgv9ubQ
 qcT4IMSJwCqJlHenL4ldOoLJfznhgTDnXrbRGhaMUJ5uFjI9ZZLs821P6a1yBI0otviP
 TjHzSS746bfSroKKocVosf3CpPrXcAZ3V8IXe41EETdyuUoXKdecxInCvQZ634/QU/i1
 817rZ84cWOGGWO0lY74wgHO+iCEWr5C6Zo0VuR+3fg8u6fEWiCyEIYlPNgJCl/3upxYR
 dR5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=YLZOzM/88xQVSPjhSSNasY3AjcZIxPPK7CI4YOV27/s=;
 fh=TKxH/BlR6DDbLFFhfoVOJe1wwQrqEGfVXGor/pmNoFQ=;
 b=qjK7y3yk6czWCeBMw0aw5MId6DJrRVYKPIgdr2D4P8DUfHr9sbOGGS9n86lGowVv1O
 PGi2oAWa07ISON8zyaypLYVP+NNxJpyPnAgYxlvXjvgdePlZokZDK5/RAaDqOGyPGHRG
 /RR6XiJ68FtAKnhkKwPvnTqeegyEWqGzZ1lQkr4sj3cKmO85NCTKWHU5ruQIZQU2HZ+L
 1y+z2ZB5q3jrHYWiyS0SPuwG3belKpRmDfJQWCxCONCKHWta1+w6aggWeX7vP4eUfBz1
 2IeUw8aSC3sIaXeYWct3DTla1e8dKp0CptWaSbII3AQHCtAZuAEJALx0nBuTYEd+4Q1g
 C5xA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785531858; x=1786136658;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=YLZOzM/88xQVSPjhSSNasY3AjcZIxPPK7CI4YOV27/s=;
 b=gbAxCk34qQSNU0whzY1xfC2tJ4H8yZ8hXLpLFHWEMuhfJ5+ZXeNyQ4EaY3PJCYMx+F
 JI32tslqTCV9NECOqRdgS/D/KR/FD4zwJmTs2Gj57KuOkNJFwpVKmI9BPXibNAVJ2fpi
 2gBV+ze2Usx9xU2HJoDP/scTXWLxYN4eccRzG4meFjx5AUNDlZALUJS3DAAkQ1lKtlB6
 H1LJzDnaMmrS3VwPtNxJ6STgmo79GrxU6godGOMI1eorGlu3IoHb29LHYFIVkzIofefZ
 A1Lh94aSUg21joa0ex7WdeweKYQ8Rm+lAX2yCeFSA9CPnyWZ2ckaXjyyrQnOfN8P4ow8
 4jGQ==
X-Gm-Message-State: AOJu0Yy0OCSBbDJP9cK6qrlpXbnOiMgLSrK+bGWysK441kBbZW1xQjmQ
 PRgI96upcP+hiAlnZG43ZQvkVLm5pYCmLfdmlBFKMlWEACVal/xrP+WKxoM7e81wfy2gBDkRUf4
 vxG0x5sXeG83hnGevMqbf36uLH/ERLDEpP6mgHQQ=
X-Gm-Gg: AR+sD11j+RayCTStxth7zl98Wu9RwtynhRvVyQYGlhgt+cEcwg+2qf2MZxdfQ+fL/vL
 BrbQbHS10k5t8/wcLF+MvQsT6LIiP+qMZLQN3Fypr/0DXKk0puiJVJekECPZOGns5yL4iQkr2+W
 bUD+TOYspZW5+4NVQspXtaPdix6l41Rg9eyHkpSQRaY8F2D/VGygpJ3kKX/rfIx9g/Fv5MCj1Ze
 T9uOPzD1Qomzx4QWRayOQu18uqZPUe7rSbx+QQ7N28qQp39oq4FXyEhslfbWgXfFJnZYAEEF0XC
 aRlngpGgmMNpZwPmr14feq51ClxUOAtWewBn2/sBJKpjAi/SwlXvtgQ=
X-Received: by 2002:a05:6820:f015:b0:6ae:4842:34b8 with SMTP id
 006d021491bc7-6ae484255f1mr636012eaf.32.1785531858390; Fri, 31 Jul 2026
 14:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <20260710133225.484041-1-aford173@gmail.com>
In-Reply-To: <20260710133225.484041-1-aford173@gmail.com>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 31 Jul 2026 16:04:07 -0500
X-Gm-Features: AUfX_my8EEZRf8sRSWcMTw75S5auBM79TOA9FNA_fjLs1DtW0fdvdaR4lM4FFjg
Message-ID: <CAHCN7xL4dgE=SPS5Y92eHi=q2MSk1gK4kotbsONTWeiPExaYbA@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785531858; x=1786136658; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=YLZOzM/88xQVSPjhSSNasY3AjcZIxPPK7CI4YOV27/s=;
 b=nKbGZpljT9ToQwwzuQ9KO4PfL70Kf4dPgnhk+Bj9ekY/TMNc1XYV1wAtxzZe/T1fmY
 qSwOIF8G82n4DQFG2y4fIz5NJeRXAjF1MLu39OQIR8nxBYbYXKTozvhoLO8m+DYnFmqu
 JTbvfuKGTlfOl8bIYMXD6nrBdmaBGi89sMfymeEKWMXEG0zO+urou04EEAwV4FC4slWT
 9JuLecg5gyCPksCHJykLzHgtrr9qGZ/PrsokkoSWGhl1Kg+z1LPEjqnN3Xl5CNjSA3xB
 r8Wbj3MbNsuu7gkRAAiehTCDl4dAZWKb4BSzQww+1U/nARJsjeC1tnB89jWSGBMLFlJO
 wfMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=nKbGZplj
Subject: Re: [Buildroot] [PATCH] package/mesa3d: add intel-virtio host
 native context config
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
Content-Type: multipart/mixed; boundary="===============8089078866546034587=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8089078866546034587==
Content-Type: multipart/alternative; boundary="0000000000002793dc0657ee8868"

--0000000000002793dc0657ee8868
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 8:32=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:

> Add BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL in the same
> pattern as amdgpu-virtio. When enabled, -Dintel-virtio-experimental=3Dtru=
e
> defines HAVE_INTEL_VIRTIO so the guest-side Intel native context
> (i915 and xe context types) is compiled in. This is the guest half
> of the Intel vDRM GPU passthrough path, usable by the crocus/iris
> (OpenGL) and ANV (Vulkan) drivers.
>
> Note that this is an experimental Mesa feature (the upstream meson
> option is named intel-virtio-experimental) and is disabled by default.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
>
>
Gentle nudge on this.

adam


> diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
> index e184039150..ad02b5e829 100644
> --- a/package/mesa3d/Config.in
> +++ b/package/mesa3d/Config.in
> @@ -130,6 +130,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
>         bool "Gallium crocus driver"
>         depends on BR2_i386 || BR2_x86_64
>         select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +       select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
>         help
>           Mesa driver for gen4-7 Intel GPUs.
>
> @@ -167,6 +168,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS
>         bool "Gallium iris driver"
>         depends on BR2_PACKAGE_MESA3D_LLVM
>         select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
> +       select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
>         select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>         select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
>         help
> @@ -393,6 +395,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
>         depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
>         depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
>         depends on BR2_PACKAGE_MESA3D_LLVM
> +       select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
>         select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
>         select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
>         help
> @@ -459,6 +462,22 @@ config
> BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO
>           Select this when running Mesa inside a virtual machine
>           with virtio-gpu host native context support.
>
> +config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL
> +       bool "intel-virtio"
> +       depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS || \
> +               BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS || \
> +               BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
> +       help
> +         Enable VirtIO support for Intel native contexts
> +         used by the crocus/iris (OpenGL) and ANV (Vulkan)
> +         drivers.
> +
> +         This is an experimental Mesa feature and is disabled
> +         by default.
> +
> +         Select this when running Mesa inside a virtual machine
> +         with virtio-gpu host native context support.
> +
>  config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER
>         bool
>
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index 8e6c2ee5b8..87377b7ce4 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -164,6 +164,12 @@ else
>  MESA3D_CONF_OPTS +=3D -Damdgpu-virtio=3Dfalse
>  endif
>
> +ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL),y)
> +MESA3D_CONF_OPTS +=3D -Dintel-virtio-experimental=3Dtrue
> +else
> +MESA3D_CONF_OPTS +=3D -Dintel-virtio-experimental=3Dfalse
> +endif
> +
>  ifneq
> ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)$(BR2_PACKAGE_MESA3D_VULKA=
N_DRIVER_FREEDRENO),)
>  MESA3D_FREEDRENO_KMDS =3D msm
>  ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)
> --
> 2.53.0
>
>

--0000000000002793dc0657ee8868
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 10,=
 2026 at 8:32=E2=80=AFAM Adam Ford &lt;<a href=3D"mailto:aford173@gmail.com=
">aford173@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Add BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL=
 in the same<br>
pattern as amdgpu-virtio. When enabled, -Dintel-virtio-experimental=3Dtrue<=
br>
defines HAVE_INTEL_VIRTIO so the guest-side Intel native context<br>
(i915 and xe context types) is compiled in. This is the guest half<br>
of the Intel vDRM GPU passthrough path, usable by the crocus/iris<br>
(OpenGL) and ANV (Vulkan) drivers.<br>
<br>
Note that this is an experimental Mesa feature (the upstream meson<br>
option is named intel-virtio-experimental) and is disabled by default.<br>
<br>
Signed-off-by: Adam Ford &lt;<a href=3D"mailto:aford173@gmail.com" target=
=3D"_blank">aford173@gmail.com</a>&gt;<br>
<br></blockquote><div><br></div><div>Gentle nudge on this.</div><div><br></=
div><div>adam</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in<br>
index e184039150..ad02b5e829 100644<br>
--- a/package/mesa3d/Config.in<br>
+++ b/package/mesa3d/Config.in<br>
@@ -130,6 +130,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Gallium crocus driver&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_i386 || BR2_x86_64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_S=
UPPORTED_DRIVER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mesa driver for gen4-7 Intel GPUs.<br>
<br>
@@ -167,6 +168,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_IRIS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Gallium iris driver&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_MESA3D_LLVM<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_S=
UPPORTED_DRIVER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILE=
R<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRI=
VER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
@@ -393,6 +395,7 @@ config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 =
# memfd.h<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, st=
atic_assert<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_MESA3D_LLVM<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_S=
UPPORTED_DRIVER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILE=
R<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_MESA3D_VULKAN_DRIVER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
@@ -459,6 +462,22 @@ config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_F=
REEDRENO<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Select this when running Mesa inside a v=
irtual machine<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with virtio-gpu host native context supp=
ort.<br>
<br>
+config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;intel-virtio&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CR=
OCUS || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_MESA3D_=
GALLIUM_DRIVER_IRIS || \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_MESA3D_=
VULKAN_DRIVER_INTEL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enable VirtIO support for Intel native c=
ontexts<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0used by the crocus/iris (OpenGL) and ANV=
 (Vulkan)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drivers.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This is an experimental Mesa feature and=
 is disabled<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0by default.<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Select this when running Mesa inside a v=
irtual machine<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with virtio-gpu host native context supp=
ort.<br>
+<br>
=C2=A0config BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_SUPPORTED_DRIVER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>
<br>
diff --git a/package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"noreferrer"=
 target=3D"_blank">mesa3d.mk</a> b/package/mesa3d/<a href=3D"http://mesa3d.=
mk" rel=3D"noreferrer" target=3D"_blank">mesa3d.mk</a><br>
index 8e6c2ee5b8..87377b7ce4 100644<br>
--- a/package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"noreferrer" target=
=3D"_blank">mesa3d.mk</a><br>
+++ b/package/mesa3d/<a href=3D"http://mesa3d.mk" rel=3D"noreferrer" target=
=3D"_blank">mesa3d.mk</a><br>
@@ -164,6 +164,12 @@ else<br>
=C2=A0MESA3D_CONF_OPTS +=3D -Damdgpu-virtio=3Dfalse<br>
=C2=A0endif<br>
<br>
+ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_INTEL),y)<br>
+MESA3D_CONF_OPTS +=3D -Dintel-virtio-experimental=3Dtrue<br>
+else<br>
+MESA3D_CONF_OPTS +=3D -Dintel-virtio-experimental=3Dfalse<br>
+endif<br>
+<br>
=C2=A0ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_FREEDRENO)$(BR2_PACKAGE_ME=
SA3D_VULKAN_DRIVER_FREEDRENO),)<br>
=C2=A0MESA3D_FREEDRENO_KMDS =3D msm<br>
=C2=A0ifeq ($(BR2_PACKAGE_MESA3D_HOST_NATIVE_CONTEXT_DRIVER_FREEDRENO),y)<b=
r>
-- <br>
2.53.0<br>
<br>
</blockquote></div></div>

--0000000000002793dc0657ee8868--

--===============8089078866546034587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8089078866546034587==--
