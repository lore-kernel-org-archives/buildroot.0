Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9EE7C38142
	for <buildroot@archiver.kernel.org>; Sat, 28 Jan 2023 22:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D8B60E60;
	Sat, 28 Jan 2023 22:52:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40D8B60E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4L_TEA_KgyyL; Sat, 28 Jan 2023 22:52:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5497760E53;
	Sat, 28 Jan 2023 22:52:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5497760E53
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC96D1BF44C
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:52:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9691D416EB
 for <buildroot@lists.busybox.net>; Sat, 28 Jan 2023 22:52:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9691D416EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nRwhZx88238p for <buildroot@lists.busybox.net>;
 Sat, 28 Jan 2023 22:52:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18C0C416E7
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18C0C416E7
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 22:52:49 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id e10so5370400pgc.9
 for <buildroot@buildroot.org>; Sat, 28 Jan 2023 14:52:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p0F3TcLVfsw85nl3SGPSMjommAuI9Cz3bBFCTIFhKtw=;
 b=P5hn0/WIUVmE2HchviL6j8OH7wYf9rXyXh761w5JtaLxUQk5JavhPxdHGHWhX9XSRs
 U0b0pTQ6y26xW1VBY5jJsR8yg/K3GEUIoLDmgMQA00JsNwARStb6J8AvLYel+Gs0G/TG
 cPDZyknQXP9UHG4TrHqrIqTGOgnVR5OPV3kjsOanCFwGCteA7S7w7qhGxfGB/TSFrjuE
 VF1w4Uro76WDjfPMdlLGAczbW3VywiX7DvKNOYa+5H4MdFsaGVvI3z0Rsr46fLZpm3Ss
 MY6lt8S/Uo+mNEBcjfi3Ox3MsbiHjc45EIVWUSjXoduSNRIGR80xomSrxPBwtzJoOSSI
 vwsA==
X-Gm-Message-State: AFqh2kp/TJbHr6F8CX9ac//CYDEiiB1U67ekvtBMpoK411b9spUYFaYu
 4hs6qKbkzaEvZy9n2fPlTu7d4mKMM27cqCUAROT0CGA61sQ=
X-Google-Smtp-Source: AMrXdXuALr6zDlJOR+jliDCQPZufE1jb4zImWe8UUP0prq0TGIhvLN7D1qehUyhs93W7gclmrfohGk3mLyzEDvRdZB4=
X-Received: by 2002:a62:686:0:b0:583:3ab6:10a2 with SMTP id
 128-20020a620686000000b005833ab610a2mr5848499pfg.15.1674946368414; Sat, 28
 Jan 2023 14:52:48 -0800 (PST)
MIME-Version: 1.0
References: <CACHw65JhmQX27SkN0jSMAD-P=UuwOizZc+sG+WatprbH_PFFyQ@mail.gmail.com>
 <20230128222102.2de52447@windsurf>
In-Reply-To: <20230128222102.2de52447@windsurf>
From: Ra C <rcrichlow9000@gmail.com>
Date: Sat, 28 Jan 2023 16:52:37 -0600
Message-ID: <CACHw65LWAuVTUqCCoJuS7XSXZF_vdUSHYHV0pkqw6-6OaT_n6A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p0F3TcLVfsw85nl3SGPSMjommAuI9Cz3bBFCTIFhKtw=;
 b=Wk+w1S6ZLOKJItMh/Iwf50RoSwxw0FmeK+vhW76XSaZ9OIFjsMdqJwB0j89eORGher
 5dJ4uZXaMY1RPGv/v5XdnqC+UoTY+TJ7tPt5TEbGzg4m4J9wNnPBZzdZBrCIM+heWLB3
 ZPY/6pL7qV+uS5xQ/gsSc6mOesSQIEVr5N0/FGY7Fk6186cLrVnaPaVZCuc4M2H1XPG6
 ztCH1z7krKYoT9PXz1yhQd5L4n29KMhyeRGz8o+YYWLugweo7konsWYH9bV2Uy/bhJ1X
 SyAEKH2Euipg8NBaKZCmPRavjslxikEAP10owv1EAkGzyvxcJfJQSHFad2Tnr65d9sHp
 8jLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Wk+w1S6Z
Subject: Re: [Buildroot] stm32mp1 kernel won't boot on custom board
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0502111874875138006=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0502111874875138006==
Content-Type: multipart/alternative; boundary="0000000000004eaa3605f35ad7ea"

--0000000000004eaa3605f35ad7ea
Content-Type: text/plain; charset="UTF-8"

Thomas ,
Thanks for the comments.
Here are the steps I took:
1.  Decompiled the working dtb using :  dtc --sort --symbols -I dtb -O dts
-o working.dts stm32mp157a-fsmp1b.dtb
This gives the source device tree called working.dts (with no includes).

On the 5.4 kernel buildroot:
2.  Copied working.dts into output/build/linux-custom/arch/arm/boot/dts
3.  Ran make menuconfig to add working to
the BR2_LINUX_KERNEL_INTREE_DTS_NAME
4.  Rebuilt.
5.  Copied the output/images/working.dtb onto the sdcard and modified the
extlinux.conf to use this dtb.
6.  Boots OK.

