Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D359D3B7C2
	for <buildroot@archiver.kernel.org>; Sun, 24 Nov 2024 23:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BD2C60816;
	Sun, 24 Nov 2024 23:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVdpPoRT54bL; Sun, 24 Nov 2024 23:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DB1660865
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB1660865;
	Sun, 24 Nov 2024 23:25:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C0F31
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:25:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64F3E60B4F
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:25:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCWGSQiI-CYe for <buildroot@buildroot.org>;
 Sun, 24 Nov 2024 23:25:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3E2B860816
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E2B860816
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E2B860816
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 23:25:17 +0000 (UTC)
Received: from [10.158.53.209] (unknown [37.170.190.73])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B01B5B0055E;
 Mon, 25 Nov 2024 00:25:12 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 <buildroot@buildroot.org>
CC: Joseph Kogut <joseph.kogut@gmail.com>
Date: Mon, 25 Nov 2024 00:25:12 +0100
Message-ID: <193607e53c0.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <20241124224134.351652-1-giulio.benetti@benettiengineering.com>
References: <20241124224134.351652-1-giulio.benetti@benettiengineering.com>
User-Agent: AquaMail/1.53.0 (build: 105300523)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732490715;
 bh=ruplfByWR/j2v+RBNrjRtzUeEM7G2ZoggFGcguf1cEw=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=r8OqTXKxwpry0OXmXmerfmqZZ7NLvy25cznUy8tXHA37AVM8etdr3Cxozr8nGOWEL
 Ho2HJDaWWEGNld7zL2EZXtFhA7HHGuU8lPHhSgGYwxgifXoL2KqnV9fdVVMiYtNbpF
 b5/AEwRHbuWRP0xN3JgBQ/p5ICGVg71g4Pk3mZj0o4dx8OQYpNiEOm0lGbsGDyXeuJ
 7ncr40FpsAWnGWXMdnVSqkndgrKlTnXeoJBsoKBba1IguVIwk3RKXssIwdD7CcEZRB
 H/XKS8RMsT3WJL+9kztKWGVKYMGA9OUBd9n7Gm3oiQSBBWqr4tahGSWR4gqQ/CPsJo
 HITI8pLsuzywQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=r8OqTXKx
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.107
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
Content-Type: multipart/mixed; boundary="===============3238909825077928818=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============3238909825077928818==
Content-Type: multipart/alternative; boundary="193607e56db4a9b28566fc555"

This is a multi-part message in MIME format.
--193607e56db4a9b28566fc555
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Giulio,

Le 24 novembre 2024 23:41:55 Giulio Benetti 
<giulio.benetti@benettiengineering.com> a écrit :

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

LGTM

Reviewed-by: Vincent Jardin <vjardin@free.fr>

> ---
> package/libnss/libnss.hash | 4 ++--
> package/libnss/libnss.mk   | 2 +-
> 2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
> index 36e2296d38..fe29029633 100644
> --- a/package/libnss/libnss.hash
> +++ b/package/libnss/libnss.hash
> @@ -1,4 +1,4 @@
> -# From 
> https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_106_RTM/src/SHA256SUMS
> -sha256  026b744e1e0784b890c3846ac9506472a92138c1f4d41dec581949574c585c38  
> nss-3.106.tar.gz
> +# From 
> https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_107_RTM/src/SHA256SUMS
> +sha256  7f7e96473e38150771a615f5d40e8c41ba3a19385301ae0c525091f2fc9d6729  
> nss-3.107.tar.gz
> # Locally calculated
> sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  
> nss/COPYING
> diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
> index 35cfd0edb1..8f2da4a5c4 100644
> --- a/package/libnss/libnss.mk
> +++ b/package/libnss/libnss.mk
> @@ -4,7 +4,7 @@
> #
> ################################################################################
>
> -LIBNSS_VERSION = 3.106
> +LIBNSS_VERSION = 3.107
> LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
> LIBNSS_SITE = 
> https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst 
> .,_,$(LIBNSS_VERSION))_RTM/src
> LIBNSS_DISTDIR = dist
> --
> 2.39.5
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


