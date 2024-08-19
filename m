Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C2EC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 22:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CA7D60868;
	Mon, 19 Aug 2024 22:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWmQP2m8KtQr; Mon, 19 Aug 2024 22:20:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25B6260839
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25B6260839;
	Mon, 19 Aug 2024 22:20:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 22D3E1BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D5E74026D
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:20:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a575bxmXUlZY for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 22:20:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A44B400AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A44B400AF
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A44B400AF
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 22:20:30 +0000 (UTC)
Received: from [192.168.128.62] (unknown [93.7.88.243])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9DCD019F574;
 Tue, 20 Aug 2024 00:20:25 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Aug 2024 00:20:25 +0200
Message-ID: <1916cba2828.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <20240817102923.18f56e24@windsurf>
References: <20240815212658.48933-1-vjardin@free.fr>
 <20240817102923.18f56e24@windsurf>
User-Agent: AquaMail/1.51.5 (build: 105105504)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724106028;
 bh=IoMc//McgDw1775T7CLqrMnfiC43SL4h+184kKnj+S4=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=SNuCAd4QHHF9UG5vMsyMbcAyYxWtmUu3o/hx5isajhw35Kd4lrGP0neCo8n/nBTjE
 vsH3Z6RDl4uU5rIZFq+YJPaMwTQ4eI5qA7n/RmFpZxyHz5CUed4OUXtoZ9fExj5lrm
 yXQONnHibev+6OY9BYbMrcqs01rBVqV3+gqlNnlck3BJvF+DgxjKrr47KCvoDtOgEs
 ZoTmjj9SzQzPqL+pT9rkprITcEidaqqEwKKYtpcaWOGsHTA17fx587FwvBt0zI9k+V
 iWqIB8K3v1oxXIJYRTMMbqBxZ7mv8xCgSWToKWjdfhth7u2QbXpEIDagDBY19wJ49N
 9yWvPRkzrbbww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SNuCAd4Q
Subject: Re: [Buildroot] [PATCH 1/1] package/dpdk: add 24.03
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7905770878100449766=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============7905770878100449766==
Content-Type: multipart/alternative; boundary="1916cba29f12c6d28563357852"

This is a multi-part message in MIME format.
--1916cba29f12c6d28563357852
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Thomas,

Le 17 août 2024 10:29:25 Thomas Petazzoni <thomas.petazzoni@bootlin.com> a 
écrit :

> Hello Vincent,
>
> Thanks for your patch, nice to see a Buildroot patch from you! See some
> comments below.

You welcome ;) You did help me to bootstrap, now I can follow up with some 
contributions.

>
>
> On Thu, 15 Aug 2024 23:26:58 +0200
> Vincent Jardin <vjardin@free.fr> wrote:
>
>> Importantly, this commit does not enforce the use of UIO or VFIO
>> kernel frameworks, as DPDK's architecture supports userland memory
>> mappings that do not require these technologies. By maintaining this
>> flexibility, DPDK can operate with a broader range of hardware and
>> software configurations, making it suitable for diverse Buildroot's
>> deployment scenarios.
>
> Do you intend to follow-up with additional patches supporting the other
> use-cases?

Yes I will but first I'd like to iterate with some early steps. See the v2. 
Once merge, I'll keep adding more cases.

Meanwhile, there is a build CI on github for some early checks:
    https://github.com/vjardin/br_dpdk/actions

Best regards,
  Vincent

--1916cba29f12c6d28563357852
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi Thomas,</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 17 ao=C3=BBt 2024 10:29:25 Thomas Petazzoni &lt;thomas=
.petazzoni@bootlin.com&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hello Vincent,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Thanks for your patch, nice to see a Buildroot patch from=
 you! See some</div>
<div dir=3D"auto">comments below.</div></blockquote></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">You welcome ;) You did help me to bootstrap, n=
ow I can follow up with some contributions.</div><div dir=3D"auto"><br></di=
v><div id=3D"aqm-original" style=3D"color: black;" dir=3D"auto"><blockquote=
 type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75ex; border-=
left: 1px solid #808080; padding-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Thu, 15 Aug 2024 23:26:58 +0200</div>
<div dir=3D"auto">Vincent Jardin &lt;vjardin@free.fr&gt; wrote:</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Importantly, this commit does not enforce the use of UIO =
or VFIO</div>
<div dir=3D"auto">kernel frameworks, as DPDK's architecture supports userla=
nd memory</div>
<div dir=3D"auto">mappings that do not require these technologies. By maint=
aining this</div>
<div dir=3D"auto">flexibility, DPDK can operate with a broader range of har=
dware and</div>
<div dir=3D"auto">software configurations, making it suitable for diverse B=
uildroot's</div>
<div dir=3D"auto">deployment scenarios.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Do you intend to follow-up with additional patches suppor=
ting the other</div>
<div dir=3D"auto">use-cases?</div></blockquote></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">Yes I will but first I'd like to iterate with some =
early steps. See the v2. Once merge, I'll keep adding more cases.</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">Meanwhile, there is a build CI on=
 github for some early checks:</div><div dir=3D"auto">    <a href=3D"https:=
//github.com/vjardin/br_dpdk/actions">https://github.com/vjardin/br_dpdk/ac=
tions</a></div><div dir=3D"auto"><br></div><div dir=3D"auto">Best regards,<=
/div><div dir=3D"auto">&nbsp; Vincent&nbsp;</div>
</div></body>
</html>

--1916cba29f12c6d28563357852--


--===============7905770878100449766==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7905770878100449766==--

