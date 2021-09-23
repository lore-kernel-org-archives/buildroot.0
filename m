Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E35C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 06:26:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A5B6109E
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 06:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6A5B6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8963F606F3;
	Thu, 23 Sep 2021 06:26:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qrr6uEcbCQsY; Thu, 23 Sep 2021 06:26:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7786B61541;
	Thu, 23 Sep 2021 06:26:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C9331BF356
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 06:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B3B5406FE
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 06:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5epFs_cELKJb for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 06:26:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E24740151
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 06:26:15 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id x7so5382867edd.6
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 23:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=18AeDY8wAaikUaABLA+Dhk7FnKCoGY9SWwEgzhgMHDI=;
 b=sa/4JIgh+Foz/rkvb9oDWxapl0IgOtvWQlvkHRwlonVW6TDYJVYP7ZpojE0hqRYd9Y
 jUHabLn/V5AeTmaAyViDmeSzCT75l7PqbMFt6xbWLvm26sVTG3WRs33+e4LiHaQZcoMG
 JsDykWu8fyiije+fUlwmBzzxGUkfXig6EjCEihnAV1WGZxXKOS5sCCsd1kvX4QvpCaBz
 bA653XBSSVk2NLzvmS1YMduVqJUKEGvEcIJS1KwRVW9Jd5cC3qZs5brSDfOlR75zMLK4
 hK9x7xkHmzd7R3PCY0F0oIvoOFqqR4nMDLNCg7R2NNd66ZeuHsAlE7sze3A8j3p6gup+
 H1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=18AeDY8wAaikUaABLA+Dhk7FnKCoGY9SWwEgzhgMHDI=;
 b=8CJxqEwNBjgUe4/UlZcijJtpVGudyEOIRofw3aLIXATeWSb3yi6uuOe6nACx3qXVnz
 VQ95JKZ9lAQXiL4icXfKzNQs4WIlDHWZ9v268rAIknpIp9QPdf44IL/PXABnOYxsf5/P
 ej66ACgW1lbmpOjNa+ZLNoC11JqqqBzNgeSD3FQenyC5XiOiPTwrXmAEqPoA6Js8UdrQ
 cIAU4Eg1qCLaeQfYlmvVJoejEfLZzSuoHjNJDnoylXVBCDTEj4AtZVTRqAL8xhHIGjll
 xZElM2ERLB7cJ77v8VeEJkiAeOjUrCJ7cY5IhElp+sq0NTefGP/alRsoZjXRK7sp4S5n
 mbqg==
X-Gm-Message-State: AOAM532FA7iE3zdLsSSeh+NEUuQJW+tRZJBSNVGIJx1EUHuCe5uzdnVG
 oqei/aziqIODrCcO59bLovNhh+t1C/rLisBqhtJFBQ==
X-Google-Smtp-Source: ABdhPJyfVF5ZAmpdMeSEezkyWYEZxQXoOmf5Gjl6wVrdTU6A+GgVl8JmhTsT13M3USdEuSa3H7I4p2J+nqOUayGl1mA=
X-Received: by 2002:a05:6402:143b:: with SMTP id
 c27mr3716122edx.224.1632378373272; 
 Wed, 22 Sep 2021 23:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210830114531.2285178-1-jose.pekkarinen@unikie.com>
 <CAJPV9Mphsf6BhYHhsD7BFRXms2Psbi0xFX9SUaBbyu40iZCecQ@mail.gmail.com>
 <163214406368.4283.14394760824414034461@kwain>
 <CAJPV9MrgZcVw3cmO1+w_zn6M2yub+nCZ73H_YJ0g=OTpuu1MeA@mail.gmail.com>
 <163214596519.4283.5229631383777844599@kwain>
 <CAJPV9MqsdZa5oCYSE-+ZsNi4w1w8CWVeUPd4CohXddt5pcr7zQ@mail.gmail.com>
 <163220836697.4283.6363157164675068449@kwain>
 <CAJPV9MpNh0rXA6ZTJJyj5A58goFtt7GnPNimddk94eZw8S2bdQ@mail.gmail.com>
 <163223176981.4283.2007173106051805069@kwain>
 <CAJPV9Mp-6PBtw5G2YDORJ_5cqypjtrc2CR3cMrzfe36RpUW2oQ@mail.gmail.com>
 <163232062091.4283.13096713479109144471@kwain>
