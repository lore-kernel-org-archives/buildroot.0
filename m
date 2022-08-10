Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9632C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 617CC404CC;
	Wed, 10 Aug 2022 21:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 617CC404CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1V4o1mD1nft; Wed, 10 Aug 2022 21:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1E3404AA;
	Wed, 10 Aug 2022 21:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1E3404AA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B11611BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4606180A84
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:17:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4606180A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IteOtyh28CeS for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:17:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B0BF82861
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2B0BF82861
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:17:13 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10edfa2d57dso19387944fac.0
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 14:17:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=iConC9+3QOe+IjkeXIIfJ0/SCQvnFB9djVvayy6mYxo=;
 b=XMYKSB0d0FwtvTZ5SwtmRnzJtkT8RIHz6CyP3Lo2NN8Ra90/ogBIBREnbpSkzLZTjA
 aBxXmpQvfrPqbvW1lj9Bn0mvg6co3kMpvFLd3ae0EOOArrz4ATs9Nr1FCaXSHm1EYJ27
 iZjMjVS8FBvzK/l5xMUXdHu83JRg7oefhH2lkBxsqyetJNIBPpNAfXKa914Xn/A3kvmz
 480E22Wab4oAM2PLNgZiQ9/OI3P1W0Z2FTtzjiQFPrg9iHSgk3VgJ1B2MJg2hri8ySHT
 Q3+SCUQpW0YFasdCEFI9+tggo3nVvzXUmXIOKL6DJpZxFZ4ZpCe7qLHlxPr2kbYUGf8j
 wfTA==
X-Gm-Message-State: ACgBeo38k2iCXrkcnrrD9ZbmLTsR8EroaUnKRQhOjlJk/JtJd2iWHWrA
 LbyTv92XfoJPaWO6V3UO+WLbufXn/WqA5XkaF0dxwAWaNTw=
X-Google-Smtp-Source: AA6agR5qQMo8Oxn80UYmSNnlbFPQkAmC0K/odoNKVVp90ZrukmD01xtlphUztmllPnvm368hdzfvUrT9ddE2KapB5d8=
X-Received: by 2002:a05:6870:f20c:b0:10e:e5e3:dac2 with SMTP id
 t12-20020a056870f20c00b0010ee5e3dac2mr2429882oao.228.1660166232166; Wed, 10
 Aug 2022 14:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220809162714.1915094-1-fontaine.fabrice@gmail.com>
 <20220810230744.6b3b8bc7@windsurf>
In-Reply-To: <20220810230744.6b3b8bc7@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 10 Aug 2022 23:17:01 +0200
Message-ID: <CAPi7W83tLTuFGd6MB2uLDip5fhmEkFZx7xQOzaJ5qNaOKPF4Xw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=iConC9+3QOe+IjkeXIIfJ0/SCQvnFB9djVvayy6mYxo=;
 b=azdXbNQbayv+LxpSFRjA966JZqIvvLpE+2nXVy7WMcLriq7v8DSny5HbHOLcmVNUPx
 7RIlWJPDKzCH8kXGH217914ZBgephctkDKrBpZjCIwXf5MIivJhbe56jw46megFE28uG
 kLtPmWwo0cMD+ZW57WrIWGP1un8GajdTbHMb10veqjVckDbOR7DoLVAKx7+WczbVNPk5
 TAJIsepFgIXeNnYoTGnib4dfGf7boP/5HRVEptvxViEEL6OUQyYpgBUmkdMaqpUJVkCF
 5x9KWdid6GSO65Ttr30B5IVppOO/mUwGlG5qNFqb6tPEQByt47EGgeLAeA5Dok9ZdOOm
 gYTg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=azdXbNQb
Subject: Re: [Buildroot] [PATCH v2,
 1/1] utils/genrandconfig: disable libopenssl without atomics
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0856786483403685576=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0856786483403685576==
Content-Type: multipart/alternative; boundary="00000000000089570805e5e99201"

