Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87585C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 13:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B80E4052B;
	Wed, 27 Jul 2022 13:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B80E4052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJ23aS4cvhOz; Wed, 27 Jul 2022 13:13:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6BC2A40134;
	Wed, 27 Jul 2022 13:13:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BC2A40134
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 89AE91BF2BA
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6CA4E40154
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 13:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6CA4E40154
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2xz09bVu8EED for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 13:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 422A840134
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 422A840134
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 13:12:55 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 p5-20020a4a4805000000b0043548dba757so3196344ooa.8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 06:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a8PJYUpXbZxnXAGZipeuVpF5O+Kfl6rWiJG6xGWHEyI=;
 b=WWC6x9HWP1Z47T5mt7l9iiDdpwySU1780qejsxkW8X0VjcWS5CXXz9rD/L/TkuXnIv
 CUWtMBhRjG97cOiSEkrZ/h41QbFwzfJMuwrZZdYA1zbC1A/HBS+HZZdqae88mqUQhs1s
 ewwVfwjZUn2CcvLYz3V5y9HyI+i/zvpH1xl5iJaWFeJ0E8jKxGJebGF1b5oaSXxKzjZ1
 +HtnRLHp2p9W0shyWNJ9UvJwG7rpZWo0Lm+RRapbwRSSYv85KBk6b41RyZAf8el4GsPJ
 QOZi80DOsOg3TLekDh1AVnEbG0DJYWbB4Q2YkVsfUnCIP5MZ26NeD92eeeHgA5XL7uGD
 dA0w==
X-Gm-Message-State: AJIora+RPE6jsSIGc4H6W8RIhxmvyy3ZxP9xJcghoPNZVuO07tt46Fbf
 JRKy5m0/Qf4TonOw1Km3UxaJTiNwPY/yy7mSxGk=
X-Google-Smtp-Source: AGRyM1s7WhWwUYZog00iYpECxIqpk3ouiov19aRV5NlDMfkwyb4gqA8+IjdILV9VFo2PlhzldU/s1bu/ZkhgakMgmeA=
X-Received: by 2002:a4a:d10e:0:b0:435:ebf8:4cdb with SMTP id
 k14-20020a4ad10e000000b00435ebf84cdbmr4196328oor.0.1658927574218; Wed, 27 Jul
 2022 06:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220108224337.3702128-1-fontaine.fabrice@gmail.com>
 <c1c3040b-d429-dcaf-6e97-5f0c8367b48a@mind.be>
 <CAPi7W82V0nFCRi55MPsHV7DPQFSrGRmy1_mpFAhjj-MEgv6=DA@mail.gmail.com>
 <574b8f3f-6a94-2517-2d7b-b59b102afefe@mind.be>
In-Reply-To: <574b8f3f-6a94-2517-2d7b-b59b102afefe@mind.be>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 27 Jul 2022 15:12:43 +0200
Message-ID: <CAPi7W81Rx_xHu4v6QhdkKJ-7cj-Xv9Wef5-xaPzGa63qGRNR_g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=a8PJYUpXbZxnXAGZipeuVpF5O+Kfl6rWiJG6xGWHEyI=;
 b=kXN1NMxWCsWW+K5cMFWDeRd/xAp6opItbU+JCb/udwGjvvVrOjcn6nbLcaUceKO/pN
 VjitjX1eSGLwtB9qj/s3JrUGSRJ2Bl9JaL1ZO0oWCRFvJg0iICtlB89J2YOZQAQIyMEd
 NdxJbgxVXzryRD2AdnK69xV5DdnqvVYgxRy8GvIiDPzWUjWw+sUMEiwJAnRVWaICr6A3
 pDEAXSwpr2XBwPD4uxjdKtg5N/jprSkWsMpkFC4jJ+yi9fN3I+7oZKOlQBjqVkqRTeFV
 jy5oi9t4yoojHV0u1Qbp+EPhRLrFLL7HJ1n+egA16r0wpiIha8iWs/NluVcsAj0hjOM1
 tYMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kXN1NMxW
Subject: Re: [Buildroot] [PATCH 1/2] package/minizip: add minizip-zlib
 support
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
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1018531280355735438=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1018531280355735438==
Content-Type: multipart/alternative; boundary="000000000000c4fd8805e4c92c29"

--000000000000c4fd8805e4c92c29
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mer. 27 juil. 2022 =C3=A0 14:49, Arnout Vandecappelle <arnout@mind.be> a
=C3=A9crit :

