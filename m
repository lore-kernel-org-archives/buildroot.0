Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6C6C5DF85
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 17:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DE0D60873;
	Thu, 20 Aug 2026 17:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id moKFpChd8Dwt; Thu, 20 Aug 2026 17:02:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787245344;
	bh=KXlZNXD50VQ6hG0tS/tpE7HdINJP/8EHpQZuDbM4igM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cp4IX0CdAeFTPKH6krAklEytekMynM6Ve9RYBnWGqXIxJgJeOjRC5MCr7/xQ6JFca
	 VwgHJs5rkWA25Nc8D/QReHtgsGrIqyx6BFdAxcACcovaxY3Y6m913yfFagaH1CAtCD
	 WIFhV+ApFHUCiHZejk2YEa9MFkDntJRKXxjsxLhd9Ie3mYIQprgLXa4qTwMfnyGbe1
	 Rb3s/01KIQKl/psAaTYTXhiNoN0PtcBgvVLhmKQ1mwBfQj9i6A4+dP3i2cO1wX/NnJ
	 9qTjGQ/wjNF5hekaD6riu2QuihaNQnnMJ7CUY2wxQ1e8QpCwyOVOqizx2b4OQQmUE4
	 C8f1pCHFkbm6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88B046084A;
	Thu, 20 Aug 2026 17:02:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C63462B2
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 17:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B796A4081E
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 17:02:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7j3WVKFnloOx for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 17:02:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=E+QsfnDA
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6D27040600
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 17:02:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6a3e145e1bfso189480a12.1
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 10:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787245340; cv=none;
 d=google.com; s=arc-20260327;
 b=SxIAR1CpI1sQjslG8YmI5rZd/MmH5qWuuCSWg0cl0iMJzwprpENJ0Rdkf9lOWtu07r
 Ug88X7CTAsoo+ehvaV4Tj2nhtz4//SasjsA5HliHt7M9EYlTn4ugbVjYVfmuIQaRcfEd
 dfnOeQXNRMh2fxZIgGNZXqKljMgiF6RCDS+g3MDEPZVZwO2GESs3J1m8jIQkM4E5TiC6
 IGWucKyK5w7eixnzyzPJsbfmIOO+SJbbJBKOX219De2nw3HSIOmuxPUU/1wXRSw8ePv7
 thtGno0IiPhN2WJo4ZjHuntDNo7ny9rnnteNQKdTUotwV4dE2YAIUjDbpYaEWfm/O0U2
 uBvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=lPCWeaf7At8tmzm26A86oHh/vutxofcdkd4WTOA0j+k=;
 fh=yd5wM2qwHOIEGqaKbZmcSyTzhOo1yXvpGyFwvzGLJ/w=;
 b=YcEuGVz4YIBdlLJ3lVVvNCXmJoRy7wil8IRVe9cmBxDXkxNxpOFBRW9PzJ00pXsrZd
 6iCCMu+R6pS1mofH/eVFiOcyp5EsmkR45jguCtFbPwNsbxRs3xAZBWOYZnvS9ZEvJOCa
 hydK6AW9e2KoxiyLDLyhKStpF4bHesz2hjWZy4+QUWbBvhDlu+WpS24A8tsF/KfeytBT
 qLNPCvjiyxT1M7vkSr4v0o3Uo2fAHdEkCHPqc+afBDvQqUSaWeVPqJWil+nlUZqv6A5f
 7oSHw8LSS0yzR6JOKAGvng2M0SNwU7awpf4vjbftakAyZHISu43m/hXIQVbEW8cGh9QL
 gE0Q==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787245340; x=1787850140; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=lPCWeaf7At8tmzm26A86oHh/vutxofcdkd4WTOA0j+k=;
 b=E+QsfnDAqaMn46nCD5QDARJecIG8xYtmEG21ZWRwP4z42PPO1Wf7DnrE8Rywb8LVii
 dKKXc6PlCTs34WHnUxYMNtrwyCePxAnDUilfJgYkwnw37JKRF/Kjd6rS600z58EIrCtz
 aQy9LLt92miXofcfu259cWR0+gfcqt82UPibz5yugnZA3lSVYpV32aa16hsSsbg/NKaA
 tzLRffOKpY/O3A7Ou97FFBzoyZggD1uaBChNlSd8xsERvGCmSg9xhdu/tzor+8q6N2Fb
 lzYApHxpzXUgtX7/wXCxXajkbVKhp0RmOu85VHEEGsa0ZnQJj33Y5PY8JGU0HyUTZptn
 GITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787245340; x=1787850140;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=lPCWeaf7At8tmzm26A86oHh/vutxofcdkd4WTOA0j+k=;
 b=j4GIbJuAb43HKVPS85mE/1SlpCjxZpffj8+CYvjGDxQOuX4PycacNHFgkxouGyflKq
 1o8FwvmSr+UdhVzs0sT5zCHW4m9SH+KzohnZd8qmYlWRH5QHELGoObd7fs8iNcRMpu1p
 LTGyhEi2bmIdiyF3l0i0C3HVwSaveKdSM++qYZgbyadZuL0TwJabQQaDv7GZL+VqiU2u
 7IV08LHitDOxs7LmXy8cTn+rP7Hr9SBCmW9l8r3jjlntWyyeUExNfx/Bz7XufVo6XK5t
 MThg82guLcED/bYe6xUZ8lNT96oj+ijnbwd2A7upLyXLqHtJOF2bVFv0LoY/CpA4T6H7
 7C9A==