--00000000000089570805e5e99201
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Le mer. 10 ao=C3=BBt 2022 =C3=A0 23:07, Thomas Petazzoni <thomas.petazzoni@=
bootlin.com>
a =C3=A9crit :

> Hello Fabrice,
>
> On Tue,  9 Aug 2022 18:27:14 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
> > libatomic):
> >
> >
> ${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildroot=
-linux-uclibc-gcc}
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64  -O0 -=
g2
> -g2  -L.   \
> >       -o apps/openssl apps/asn1pars.o apps/ca.o apps/ciphers.o
> apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o apps/dsa.o
> apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine.o
> apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o
> apps/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o
> apps/pkcs8.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o
> apps/rand.o apps/rehash.o apps/req.o apps/rsa.o apps/rsautl.o
> apps/s_client.o apps/s_server.o apps/s_time.o apps/sess_id.o apps/smime.o
> apps/speed.o apps/spkac.o apps/srp.o apps/storeutl.o apps/ts.o
> apps/verify.o apps/version.o apps/x509.o \
> >        apps/libapps.a -lssl -lcrypto -ldl
> >
> /nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-linu=
x-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
> ./libssl.so: undefined reference to `__atomic_fetch_sub_4'
>
> Why don't we link openssl with libatomic?
>

> libatomic provides atomic builtins on all architectures.
>

Indeed, but libatomic is not available/enabled on all those autobuilder
build failures.
For example, BR2_TOOLCHAIN_HAS_LIBATOMIC can't be found in
http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbb=
c539/config


>
> It is normally already the case:
>
>                         $(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic) \
>
> in LIBOPENSSL_CONFIGURE_CMDS. But I see this linker flag is missing in
> the compile command line that causes the error.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--00000000000089570805e5e99201
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 10 ao=C3=BBt 2022 =C3=A0=C2=A023=
:07, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">t=
homas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hello Fabrice,<br>
<br>
On Tue,=C2=A0 9 Aug 2022 18:27:14 +0200<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; libopenssl needs atomic or the build will fail (e.g. on sparcv8 withou=
t<br>
&gt; libatomic):<br>
&gt; <br>
&gt; ${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildr=
oot-linux-uclibc-gcc}=C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FI=
LE_OFFSET_BITS=3D64=C2=A0 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE=
_OFFSET_BITS=3D64=C2=A0 -O0 -g2=C2=A0 -g2=C2=A0 -L.=C2=A0 =C2=A0\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-o apps/openssl apps/asn1pars.o apps/ca.o ap=
ps/ciphers.o apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o=
 apps/dsa.o apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine=
.o apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o app=
s/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o apps/pkcs8=
.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o apps/rand.o app=
s/rehash.o apps/req.o apps/rsa.o apps/rsautl.o apps/s_client.o apps/s_serve=
r.o apps/s_time.o apps/sess_id.o apps/smime.o apps/speed.o apps/spkac.o app=
s/srp.o apps/storeutl.o apps/ts.o apps/verify.o apps/version.o apps/x509.o =
\<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 apps/libapps.a -lssl -lcrypto -ldl<br>
&gt; /nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-l=
inux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./libss=
l.so: undefined reference to `__atomic_fetch_sub_4&#39;<br>
<br>
Why don&#39;t we link openssl with libatomic?<br></blockquote><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
<br>
libatomic provides atomic builtins on all architectures.<br></blockquote><d=
iv><br></div><div>Indeed, but libatomic is not available/enabled on all tho=
se autobuilder build failures.<br></div><div>For example, BR2_TOOLCHAIN_HAS=
_LIBATOMIC can&#39;t be found in<br></div><div><a href=3D"http://autobuild.=
buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539/config">http=
://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539=
/config</a> </div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
It is normally already the case:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 $(if $(BR2_TOOLCHAIN_HAS_LIBATOMIC),-latomic) \<br>
<br>
in LIBOPENSSL_CONFIGURE_CMDS. But I see this linker flag is missing in<br>
the compile command line that causes the error.<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice<br></div></div></div>

--00000000000089570805e5e99201--

--===============0856786483403685576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0856786483403685576==--
