Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CF1CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 563A184625;
	Thu, 21 Aug 2025 19:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cnnrswotacPJ; Thu, 21 Aug 2025 19:10:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA5F84608
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA5F84608;
	Thu, 21 Aug 2025 19:10:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F2141C7
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10ED0845F5
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uyrWlEhhTchR for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:10:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E47AD84274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E47AD84274
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E47AD84274
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:10:30 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3e56fe580b4so6250405ab.0
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 12:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755803430; x=1756408230;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8U7bsYy+2Ktp3QziICoaT617ngBmXb3w4CrNZqSAtzU=;
 b=Bft9OV8WVh+4FoQCFXIVlUeRyhgjVbTAi9JPjvHDKL2JIJwjeUY4Mw4wQPY/cZ4IUt
 VWX4IhKDtuQCR/Ppde2T7+P1pCx2XfAi37isFT/AE9plSfw0AmoVKIAG1/rFvnYzRNaL
 E22bW4FVU8+zyaoKDYh7ZG1XHd/2HtsU7dBAZDtl7U8Ndb3OVgWFusp+XEYFgX5FFOUR
 K32W0NBJ8wr1ZLJUYUoEHqeG3WlMYLfnYyPGoeaB8w9s6BlT4JCbCqdRd5PxrhpeVDOC
 hIpj8Y3Y39tkU64bflVdO1qHgFldr+7ZR87xdU7Brv6A9O3giVyirpQjwUi9N0oaYYFV
 2Nmg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzusLMq6Vkqu/k8FdGrCBxtzQ9HchA78X+q9QhWE64bF773a+/6YEGqfwMry05jHfXfJkrcxGcigo=@buildroot.org
X-Gm-Message-State: AOJu0Yw4zlrmFyVw/VC/0Hw8AM4DO60ZTtjtadyJNaqWUsp/NRmW82yp
 KfsbvDO/2JAqEV/KRNfJHJ5zPY+ZhxG+bT86SYKgDeqA9mkvS0Kent5TBv60oae4Or1P2iM+QNz
 DnUlaqNXg+zoQdFKQ+92V1FEJS10ipIUFfs/8
X-Gm-Gg: ASbGncvcdPuzY2BC60dryFVfD1H+bq4IsHXfsatuJ4dSnwU1mNnHy+5aSlZqtDZWYve
 Yaz6qQiVKMm3gO+nOWivJA1ok60OpZZRXE8/dpsBkNrW0P/bIdIpefGCVUcaosSU6raTl6sziEw
 GMR9E/81hiw3WEoxfUlpotl/yk6B3IfjppH0C+VR8yaAp9tRyQJSB04NfhWz3yr4g/YDqsEymub
 mjlrAcReociOfOojw==
X-Google-Smtp-Source: AGHT+IFmAEp9jRbGY5dKjHH7zPf4OYvXTpDWqjjHPEGW5cGhX8YCzLzNzJccysM73SvZsFcxIvxKY0ZzpFJzpWcxRZU=
X-Received: by 2002:a05:6e02:2592:b0:3e2:99c3:47c8 with SMTP id
 e9e14a558f8ab-3e9223161f0mr7877275ab.17.1755803429604; Thu, 21 Aug 2025
 12:10:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250821182337.3563734-1-angelo.compagnucci@gmail.com>
 <87ms7szf0d.fsf@tarshish>
