Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12130D12674
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 21:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D399060D74;
	Tue,  2 Dec 2025 21:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8afe8DrvHKsv; Tue,  2 Dec 2025 21:35:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F20E260D92
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764711312;
	bh=I/cwR3zIpN6wECvYpzqVei6xqtxTppky7/FkoVXqxB8=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fsE8RZxoKq7+n+7rPZsUBLSrz8DzgbVTUBa6M7QAP8va1vhys6gdN1MpCScmwZlf2
	 +efN8/yGNW8YeGSA1Y5gGQmdqHATlno3nGAlM1OjF4mjG4AHF0iwr7amSo5GFW7vAJ
	 aHAEC4gBUYBGvGO5zB+ioVI29HjqFjuS9kh2qEG7sZgD5fQn0b35/lhqBIWAE4YGzH
	 xxe22KzyX9JgEeDth6cDQWOlc1safd8BQFew224bA8UhMathVZ0c8rGIHbMMCm+mGq
	 Ri8upxHqc8enJ88YbnNFJ+w03ai+pm28ZiBPNGr7gxxizF8O4idC2njVRS7oNZyt/n
	 D8h7uIYFPXDng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F20E260D92;
	Tue,  2 Dec 2025 21:35:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 622D5D3
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5042B410FA
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4VkFkXcRwiT for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 21:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=nhed@starry.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75524410F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75524410F9
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75524410F9
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 21:35:09 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42e2e47be25so1829860f8f.2
 for <buildroot@buildroot.org>; Tue, 02 Dec 2025 13:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764711307; x=1765316107;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+lMTlpEZCjI2R3CLtM7Fxi0zrYSmcCrBV+KIbX9Rs90=;
 b=mj/kEFLs5ZuVVYv+YxE1SqfqIYF3Sbm+eDGZTXItSTd7X3KpARm4nE4iPD+RG5DO4/
 arfGLTHLoCayrGRWAkP+SVN/nd0TBxOujffn7mqr4UuJlw9Kjk1A9IjNecLFbZgiI/yK
 dHMln1DpOhG+13njZS65PNZRGisMluwnhdcm4TPs2m/Vv7kE850fWfOKLhvNICfgoh2B
 xyKlW+bW1MmuGAUThgb9yyx9eThqi3E2epNBbIFvXnOqFCwxx9/q4Xd4SPNfuhZEqVCz
 AcpzXkRA3ueZhPNsVMgbtywin5qP1m1t4c8T5JXwXxk666WXdM0s+jOJ6abkvEevVdf9
 Hx0w==
X-Gm-Message-State: AOJu0YyirGFjIfyFN4wEukenl7/uvB4kI7gyLPtYvbYYPuLX3wKgdOts
 m0yZ8Pd4gsrAQIPuqbGltTtwA3xDinwgTxerlKGfxl4HxiZmqUQ4GP0Vv/sgDOxDhzgYi2Sa0g+
 SaW5Bncn42mkie77XUHO7kqHso3Gxs460CkAcXTdVng==
X-Gm-Gg: ASbGnctybu4Ha3629Zfw98StdCk8GmXFJRJEt/5UNcrEIF359T+2EABUl+JbBqmig/l
 A6/JiomijU/XWlo04hIvJgHu+p/IYdIEuqvkmDd6M35rOW2G+a9f+fhOl6yuD3iKZ191NsYq6r3
 Eq2FiZZGB8cuyD+cZmyUGHVFwDvXRJl7WEsN72w+zZAIdpFSB+ClmrNzXBqJeH22Lq5Unw4NqlY
 8LH8Uscp3U8E1IKLCvZNQQ2BuTga0Ucfi8zzHCFf6c3sq9KlH9S4IfzKPKis3IBxUt3vpw=
X-Google-Smtp-Source: AGHT+IHcDt9PcTMFMHLumSevOo50MBHxDLWG3tgn7qIWH1xw+HNpt3x4q7kZeyr8sjekROTSBozlE5NhWDGkTlJ2eYY=
X-Received: by 2002:a05:6000:1886:b0:42b:3867:b3a7 with SMTP id
 ffacd0b85a97d-42e0f1d59d1mr30112165f8f.8.1764711307350; Tue, 02 Dec 2025
 13:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20251007174036.1178955-1-nhed+buildroot@starry.com>
 <20251120233241.54d9b14b@windsurf>
