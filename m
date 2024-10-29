Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6CED2AB3B
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 13:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33EA640544;
	Tue, 29 Oct 2024 13:13:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpnldZ8MQ7OM; Tue, 29 Oct 2024 13:13:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A93FD403DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A93FD403DA;
	Tue, 29 Oct 2024 13:13:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05906112A
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E75C6409F1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:13:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbdXb7Cb_qBe for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 13:13:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com;
 envelope-from=vfazio@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8487240A1E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8487240A1E
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com
 [IPv6:2607:f8b0:4864:20::92d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8487240A1E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 13:13:02 +0000 (UTC)
Received: by mail-ua1-x92d.google.com with SMTP id
 a1e0cc1a2514c-84fed1ff217so3144803241.1
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 06:13:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730207581; x=1730812381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UI9bZWQEivRBp5H5gO6HJbcd3XV9sdqq2nx8NI1hLvc=;
 b=fsaZHabeI/AXuRF39ayipCCrECtykH72EukyWVTJDWwVzkZLh5jWQRHi7KE8XdIk7z
 5+d8th3xZXw50UzkuTZgy87oThVFmADqtV6OpAjcJBBzoFbul3lKK/+iVMOkeVCWtCl7
 IjNbjHV0vOXuP1Je3qkbQv7HYcQjhLU29JltG9wWsSbMxHYWEtntL5r8afvZsT+Gt/37
 cwHXJ0pwp906Zzg7VqM9nlk2n/l4zrGpbTpRLqoCQCL+PXFlJrRAKVsjrnQuq3NZAhVo
 vvF9P8ls//z7PMfi8xDN0d9LemMAfW/df8NpcjQBNeqMJnou3/lbD19v+XG7kPDRzs3j
 djrA==
X-Gm-Message-State: AOJu0Ywh13zywqNveQGMhvkP/QZQAso2bcdCtW7rf74aGDNPLeOtMI4r
 OJjaAjiuDDupRQZzQyGb5xPAGhl01PyAJkMetCV07s8gTGED05vKowj12JfZsDZUmSj7bXLUZvi
 TeqlZY4lUOiMSM91nHTsjvo5BHo0=
X-Google-Smtp-Source: AGHT+IGOz10FVDnvqR5dnjzOc83S7XgMQYebuDvt5TGvT8Epq06LKWMjDU4jgAdkrVFbjrtlRSQMCwfEEtvwOSZqaTc=
X-Received: by 2002:a05:6122:8c9:b0:50d:2aca:3b13 with SMTP id
 71dfb90a1353d-51050600e3dmr1282223e0c.3.1730207580840; Tue, 29 Oct 2024
 06:13:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241029125847.1300382-1-dungeonlords789@naver.com>
In-Reply-To: <20241029125847.1300382-1-dungeonlords789@naver.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 29 Oct 2024 22:12:48 +0900
Message-ID: <CAOrEah7eaaeMDJc882HtW=NQp-SpWMSVDO+OqyYYhmAbL+YnTQ@mail.gmail.com>
To: Cherniaev Andrei <dungeonlords789@naver.com>
Cc: buildroot@buildroot.org, AndreiCherniaev <dungeonlords789@yandex.ru>, 
 Cherniaev Andrei <27889022+AndreiCherniaev@users.noreply.github.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730207581; x=1730812381; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UI9bZWQEivRBp5H5gO6HJbcd3XV9sdqq2nx8NI1hLvc=;
 b=NfrMsDZMp7TyWYf0bkyN1XpCXHvg8tZkKN5z2cXWOTlrgaZAkypH1cCtPDesm3VRDf
 ZTTMEk9OV0uRjs+wamMORHN6zgVZ1P1spDGGCAVPhX9LR5gkQescQfs8UoFkXIndTnSv
 UN2xbGrwJuF49FIq6Ca0RnmcfGkucIba1pXp0hx6bXt4DZUY2NifT12C7QvQ+mFqs+3j
 vntJ32j+8zEBz6gkG4BCz+tRxnO4DrWCSIZ/0ClNCNHkbolT+AadeBJlHQjQR7G0ElqB
 XjfLa2MIVruIZLLpfsgLIVKJhE8TMTbpUzKJan/M/+YiX0LRzGT2WX3d6+DsqErLntkc
 FO1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NfrMsDZM
Subject: Re: [Buildroot] [PATCH 1/1] arch/Config.in.x86: sync prompt and
 help with Linux for Geode CPU
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
Content-Type: multipart/mixed; boundary="===============6866290894195526374=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6866290894195526374==
Content-Type: multipart/alternative; boundary="0000000000003e69e806259d580e"

--0000000000003e69e806259d580e
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 29, 2024, 21:58 Cherniaev Andrei <dungeonlords789@naver.com>
wrote:

> From: AndreiCherniaev <dungeonlords789@yandex.ru>
>
> Linux kernel for AMD Geode CPU
> https://github.com/torvalds/linux/blob/e42b1a9a2557aa94fee47f078633677198386a52/arch/x86/Kconfig.cpu#L232
>
> Signed-off-by: Cherniaev Andrei <
> 27889022+AndreiCherniaev@users.noreply.github.com>
> ---
>  arch/Config.in.x86 | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index f9b32130b2..4f2682eb74 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -682,10 +682,12 @@ config BR2_x86_zen4
>         select BR2_X86_CPU_HAS_AVX512
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
>  config BR2_x86_geode
> -       bool "AMD Geode"
> +        bool "Geode GX/LX"
>


I think I put the mention of AMD here to specifically avoid confusion with
other Geode-like targets.

https://lore.kernel.org/buildroot/20230801211759.45CA484044@busybox.osuosl.org/T/

As opposed to putting it in the help text.

Im not sure what this patch is clarifying exactly.



        depends on !BR2_x86_64
>         select BR2_X86_CPU_HAS_MMX
>         select BR2_X86_CPU_HAS_3DNOW
> +        help
> +          Select this for AMD Geode GX and LX processors.
>  config BR2_x86_c3
>         bool "Via/Cyrix C3 (Samuel/Ezra cores)"
>         depends on !BR2_x86_64
> --
> 2.43.0
>
>

--0000000000003e69e806259d580e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Oct 29, 2024, 21:58 Cherniaev Andrei &lt;<a hr=
ef=3D"mailto:dungeonlords789@naver.com" target=3D"_blank" rel=3D"noreferrer=
">dungeonlords789@naver.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">From: AndreiCherniaev &lt;<a href=3D"mailto:dungeonlords789@yandex.=
ru" rel=3D"noreferrer noreferrer" target=3D"_blank">dungeonlords789@yandex.=
ru</a>&gt;<br>
<br>
Linux kernel for AMD Geode CPU <a href=3D"https://github.com/torvalds/linux=
/blob/e42b1a9a2557aa94fee47f078633677198386a52/arch/x86/Kconfig.cpu#L232" r=
el=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://github.co=
m/torvalds/linux/blob/e42b1a9a2557aa94fee47f078633677198386a52/arch/x86/Kco=
nfig.cpu#L232</a><br>
<br>
Signed-off-by: Cherniaev Andrei &lt;<a href=3D"mailto:27889022%2BAndreiCher=
niaev@users.noreply.github.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">27889022+AndreiCherniaev@users.noreply.github.com</a>&gt;<br>
---<br>
=C2=A0arch/Config.in.x86 | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86<br>
index f9b32130b2..4f2682eb74 100644<br>
--- a/arch/Config.in.x86<br>
+++ b/arch/Config.in.x86<br>
@@ -682,10 +682,12 @@ config BR2_x86_zen4<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_X86_CPU_HAS_AVX512<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_ARCH_NEEDS_GCC_AT_LEAST_13<br>
=C2=A0config BR2_x86_geode<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;AMD Geode&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Geode GX/LX&quot;<br></blockquote><=
/div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I think I put the mention of AMD here to specifically avoid confu=
sion with other Geode-like targets.=C2=A0</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto"><a href=3D"https://lore.kernel.org/buildroot/202308012117=
59.45CA484044@busybox.osuosl.org/T/" target=3D"_blank" rel=3D"noreferrer">h=
ttps://lore.kernel.org/buildroot/20230801211759.45CA484044@busybox.osuosl.o=
rg/T/</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">As opposed to =
putting it in the help text.=C2=A0</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Im not sure what this patch is clarifying exactly.=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_x86_64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_X86_CPU_HAS_MMX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_X86_CPU_HAS_3DNOW<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Select this for AMD Geode GX and LX pro=
cessors.<br>
=C2=A0config BR2_x86_c3<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;Via/Cyrix C3 (Samuel/Ezra cores)&quo=
t;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_x86_64<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div></div>

--0000000000003e69e806259d580e--

--===============6866290894195526374==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6866290894195526374==--
