Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3737E7E36C
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 12:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70FE140D61;
	Fri,  3 Apr 2026 12:18:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tfgjO7zfPNpd; Fri,  3 Apr 2026 12:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E2140D6C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775218720;
	bh=kQFBYeQeu3ytFgzDvxfBNPOkdUXLgEAZZYE0eUk888Q=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDUJRhayEl8QZuNUMp6qRW7vE+OFaM5X9mGJsXpfPl386OCQf4y8E+gTaocFh1jmo
	 YFTqdIfHuPRkmhVtOqGAwjbO8QilvqSSBShJwcQS0gplZXBDMdBJmxYziuY1ktlwHH
	 4pbySRWUi1b/l1S4snFEKZSjjRhzRxNxSm65+vgTJEL8f+mMYFG9WaBV66wZGfe1bz
	 jIHcBja96VyzgITaghDNH6Sw/R8Rshjl7MYjDfXMe12iXG9QY/ExcgWv20rAkjfzBx
	 6tfXzc1hBsszvkclGLsj7FFvcTCung2mDTcCv26OncAJRBZ6jcFMVY4G152a2hsnBx
	 upwby/w/ZzbPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E2140D6C;
	Fri,  3 Apr 2026 12:18:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15C2A2CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3D9F40D6C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 39lzM2oQtcNW for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 12:18:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 87D4D40D61
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D4D40D61
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87D4D40D61
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 12:18:37 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-66d65646c65so255127a12.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 05:18:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775218715; cv=none;
 d=google.com; s=arc-20240605;
 b=XqM3IwWmTwr2RBVx+KBcaPeYX2IUDnIjfZ0HDnuur1u7SKrcGpUm1XEFan384pg2uU
 hGS2FimKwhPvSScp3qb2VA79nFkEHuTr+FdwNYxw0HNsKlhWpRR5G1iOFkaSe65I0M0v
 d9FVtUwGbp/iVL+G0YJboxrCF0zNzDfPwz3zWd2qyHW0iqYtNjz76e6T38jGeRejYCTn
 AJFkLHedqR9DiGm4ki88P8KW2171Ej5aBzU1k9QXujxiZMFaTAa5J0CX1z0RB+5d/5XN
 id93moYidajhuS+UaZ9Rv9KtVu1K3ocY1nQLFj49DshH51N+2R5vCAVGQIMcen+D+/wB
 3q3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=zeeQAqkPldyQKr93HRTkhuwqKm+J8y/i1J7ZG92mwD8=;
 fh=GKNY8hUCdJQW4hnNiVL+8PeKnXk/EuF+siUctVBW5Zw=;
 b=DoBKBllKIGV/kS8Vrd7RHavvBD2P2yXyPuWdOjiMVsTEmgx0F2ZiZywl1tYx4kPBlA
 LSkHgAo3P45JF0EG7vxZ2eQtCMgas3rd2zqvOBGRnvBN9RD1JY9C0IE+teCKEVqOnQFb
 lxlIMqx/+e1EabsWHTyBTBWyMcjK5k+1hccrHXIwVDlWctOXqqUrTI0db3IrQ3ldAYgf
 qkxbYPcVtwRP37KK82roCBwVyTZp4JasDmEpFBByQErzEb51CIbFvVQyvyOFaeL4ipPq
 LXAnW/M13ipAGR8QtawNy4XBD415HHLqvU8AYuN5w1ymmY8AcXynkfqrPjZBds8SPelp
 uCMw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775218715; x=1775823515;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zeeQAqkPldyQKr93HRTkhuwqKm+J8y/i1J7ZG92mwD8=;
 b=D0yJcfuLBV9LVpVHQ0yTGpuoOCAQIs7T8wRR9V+aEYzy3eePYOLzwlEBcEkFPfI1+v
 MnyFQgREw/67e4kViRqaNZUCRXLi4Oy3WsLk3rBY0S2TKO3HIkPy524svrDJFIbC/fpi
 +lkwLmYVIJxVJI1TdMcS49aPocrYAZpGP6zuCGCv8s6VBe2NKIf/k18fXxKh8o0ckkV5
 a4EDkiOZw1jJnfG/UvkfZzHw9vT8ADxhZCNBbf+eX3fKHmpD3jgicTgjVHiNwOArhWKS
 v9uV4X/QhMUKClKBrC+2qZuM2vgXSunJx1mp/lBIuqYFW9hsGWX+tC7w9Oc2puO44mAF
 ahEQ==
