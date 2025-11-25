Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F2AD0EE0D
	for <buildroot@archiver.kernel.org>; Tue, 25 Nov 2025 17:33:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3236058D;
	Tue, 25 Nov 2025 17:33:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 10rai8L8PqfE; Tue, 25 Nov 2025 17:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB523607CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB523607CB;
	Tue, 25 Nov 2025 17:33:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F319359
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35AF8607CB
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 17:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yg7xetaA-jXH for <buildroot@buildroot.org>;
 Tue, 25 Nov 2025 17:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com;
 envelope-from=rustamabd@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A1066058D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A1066058D
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A1066058D
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 17:33:36 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id
 5614622812f47-45085a4ab72so2659188b6e.1
 for <buildroot@buildroot.org>; Tue, 25 Nov 2025 09:33:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764092016; x=1764696816;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPIk63WEsel9dDBltMlv+HoaPww1563kZH++YwSW97k=;
 b=dVUk09O+YhA4/rSRF3wxDsmHgGqBjlOXEIVC0IxTaqkLkqsAQWtFq1msDf8lDJ59RO
 LUEuGT2e1rzEdwlRtKhwYLAWWaBvWfWbe98j5AQNeW8r0ESwMFxEdBVAKazrBVYjyGsL
 BUYOVwUOmBBvs+FkaBbgYn3ZScJJ+7IBdhjzTQWiiO+Yddq8dYqxFnFTp7RBR68UFuYQ
 w23Ey8hMme8djHha061rryykUb2YZnEgIfdy5Tq+Cu46GSbT6eBLFfoChIWpVYWAH7qM
 h2PkiwEkKDDRw3t+1w6u5cnUXjy8bmSAoHM/uJ8O7TQQpevB+zj+i5bDTUyxI+uFI51H
 xl5Q==
X-Gm-Message-State: AOJu0Yx4Fs6UltfJZEqQbNudSlsuxe1UF2mbVdOnMJTG+R2F7w/R6Y/Y
 2N8TRQE3T+OxawTehboAaRpaOnqch8AQjOlo/OIZ+aBnzoceq2CgwKiE1fAIIsLYgHiagHC4uPQ
 P3I0Wxh1dJMo0IYzO8fjbxTikBRsn7mE=
X-Gm-Gg: ASbGnctCZhH//YArjbGG9Ao4h7T1JbxOU//lUyLiawxJ61qGtzka/tr3CdL+D4H3dJ/
 p6yrRcyhDPEAeXIDt8FLLCIhZ7Nx9qtLksv9u4TRi+vQ/5s4IBikyvx+CNxqbjJM1hxWa9nRQI2
 NLHfggZUXzIXQ7DCRGfTdBvnO8mi9XYb3C0LoTUa5oFZtpihQR96dvEGQCSE65GnmKXFWCE7H5k
 HbMf9nxzbJxSKhwsMpkkzA8RuRSs1Ga1TwBzwFcjp26BPj6+ubLOSCZURekrLnRsM5ikTHTsw8H
 sNC1bHacHfqZoW1Rtzep21uUKlutRrMZjXJ0fcNJPH3igDPDQdpe4EZHxXG18p5GBIORTh0S4wr
 wNfQvG0/mDrOWTY+byao22+I=
X-Google-Smtp-Source: AGHT+IFbGwgWwfd56x4YcxMW+TRR6d5iyznXHt7JDx9Prj+b7Gx/KYjpxW9h6mirmdHYhwNUcvf8oRtP0F6uOlwBehI=
X-Received: by 2002:a05:6808:210c:b0:450:b215:8f22 with SMTP id
 5614622812f47-4514e80571bmr1592495b6e.55.1764092015758; Tue, 25 Nov 2025
 09:33:35 -0800 (PST)
MIME-Version: 1.0
References: <CAPzS6u_Lu2jE3PzbmOc1gRzA0uLjxmiR60fwy5eEwRDK92ya2A@mail.gmail.com>
 <4dc92971-6469-49dd-8848-923f6efe41a8@rnout.be>
