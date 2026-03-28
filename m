Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 536A810BA421
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 08:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB34361134;
	Sat, 28 Mar 2026 08:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nqa4OwqsJo9s; Sat, 28 Mar 2026 08:17:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D63FF6113D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774685825;
	bh=G9DtDWkrJVwW7JNLwkpLG3j0+aAhEOKVZul+A9eCaZM=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L+/rReA9+pHm9oqXzVGO1AjoPqA4oSPxCUTgIhjyynYM7ViN4upoolNSZDtF1fgIc
	 8/1getWEknfeXW17Ku3bgNQ+HkH4pTcMnBHjwVq5u9VjJz8q7RGGfcQ6k/I0iocDzb
	 /sUMusS+6c66hxLJZvcv5ODlXqt8g53k8GmOOcNcdKM+HA+TLdeFoeVNMJe2BZUwoH
	 HK/+tm4skMvvVv6QsH2u65mciR8ILMuhoyzAQWNEvYwo2Nmp/QZQgGrslBREU6Xlkl
	 95bLB+xHXk2pk9sVrlEpeyM+cHSwXY6ENc9Cw9tJaGEJ1xZFY61Pxv9ZJ0JoaA/byL
	 3h50yv77SPqRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D63FF6113D;
	Sat, 28 Mar 2026 08:17:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 338DD2AA
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 08:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3116A40149
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 08:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NduePuf7HIxM for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 08:17:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E66C540025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E66C540025
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E66C540025
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 08:17:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-66a9a2187a5so4457136a12.0
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 01:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774685821; cv=none;
 d=google.com; s=arc-20240605;
 b=UsHY+IqW8rVoKcSKCXUE90YUQ0ji9jNZTvd15jTGt48dd+NGzlwvInIrM+nVzZF9Sb
 De9/cJ+Urgxebk/HgjKjMIkEsMPTTuJtl5IA4dxC4T49VGeRDbr4wTQ4duxXggHg4Can
 GtGZjr9+ueyfNQP0ct+79a6KNTQMLRxv2KulTZ8baeGgxXERNHlSADF8eCyrEBbM4CMv
 RlVOxUZgvDrw0P5cCeWXb53nEcbxRAYF3t48cAuVVjMP7/Gwu1alUXIBmJtjFw3Php73
 50Mr/bwwnEAU9Ncla+3F2hq2H2zPgqVxsIqV8k9osvVmZWP5TCQBN5lwbKijBmJ/4R1Z
 bioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TEDwQPoou2JVCD5fYGq4JbEM+TszTjhLjtv1zCnnw4w=;
 fh=zNmwxmg1mdKa/EAOIj0l04pdFvwpMYMYQVl/OCpD6Xc=;
 b=HUPUvAIH9+gwW4VseWuA6m4A27xrSyjDLj4eBxzSihyD0c8dettvZvbzkasK+ck6lW
 MvZi8CcZlKgifXGLhlRflXL6LIhGcFAyvlWd497K+KUC1hxLPhRhCoWpN5kisRoGqony
 zUlCINuFh6OxoTZQ6neL7a9clY9dm4XHp9o1/8xJdnZIoF/8XqGYm366IiAnf4rXz6wK
 PNEVAJnqFWs4XNXA9ftfIa6mHtcUDteDJJ2/CnnRNbkk9QPCVDncUFEfKIvhCX167ImY
 sjrnshse8EO2Aaoto0zR1V0+dagRRSlltSOLHgXWqZ2GFZd7dysu0Q/Ty6ifuI4xiNVV
 1YlQ==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774685821; x=1775290621;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TEDwQPoou2JVCD5fYGq4JbEM+TszTjhLjtv1zCnnw4w=;
 b=PYJrOe7b9pqoF8h14lbSxPy2d3odHxRgUfpNcvb9/qeTLn3ajG7n7xaAIY8Q82p217
 SRHD7fKd6FolN/KvWT0/F4LBW73FOh2wYwvRl5VqWx6PPE8gdGUBJXGcBClyG5g4w88O
 ZE7ZmjKHRieuSzIqXEzYauQOnKVmy8MCvHfmWq4yWb4hTWuk0wrK3KCHOqj293qzrBbp
 2SKNS4e8TR/PvkxkWkGViFp30sNgKQw6lHGjIqMrRl4zDf9qX471+RH5APvHjIWguLoN
 TdNchY3QvnJh0+zC+YWMQk+2+dp0b+/VCIEv5q1IZWuCEWlS08t23Q1aV5cuguiFOl4n
 +i0A==
