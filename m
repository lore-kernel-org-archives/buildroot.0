Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282C1C79F82
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 21:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE4FD40BA4;
	Fri,  4 Sep 2026 21:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeqUKnHqPHTq; Fri,  4 Sep 2026 21:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 60D5040A81
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788557107;
	b=iFGdgyJo+Dp1DLDlamOYMxccOW36zSLYIhypMTyqRLhXa2NYPSutI/6bmVS1fx7rheEM
	 hoGLi5kaPSbtB48T4diBY4Mnym9nN4G2LWZZtPFl+1czFF/qmtWV3nF/RWJSwqZccBCtZ
	 x/y9fRJ3lW0qbAM5w//FxaWEDMxKRzPzyPH8sbQ0rzQ8JPLcWZzrwKO8/8P04ZLoJ/cZh
	 AZIqrttz9BIG2xR6pRtGiu3ovpiywGHUt3qeCRZL6ztut/1k13Wt57gk40F7tvTpxrsdx
	 GFykW82WFQUAYH4/OW1gWbDHIEUCrE3aSfYppDQvXECvJQH6B6DrelUTOYJo2vy6FNw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788557107;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:MIME-Version:References:In-Reply-To:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Errors-To:Sender;
	bh=T5WGNdKPDhy0ykwt7OqRe9RpaFV4vhJndl8j9y192uI=;
	b=jc9d7dJLo6YFHjmaK+Cox0UaYohJwpeGs+SmhsMQ/kNBWt6CwbEfky1wqHIMMWvpGJbK
	 G8Esf9PoSslzWK4Z53ptzrQs+IpAVn0uRthw1FE9qwtNE4Y+2vWH7l9goEAM2xut+R+fI
	 jtdvQDmQFcJavJYKoUzEJYqyg4TCQAEXiRFgDpiSeP6s1qc3dHytm16W9GhSgq5KVke2P
	 b4+p0c4co1qVqhBT9ot733paQfDjlOWQvlOOyTtWqj3PivS0xkdJOSDFAU36hgrrgSi9Y
	 +FBGk9dQNqeFjqcTwFRMNqd46+FDScTmNuMcikz8v6tzNfZNifOaygbJprzAAJKg0gw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788557107;
	bh=T5WGNdKPDhy0ykwt7OqRe9RpaFV4vhJndl8j9y192uI=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dZhV4Rf01aXi+XAPSvvo3amjUBxTRwt9Cq7szItn0yNZVljCwkqUzWh3HOc+Fi3be
	 cVw1qRuAAEErji0ZAoxY/3C30pQIqUUgXZFMJHX2uoVQTuoJhRBW2a9qdx5ElWoLR8
	 3D4aURRqlXvby+NYn6HV7te+sJhymzRl/VsqXyEgFkUgylRSH8LsG2s0le3eCMAsl8
	 kywyRRkYaUQnh5cV8WuW8OxzPDOdAuFijwAZQaIjQqQVkZt7emkLHOwQxuHzFOfSjT
	 4upeqXfukwLuBp1PW8gLM0/fP/HOsws/G3XolWszX7nxivwqdjFcKE/Ynx/gvGXBIQ
	 Y2xAkOCDY1DCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 60D5040A81;
	Fri,  4 Sep 2026 21:25:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95E66724
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 21:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B2E081172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 21:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UecWRz0Vdo4I for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 21:25:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2337881166
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1788557104;
 b=ZH3O432tt/pwpeOYVJJv7FTgMYV2r5xi9IFrnOjVAaDemQeE43aIEUw2C6X3V+d972SJ
 Pg7uu6UsqJdiJBimbfB8a5L0nNWHV+nEgszglUlBby7rRjjhW5HFF3ybdCwK7ejygGhQ4
 92NPzOd/Q3EhZOuH5F3M8VxNRti13brgsJTSnU8G33Wl/E5K0bVyWNY8XWRuAGxari455
 0C+ZdM19AOHRtR7UvW94ttCPnsvWO97Qe7K3vNmU6JUD2p/0mb+9DVMsu6Q536IaDaM5r
 kitZ5BPRp04yedRqalp+b6NzRQc68X1deZ2wBAbMJDw4yNndWxk9FVuTCsM4vWiq4Zg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788557104;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=dbhmpQs9t8woBoheVVD/BuHn940CFsrDpCC3FHFWH/M=;
 b=CaSlVUpx7qf+d8oU+wiwr+8iMsPyc/vhU8iYBKgyjxjIW+Vl8B9mODPe1utXFL+1gUHD
 bo54RwUjpK0/SigHEVdtRu5Cbscr/3ZrdToVtR1qeoABY0S4CK8pADD+CuiFedB5gxFU/
 qSSxYY1fREfas1JJvF1beuHMADbhABuQMKWNrccVsB0p7+6a7o2X0dBIABE1pUWYK58oE
 pQ/xj518TDg8BQNkpXGL+QLx2YO3OHdvWMiO6bvMthI96DHxGvC4Sey5BWVvmG0VGzfTx
 W70GXK5JXjr++YSXEITZOdXhRDp52gyGfWTFO5gi4ZxufUo4rVgdJXXDimBTa0pUIcg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org;
 dmarc=pass header.from=outrider.ai; 
 dkim=pass header.d=outrider.ai header.i=@outrider.ai header.a=rsa-sha256
 header.s=google header.b=Q0xQklNY; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::62f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=jkoch@outrider.ai; receiver=<UNKNOWN> 
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2337881166
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 21:25:03 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2d9201076b3so17456685ad.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 14:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788557102; cv=none;
 d=google.com; s=arc-20260327;
 b=sDuoHyjmj/LwjFk2IHumG9ahr3HqeNAm8pQV/pQolFWJ37zXquig3Oy92uXGoHO8Hf
 L/GyKlVKwFpNPIlr1GIh/PkjgDHxXOPq65zxwidhYJfwMT9qM4a6MBUar+hmFSLTyFsv
 dQcawJcKh3nIG1KQ7zw8+xbnY+KnKU1+xqSLzKupxAjueW+ZXOHmbir17KPmzgfOfsy7
 90cF+Ljvd8IsVqI3zO6fZslcrwHjlnQSka30J8Amv9noenJAAVpPQKXiXUrOxc+he66C
 566mVs9lwhlR7PpqMrGI37QbLIX5QDfyEi1fe3eTSmU91T77VFQZJFq5HoriV48KrAUV
 IfUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dbhmpQs9t8woBoheVVD/BuHn940CFsrDpCC3FHFWH/M=;
 fh=ETUoGLZp70eGC31td5Cd46m7jarYr1tol1KktqVLh80=;
 b=XKHc5x/3vQFF/WUsCx/1E6ZpBFzkefS9oSfw1r4Bg/O4VCpDmr7rgASflad+n8+tck
 ViaW7LRNLc+ZCqZwxiLOONg3Fv37g5Uxi19LGqk/vwx49HtmPL6guLZ5OHqpCgTPdK4K
 M+ZJt6vgsO5aBBy6dL49Pi0Hxyz0J8xejkPwxGB10yZzp8l4DFleC0IYVnfCuhMHblSz
 RtpzanqJ3veYPjT/KG51QaS5m6WB47MfcvPDcOKcfZprdxBojOgGkU2i7ieJ3nva+Va9
 NBR8mc7ROseQ2Cn9HFHZX8oE8LaSDQxswGka2YmfG4WJDuknnnQ2MwKjAavYQYFIAJ+n
 LQIg==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788557102; x=1789161902;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dbhmpQs9t8woBoheVVD/BuHn940CFsrDpCC3FHFWH/M=;
 b=V+rZ56MevBgwmTfCwloEVN+62MLG20T7gpgbRS3CeRSmUaYVH3qxpJ/nzzz/Mci7h8
 f5PJr01lROt9pi1PsYz3wb5Z0zc1OMtdCq0T2IgFa1+3XNQWJQD3rG8d4B/BUTWigxp4
 Tq5dPh5kHMQLGLkPld2aKK6HERCJcyUnsT8Tdiu+v7r1a5ojRKzng+QZ+4kAT/tArFjw
 rxbZw21RlHf9/zBAFpkRrz+oTM98OAzZ5s1y9Q6GfnH5rnQCX+aitFsuvUtPTb0MGrai
 A1VX1R2NgTDsGatJZgJDlT5QsS/cz2acEVnlck6q6wCJBsg9b6HVTfdeWLQ5UzyivFrr
 YR+A==
