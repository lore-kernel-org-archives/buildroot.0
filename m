Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08465D3B7C7
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 23:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9854A60816;
	Sun, 24 Nov 2024 23:24:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zdM6JJcQ5dGa; Sun, 24 Nov 2024 23:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98760615B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98760615B8;
	Sun, 24 Nov 2024 23:24:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C4F0E11
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE9FE4338E
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:24:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1u-1_SCf4Wk for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 23:24:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 775154335C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 775154335C
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 775154335C
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:24:01 +0000 (UTC)
Received: from [10.158.53.209] (unknown [37.170.190.73])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1A9B9B0051E;
 Mon, 25 Nov 2024 00:23:56 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 <buildroot@buildroot.org>
CC: "Pierre-Jean Texier" <texier.pj2@gmail.com>
Date: Mon, 25 Nov 2024 00:23:57 +0100
Message-ID: <193607d2ec8.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <20241124222844.162887-2-giulio.benetti@benettiengineering.com>
References: <20241124222844.162887-1-giulio.benetti@benettiengineering.com>
 <20241124222844.162887-2-giulio.benetti@benettiengineering.com>
User-Agent: AquaMail/1.53.0 (build: 105300523)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732490639;
 bh=cvIbK8vmoSEXCq9fZO+FGmT6TTi3g9XoZxuhXMiMoS0=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=fAEuE9AurH8pUJFAk2sq6BfDJfQBYHof1FvNqTW09QP1zz8zPkca8ORvUDBxWoZd2
 +B7VIFjr0NHoNMkzku+4vgVaTvBNEvXPguC7yvxBqwy3MuptSv/qWHE+pDmh+FpNRE
 cO3lEmBsdINJtgu3pBFk6W/zPVvVrS4Qp9CkqVDhZL2j5vvD6/F+sw+f3g11ikRBPc
 3V/rgeX1wUmlugEiFN+o0/uYCbxRG4tbz7IzKFP7Tf7QmijqLvSqM8VP7DpKzuDB5U
 GxyGEBMh3BzyWVBCFize55g8Q9xJ3GtCWGF63+Loy92mBWm+ZJy5t6OViEmJ0Mzam8
 iwsb2wDU5EtVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fAEuE9Au
Subject: Re: [Buildroot] [PATCH] package/mongoose: bump to version 7.16
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
Content-Type: multipart/mixed; boundary="===============1238904749956294117=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============1238904749956294117==
Content-Type: multipart/alternative; boundary="193607d30dd4a9b28566a61cd9"

This is a multi-part message in MIME format.
--193607d30dd4a9b28566a61cd9
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Giulio,

Le 24 novembre 2024 23:29:05 Giulio Benetti 
<giulio.benetti@benettiengineering.com> a écrit :

> https://github.com/cesanta/mongoose/releases/tag/7.16
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

LGTM

Reviewed-by: Vincent Jardin <vjardin@free.fr>

> ---
> package/mongoose/mongoose.hash | 2 +-
> package/mongoose/mongoose.mk   | 2 +-
> 2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/mongoose/mongoose.hash b/package/mongoose/mongoose.hash
> index 6e8d1e3804..15aa2b35ba 100644
> --- a/package/mongoose/mongoose.hash
> +++ b/package/mongoose/mongoose.hash
> @@ -1,3 +1,3 @@
> # Locally computed:
> -sha256  efcb5aa89b85d40373dcff3241316ddc0f2f130ad7f05c9c964f8cc1e2078a0b  
> mongoose-7.15.tar.gz
> +sha256  f2c42135f7bc34b3d10b6401e9326a20ba5dd42d4721b6a526826ba31c1679fd  
> mongoose-7.16.tar.gz
> sha256  7e2bc5dabbc27b431a530540161ba860906f12109d4b84b1e4bc8879f1afc3bc  
> LICENSE
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index e3c57c8e8a..9ec6423e93 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -4,7 +4,7 @@
> #
> ################################################################################
>
> -MONGOOSE_VERSION = 7.15
> +MONGOOSE_VERSION = 7.16
> MONGOOSE_SITE = $(call github,cesanta,mongoose,$(MONGOOSE_VERSION))
> MONGOOSE_LICENSE = GPL-2.0
> MONGOOSE_LICENSE_FILES = LICENSE
> --
> 2.39.5
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


--193607d30dd4a9b28566a61cd9
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
<div dir=3D"auto">https://github.com/cesanta/mongoose/releases/tag/7.16</di=
v>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Giulio Benetti &lt;giulio.benetti@benettie=
ngineering.com&gt;</div></blockquote></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">LGTM&nbsp;</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Reviewed-by: Vincent Jardin &lt;vjardin@free.fr&gt;</div><div dir=3D"auto"=
><br></div><div id=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><b=
lockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex=
; border-left: 1px solid #808080; padding-left: 0.75ex;"><div dir=3D"auto">=
</div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;package/mongoose/mongoose.hash | 2 +-</div>
<div dir=3D"auto">&nbsp;package/mongoose/mongoose.mk &nbsp; | 2 +-</div>
<div dir=3D"auto">&nbsp;2 files changed, 2 insertions(+), 2 deletions(-)</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/package/mongoose/mongoose.hash b/package/mon=
goose/mongoose.hash</div>
<div dir=3D"auto">index 6e8d1e3804..15aa2b35ba 100644</div>
<div dir=3D"auto">--- a/package/mongoose/mongoose.hash</div>
<div dir=3D"auto">+++ b/package/mongoose/mongoose.hash</div>
<div dir=3D"auto">@@ -1,3 +1,3 @@</div>
<div dir=3D"auto">&nbsp;# Locally computed:</div>
<div dir=3D"auto">-sha256 &nbsp;efcb5aa89b85d40373dcff3241316ddc0f2f130ad7f=
05c9c964f8cc1e2078a0b &nbsp;mongoose-7.15.tar.gz</div>
<div dir=3D"auto">+sha256 &nbsp;f2c42135f7bc34b3d10b6401e9326a20ba5dd42d472=
1b6a526826ba31c1679fd &nbsp;mongoose-7.16.tar.gz</div>
<div dir=3D"auto">&nbsp;sha256 &nbsp;7e2bc5dabbc27b431a530540161ba860906f12=
109d4b84b1e4bc8879f1afc3bc &nbsp;LICENSE</div>
<div dir=3D"auto">diff --git a/package/mongoose/mongoose.mk b/package/mongo=
ose/mongoose.mk</div>
<div dir=3D"auto">index e3c57c8e8a..9ec6423e93 100644</div>
<div dir=3D"auto">--- a/package/mongoose/mongoose.mk</div>
<div dir=3D"auto">+++ b/package/mongoose/mongoose.mk</div>
<div dir=3D"auto">@@ -4,7 +4,7 @@</div>
<div dir=3D"auto">&nbsp;#</div>
<div dir=3D"auto">&nbsp;###################################################=
#############################</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-MONGOOSE_VERSION =3D 7.15</div>
<div dir=3D"auto">+MONGOOSE_VERSION =3D 7.16</div>
<div dir=3D"auto">&nbsp;MONGOOSE_SITE =3D $(call github,cesanta,mongoose,$(=
MONGOOSE_VERSION))</div>
<div dir=3D"auto">&nbsp;MONGOOSE_LICENSE =3D GPL-2.0</div>
<div dir=3D"auto">&nbsp;MONGOOSE_LICENSE_FILES =3D LICENSE</div>
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

--193607d30dd4a9b28566a61cd9--


--===============1238904749956294117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1238904749956294117==--

