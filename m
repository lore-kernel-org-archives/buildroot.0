Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E13CE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 18:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F315C610C5;
	Wed, 11 Dec 2024 18:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6oCEyNdZ6-2j; Wed, 11 Dec 2024 18:26:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7059610C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7059610C4;
	Wed, 11 Dec 2024 18:26:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 360F4ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 18:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C108610C2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 18:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2_uDBuFNK0sK for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 18:26:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com;
 envelope-from=judge.packham@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C732E60E92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C732E60E92
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C732E60E92
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 18:26:13 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-6eff5ad69a1so41522217b3.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 10:26:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733941572; x=1734546372;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yK7YYG1G1m3tlrAMx5vfO5RhQEvz7u1q9LnZ//eE3Mc=;
 b=h5Gb/hw1r09c/GQnGIjQKfM8ZKMYpErJ9nQ5nKNnNi0OLMlY2HgL+Vby2VlECIBgiz
 dGfvMJ9j0zb7DX5i2uUbdOfNGQ4oBNePWNaxA0hJMOYnsd2tjIOpIFjAutW5Cj2QP4dm
 Yiu05id7MQ4UDFRBOL0vxUMMwcgp03zkpTo21ruaOHxZauQoIJjwgaJ6ciQJTqAJiWkI
 W7z5sAf7cn2frxTD26BfnHuj8TyWanIT4nc2mWZn9DMrbbIEw5JKM8jRZBOkUncpyZ8B
 S/QKv5pSNwbNzFPEQHb2qvoIXeIs52hjMIhrpUEz1Yehi1qhHNoagl0M17xg1klpU1gh
 pRyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPvq69UbjHGOA6xdYWJ76SE/2NOhiRNf3yZ7d5VPpSiaBlUrpWT0XBcD6IzWmElBnag48EBjfFrUg=@buildroot.org
X-Gm-Message-State: AOJu0YyUFvuvnF+bRo+KN2RIrQBcvXNrggKpO8ghR7Zt4P1IB53bct25
 E71SpVQGQBo/5Rdd5MWqs7ngi2Ka2HSXEvPHGzg4ZLgdNzCf9yCVeaMRwtaaHhdl094nfjMUkhW
 uN4JnmKrO0/IvYjnU7REyXx5HqMdhgBsD
X-Gm-Gg: ASbGnctgcNn1v7T4Gv2SWIGoPbnacCcOykDNZBT47Lb7GfqfpQ1S5B+jLBiMPZOT8tf
 rlS5x6rxDo/Fj8XlXfCfPegE65Yz2sUixADE=
X-Google-Smtp-Source: AGHT+IFfl4vp1HqWr7oUIvPLx0rBVTH9nsc+E1o+gAJmHc1pfq13AypIIpun5YqLL61PxHmymfGcfxK7EuKQUO9jAqc=
X-Received: by 2002:a05:690c:6f81:b0:6ef:5ca3:d0d9 with SMTP id
 00721157ae682-6f19e50018fmr5925157b3.20.1733941572557; Wed, 11 Dec 2024
 10:26:12 -0800 (PST)
MIME-Version: 1.0
References: <20241208214748.524923-1-geomatsi@gmail.com>
 <dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr>
 <Z1in3yM7ddVMYEqq@curiosity>
 <dcfe20ba-9a00-4faf-9cd8-9e800c566d12@grenoble.cnrs.fr>
In-Reply-To: <dcfe20ba-9a00-4faf-9cd8-9e800c566d12@grenoble.cnrs.fr>
From: Chris Packham <judge.packham@gmail.com>
Date: Thu, 12 Dec 2024 07:26:01 +1300
Message-ID: <CAFOYHZA3VydNyr+NffezqjmZkwo+zJyB8FZRMtnMBG8SNZvN9Q@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733941572; x=1734546372; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yK7YYG1G1m3tlrAMx5vfO5RhQEvz7u1q9LnZ//eE3Mc=;
 b=el+uyC0EifSVuo5OrmG0gyeNaIrA+VUBa1N7fDv4IqsKpt+fSuR/mMVBH5mi0B5ySy
 FdJtdSo8YQVi/ElRD+RENVf2x+8raLZL4h6FtCJD3cG7cnPFiJYbd65Vv1Vpa/N90LX8
 6AT9GC+q/QKxNdvV3Alg/MO+Q7YA4vrXivtrXvwQMzpzJAUclNpt9aPbpXH6F1BmKDly
 SRwKpr5wtPcSU8/INQ5azRVwQT8OdqVv9XIYuIioWcriPc7fUnDBsy9Mu3awm0633fNX
 iMb25pJRyW+PEN70wM1B/XrGR/QWRAJiS+pPr+qpg4IGQ+eA+XkMngMPmSxzYw6jQ3o0
 X6og==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=el+uyC0E
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
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
Content-Type: multipart/mixed; boundary="===============2261958658453198939=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2261958658453198939==
Content-Type: multipart/alternative; boundary="0000000000007e6344062902bbda"

