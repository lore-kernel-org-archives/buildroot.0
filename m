Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A548C2BB3F
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 16:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BB6444053F;
	Mon, 20 Nov 2023 16:41:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB6444053F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 29bpMb9DbXAM; Mon, 20 Nov 2023 16:41:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04C6540641;
	Mon, 20 Nov 2023 16:41:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04C6540641
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 078751BF3E1
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 16:41:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E18C260BFE
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 16:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E18C260BFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NbFwQZX7_h_Y for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 16:41:02 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4829360B1F
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 16:41:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4829360B1F
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9c603e2354fso868517666b.1
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 08:41:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700498460; x=1701103260;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=efWGkAdYSHQdV++7IXRt4f+GMrboeso3WXefAQ91kkc=;
 b=j5Sj3mUBeEsuMbJ+cGBCky0yGOt46TDZZIhL1N7HhP8szeKdQt/lIL50whPIwczYJ0
 z5dsAiGWPE5oEai7BHO4XKap1XtbzZq5uLzqR+9pbPekDSOcmiKFd1HZknApAX32JnbY
 HghW1X2duIfiSghe+htgfMIzLm9c9zXQeVzvaFDkD5m5L9hxoA/U9ykYg9/HmSUa93Ks
 iMrEF3UtFhJYOVksy7q7vnlJkTvcSGgf7lsScna5YmfPzeL7oR1L4qv5KyuGfyFFy6u2
 0vDb7LVl0Q7nPKtXovkBUwqxDcwGpEV6OXMkNnwTGyjEu1acDfUm/18pMbWD0TdvyoS+
 sbLA==
X-Gm-Message-State: AOJu0YwwPClp/7bh12HbI4aXtEHKkkxOVa8ciq6iLD/U4HpdEDUJ67iD
 JySQOqU4fHcMWK3rS22ozTa9vh/pOKNYu8dcquCsOQ==
X-Google-Smtp-Source: AGHT+IFwtECuVwPmQqIn/MWs08CbxP5pVO6kkgul+0+jltJvEK+mf5LYsECqCFqchHrxn173u6BONF4U7x3s3WOVkU8=
X-Received: by 2002:a17:907:15d5:b0:9f2:6fac:e266 with SMTP id
 cj21-20020a17090715d500b009f26face266mr22435ejc.1.1700498460066; Mon, 20 Nov
 2023 08:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
 <20231118221206.1369389-5-adam.duskett@amarulasolutions.com>
 <75d4ac75-ee6a-4a5b-af29-7eee2fa11580@mind.be>
 <CAHDQB6MoBM+TJj3ysJD9VVDCV4pErHQP=Gbf5xw8aQfjnPRMTw@mail.gmail.com>
 <20231119215343.GQ996011@scaer>
In-Reply-To: <20231119215343.GQ996011@scaer>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Mon, 20 Nov 2023 09:40:48 -0700
Message-ID: <CAHDQB6O+K486NxLGWPtpSmQhOYUW_QxUT=3H+XL8_u72X0tSDg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1700498460; x=1701103260;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=efWGkAdYSHQdV++7IXRt4f+GMrboeso3WXefAQ91kkc=;
 b=W9MDEZvZJWtTWON6EVnA1Bnmy1NAwwMLBbTR6ICTTzwAxXryVrp8bO9nNJIsyWh6ML
 PQ6hi9CR4uCM0348UVb78nsLbTyeKY/EE+/dfYizkl/xU6o12qAfgaiU10jgCi/5IWrd
 pawHfc7qhv/PGj8i+oIFVazhV37tUqVzanYTw=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=W9MDEZvZ
Subject: Re: [Buildroot] [PATCH/next v2 5/9]
 package/flutter-sdk-bin/Config.in.host: add pub-cache location option
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0351779797233186274=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0351779797233186274==
Content-Type: multipart/alternative; boundary="000000000000a753c3060a982611"

--000000000000a753c3060a982611
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yann;

I understand. However, after sleeping on the issue, I have decided to
politely decline changing the
patch to be hardcoded. It's too much bikeshedding and testing. The original
patch solved the issue
and I don't see a good reason to change it just because of a dislike for
config options.

If you want to personally submit a patch that better adheres to your vision
of what the flutter package
should look like you are more than welcome to do so! I can decline this
patch series if you wish me to
do so.