X-Forwarded-Encrypted: i=1;
 AKwUvBwv+6WtU8FK7zHeAz6iRJqpWAQUqu4kUh6IvWqHCuV0gOjTiZooqmMZsY+92zWEJZsSYpKzwmgB6aM=@buildroot.org
X-Gm-Message-State: AFuF++mfjyAFqryHKauRu3zLjza+6c6TNhoLYm4bLONeE3Ku1WJ3ciFp
 GiyRVjd/JcrbHtgBwR03Lhffn+ULm0ABueK7okmzCKAwrvByj0LfrDPjU9YqP2JD5EbAHTpng3g
 0vx/OWgtmXl1mi6lXY2KbIIzB1ToMrw2FLzOvzEfg
X-Gm-Gg: AYBFou1IQLyMrm9/NVTVp4apbZ1yHqrAUpwK+CviyuulIHVGrTW9vZtynMNRu99F15P
 aNUtL/dFngakAPwKkW2Ej9f+zRFJ2uofLyhmPqflwFpD95yOvuHxJA2rnKNGRKGh8af+mqyRqpS
 v7MiiWzIYEnREKxJISHbrAgm10aMbQgMm4+k7U8ykT0kBYPunUlw1tS7IxqDRoFU0PKqNkTWO//
 9y9/77D3tvieZS6v1c0wbj1DNZQgyYsRMK+10Q3UL1zH8DS8SBN3fzktieYXu40BG3QEjE/8hmj
 hD/bkjycjM3YiANA39/nLRRV5sCk1Jp5r0vN/l9+
