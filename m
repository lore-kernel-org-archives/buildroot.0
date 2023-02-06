Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFE9C636CD
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 00:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C743415D3;
	Mon,  6 Feb 2023 00:20:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C743415D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VrpQBDKMrpeX; Mon,  6 Feb 2023 00:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52C57409F2;
	Mon,  6 Feb 2023 00:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52C57409F2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F5981BF33E
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 00:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18663409F2
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 00:20:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18663409F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KQ30i2HXQIaC for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 00:20:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AFD9409E7
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AFD9409E7
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 00:20:36 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id w11so15437992lfu.11
 for <buildroot@buildroot.org>; Sun, 05 Feb 2023 16:20:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eNZjVjz9H4LJZ3IRbo33gzSkArEoDkTh02NRKHic4Xc=;
 b=V/zU2VcnTRyryjeVxRVo7aWkL+/ej5uvyIRS6tR3sSjvKqNjlTf+dH019T/OaUwTHD
 J6beQrDvj2yoPh5iBRR/dm6DXM67gO8QrkRBe2iD2vZgYpTrihzyct7O6AI3XfTBHvCY
 QYCi8RRDYZIRWhtHAyydoHR1H5+r5w+C0/Amx00Xdo26SGXs01lxI3i5MULKmWe/SpRo
 UJHlRkOI3LQDH7kwaC9hdlGQxoXEUdn5jzdGEWkKCI1unioL8NId6BAL1ZWcZZds2Z/H
 p/QFVg7qVy+o62J3ut2tO3aE3Q/FU9bUTG6s/Eqz37cb0Cejtq4hLC6m3+szm9PLzg3N
 +JZQ==
X-Gm-Message-State: AO0yUKXnygMokwD6wLABlhRAKsznfD7cDYHFAPbAQVBdbY5wdEF/0dNZ
 FFauwhp6PSJ4rpdECjjpDoJgoqTh+SyljjV8qHg=
X-Google-Smtp-Source: AK7set8OeAXaMChdpkfIZLYclpz8oFIP4V/haImRiXu3JFnrfGiXwJ+yTqDj12kMMpfPlOS6GCrMPtuKABGZgDEYUJ4=
X-Received: by 2002:a05:6512:3190:b0:4b5:b87a:3271 with SMTP id
 i16-20020a056512319000b004b5b87a3271mr3347327lfe.18.1675642834062; Sun, 05
 Feb 2023 16:20:34 -0800 (PST)
MIME-Version: 1.0
References: <20230205214132.6941-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20230205214132.6941-1-dario.binacchi@amarulasolutions.com>
From: Scott Fan <fancp2007@gmail.com>
Date: Mon, 6 Feb 2023 08:20:22 +0800
Message-ID: <CAFkzVZbvSgv2SA7EZeQPQpuc22TDe-vEGPoXj4GwdLSrMO11jA@mail.gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eNZjVjz9H4LJZ3IRbo33gzSkArEoDkTh02NRKHic4Xc=;
 b=QVQaAu3TtmoUAwWnmH7Jla4DCEf5qbf05CN6K8kqaZt5I/zqjkssrsSBQkntikUv29
 3W4eSVv+Cmt/ZgGoE9WOmDCwsTjc9P1c0yqOXPHYjMlI+4NUS8hcGwYfvo40v7tI+MkK
 RpPfNGcsww3rkOJGibQZPS5m3C+YAYtcFMZeBvhxjqmORWnmmqcSAy4HFhz4Sk9U6vq8
 JpuY0vlj4FTn1bC2QQ3L2Ex1Yx3FAYXfdnx4zpDIuk0NLTvfkIzyvgw5waXALpBr4Q1A
 R3nj7CYj4ajBC2wwVtFs3YstZ8AhojyzCa5KhDAVD8hIR2LY/xuD6qrKl9JoE2ijqkYB
 K9zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QVQaAu3T
Subject: Re: [Buildroot] [PATCH 1/2] configs/beaglebone: bump Linux version
 to 5.10.145-ti-r54
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
Cc: Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1036888722329925885=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1036888722329925885==
Content-Type: multipart/alternative; boundary="000000000000e511cf05f3fcffb1"

--000000000000e511cf05f3fcffb1
Content-Type: text/plain; charset="UTF-8"

Could you test it with kernel 5.10.162-ti-r56 ?

https://github.com/beagleboard/linux/releases/tag/5.10.162-ti-r56

Scott Fan