Thanks again!

Adam Duskett

Senior Embedded Systems Developer

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Sun, Nov 19, 2023 at 2:53=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free=
.fr>
wrote:

> Adam, All,
>
> On 2023-11-19 14:08 -0700, Adam Duskett spake thusly:
> > I'll change the patch to set a default to $(DL_DIR)/br-flutter-pub-cach=
e.
>
> As Arnout and I said, this should not be configurable, so, to be sure
> we're on the same page: not a "default" [for the config option], but a
> "hard-coded" value in the .mk.
>
> Regards,
> Yann E. MORIN.
>
> > That seems reasonable and a small change.
> >
> > Adam Duskett
> >
> > Senior Embedded Systems Developer
> >
> > M. +1208-515-8102
> >
> > [1]adam.duskett@amarulasolutions.com
> >
> > __________________________________
> >
> > Amarula Solutions BV
> >
> > Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
> >
> > T. +31 (0)85 111 9170
> > [2]info@amarulasolutions.com
> >
> > [3]www.amarulasolutions.com
> >
> > On Sun, Nov 19, 2023 at 1:43=E2=80=AFPM Arnout Vandecappelle < [4]arnou=
t@mind.be>
> wrote:
> >
> >   On 18/11/2023 23:12, Adam Duskett wrote:
> >   > When running the command "flutter pub get," the plugins are stored
> in the
> >   > pub-cache directory along with their sha256sum hashes. The default
> location
> >   > of the pub-cache directory is
> $(HOST_DIR)/share/flutter/sdk/.pub-cache.
> >   > While the above location is a perfectly acceptable choice by
> default, users
> >   > may want to define an alternate location to prevent downloading all
> of the
> >   > plugins on each fresh build of a Flutter application, and they may
> want to
> >   > commit the pub-cache directory to their project.
> >   >
> >   > Add the new option
> BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION to the
> >   > flutter-sdk-bin/Config.in.host file, and set the default to the
> current
> >   > default of $(HOST_DIR)/share/flutter/sdk/.pub-cache.
> >   >
> >   > Signed-off-by: Adam Duskett < [5]adam.duskett@amarulasolutions.com>
> >   > ---
> >   >   package/flutter-sdk-bin/Config.in.host     | 11 +++++++++++
> >   >   package/flutter-sdk-bin/ [6]flutter-sdk-bin.mk |  2 +-
> >   >   2 files changed, 12 insertions(+), 1 deletion(-)
> >   >
> >   > diff --git a/package/flutter-sdk-bin/Config.in.host
> b/package/flutter-sdk-bin/Config.in.host
> >   > index a48714ea7f..0e31a8e0fa 100644
> >   > --- a/package/flutter-sdk-bin/Config.in.host
> >   > +++ b/package/flutter-sdk-bin/Config.in.host
> >   > @@ -14,3 +14,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
> >   >         free and open source.
> >   >
> >   >          [7]https://flutter.dev/
> >   > +
> >   > +if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> >   > +
> >   > +config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION
> >   > +     string "pub-cache location"
> >   > +     default "$(HOST_DIR)/share/flutter/sdk/.pub-cache"
> >   > +     help
> >   > +       Directory to store cached packages used by Pub with
> >   > +       Dart/Flutter.
> >   > +
> >   > +endif
> >   > diff --git a/package/flutter-sdk-bin/ [8]flutter-sdk-bin.mk
> b/package/flutter-sdk-bin/ [9]flutter-sdk-bin.mk
> >   > index 9461148dfb..6471c11d4e 100644
> >   > --- a/package/flutter-sdk-bin/ [10]flutter-sdk-bin.mk
> >   > +++ b/package/flutter-sdk-bin/ [11]flutter-sdk-bin.mk
> >   > @@ -95,4 +95,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN =3D \
> >   >   $(eval $(host-generic-package))
> >   >
> >   >   # For target packages to locate said pub-cache
> >   > -FLUTTER_SDK_BIN_PUB_CACHE =3D $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cac=
he
> >   > +FLUTTER_SDK_BIN_PUB_CACHE =3D $(call
> qstrip,$(BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))
> >
> >     What about this code?
> >
> >   # Remove the cache, as we will run precache after setting up flutter
> and dart
> >   # with the new config options.
> >   define HOST_FLUTTER_SDK_BIN_BUILD_CMDS
> >            mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
> >            rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
> >            cd $(@D) && \
> >                    $(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter
> precache;
> >   endef
> >
> >     Either this code is needed and the idea of a shared cache is void,
> and it
> >   really shouldn't be in DL_DIR at all. Or it is not needed and it
> should be
> >   removed, with an explanation about why this "setting up flutter and
> dart with
> >   the new config optoins" doesn't actually apply.
> >
> >     Regards,
> >     Arnout
> >
> > Links:
> > 1. mailto:adam.duskett@amarulasolutions.com
> > 2. mailto:info@amarulasolutions.com
> > 3. http://www.amarulasolutions.com/
> > 4. mailto:arnout@mind.be
> > 5. mailto:adam.duskett@amarulasolutions.com
> > 6. http://flutter-sdk-bin.mk
> > 7. https://flutter.dev/
> > 8. http://flutter-sdk-bin.mk
> > 9. http://flutter-sdk-bin.mk
> > 10. http://flutter-sdk-bin.mk
> > 11. http://flutter-sdk-bin.mk
>
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
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

--000000000000a753c3060a982611
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yann;<div><br></div><div>I understand. However, after slee=
ping=C2=A0on the issue, I have decided to politely decline changing the</di=
v><div>patch to be hardcoded. It&#39;s too much bikeshedding and testing. T=
he original patch solved the issue</div><div>and I don&#39;t see a good rea=
son to change it just because of a dislike for config options.</div><div><b=
r></div><div>If you want to personally submit a patch that better adheres t=
o your vision of what the flutter package</div><div>should look like you ar=
e more than welcome to do so! I can decline this patch series if you wish m=
e to</div><div>do so.</div><div><br></div><div>Thanks again!</div><div><br =
clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-h=
eight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap">Adam Duskett</=
span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubun=
tu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;verti=
cal-align:baseline;white-space:pre-wrap">Senior Embedded Systems Developer<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top=
:0pt;margin-bottom:0pt"><a href=3D"mailto:adam.duskett@amarulasolutions.com=
" target=3D"_blank" style=3D"background-color:transparent;font-family:&quot=
;Ubuntu Mono&quot;,monospace;font-size:10pt">adam.duskett@amarulasolutions.=
com</a><br></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quo=
t;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent=
;vertical-align:baseline;white-space:pre-wrap">____________________________=
______</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&q=
uot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpare=
nt;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=3D"=
font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;vertical-align:baseline;white-space:pre-wrap">Amarula Solut=
ions BV</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&=
quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpar=
ent;vertical-align:baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114=
 AB, Amsterdam, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.79999999=
99999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;fo=
nt-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap">T. +31 (0)85 1=
11 9170</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&q=
uot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align=
:baseline;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;fo=
nt-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mai=
lto:info@amarulasolutions.com" target=3D"_blank">info@amarulasolutions.com<=
/a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin=
-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.com/" ta=
rget=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono=
&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-ali=
gn:baseline;white-space:pre-wrap">www.amarulasolutions.com</span></a></p><d=
iv><br></div></span></div></div></div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Nov 19, 2023 at 2:5=
3=E2=80=AFPM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">y=
ann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Adam, All,<br>
<br>
On 2023-11-19 14:08 -0700, Adam Duskett spake thusly:<br>
&gt; I&#39;ll change the patch to set a default to $(DL_DIR)/br-flutter-pub=
-cache.<br>
<br>
As Arnout and I said, this should not be configurable, so, to be sure<br>
we&#39;re on the same page: not a &quot;default&quot; [for the config optio=
n], but a<br>
&quot;hard-coded&quot; value in the .mk.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; That seems reasonable and a small change.<br>
&gt; <br>
&gt; Adam Duskett<br>
&gt; <br>
&gt; Senior Embedded Systems Developer<br>
&gt; <br>
&gt; M. +1208-515-8102<br>
&gt; <br>
&gt; [1]<a href=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_bla=
nk">adam.duskett@amarulasolutions.com</a><br>
&gt; <br>
&gt; __________________________________<br>
&gt; <br>
&gt; Amarula Solutions BV<br>
&gt; <br>
&gt; Joop Geesinkweg 125, 1114 AB, Amsterdam, NL<br>
&gt; <br>
&gt; T. +31 (0)85 111 9170<br>
&gt; [2]<a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info=
@amarulasolutions.com</a><br>
&gt; <br>
&gt; [3]<a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" targ=
et=3D"_blank">www.amarulasolutions.com</a><br>
&gt; <br>
&gt; On Sun, Nov 19, 2023 at 1:43=E2=80=AFPM Arnout Vandecappelle &lt; [4]<=
a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt; w=
rote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0On 18/11/2023 23:12, Adam Duskett wrote:<br>
&gt;=C2=A0 =C2=A0&gt; When running the command &quot;flutter pub get,&quot;=
 the plugins are stored in the<br>