X-Gm-Message-State: AFuF++ng7nLo22+XBwsH52sxCETQa37SpR40hbUgCLAn+h3tscLs7GsP
 StNr+PITiThigUrO5ZF0A4WLt1/G9mTgRsF5otgS4dR0AKujxwSzXT0CLXY28vL/dbhstKO6I4C
 mY9ovsYbCHJQAAqfL3DMH0LmirzD+MhA165ztMag=
X-Gm-Gg: AR+sD13XayxlgRUkUG/PZJiUxmfaZS+392JTzcjhZiYKIS1ZXnf/E0qg7v6TI1v9lZE
 cGz2mS9xtYh4e0esYNy4w9KvD6R8jg55kBz9/qQptwzn/GjxuUI/wrM62tCavO9F8WTxQdIcCrk
 +XcQ+dAwUZtATxcgiOvHBv6bEKrMKl7cYhZo1ypBGomR6f0IHJxdAdp379FRNdF6oJzX7r1HD4k
 j7lea5mO4JjWJ9WIW9x4dYclrB+R7VZetE/BW/6EoPXmuYclkz6fnfpHOrCy4c+jl0te9FhT6/b
 ODK9m/q7NE0U6rpZPQRU8/gniSNTtXl/VqQHJcYUESszZQiXuHa0wHY6Yn98PaA=
X-Received: by 2002:a05:6402:42c4:b0:6a3:e813:8457 with SMTP id
 4fb4d7f45d1cf-6a42f1f9e90mr164555a12.12.1787245339834; Thu, 20 Aug 2026
 10:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
 <aoNuO__aQMnMl0ni@windsurf>
In-Reply-To: <aoNuO__aQMnMl0ni@windsurf>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu, 20 Aug 2026 22:32:08 +0530
X-Gm-Features: AcwNN1V3z6DYWtdiPmhxmaVFHxjwno2YhM9QTMAWjeYag-gmbpiDOKaFfcpKchc
Message-ID: <CABvxksxYWcRQHZospOPy=dCRWqWkp6Cf2J8FpsDnqZZ0ObNY4Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Buildroot List <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] package/unrar: bump to version 7.2.7
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
Content-Type: multipart/mixed; boundary="===============5435985204119573908=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5435985204119573908==
Content-Type: multipart/alternative; boundary="0000000000009b7ba906597d7b92"

--0000000000009b7ba906597d7b92
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

The Buildroot autobuilder reports that CVE-2022-30333 affects unrar
in the stable branches (specifically 2026.05.x, 2026.02.x, and 2025.02.x),
as shown
in the automated emails.

Best regards,

Shubham Chakraborty


On Tue, 18 Aug 2026, 1:56 am Thomas Petazzoni, <thomas.petazzoni@bootlin.com>
wrote:

