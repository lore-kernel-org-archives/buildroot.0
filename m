Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10641C636D7
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 14:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A681401CA;
	Tue, 21 Feb 2023 14:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A681401CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7pF3abZLPpq; Tue, 21 Feb 2023 14:10:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FE4E40354;
	Tue, 21 Feb 2023 14:10:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FE4E40354
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3D471BF3C9
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D395812F9
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 14:10:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D395812F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4JBJq_Es2vV for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 14:09:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DEDE81295
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7DEDE81295
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 14:09:59 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 i1-20020a17090ad34100b00234463de251so4952768pjx.3
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 06:09:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3fSlRpMsZ0jOi35nY7ZnvHXK/YGy/qUWNL7BfsOLk0M=;
 b=gAeDJ6xSuiTxT2XRGajNrpztcIScPVBUMVjS+FSvwcsp4XNCf/is+7JyPR0TVHz+cx
 OMsRf0X77uVJxb1IoKBWbtjlyA1Ijl/EWFMhjSJQVo6c1Cnd47lhTEznc9Wsc9/NEsyT
 IdrsC6MPaVKhujkmyVihEtrj/4gji/Gh+RpIkLIueWWV21lA5CSGzFa8uMqrH+Xhh+qV
 EGHYRBSqf09xUpHmP6AV3/SI6HGnaNybORccAuNafY7RlTPMYmWqeR7L5xt1YMUPod+0
 SLa5XImTsFfFtXKf1x7w3BOITaCipmJpn46sObx4V0vAIZf09/kCuBNo3kI96Ec99Ril
 2o9w==
X-Gm-Message-State: AO0yUKVxisEcL0btGrwG0Wn4pA/cdeHD4ZKYIybkdj2wl+a44PEPIRVW
 w8wjvS7fnXpQyT9zQfjzknFUGpC1I5zzGz5xT6k=
X-Google-Smtp-Source: AK7set9j1xCYNI+97X5R1l7l6QbdsJ4j1gqdxX5nt6DAnOfFhhkYa1+yDi1++IICNR7oAOiCG1VvugSvTBznWXtKVoE=
X-Received: by 2002:a17:902:7789:b0:19c:a0bc:13dc with SMTP id
 o9-20020a170902778900b0019ca0bc13dcmr80130pll.21.1676988598483; Tue, 21 Feb
 2023 06:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20230221112911.177963-1-fontaine.fabrice@gmail.com>
 <20230221150122.63e353f7@windsurf>
In-Reply-To: <20230221150122.63e353f7@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Feb 2023 15:09:47 +0100
Message-ID: <CAPi7W80vMSG032z4F_R94DkaKZ1YoD+z5UG8-7U6-kqi3_Nkqg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3fSlRpMsZ0jOi35nY7ZnvHXK/YGy/qUWNL7BfsOLk0M=;
 b=WWFQ8+abbRNSv8lMC+rgqlL9Squ5+EJaQgYqmAQYKbtglYXEImftXLgA5y+sIij6lq
 YWkLPh3iMGqtEjExUAe71oYLGPEBnCdsawD6Db0eoeusPEm34U+n0LfFWqTKm5jVg5a8
 3ZrjhaETJXQs5LhtCKfv8iWIBdYM7iUGunpD4NbCOlsyEADxGMye4miOTWALm51Ms3gZ
 K25JNtSBcrXVkbKjskmNScy7mIDH24/fkFenVyX01V6WhauRoFNAAKFVcrl60y+Go5Rn
 jAHPd5VreDXYU7tZF8TlqkIBiAjtCSdbtViiWy2BcuM9WaGOjplI4T6nla0EgtspYfJq
 cdqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WWFQ8+ab
Subject: Re: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-synopsys-arc: drop locale
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5313760636587679533=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5313760636587679533==
Content-Type: multipart/alternative; boundary="000000000000b4809805f53655f6"