X-Received: by 2002:a17:90a:e7cb:b0:398:9bd4:d12 with SMTP id
 98e67ed59e1d1-39b2624a3famr11100302a91.17.1788557102104; Fri, 04 Sep 2026
 14:25:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260902195708.2168193-1-j@j-ernberg.se>
In-Reply-To: <20260902195708.2168193-1-j@j-ernberg.se>
Date: Fri, 4 Sep 2026 15:24:49 -0600
X-Gm-Features: AcwNN1VxrJHA0V9xIPgzPr-CbReO44YTqv9yTI8HbmwOoXaC92BxOdab8DHtZOM
Message-ID: <CAMQGCcjXAx56Jtk31ArAZJyPxc=cXU48KyrzObu-p-F19agEpQ@mail.gmail.com>
To: j@j-ernberg.se
Cc: Adam Ford <aford173@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>, Zach Vargas <zvargas@xes-inc.com>,
 buildroot@buildroot.org
Subject: Re: [Buildroot] Updating nvidia-driver package
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
From: John Koch via buildroot <buildroot@buildroot.org>
Reply-To: John Koch <jkoch@outrider.ai>
Content-Type: multipart/mixed; boundary="===============8678765705842001540=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8678765705842001540==
Content-Type: multipart/alternative; boundary="000000000000bb5b1a065aaee659"

--000000000000bb5b1a065aaee659
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99ve been maintaining a renamed local version to avoid conflicts wi=
th the
existing one. I don't know everything maintaining an official Buildroot
package involves, but I'm happy to help where I can.

My main motivation is to reduce our out-of-tree patches and hopefully help
others in the community. However, because our systems run strictly headless
for GPU-accelerated Docker containers, I haven't tested any window managers
or display servers, so I can't speak to the Xwayland/LIB_GL build issue
directly.

I have changed the driver package fairly significantly, and to align with
standard release practices it might require further changes. For example,
the standard release includes modprobe and persistenced as separate
packages, looking like the following:
Target packages ---> Hardware handling --->
nvidia-driver
    CUDA support
    nvidia kernel module
nvidia-modprobe
nvidia-persistenced

Users may need a different driver version based on their GPU hardware
architecture. I made the hardware architecture a selectable option because
it seemed like the most user-friendly method. I also added an option for
"Management utilities" (e.g. nvidia-smi, nvidia-persistenced,
nvidia-debugdump, etc.). It makes more sense to me to bundle those under
the driver rather than have them as separate packages. Perhaps they should
be individually selectable within the driver package. I also give the
option to build the kernel-open driver versus the proprietary driver where
the option is available (e.g. Turing, Ampere, Ada, Hopper). My
implementation looks like the following:
nvidia-driver
    GPU architecture
        Fermi
        Kepler
        Maxwell / Pascal / Volta
        Turing / Ampere / Ada / Hopper
        Blackwell and newer
    Open-source kernel module (kernel-open/) [Based on GPU architecture
selection]
    CUDA support
    Management utilities
    Kernel modules