In-Reply-To: <4dc92971-6469-49dd-8848-923f6efe41a8@rnout.be>
From: Rustam <rustamabd@gmail.com>
Date: Tue, 25 Nov 2025 18:33:24 +0100
X-Gm-Features: AWmQ_bn5lcAENRkvWZh3YCuZzkBTedzMNh1SwwjImyBJdIy7dhDdQGhpeOQd08Y
Message-ID: <CAPzS6u9VAkfRU-F9oLtDjOSwrvqv6nT27Fge8ChgeifEh5WYZg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764092016; x=1764696816; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bPIk63WEsel9dDBltMlv+HoaPww1563kZH++YwSW97k=;
 b=akjzOdJOMwE1IaPkoT6t2hR1J7BqklSSSsvpB14H91SQcYpBEFFK6Yu6CNFHyWOikd
 wJPSX+tzed/leGlJ68y7ljHR6PVaZTeakHtxk1d8KZto5vHAPTpiMm2we+Imm8LjLOMJ
 IN9I2554ihNgnyD5J24kLp3XKmOXfabqO38YCEYVKjhMWY1pa1OTprlfYPuIcTnPyfaq
 jjIE2iHFRd7Fvna1bnMmZQ8w6mWnukCN0p5Utb7XCUd9c44VSs5YtnupO2BTV5Iqu3rC
 2+yVTgAwzZ5SEJWZDYvlildbV6UOcQ3CCIJpXTAFYl6ZrFEEo/je7TW96gIWNH4oaJ9V
 Nu9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=akjzOdJO
Subject: Re: [Buildroot] Kernel headers with an external toolchain
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
Content-Type: multipart/mixed; boundary="===============5478547227693527636=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5478547227693527636==
Content-Type: multipart/alternative; boundary="000000000000f3519406446eadec"

--000000000000f3519406446eadec
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Nov 2025 at 21:58, Arnout Vandecappelle <arnout@rnout.be> wrote:

> On 06/11/2025 13:41, Rustam wrote:
> > In case of the official ARM toolchain (from https://developer.arm.com/
> > downloads/-/arm-gnu-toolchain-downloads <
> https://developer.arm.com/downloads/-/
> > arm-gnu-toolchain-downloads>), we get 4.20 headers, which causes issues
> when the
> > actual kernel is 6.12.
>
> How does this cause issues? The Linux kernel is supposed to be
> backward-compatible, so a userspace built for the 4.20 kernel should still
> run
> with a 6.12 kernel.
>

Linux headers are only backward-compatible in theory. In practice not
matching the actual kernel version can lead to various issues, among others
security issues with seccomp.

To give a concrete example, 64-bit time system calls that were added in 5.1
are automatically used by glibc. Applications that set up a seccomp sandbox
(e.g. sshd) won't be able to whitelist the needed system calls correctly
because the corresponding definitions from linux/unistd.h are missing.

Try this for example and notice sshd not working:

cat <<EOM >>configs/qemu_arm_vexpress_defconfig
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_OPENSSH=y
EOM

make distclean
make qemu_arm_vexpress_defconfig
make -j$(nproc)

output/images/start-qemu.sh

. . .
Welcome to Buildroot
buildroot login: root

#
# ssh localhost
Connection reset by 127.0.0.1 port 22
#

To fix this, we have created a new option,
BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS, for which I recently submitted
a patch here:
https://patchwork.ozlabs.org/project/buildroot/list/?series=481839

With the above patch applied, sshd works:

cat <<EOM >>configs/qemu_arm_vexpress_defconfig
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS=y
BR2_PACKAGE_OPENSSH=y
EOM

make toolchain-external-dirclean openssh-dirclean
make qemu_arm_vexpress_defconfig
make -j$(nproc)

output/images/start-qemu.sh
. . .
Welcome to Buildroot
buildroot login: root

#
# ssh localhost
root@localhost's password:


>  the kernel headers are an integral part of the toolchain
> (concretely, of the libc implementation). If you want to use newer kernel
> headers, you have to rebuild the toolchain.
>
> Actually here the backward-compatibility reasoning applies. Generally
speaking, upgrading linux headers is safe when it comes to libc. glibc
specifically goes further and knows which system calls can exist on each
architecture and probes them at run time, this way it becomes independent
of build-time linux headers.

Hence, hereby a request to have a look at the proposed patch.
We've been using this patch above on an NXP i.MX6 platform with great
success.
Note, the patch is fully compatible with the
BR2_TOOLCHAIN_HEADERS_AT_LEAST_ sybsystem and will set the the right
BR2_TOOLCHAIN_HEADERS_AT_LEAST_ flags accordingly.

Regards,
Rustam

--000000000000f3519406446eadec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote gmail=
_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Nov 2025=
 at 21:58, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@rnout.be">arno=