> Hello,
>
> On Mon, Jul 13, 2026 at 05:07:07PM +0530, Shubham Chakraborty wrote:
> > Upstream does not provide a per-release change log for the unrarsrc
> > tarball itself, only for WinRAR. Fixed from Repology/rarlab that
> > 7.2.7 is the latest unrarsrc release available at:
> >
> >  - https://www.rarlab.com/rar/unrarsrc-7.2.7.tar.gz
> >  - https://www.rarlab.com/WhatsNew.txt
> >
> > While at it, mark CVE-2022-30333 as ignored, since it was already
> > fixed upstream in 6.1.2 and is falsely flagged by buildroot autobuilder
> for this
> > package.
> >
> > Fixes CVE-2022-30333 (false positive, patched since 6.1.2/6.1.7).
> >  - https://nvd.nist.gov/vuln/detail/CVE-2022-30333
> >  - https://security-tracker.debian.org/tracker/CVE-2022-30333
>
> Where do you see as being flagged affecting unrar in Buildroot? The
> NVD database says this CVE affects versions up to 6.12. We're using
> 7.2.7, so we're not vulnerable.
>
> https://security.buildroot.org/master/component/unrar doesn't show any
> known vulnerability.
>
> Could you clarify?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000009b7ba906597d7b92
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"auto">Hi Thomas,</div><div dir=3D"auto"><br>Th=
e Buildroot autobuilder reports that CVE-2022-30333 affects unrar=C2=A0</di=
v><div dir=3D"auto">in the stable branches (specifically 2026.05.x, 2026.02=
.x, and 2025.02.x), as shown=C2=A0</div><div dir=3D"auto">in the automated =
emails.</div><div dir=3D"auto"><br>Best regards,<br><br>Shubham Chakraborty=
<div><br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 18 Aug 2026, 1:56 am Thomas Petazzoni, &lt;<a =
href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petaz=
zoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hello,<br>
<br>
On Mon, Jul 13, 2026 at 05:07:07PM +0530, Shubham Chakraborty wrote:<br>
&gt; Upstream does not provide a per-release change log for the unrarsrc<br=
>
&gt; tarball itself, only for WinRAR. Fixed from Repology/rarlab that<br>
&gt; 7.2.7 is the latest unrarsrc release available at:<br>
&gt; <br>
&gt;=C2=A0 - <a href=3D"https://www.rarlab.com/rar/unrarsrc-7.2.7.tar.gz" r=
el=3D"noreferrer noreferrer" target=3D"_blank">https://www.rarlab.com/rar/u=
nrarsrc-7.2.7.tar.gz</a><br>
&gt;=C2=A0 - <a href=3D"https://www.rarlab.com/WhatsNew.txt" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://www.rarlab.com/WhatsNew.txt</a><b=
r>
&gt; <br>
&gt; While at it, mark CVE-2022-30333 as ignored, since it was already<br>
&gt; fixed upstream in 6.1.2 and is falsely flagged by buildroot autobuilde=
r for this<br>
&gt; package.<br>
&gt; <br>
&gt; Fixes CVE-2022-30333 (false positive, patched since 6.1.2/6.1.7).<br>
&gt;=C2=A0 - <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-30333" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/det=
ail/CVE-2022-30333</a><br>
&gt;=C2=A0 - <a href=3D"https://security-tracker.debian.org/tracker/CVE-202=
2-30333" rel=3D"noreferrer noreferrer" target=3D"_blank">https://security-t=
racker.debian.org/tracker/CVE-2022-30333</a><br>
<br>
Where do you see as being flagged affecting unrar in Buildroot? The<br>
NVD database says this CVE affects versions up to 6.12. We&#39;re using<br>
7.2.7, so we&#39;re not vulnerable.<br>
<br>
<a href=3D"https://security.buildroot.org/master/component/unrar" rel=3D"no=
referrer noreferrer" target=3D"_blank">https://security.buildroot.org/maste=
r/component/unrar</a> doesn&#39;t show any<br>
known vulnerability.<br>
<br>
Could you clarify?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>

--0000000000009b7ba906597d7b92--

--===============5435985204119573908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5435985204119573908==--