In-Reply-To: <163232062091.4283.13096713479109144471@kwain>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Thu, 23 Sep 2021 09:26:02 +0300
Message-ID: <CAJPV9MpWep997PN1v+R0E6RKhe4EOwY=ogFECnyfG0ppz2ekww@mail.gmail.com>
To: Antoine Tenart <atenart@kernel.org>
Subject: Re: [Buildroot] [PATCH] package/refpolicy: Treat all modules as
 custom
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0126371869557170854=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============0126371869557170854==
Content-Type: multipart/alternative; boundary="00000000000014102805cca3b5ba"

--00000000000014102805cca3b5ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 22, 2021 at 5:23 PM Antoine Tenart <atenart@kernel.org> wrote:

> Quoting Jos=C3=A9 Pekkarinen (2021-09-22 16:00:19)
> >    On Tue, Sep 21, 2021 at 4:42 PM Antoine Tenart <[1]atenart@kernel.or=
g
> >
> >    wrote:
> >      Quoting Jos=C3=A9 Pekkarinen (2021-09-21 15:32:32)
> >      > On Tue, Sep 21, 2021 at 10:12 AM Antoine Tenart
> >      <[1][2]atenart@kernel.org>
> >      > wrote:
> >      >
> >      > I tested today to build the system with buildroot
> 2021.05.2(without
> >      > the patch) and it reproduces exactly the same behaviour,
> >      > policy/modules.conf doesn't receive the line to activate the
> secure
> >      > module, and if I search in policy.conf or policy.32 through
> sesearch I
> >      > find no sign of the policies defined in the module.  I'll attemp=
t
> the
> >      > upgrade to 2021.08, but that will require a bit more time.
> >
> >      Alternatively you can just test with newer refpolicy versions,
> outside
> >      of Buildroot and look at the generated modules.conf. This will giv=
e
> the
> >      same information and should be easier to do. (My feeling is this
> won't
> >      change and we'll have to dive into the refpolicy logic for enablin=
g
> >      modules when running 'make conf').
> >
> >    The config generator requires a summary line in the module.if file
> >    to be added in policy/modules.conf, otherwise it doesn't process
> >    any further.  It seems to be something tricky to address, in your
> >    end developing a check the summary is in place doesn't make sense,
> >    in their end, not using that hook to learn the modules from the xml
> >    make be also complicated.
>
> I agree, having a check for the summary would be outside of Buildroot's
> scope. It's linked to how SELinux modules should be written.
>
> However I'm surprised as my understanding was the summary was required
> for the refpolicy configuration step to succeed (I did use a summary
> for all my tests because of this). When removing a summary from a module
> I always get the following error, and the Buildroot build stops.
>
>   doc/policy.xml:8376: element module: validity error : Element module
> content does not follow the DTD, expecting (summary , desc? , required? ,
> (interface | template)* , (bool | tunable)*), got ()
>   Document doc/policy.xml does not validate against doc/policy.dtd
>
> Do you have an idea what made your build to succeed even though you did
> not have a summary in your module?
>

I believe it is validating to the summary prior to the module,

the one you put in metadata.xml, but not any internal summary for
the interface. This is how policy.xml looks like in a case where I didn't
apply the mitigation:

<layer name=3D"buildroot">
<summary>Buildroot extra modules</summary>
<module name=3D"base" filename=3D"policy/modules/buildroot/base.if">
</module>
<module name=3D"secure" filename=3D"policy/modules/buildroot/secure.if">
</module>
</layer>

With this the modules.conf comes as:

# Layer: buildroot
# Module: base
#
# Layer: buildroot
# Module: secure
#