--0000000000007e6344062902bbda
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 12 Dec 2024, 12:34=E2=80=AFam Edgar Bonet, <bonet@grenoble.cnrs.fr>=
 wrote:

> Hello!
>
> About the incompatibility between Linux 6.12 and
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH, Sergey Matyukevich wrote:
> > IIUC at the moment Buildroot includes the following configurations
> > that make use of BR2_LINUX_KERNEL_CUSTOM_DTS_PATH: [only 5 of them]
>
> Oh, I hadn't noticed there were so few of them!
>
> > Adding new v6.12 kernel is not going to break any of those boards
> > right away. However if the build rule for drop-in dtbs will not be
> > re-enabled (which seems likely), migration to new kernels will be a
> > problem for those boards.
>
> Indeed, this is my concern: I maintain the defconfigs of the Acqua
> boards (acmesystems_acqua_a5_*), and I would like to upgrade them to
> Linux 6.12 before the Buildroot 2025.02 release.
>
> However, this issue will also affect users that build (or customize)
> their own configurations with `make nconfig` or similar. If they select
>
>     [x] Linux Kernel
>     [x] Build a Device Tree Blob (DTB)
>     (some_file) Out-of-tree Device Tree Source file paths
>
> and leave `Kernel version' to its default (which is "Latest version"),
> they would end up with a non-functional configuration.
>
> > I don't see how BR2_LINUX_KERNEL_CUSTOM_DTS_PATH can be supported in
> > this case w/o patching new kernels. Probably it makes sense to convert
> > those out-of-tree dts files into proper kernel patches ?
>
> I see two options for patching the kernel:
>
>  1. Use Chris Packham's patch "kbuild: Restore the ability to build out
>     of tree dtbs".[1] This works for me: if I drop the patch into
>     board/acmesystems/acqua-a5/patches/linux/, I can change the kernel
>     version to 6.12.4 and it just works. It seems like the path of least
>     resistance for individual defconfigs, but I don't see this becoming
>     Buildroot's blessed way of supporting custom DTSes.
>
>  2. Create a patch that adds the DTS to the kernel tree _and_ the DTB
>     target to the relevant Makefile. I guess this is what you are
>     suggesting.
>

For what it's worth I implemented Masahiro's suggestion (basically option
2) for our internal build tool at $dayjob. It's just a bit of sed-ing. It
works reasonably well. The trickiest part is avoiding repatching the
Makefile but for buildroot that's just a flag file.


> If we go for the second option, then we would be saying that a kernel
> patch is the canonical way of providing a custom DTS. The
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH option would then have to be deprecated
> and eventually removed, which would be a breaking change for some users.
>
> I would persoanlly prefer updating the implementation of
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in order to make it compatible with
> 6.12+ kernels. Maybe Buildroot could, in addition to copying the DTS to
> the kernel tree, add the relevant target to the Makefile. Basically do
> what the patch in method 2 is supposed to do.
>
> I could try to implement this approach, but it can take me some time
> (the `make' language is not my cup of tea). In the meantime, I suggest
> that, in your patch series, you update the help text of
> BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in order to warn about this option
> being incompatible with kernels 6.12 and up.
>
> Regards,
>
> Edgar.
>
> [1]
> https://lore.kernel.org/all/20241015212830.3899891-1-chris.packham@allied=
telesis.co.nz/T/#u
>

