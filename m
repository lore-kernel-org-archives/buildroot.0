Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0784AC25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 19:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE56881C0A;
	Sun,  2 Jun 2024 19:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iTBk7sV7mSnj; Sun,  2 Jun 2024 19:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D37E814BA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D37E814BA;
	Sun,  2 Jun 2024 19:39:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E88C11BF3E3
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 19:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2148815CA
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 19:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id egvWzVPr7L_I for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 19:39:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51F05814BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51F05814BA
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51F05814BA
 for <buildroot@busybox.net>; Sun,  2 Jun 2024 19:39:05 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id
 41be03b00d2f7-652fd0bb5e6so2934815a12.0
 for <buildroot@busybox.net>; Sun, 02 Jun 2024 12:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717357144; x=1717961944;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mSV0H8Dxo8ke1OF17oqRVN4QNP4J6pNDXHF9iyrK24o=;
 b=gli/PS6Qx3jrsppaJQLVlvRBIEV0y76OdtXRN78WnVGTGmXIDA7XRjT3knnjvcY7V4
 tl8buzeCIcuKZAzuxxVVlVlif9SviBSH5T6pCPZzogT9Il51eNwqp0VL94BexTHnnUrP
 t7d/7VyPnC+FnvXCIAS2kA0JpxIPiMkJ3u6Jt+6N/JPX1oIPb0Ff90mo4mnDgosknCA+
 A38bCcEUjtO1hP0qHE27xBtvVV/ye3rhYV7v9IqNISZmMPvDLhcTFDpQpGVYFuHwnOB/
 sxKV2uLzcBIo7ZBs6TUr+9PglJlBJ2EReFLnFCUcMIuXM84ALnwvClT8F9BYdit4FrR2
 Nuag==
X-Gm-Message-State: AOJu0YxKQeid6CBNeYMhbhixA3cnUJcuVw4cBF0bSI7jiVTSW7w0GJLo
 JlH2VOtf1cKdbObYVcOFojgPK7rIS/esatrOsK38iwqbQv9YWLGkjTzfnEOTZ64+4BkN/+wOcO5
 DbIAYhRYSYVL3YH/rYsTqv3/KrdJ8GwHrp4XPQUGEQ4Yy86PGeQ==
X-Google-Smtp-Source: AGHT+IEinhySSNtxUr+oo4fjfsD+1vH9r168nQwvjYB0nR64UbsyieuQlAvBk/JJOw5A2bMRLKRi58g/5otXfe5koF0=
X-Received: by 2002:a17:902:eb8c:b0:1f6:3215:3d16 with SMTP id
 d9443c01a7336-1f63701639emr79352615ad.26.1717357143615; Sun, 02 Jun 2024
 12:39:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240602070634.597337-1-francois.perrad@gadz.org>
 <ZlyRs_aj7sXheiBt@landeda>
In-Reply-To: <ZlyRs_aj7sXheiBt@landeda>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 2 Jun 2024 21:38:52 +0200
Message-ID: <CAAE6iEV6T2av35km0sMCJ3FOukG9oCPie+Ot0POTGGfsraSCDg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1717357144; x=1717961944; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mSV0H8Dxo8ke1OF17oqRVN4QNP4J6pNDXHF9iyrK24o=;
 b=BaDttrBh15uI3vq8R0E8CxdV5WZnXZvPlNjINta4hJAmnSAFuIL0y5vW9WhpOAZA8j
 bL7fZiyO6hiNaTlzCNupo5Awmd1OWLbwKFcCHGaaEyZdqVZG1JXWTUaCO1FoCP6PTCjf
 TPJc8kqofXL36bO8pufjV9rzZroijkhF5n8C6CRGtJ4C24TxReu6S7TN5vlqEHu5R03U
 u0L6V7CnUgh3N72byw7xeyeBsASQXRN1lCImrfudrR0/A5K1SrrcAsLuMo9c7WMBimGP
 dWu7XFsFEAqm9EnP+V5EWK0NRj3MBLZKn4dNIATxCrHzVQRpwNqcavwDGFkmND9XPn3b
 yjkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=BaDttrBh
Subject: Re: [Buildroot] [PATCH] configs/olimex_stmp157_olinuxino_lime: add
 hashes
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============3159137121441413782=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3159137121441413782==
Content-Type: multipart/alternative; boundary="0000000000008004f90619ed5e12"

--0000000000008004f90619ed5e12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 2 juin 2024 =C3=A0 17:37, Yann E. MORIN <yann.morin.1998@free.fr> a
=C3=A9crit :