There is a summary followed by a module, validation pass, but

the module is not built. If I add the following lines in the build folder
modules[1]
and run make.conf:

[1] refpolicy-2.20200818/policy/modules/buildroot/secure.if: ##
<summary>External secure module.</summary>
refpolicy-2.20200818/policy/modules/buildroot/base.if: ## <summary>External
base module.</summary>

The policy.xml looks like:

<layer name=3D"buildroot">
<summary>Buildroot extra modules</summary>
<module name=3D"base" filename=3D"policy/modules/buildroot/base.if">
<summary>External base modules.</summary>
</module>
<module name=3D"secure" filename=3D"policy/modules/buildroot/secure.if">
<summary>External secure os vm module.</summary>
</module>
</layer>

Then policy/modules.conf looks this way:

# Layer: buildroot
# Module: base
#
# External base modules.
#
base =3D module

# Layer: buildroot
# Module: secure
#
# External secure os vm module.
#
secure =3D module

And this produces the modules to get into the policy.32 file.

Does it makes any sense on your end?


Best regards.

Jos=C3=A9.

--00000000000014102805cca3b5ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 5:23 PM Antoi=
ne Tenart &lt;<a href=3D"mailto:atenart@kernel.org">atenart@kernel.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Quoti=
ng Jos=C3=A9 Pekkarinen (2021-09-22 16:00:19)<br>
&gt;=C2=A0 =C2=A0 On Tue, Sep 21, 2021 at 4:42 PM Antoine Tenart &lt;[1]<a =
href=3D"mailto:atenart@kernel.org" target=3D"_blank">atenart@kernel.org</a>=
&gt;<br>
&gt;=C2=A0 =C2=A0 wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Quoting Jos=C3=A9 Pekkarinen (2021-09-21 15:32:32)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Tue, Sep 21, 2021 at 10:12 AM Antoine Tena=
rt<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &lt;[1][2]<a href=3D"mailto:atenart@kernel.org" ta=
rget=3D"_blank">atenart@kernel.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; I tested today to build the system with build=
root 2021.05.2(without<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; the patch) and it reproduces exactly the same=
 behaviour,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; policy/modules.conf doesn&#39;t receive the l=