&gt;=C2=A0 =C2=A0&gt; pub-cache directory along with their sha256sum hashes=
. The default location<br>
&gt;=C2=A0 =C2=A0&gt; of the pub-cache directory is $(HOST_DIR)/share/flutt=
er/sdk/.pub-cache.<br>
&gt;=C2=A0 =C2=A0&gt; While the above location is a perfectly acceptable ch=
oice by default, users<br>
&gt;=C2=A0 =C2=A0&gt; may want to define an alternate location to prevent d=
ownloading all of the<br>
&gt;=C2=A0 =C2=A0&gt; plugins on each fresh build of a Flutter application,=
 and they may want to<br>
&gt;=C2=A0 =C2=A0&gt; commit the pub-cache directory to their project.<br>
&gt;=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0&gt; Add the new option BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_P=
UB_CACHE_LOCATION to the<br>
&gt;=C2=A0 =C2=A0&gt; flutter-sdk-bin/Config.in.host file, and set the defa=
ult to the current<br>
&gt;=C2=A0 =C2=A0&gt; default of $(HOST_DIR)/share/flutter/sdk/.pub-cache.<=
br>
&gt;=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0&gt; Signed-off-by: Adam Duskett &lt; [5]<a href=3D"mailto=
:adam.duskett@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulas=
olutions.com</a>&gt;<br>
&gt;=C2=A0 =C2=A0&gt; ---<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0package/flutter-sdk-bin/Config.in.host=C2=
=A0 =C2=A0 =C2=A0| 11 +++++++++++<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0package/flutter-sdk-bin/ [6]<a href=3D"ht=
tp://flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D"_blank">flutter-sdk-b=
in.mk</a> |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A02 files changed, 12 insertions(+), 1 dele=
tion(-)<br>
&gt;=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0&gt; diff --git a/package/flutter-sdk-bin/Config.in.host b=
/package/flutter-sdk-bin/Config.in.host<br>
&gt;=C2=A0 =C2=A0&gt; index a48714ea7f..0e31a8e0fa 100644<br>
&gt;=C2=A0 =C2=A0&gt; --- a/package/flutter-sdk-bin/Config.in.host<br>
&gt;=C2=A0 =C2=A0&gt; +++ b/package/flutter-sdk-bin/Config.in.host<br>
&gt;=C2=A0 =C2=A0&gt; @@ -14,3 +14,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SD=
K_BIN<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0free and open source=
.<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [7]<a href=3D"https=
://flutter.dev/" rel=3D"noreferrer" target=3D"_blank">https://flutter.dev/<=
/a><br>
&gt;=C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0&gt; +if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS<br=
>
&gt;=C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0&gt; +config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LO=
CATION<br>
&gt;=C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;pub-cache location&=
quot;<br>
&gt;=C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0default &quot;$(HOST_DIR)/share/=
flutter/sdk/.pub-cache&quot;<br>
&gt;=C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Directory to store cached=
 packages used by Pub with<br>