> Francois, All,
>
> On 2024-06-02 09:06 +0200, Francois Perrad spake thusly:
> > and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES
> >
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Thank you for this patch. It uncovered a very nasty issue we have had
> since we introduce _DL_SUBDIR more than 6 years ago now, and for which I
> just sent a fix:
>
>
> https://lore.kernel.org/buildroot/20240602145542.2485828-1-yann.morin.199=
8@free.fr/T/#u
>
> Basically, Peter and I spent quite some time trying to udnerstand why
> we got a hash different from yours:
>
>     $ make olimex_stmp157_olinuxino_lime_defconfig
>     $ make source
>     [...]
>     ERROR: while checking hashes from
> board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
>     ERROR: linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz has
> wrong sha256 hash:
>     ERROR: expected:
> 5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93
>     ERROR: got     :
> ee94af461da08f406408c70094582232a348b14069bc4dcbe7ff97e16cfe0c70
>     ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
> However, what was even stranger to us, was that the download was OK when
> we actually tried to directly trigger the linux download (there is a hint
> in the trace above, but we did not see it immediately):
>
>     $ make linux-source
>     [...]
>     linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz: OK
> (sha256: 5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93=
)
>
> So, sometimes the hash is OK, sometimes it is not? I seriously
> considered Gremlins at one point... ;-] Of course, when we identified
> the delta between the two archives, we eventually noticed the download
> was failing for linux-headers, not for linux...
>
> This is something that you too could have spotted on your side, if all
> you had done was to run the download from scratch to validate the change
> (I pretty much always do that to be sure):
>
>     $ rm -rf $(pwd)/dl-empty
>     $ make olimex_stmp157_olinuxino_lime_defconfig
>     $ BR2_DL_DIR=3D$(pwd)/dl-empty make source
>
> Anyway, that was a really nasty issue, but we now have a fix. Could you
> please help test and review that patch, please?
>
>
All sounds good.

Fran=C3=A7ois


