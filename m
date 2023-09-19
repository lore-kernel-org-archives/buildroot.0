Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABAECE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 22:34:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 623D040865;
	Tue, 19 Sep 2023 22:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 623D040865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 40NiMHrYE2qB; Tue, 19 Sep 2023 22:34:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1DA64088F;
	Tue, 19 Sep 2023 22:34:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1DA64088F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1C91BF2C4
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 22:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45518833CE
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 22:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45518833CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e25YUHrFwE_Z for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 22:34:05 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6DC55831F8
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 22:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6DC55831F8
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9a6190af24aso830102966b.0
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 15:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695162843; x=1695767643;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z77Htxjn8Gg/fsi88xP/uPQHh/0VAyY4n8nzzRfXPKI=;
 b=SdAtaCsaiSehxKhQeWgxMlk4rf4DZD5ZaAr6quA17KYqolt+sJGEF9uHF7HGcawu41
 IWD103eRaLvgMc6Whwqw1jet/75bil8LLRPjwr8U+Zo8Mm+iVcXyjuZFHz7tWyjcQgB/
 DbU6FUN6UaeNGfpTh80gw8WpddGYN5EXBjqiFPRFQWNU4NpQU9R1c8Zq1fJNAj9fYLtz
 llzvUwa/+UlCP9fDBuJ6Cojod3da+Z6+FuFCfefPCh1iz/Lx30Ml5HNWPZ/uJ3RqeaGz
 Wdz6b2ElEVKUW47CKcTvYGSdzCsNcpTof7aJH8Rbk7rR+AzzMOgiGxLsYHZhzNLNGJhi
 /pQA==
X-Gm-Message-State: AOJu0Yzoubls8jpcoi9+iqrhfD7CzivzkIfprXTWuKIJksWYJpK/4E1E
 1P7cT4dh7S+mX+x/+mxETqtTfYEhUwPzYj8qt3wluw==
X-Google-Smtp-Source: AGHT+IGrq7J2eu7Amj/zEFhGqKINseODJxCNN3nnoG9gJZ1/aa/0/3WqBqD6cCTI7FL8EUFCBt6YG263fYw1Ct1ApHI=
X-Received: by 2002:a17:906:29a:b0:9ae:37c2:11b2 with SMTP id
 26-20020a170906029a00b009ae37c211b2mr668183ejf.15.1695162843379; Tue, 19 Sep
 2023 15:34:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230919204252.2272594-1-adam.duskett@amarulasolutions.com>
 <20230919204252.2272594-4-adam.duskett@amarulasolutions.com>
 <20230919220802.GA512384@scaer>
In-Reply-To: <20230919220802.GA512384@scaer>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 19 Sep 2023 16:33:52 -0600
Message-ID: <CAHDQB6PuKZCk4Ax8mTzqXrpZK_2jGHf-FLQCTJCHowND1kfKGg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1695162843; x=1695767643;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z77Htxjn8Gg/fsi88xP/uPQHh/0VAyY4n8nzzRfXPKI=;
 b=fbBGJebV5RmizfgOdZRLfBF/FGLD0CeawDzmQZNDMHasFfYWBucV/UgaK0LhKOaYm4
 Km35iYlDGUAL3r9dytKpjiZpIV9ak0J/3upJTiPIXOO3qQrqlP4eYaL6hjzWzANFjUfb
 FiQMZYAiHdqeALsp3dGr4p1NIxASb37jjxh+o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fbBGJebV
Subject: Re: [Buildroot] [PATCH v9 4/7] package/flutter-engine: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1762244515863407881=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1762244515863407881==
Content-Type: multipart/alternative; boundary="0000000000001dcea40605bddb9f"

--0000000000001dcea40605bddb9f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yann;

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Tue, Sep 19, 2023 at 4:08=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free=
.fr>
wrote:

> Adam, All,
>
> This is really a good job you did on such a tough package!
>
> We're entering the realm of the details, so it is a good sign that we're
> close to a merge!
>
> On 2023-09-19 14:42 -0600, Adam Duskett spake thusly:
> [--SNIP--]
> > diff --git a/package/flutter-engine/dot-gclient
> b/package/flutter-engine/dot-gclient
> > new file mode 100644
> > index 0000000000..4e5787419b
> > --- /dev/null
> > +++ b/package/flutter-engine/dot-gclient
> > @@ -0,0 +1,12 @@
> > +# This file is taken from the output of meta-flutter/lib/gn.py
>
> This comment is a bit misleading: it hints that this file is generated
> (it is!) from some metadata. So my question was goign to be: why can't
> we carry that metadata, the script, and generate the file ourselves?
>
> But in fact, there is no interesting metadata needed to generate that
> file; the only thing that is not hard-coded in the generating script
> (besides the name, version and URI) is the set of download dependencies,
> all set to False in the bitbake recipe.
>
> So indeed it is not interesting to generate that file. And thus the
> comment is indeed a bit misleading. I'll try to tweak it when
> applying...
>
> Yeah, Originally there was a custom_deps line that was required for
3.10.x, but is no longer needed for
3.13.x. So it's a vestige comment that can be removed.

> +solutions =3D [{
> > +    "managed": False,
> > +    "name": "src/flutter",
> > +    "url": "https://github.com/flutter/engine.git@!FLUTTER_VERSION!",
> > +    "custom_vars": {
> > +        "download_android_deps": False,
> > +        "download_windows_deps": False,
> > +        "download_linux_deps": False
> > +    },
> > +}]
> > diff --git a/package/flutter-engine/flutter-engine.mk
> b/package/flutter-engine/flutter-engine.mk
> > new file mode 100644
> > index 0000000000..76c6610fcd
> > --- /dev/null
> > +++ b/package/flutter-engine/flutter-engine.mk
> > @@ -0,0 +1,234 @@
> >
> +########################################################################=
########
> > +#
> > +# flutter-engine
> > +#
> >
> +########################################################################=
########
> [--SNIP--]
> > +# Generate a tarball if one does not already exist.
> > +define FLUTTER_ENGINE_GENERATE_TARBALL
> > +     PATH=3D$(BR_PATH):$(HOST_DIR)/share/depot_tools \
>
> So here, two things:
>   - you put $(HOST_DIR)/share/depot_tools in the PATH but .. -> [0]
>   - you should probably set it in the front:
>         PATH=3D"$(HOST_DIR)/share/depot_tools:$(BR_PATH)"
>
> Good call. Doing this for all three lines (169, 188, and 195) works
perfectly fine.

