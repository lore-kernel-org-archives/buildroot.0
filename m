Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0477DC3ABB6
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 05:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90F6F8211C;
	Wed,  7 May 2025 05:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sK9neIMWBzS7; Wed,  7 May 2025 05:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47F0082091
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47F0082091;
	Wed,  7 May 2025 05:18:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2486F950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 05:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09C0A40BC2
 for <buildroot@buildroot.org>; Wed,  7 May 2025 05:18:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wpSkPWqmuJ8a for <buildroot@buildroot.org>;
 Wed,  7 May 2025 05:18:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 486BB40BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 486BB40BA1
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 486BB40BA1
 for <buildroot@buildroot.org>; Wed,  7 May 2025 05:18:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5fbf29d0ff1so279261a12.0
 for <buildroot@buildroot.org>; Tue, 06 May 2025 22:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746595112; x=1747199912;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=psZ7oP3mFHZSnXlW6yiSAqwOk1cUQ/+3fuK8Uy9hAMk=;
 b=ryDu+SeNCxDv2kcuFAJbx1XtNzoAa5cEZvWym+oMfwBu7eisG549NSt0Ngb8v1By1L
 xfB4xASAmCJY5MyZPuy2yQSDAj7xDKOLzxediYGyD+tMzhsHGn681YtGOCr3y0nmBICS
 Zg5o0ivYeI3hULlb+1B6M0FK+d50wKyAl4968xMeOrq+VnRbmfYhTl8vl1ctPsOy9sS7
 wj7rX7KmcHoYVkS74kBgm3P8am5XocM7y5/bHM0N5S+bGkVYyiD3LFb1035AkKCe/Ga6
 YfyIRybxfrGqFO2R21MhLxJX8clIce+CXyCxmZtxO+YIF6uDZBlr0tCDHmRLvJIIKvV5
 3xLA==
X-Gm-Message-State: AOJu0Yx+tcNjeCuI5QGez31LfUo9ekoOnLW3IMO51NUBbalIo2DSMxh7
 RbLo9T+qIWkKkjRcpLiZbxN6kKosvGFYMiB39EzeK2fyD2xIKubHwO5caUd5jeqY/rzNanVRmPk
 JJCVmmRpYnSRUB89veCRqiEgptvHGx5XW80s91C96E33re4Bmo/A=
X-Gm-Gg: ASbGnct6XCJyUPSn+daw8lUPBi5B/wqpufS95wyx2NuT3TYle+G6Z6cG98k61FxycxU
 XkOmE7tXutkwGnvdFq1qy7p81V8F9aEarlUrgKVrcae8T0eFiiCbtIl7eFTazNZ02CaNHy3YcKR
 LiIjRapEgRTv1+y4SOvhX+5Oo=
X-Google-Smtp-Source: AGHT+IGcePEbn7C0TQ8v4kxU4srEHOm91rcstl7uRArXKBkmLCZmQVx7FHND69m9b+ER8nML0VnkCuZMU8ZauvSYsQs=
X-Received: by 2002:a17:907:7da5:b0:ac3:48e4:f8bc with SMTP id
 a640c23a62f3a-ad1e8d54c0dmr192451166b.48.1746595112320; Tue, 06 May 2025
 22:18:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250331233726.3730509-1-daniel.crowe@maxmine.com.au>
 <20250331233726.3730509-5-daniel.crowe@maxmine.com.au>
 <20250420232753.65897f54@windsurf>
In-Reply-To: <20250420232753.65897f54@windsurf>
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
Date: Wed, 7 May 2025 14:48:21 +0930
X-Gm-Features: ATxdqUGgsUu4u9DFthgGtsGPlNEmTyZcjnbUfXRFKMvpZvXPxLeL6b_D2_VBBT0
Message-ID: <CA+dVm3MP9MjDPYpz_FieCaT-LQDcvcYAOoBGoSX2ubVFWL3ikw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1746595112; x=1747199912;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=psZ7oP3mFHZSnXlW6yiSAqwOk1cUQ/+3fuK8Uy9hAMk=;
 b=yg8jRYaiH94euGb6RCDSY1m9cwr0S9FEKWYr4suBi63PLSsyEbAteCfnpL8071owxs
 5vPFypx8Y+bxNYvylOeMeaZUBukqfJZdy7rGKZYTOs8Y12IXr3fE56AeNjv6NAlN1w/i
 soKnyv9RhnED6kXXxE4xTJEcs/oU8AYIRP1rro648P0yS9ay6zVFNP9Fz5cgjIG4Kznr
 F60H8VS5mK5H09z7ZGskncHIDB8n5aggaT+2t8jXGdvQZIwx0tK8ABwd02A0xth8dIyF
 lnwnnTy1V7A0KWYAosNfmfdXK4tuDgB95JSFlir8mCEnhEfkpzVsr8jfksvVUoECy5Tu
 qHRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=yg8jRYai