On Mon, Feb 6, 2023 at 5:42 AM Dario Binacchi <
dario.binacchi@amarulasolutions.com> wrote:

> The previous version failed to boot from sd card with a log reported by
> the document [1]. In my case it always failed, a 100% failure against
> 75% reported by the document.
>
> Instead of adding the patch to fix the problem, I preferred to update
> the kernel version as suggested by the document itself.
>
> Tested on beaglebone black.
>
> [1]
> https://forum.beagleboard.org/t/5-10-x-beaglebone-black-fails-to-boot-from-sd-card/33297
> Signed-off-by
> <https://forum.beagleboard.org/t/5-10-x-beaglebone-black-fails-to-boot-from-sd-card/33297Signed-off-by>:
> Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  configs/beaglebone_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
> index 639b491e9746..dff7dea422ee 100644
> --- a/configs/beaglebone_defconfig
> +++ b/configs/beaglebone_defconfig
> @@ -20,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c
> board/beaglebone/genimage.cfg"
>  # Kernel
>  BR2_LINUX_KERNEL=y
>  BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
> -BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> github,beagleboard,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz"
> +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
> github,beagleboard,linux,5.10.145-ti-r54)/linux-5.10.145-ti-r54.tar.gz"
>  BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
>  BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack
> am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-wireless
> am335x-bonegreen-wireless"
> --
> 2.32.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000e511cf05f3fcffb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Could you test it with kernel 5.10.162-ti-r56 ?<div><div><=
div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature=
"><div dir=3D"ltr"><br></div><div dir=3D"ltr"><a href=3D"https://github.com=
/beagleboard/linux/releases/tag/5.10.162-ti-r56">https://github.com/beagleb=
oard/linux/releases/tag/5.10.162-ti-r56</a></div><div dir=3D"ltr"><br></div=
><div dir=3D"ltr">Scott Fan<br></div></div></div><br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 6, 2=
023 at 5:42 AM Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amarulas=
olutions.com">dario.binacchi@amarulasolutions.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">The previous version faile=
d to boot from sd card with a log reported by<br>
the document [1]. In my case it always failed, a 100% failure against<br>
75% reported by the document.<br>
<br>
Instead of adding the patch to fix the problem, I preferred to update<br>
the kernel version as suggested by the document itself.<br>
<br>
Tested on beaglebone black.<br>
<br>
[1] <a href=3D"https://forum.beagleboard.org/t/5-10-x-beaglebone-black-fail=
s-to-boot-from-sd-card/33297Signed-off-by" rel=3D"noreferrer" target=3D"_bl=
ank">https://forum.beagleboard.org/t/5-10-x-beaglebone-black-fails-to-boot-=
from-sd-card/33297<br>
Signed-off-by</a>: Dario Binacchi &lt;<a href=3D"mailto:dario.binacchi@amar=
ulasolutions.com" target=3D"_blank">dario.binacchi@amarulasolutions.com</a>=
&gt;<br>
---<br>
=C2=A0configs/beaglebone_defconfig | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig<br=
>
index 639b491e9746..dff7dea422ee 100644<br>
--- a/configs/beaglebone_defconfig<br>
+++ b/configs/beaglebone_defconfig<br>
@@ -20,7 +20,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS=3D&quot;-c board/beaglebone/g=
enimage.cfg&quot;<br>
=C2=A0# Kernel<br>
=C2=A0BR2_LINUX_KERNEL=3Dy<br>
=C2=A0BR2_LINUX_KERNEL_CUSTOM_TARBALL=3Dy<br>
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,beagleboard=
,linux,5.10.30-ti-r3)/linux-5.10.30-ti-r3.tar.gz&quot;<br>
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION=3D&quot;$(call github,beagleboard=
,linux,5.10.145-ti-r54)/linux-5.10.145-ti-r54.tar.gz&quot;<br>
=C2=A0BR2_LINUX_KERNEL_DEFCONFIG=3D&quot;omap2plus&quot;<br>
=C2=A0BR2_LINUX_KERNEL_DTS_SUPPORT=3Dy<br>
=C2=A0BR2_LINUX_KERNEL_INTREE_DTS_NAME=3D&quot;am335x-evm am335x-bone am335=
x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue am335x-boneblack-=
wireless am335x-bonegreen-wireless&quot;<br>
-- <br>
2.32.0<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000e511cf05f3fcffb1--

--===============1036888722329925885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1036888722329925885==--