--0000000000007e6344062902bbda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 12 Dec 2024, 12:34=E2=80=
=AFam Edgar Bonet, &lt;<a href=3D"mailto:bonet@grenoble.cnrs.fr">bonet@gren=
oble.cnrs.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hello!<=
br>
<br>
About the incompatibility between Linux 6.12 and<br>
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH, Sergey Matyukevich wrote:<br>
&gt; IIUC at the moment Buildroot includes the following configurations<br>
&gt; that make use of BR2_LINUX_KERNEL_CUSTOM_DTS_PATH: [only 5 of them]<br=
>
<br>
Oh, I hadn&#39;t noticed there were so few of them!<br>
<br>
&gt; Adding new v6.12 kernel is not going to break any of those boards<br>
&gt; right away. However if the build rule for drop-in dtbs will not be<br>
&gt; re-enabled (which seems likely), migration to new kernels will be a<br=
>
&gt; problem for those boards.<br>
<br>
Indeed, this is my concern: I maintain the defconfigs of the Acqua<br>
boards (acmesystems_acqua_a5_*), and I would like to upgrade them to<br>
Linux 6.12 before the Buildroot 2025.02 release.<br>
<br>
However, this issue will also affect users that build (or customize)<br>
their own configurations with `make nconfig` or similar. If they select<br>
<br>
=C2=A0 =C2=A0 [x] Linux Kernel<br>
=C2=A0 =C2=A0 [x] Build a Device Tree Blob (DTB)<br>
=C2=A0 =C2=A0 (some_file) Out-of-tree Device Tree Source file paths<br>
<br>
and leave `Kernel version&#39; to its default (which is &quot;Latest versio=
n&quot;),<br>
they would end up with a non-functional configuration.<br>
<br>
&gt; I don&#39;t see how BR2_LINUX_KERNEL_CUSTOM_DTS_PATH can be supported =
in<br>
&gt; this case w/o patching new kernels. Probably it makes sense to convert=
<br>
&gt; those out-of-tree dts files into proper kernel patches ?<br>
<br>
I see two options for patching the kernel:<br>
<br>
=C2=A01. Use Chris Packham&#39;s patch &quot;kbuild: Restore the ability to=
 build out<br>
=C2=A0 =C2=A0 of tree dtbs&quot;.[1] This works for me: if I drop the patch=
 into<br>
=C2=A0 =C2=A0 board/acmesystems/acqua-a5/patches/linux/, I can change the k=
ernel<br>
=C2=A0 =C2=A0 version to 6.12.4 and it just works. It seems like the path o=
f least<br>
=C2=A0 =C2=A0 resistance for individual defconfigs, but I don&#39;t see thi=
s becoming<br>
=C2=A0 =C2=A0 Buildroot&#39;s blessed way of supporting custom DTSes.<br>
<br>
=C2=A02. Create a patch that adds the DTS to the kernel tree _and_ the DTB<=
br>
=C2=A0 =C2=A0 target to the relevant Makefile. I guess this is what you are=
<br>
=C2=A0 =C2=A0 suggesting.<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">For what it&#39;s worth I implemented Masahiro&#39=
;s suggestion (basically option 2) for our internal build tool at $dayjob. =
It&#39;s just a bit of sed-ing. It works reasonably well. The trickiest par=
t is avoiding repatching the Makefile but for buildroot that&#39;s just a f=
lag file.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"=
gmail_quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
If we go for the second option, then we would be saying that a kernel<br>
patch is the canonical way of providing a custom DTS. The<br>
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH option would then have to be deprecated<br=
>
and eventually removed, which would be a breaking change for some users.<br=
>
<br>
I would persoanlly prefer updating the implementation of<br>
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in order to make it compatible with<br>
6.12+ kernels. Maybe Buildroot could, in addition to copying the DTS to<br>
the kernel tree, add the relevant target to the Makefile. Basically do<br>
what the patch in method 2 is supposed to do.<br>
<br>
I could try to implement this approach, but it can take me some time<br>
(the `make&#39; language is not my cup of tea). In the meantime, I suggest<=
br>
that, in your patch series, you update the help text of<br>
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH in order to warn about this option<br>
being incompatible with kernels 6.12 and up.<br>
<br>
Regards,<br>
<br>
Edgar.<br>
<br>
[1] <a href=3D"https://lore.kernel.org/all/20241015212830.3899891-1-chris.p=
ackham@alliedtelesis.co.nz/T/#u" rel=3D"noreferrer noreferrer" target=3D"_b=
lank">https://lore.kernel.org/all/20241015212830.3899891-1-chris.packham@al=
liedtelesis.co.nz/T/#u</a><br>
</blockquote></div></div></div>

--0000000000007e6344062902bbda--

--===============2261958658453198939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2261958658453198939==--