Subject: Re: [Buildroot] [PATCH 5/5] package/python-pyproj: add version 3.7.1
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
Content-Type: multipart/mixed; boundary="===============0465833233245629657=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0465833233245629657==
Content-Type: multipart/alternative; boundary="0000000000003c9343063484dde2"

--0000000000003c9343063484dde2
Content-Type: text/plain; charset="UTF-8"

Thanks for the excellent feedback Thomas.

You were quite right, it needed quite a bit of work to actually compile
correctly outside of my environment.

The testing infrastructure is really nice to play with!

I'll fix up and push another patch.

Thanks,
Daniel


On Mon, 21 Apr 2025 at 06:57, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
wrote:

> Hello Daniel,
>
> On Tue,  1 Apr 2025 10:07:26 +1030
> Daniel Crowe <daniel.crowe@maxmine.com.au> wrote:
>
> > Provides cartographic projections in Python
> > https://pyproj4.github.io/pyproj/stable/
> >
> > Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
>
> I was quite surprised that this didn't need any dependency on the
> "proj" library, so I tried to build it, and it fails with:
>
> * Getting build dependencies for wheel...
> ERROR: Cython.Build.cythonize not found. Cython is required to build
> pyproj.
>
> ERROR Backend subprocess exited when trying to invoke
> get_requires_for_build_wheel
>
> I just built:
>
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PER_PACKAGE_DIRECTORIES=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_PYPROJ=y
>
> Also, since it's a fairly complex Python package, could you add a test
> case in support/testing/? It can be as simple as some trivial examples
> from https://pyproj4.github.io/pyproj/stable/examples.html.
>
> See support/testing/tests/package/test_python_ubjson.py for a very
> simple example of Python test.
>
> (Also, please add an entry in the DEVELOPERS file. Thanks!)
>
> Thanks a lot!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--0000000000003c9343063484dde2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the excellent feedback Thomas.<div><br></div><d=
iv>You were quite right, it needed quite a bit of work to actually compile =
correctly outside of my environment.<div><br></div><div>The testing infrast=
ructure is really nice to play with!</div><div><br></div><div>I&#39;ll fix =
up and push another patch.</div><div><br></div><div>Thanks,</div><div>Danie=
l</div><div><br></div></div></div><br><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 21 Apr 2025 at 06=
:57, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">t=
homas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">Hello Daniel,<br>
<br>
On Tue,=C2=A0 1 Apr 2025 10:07:26 +1030<br>
Daniel Crowe &lt;<a href=3D"mailto:daniel.crowe@maxmine.com.au" target=3D"_=
blank">daniel.crowe@maxmine.com.au</a>&gt; wrote:<br>
<br>
&gt; Provides cartographic projections in Python<br>
&gt; <a href=3D"https://pyproj4.github.io/pyproj/stable/" rel=3D"noreferrer=
" target=3D"_blank">https://pyproj4.github.io/pyproj/stable/</a><br>
&gt; <br>
&gt; Signed-off-by: Daniel Crowe &lt;<a href=3D"mailto:daniel.crowe@maxmine=
.com.au" target=3D"_blank">daniel.crowe@maxmine.com.au</a>&gt;<br>
<br>
I was quite surprised that this didn&#39;t need any dependency on the<br>
&quot;proj&quot; library, so I tried to build it, and it fails with:<br>
<br>
* Getting build dependencies for wheel...<br>
ERROR: Cython.Build.cythonize not found. Cython is required to build pyproj=
.<br>
<br>
ERROR Backend subprocess exited when trying to invoke get_requires_for_buil=
d_wheel<br>
<br>
I just built:<br>
<br>
BR2_arm=3Dy<br>
BR2_cortex_a8=3Dy<br>
BR2_TOOLCHAIN_EXTERNAL=3Dy<br>
BR2_PER_PACKAGE_DIRECTORIES=3Dy<br>
BR2_PACKAGE_PYTHON3=3Dy<br>
BR2_PACKAGE_PYTHON_PYPROJ=3Dy<br>
<br>
Also, since it&#39;s a fairly complex Python package, could you add a test<=
br>
case in support/testing/? It can be as simple as some trivial examples<br>
from <a href=3D"https://pyproj4.github.io/pyproj/stable/examples.html" rel=
=3D"noreferrer" target=3D"_blank">https://pyproj4.github.io/pyproj/stable/e=
xamples.html</a>.<br>
<br>
See support/testing/tests/package/test_python_ubjson.py for a very<br>
simple example of Python test.<br>
<br>
(Also, please add an entry in the DEVELOPERS file. Thanks!)<br>
<br>
Thanks a lot!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--0000000000003c9343063484dde2--

--===============0465833233245629657==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0465833233245629657==--