In-Reply-To: <87ms7szf0d.fsf@tarshish>
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 21 Aug 2025 21:09:53 +0200
X-Gm-Features: Ac12FXzUrw7D87DrEJv6SQuwYaro57Yint56edWUGdeSmIKZzsHmY2lk77JcJKE
Message-ID: <CA+TH9V=dotgxON+5qP+7oBD83c=W=Z4hCAz8_kpA3ED4NH=4uw@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>, buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755803430; x=1756408230; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8U7bsYy+2Ktp3QziICoaT617ngBmXb3w4CrNZqSAtzU=;
 b=cY3KAR7YasWNv2qFiifnpwRPXGBy6tEyoQH3Xr4imImIgRNQADwP7ykCsg9ZGNkDJi
 8c7ySPd13208kMPNWoWDgOkze1W+fdKpjm1a2cpTanhQ4sdtwX10OX4hBvuryZwZAXKm
 RFboI7LM6IDFhy9qo0MEZ2Ur208sUC4GkworEaUokt8dr2X8Oe+SvHYwDT+vPjWilEav
 xSAUKY0sOi6OD9RVu9FHYQBtzeb/mohssim1Zr6zYrM1YcEEVn6P1kO6ydvMUcZSiVnD
 PiR6uta/fhC751TMHclPQmKFXMh+yfmsRwQM0/gs0oBPChBomB1WGDvDAX3R/2ljPAU/
 BbCA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=cY3KAR7Y
Subject: Re: [Buildroot] [PATCH v2] package/wcurl: new package
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
Content-Type: multipart/mixed; boundary="===============8561471154247135908=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8561471154247135908==
Content-Type: multipart/alternative; boundary="000000000000b79cc1063ce4d78e"

--000000000000b79cc1063ce4d78e
Content-Type: text/plain; charset="UTF-8"

Il giorno gio 21 ago 2025 alle ore 20:49 Baruch Siach <baruch@tkos.co.il>
ha scritto:

> Hi Angelo,
>
> On Thu, Aug 21 2025, Angelo Compagnucci wrote:
> > wcurl is a command line tool which lets you download URLs without having
> to
> > remember any parameters.
> >
> > Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
>
> [...]
>
> > diff --git a/package/wcurl/Config.in b/package/wcurl/Config.in
> > new file mode 100644
> > index 0000000000..31a007b61f
> > --- /dev/null
> > +++ b/package/wcurl/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_WCURL
> > +     bool "wcurl"
> > +     depends on BR2_PACKAGE_LIBCURL # runtime
> > +     depends on BR2_PACKAGE_LIBCURL_CURL # runtime
>
> Why not 'select'?
>
> You don't provide a comment to guide the user about these
> dependencies. With 'select', no comment is needed.
>

Well, libcurl has several dependencies, and therefore selecting it didn't
sound right to me.
I mean, I want wcurl installed, wcurl selects libcurl which cannot be built
because some dependency is not met, It doesn't sound right.

I think this is something for the maintainers to decide, but let me know
what you think and I'll happily respin.


>
> baruch
>
> > +     help
> > +       wcurl is a small command-line tool that wraps curl for easier use
> > +       when downloading files from the web.
> > +
> > +       https://curl.se/wcurl/
> > diff --git a/package/wcurl/wcurl.hash b/package/wcurl/wcurl.hash
> > new file mode 100644
> > index 0000000000..b747e99502
> > --- /dev/null
> > +++ b/package/wcurl/wcurl.hash
> > @@ -0,0 +1,3 @@
> > +# sha256 locally computed
> > +sha256
> a745475f3511090685c4d000a10f4155147b75a8c7781764612a7e8f67bb6d82
> wcurl-2025.05.26.tar.gz
> > +sha256
> 0127bdd267b1fa65bf5a6c487c907948e0c009aa35a5949c8aed91f779d27810  LICENSE
> > diff --git a/package/wcurl/wcurl.mk b/package/wcurl/wcurl.mk
> > new file mode 100644
> > index 0000000000..8499bd3e1b
> > --- /dev/null
> > +++ b/package/wcurl/wcurl.mk
> > @@ -0,0 +1,16 @@
> >
> +################################################################################
> > +#
> > +# wcurl
> > +#
> >
> +################################################################################
> > +
> > +WCURL_VERSION = 2025.05.26
> > +WCURL_SITE = $(call github,curl,wcurl,v$(WCURL_VERSION))
> > +WCURL_LICENSE = curl
> > +WCURL_LICENSE_FILES = LICENSE
> > +
> > +define FOO_INSTALL_TARGET_CMDS
> > +      $(INSTALL) -D -m 0755 $(@D)/wcurl $(TARGET_DIR)/usr/bin
> > +endef
> > +
> > +$(eval $(generic-package))
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>


