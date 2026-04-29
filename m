Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22366FF8875
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 18:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D55E3425A2;
	Wed, 29 Apr 2026 18:52:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ycrcvc8SRjOC; Wed, 29 Apr 2026 18:52:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C751C425A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777488777;
	bh=Ki86ccDyeZXXTg3u32kVPL7kZQnPT6t4K88tXwf4Eaw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RBHFO6gdScC/1Iz9VPvXerOaJwCBuQV7ENNJVL/4YAB19ReptchehR0wOgjb0yiLE
	 6EVzO7byLwvL6pp2g/mztyniUeTGA/xzoZUMeE09GCYOUZCs0UFCTKwRE2DsJyXvNK
	 43+kz2EbeJjjmdcgamQdXe1q3QLCKf2vf3k7co/ASAly3/RsKTR8scrGHxK2FScDZt
	 qQNlJsKC7nQTygEpjVSPWeXpP8wCbLUw8P3FkHS7zUL/oIN0tJ7qyuhJ8pPPmaCPjl
	 xRNCR9wzd0k0ej9lwp4t7bles4zFncbYsBdujETt5ICzXgHdCCmHWgm8KSaPTTMkUi
	 SoUUz31lxJDRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C751C425A3;
	Wed, 29 Apr 2026 18:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2635418F
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B0C284558
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAGzLts5yeOx for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 18:52:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E2ABA8455A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2ABA8455A
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2ABA8455A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 18:52:53 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6634bb959a2so207427a12.1
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 11:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777488772; cv=none;
 d=google.com; s=arc-20240605;
 b=DCr4fGhNXbY+uwcBxCCzTyCnlQTZjmWNmybc2dMyJsY8HSP+SP8UEdqZksI2+lKSPf
 9HgXCARzdjejRANkR+04ZWqrRWaa5lFdT+4tSyw5hrc3fD0gXMw6jaoWkSzDKIDMPKim
 tV6dD7bRR88lPQCTh7VHXIS7/YoMOhP1QkpUgVRMELlOCqX7We1l5qjoeAQUb3U4Uh+6
 tg8OQkis9IBpn1G8EUBezapXvQlwrRQHOA8j4PGcTGeBX3dOTDackDe5ddRzp32tbgXE
 IKX2TIFoz8SSHHoV1cPHVrQS3DA4xpnfN+c/eqQWi7BM1v9rfGf+6mmwIcSaZDN62cj4
 F/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=P/FU3IMBNsl5fwDII1dBIleRdi3aNH3XELXOvCSvzJo=;
 fh=MxYKY3/PK0hPFBKBQ41TkJmgH3foJW/bclTr9JgX30I=;
 b=VVsTCjxf1/OKzVVm+lTQAAr5XtBiGHxbvkKVS9vCxCI54c3q8jKiPLkHwU8/rrj0fn
 cOHru5T+foIvh12F75Mly8yo5z4WfFJT3qgSLeOWFHYOh+QQfh1UFoB/wTsI1TXASCKL
 7OtD2CAEUHBEgt77tcKoFCsHcS7Ka+l4mb7jS+obSWxipvJukR7CpxEjqmSA1AROHDjo
 9gdRx3egZZF4779MuIFFEN0fIOFoNaJLHJXgV4xFNr+l44FttzKRSxuca7sIH96NPL7d
 b8DFFHRr92SILkoUKYof2brEsHoo9rg42SYP/cqbbL2n75j+6nmMjx2QWSeZoaZZYU9l
 M2Sg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777488772; x=1778093572;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P/FU3IMBNsl5fwDII1dBIleRdi3aNH3XELXOvCSvzJo=;
 b=E68rYSuccpB00yJnMwcF8UWsJ5O5Jnlj16ojGzaFp+W0oO/OSJlWsb3zdNXG9ny6/n
 +8LVhX5rOrRBSnaBurOILmWOHd+z8hoSxY62LBGOPmrWgko24NAdto3V+A8KvMmSk8uH
 gTuB5Va7hYzI5tOuEMF8HThBZc2L0jHKx66fX1q7wy/0dASUIpm9mQpXJb3eXdN8tGJn
 ANvq2+1NmzKQsr4LHQQE2Zu4Q4TpszT0wI8lc6w1XDgaU/nnQUWxj2xRm8skTMti1zf/
 RwLLN70kKBs+yftz+muvs0F420t+rLzMVZEJNbTceYs0FRnnxXubR9w750/3NRVrafkg
 e+MQ==
X-Gm-Message-State: AOJu0YzWcwKlPbx+Y8PpRl3t0DvGFxiVs53Qw5XLkVjpFmuN/Oq92Wq2
 wefwd1QagQc2haDI3nVmyE8rEwKu7cdtJvgrh5Gbap/N+BW4wP6G7xvw8QmYbFuT2VZQMPetETS
 UJnLZW+ghWvyAqFitxn4NTGWZPbD8slMhoB1T