--000000000000b4809805f53655f6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 21 f=C3=A9vr. 2023 =C3=A0 15:01, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Tue, 21 Feb 2023 12:29:11 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > locale is not enabled resulting in the following libcpprestsdk build
> > failure:
> >
> > In file included from
> /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Re=
lease/include/cpprest/json.h:18,
> >                  from
> /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Re=
lease/src/pch/stdafx.h:88,
> >                  from
> /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Re=
lease/src/http/client/http_client_msg.cpp:13:
> >
> /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Re=
lease/include/cpprest/asyncrt_utils.h:317:13:
> error: 'locale_t' does not name a type
> >   317 |     typedef locale_t xplat_locale;
> >       |             ^~~~~~~~
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/e6778e60cc1ea455f5b4511d5824f04d80=
40f67b
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> The thing is that the toolchain claims to have locale support:
>
> $ grep LOCALE
> output/host/opt/ext-toolchain/arc-snps-linux-uclibc/sysroot/usr/include/b=
its/uClibc_config.h
>
> #define __UCLIBC_HAS_LOCALE__ 1
> #define __UCLIBC_BUILD_MINIMAL_LOCALE__ 1
> #undef __UCLIBC_BUILD_ALL_LOCALE__
> #define __UCLIBC_BUILD_MINIMAL_LOCALES__ "en_US"
> #undef __UCLIBC_HAS_XLOCALE__
>

I think the issue is that __UCLIBC_HAS_XLOCALE__ is disabled.
To my understanding, locale_t is defined in xlocale.h:
https://github.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e88718=
2948f627be/include/xlocale.h#L46

I'm far from being an expert in locale/uclibc-ng so I'm a bit lost between
all those variables ...
In uclibc.mk, we're enabling UCLIBC_HAS_XLOCALE in UCLIBC_LOCALE_CONFIG
hook.


>
> Are you sure your commit doesn't break the build? Indeed normally for
> external toolchains, we verify that the Buildroot configuration matches
> the toolchain, and abort the build if not. So if the toolchain supports
> locale (which it does here according to __UCLIBC_HAS_LOCALE__) but your
> Buildroot configuration doesn't say so, the build should normally abort
> with:
>
> XYZ available in C library, please enable ABC
>
> See in toolchains/helpers.mk:
>
> check_uclibc_feature =3D \
>         IS_IN_LIBC=3D`grep -q "\#define $(1) 1" $(3) && echo y` ; \
>         if [ -z "$(2)" ] ; then \
>                 if [ "$${IS_IN_LIBC}" !=3D "y" ] ; then \
>                         echo "$(4) not available in C library, toolchain
> unsuitable for Buildroot" ; \
>                         exit 1 ; \
>                 fi ; \
>         else \
>                 if [ "$($(2))" !=3D "y" -a "$${IS_IN_LIBC}" =3D "y" ] ; t=
hen \
>                         echo "$(4) available in C library, please enable
> $(2)" ; \
>                         exit 1 ; \
>                 fi ; \
>                 if [ "$($(2))" =3D "y" -a "$${IS_IN_LIBC}" !=3D "y" ] ; t=
hen \
>                         echo "$(4) not available in C library, please
> disable $(2)" ; \
>                         exit 1 ; \
>                 fi ; \
>         fi
>
> check_uclibc =3D \
>         [...]
>         $(call
> check_uclibc_feature,__UCLIBC_HAS_LOCALE__,BR2_ENABLE_LOCALE,$${UCLIBC_CO=
NFIG_FILE},Locale
> support) ;\
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Best Regards,

Fabrice