X-Gm-Message-State: AOJu0YyRaMOuaCBqvYV74n+KfFaQzTcQAetoJPjTGGOUt/sDj2GZY3zl
 p2KiXIH5F1RFvFR8aRknxp5UTVT4yw/rclY39kXf4yjy8YxqJdRDW16OY5AXnWW5Ji1twLYHcza
 4f6NZQKP8lLOezZVJculs0YuzpPfaxF/icXqV
X-Gm-Gg: ATEYQzy2Yw+6yuQ5JyUqtibW8ENuGE6VYW3Exose1njNcY8OAl0i48qdIVEQWYJxoM3
 /ymvIibFJCvDKCIJyiv9E6tKdibG0NYNexS4dPinkZhczWufq7aWjt64q3nj2xhKIj0cfVKof/z
 Q5yu7n3pS3lPdL4cVYgmaI9/7cxVAdV6dwAYOTvyh+AVvDhzxexET2cH8KvTv6mAgF6y3869Xym
 3jvi4aw8leFvHWW48ABLOWZ3fPylEsU15Ukr4pGqNFBFUy6SdVxU8BKDs3pFKZI5hlvhxVwxMKy
 MqaQTTw5byXX4CqFVF3/mIuUil1w3EqiGed3YCFN1Q==
X-Received: by 2002:a05:6402:460a:b0:65b:a2b5:5320 with SMTP id
 4fb4d7f45d1cf-66b29091054mr2823585a12.26.1774685820297; Sat, 28 Mar 2026
 01:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260326113620.2433228-1-chakrabortyshubham66@gmail.com>
 <20260327094348.193822-1-chakrabortyshubham66@gmail.com>
 <cfbf28f28bc1485cfd2245db5120f739@umbiko.net>
In-Reply-To: <cfbf28f28bc1485cfd2245db5120f739@umbiko.net>
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 28 Mar 2026 13:46:49 +0530
X-Gm-Features: AQROBzCZnsWLg247JDaWT_vqM8GtZOOYh2_2WYBrOcNVJxQ9HdhPZToGPf68NWc
Message-ID: <CABvxkszTp2gQZeLvr6DQo7Zyo=coTn_v6vjZ7kYxNJhy3T8niQ@mail.gmail.com>
To: Andreas Ziegler <br025@umbiko.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Romain Naour <romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774685821; x=1775290621; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TEDwQPoou2JVCD5fYGq4JbEM+TszTjhLjtv1zCnnw4w=;
 b=l+QB+Cf1YKlq0jhJXfp0kC3Gqi7TgGQ9fZ3MPGNrS0mPXlZY0yy4sWnjgZ/5n+nlTh
 3NNu6NyRjHScjyyCIjhaECPqKJz5U84m3qjDNsT9pZMvzauixWXlaPgOZukaQcqiGIa+
 TnUzHBS+YFTLiof5Q2xWEjWIKcVSJD2tfqFySYXFwICD2OI/yAI3rnmYggs6FdhJ8BjW
 HStedaA0K3LWSwUh11G+T6gs3Fw8ttOPtpwzvcnErWVawy6Hx7yMYmi4AjtmtBXWKQ17
 3I5jxVJo0TUU5RkUlVzVNmDgbGp1rF8qN20oNqd2qw78J+x9swJBVKwcNr6Qi6RzlNCu
 2VUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=l+QB+Cf1
Subject: Re: [Buildroot] [PATCH v4] Extend the existing patch to also add
 -lstdc++ to the Libs field, fixing static linking issues with libicuuc.a.
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
Content-Type: multipart/mixed; boundary="===============0449716345532493321=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0449716345532493321==
Content-Type: multipart/alternative; boundary="000000000000e82624064e113d99"

--000000000000e82624064e113d99
Content-Type: text/plain; charset="UTF-8"

Hey Andreas,

Apologies for sending a messy patch again. I'll clean up the formatting and
ensure only the necessary changes from 0003 and more descriptive commit
message are present in v5.

Best regards,

Shubham

On Sat, 28 Mar, 2026, 11:00 am Andreas Ziegler, <br025@umbiko.net> wrote:

> Hi Shubham,
>
> Applying this patch now works, build fails, please see below ...
>
> On 2026-03-27 09:43, Shubham Chakraborty wrote:
> > This combines the previous 0003 and 0004 changes into a
> > single patch, following review feedback from Andreas.
>
> Your previous commit messages were more descriptive. Also 0004 never
> existed in the Buildroot sources ...
>
> >
> > Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>---
> > ---
> > Changes v3 -> v4:
> >   - Clean up patch to remove deleted 0004 patch file
> >   - Ensure only 0003 patch is modified; no extra files or deletions
> >   - Remove any rebase or history artifacts that caused previous patch
> > failures
> > ---
> >  .../0003-fix-static-linking-with-icu-uc.patch | 20 +++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch
> > b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> > index 36a3d1f696..c58f2700ee 100644
> > --- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
> > +++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
> > @@ -13,14 +13,26 @@
> >
> http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef52
> >
> >  Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> >  ---
> > - source/Makefile.in | 2 +-
> > - 1 file changed, 1 insertion(+), 1 deletion(-)
> > +This patch currently addresses linking against stdc++ for
> > shared-library
> > +builds. Add -lstdc++ to the static build flags also, to fix 'undefined
> > +reference' errors when linking programs like xmlcatalog (libxml2)
> > +with musl static toolchains.
> > +
> > +Upstream: Inactive-Upstream [Buildroot specific]
> > +Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> > +---
> > + source/Makefile.in | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >  diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
> >  --- icu.orig/source/Makefile.in      2025-03-13 19:31:23.000000000 +0100
> >  +++ icu/source/Makefile.in   2025-09-22 08:56:36.791792784 +0200
> > -@@ -279,7 +279,7 @@
> > -     @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}"
> > '$${baselibs}' >> $@
> > +@@ -276,10 +276,10 @@ config/icu-uc.pc: config/icu.pc Makefile
> > icudefs.mk
> > +       @echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data
> > libraries" >> $@
> > +       @echo "Name: $(PACKAGE)-uc" >> $@
>
> There are eight space characters in the resulting patch, the icu
> Makefile uses one tab. The build fails with:
>
> Applying 0003-fix-static-linking-with-icu-uc.patch using patch:
> patching file source/Makefile.in
> Hunk #1 FAILED at 276.
> 1 out of 1 hunk FAILED -- saving rejects to file source/Makefile.in.rej
>
> > + ifeq ($(ENABLE_SHARED),)
> > +-    @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}"
> > '$${baselibs}' >> $@
> > ++    @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}"
> > '$${baselibs}' -lstdc++ >> $@
> >   else
> >       @echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
> >  -    @echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
> > --
> > 2.53.0
>
> Kind regards,
> Andreas
>

--000000000000e82624064e113d99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span class=3D"smart_draft_text">Hey Andreas,<br><br>Apol=
ogies for sending a messy patch again. I&#39;ll clean up the formatting and=
 ensure only the necessary changes from 0003 and more descriptive commit me=