-- 
Profile: http://it.linkedin.com/in/compagnucciangelo

--000000000000b79cc1063ce4d78e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno gio 21 ago=
 2025 alle ore 20:49 Baruch Siach &lt;<a href=3D"mailto:baruch@tkos.co.il" =
target=3D"_blank">baruch@tkos.co.il</a>&gt; ha scritto:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Hi Angelo,<br>
<br>
On Thu, Aug 21 2025, Angelo Compagnucci wrote:<br>
&gt; wcurl is a command line tool which lets you download URLs without havi=
ng to<br>
&gt; remember any parameters.<br>
&gt;<br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo.compagn=
ucci@gmail.com" target=3D"_blank">angelo.compagnucci@gmail.com</a>&gt;<br>
<br>
[...]<br>
<br>
&gt; diff --git a/package/wcurl/Config.in b/package/wcurl/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..31a007b61f<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/wcurl/Config.in<br>
&gt; @@ -0,0 +1,9 @@<br>
&gt; +config BR2_PACKAGE_WCURL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;wcurl&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBCURL # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBCURL_CURL # runtime<br>
<br>
Why not &#39;select&#39;?<br>
<br>
You don&#39;t provide a comment to guide the user about these<br>
dependencies. With &#39;select&#39;, no comment is needed.<br></blockquote>=
<div><br></div><div>Well, libcurl has several dependencies, and therefore s=
electing it didn&#39;t sound right to me.</div><div>I mean, I want wcurl in=
stalled, wcurl selects libcurl which cannot be built because some dependenc=
y is not met, It doesn&#39;t sound right.</div><div><br></div><div>I think =
this is something for the maintainers to decide, but let me know what you t=
hink and I&#39;ll happily respin.<br></div><div>=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
baruch<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0wcurl is a small command-line tool that wr=
aps curl for easier use<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0when downloading files from the web.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://curl.se/wcurl/" rel=3D"=
noreferrer" target=3D"_blank">https://curl.se/wcurl/</a><br>
&gt; diff --git a/package/wcurl/wcurl.hash b/package/wcurl/wcurl.hash<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b747e99502<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/wcurl/wcurl.hash<br>
&gt; @@ -0,0 +1,3 @@<br>
&gt; +# sha256 locally computed<br>
&gt; +sha256=C2=A0 a745475f3511090685c4d000a10f4155147b75a8c7781764612a7e8f=
67bb6d82=C2=A0 wcurl-2025.05.26.tar.gz<br>
&gt; +sha256=C2=A0 0127bdd267b1fa65bf5a6c487c907948e0c009aa35a5949c8aed91f7=
79d27810=C2=A0 LICENSE<br>
&gt; diff --git a/package/wcurl/<a href=3D"http://wcurl.mk" rel=3D"noreferr=
er" target=3D"_blank">wcurl.mk</a> b/package/wcurl/<a href=3D"http://wcurl.=
mk" rel=3D"noreferrer" target=3D"_blank">wcurl.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8499bd3e1b<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/wcurl/<a href=3D"http://wcurl.mk" rel=3D"noreferrer" tar=
get=3D"_blank">wcurl.mk</a><br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# wcurl<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +WCURL_VERSION =3D 2025.05.26<br>
&gt; +WCURL_SITE =3D $(call github,curl,wcurl,v$(WCURL_VERSION))<br>
&gt; +WCURL_LICENSE =3D curl<br>
&gt; +WCURL_LICENSE_FILES =3D LICENSE<br>
&gt; +<br>
&gt; +define FOO_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 $(INSTALL) -D -m 0755 $(@D)/wcurl $(TARGET_DIR)/=
usr/bin<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(generic-package))<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
</blockquote></div><div><br clear=3D"all"></div><br><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">Pr=
ofile: <a href=3D"http://it.linkedin.com/in/compagnucciangelo" target=3D"_b=
lank">http://it.linkedin.com/in/compagnucciangelo</a></div></div>
</div>

--000000000000b79cc1063ce4d78e--

--===============8561471154247135908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8561471154247135908==--