In-Reply-To: <20251120233241.54d9b14b@windsurf>
Date: Tue, 2 Dec 2025 16:34:55 -0500
X-Gm-Features: AWmQ_bkOKI8-50p9M24RjCvytmbUJHybeCMjUCQlOVYyiBNEgyId5HWHU9fK1Hk
Message-ID: <CABGDZC=R0ndhtoyhdFrzmDs6HgVXGoVhrUAODOqfOLgnBX8NQA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nevo Hed via buildroot <buildroot@buildroot.org>,
 Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google; t=1764711307; x=1765316107; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+lMTlpEZCjI2R3CLtM7Fxi0zrYSmcCrBV+KIbX9Rs90=;
 b=oJsLe+0jSUSgtdQv9veHxK7dpidQvwOb4XvbRLAQYVuRgo4cxz3WU7S0u16ZVjRC4I
 2sc5zJuYh9rl47l4jSj3ebGS3BEw/qsTtKSQ3f32DbJgH2eUyk9floUzl8etIEmnzIgS
 orGyJCUXqHDtLerHuh3Eg3icP3nD6l7gOemVA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=starry.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=starry.com header.i=@starry.com header.a=rsa-sha256
 header.s=google header.b=oJsLe+0j
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: fix monotonically
 increasing dependency list
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
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Content-Type: multipart/mixed; boundary="===============0050384490697345022=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0050384490697345022==
Content-Type: multipart/alternative; boundary="0000000000009b24440644fede19"

--0000000000009b24440644fede19
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

Yeah sorry about that - I rarely contribute here and am very much in the
github pull-request mode

I will add that and try to reformat the v2

Just one question - do I include or drop the `Reviewed-by: Thomas Perale <
thomas.perale@mind.be>` line?  (In my local repo I had updated from the
patchworks)?

Thanks
  --Nevo


On Thu, Nov 20, 2025 at 5:32=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Nevo,
>
> On Tue,  7 Oct 2025 13:40:35 -0400
> Nevo Hed via buildroot <buildroot@buildroot.org> wrote:
>
> > From: Nevo Hed <nhed+github@starry.com>
> >
> > Having mutables as default args has unexpected behaviors.
> > br2_parse_deps_recursively had a default arg `deps` initialized to the
> > empty list (`[]`) except that on subsequent calls from `main` deps woul=
d
> > already be populated from prior components.
>
> Thanks for your patch! However in order to make it applicable, we need
> you to add your Signed-off-by line.
>
> Perhaps you could send a v2 of you patch with your Signed-off-by line
> and the commit log extended with the reproduction details you shared as
> a reply?
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000009b24440644fede19
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><br>Yeah sorry about that - I rarely contribute=C2=
=A0here and am very much in the github pull-request mode<div><br></div><div=
>I will add that and try to reformat the v2=C2=A0<br><br>Just one question =
- do I include or drop the `Reviewed-by: Thomas Perale &lt;<a href=3D"mailt=
o:thomas.perale@mind.be">thomas.perale@mind.be</a>&gt;` line?=C2=A0 (In my =
local repo I had updated from the patchworks)?<br><br>Thanks</div><div>=C2=
=A0 --Nevo</div><div><br></div></div><br><div class=3D"gmail_quote gmail_qu=
ote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 20, 2025 a=
t 5:32=E2=80=AFPM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@b=
ootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hello Nevo,<br>
<br>
On Tue,=C2=A0 7 Oct 2025 13:40:35 -0400<br>
Nevo Hed via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org" targe=
t=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; From: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bgithub@starry.com" target=
=3D"_blank">nhed+github@starry.com</a>&gt;<br>
&gt; <br>
&gt; Having mutables as default args has unexpected behaviors.<br>
&gt; br2_parse_deps_recursively had a default arg `deps` initialized to the=
<br>
&gt; empty list (`[]`) except that on subsequent calls from `main` deps wou=
ld<br>
&gt; already be populated from prior components.<br>
<br>
Thanks for your patch! However in order to make it applicable, we need<br>
you to add your Signed-off-by line.<br>
<br>
Perhaps you could send a v2 of you patch with your Signed-off-by line<br>
and the commit log extended with the reproduction details you shared as<br>
a reply?<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000009b24440644fede19--

--===============0050384490697345022==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0050384490697345022==--