--193607e56db4a9b28566fc555
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi Giulio,</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 24 novembre 2024 23:41:55 Giulio Benetti &lt;giulio.be=
netti@benettiengineering.com&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Signed-off-by: Giulio Benetti &lt;giulio.benetti@benettie=
ngineering.com&gt;</div></blockquote></div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">LGTM</div><div dir=3D"auto"><br></div><div dir=3D"auto">Revie=
wed-by: Vincent Jardin &lt;vjardin@free.fr&gt;</div><div dir=3D"auto"><br><=
/div><div id=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockqu=
ote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; bord=
er-left: 1px solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto">---</div>
<div dir=3D"auto">&nbsp;package/libnss/libnss.hash | 4 ++--</div>
<div dir=3D"auto">&nbsp;package/libnss/libnss.mk &nbsp; | 2 +-</div>
<div dir=3D"auto">&nbsp;2 files changed, 3 insertions(+), 3 deletions(-)</d=
iv>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/package/libnss/libnss.hash b/package/libnss/=
libnss.hash</div>
<div dir=3D"auto">index 36e2296d38..fe29029633 100644</div>
<div dir=3D"auto">--- a/package/libnss/libnss.hash</div>
<div dir=3D"auto">+++ b/package/libnss/libnss.hash</div>
<div dir=3D"auto">@@ -1,4 +1,4 @@</div>
<div dir=3D"auto">-# From https://ftp.mozilla.org/pub/security/nss/releases=
/NSS_3_106_RTM/src/SHA256SUMS</div>
<div dir=3D"auto">-sha256 &nbsp;026b744e1e0784b890c3846ac9506472a92138c1f4d=
41dec581949574c585c38 &nbsp;nss-3.106.tar.gz</div>
<div dir=3D"auto">+# From https://ftp.mozilla.org/pub/security/nss/releases=
/NSS_3_107_RTM/src/SHA256SUMS</div>
<div dir=3D"auto">+sha256 &nbsp;7f7e96473e38150771a615f5d40e8c41ba3a1938530=
1ae0c525091f2fc9d6729 &nbsp;nss-3.107.tar.gz</div>
<div dir=3D"auto">&nbsp;# Locally calculated</div>
<div dir=3D"auto">&nbsp;sha256 &nbsp;a20c1a32d1f8102432360b42e932869f7c11c7=
cdbacf9cac554c422132af47f4 &nbsp;nss/COPYING</div>
<div dir=3D"auto">diff --git a/package/libnss/libnss.mk b/package/libnss/li=
bnss.mk</div>
<div dir=3D"auto">index 35cfd0edb1..8f2da4a5c4 100644</div>
<div dir=3D"auto">--- a/package/libnss/libnss.mk</div>
<div dir=3D"auto">+++ b/package/libnss/libnss.mk</div>
<div dir=3D"auto">@@ -4,7 +4,7 @@</div>
<div dir=3D"auto">&nbsp;#</div>
<div dir=3D"auto">&nbsp;###################################################=
#############################</div>
<div dir=3D"auto">&nbsp;</div>
<div dir=3D"auto">-LIBNSS_VERSION =3D 3.106</div>
<div dir=3D"auto">+LIBNSS_VERSION =3D 3.107</div>
<div dir=3D"auto">&nbsp;LIBNSS_SOURCE =3D nss-$(LIBNSS_VERSION).tar.gz</div=
>
<div dir=3D"auto">&nbsp;LIBNSS_SITE =3D https://ftp.mozilla.org/pub/mozilla=
.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src</div>
<div dir=3D"auto">&nbsp;LIBNSS_DISTDIR =3D dist</div>
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

--193607e56db4a9b28566fc555--


--===============3238909825077928818==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3238909825077928818==--

