Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57EECD3B7C2
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 23:22:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EDD6E6160B;
	Sun, 24 Nov 2024 23:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rgNagmB8NhW8; Sun, 24 Nov 2024 23:22:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBAA361607
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBAA361607;
	Sun, 24 Nov 2024 23:22:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EB27131
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E535B84E2B
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dx9G4XEvKZGP for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 23:22:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C00C584E29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C00C584E29
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C00C584E29
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:22:05 +0000 (UTC)
Received: from [10.158.53.209] (unknown [37.170.190.73])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id EAE25B0053D;
 Mon, 25 Nov 2024 00:21:59 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 <buildroot@buildroot.org>
CC: "Pierre-Jean Texier" <texier.pj2@gmail.com>
Date: Mon, 25 Nov 2024 00:22:00 +0100
Message-ID: <193607b65c0.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
References: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
User-Agent: AquaMail/1.53.0 (build: 105300523)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732490522;
 bh=zflH1qWzWiBtZ0lw/RbxCkS87burVyKAbRA7ocooYOo=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=o7M8OgPBsJp0N1a5wBLRZSY53Sm0RJrPtZsCFDAH7tSD/qe/iztJllbkfLv33q3Xw
 Rnlrv/HwkeAoE5yQ2nIlY69cul9UM8pT/SQhN/6IlCDM4DqAwh3dXhfokspgjTy5+E
 WZEhwCymcIsw0L0hjyucZrSLYooxVnmuhYHemeNdoDSstOVTCyMcmpNR7o4L+SyuIr
 yJgA6V0qgFAbT3N9OKsrJF6mMTjxPY9L6UELIwgNGVoni94MD9/LF/8wzZnZQFtlhn
 VLOJsRIjnxeoeSRJaNfsoH2ULFBkWL9ODzl6n+m7dOkYa7mYVldmSQkARZ/v4KO+N7
 6D4w+toZsTZVw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=o7M8OgPB
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: bump to version
 2024-11-15
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
Content-Type: multipart/mixed; boundary="===============7307881496308155919=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============7307881496308155919==
Content-Type: multipart/alternative; boundary="193607b66254a9b2856c05254b"

This is a multi-part message in MIME format.
--193607b66254a9b2856c05254b
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Giulio,

Le 24 novembre 2024 23:29:05 Giulio Benetti 
<giulio.benetti@benettiengineering.com> a écrit :

> It builds up to Linux 6.11.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> package/esp-hosted/esp-hosted.hash | 2 +-
> package/esp-hosted/esp-hosted.mk   | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/esp-hosted/esp-hosted.hash 
> b/package/esp-hosted/esp-hosted.hash
> index ea18c243d1..ac0164c38c 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
> # Locally calculated
> -sha256  78ab4f10ddce76749d36511591a0a7bb2a982db96ac1ea1b02b5c35dab725d8c  
> esp-hosted-91b093365cc58214532b976dd8749f65523d1e6d.tar.gz
> +sha256  7fd95a9b47c203a8bd0fdcab21f15c9d4cf1cad936f0206a94da0d932dd42206  
> esp-hosted-927a34f99724bb744efaf865a7c75cc1615f59a2.tar.gz
> sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  
> LICENSE
> diff --git a/package/esp-hosted/esp-hosted.mk 
> b/package/esp-hosted/esp-hosted.mk
> index 4efefc3023..f4382e7fee 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -4,7 +4,7 @@
> #
> ################################################################################
>
> -ESP_HOSTED_VERSION = 91b093365cc58214532b976dd8749f65523d1e6d
> +ESP_HOSTED_VERSION = 927a34f99724bb744efaf865a7c75cc1615f59a2

Did you try to request to the project for a proper tag/release ? It seems 
its git repo is activée, but without any tags for a while.

> ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
> ESP_HOSTED_DEPENDENCIES = linux
> ESP_HOSTED_LICENSE = GPL-2.0

LGTM, good to be merged

Reviewed-by: Vincent Jardin <vjardin@free.fr>

> --
> 2.39.5
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