> +     PYTHONPATH=3D$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
> > +     $(FLUTTER_ENGINE_PKGDIR)/gen-tarball \
> > +             --dot-gclient $(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
> > +             --jobs $(PARALLEL_JOBS) \
> > +             --scratch-dir $(@D)/dl-tmp \
> > +             --tarball-dl-path $(FLUTTER_ENGINE_TARBALL_PATH) \
> > +             --version $(FLUTTER_ENGINE_VERSION)
> > +endef
> > +FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS +=3D FLUTTER_ENGINE_GENERATE_TARBAL=
L
> > +
> > +define FLUTTER_ENGINE_EXTRACT_CMDS
> > +     gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar --strip-component=
s
> 1 -C $(@D) -xf -
>
> We usually use suitable-extractor to decompress, and use $(TAR) and
> $(TAR_OPTIONS) to extract:
>
>     $(call suitable-extractor,$(not dir $(FLUTTER_ENGINE_TARBALL_PATH)))
> $(FLUTTER_ENGINE_TARBALL_PATH) \
>     |$(TAR) --strip-components 1 -C $(@D) $(TAR_OPTIONS) -
>
> Sounds good. Also tested and working properly.


> [--SNIP--]
> > diff --git a/package/flutter-engine/gen-tarball
> b/package/flutter-engine/gen-tarball
> > new file mode 100755
> > index 0000000000..e040beac75
> > --- /dev/null
> > +++ b/package/flutter-engine/gen-tarball
> > @@ -0,0 +1,111 @@
> [--SNIP--]
> > +run_gclient() {
> > +  local gclient=3D"${HOST_DIR}"/share/depot_tools/gclient.py
>
> [0] here you don't use PATH to locate gclient.py.
>
> > +  if [[ ! -e "${gclient}" ]]; then
> > +    message "${gclient} does not exist. Is host-depot-tools built and
> installed?"
>
> That should not happen because host-depot-tools is a dependency of
> flutter-engine.
>
> Fair enough. Easy to remove the check.

> > +    exit 1
> > +  fi
> > +  message "Downloading"
> > +  "${gclient}" \
>
> Assuming $(HOST_DIR)/share/depot_tools first int he PATH, can we just
> run:
>
>     gclient.py \
>         sync \
>         [...]
>
> Tested and working properly.

> > +    sync \
> > +    --delete_unversioned_trees \
> > +    --no-history \
> > +    --reset \
> > +    --shallow \
> > +    -j"${JOBS}"
> > +}
> > +
> > +gen_tarball() {
> > +  message "Generating tarball"
> > +  mkdir -p "${DL_DIR}"
> > +  # We would use the mk_tar_gz helper method from the
> support/download/helpers
> > +  # script here. However, due to unknown reasons other than what I can
> > +  # articulate as "Google," this is not possible. Even though creating=
 a
> > +  # tarball using the mk_tar_gz command results in a tarball that
> extracts and
> > +  # builds flutter-engine without warnings or errors, the gen_snapshot
> host
> > +  # utility, which turns dart applications into usable .so files for t=
he
> > +  # flutter engine, results in the error:
> > +  # "Can't load kernel binary: Invalid SDK hash." As we are not
> interested in
> > +  # creating a reproducible tarball, we need to use tar -C instead.
>
> As discussed on IRC, I think the real reason was that mk_tar_gz only
> archives non-directories, i.e. files, symlinks, etc... so empty
> directories are missing, and the flutter-engine buildsystem requires
> them.
>
> Something like the following will work:

  # We would use the mk_tar_gz helper method from the
support/download/helpers
  # script here. However, mk_tar_gz does not archive empty directories,
which
  # flutter-engine needs.
  # Even though creating a tarball using the mk_tar_gz command results
  # in a tarball that extracts and builds flutter-engine without warnings o=
r
  # errors, the gen_snapshot host utility, which turns dart applications
into
  # usable .so files for the flutter engine, results in the error:
  # "Can't load kernel binary: Invalid SDK hash." As we are not interested
in
  # creating a reproducible tarball, we need to use tar -C instead.


> So, based on your replies, I may be able to ammend the commit when
> applying and save you a respin. So, be careful in your replies! ;-)
>
> Regards,
> Yann E. MORIN.
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

--0000000000001dcea40605bddb9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Yann;</div><div dir=3D"ltr"><br cle=
ar=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
><span><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb=
(0,0,0);background-color:transparent;vertical-align:baseline;white-space:pr=
e-wrap">Adam Duskett</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;vertical-align:baseline;white-space:pre-wrap">Senior Embedded Systems Dev=
eloper</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono=
&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-ali=
gn:baseline;white-space:pre-wrap">M. +1208-515-8102</span></p><p dir=3D"ltr=
" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0=
,0);background-color:transparent;vertical-align:baseline;white-space:pre-wr=
ap"><a href=3D"mailto:adam.duskett@amarulasolutions.com" target=3D"_blank">=
adam.duskett@amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"lin=
e-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10p=
t;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background=
-color:transparent;vertical-align:baseline;white-space:pre-wrap">__________=
________________________</span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family=
:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transp=
arent;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);backgroun=
d-color:transparent;vertical-align:baseline;white-space:pre-wrap">Amarula S=
olutions BV</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu=
 Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertica=