--000000000000b4809805f53655f6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 21 f=C3=A9vr. 2023 =C3=
=A0=C2=A015:01, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 21 Feb 2023 12:2=
9:11 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; locale is not enabled resulting in the following libcpprestsdk build<b=
r>
&gt; failure:<br>
&gt; <br>
&gt; In file included from /home/thomas/autobuild/instance-0/output-1/build=
/libcpprestsdk-2.10.18/Release/include/cpprest/json.h:18,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /ho=
me/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release=
/src/pch/stdafx.h:88,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from /ho=
me/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18/Release=
/src/http/client/http_client_msg.cpp:13:<br>
&gt; /home/thomas/autobuild/instance-0/output-1/build/libcpprestsdk-2.10.18=
/Release/include/cpprest/asyncrt_utils.h:317:13: error: &#39;locale_t&#39; =
does not name a type<br>
&gt;=C2=A0 =C2=A0317 |=C2=A0 =C2=A0 =C2=A0typedef locale_t xplat_locale;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~~~~~<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/e6778e60cc1e=
a455f5b4511d5824f04d8040f67b" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/e6778e60cc1ea455f5b4511d5824f04d8040f67b</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
<br>
The thing is that the toolchain claims to have locale support:<br>
<br>
$ grep LOCALE output/host/opt/ext-toolchain/arc-snps-linux-uclibc/sysroot/u=
sr/include/bits/uClibc_config.h <br>
#define __UCLIBC_HAS_LOCALE__ 1<br>
#define __UCLIBC_BUILD_MINIMAL_LOCALE__ 1<br>
#undef __UCLIBC_BUILD_ALL_LOCALE__<br>
#define __UCLIBC_BUILD_MINIMAL_LOCALES__ &quot;en_US&quot;<br>
#undef __UCLIBC_HAS_XLOCALE__<br></blockquote><div><br></div><div>I think t=
he issue is that __UCLIBC_HAS_XLOCALE__ is disabled.</div><div>To my unders=
tanding, locale_t is defined in xlocale.h:</div><div><a href=3D"https://git=
hub.com/wbx-github/uclibc-ng/blob/ab1dd83bec59c9e65c31efd6e887182948f627be/=
include/xlocale.h#L46">https://github.com/wbx-github/uclibc-ng/blob/ab1dd83=
bec59c9e65c31efd6e887182948f627be/include/xlocale.h#L46</a></div><div><br><=
/div><div>I&#39;m far from being an expert in locale/uclibc-ng so I&#39;m a=
 bit lost between all those variables ...</div><div>In <a href=3D"http://uc=
libc.mk">uclibc.mk</a>, we&#39;re enabling UCLIBC_HAS_XLOCALE in UCLIBC_LOC=
ALE_CONFIG hook.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Are you sure your commit doesn&#39;t break the build? Indeed normally for<b=
r>
external toolchains, we verify that the Buildroot configuration matches<br>
the toolchain, and abort the build if not. So if the toolchain supports<br>
locale (which it does here according to __UCLIBC_HAS_LOCALE__) but your<br>
Buildroot configuration doesn&#39;t say so, the build should normally abort=
<br>
with:<br>
<br>
XYZ available in C library, please enable ABC<br>
<br>
See in toolchains/<a href=3D"http://helpers.mk" rel=3D"noreferrer" target=
=3D"_blank">helpers.mk</a>:<br>
<br>
check_uclibc_feature =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 IS_IN_LIBC=3D`grep -q &quot;\#define $(1) 1&quo=
t; $(3) &amp;&amp; echo y` ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -z &quot;$(2)&quot; ] ; then \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$${IS_IN=
_LIBC}&quot; !=3D &quot;y&quot; ] ; then \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;$(4) not available in C library, toolchain unsuitable=
 for Buildroot&quot; ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit 1 ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$($(2))&=
quot; !=3D &quot;y&quot; -a &quot;$${IS_IN_LIBC}&quot; =3D &quot;y&quot; ] =
; then \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;$(4) available in C library, please enable $(2)&quot;=
 ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit 1 ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;$($(2))&=
quot; =3D &quot;y&quot; -a &quot;$${IS_IN_LIBC}&quot; !=3D &quot;y&quot; ] =
; then \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 echo &quot;$(4) not available in C library, please disable $(2)&=
quot; ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 exit 1 ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
<br>
check_uclibc =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [...]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(call check_uclibc_feature,__UCLIBC_HAS_LOCALE=
__,BR2_ENABLE_LOCALE,$${UCLIBC_CONFIG_FILE},Locale support) ;\<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div>Best Regards,</div><div><br></div><div>F=
abrice <br></div></div></div>

--000000000000b4809805f53655f6--

--===============5313760636587679533==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5313760636587679533==--