X-Gm-Gg: AeBDieu2y8oEilr1oCf1gLJwo0NLeqjoQ152FlSDvxGu7mOD//15gWEmFuSymhh1ZUM
 /t0sKAGi9MqYVCSDEmKvavXEF+N6HPSGDZY/FuV6amLMFMiJzRwoLPSwAI2semdCpAQXlLkYdNU
 CTDue0UT259bTN0OjvhC0OzO04Lyzolhd4PPTEFMopMc1Y6EDQTZIW14rkr1KR/SBcLFabYrXSJ
 o90moCmuNcjYf3QVeAHs8LuOF8N91RVWRzt3U8GvdN5tw0JJQAJFQW8H0AvrBdCj03PR/cajG39
 8Q5v0divTfxXfWj3Hv44Jga98FEalYvBNAfvGhmp5LoCjXzkYOY=
X-Received: by 2002:a05:6402:1110:b0:678:459a:774 with SMTP id
 4fb4d7f45d1cf-67b1fdb14b7mr2359526a12.11.1777488770654; Wed, 29 Apr 2026
 11:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260418073313.37718-1-chakrabortyshubham66@gmail.com>
 <20260429170808.1144652-1-chakrabortyshubham66@gmail.com>
 <cb7dd067-e4be-4a93-8e0d-7735aacef28a@bubu1.eu>
In-Reply-To: <cb7dd067-e4be-4a93-8e0d-7735aacef28a@bubu1.eu>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 30 Apr 2026 00:22:38 +0530
X-Gm-Features: AVHnY4KnzAbf6fC1PQxewv5BMLG9NaEMMvdgO0DWnEREY9Ec7h5wtlWqUNLLgms
Message-ID: <CABvxksxG=u=cv2X+mp9sxmjXu_P+myhv6A4xtsOrkbnYg-dkTA@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Buildroot List <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777488772; x=1778093572; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P/FU3IMBNsl5fwDII1dBIleRdi3aNH3XELXOvCSvzJo=;
 b=MKqMFS0/1ueH212fD6VkaFkrAFW1J/BtA5ELLVZYqkQrTBWr5f4qtusznULPW+9nCU
 7alGwvD3fL5a/Py4lZx7+dE6JzTG+V0hoye8B0UibpuZ7P5OxSGZvZKjExpUUyOG9WFc
 NH+3ItRUIcS3Hy7So3t2mu91RmGfTaayI+aJrDaBxon7IkafuMaUEfjXH3RO61SqhhhA
 InrKvbrtony2296H7Kqkmxga1LIwlLJPHOQxVVdmtm9rBLns10+3fnX2jQKOOQewli8H
 u/pr00dxymb/2us7rOsbHU5U44kad7nB0t508uUAtWgS7B4ErLcfUGjh6Yd+Z8CbtLZx
 xtRQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=MKqMFS0/
Subject: Re: [Buildroot] [PATCH] package/nginx: bump to version 1.29.7
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
Content-Type: multipart/mixed; boundary="===============8526218541370412746=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8526218541370412746==
Content-Type: multipart/alternative; boundary="000000000000c4687106509dda2f"

--000000000000c4687106509dda2f
Content-Type: text/plain; charset="UTF-8"

Hi Marcus,

My mistake on the version choice. I missed the latest mainline and stable
releases.

I will update the commit title to reflect the security fixes.

Regarding the version, I thought bumping to the latest available release
(1.29.7) was the goal, but I see the preference for 1.28.3 first, given
Bernd's patch.

I will withdraw this patch and prepare a new one for 1.28.3, ensuring the
security fixes are noted in the subject.

Best regards,
Shubham

On Thu, 30 Apr, 2026, 12:19 am Marcus Hoffmann, <buildroot@bubu1.eu> wrote:

> Hi Shubham,
>
> On 4/29/26 19:08, Shubham Chakraborty wrote:
> > - Security fixes: CVE-2026-27654, CVE-2026-27784, CVE-2026-32647,
> >    CVE-2026-27651, CVE-2026-28753, CVE-2026-28755
>
> If this version bump fixes security issues, it should be marked as such
> in the commit title.
>
> > - Feature: Multipath TCP support via "multipath" parameter
> > - Feature: "local" parameter of the "keepalive" directive in upstream
> block
> > - Change: keepalive in upstream block now enabled by default
> > - Change: ngx_http_proxy_module supports keepalive by default;
> >    default proxy_http_version is now "1.1"; Connection header not sent
> by default
> > - Bugfix: invalid HTTP/2 request after switching to next upstream
> >    with buffered body in ngx_http_grpc_module
> > - Fix bootlin-sparc-uclibc build by adding -latomic when needed this
> caused
> >    build errors in "bootlin-sparc-uclibc [24/32]: FAILED"
> >
> > https://nginx.org/en/CHANGES
>
> I don't understand why you are updating this to 1.29.7 though. The
> latest *mainline* version is 1.29.8, which was released over 3 weeks
> ago. But also we are currently deliberately using the *stable* releases
> of nginx[1], which also recently got a new release with 1.30.0.
> Bernd already sent a patch for updating to that[2], but I think we
> should update to 1.28.3 before.
>
>
> [1]
>
> https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-open-source/#stable-and-mainline-versions
> [2] https://patchwork.ozlabs.org/comment/3683711/
>
> >
> > Tested Using:
> > - utils/test-pkg -a -p nginx
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> Best,
> Marcus
>