ssage are present in v5.<br><br>Best regards,<br><br>Shubham</span></div><b=
r><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, 28 Mar, 2026, 11:00 am Andreas Ziegler, &lt;<a href=
=3D"mailto:br025@umbiko.net">br025@umbiko.net</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Hi Shubham,<br>
<br>
Applying this patch now works, build fails, please see below ...<br>
<br>
On 2026-03-27 09:43, Shubham Chakraborty wrote:<br>
&gt; This combines the previous 0003 and 0004 changes into a<br>
&gt; single patch, following review feedback from Andreas.<br>
<br>
Your previous commit messages were more descriptive. Also 0004 never <br>
existed in the Buildroot sources ...<br>
<br>
&gt; <br>
&gt; Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortysh=
ubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham6=
6@gmail.com</a>&gt;---<br>
&gt; ---<br>
&gt; Changes v3 -&gt; v4:<br>
&gt;=C2=A0 =C2=A0- Clean up patch to remove deleted 0004 patch file<br>
&gt;=C2=A0 =C2=A0- Ensure only 0003 patch is modified; no extra files or de=
letions<br>
&gt;=C2=A0 =C2=A0- Remove any rebase or history artifacts that caused previ=
ous patch <br>
&gt; failures<br>
&gt; ---<br>
&gt;=C2=A0 .../0003-fix-static-linking-with-icu-uc.patch | 20 +++++++++++++=
++----<br>
&gt;=C2=A0 1 file changed, 16 insertions(+), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch <br=
>
&gt; b/package/icu/0003-fix-static-linking-with-icu-uc.patch<br>
&gt; index 36a3d1f696..c58f2700ee 100644<br>
&gt; --- a/package/icu/0003-fix-static-linking-with-icu-uc.patch<br>
&gt; +++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch<br>
&gt; @@ -13,14 +13,26 @@ <br>
&gt; <a href=3D"http://autobuild.buildroot.net/results/210/2107f9dfb39eeb65=
59fb4271c7af8b39aef52" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef5=
2</a><br>
&gt; <br>
&gt;=C2=A0 Signed-off-by: Romain Naour &lt;<a href=3D"mailto:romain.naour@o=
penwide.fr" target=3D"_blank" rel=3D"noreferrer">romain.naour@openwide.fr</=
a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; - source/Makefile.in | 2 +-<br>
&gt; - 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +This patch currently addresses linking against stdc++ for <br>
&gt; shared-library<br>
&gt; +builds. Add -lstdc++ to the static build flags also, to fix &#39;unde=
fined<br>
&gt; +reference&#39; errors when linking programs like xmlcatalog (libxml2)=
<br>
&gt; +with musl static toolchains.<br>
&gt; +<br>
&gt; +Upstream: Inactive-Upstream [Buildroot specific]<br>
&gt; +Signed-off-by: Shubham Chakraborty &lt;<a href=3D"mailto:chakrabortys=
hubham66@gmail.com" target=3D"_blank" rel=3D"noreferrer">chakrabortyshubham=
66@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + source/Makefile.in | 4 ++--<br>
&gt; + 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt;=C2=A0 diff -git icu.orig/source/Makefile.in icu/source/Makefile.in<br>
&gt;=C2=A0 --- icu.orig/source/Makefile.in=C2=A0 =C2=A0 =C2=A0 2025-03-13 1=
9:31:23.000000000 +0100<br>
&gt;=C2=A0 +++ icu/source/Makefile.in=C2=A0 =C2=A02025-09-22 08:56:36.79179=
2784 +0200<br>
&gt; -@@ -279,7 +279,7 @@<br>
&gt; -=C2=A0 =C2=A0 =C2=A0@echo &quot;Libs:&quot; &#39;-L$${libdir}&#39; &q=
uot;${ICULIBS_UC}&quot; &quot;${ICULIBS_DT}&quot; <br>
&gt; &#39;$${baselibs}&#39; &gt;&gt; $@<br>
&gt; +@@ -276,10 +276,10 @@ config/icu-uc.pc: config/icu.pc Makefile <br>
&gt; <a href=3D"http://icudefs.mk" rel=3D"noreferrer noreferrer" target=3D"=
_blank">icudefs.mk</a><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Description: $(PACKAGE_ICU_DES=
CRIPTION): Common and Data <br>
&gt; libraries&quot; &gt;&gt; $@<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Name: $(PACKAGE)-uc&quot; &gt;=
&gt; $@<br>
<br>
There are eight space characters in the resulting patch, the icu <br>
Makefile uses one tab. The build fails with:<br>
<br>
Applying 0003-fix-static-linking-with-icu-uc.patch using patch:<br>
patching file source/Makefile.in<br>
Hunk #1 FAILED at 276.<br>
1 out of 1 hunk FAILED -- saving rejects to file source/Makefile.in.rej<br>
<br>
&gt; + ifeq ($(ENABLE_SHARED),)<br>
&gt; +-=C2=A0 =C2=A0 @echo &quot;Libs:&quot; &#39;-L$${libdir}&#39; &quot;$=
{ICULIBS_UC}&quot; &quot;${ICULIBS_DT}&quot; <br>
&gt; &#39;$${baselibs}&#39; &gt;&gt; $@<br>
&gt; ++=C2=A0 =C2=A0 @echo &quot;Libs:&quot; &#39;-L$${libdir}&#39; &quot;$=
{ICULIBS_UC}&quot; &quot;${ICULIBS_DT}&quot; <br>
&gt; &#39;$${baselibs}&#39; -lstdc++ &gt;&gt; $@<br>
&gt;=C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@echo &quot;Libs:&quot; &#39;-L$${libdir}&#3=
9; &quot;${ICULIBS_UC}&quot; &gt;&gt; $@<br>
&gt;=C2=A0 -=C2=A0 =C2=A0 @echo &quot;Libs.private:&quot; &quot;${ICULIBS_D=
T}&quot; &#39;$${baselibs}&#39; &gt;&gt; $@<br>
&gt; --<br>
&gt; 2.53.0<br>
<br>
Kind regards,<br>
Andreas<br>
</blockquote></div>

--000000000000e82624064e113d99--

--===============0449716345532493321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0449716345532493321==--
