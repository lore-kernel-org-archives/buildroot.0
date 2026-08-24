Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA70BC5DF97
	for <buildroot@archiver.kernel.org>; Mon, 24 Aug 2026 01:53:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49A5C80B89;
	Mon, 24 Aug 2026 01:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNxjaru4JybB; Mon, 24 Aug 2026 01:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787536431;
	bh=DJzhnIJHxzxaPzPsRpO5OSGeHiRKcRBi+1M1H/HbDSw=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CEir98A3yVEwz2a2DQz/dtD96EgrsFnqy6MhAh6WNwLC5a1X5ajFRLFraMmjfrKPU
	 IO+t1hHQJozOtBQvkhzIa9ib/HRk85inXmBgMeeVdriTBprpUW1KoZB7LtHkcxK/mg
	 y7SzxBFuTB68wIqfcaKYuqnlw6WdpqqcnMEP/T2wyX2pfszCycznBM4q5wrPe7JEfx
	 zQGd5PK4ZpbLucoU6S+xRlh5jFC+rnm8pK5BFQMHx/NgZcljdrLtqOCxfJYfE4WfLs
	 3UwOmUfhMlrD0otmQ4898yUkSiVey3W7z/+mShuv0KGn4loD624bLpVF/S+BBiP059
	 HWYvyZ5rSe/ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4125780B5F;
	Mon, 24 Aug 2026 01:53:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31F38386
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 01:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23A346061D
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 01:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hda-ONRR7Gx9 for <buildroot@buildroot.org>;
 Mon, 24 Aug 2026 01:53:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pAawK1SX
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1C1F60619
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 01:53:48 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-c16794450aeso421005566b.2
 for <buildroot@buildroot.org>; Sun, 23 Aug 2026 18:53:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787536426; cv=none;
 d=google.com; s=arc-20260327;
 b=MJJ+FV5Mmj8tUiAJfB7RPBBv+vlMS5veE/UVn+ZAzRX7Ay5esg3hbTI//zHalJafkW
 AYSgS18sicDu89uLWIxAM13VhLHfiPMvohUHgKPpZxxVZELP/xXBCuvrsSKxYDTtsWNT
 A/SRAxby1t7gOvgjVWnoVzUwuo0aj0keJR2xnj+TCv+F+KgzCSp8NkhcPOazH2iMBBD5
 uWSCP92K7kak/WE9VjYIfURpqhJ7rVOPyfFV0t+Fl+O1o3iyIFqan5y50CXJsxT44pxN
 902we51cBTivM3NSw3dyNMm6pDxvss9mOKaomVwNekExMoOslMPf0ZvHMyzx+3j9kE2F
 CU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PwryUfjx2n7CXbC1V/M26BJRMM8Y2iT2uOeY7fqpUd4=;
 fh=yd5wM2qwHOIEGqaKbZmcSyTzhOo1yXvpGyFwvzGLJ/w=;
 b=jT8wIUdlV1oT33O8jUunjLKt5hvtDIs5slXXVvU07Z3shHHK4OT07o55sNLJjclBvi
 aJD29RxicyVzQdxUnN6lAgMZouxPOTEsz33JNJnns49P4F40Kpg+f3EVq9WLLVgUxFL0
 DeZxW4KSDATC+txaria+Hn7k6RvOJTqBE8z5zdqH8nKVBuAwF9NryURqHGokJmWi8hs7
 ReNZD9g6m8MTyK8AbLGcqR1QHm1krh+xMtixtkEtxTuWbCx8l2wF8xzwHgOJd0eTntQY
 vwWIsvXpAdOWsRneRyjHSddmf8Wi5trHDH7l/46zNFi6eUHooWWNA1w7my0juvzS0Rg8
 8JYg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787536426; x=1788141226; darn=buildroot.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PwryUfjx2n7CXbC1V/M26BJRMM8Y2iT2uOeY7fqpUd4=;
 b=pAawK1SXPjTrsucWNYPouBZyo3S2QTuaPq9BlV4wi+txIedWM4mUYQGyV3i2B0hTYJ
 wtj4IYu+WILJjkKe5I/ezvj6A7pF/PUwUIVNnOOGVXeoX4BxF+gnEYDZse1rL6pcNrZf
 6DBq7kQorShBjKfB0rObFVKmJw8oXYBYCrdb4w55ct5GvUmFwyG7qLCRDBGZYifhALbA
 BvWyGyWObJW31hYEn4CZdy1mLdWwugu+viPtY4yZGeHEPVpeEfQccVbnucbb2+ARy5UQ
 7OCCNbUfAVzU0m2Ngh/HKDwHCZGoOfZAoGzfv8P6ACXxUhjiGyuKwLaX2UUof7xj+/ct
 DpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787536426; x=1788141226;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=PwryUfjx2n7CXbC1V/M26BJRMM8Y2iT2uOeY7fqpUd4=;
 b=qNAzZUFsrO+eDRLYHcSjckbAhde4Q99OaJXhgRT3j52G/DKQIHLX/FhQJEoipmEuTV
 SAnyi4XWmJI4GhukF7pXUs1te+EBOhXlyFgK3lQJq27WQAJ46A+pKUj29GhBehDf25wZ
 RFQGljmt6s8jNWRxTd0el5S4wCGlV11YWNGkMNB6NJQnfUbW9c6alvssATkIhSljd0ll
 y/zBCX3xZxgWJSpxKMUdE0ttfAShbY/M2G6KNCrZLV4hPGeivsdZNgO7XHiqzNIWbRBb
 b4UsffCf0YKZ8Csc4Bemwsn7ZRKTD/Mka3WUi2RX6dZEKmzKiIdngUy8pjYL5nV30FQt
 cG3w==
