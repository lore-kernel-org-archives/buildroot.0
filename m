Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB0AE77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 21:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AA84406E3;
	Tue, 31 Dec 2024 21:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pV0fX_ZB7Km; Tue, 31 Dec 2024 21:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 207C9406E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 207C9406E9;
	Tue, 31 Dec 2024 21:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F711968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47408400AC
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 21:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NI_xWNg_Mucv for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 21:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF46D40024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF46D40024
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF46D40024
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 21:56:11 +0000 (UTC)
Received: from [192.168.1.91] (unknown [82.65.180.173])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C818819F57B;
 Tue, 31 Dec 2024 22:56:06 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>, <buildroot@buildroot.org>
Date: Tue, 31 Dec 2024 22:56:05 +0100
Message-ID: <1941eb80908.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <20241231185346.180096-1-ju.o@free.fr>
References: <20241231185346.180096-1-ju.o@free.fr>
User-Agent: AquaMail/1.54.0 (build: 105400535)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735682168;
 bh=qLprYR9zAeD34z9erFbxXDtm96e+n/h0LD/I4NyWtRw=;
 h=From:To:Date:In-Reply-To:References:Subject:From;
 b=raA1PlGZKRRCNPSn+2xmqEvOS9gVGq/aQTK84+BjAWgxpjeF24XsEF7FEdx9Kku1y
 22vSY0gs4Bp7mndfJS6m4znRYzQPuzzrNWjG429JN5Zjz4nh3V+TBD9+gHNm3tr3WI
 IXi5TKsorRH2CeqhJLoOiJJc+M7KRc7ohOUOLLGkKI3IF6n46eqFJuxwLjNkiA11d0
 JllZhb2asjq5O0IDe+JaBwNeAnUrSmm+F1Wo8dz2fW9XAE8/c3pzX3W/Fe3rFyIMUW
 SmYvzsVariA3L5KJbAjXCp2T91NPSp+6rf5sb3KhjDZUp9WpDU1DTUMWFlI0EXGpE8
 8BhnLzQnVKcRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=raA1PlGZ
Subject: Re: [Buildroot] [PATCH 1/1] configs/nvidia_bf3: set BR2_cortex_a78
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
Content-Type: multipart/mixed; boundary="===============5288182551116895899=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5288182551116895899==
Content-Type: multipart/alternative; boundary="1941eb80c5c5a8e28562f27ded"

This is a multi-part message in MIME format.
--1941eb80c5c5a8e28562f27ded
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit



Le 31 décembre 2024 19:53:56 Julien Olivain <ju.o@free.fr> a écrit :

> The nvidia BlueField-3 DPU includes Arm Cortex-A78 Hercules
> processors. See [1].
>
> The Cortex-A78 support was added in Buildroot in commit [2].
>
> This commit adds BR2_cortex_a78=y in nvidia_bf3_defconfig to enable
> optimisations for this processor.
>
> [1] https://www.nvidia.com/en-us/networking/products/data-processing-unit/
> [2] 
> https://gitlab.com/buildroot.org/buildroot/-/commit/f4690c2bfd7d51c614d09ff470e725c795bab980
>
> Cc: Vincent Jardin <vjardin@free.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested (compilation only) in:
> https://gitlab.com/jolivain/buildroot/-/jobs/8748400651
>
> Vincent: if you have access to this board, could you do an actual
> runtime test and add a "Tested-by:", please?

OK. I'll share some feedbacks early next week. Beside just booting on the 
board, do you have any specific tests your would like me to run ?

Thanks for this update,
  Vincent


> ---
> configs/nvidia_bf3_defconfig | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidia_bf3_defconfig
> index 3f958c0062..e44bb55a3a 100644
> --- a/configs/nvidia_bf3_defconfig
> +++ b/configs/nvidia_bf3_defconfig
> @@ -1,4 +1,5 @@
> BR2_aarch64=y
> +BR2_cortex_a78=y
> BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=y
> BR2_GLOBAL_PATCH_DIR="board/nvidia/bf3/patches"
> BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
> --
> 2.47.1


--1941eb80c5c5a8e28562f27ded
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 31 d=C3=A9cembre 2024 19:53:56 Julien Olivain &lt;ju.o=
@free.fr&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">The nvidia BlueField-3 DPU includes Arm Cortex-A78 Hercul=
es</div>
<div dir=3D"auto">processors. See [1].</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">The Cortex-A78 support was added in Buildroot in commit [=
2].</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">This commit adds BR2_cortex_a78=3Dy in nvidia_bf3_defconf=
ig to enable</div>
<div dir=3D"auto">optimisations for this processor.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">[1] https://www.nvidia.com/en-us/networking/products/data=
-processing-unit/</div>
<div dir=3D"auto">[2] https://gitlab.com/buildroot.org/buildroot/-/commit/f=
4690c2bfd7d51c614d09ff470e725c795bab980</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Cc: Vincent Jardin &lt;vjardin@free.fr&gt;</div>
<div dir=3D"auto">Signed-off-by: Julien Olivain &lt;ju.o@free.fr&gt;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">Patch tested (compilation only) in:</div>
<div dir=3D"auto">https://gitlab.com/jolivain/buildroot/-/jobs/8748400651</=
div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Vincent: if you have access to this board, could you do a=
n actual</div>
<div dir=3D"auto">runtime test and add a "Tested-by:", please?</div></block=
quote></div><div dir=3D"auto"><br></div><div dir=3D"auto">OK. I'll share so=
me feedbacks early next week. Beside just booting on the board, do you have=
 any specific tests your would like me to run ?</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Thanks for this update,</div><div dir=3D"auto">&nbs=
p; Vincent&nbsp;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></d=
iv><div id=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquot=
e type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border=
-left: 1px solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;configs/nvidia_bf3_defconfig | 1 +</div>
<div dir=3D"auto">&nbsp;1 file changed, 1 insertion(+)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/configs/nvidia_bf3_defconfig b/configs/nvidi=
a_bf3_defconfig</div>
<div dir=3D"auto">index 3f958c0062..e44bb55a3a 100644</div>
<div dir=3D"auto">--- a/configs/nvidia_bf3_defconfig</div>
<div dir=3D"auto">+++ b/configs/nvidia_bf3_defconfig</div>
<div dir=3D"auto">@@ -1,4 +1,5 @@</div>
<div dir=3D"auto">&nbsp;BR2_aarch64=3Dy</div>
<div dir=3D"auto">+BR2_cortex_a78=3Dy</div>
<div dir=3D"auto">&nbsp;BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_11=3Dy</div=
>
<div dir=3D"auto">&nbsp;BR2_GLOBAL_PATCH_DIR=3D"board/nvidia/bf3/patches"</=
div>
<div dir=3D"auto">&nbsp;BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy</div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.47.1</div>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--1941eb80c5c5a8e28562f27ded--


--===============5288182551116895899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5288182551116895899==--