X-Gm-Message-State: AOJu0Yz6jYW8JliF11mtybrAjVCfxuZyACTEy0B3j4iMRPU3qw6jYvn1
 7wFrL4sW2E3hI08jhFw1m60DlOStMmEGeQvJallEifU7L8yy6zvG593cwlZ3819mpF7vjT4ZAAe
 y5giUdfU+KKZdOeVMvBvfLYRLBSlk4P247Q==
X-Gm-Gg: AeBDieszFjuH49QiQnIWphAScDQx7Ep6Oreq8KE48/JdV/HGqIkWPA6FuHHoyCZnAce
 fBBo3fvxrnl4Yb//VbKyRPM65EFJPq1iwbaigHaL8iP3OAPEsb4a0hpmjY8jOwf9AluF/BEL6/k
 Pv7MhRLD4aVR7Mjqq745GDG/48IwoBSYmk6bjrzYkhdFMIveWcDqPCZ5l/qJAh2Rjq0EMstWPOz
 UVY1TtOyQ5OvksA3x7chpdFSzz9i8dOSfqwXuwWLYdBGp8TuBmCaLarU3WIlZaiYoXSEz/Vr0pn
 cUKlrtp9b3YKGhx0jmsG1q8O0v67u5wwV1pLVnxK
X-Received: by 2002:a05:6402:510f:b0:66d:d429:5852 with SMTP id
 4fb4d7f45d1cf-66e3e0e68a5mr1263905a12.3.1775218715070; Fri, 03 Apr 2026
 05:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260403102040.522314-1-chakrabortyshubham66@gmail.com>
 <aeb49176-5139-4c57-ae45-7f1f080206a0@embetrix.com>
In-Reply-To: <aeb49176-5139-4c57-ae45-7f1f080206a0@embetrix.com>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 3 Apr 2026 17:48:23 +0530
X-Gm-Features: AQROBzDAlBuSIvU7PG-qTHy45S4D71SpW9Wqq0aQvf5gHHp3aErmBuzwrKYDjA0
Message-ID: <CABvxksxQctL3e41f_rTr6FAX9B1Zv8sEXmabj0Nrf2FB1e5LAg@mail.gmail.com>
To: Ayoub Zaki <ayoub.zaki@embetrix.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775218715; x=1775823515; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zeeQAqkPldyQKr93HRTkhuwqKm+J8y/i1J7ZG92mwD8=;
 b=KM7x6dKbgOWbbFYL15FkcX5GNVPTYSxKLpf+d/fys0vHkFriaBGoYChIC5tJDEE8a+
 YdrZA92F9j93Rd4oMx1eesexCB9nMrBcm7fKahbAfo2s7ktLFuKcvvqH6/ANIduYPqCp
 e5OKznONU7N2EzvPoURZ1IxXLaoFHjdhU/5FGpx4f9dzTSXGpF3EVfOkHs9b8ERlOKRI
 q2mwlE4D4PXkYroWf7+BDOJ9tsnYISIzmKY9gEVAhMQ80at52ceL9AH4HiNOtvua6w1D
 UJO6IdtP/naTMgNHVfR9enzmaoJ1LHX6OUY7/r8Wm/XTmc2EhF1GSIemC8ncn3cNP9Kv
 zByw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=KM7x6dKb
Subject: Re: [Buildroot] [PATCH] package/bmap-writer: fix static link with
 libarchive
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
Content-Type: multipart/mixed; boundary="===============5901440270440206109=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5901440270440206109==
Content-Type: multipart/alternative; boundary="000000000000e91392064e8d5050"

--000000000000e91392064e8d5050
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ayoub,

That makes sense. I'll send this patch as a PR to the upstream repository
instead of submitting it to Buildroot.

Thanks for the direction.

Best regards,

Shubham

On Fri, Apr 3, 2026 at 4:07=E2=80=AFPM Ayoub Zaki <ayoub.zaki@embetrix.com>=
 wrote:

> Hi,
>
> can you instead send a PR to https://github.com/embetrix/bmap-write
> project instead of Buildroot ?
>
> it's always better to fix upstream
>
>
> On 4/3/26 12:20, Shubham Chakraborty wrote:
> > Use a package patch to switch bmap-writer from CMake's
> > FindLibArchive module to pkg-config for libarchive.
> >
> > In static Buildroot builds, FindLibArchive only links
> > libarchive itself. That drops libarchive's private
> > dependencies from the final link command and causes
> > undefined references to compression backends such as
> > zlib, bzip2, lz4, liblzma and zstd.
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > ---
> >   ...ts.txt-use-pkg-config-for-libarchive.patch | 49 ++++++++++++++++++=
+
> >   1 file changed, 49 insertions(+)
> >   create mode 100644
> package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libarchive.pat=
ch
> >
> > diff --git
> a/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libarchive.p=
atch
> b/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libarchive.p=
atch
> > new file mode 100644
> > index 0000000000..bb2df1224b
> > --- /dev/null
> > +++
> b/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libarchive.p=
atch
> > @@ -0,0 +1,49 @@
> > +From 5931b090c7ebe61a1bbc9a3e3c58edae5e90d71b Mon Sep 17 00:00:00 2001
> > +From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > +Date: Fri, 3 Apr 2026 14:33:19 +0530
> > +Subject: [PATCH] CMakeLists.txt: use pkg-config for libarchive
> > +
> > +CMake's FindLibArchive module only passes libarchive itself to the
> > +final link command.
> > +
> > +In static Buildroot builds that is not enough, because libarchive.a
> > +also needs its private compression backend dependencies such as zlib,
> > +bzip2, lz4, liblzma and zstd.
> > +
> > +Switch libarchive discovery to pkg-config so the link command includes
> > +the full static dependency list instead of just libarchive.
> > +---
> > + CMakeLists.txt | 10 +++++-----
> > + 1 file changed, 5 insertions(+), 5 deletions(-)
> > +
> > +diff --git a/CMakeLists.txt b/CMakeLists.txt
> > +index 787fc69..086b127 100644
> > +--- a/CMakeLists.txt
> > ++++ b/CMakeLists.txt
> > +@@ -19,10 +19,10 @@ else()
> > + endif()
> > +
> > +
> > +-# Find libarchive
> > +-find_package(LibArchive REQUIRED)
> > +-if (LibArchive_FOUND)
> > +-    include_directories(${LIBARCHIVE_INCLUDE_DIR})
> > ++# Find libarchive via pkg-config so static builds pull in private lib=
s
> too.
> > ++pkg_check_modules(LIBARCHIVE REQUIRED libarchive)
> > ++if (LIBARCHIVE_FOUND)
> > ++    include_directories(${LIBARCHIVE_INCLUDE_DIRS})
> > + else()
> > +     message(FATAL_ERROR "libarchive not found")
> > + endif()
> > +@@ -47,7 +47,7 @@ add_executable(bmap-writer bmap-writer.cpp sha256.cp=
p)
> > + target_compile_options(bmap-writer PUBLIC -Wformat -Wformat-security
> -Wconversion -Wsign-conversion -pedantic -Werror)
> > +
> > + # Link the libraries
> > +-target_link_libraries(bmap-writer ${TINYXML2_LIBRARIES}
> ${LibArchive_LIBRARIES})
> > ++target_link_libraries(bmap-writer ${TINYXML2_LIBRARIES}
> ${LIBARCHIVE_LIBRARIES})
> > +
> > + # Specify the install rules
> > + install(TARGETS bmap-writer DESTINATION bin)
> > +--
> > +2.53.0
> > +
>
> Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards
>
> --
> Ayoub Zaki
> Embedded Systems Consultant
>
> Vaihinger Stra=C3=9Fe 2/1
> D-71634 Ludwigsburg
>
> Mobile   : +4917662901545
> Email    : ayoub.zaki@embetrix.com
> Homepage : https://embetrix.com
> VAT No.  : DE313902634
>
>