7.  Built working.dtb using the same method as above using the 5.15 kernel
buildroot.
8.  Copied it to the sdcard and tried to boot the 5.15 kernel.
9.  The 5.15 kernel cannot find the root device and loops endlessly in
class_find_device() in drivers/base/class.c

Note that the 2 dtbs built using the 5.4 kernel buildroot and the 5.15
buildroot are identical (diff'ed them).

The rootwait kernel argument is present.  I tried removing it and got a
kernel panic.

Regards, Ramon


On Sat, Jan 28, 2023 at 3:21 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Sat, 28 Jan 2023 14:52:12 -0600
> Ra C <rcrichlow9000@gmail.com> wrote:
>
> > I have a custom stm32mp157a board which runs OK with a modified 5.4
> kernel.
> > I want to migrate to the latest stm supported kernel.
> > I built a stm32mp157a_dk1 target using the BR2_EXTERNAL feature described
> > here: https://github.com/bootlin/buildroot-external-st which builds a
> 5.15
> > kernel.
> >
> > Using the same dtb , the 5.15 kernel fails to mount the root device (a
>
> What do you mean by "using the same DTB" ?
>
> Make sure to use the DTB that matches the kernel version you're using.
> Even though DTBs are in theory kernel-version independent, there are
> quite frequently some subtle changes that causes a DTB written for
> kernel version X to not work with kernel version Y.
>
> Also, make sure to pass "rootwait" in your kernel command line, to tell
> the kernel to wait for the root device to appear. As SD/MMC devices are
> detected asynchronously, sometimes they are detected too late compared
> to the point where the kernel attempts to mount the rootfs.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000004eaa3605f35ad7ea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thomas ,<div>Thanks for the comments.<div>Here are the ste=
ps I took:</div><div>1.=C2=A0 Decompiled the working dtb using :=C2=A0 dtc =
--sort --symbols -I dtb -O dts -o working.dts stm32mp157a-fsmp1b.dtb<br></d=
iv><div>This gives the source device tree called working.dts (with no inclu=
des).</div><div><br></div><div>On the 5.4 kernel buildroot:</div><div>2.=C2=
=A0 Copied working.dts into output/build/linux-custom/arch/arm/boot/dts</di=
v><div>3.=C2=A0 Ran make menuconfig to add working to the=C2=A0BR2_LINUX_KE=
RNEL_INTREE_DTS_NAME</div><div>4.=C2=A0 Rebuilt.</div><div>5.=C2=A0 Copied =
the output/images/working.dtb onto the sdcard and modified the extlinux.con=
f to use this dtb.</div><div>6.=C2=A0 Boots OK.</div><div><br></div><div>7.=
=C2=A0 Built working.dtb using the same method as above using the 5.15 kern=
el buildroot.</div><div>8.=C2=A0 Copied it to the sdcard and tried to boot =
the 5.15 kernel.=C2=A0=C2=A0</div><div>9.=C2=A0 The 5.15 kernel cannot find=
 the root device and loops endlessly in class_find_device() in drivers/base=
/class.c</div><div><br></div><div>Note that the 2 dtbs built using the 5.4 =
kernel buildroot and the 5.15 buildroot are identical (diff&#39;ed them).</=
div><div><br></div><div>The rootwait kernel argument is present.=C2=A0 I tr=
ied=C2=A0removing it and got a kernel panic.</div><div><br></div><div>Regar=
ds, Ramon</div><div><br></div></div></div><br><div class=3D"gmail_quote"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Jan 28, 2023 at 3:21 PM Thomas =
Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_bl=
ank">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On Sat, 28 Jan 2023 14:52:12 -0600<br>
Ra C &lt;<a href=3D"mailto:rcrichlow9000@gmail.com" target=3D"_blank">rcric=
hlow9000@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I have a custom stm32mp157a board which runs OK with a modified 5.4 ke=
rnel.<br>
&gt; I want to migrate to the latest stm supported kernel.<br>
&gt; I built a stm32mp157a_dk1 target using the BR2_EXTERNAL feature descri=
bed<br>
&gt; here: <a href=3D"https://github.com/bootlin/buildroot-external-st" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/bootlin/buildroot-exte=
rnal-st</a> which builds a 5.15<br>
&gt; kernel.<br>
&gt; <br>
&gt; Using the same dtb , the 5.15 kernel fails to mount the root device (a=
<br>
<br>
What do you mean by &quot;using the same DTB&quot; ?<br>
<br>
Make sure to use the DTB that matches the kernel version you&#39;re using.<=
br>
Even though DTBs are in theory kernel-version independent, there are<br>
quite frequently some subtle changes that causes a DTB written for<br>
kernel version X to not work with kernel version Y.<br>
<br>
Also, make sure to pass &quot;rootwait&quot; in your kernel command line, t=
o tell<br>
the kernel to wait for the root device to appear. As SD/MMC devices are<br>
detected asynchronously, sometimes they are detected too late compared<br>
to the point where the kernel attempts to mount the rootfs.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000004eaa3605f35ad7ea--

--===============0502111874875138006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0502111874875138006==--