--000000000000c4687106509dda2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span>Hi Marcus,<br><br>My mistake on the version choice.=
 I missed the latest mainline and stable releases.<br><br>I will update the=
 commit title to reflect the security fixes.<br><br>Regarding the version, =
I thought bumping to the latest available release (1.29.7) was the goal, bu=
t I see the preference for 1.28.3 first, given Bernd&#39;s patch.<br><br>I =
will withdraw this patch and prepare a new one for 1.28.3, ensuring the sec=
urity fixes are noted in the subject.<br><br>Best regards,<br>Shubham</span=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Thu, 30 Apr, 2026, 12:19 am Marcus Hoffmann, &lt;<a href=3D"mailto:buil=
droot@bubu1.eu" target=3D"_blank" rel=3D"noreferrer">buildroot@bubu1.eu</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi Shubham,<br>
<br>
On 4/29/26 19:08, Shubham Chakraborty wrote:<br>
&gt; - Security fixes: CVE-2026-27654, CVE-2026-27784, CVE-2026-32647,<br>
&gt;=C2=A0 =C2=A0 CVE-2026-27651, CVE-2026-28753, CVE-2026-28755<br>
<br>
If this version bump fixes security issues, it should be marked as such <br=
>
in the commit title.<br>
<br>
&gt; - Feature: Multipath TCP support via &quot;multipath&quot; parameter<b=
r>
&gt; - Feature: &quot;local&quot; parameter of the &quot;keepalive&quot; di=
rective in upstream block<br>
&gt; - Change: keepalive in upstream block now enabled by default<br>
&gt; - Change: ngx_http_proxy_module supports keepalive by default;<br>
&gt;=C2=A0 =C2=A0 default proxy_http_version is now &quot;1.1&quot;; Connec=
tion header not sent by default<br>
&gt; - Bugfix: invalid HTTP/2 request after switching to next upstream<br>
&gt;=C2=A0 =C2=A0 with buffered body in ngx_http_grpc_module<br>
&gt; - Fix bootlin-sparc-uclibc build by adding -latomic when needed this c=
aused<br>
&gt;=C2=A0 =C2=A0 build errors in &quot;bootlin-sparc-uclibc [24/32]: FAILE=
D&quot;<br>
&gt; <br>
&gt; <a href=3D"https://nginx.org/en/CHANGES" rel=3D"noreferrer noreferrer =
noreferrer" target=3D"_blank">https://nginx.org/en/CHANGES</a><br>
<br>
I don&#39;t understand why you are updating this to 1.29.7 though. The <br>
latest *mainline* version is 1.29.8, which was released over 3 weeks <br>
ago. But also we are currently deliberately using the *stable* releases <br=
>
of nginx[1], which also recently got a new release with 1.30.0.<br>
Bernd already sent a patch for updating to that[2], but I think we <br>
should update to 1.28.3 before.<br>
<br>
<br>
[1] <br>
<a href=3D"https://docs.nginx.com/nginx/admin-guide/installing-nginx/instal=
ling-nginx-open-source/#stable-and-mainline-versions" rel=3D"noreferrer nor=
eferrer noreferrer" target=3D"_blank">https://docs.nginx.com/nginx/admin-gu=
ide/installing-nginx/installing-nginx-open-source/#stable-and-mainline-vers=
ions</a><br>
[2] <a href=3D"https://patchwork.ozlabs.org/comment/3683711/" rel=3D"norefe=
rrer noreferrer noreferrer" target=3D"_blank">https://patchwork.ozlabs.org/=
comment/3683711/</a><br>
<br>
&gt; <br>
&gt; Tested Using:<br>
&gt; - utils/test-pkg -a -p nginx<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" rel=3D"noreferrer noreferrer" target=3D"_blank">chakrabo=
rtyshubham66@gmail.com</a>&gt;<br>
&gt; ---<br>
Best,<br>
Marcus<br>
</blockquote></div>

--000000000000c4687106509dda2f--

--===============8526218541370412746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8526218541370412746==--