--193607b66254a9b2856c05254b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi Giulio,</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 24 novembre 2024 23:29:05 Giulio Benetti &lt;giulio.be=
netti@benettiengineering.com&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">It builds up to Linux 6.11.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Giulio Benetti &lt;giulio.benetti@benettie=
ngineering.com&gt;</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;package/esp-hosted/esp-hosted.hash | 2 +-</div>
<div dir=3D"auto">&nbsp;package/esp-hosted/esp-hosted.mk &nbsp; | 2 +-</div=
>
<div dir=3D"auto">&nbsp;2 files changed, 2 insertions(+), 2 deletions(-)</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/package/esp-hosted/esp-hosted.hash b/package=
/esp-hosted/esp-hosted.hash</div>
<div dir=3D"auto">index ea18c243d1..ac0164c38c 100644</div>
<div dir=3D"auto">--- a/package/esp-hosted/esp-hosted.hash</div>
<div dir=3D"auto">+++ b/package/esp-hosted/esp-hosted.hash</div>
<div dir=3D"auto">@@ -1,3 +1,3 @@</div>
<div dir=3D"auto">&nbsp;# Locally calculated</div>
<div dir=3D"auto">-sha256 &nbsp;78ab4f10ddce76749d36511591a0a7bb2a982db96ac=
1ea1b02b5c35dab725d8c &nbsp;esp-hosted-91b093365cc58214532b976dd8749f65523d=
1e6d.tar.gz</div>
<div dir=3D"auto">+sha256 &nbsp;7fd95a9b47c203a8bd0fdcab21f15c9d4cf1cad936f=
0206a94da0d932dd42206 &nbsp;esp-hosted-927a34f99724bb744efaf865a7c75cc1615f=
59a2.tar.gz</div>
<div dir=3D"auto">&nbsp;sha256 &nbsp;ed57d96d27be775b22f9571d3724ef84e0d0b8=
f24b805ec7f87a32189de19a9c &nbsp;LICENSE</div>
<div dir=3D"auto">diff --git a/package/esp-hosted/esp-hosted.mk b/package/e=
sp-hosted/esp-hosted.mk</div>
<div dir=3D"auto">index 4efefc3023..f4382e7fee 100644</div>
<div dir=3D"auto">--- a/package/esp-hosted/esp-hosted.mk</div>
<div dir=3D"auto">+++ b/package/esp-hosted/esp-hosted.mk</div>
<div dir=3D"auto">@@ -4,7 +4,7 @@</div>
<div dir=3D"auto">&nbsp;#</div>
<div dir=3D"auto">&nbsp;###################################################=
#############################</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-ESP_HOSTED_VERSION =3D 91b093365cc58214532b976dd8749f655=
23d1e6d</div>
<div dir=3D"auto">+ESP_HOSTED_VERSION =3D 927a34f99724bb744efaf865a7c75cc16=
15f59a2</div></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Did you try to request to the project for a proper tag/release ? It seem=
s its git repo is activ=C3=A9e, but without any tags for a while.</div><div=
 dir=3D"auto"><br></div><div id=3D"aqm-original" style=3D"color: black;" di=
r=3D"auto"><blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin:=
 0 0 0 0.75ex; border-left: 1px solid #808080; padding-left: 0.75ex;"><div =
dir=3D"auto"></div>
<div dir=3D"auto">&nbsp;ESP_HOSTED_SITE =3D $(call github,espressif,esp-hos=
ted,$(ESP_HOSTED_VERSION))</div>
<div dir=3D"auto">&nbsp;ESP_HOSTED_DEPENDENCIES =3D linux</div>
<div dir=3D"auto">&nbsp;ESP_HOSTED_LICENSE =3D GPL-2.0</div></blockquote></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">LGTM, good to be merged&n=
bsp;</div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Vincen=
t Jardin &lt;vjardin@free.fr&gt;</div><div dir=3D"auto"><br></div><div id=
=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquote type=3D"=
cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px=
 solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">--&nbsp;</div>
<div dir=3D"auto">2.39.5</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">buildroot mailing list</div>
<div dir=3D"auto">buildroot@buildroot.org</div>
<div dir=3D"auto">https://lists.buildroot.org/mailman/listinfo/buildroot</d=
iv>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--193607b66254a9b2856c05254b--


--===============7307881496308155919==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7307881496308155919==--