>
>
> On 27/07/2022 14:05, Fabrice Fontaine wrote:
> > Hi Arnout,
> >
> > Le mer. 27 juil. 2022 =C3=A0 13:08, Arnout Vandecappelle <arnout@mind.b=
e
> > <mailto:arnout@mind.be>> a =C3=A9crit :
> >
> >        Hi Fabrice,
> >
> >     On 08/01/2022 23:43, Fabrice Fontaine wrote:
> >      > Add a virtual package to allow the user to select the minizip
> provider:
> >
> >        A virtual package should be used when the alternatives are more
> or less
> >     drop-in replacements. Here, however, they are absolutely not: they
> install
> >     completely different header files and libraries. There is no way
> that something
> >     that expects minizip-ng can build with minizip-zlib or vice versa.
> >
> >        In addition, the two can be installed in parallel.
> >
> >
> > That's not completely true: minizip(-ng) and minizip-legacy can be
> installed in
> > parallel only if compatibility headers are disabled (which is done sinc=
e
> commit
> > fc166894b3f257c4cb20d84368c918f3335dadf5).
> > Ideally, it would be great to enable back those compatibility headers.
> > Should I make this new option dependent on !BR2_PACKAGE_MINIZIP_LEGACY
> instead
> > of making a virtual package?
>
>   Ah, I missed that, thanks for the observation.
>
>   But then I wonder: can't domoticz be compiled with
> BR2_PACKAGE_MINIZIP_LEGACY?
> I haven't looked into the zlib changelogs, but since minizip is under
> contrib/,
> I don't actually expect much activity there. So it makes more sense to us=
e
> minizip-ng everywhere.
>
>   Hang on... Where is BR2_PACKAGE_MINIZIP_LEGACY? Where are those
> compatibility
> headers? I checked the source of our current minizip(-ng) and can't find
> them
> anywhere, and I don't see BR2_PACKAGE_MINIZIP_LEGACY in your patch
> either...
>

My patch didn't add any BR2_PACKAGE_MINIZIP_LEGACY option. This was just a
proposal to avoid making a virtual package.


>
>   Oh, hang on 2: there is in fact a MZ_COMPAT cmake option which we
> currently
> don't enable, and it looks like that one does enable the compatibility
> headers.
>

MZ_COMPAT was disabled by commit fc166894b3f257c4cb20d84368c918f3335dadf5
to avoid a build failure with domoticz.


>
> >        So there's no reason at all to make it a virtual package.
> >
> >
> > I decided to make a virtual package because there was already a virtual
> package
> > for zlib and zlib-ng.
> > I thought that we were in the same situation with minizip(-ng) and
> minizip-legacy.
>
>   zlib and zlib-ng are both maintained, so that's different.
>

Actually, minizip and minizip(-ng) are both maintained. Latest commit on
minizip was made on January:
https://github.com/madler/zlib/commits/master/contrib/minizip/minizip.c


>
>   I'd propose the following:
>
> if MZ_COMPAT works with domoticz; then
>         1. Add BR2_PACKAGE_MINIZIP_LEGACY
>         2. Select BR2_PACKAGE_MINIZIP{,_LEGACY} from domoticz
> else
>         1. Introduce minizip-legacy as a virtual package
>         2. Add BR2_PACKAGE_MINIZIP_LEGACY_COMPAT to minizip that
> implements the virtual
> package
>         3. Add minizip-zlib package
>         4. select minizip-zlib from domoticz
> fi
>
>   Note that for 4. you need something like we have for openssl, an
> additional
> blind symbol that allows selecting a specific minizip-legacy
> implementation.
>

OK, I'll go for the second option.


>
>
> >      >   - the current minizip (which has been renamed minizip-ng since
> >      >
> >
> https://github.com/zlib-ng/minizip-ng/commit/db95894646b87f6178ceaa389cbd=
b5b1ba8cd97a
> >     <
> https://github.com/zlib-ng/minizip-ng/commit/db95894646b87f6178ceaa389cbd=
b5b1ba8cd97a
> >)
> >
> >        It would make more sense to switch the existing minizip package
> to this new
> >     upstream repository.
> >
> >
> > Actually, we're already shipping minizip-ng as minizip.
>
>   Yes, but we are currently using a different github project.
>
>   So before (or independent) of all the rest, I'd send a patch that just
> changes
> the SITE used by minizip.
>

OK, I'll send a patch but basically this is the same github project:
https://github.com/nmoinvaz/minizip-ng is just a symlink to
https://github.com/zlib-ng/minizip-ng