&gt;=C2=A0 =C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Dart/Flutter.<br>
&gt;=C2=A0 =C2=A0&gt; +<br>
&gt;=C2=A0 =C2=A0&gt; +endif<br>
&gt;=C2=A0 =C2=A0&gt; diff --git a/package/flutter-sdk-bin/ [8]<a href=3D"h=
ttp://flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D"_blank">flutter-sdk-=
bin.mk</a> b/package/flutter-sdk-bin/ [9]<a href=3D"http://flutter-sdk-bin.=
mk" rel=3D"noreferrer" target=3D"_blank">flutter-sdk-bin.mk</a><br>
&gt;=C2=A0 =C2=A0&gt; index 9461148dfb..6471c11d4e 100644<br>
&gt;=C2=A0 =C2=A0&gt; --- a/package/flutter-sdk-bin/ [10]<a href=3D"http://=
flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D"_blank">flutter-sdk-bin.mk=
</a><br>
&gt;=C2=A0 =C2=A0&gt; +++ b/package/flutter-sdk-bin/ [11]<a href=3D"http://=
flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D"_blank">flutter-sdk-bin.mk=
</a><br>
&gt;=C2=A0 =C2=A0&gt; @@ -95,4 +95,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN =3D \=
<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0$(eval $(host-generic-package))<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0&gt;=C2=A0 =C2=A0# For target packages to locate said pub-=
cache<br>
&gt;=C2=A0 =C2=A0&gt; -FLUTTER_SDK_BIN_PUB_CACHE =3D $(HOST_FLUTTER_SDK_BIN=
_SDK)/.pub-cache<br>
&gt;=C2=A0 =C2=A0&gt; +FLUTTER_SDK_BIN_PUB_CACHE =3D $(call qstrip,$(BR2_PA=
CKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0 What about this code?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0# Remove the cache, as we will run precache after setting =
up flutter and dart<br>
&gt;=C2=A0 =C2=A0# with the new config options.<br>
&gt;=C2=A0 =C2=A0define HOST_FLUTTER_SDK_BIN_BUILD_CMDS<br>
&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $(HOST_FLUTTER_=
SDK_BIN_SDK)<br>
&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf $(HOST_FLUTTER_SD=
K_BIN_SDK)/.pub-cache<br>
&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd $(@D) &amp;&amp; \<br=
>
&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter precache;<br>
&gt;=C2=A0 =C2=A0endef<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0 Either this code is needed and the idea of a shared=
 cache is void, and it<br>
&gt;=C2=A0 =C2=A0really shouldn&#39;t be in DL_DIR at all. Or it is not nee=
ded and it should be<br>
&gt;=C2=A0 =C2=A0removed, with an explanation about why this &quot;setting =
up flutter and dart with<br>
&gt;=C2=A0 =C2=A0the new config optoins&quot; doesn&#39;t actually apply.<b=
r>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0 Regards,<br>
&gt;=C2=A0 =C2=A0=C2=A0 Arnout<br>
&gt; <br>
&gt; Links:<br>
&gt; 1. mailto:<a href=3D"mailto:adam.duskett@amarulasolutions.com" target=
=3D"_blank">adam.duskett@amarulasolutions.com</a><br>
&gt; 2. mailto:<a href=3D"mailto:info@amarulasolutions.com" target=3D"_blan=
k">info@amarulasolutions.com</a><br>
&gt; 3. <a href=3D"http://www.amarulasolutions.com/" rel=3D"noreferrer" tar=
get=3D"_blank">http://www.amarulasolutions.com/</a><br>
&gt; 4. mailto:<a href=3D"mailto:arnout@mind.be" target=3D"_blank">arnout@m=
ind.be</a><br>
&gt; 5. mailto:<a href=3D"mailto:adam.duskett@amarulasolutions.com" target=
=3D"_blank">adam.duskett@amarulasolutions.com</a><br>
&gt; 6. <a href=3D"http://flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D"=
_blank">http://flutter-sdk-bin.mk</a><br>
&gt; 7. <a href=3D"https://flutter.dev/" rel=3D"noreferrer" target=3D"_blan=
k">https://flutter.dev/</a><br>
&gt; 8. <a href=3D"http://flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D"=
_blank">http://flutter-sdk-bin.mk</a><br>
&gt; 9. <a href=3D"http://flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D"=
_blank">http://flutter-sdk-bin.mk</a><br>
&gt; 10. <a href=3D"http://flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D=
"_blank">http://flutter-sdk-bin.mk</a><br>
&gt; 11. <a href=3D"http://flutter-sdk-bin.mk" rel=3D"noreferrer" target=3D=
"_blank">http://flutter-sdk-bin.mk</a><br>
<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
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
</blockquote></div>

--000000000000a753c3060a982611--

--===============0351779797233186274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0351779797233186274==--