--000000000000e91392064e8d5050
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ayoub,<br><br>That makes sense. I&#39;ll send this patc=
h as a PR to the upstream repository instead of submitting it to Buildroot.=
<br><br>Thanks for the direction.<br><br>Best regards,<br><br>Shubham</div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Apr 3, 2026 at 4:07=E2=80=AFPM Ayoub Zaki &lt;<a hr=
ef=3D"mailto:ayoub.zaki@embetrix.com">ayoub.zaki@embetrix.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
can you instead send a PR to <a href=3D"https://github.com/embetrix/bmap-wr=
ite" rel=3D"noreferrer" target=3D"_blank">https://github.com/embetrix/bmap-=
write</a> <br>
project instead of Buildroot ?<br>
<br>
it&#39;s always better to fix upstream<br>
<br>
<br>
On 4/3/26 12:20, Shubham Chakraborty wrote:<br>
&gt; Use a package patch to switch bmap-writer from CMake&#39;s<br>
&gt; FindLibArchive module to pkg-config for libarchive.<br>
&gt;<br>
&gt; In static Buildroot builds, FindLibArchive only links<br>
&gt; libarchive itself. That drops libarchive&#39;s private<br>
&gt; dependencies from the final link command and causes<br>
&gt; undefined references to compression backends such as<br>
&gt; zlib, bzip2, lz4, liblzma and zstd.<br>
&gt;<br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank">chakrabortyshubham66@gmail.com</a>&gt;=
<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0...ts.txt-use-pkg-config-for-libarchive.patch | 49 +++++++=
++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 49 insertions(+)<br>
&gt;=C2=A0 =C2=A0create mode 100644 package/bmap-writer/0001-CMakeLists.txt=
-use-pkg-config-for-libarchive.patch<br>
&gt;<br>
&gt; diff --git a/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-fo=
r-libarchive.patch b/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config=
-for-libarchive.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..bb2df1224b<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/bmap-writer/0001-CMakeLists.txt-use-pkg-config-for-libar=
chive.patch<br>
&gt; @@ -0,0 +1,49 @@<br>
&gt; +From 5931b090c7ebe61a1bbc9a3e3c58edae5e90d71b Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortyshubham66@=
gmail.com" target=3D"_blank">chakrabortyshubham66@gmail.com</a>&gt;<br>
&gt; +Date: Fri, 3 Apr 2026 14:33:19 +0530<br>
&gt; +Subject: [PATCH] CMakeLists.txt: use pkg-config for libarchive<br>
&gt; +<br>
&gt; +CMake&#39;s FindLibArchive module only passes libarchive itself to th=
e<br>
&gt; +final link command.<br>
&gt; +<br>
&gt; +In static Buildroot builds that is not enough, because libarchive.a<b=
r>
&gt; +also needs its private compression backend dependencies such as zlib,=
<br>
&gt; +bzip2, lz4, liblzma and zstd.<br>
&gt; +<br>
&gt; +Switch libarchive discovery to pkg-config so the link command include=
s<br>
&gt; +the full static dependency list instead of just libarchive.<br>
&gt; +---<br>
&gt; + CMakeLists.txt | 10 +++++-----<br>
&gt; + 1 file changed, 5 insertions(+), 5 deletions(-)<br>
&gt; +<br>
&gt; +diff --git a/CMakeLists.txt b/CMakeLists.txt<br>
&gt; +index 787fc69..086b127 100644<br>
&gt; +--- a/CMakeLists.txt<br>
&gt; ++++ b/CMakeLists.txt<br>
&gt; +@@ -19,10 +19,10 @@ else()<br>
&gt; + endif()<br>
&gt; +<br>
&gt; +<br>
&gt; +-# Find libarchive<br>
&gt; +-find_package(LibArchive REQUIRED)<br>
&gt; +-if (LibArchive_FOUND)<br>
&gt; +-=C2=A0 =C2=A0 include_directories(${LIBARCHIVE_INCLUDE_DIR})<br>
&gt; ++# Find libarchive via pkg-config so static builds pull in private li=
bs too.<br>
&gt; ++pkg_check_modules(LIBARCHIVE REQUIRED libarchive)<br>
&gt; ++if (LIBARCHIVE_FOUND)<br>
&gt; ++=C2=A0 =C2=A0 include_directories(${LIBARCHIVE_INCLUDE_DIRS})<br>
&gt; + else()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0message(FATAL_ERROR &quot;libarchive not found&qu=
ot;)<br>
&gt; + endif()<br>
&gt; +@@ -47,7 +47,7 @@ add_executable(bmap-writer bmap-writer.cpp sha256.c=
pp)<br>
&gt; + target_compile_options(bmap-writer PUBLIC -Wformat -Wformat-security=
 -Wconversion -Wsign-conversion -pedantic -Werror)<br>
&gt; +<br>
&gt; + # Link the libraries<br>
&gt; +-target_link_libraries(bmap-writer ${TINYXML2_LIBRARIES} ${LibArchive=
_LIBRARIES})<br>
&gt; ++target_link_libraries(bmap-writer ${TINYXML2_LIBRARIES} ${LIBARCHIVE=
_LIBRARIES})<br>
&gt; +<br>
&gt; + # Specify the install rules<br>
&gt; + install(TARGETS bmap-writer DESTINATION bin)<br>
&gt; +--<br>
&gt; +2.53.0<br>
&gt; +<br>
<br>
Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards<br>
<br>
-- <br>
Ayoub Zaki<br>
Embedded Systems Consultant<br>
<br>
Vaihinger Stra=C3=9Fe 2/1<br>
D-71634 Ludwigsburg<br>
<br>
Mobile=C2=A0 =C2=A0: +4917662901545<br>
Email=C2=A0 =C2=A0 : <a href=3D"mailto:ayoub.zaki@embetrix.com" target=3D"_=
blank">ayoub.zaki@embetrix.com</a><br>
Homepage : <a href=3D"https://embetrix.com" rel=3D"noreferrer" target=3D"_b=
lank">https://embetrix.com</a><br>
VAT No.=C2=A0 : DE313902634<br>
<br>
</blockquote></div>

--000000000000e91392064e8d5050--

--===============5901440270440206109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5901440270440206109==--