>
>
> > However, minizip-ng is
> > not really widely used by the opensource community. For example,
> domoticz only
> > supports minizip-legacy.
>
>   vlc at least seems to support it. And those are the only two in
> buildroot that
> have any minizip support AFAICS, so not much basis to draw a conclusion.
>
>
>   Regards,
>   Arnout
>
> >        We could rename the package to minizip-ng, but we generally avoi=
d
> that. It's
> >     just annoyance for people who upgrade buildroot (legacy handling
> helps, but it
> >     is still annoying), and there is no benefit at all other than
> "consistency".
> >
> >
> > OK, I can send a v2 which doesn't rename minizip as minizip-ng.
> >
> >
> >      >   - the 'legacy' minizip provided by zlib which is still widely
> supported
> >      >     by various opensource packages such as domoticz
> >
> >        We should just add a package minizip-zlib.
> >
> >
> >
> >      > There is no need to add entries in Config.legacy as the previous
> options
> >      > are kept and the default provider of minizip is minizip-ng.
> >      >
> >      > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com
> >     <mailto:fontaine.fabrice@gmail.com>>
> >
> >     [snip]
> >      > diff --git a/package/minizip-zlib/minizip-zlib.mk
> >     <http://minizip-zlib.mk> b/package/minizip-zlib/minizip-zlib.mk
> >     <http://minizip-zlib.mk>
> >      > new file mode 100644
> >      > index 0000000000..67d4e31f41
> >      > --- /dev/null
> >      > +++ b/package/minizip-zlib/minizip-zlib.mk <
> http://minizip-zlib.mk>
> >      > @@ -0,0 +1,24 @@
> >      >
> >
>  +#######################################################################=
#########
> >      > +#
> >      > +# minizip-zlib
> >      > +#
> >      >
> >
>  +#######################################################################=
#########
> >      > +
> >      > +MINIZIP_ZLIB_VERSION =3D 1.2.11
> >      > +MINIZIP_ZLIB_SOURCE =3D zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
> >      > +MINIZIP_ZLIB_SITE =3D http://www.zlib.net <http://www.zlib.net>
> >      > +MINIZIP_ZLIB_LICENSE =3D Zlib
> >      > +MINIZIP_ZLIB_LICENSE_FILES =3D README
> >      > +MINIZIP_ZLIB_INSTALL_STAGING =3D YES
> >      > +MINIZIP_ZLIB_PROVIDES =3D minizip
> >      > +MINIZIP_ZLIB_SUBDIR =3D contrib/minizip
> >      > +MINIZIP_ZLIB_AUTORECONF =3D YES
> >
> >        Please add a comment why autoreconf is needed.
> >
> >        Regards,
> >        Arnout
> >
> >      > +MINIZIP_ZLIB_DEPENDENCIES =3D zlib
> >      > +
> >      > +ifeq ($(BR2_PACKAGE_MINIZIP_DEMOS),y)
> >      > +MINIZIP_ZLIB_CONF_OPTS +=3D --enable-demos
> >      > +else
> >      > +MINIZIP_ZLIB_CONF_OPTS +=3D --disable-demos
> >      > +endif
> >      > +
> >      > +$(eval $(autotools-package))
> >     [snip]
> >
> >
> > Best Regards,
> >
> > Fabrice
>

Best Regards,

Fabrice

--000000000000c4fd8805e4c92c29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mer. 27 juil. 2022 =C3=A0=C2=
=A014:49, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout=
@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><br>
<br>
On 27/07/2022 14:05, Fabrice Fontaine wrote:<br>
&gt; Hi Arnout,<br>
&gt; <br>
&gt; Le=C2=A0mer. 27 juil. 2022 =C3=A0=C2=A013:08, Arnout Vandecappelle &lt=
;<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a> <br=
>
&gt; &lt;mailto:<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@=
mind.be</a>&gt;&gt; a =C3=A9crit=C2=A0:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hi Fabrice,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 08/01/2022 23:43, Fabrice Fontaine wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Add a virtual package to allow the user to se=
lect the minizip provider:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 A virtual package should be used when the a=
lternatives are more or less<br>
&gt;=C2=A0 =C2=A0 =C2=A0drop-in replacements. Here, however, they are absol=
utely not: they install<br>
&gt;=C2=A0 =C2=A0 =C2=A0completely different header files and libraries. Th=
ere is no way that something<br>
&gt;=C2=A0 =C2=A0 =C2=A0that expects minizip-ng can build with minizip-zlib=
 or vice versa.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 In addition, the two can be installed in pa=