ine to activate the secure<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; module, and if I search in policy.conf or pol=
icy.32 through sesearch I<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; find no sign of the policies defined in the m=
odule.=C2=A0 I&#39;ll attempt the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; upgrade to 2021.08, but that will require a b=
it more time.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 Alternatively you can just test with newer refpoli=
cy versions, outside<br>
&gt;=C2=A0 =C2=A0 =C2=A0 of Buildroot and look at the generated modules.con=
f. This will give the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 same information and should be easier to do. (My f=
eeling is this won&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 change and we&#39;ll have to dive into the refpoli=
cy logic for enabling<br>
&gt;=C2=A0 =C2=A0 =C2=A0 modules when running &#39;make conf&#39;).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 The config generator requires a summary line in the modul=
e.if file<br>
&gt;=C2=A0 =C2=A0 to be added in policy/modules.conf, otherwise it doesn&#3=
9;t process<br>
&gt;=C2=A0 =C2=A0 any further.=C2=A0 It seems to be something tricky to add=
ress, in your<br>
&gt;=C2=A0 =C2=A0 end developing a check the summary is in place doesn&#39;=
t make sense,<br>
&gt;=C2=A0 =C2=A0 in their end, not using that hook to learn the modules fr=
om the xml<br>
&gt;=C2=A0 =C2=A0 make be also complicated.<br>
<br>
I agree, having a check for the summary would be outside of Buildroot&#39;s=
<br>
scope. It&#39;s linked to how SELinux modules should be written.<br>
<br>
However I&#39;m surprised as my understanding was the summary was required<=
br>
for the refpolicy configuration step to succeed (I did use a summary<br>
for all my tests because of this). When removing a summary from a module<br=
>
I always get the following error, and the Buildroot build stops.<br>
<br>
=C2=A0 doc/policy.xml:8376: element module: validity error : Element module=
 content does not follow the DTD, expecting (summary , desc? , required? , =
(interface | template)* , (bool | tunable)*), got ()<br>
=C2=A0 Document doc/policy.xml does not validate against doc/policy.dtd<br>
<br>
Do you have an idea what made your build to succeed even though you did<br>
not have a summary in your module?<br></blockquote><div><br></div></div><bl=
ockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"=
gmail_quote"><div>I believe it is validating to the summary prior to the mo=
dule,</div></div></blockquote>the one you put in metadata.xml, but not any =
internal summary for<div>the interface. This is how policy.xml looks like i=
n a case where I didn&#39;t</div><div>apply the mitigation:</div><div><br><=
/div><div>&lt;layer name=3D&quot;buildroot&quot;&gt;<br>&lt;summary&gt;Buil=
droot extra modules&lt;/summary&gt;<br>&lt;module name=3D&quot;base&quot; f=
ilename=3D&quot;policy/modules/buildroot/base.if&quot;&gt;<br>&lt;/module&g=
t;<br>&lt;module name=3D&quot;secure&quot; filename=3D&quot;policy/modules/=
buildroot/secure.if&quot;&gt;<br>&lt;/module&gt;<br>&lt;/layer&gt;</div><di=
v><br></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;padding=
:0px"><div>With this the modules.conf comes as:</div><div><br></div></block=
quote># Layer: buildroot<br># Module: base<br>#<br># Layer: buildroot<br># =
Module: secure<br>#<span style=3D"font-family:monospace"><br></span></div><=
div><br></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;paddi=
ng:0px"><div>There is a summary followed by a module, validation pass, but<=
/div></blockquote>the module is not built. If I add the following lines in =
the build folder modules[1]</div><div>and run make.conf:</div><div><br></di=
v><div>[1]=C2=A0refpolicy-2.20200818/policy/modules/buildroot/secure.if: ##=
 &lt;summary&gt;External secure module.&lt;/summary&gt;</div><div>refpolicy=
-2.20200818/policy/modules/buildroot/base.if: ## &lt;summary&gt;External ba=
se module.&lt;/summary&gt;<br></div><div><br></div><div><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div>The policy.xml looks li=
ke:</div><div><br></div></blockquote>&lt;layer name=3D&quot;buildroot&quot;=
&gt;<br>&lt;summary&gt;Buildroot extra modules&lt;/summary&gt;<br>&lt;modul=
e name=3D&quot;base&quot; filename=3D&quot;policy/modules/buildroot/base.if=
&quot;&gt;<br>&lt;summary&gt;External base modules.&lt;/summary&gt;<br>&lt;=
/module&gt;<br>&lt;module name=3D&quot;secure&quot; filename=3D&quot;policy=
/modules/buildroot/secure.if&quot;&gt;<br>&lt;summary&gt;External secure os=
 vm module.&lt;/summary&gt;<br>&lt;/module&gt;<br>&lt;/layer&gt;</div><div>=
<br></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0=
px"><div>Then policy/modules.conf looks this way:</div><div><br></div></blo=
ckquote># Layer: buildroot<br># Module: base<br>#<br># External base module=
s.<br># =C2=A0<br>base =3D module<br><br># Layer: buildroot<br># Module: se=
cure<br>#<br># External secure os vm module.<br># =C2=A0<br>secure =3D modu=
le</div><div><br></div><div><blockquote style=3D"margin:0 0 0 40px;border:n=
one;padding:0px"><div>And this produces the modules to get into the policy.=
32 file.</div></blockquote>Does it makes any sense on your end?<br><blockqu=
ote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div><br></div></bl=
ockquote><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><d=
iv>Best regards.</div><div><br></div></blockquote><div dir=3D"ltr" class=3D=
"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px =
40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div></div></di=
v>

--00000000000014102805cca3b5ba--

--===============0126371869557170854==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0126371869557170854==--
