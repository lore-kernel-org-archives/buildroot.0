Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5570DC369DC
	for <buildroot@archiver.kernel.org>; Sun,  4 May 2025 18:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B96356069B;
	Sun,  4 May 2025 18:57:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HCSVX_tJxw4; Sun,  4 May 2025 18:57:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBAF06070D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBAF06070D;
	Sun,  4 May 2025 18:57:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B6E516B
 for <buildroot@buildroot.org>; Sun,  4 May 2025 18:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1155F606A8
 for <buildroot@buildroot.org>; Sun,  4 May 2025 18:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9lG9sKFM7H0A for <buildroot@buildroot.org>;
 Sun,  4 May 2025 18:57:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 15BCD6069B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15BCD6069B
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com
 [IPv6:2607:f8b0:4864:20::b2e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15BCD6069B
 for <buildroot@buildroot.org>; Sun,  4 May 2025 18:57:51 +0000 (UTC)
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e73e7012fa9so428763276.0
 for <buildroot@buildroot.org>; Sun, 04 May 2025 11:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746385071; x=1746989871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AztzpWj8Chy5wb8aFRqi4185T0xF8RE9gVd/hhFxoyA=;
 b=PiF0tJ3gFmxreXYEKcs6of6wSIhRGWWX1jyZPeN9rhe6NT32h+nigXi2QFvL0G61wT
 W0ftUPZgyXW3a/oT813aJ1jK48zu6Wq/LbpJMmdI4B/J8qNn7rh+otfLMorXkAgm7e8v
 elrHHgnOoBzN/ULVCESiUBZkR61mjybrdjiXPxMOaBKeQkcwvam+YbOSCS0kQhH00wCJ
 +YgvtKUGVfA432pHhll7xpe0NY3Ma6zr1FHGjbYB3Y9ep5SpTJK+0PjA2HjF03TVJohY
 a3oyCeB+BobwZuoQV0JuHx575EQ8e6CSP4ftOm5RTGH9UQiR8ax5eDKyKZogGa3smauQ
 5RgA==
X-Gm-Message-State: AOJu0YyesLyRiA1lyy9V5YNiCEF9qbDuOncvnJlIpU/DibJx4qzVSFC1
 yYn6ku0jjz++2mQ88fJUUC/P+Ci2Gctm+wcPFmpvxyB86uR6qUuf4fy/bTtArZMp/Mk5zlkc2d8
 CmRiXAOtPuhVasJBUJ8ArqGD6zkNyRUJ0
X-Gm-Gg: ASbGncs2Lzsk5/M1Ype67u2nIpezddYF8YVNbmPF++O4qiNQvDnyXghrjLCQ68YWb49
 fe5A+Zmd6mPXvpmjB0bcydenq5j7GLWZCvrSG95z2vD9DfFmATzo939ZTpHccznyOqfJy/imn8s
 30P+gSZO+iHSvat68LsP4p
X-Google-Smtp-Source: AGHT+IFWdA1eLJ1ZnbNhmxoyI0AkWgUYCfjAAiizt+YA6yrkKvd80FmHVdv1XWZWfx8qp8EgKJqfqUx7S0xObqLW5n0=
X-Received: by 2002:a05:6902:e04:b0:e73:63c:3108 with SMTP id
 3f1490d57ef6-e756562b1eemr5689213276.6.1746385070616; Sun, 04 May 2025
 11:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250503135217.490404-1-zik@jambula.net>
 <20250503135217.490404-2-zik@jambula.net>
 <a2c4686681f792b59307a5c2a00985f2@free.fr>
In-Reply-To: <a2c4686681f792b59307a5c2a00985f2@free.fr>
From: Joseph Zikusooka <josephzik@gmail.com>
Date: Sun, 4 May 2025 21:57:37 +0300
X-Gm-Features: ATxdqUEfwztf04EmmJ0CWWJopA8Yr3SZncMRus72GMTm7mHxzPt_ZBPNX4U06p0
Message-ID: <CAPWx8vtDAH_pTSh3U0MjiQFTQC9cXn5zGEhSdtYUOBeFDea3iA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, luca.ceresoli@bootlin.com, 
 "Joseph Zikusooka (ZIK)" <zik@jambula.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746385071; x=1746989871; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AztzpWj8Chy5wb8aFRqi4185T0xF8RE9gVd/hhFxoyA=;
 b=jcXQSPvTvxR7Y5pWEst2GaR8jdSSMdrqcDJaDnYVsj42KS2E5Rq9UegqtgZfKE1QCU
 e8nWsOOuJ3vLlUtk3Q9fiWswpZYHjw3Q2lqvVNhd9apa5Isr/inQ5U60UXSpkt/7JcHL
 NXByD8J5JxJMQ1Cu3HaVs/7possYL21lsJCURCl52CmFZHAK17BXFeoizS87WByCjBs5
 xwfeqGMM0KwAN0qvk3A3vWEaO30yIoNSRnKXzXPdRod3EAqiTE2P51PNEayxFm3WEL3A
 65ithrVLLvHRhrAVezxHzJZqyhyqIXPm731FxjCUzysMizzaWNC9zvnBC5z4Q2sRNxHk
 SgKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jcXQSPvT
Subject: Re: [Buildroot] [PATCH v2] package/m4: fix build failure with gcc 15
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
Content-Type: multipart/mixed; boundary="===============0433709762065509305=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0433709762065509305==
Content-Type: multipart/alternative; boundary="000000000000c67bc2063453f573"

--000000000000c67bc2063453f573
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Sun, May 4, 2025, 8:45 PM Julien Olivain <ju.o@free.fr> wrote:

> Hi Joseph,
>
> On 03/05/2025 15:52, Joseph Zikusooka (ZIK) wrote:
> > This is a temporary workaround to address build issues with host-m4
> > when using GCC 15, as encountered on
> > the recently released Fedora 42. The issue stems from stricter compiler
> > behavior introduced in recent
> > versions of GCC.
> >
> > A proper fix has already been committed upstream and will be included
> > in the next release of GNU m4:
> >
> https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89
> >
> > Until that version is available in buildroot, this patch ensures
> > continued compatibility and successful
> > builds.
> >
> > More context:
> > https://lists.buildroot.org/pipermail/buildroot/2025-April/776922.html
> >
> > Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>
>
> I applied this patch to master. I reworded the commit log and
> applied the workaround only when host gcc-15 is detected. See:
>
> https://gitlab.com/buildroot.org/buildroot/-/commit/7a07a9d155b8f601d68f07ee0ed1dc8d48907644
>
> Best regards,
>
> Julien.
>

--000000000000c67bc2063453f573
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Thanks!</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, May 4, 2025, 8:45 PM Julien Olivain &lt;<a href=3D"=
mailto:ju.o@free.fr">ju.o@free.fr</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi Joseph,<br>
<br>
On 03/05/2025 15:52, Joseph Zikusooka (ZIK) wrote:<br>
&gt; This is a temporary workaround to address build issues with host-m4 <b=
r>
&gt; when using GCC 15, as encountered on<br>
&gt; the recently released Fedora 42. The issue stems from stricter compile=
r <br>
&gt; behavior introduced in recent<br>
&gt; versions of GCC.<br>
&gt; <br>
&gt; A proper fix has already been committed upstream and will be included =
<br>
&gt; in the next release of GNU m4:<br>
&gt; <a href=3D"https://git.savannah.gnu.org/cgit/m4.git/commit/?h=3Dbranch=
-1.4&amp;id=3Da22c9802dd7e724eaefb21dc21d84ac2d3a49c89" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://git.savannah.gnu.org/cgit/m4.git/commi=
t/?h=3Dbranch-1.4&amp;id=3Da22c9802dd7e724eaefb21dc21d84ac2d3a49c89</a><br>
&gt; <br>
&gt; Until that version is available in buildroot, this patch ensures <br>
&gt; continued compatibility and successful<br>
&gt; builds.<br>
&gt; <br>
&gt; More context:<br>
&gt; <a href=3D"https://lists.buildroot.org/pipermail/buildroot/2025-April/=
776922.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.=
buildroot.org/pipermail/buildroot/2025-April/776922.html</a><br>
&gt; <br>
&gt; Signed-off-by: Joseph Zikusooka (ZIK) &lt;<a href=3D"mailto:zik@jambul=
a.net" target=3D"_blank" rel=3D"noreferrer">zik@jambula.net</a>&gt;<br>
<br>
I applied this patch to master. I reworded the commit log and<br>
applied the workaround only when host gcc-15 is detected. See:<br>
<a href=3D"https://gitlab.com/buildroot.org/buildroot/-/commit/7a07a9d155b8=
f601d68f07ee0ed1dc8d48907644" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://gitlab.com/buildroot.org/buildroot/-/commit/7a07a9d155b8f601d68f=
07ee0ed1dc8d48907644</a><br>
<br>
Best regards,<br>
<br>
Julien.<br>
</blockquote></div>

--000000000000c67bc2063453f573--

--===============0433709762065509305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0433709762065509305==--