In terms of kernel and toolchain support, I=E2=80=99ve primarily focused on=
 recent
Buildroot LTS releases and their default kernel pairings. My testing is
limited to newer NVIDIA hardware (Ada and Blackwell), so I'll definitely
need help from others to confirm the driver works with older legacy GPUs.
That being said, I have confirmed driver compilation works for many default
configurations under 2025.02.x, 2026.05.x, and the 2026.08.x release
candidate.

If that all sounds reasonable I can prepare and send over the patch series
for review.

On Wed, Sep 2, 2026 at 1:57=E2=80=AFPM John Ernberg <j@j-ernberg.se> wrote:

> Hi John,
>
> > For a while I have been locally modifying the nvidia-driver package to
> > allow its use with more modern hardware architectures (e.g., Turing and
> > above). Recently I also added support for the open-source driver which =
is
> > required for the Blackwell architecture (and beyond). I believe I
> retained
> > support for the older legacy architectures but I am unable to test thos=
e
> > due to lack of supported hardware. Would there be any interest in
> reviewing
> > and possibly merging these changes into the nvidia-driver package?
>
> If you're using it and plan to maintain it, post the patches, the package
> is currently orphaned, so adding yourself to DEVELOPERS as well could be =
an
> idea.
>
> I started looking at trying to compile the existing nvidia-driver package
> after Adam ran into an xwayland compile issue with the LIB_GL providers
> (which I also ran into earlier and didn't have time to figure out how to
> properly fix - due to the nvidia driver not being buildable).
>
> The last few days I have tried again to figure out how to build the curre=
nt
> nvidia-driver with a supported kernel (according to nvidia docs) and have
> not
> been able to find a combination of internal toolchain and kernel version
> that
> builds.
>
> As far as I can tell all in-tree toolchains are too new, so when the kern=
el
> versions compile the driver doesn't, and when the kernel doesn't compile
> ...
> I don't know if the driver would compile either.
>
> Do you or any of the others CC'd use the package as it is today? And if s=
o,
> have a defconfig that builds the current nvidia-driver package?
> It needs a myriad of patches if it's going to build for any kernel beside=
s
> possibly the 5.10 CIP kernel (which is doesn't build for either... as far
> as I can tell).
> So maybe support for this version is not necessary to keep.
>
> Best regards // John Ernberg
>

--000000000000bb5b1a065aaee659
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"background-color:transparent">I=E2=80=
=99ve been maintaining a renamed local version to avoid conflicts with the =
existing one. I don&#39;t know everything maintaining an official Buildroot=
 package involves, but I&#39;m happy to help where I can.</span></div><div>=
<span style=3D"background-color:transparent"><br></span></div><div>My main =
motivation is to reduce our out-of-tree patches and hopefully help others i=
n the community. However, because our systems run strictly headless for GPU=
-accelerated Docker containers, I haven&#39;t tested any window managers or=
 display servers, so I can&#39;t speak to the Xwayland/LIB_GL build issue d=
irectly.<br></div><div><br></div><div><span style=3D"background-color:trans=
parent">I have changed the driver package fairly significantly, and to alig=
n with standard release practices it might require further changes. For exa=
mple, the standard release includes modprobe and persistenced as separate p=
ackages, looking like the following:</span></div><div><span style=3D"backgr=
ound-color:transparent">Target packages ---&gt; Hardware handling ---&gt;</=
span></div><div><span style=3D"background-color:transparent">nvidia-driver<=
/span></div><div><span style=3D"background-color:transparent">=C2=A0 =C2=A0=
 CUDA support</span></div><div><span style=3D"background-color:transparent"=
