Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA9CC61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 02:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27B9B702F7;
	Tue, 21 Feb 2023 02:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27B9B702F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpfd1QMOuPzh; Tue, 21 Feb 2023 02:13:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 439D360AA3;
	Tue, 21 Feb 2023 02:13:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 439D360AA3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B60021BF310
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C9A281911
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 22:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9A281911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TrXkEY4Cqu7v for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 22:31:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C7B3813F9
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C7B3813F9
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 22:31:37 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id s17so1405743pgv.4
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 14:31:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PFHXUB1eoWQysKWWnqE327MVrC3rdOfEw515pj87giE=;
 b=ydzLdpGq8Nos5hVgJmSJJlmGlotTq0AraGZ3Ynl+FY0Y9+85LFrfCuqWMJByrTEPz5
 Po56AcUPC3EtjWEHjUKN79tOMFc8hvgUZMuQ1N+/cxSCl/+NR7qOeKqrTWKys1zv/eyq
 pZbP8VvIkUM7el51HAAMBc6M+ahv6WE4hOiwdeR9PNm74cR59CFNseHIjA5nKWuA/dXQ
 4wXi3y8l5I9hrU4Ox16ZcE3iiGFeu/2L891qv5dSiZhPg6DKF6pmQhvB1/JrCks326KP
 +zkjnoiUu+w7d57XAERw05sBcioh7c5AvFQKISY0kFMpi/sPQ1zqHowu6xkhhuyJBaJK
 XkdQ==
X-Gm-Message-State: AO0yUKUlizcrelYmxEL57PWqRxZyLzONN95WKLAfIbac3trtJX1rnxEF
 7sXLy0KEV4Dy6uL/LqyU7RGXnh3Yb3oJuDcbrcDUXWKc
X-Google-Smtp-Source: AK7set/Ckxk4Pr3weAsj/7ZJLsDHUkvcurAFZSKAEb8GUwiWbSAzARzrc7MROxbtHJ00NDs6xdIvQ9PIHFYAztgM84w=
X-Received: by 2002:a05:6a00:340f:b0:5a8:d43a:c6a8 with SMTP id
 cn15-20020a056a00340f00b005a8d43ac6a8mr341007pfb.0.1676932296904; Mon, 20 Feb
 2023 14:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20230219172440.519540-1-fontaine.fabrice@gmail.com>
 <20230220215531.7b3a1783@windsurf>
In-Reply-To: <20230220215531.7b3a1783@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Feb 2023 23:31:25 +0100
Message-ID: <CAPi7W83eUdKfWmPmhcSnLfj6JoCuDHzGd__en6qsgKhA9bVi8w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PFHXUB1eoWQysKWWnqE327MVrC3rdOfEw515pj87giE=;
 b=eQNVmI70u+sZw+RfHwA1MSRF+cmcE/jgPhgE7zUrtiFWy+zVaJPKZps0y0toypab6v
 d2wWk58HIoIdDICT7Zm22g+sqGhnY/HspZEydCFIVzLtYWLIScOF2bbvswgy5aBBxrQD
 B2eXIRR0PfXkMG2V5XXcQqLSRXVdyAgPGOZZUaTboOyiksdbjVkVOXksqcTB2itvsIm9
 x3U84cP6lcxoGOgznjrr9T1W4P/3FmIxxh2mAKFsMN3FuxpIZoIGElgSORRrg/5h3jR+
 TGRsoSca2VSwkuf7ugE2jBMtkdC/BIrpyrCeKVrthW4/wvuQZZSCKRuXeYgW/3x4yC7e
 Uxjw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=eQNVmI70
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/libmodsecurity: needs dynamic library with libcurl,
 libssh2 and mbedtls
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
Cc: Frank Vanbever <frank.vanbever@mind.be>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6319722673426628804=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6319722673426628804==
Content-Type: multipart/alternative; boundary="000000000000de948405f5293973"

--000000000000de948405f5293973
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lun. 20 f=C3=A9vr. 2023 =C3=A0 21:55, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> Hello Fabrice,
>
> On Sun, 19 Feb 2023 18:24:40 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Commit 9fc652a373034118535397fdd4042ab9f8fd7adf was incomplete as
> > mbedtls can be pulled in libcurl through libssh2 resulting in the
> > following build failure:
> >
> >
> /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc64le-bu=
ildroot-linux-musl/11.3.0/../../../../powerpc64le-buildroot-linux-musl/bin/=
ld:
> /home/autobuild/autobuild/instance-4/output-1/host/powerpc64le-buildroot-=
linux-musl/sysroot/usr/lib//libmbedcrypto.a(md5.c.o):
> in function `mbedtls_md5_init':
> > md5.c:(.text+0x0): multiple definition of `mbedtls_md5_init';
> ../../src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x0):
> first defined here
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/4c235e46188f23d1a48297f4e5942cec7b=
25959a
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> > Changes v2 -> v3:
> >  - Fix syntax
> > Changes v1 -> v2:
> >  - Update nginx-modsecurity
>
> Isn't that a bit madness? If libmodsecurity has its copy of parts of
> mbedtls, but didn't take care of renaming the symbols, then ultimately
> what we should conclude is that using libmodsecurity in a statically
> linked configuration is not supported.
>
> So I would advocate for simplifying the whole thing and just make
> libmodsecurity and its reverse dependencies depends on !BR2_STATIC_LIBS
> and be done with it.
>
> What do you think?
>

OK, I'll send a v4


>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000de948405f5293973
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 20 f=C3=A9v=
r. 2023 =C3=A0=C2=A021:55, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.pe=
tazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fabri=
ce,<br>
<br>
On Sun, 19 Feb 2023 18:24:40 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Commit 9fc652a373034118535397fdd4042ab9f8fd7adf was incomplete as<br>
&gt; mbedtls can be pulled in libcurl through libssh2 resulting in the<br>
&gt; following build failure:<br>
&gt; <br>
&gt; /home/autobuild/autobuild/instance-4/output-1/host/lib/gcc/powerpc64le=
-buildroot-linux-musl/11.3.0/../../../../powerpc64le-buildroot-linux-musl/b=
in/ld: /home/autobuild/autobuild/instance-4/output-1/host/powerpc64le-build=
root-linux-musl/sysroot/usr/lib//libmbedcrypto.a(md5.c.o): in function `mbe=
dtls_md5_init&#39;:<br>
&gt; md5.c:(.text+0x0): multiple definition of `mbedtls_md5_init&#39;; ../.=
./src/.libs/libmodsecurity.a(libmbedtls_la-md5.o):md5.c:(.text+0x0): first =
defined here<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/4c235e46188f=
23d1a48297f4e5942cec7b25959a" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/4c235e46188f23d1a48297f4e5942cec7b25959a</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v2 -&gt; v3:<br>
&gt;=C2=A0 - Fix syntax<br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 - Update nginx-modsecurity<br>
<br>
Isn&#39;t that a bit madness? If libmodsecurity has its copy of parts of<br=
>
mbedtls, but didn&#39;t take care of renaming the symbols, then ultimately<=
br>
what we should conclude is that using libmodsecurity in a statically<br>
linked configuration is not supported.<br>
<br>
So I would advocate for simplifying the whole thing and just make<br>
libmodsecurity and its reverse dependencies depends on !BR2_STATIC_LIBS<br>
and be done with it.<br>
<br>
What do you think?<br></blockquote><div><br></div><div>OK, I&#39;ll send a =
v4<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice <br></div></div></div>

--000000000000de948405f5293973--

--===============6319722673426628804==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6319722673426628804==--