X-Gm-Message-State: AFuF++nk8mIbTk1rVOU1fx0KJedev1zfXhd52q5B9agaaV437m3I8gJ4
 i7pI+TpXgGHQoqXD6JSpYTjJV657xrUOHKbk57CUhagmHNe3p+bv3xxmRZLUawS4K9IJiih7Qjx
 xiQTU6lYU3MRMZk5NTGo/AfkJJoQgCo0=
X-Gm-Gg: AR+sD11kMfgsG4lJTJMPLVfWXTTd0aexU5IhvWgDxTC8Z146nTQHnQO6V5XVn1Y5yI/
 TLkmM+SR2Ef2AJaWFE/jdlhS39MMyCDfwdrKMTUJg86NVBP0mzB8kp2hxcWAncEJX5ngSQRUuk/
 62pSH1CkN3EZgmWzdW8tIM54Ui9X2uxC2AKwBD8FfH8Zf4c245EtcU8RERRWxcdPECCnhSAKnnR
 qFHsrTlMEYiiauRAy9p9373iNSZIStiEG8dAIWxjeC9I9uM/fwDizx+WTvX26qKOPlf9LFUyFU/
 H2haCOaDDP+khUMnnjLqTttMoxOs885Sx54OoUsvmRm9o4ImoWL+gQYb7gIQtvXkuv24xw8QBum
 qAAQ=
X-Received: by 2002:a17:906:9fd0:b0:c20:1db7:f486 with SMTP id
 a640c23a62f3a-c246a2ef579mr2309465566b.4.1787536426149; Sun, 23 Aug 2026
 18:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260713113710.1732927-1-chakrabortyshubham66@gmail.com>
 <aoNuO__aQMnMl0ni@windsurf>
 <CABvxksxYWcRQHZospOPy=dCRWqWkp6Cf2J8FpsDnqZZ0ObNY4Q@mail.gmail.com>
 <aodK_V5XZwTZ3S_L@windsurf>
In-Reply-To: <aodK_V5XZwTZ3S_L@windsurf>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 24 Aug 2026 07:21:53 +0530
X-Gm-Features: AcwNN1WJ1ZL-F1nBis-rB0VoD4Fqot3jxC8IjRg-B0jjyd0Gm6lquyicHdysCQU
Message-ID: <CABvxksyvBezT1ur2Ai9jhDM=a+YzvY3NyfXPo133-aAFXKmZ2w@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5777038211746967856=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5777038211746967856==
Content-Type: multipart/alternative; boundary="000000000000b42f270659c14196"

--000000000000b42f270659c14196
Content-Type: text/plain; charset="UTF-8"

Hi Thomas

I think we should update the unrar in the stable branches.

It was an oversight on my part. I'm still learning how to communicate these
decisions properly on the mailing list.

Best regards,

Shubham

On Fri, 21 Aug 2026, 12:15 am Thomas Petazzoni, <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Thu, Aug 20, 2026 at 10:32:08PM +0530, Shubham Chakraborty wrote:
>
> > The Buildroot autobuilder reports that CVE-2022-30333 affects unrar
> > in the stable branches (specifically 2026.05.x, 2026.02.x, and
> 2025.02.x), as
> > shown in the automated emails.
>
> But then for our stable branches the question is whether we want to
> bump unrar or just backport the CVE fix. Also, if you don't explain
> such things in the commit log, how are we expected to guess?
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000b42f270659c14196
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi=C2=A0Thomas</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto">I think we should update the unrar in the stable branches.</d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto"><p>It was an oversight on =
my part. I&#39;m still learning how to communicate these decisions properly=
 on the mailing list.</p><p>Best regards,</p><p>Shubham</p><br><div class=
=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 21 Aug 2026, 12:15 am Thomas Petazzoni, &lt;<a href=3D"mailto:thomas.petaz=
zoni@bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_blank">thomas.pe=
tazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
Hello,<br>
<br>
On Thu, Aug 20, 2026 at 10:32:08PM +0530, Shubham Chakraborty wrote:<br>
<br>
&gt; The Buildroot autobuilder reports that CVE-2022-30333 affects unrar=C2=
=A0<br>
&gt; in the stable branches (specifically 2026.05.x, 2026.02.x, and 2025.02=
.x), as<br>
&gt; shown in the automated emails.<br>
<br>
But then for our stable branches the question is whether we want to<br>
bump unrar or just backport the CVE fix. Also, if you don&#39;t explain<br>
such things in the commit log, how are we expected to guess?<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer noreferrer nor=
eferrer" target=3D"_blank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--000000000000b42f270659c14196--

--===============5777038211746967856==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5777038211746967856==--