> Regards,
> Yann E. MORIN.
>
> > ---
> >  .checkpackageignore                                           | 1 -
> >  .../stmp1_olinuxino/patches/linux-headers/linux-headers.hash  | 1 +
> >  board/olimex/stmp1_olinuxino/patches/linux/linux.hash         | 2 ++
> >  board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash         | 2 ++
> >  configs/olimex_stmp157_olinuxino_lime_defconfig               | 4 ++++
> >  5 files changed, 9 insertions(+), 1 deletion(-)
> >  create mode 120000
> board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
> >  create mode 100644 board/olimex/stmp1_olinuxino/patches/linux/linux.ha=
sh
> >  create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/uboot.ha=
sh
> >
> > diff --git a/.checkpackageignore b/.checkpackageignore
> > index 8f5fc0a47..201ec2a85 100644
> > --- a/.checkpackageignore
> > +++ b/.checkpackageignore
> > @@ -253,7 +253,6 @@ configs/olimex_a20_olinuxino_lime_defconfig
> lib_defconfig.ForceCheckHash
> >  configs/olimex_a20_olinuxino_micro_defconfig
> lib_defconfig.ForceCheckHash
> >  configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckHash
> >  configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckHash
> > -configs/olimex_stmp157_olinuxino_lime_defconfig
> lib_defconfig.ForceCheckHash
> >  configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash
> >  configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash
> >  configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash
> > diff --git
> a/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
> b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
> > new file mode 120000
> > index 000000000..5808d92af
> > --- /dev/null
> > +++
> b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers.hash
> > @@ -0,0 +1 @@
> > +../linux/linux.hash
> > \ No newline at end of file
> > diff --git a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
> b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
> > new file mode 100644
> > index 000000000..8691d5ffd
> > --- /dev/null
> > +++ b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed
> > +sha256
> 5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93
> linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz
> > diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
> b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
> > new file mode 100644
> > index 000000000..a991a1922
> > --- /dev/null
> > +++ b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash
> > @@ -0,0 +1,2 @@
> > +# Locally computed
> > +sha256
> 6aaa18a9023db29ceaad5bca240605990b68a6bf348aaefad0bee8be8d37648e
> uboot-efadf793a0a5924e2c96362dc1df3e56622ebb97-git4.tar.gz
> > diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig
> b/configs/olimex_stmp157_olinuxino_lime_defconfig
> > index 8bd8e10ca..ecfa78135 100644
> > --- a/configs/olimex_stmp157_olinuxino_lime_defconfig
> > +++ b/configs/olimex_stmp157_olinuxino_lime_defconfig
> > @@ -5,6 +5,10 @@ BR2_cortex_a7=3Dy
> >  # Linux headers same as kernel, a 5.10 series
> >  BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=3Dy
> >
> > +# Build
> > +BR2_GLOBAL_PATCH_DIR=3D"board/olimex/stmp1_olinuxino/patches"
> > +BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy
> > +
> >  # System configuration
> >  BR2_TARGET_GENERIC_HOSTNAME=3D"stmp1-olinuxino"
> >  BR2_TARGET_GENERIC_ISSUE=3D"Welcome to OLinuXino!"
> > --
> > 2.43.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--0000000000008004f90619ed5e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 2 juin 2024 =C3=A0=C2=A0=
17:37, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.mo=
rin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">Francois, All,<br>
<br>
On 2024-06-02 09:06 +0200, Francois Perrad spake thusly:<br>
&gt; and enable BR2_DOWNLOAD_FORCE_CHECK_HASHES<br>
&gt; <br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
<br>
Thank you for this patch. It uncovered a very nasty issue we have had<br>
since we introduce _DL_SUBDIR more than 6 years ago now, and for which I<br=
>
just sent a fix:<br>
<br>
=C2=A0 =C2=A0 <a href=3D"https://lore.kernel.org/buildroot/20240602145542.2=
485828-1-yann.morin.1998@free.fr/T/#u" rel=3D"noreferrer" target=3D"_blank"=
>https://lore.kernel.org/buildroot/20240602145542.2485828-1-yann.morin.1998=
@free.fr/T/#u</a><br>
<br>
Basically, Peter and I spent quite some time trying to udnerstand why<br>
we got a hash different from yours:<br>
<br>
=C2=A0 =C2=A0 $ make olimex_stmp157_olinuxino_lime_defconfig<br>
=C2=A0 =C2=A0 $ make source<br>
=C2=A0 =C2=A0 [...]<br>
=C2=A0 =C2=A0 ERROR: while checking hashes from board/olimex/stmp1_olinuxin=
o/patches/linux-headers/linux-headers.hash<br>
=C2=A0 =C2=A0 ERROR: linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.ta=
r.gz has wrong sha256 hash:<br>
=C2=A0 =C2=A0 ERROR: expected: 5d3ca43b81056305860d7407c871eac4f8eafa603029=
ee67816574a31444fd93<br>
=C2=A0 =C2=A0 ERROR: got=C2=A0 =C2=A0 =C2=A0: ee94af461da08f406408c70094582=
232a348b14069bc4dcbe7ff97e16cfe0c70<br>
=C2=A0 =C2=A0 ERROR: Incomplete download, or man-in-the-middle (MITM) attac=
k<br>
<br>
However, what was even stranger to us, was that the download was OK when<br=
>
we actually tried to directly trigger the linux download (there is a hint<b=
r>
in the trace above, but we did not see it immediately):<br>
<br>
=C2=A0 =C2=A0 $ make linux-source<br>
=C2=A0 =C2=A0 [...]<br>
=C2=A0 =C2=A0 linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz: O=
K (sha256: 5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a31444fd93=
)<br>
<br>
So, sometimes the hash is OK, sometimes it is not? I seriously<br>
considered Gremlins at one point... ;-] Of course, when we identified<br>
the delta between the two archives, we eventually noticed the download<br>
was failing for linux-headers, not for linux...<br>
<br>
This is something that you too could have spotted on your side, if all<br>
you had done was to run the download from scratch to validate the change<br=
>
(I pretty much always do that to be sure):<br>
<br>
=C2=A0 =C2=A0 $ rm -rf $(pwd)/dl-empty<br>
=C2=A0 =C2=A0 $ make olimex_stmp157_olinuxino_lime_defconfig<br>
=C2=A0 =C2=A0 $ BR2_DL_DIR=3D$(pwd)/dl-empty make source<br>
<br>
Anyway, that was a really nasty issue, but we now have a fix. Could you<br>
please help test and review that patch, please?<br>
<br></blockquote><div><br></div><div>All sounds good.</div><div><br></div><=
div>Fran=C3=A7ois</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex">
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 .checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 1 -<br>
&gt;=C2=A0 .../stmp1_olinuxino/patches/linux-headers/linux-headers.hash=C2=
=A0 | 1 +<br>
&gt;=C2=A0 board/olimex/stmp1_olinuxino/patches/linux/linux.hash=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 ++<br>
&gt;=C2=A0 configs/olimex_stmp157_olinuxino_lime_defconfig=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 4 ++++<br>
&gt;=C2=A0 5 files changed, 9 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 120000 board/olimex/stmp1_olinuxino/patches/linux-he=
aders/linux-headers.hash<br>
&gt;=C2=A0 create mode 100644 board/olimex/stmp1_olinuxino/patches/linux/li=
nux.hash<br>
&gt;=C2=A0 create mode 100644 board/olimex/stmp1_olinuxino/patches/uboot/ub=
oot.hash<br>
&gt; <br>
&gt; diff --git a/.checkpackageignore b/.checkpackageignore<br>
&gt; index 8f5fc0a47..201ec2a85 100644<br>
&gt; --- a/.checkpackageignore<br>
&gt; +++ b/.checkpackageignore<br>
&gt; @@ -253,7 +253,6 @@ configs/olimex_a20_olinuxino_lime_defconfig lib_de=
fconfig.ForceCheckHash<br>
&gt;=C2=A0 configs/olimex_a20_olinuxino_micro_defconfig lib_defconfig.Force=
CheckHash<br>
&gt;=C2=A0 configs/olimex_a33_olinuxino_defconfig lib_defconfig.ForceCheckH=
ash<br>
&gt;=C2=A0 configs/olimex_a64_olinuxino_defconfig lib_defconfig.ForceCheckH=
ash<br>
&gt; -configs/olimex_stmp157_olinuxino_lime_defconfig lib_defconfig.ForceCh=
eckHash<br>
&gt;=C2=A0 configs/olpc_xo175_defconfig lib_defconfig.ForceCheckHash<br>
&gt;=C2=A0 configs/olpc_xo1_defconfig lib_defconfig.ForceCheckHash<br>
&gt;=C2=A0 configs/orangepi_lite2_defconfig lib_defconfig.ForceCheckHash<br=
>
&gt; diff --git a/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-=
headers.hash b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-hea=
ders.hash<br>
&gt; new file mode 120000<br>
&gt; index 000000000..5808d92af<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/olimex/stmp1_olinuxino/patches/linux-headers/linux-headers=
.hash<br>
&gt; @@ -0,0 +1 @@<br>
&gt; +../linux/linux.hash<br>
&gt; \ No newline at end of file<br>
&gt; diff --git a/board/olimex/stmp1_olinuxino/patches/linux/linux.hash b/b=
oard/olimex/stmp1_olinuxino/patches/linux/linux.hash<br>
&gt; new file mode 100644<br>
&gt; index 000000000..8691d5ffd<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/olimex/stmp1_olinuxino/patches/linux/linux.hash<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +# Locally computed<br>
&gt; +sha256=C2=A0 5d3ca43b81056305860d7407c871eac4f8eafa603029ee67816574a3=
1444fd93=C2=A0 linux-fc74113e14d76aea9482264ff42e07397b94553d-git4.tar.gz<b=
r>
&gt; diff --git a/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash b/b=
oard/olimex/stmp1_olinuxino/patches/uboot/uboot.hash<br>
&gt; new file mode 100644<br>
&gt; index 000000000..a991a1922<br>
&gt; --- /dev/null<br>
&gt; +++ b/board/olimex/stmp1_olinuxino/patches/uboot/uboot.hash<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +# Locally computed<br>
&gt; +sha256=C2=A0 6aaa18a9023db29ceaad5bca240605990b68a6bf348aaefad0bee8be=
8d37648e=C2=A0 uboot-efadf793a0a5924e2c96362dc1df3e56622ebb97-git4.tar.gz<b=
r>
&gt; diff --git a/configs/olimex_stmp157_olinuxino_lime_defconfig b/configs=
/olimex_stmp157_olinuxino_lime_defconfig<br>
&gt; index 8bd8e10ca..ecfa78135 100644<br>
&gt; --- a/configs/olimex_stmp157_olinuxino_lime_defconfig<br>
&gt; +++ b/configs/olimex_stmp157_olinuxino_lime_defconfig<br>
&gt; @@ -5,6 +5,10 @@ BR2_cortex_a7=3Dy<br>
&gt;=C2=A0 # Linux headers same as kernel, a 5.10 series<br>
&gt;=C2=A0 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=3Dy<br>
&gt;=C2=A0 <br>
&gt; +# Build<br>
&gt; +BR2_GLOBAL_PATCH_DIR=3D&quot;board/olimex/stmp1_olinuxino/patches&quo=
t;<br>
&gt; +BR2_DOWNLOAD_FORCE_CHECK_HASHES=3Dy<br>
&gt; +<br>
&gt;=C2=A0 # System configuration<br>
&gt;=C2=A0 BR2_TARGET_GENERIC_HOSTNAME=3D&quot;stmp1-olinuxino&quot;<br>
&gt;=C2=A0 BR2_TARGET_GENERIC_ISSUE=3D&quot;Welcome to OLinuXino!&quot;<br>
&gt; -- <br>
&gt; 2.43.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div></div>

--0000000000008004f90619ed5e12--

--===============3159137121441413782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3159137121441413782==--