ut@rnout.be</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 06/11/2025 13:41, Rustam wrote:<br>&gt; In case of the offici=
al ARM toolchain (from <a href=3D"https://developer.arm.com/" rel=3D"norefe=
rrer" target=3D"_blank">https://developer.arm.com/</a> <br>
&gt; downloads/-/arm-gnu-toolchain-downloads &lt;<a href=3D"https://develop=
er.arm.com/downloads/-/" rel=3D"noreferrer" target=3D"_blank">https://devel=
oper.arm.com/downloads/-/</a> <br>
&gt; arm-gnu-toolchain-downloads&gt;), we get 4.20 headers, which causes is=
sues when the <br>
&gt; actual kernel is 6.12.<br>
<br>How does this cause issues? The Linux kernel is supposed to be <br>
backward-compatible, so a userspace built for the 4.20 kernel should still =
run <br>
with a 6.12 kernel.<br></blockquote><div class=3D"gmail_quote gmail_quote_c=
ontainer"><br></div>Linux headers are only backward-compatible in theory. I=
n practice not matching the actual kernel version can lead to various issue=
s, among others security issues with seccomp.<br><br>To give a concrete exa=
mple, 64-bit time system calls that were added in 5.1 are automatically use=
d by glibc. Applications that set up a seccomp sandbox (e.g. sshd) won&#39;=
t be able to whitelist the needed system calls correctly because the corres=
ponding definitions from linux/unistd.h are missing.<br><br>Try this for ex=
ample and notice sshd not working:<br><br>cat &lt;&lt;EOM &gt;&gt;configs/q=
emu_arm_vexpress_defconfig<br>BR2_TOOLCHAIN_EXTERNAL=3Dy<br>BR2_PACKAGE_OPE=
NSSH=3Dy<br>EOM<br><br>make distclean<br>make qemu_arm_vexpress_defconfig<b=
r>make -j$(nproc)<br><br>output/images/start-qemu.sh<br><br>. . .<br>Welcom=
e to Buildroot<br>buildroot login: root<br><br>#<br># ssh localhost<br>Conn=
ection reset by 127.0.0.1 port 22<br># <br><br>To fix this, we have created=
 a new option, BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEADERS, for which I rec=
ently submitted a patch here:<br><a href=3D"https://patchwork.ozlabs.org/pr=
oject/buildroot/list/?series=3D481839">https://patchwork.ozlabs.org/project=
/buildroot/list/?series=3D481839</a><br><br>With the above patch applied, s=
shd works:<br><br>cat &lt;&lt;EOM &gt;&gt;configs/qemu_arm_vexpress_defconf=
ig<br>BR2_TOOLCHAIN_EXTERNAL=3Dy<br>BR2_TOOLCHAIN_EXTERNAL_UPDATE_LINUX_HEA=
DERS=3Dy<br>BR2_PACKAGE_OPENSSH=3Dy<br>EOM<br><br>make toolchain-external-d=
irclean openssh-dirclean<br>make qemu_arm_vexpress_defconfig<br>make -j$(np=
roc)<br><br>output/images/start-qemu.sh<br>. . .<br>Welcome to Buildroot<br=
>buildroot login: root<br><br>#<br># ssh localhost<br>root@localhost&#39;s =
password: <br><br></div><div class=3D"gmail_quote gmail_quote_container"><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><br>=C2=A0the kernel header=
s are an integral part of the toolchain <br>
(concretely, of the libc implementation). If you want to use newer kernel <=
br>
headers, you have to rebuild the toolchain.<br>
<br></blockquote><div>Actually here the backward-compatibility reasoning ap=
plies. Generally speaking, upgrading linux headers is safe when it comes to=
 libc. glibc specifically goes further and knows which system calls can exi=
st on each architecture and probes them at run time, this way it becomes in=
dependent of build-time linux headers.</div><div><br></div><div>Hence, here=
by a request to have a look at the proposed patch.</div><div>We&#39;ve been=
 using this patch above on an NXP i.MX6 platform with great success.</div><=
div>Note, the patch is fully compatible with the BR2_TOOLCHAIN_HEADERS_AT_L=
EAST_ sybsystem and will set the the right BR2_TOOLCHAIN_HEADERS_AT_LEAST_ =
flags accordingly.</div><div><br></div><div>Regards,</div><div>Rustam</div>=
</div></div>

--000000000000f3519406446eadec--

--===============5478547227693527636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5478547227693527636==--