>=C2=A0 =C2=A0 nvidia kernel module</span></div><div><span style=3D"backgro=
und-color:transparent">nvidia-modprobe</span></div><div><span style=3D"back=
ground-color:transparent">nvidia-persistenced</span></div><div><span style=
=3D"background-color:transparent"><br></span></div><div><span style=3D"back=
ground-color:transparent">Users may need a different driver version based o=
n their GPU hardware architecture. I made the hardware architecture a selec=
table option because it seemed like the most user-friendly method. I also a=
dded an option for &quot;Management utilities&quot; (e.g. nvidia-smi, nvidi=
a-persistenced, nvidia-debugdump, etc.). It makes more sense to me to bundl=
e those under the driver rather than have them as separate packages. Perhap=
s they should be individually selectable within the driver package. I also =
give the option to build the kernel-open driver versus the proprietary driv=
er where the option is available (e.g. Turing, Ampere, Ada, Hopper). My imp=
lementation looks like the following:<br>nvidia-driver</span></div><div><sp=
an style=3D"background-color:transparent">=C2=A0 =C2=A0 GPU architecture</s=
pan></div><div><span style=3D"background-color:transparent">=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Fermi</span></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Kepler<spa=
n style=3D"background-color:transparent"></span></div><div>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 Maxwell / Pascal / Volta</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 Turing / Ampere / Ada / Hopper</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 Bl=
ackwell and newer</div><div>=C2=A0 =C2=A0 Open-source kernel module (kernel=
-open/) [Based on GPU architecture selection]</div><div>=C2=A0 =C2=A0 CUDA =
support</div><div>=C2=A0 =C2=A0 Management utilities</div><div>=C2=A0 =C2=
=A0 Kernel modules</div><div><br>In terms of kernel and toolchain support, =
I=E2=80=99ve primarily focused on recent Buildroot LTS releases and their d=
efault kernel pairings. My testing is limited to newer NVIDIA hardware (Ada=
 and Blackwell), so I&#39;ll definitely need help from others to confirm th=
e driver works with older legacy GPUs. That being said, I have confirmed dr=
iver compilation works for many default configurations under 2025.02.x, 202=
6.05.x, and the 2026.08.x release candidate.</div><div><br>If that all soun=
ds reasonable I can prepare and send over the patch series for review.</div=
></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Sep 2, 2026 at 1:57=E2=80=AFPM John Ernberg =
&lt;<a href=3D"mailto:j@j-ernberg.se">j@j-ernberg.se</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">Hi John,<br>
<br>
&gt; For a while I have been locally modifying the nvidia-driver package to=
<br>
&gt; allow its use with more modern hardware architectures (e.g., Turing an=
d<br>
&gt; above). Recently I also added support for the open-source driver which=
 is<br>
&gt; required for the Blackwell architecture (and beyond). I believe I reta=
ined<br>
&gt; support for the older legacy architectures but I am unable to test tho=
se<br>
&gt; due to lack of supported hardware. Would there be any interest in revi=
ewing<br>
&gt; and possibly merging these changes into the nvidia-driver package?<br>
<br>
If you&#39;re using it and plan to maintain it, post the patches, the packa=
ge<br>
is currently orphaned, so adding yourself to DEVELOPERS as well could be an=
<br>
idea.<br>
<br>
I started looking at trying to compile the existing nvidia-driver package<b=
r>
after Adam ran into an xwayland compile issue with the LIB_GL providers<br>
(which I also ran into earlier and didn&#39;t have time to figure out how t=
o<br>
properly fix - due to the nvidia driver not being buildable).<br>
<br>
The last few days I have tried again to figure out how to build the current=
<br>
nvidia-driver with a supported kernel (according to nvidia docs) and have n=
ot<br>
been able to find a combination of internal toolchain and kernel version th=
at<br>
builds.<br>
<br>
As far as I can tell all in-tree toolchains are too new, so when the kernel=
<br>
versions compile the driver doesn&#39;t, and when the kernel doesn&#39;t co=
mpile ...<br>
I don&#39;t know if the driver would compile either.<br>
<br>
Do you or any of the others CC&#39;d use the package as it is today? And if=
 so,<br>
have a defconfig that builds the current nvidia-driver package?<br>
It needs a myriad of patches if it&#39;s going to build for any kernel besi=
des<br>
possibly the 5.10 CIP kernel (which is doesn&#39;t build for either... as f=
ar<br>
as I can tell).<br>
So maybe support for this version is not necessary to keep.<br>
<br>
Best regards // John Ernberg<br>
</blockquote></div>

--000000000000bb5b1a065aaee659--

--===============8678765705842001540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8678765705842001540==--