rallel.<br>
&gt; <br>
&gt; <br>
&gt; That&#39;s not completely true: minizip(-ng) and minizip-legacy can be=
 installed in <br>
&gt; parallel only if compatibility headers are disabled (which is done sin=
ce commit <br>
&gt; fc166894b3f257c4cb20d84368c918f3335dadf5).<br>
&gt; Ideally, it would be great to enable back those compatibility headers.=
<br>
&gt; Should I make this new option dependent on !BR2_PACKAGE_MINIZIP_LEGACY=
 instead <br>
&gt; of making a virtual package?<br>
<br>
=C2=A0 Ah, I missed that, thanks for the observation.<br>
<br>
=C2=A0 But then I wonder: can&#39;t domoticz be compiled with BR2_PACKAGE_M=
INIZIP_LEGACY? <br>
I haven&#39;t looked into the zlib changelogs, but since minizip is under c=
ontrib/, <br>
I don&#39;t actually expect much activity there. So it makes more sense to =
use <br>
minizip-ng everywhere.<br>
<br>
=C2=A0 Hang on... Where is BR2_PACKAGE_MINIZIP_LEGACY? Where are those comp=
atibility <br>
headers? I checked the source of our current minizip(-ng) and can&#39;t fin=
d them <br>
anywhere, and I don&#39;t see BR2_PACKAGE_MINIZIP_LEGACY in your patch eith=
er...<br></blockquote><div><br></div><div>My patch didn&#39;t add any BR2_P=
ACKAGE_MINIZIP_LEGACY option. This was just a proposal to avoid making a vi=
rtual package.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
=C2=A0 Oh, hang on 2: there is in fact a MZ_COMPAT cmake option which we cu=
rrently <br>
don&#39;t enable, and it looks like that one does enable the compatibility =
headers.<br></blockquote><div><br></div><div>MZ_COMPAT was disabled by comm=
it fc166894b3f257c4cb20d84368c918f3335dadf5 to avoid a build failure with d=
omoticz.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 So there&#39;s no reason at all to make it =
a virtual package.<br>
&gt; <br>
&gt; <br>
&gt; I decided to make a virtual package because there was already a virtua=
l package <br>
&gt; for zlib and zlib-ng.<br>
&gt; I thought that we were in the same situation with minizip(-ng) and min=
izip-legacy.<br>
<br>
=C2=A0 zlib and zlib-ng are both maintained, so that&#39;s different.<br></=
blockquote><div><br></div><div>Actually, minizip and minizip(-ng) are both =
maintained. Latest commit on minizip was made on January:</div><div><a href=
=3D"https://github.com/madler/zlib/commits/master/contrib/minizip/minizip.c=
">https://github.com/madler/zlib/commits/master/contrib/minizip/minizip.c</=
a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 I&#39;d propose the following:<br>
<br>
if MZ_COMPAT works with domoticz; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. Add BR2_PACKAGE_MINIZIP_LEGACY<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. Select BR2_PACKAGE_MINIZIP{,_LEGACY} from do=
moticz<br>
else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 1. Introduce minizip-legacy as a virtual packag=
e<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2. Add BR2_PACKAGE_MINIZIP_LEGACY_COMPAT to min=
izip that implements the virtual <br>
package<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 3. Add minizip-zlib package<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 4. select minizip-zlib from domoticz<br>
fi<br>
<br>
=C2=A0 Note that for 4. you need something like we have for openssl, an add=
itional <br>
blind symbol that allows selecting a specific minizip-legacy implementation=
.<br></blockquote><div><br></div><div>OK, I&#39;ll go for the second option=
.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0- the current minizip (which has =
been renamed minizip-ng since<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/zlib-ng/minizip-ng/co=
mmit/db95894646b87f6178ceaa389cbdb5b1ba8cd97a" rel=3D"noreferrer" target=3D=
"_blank">https://github.com/zlib-ng/minizip-ng/commit/db95894646b87f6178cea=
a389cbdb5b1ba8cd97a</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/zlib-ng/minizip-n=
g/commit/db95894646b87f6178ceaa389cbdb5b1ba8cd97a" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/zlib-ng/minizip-ng/commit/db95894646b87f617=
8ceaa389cbdb5b1ba8cd97a</a>&gt;)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 It would make more sense to switch the exis=
ting minizip package to this new<br>
&gt;=C2=A0 =C2=A0 =C2=A0upstream repository.<br>
&gt; <br>
&gt; <br>
&gt; Actually, we&#39;re already shipping minizip-ng as minizip.<br>
<br>
=C2=A0 Yes, but we are currently using a different github project.<br>
<br>
=C2=A0 So before (or independent) of all the rest, I&#39;d send a patch tha=
t just changes <br>
the SITE used by minizip.<br></blockquote><div><br></div><div>OK, I&#39;ll =
send a patch but basically this is the same github project: <br></div><div>=
<a href=3D"https://github.com/nmoinvaz/minizip-ng">https://github.com/nmoin=
vaz/minizip-ng</a> is just a symlink to</div><div><a href=3D"https://github=
.com/zlib-ng/minizip-ng">https://github.com/zlib-ng/minizip-ng</a></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt; However, minizip-ng is <br>
&gt; not really widely used by the opensource community. For example, domot=
icz only <br>
&gt; supports minizip-legacy.<br>
<br>
=C2=A0 vlc at least seems to support it. And those are the only two in buil=
droot that <br>
have any minizip support AFAICS, so not much basis to draw a conclusion.<br=
>
<br>
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 We could rename the package to minizip-ng, =
but we generally avoid that. It&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0just annoyance for people who upgrade buildroot (le=
gacy handling helps, but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0is still annoying), and there is no benefit at all =
other than &quot;consistency&quot;. <br>
&gt; <br>
&gt; <br>
&gt; OK, I can send a v2 which doesn&#39;t rename minizip as minizip-ng.<br=
>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0- the &#39;legacy&#39; minizip pr=
ovided by zlib which is still widely supported<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0by various opensource pack=
ages such as domoticz<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 We should just add a package minizip-zlib.<=
br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; There is no need to add entries in Config.leg=
acy as the previous options<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; are kept and the default provider of minizip =
is minizip-ng.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Fabrice Fontaine &lt;<a href=
=3D"mailto:fontaine.fabrice@gmail.com" target=3D"_blank">fontaine.fabrice@g=
mail.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:fontaine.fabrice@gmail=
.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0[snip]<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; diff --git a/package/minizip-zlib/<a href=3D"=
http://minizip-zlib.mk" rel=3D"noreferrer" target=3D"_blank">minizip-zlib.m=
k</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://minizip-zlib.mk" rel=3D"noref=
errer" target=3D"_blank">http://minizip-zlib.mk</a>&gt; b/package/minizip-z=
lib/<a href=3D"http://minizip-zlib.mk" rel=3D"noreferrer" target=3D"_blank"=
>minizip-zlib.mk</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://minizip-zlib.mk" rel=3D"noref=
errer" target=3D"_blank">http://minizip-zlib.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; new file mode 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; index 0000000000..67d4e31f41<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --- /dev/null<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +++ b/package/minizip-zlib/<a href=3D"http://=
minizip-zlib.mk" rel=3D"noreferrer" target=3D"_blank">minizip-zlib.mk</a> &=
lt;<a href=3D"http://minizip-zlib.mk" rel=3D"noreferrer" target=3D"_blank">=
http://minizip-zlib.mk</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; @@ -0,0 +1,24 @@<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+##################################################=
##############################<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +# minizip-zlib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +#<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+##################################################=
##############################<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_VERSION =3D 1.2.11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_SOURCE =3D zlib-$(MINIZIP_ZLIB_=
VERSION).tar.xz<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_SITE =3D <a href=3D"http://www.=
zlib.net" rel=3D"noreferrer" target=3D"_blank">http://www.zlib.net</a> &lt;=
<a href=3D"http://www.zlib.net" rel=3D"noreferrer" target=3D"_blank">http:/=
/www.zlib.net</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_LICENSE =3D Zlib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_LICENSE_FILES =3D README<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_PROVIDES =3D minizip<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_SUBDIR =3D contrib/minizip<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_AUTORECONF =3D YES<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Please add a comment why autoreconf is need=
ed.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 Arnout<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_DEPENDENCIES =3D zlib<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +ifeq ($(BR2_PACKAGE_MINIZIP_DEMOS),y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_CONF_OPTS +=3D --enable-demos<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +MINIZIP_ZLIB_CONF_OPTS +=3D --disable-demos<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +endif<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; +$(eval $(autotools-package))<br>
&gt;=C2=A0 =C2=A0 =C2=A0[snip]<br>
&gt; <br>
&gt; <br>
&gt; Best Regards,<br>
&gt; <br>
&gt; Fabrice<br></blockquote><div><br></div><div>Best Regards,</div><div><b=
r></div><div>Fabrice<br></div></div></div>

--000000000000c4fd8805e4c92c29--

--===============1018531280355735438==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1018531280355735438==--