l-align:baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amster=
dam, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mon=
o&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-al=
ign:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;vertical-align:baseline;white-space:pre=
-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mo=
no&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-a=
lign:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasolutions=
.com" target=3D"_blank">info@amarulasolutions.com</a></span></p><p dir=3D"l=
tr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><a href=3D"h=
ttp://www.amarulasolutions.com/" target=3D"_blank"><span style=3D"font-size=
:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);backgr=
ound-color:transparent;vertical-align:baseline;white-space:pre-wrap">www.am=
arulasolutions.com</span></a></p><div><br></div></span></div></div></div><b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">On Tue, Sep 19, 2023 at 4:08=E2=80=AFPM Yann E. MORIN &lt;<a href=3D"mail=
to:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Adam, All,<br>
<br>
This is really a good job you did on such a tough package!<br>
<br>
We&#39;re entering the realm of the details, so it is a good sign that we&#=
39;re<br>
close to a merge!<br>
<br>
On 2023-09-19 14:42 -0600, Adam Duskett spake thusly:<br>
[--SNIP--]<br>
&gt; diff --git a/package/flutter-engine/dot-gclient b/package/flutter-engi=
ne/dot-gclient<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4e5787419b<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/dot-gclient<br>
&gt; @@ -0,0 +1,12 @@<br>
&gt; +# This file is taken from the output of meta-flutter/lib/gn.py<br>
<br>
This comment is a bit misleading: it hints that this file is generated<br>
(it is!) from some metadata. So my question was goign to be: why can&#39;t<=
br>
we carry that metadata, the script, and generate the file ourselves?<br>
<br>
But in fact, there is no interesting metadata needed to generate that<br>
file; the only thing that is not hard-coded in the generating script<br>
(besides the name, version and URI) is the set of download dependencies,<br=
>
all set to False in the bitbake recipe.<br>
<br>
So indeed it is not interesting to generate that file. And thus the<br>
comment is indeed a bit misleading. I&#39;ll try to tweak it when<br>
applying...<br>
<br></blockquote><div>Yeah, Originally there was a=C2=A0<span style=3D"font=
-family:Menlo,Monaco,Consolas,&quot;Courier New&quot;,monospace;font-size:1=
3px"><font color=3D"#000000">custom_deps</font></span>=C2=A0line that was r=
equired for 3.10.x, but is no longer needed for</div><div>3.13.x. So it&#39=
;s a vestige comment that can be removed.</div><div><br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; +solutions =3D [{<br>
&gt; +=C2=A0 =C2=A0 &quot;managed&quot;: False,<br>
&gt; +=C2=A0 =C2=A0 &quot;name&quot;: &quot;src/flutter&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;url&quot;: &quot;<a href=3D"https://github.com/fl=
utter/engine.git@!FLUTTER_VERSION" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/flutter/engine.git@!FLUTTER_VERSION</a>!&quot;,<br>
&gt; +=C2=A0 =C2=A0 &quot;custom_vars&quot;: {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;download_android_deps&quot;: False,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;download_windows_deps&quot;: False,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;download_linux_deps&quot;: False<br=
>
&gt; +=C2=A0 =C2=A0 },<br>
&gt; +}]<br>
&gt; diff --git a/package/flutter-engine/<a href=3D"http://flutter-engine.m=
k" rel=3D"noreferrer" target=3D"_blank">flutter-engine.mk</a> b/package/flu=
tter-engine/<a href=3D"http://flutter-engine.mk" rel=3D"noreferrer" target=
=3D"_blank">flutter-engine.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..76c6610fcd<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/<a href=3D"http://flutter-engine.mk" rel=
=3D"noreferrer" target=3D"_blank">flutter-engine.mk</a><br>
&gt; @@ -0,0 +1,234 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# flutter-engine<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
[--SNIP--]<br>
&gt; +# Generate a tarball if one does not already exist.<br>
&gt; +define FLUTTER_ENGINE_GENERATE_TARBALL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0PATH=3D$(BR_PATH):$(HOST_DIR)/share/depot_tools \=
<br>
<br>
So here, two things:<br>
=C2=A0 - you put $(HOST_DIR)/share/depot_tools in the PATH but .. -&gt; [0]=
<br>
=C2=A0 - you should probably set it in the front:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 PATH=3D&quot;$(HOST_DIR)/share/depot_tools:$(BR=
_PATH)&quot;<br>
<br></blockquote><div>Good call. Doing this for all three lines (169, 188, =
and 195) works perfectly fine.</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 =C2=A0PYTHONPATH=3D$(HOST_DIR)/lib/python$(PYTHON3_VERS=
ION_MAJOR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(FLUTTER_ENGINE_PKGDIR)/gen-tarball \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--dot-gclient $(FLUTT=
ER_ENGINE_PKGDIR)/dot-gclient \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--jobs $(PARALLEL_JOB=
S) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--scratch-dir $(@D)/d=
l-tmp \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--tarball-dl-path $(F=
LUTTER_ENGINE_TARBALL_PATH) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--version $(FLUTTER_E=
NGINE_VERSION)<br>
&gt; +endef<br>
&gt; +FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS +=3D FLUTTER_ENGINE_GENERATE_TARBA=
LL<br>
&gt; +<br>
&gt; +define FLUTTER_ENGINE_EXTRACT_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar -=
-strip-components 1 -C $(@D) -xf -<br>
<br>
We usually use suitable-extractor to decompress, and use $(TAR) and<br>
$(TAR_OPTIONS) to extract:<br>
<br>
=C2=A0 =C2=A0 $(call suitable-extractor,$(not dir $(FLUTTER_ENGINE_TARBALL_=
PATH))) $(FLUTTER_ENGINE_TARBALL_PATH) \<br>
=C2=A0 =C2=A0 |$(TAR) --strip-components 1 -C $(@D) $(TAR_OPTIONS) -<br>
<br></blockquote><div>Sounds good. Also tested and working properly.</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
[--SNIP--]<br>
&gt; diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engi=
ne/gen-tarball<br>
&gt; new file mode 100755<br>
&gt; index 0000000000..e040beac75<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/flutter-engine/gen-tarball<br>
&gt; @@ -0,0 +1,111 @@<br>
[--SNIP--]<br>
&gt; +run_gclient() {<br>
&gt; +=C2=A0 local gclient=3D&quot;${HOST_DIR}&quot;/share/depot_tools/gcli=
ent.py<br>
<br>
[0] here you don&#39;t use PATH to locate gclient.py.<br>
<br>
&gt; +=C2=A0 if [[ ! -e &quot;${gclient}&quot; ]]; then<br>
&gt; +=C2=A0 =C2=A0 message &quot;${gclient} does not exist. Is host-depot-=
tools built and installed?&quot;<br>
<br>
That should not happen because host-depot-tools is a dependency of<br>
flutter-engine.<br>
<br></blockquote><div>Fair enough. Easy to remove the check.=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 exit 1<br>
&gt; +=C2=A0 fi<br>
&gt; +=C2=A0 message &quot;Downloading&quot;<br>
&gt; +=C2=A0 &quot;${gclient}&quot; \<br>
<br>
Assuming $(HOST_DIR)/share/depot_tools first int he PATH, can we just<br>
run:<br>
<br>
=C2=A0 =C2=A0 gclient.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 sync \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 [...]<br>
<br></blockquote><div>Tested and working properly.=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 sync \<br>
&gt; +=C2=A0 =C2=A0 --delete_unversioned_trees \<br>
&gt; +=C2=A0 =C2=A0 --no-history \<br>
&gt; +=C2=A0 =C2=A0 --reset \<br>
&gt; +=C2=A0 =C2=A0 --shallow \<br>
&gt; +=C2=A0 =C2=A0 -j&quot;${JOBS}&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +gen_tarball() {<br>
&gt; +=C2=A0 message &quot;Generating tarball&quot;<br>
&gt; +=C2=A0 mkdir -p &quot;${DL_DIR}&quot;<br>
&gt; +=C2=A0 # We would use the mk_tar_gz helper method from the support/do=
wnload/helpers<br>
&gt; +=C2=A0 # script here. However, due to unknown reasons other than what=
 I can<br>
&gt; +=C2=A0 # articulate as &quot;Google,&quot; this is not possible. Even=
 though creating a<br>
&gt; +=C2=A0 # tarball using the mk_tar_gz command results in a tarball tha=
t extracts and<br>
&gt; +=C2=A0 # builds flutter-engine without warnings or errors, the gen_sn=
apshot host<br>
&gt; +=C2=A0 # utility, which turns dart applications into usable .so files=
 for the<br>
&gt; +=C2=A0 # flutter engine, results in the error:<br>
&gt; +=C2=A0 # &quot;Can&#39;t load kernel binary: Invalid SDK hash.&quot; =
As we are not interested in<br>
&gt; +=C2=A0 # creating a reproducible tarball, we need to use tar -C inste=
ad.<br>
<br>
As discussed on IRC, I think the real reason was that mk_tar_gz only<br>
archives non-directories, i.e. files, symlinks, etc... so empty<br>
directories are missing, and the flutter-engine buildsystem requires<br>
them.<br>
<br></blockquote><div>Something like the following will work:</div><div><br=
></div><div>=C2=A0 # We would use the mk_tar_gz helper method from the supp=
ort/download/helpers<br>=C2=A0 # script here. However, mk_tar_gz does not a=
rchive empty directories, which<br>=C2=A0 # flutter-engine needs.<br>=C2=A0=
 # Even though creating a tarball using the mk_tar_gz command results<br>=
=C2=A0 # in a tarball that extracts and builds flutter-engine without warni=
ngs or<br>=C2=A0 # errors, the gen_snapshot host utility, which turns dart =
applications into<br>=C2=A0 # usable .so files for the flutter engine, resu=
lts in the error:<br>=C2=A0 # &quot;Can&#39;t load kernel binary: Invalid S=
DK hash.&quot; As we are not interested in<br>=C2=A0 # creating a reproduci=
ble tarball, we need to use tar -C instead.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
So, based on your replies, I may be able to ammend the commit when<br>
applying and save you a respin. So, be careful in your replies! ;-)<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
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

--0000000000001dcea40605bddb9f--

--===============1762244515863407881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1762244515863407881==--
