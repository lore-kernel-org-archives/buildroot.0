Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF48AC54E5D
	for <buildroot@archiver.kernel.org>; Sat, 16 Mar 2024 11:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD65B6084E;
	Sat, 16 Mar 2024 11:00:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wwz8-9LtX4sM; Sat, 16 Mar 2024 10:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18F3C60698
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18F3C60698;
	Sat, 16 Mar 2024 10:59:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 200A91BF21A
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 10:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CC1480AEE
 for <buildroot@lists.busybox.net>; Sat, 16 Mar 2024 10:59:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UYV7uA0CZGw for <buildroot@lists.busybox.net>;
 Sat, 16 Mar 2024 10:59:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E3F1882289
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3F1882289
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E3F1882289
 for <buildroot@busybox.net>; Sat, 16 Mar 2024 10:59:54 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-5dca1efad59so2103510a12.2
 for <buildroot@busybox.net>; Sat, 16 Mar 2024 03:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710586794; x=1711191594;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eFoDJw19TewkRPqmhxAiTyGiquTifTVuFCuYK02vOSQ=;
 b=D3FYi7kD4SP3YAGgDcOBc6SQTwq6iVvwZdt/HXCKk3q+QUsMM7ONvwVEWKzcGP8fPD
 vr6sbfBgTyUtNiCYgsWNoriQwyxXLivNOmOXOv287GqvHQPkyptSnwLURBJYgcW50FZn
 rbpcGi2+zPv4sWnSm8ipTf82aSa11dFySoDEOl0Db+po/n4LYf3bJch96vnPkeVD6Sia
 9MO9pIfcvpDbb2qyBHJXOcQZ1oV5ybw8RpHDlWIyHwKTnI3v5Xmv6DjeEkMt5eiB1kvo
 OLjh6Py1yLSO90h78rrYRRELDNNiQkS2gLNympPLM4m0Xwtgx9mEAxUHll8OtX33XpRI
 6AfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMEfdwOWUXCqIOznQ5jir2L3AmAvILo3yuGiS+bVfxTUQm/eukII4Fy19ZuzmEDBHJbwNGartCd6wR9dByHYznOxopsII=
X-Gm-Message-State: AOJu0YxAw3GzcYrEKQl8dQR3ob4/Qyax3XD8m30HX32/TJIo7e5u2XgY
 /UzyL2YGlWcKZfclAnmTKj9szPgC3rvCKWOazL8Ym9W28JlXVBQTcU8i+ZirR3fLEJNmGlNTBZo
 VgeFBlPMelZwMwZVlEWLCWBlLath1xkph+VoEsdfnqg4iebnmnY+b
X-Google-Smtp-Source: AGHT+IGcykEn+ieuph23c0rkjPTwfYuHZrpbG2njVJ7WVoQOt5HcnuwCpHNu8HZKGSE03G4tWAsddd+mvMUBO65/BFA=
X-Received: by 2002:a05:6a20:9147:b0:1a3:5606:9875 with SMTP id
 x7-20020a056a20914700b001a356069875mr924956pzc.4.1710586793222; Sat, 16 Mar
 2024 03:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240313091412.20865-1-francois.perrad@gadz.org>
 <20240313091412.20865-4-francois.perrad@gadz.org>
 <00accd1d-3060-404b-b3a9-13590ef4835c@mind.be>
In-Reply-To: <00accd1d-3060-404b-b3a9-13590ef4835c@mind.be>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 16 Mar 2024 11:59:42 +0100
Message-ID: <CAAE6iEUVaONGYmadPs3giMCL6QrsWfDN0eRJf1f4PgWa3f4UWQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1710586794; x=1711191594; darn=busybox.net;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eFoDJw19TewkRPqmhxAiTyGiquTifTVuFCuYK02vOSQ=;
 b=fhV6b78r72rxsHhVsJwrbmqIC27O4ni382UuvOMzVobQ1vc3fbMMFvDiU7WT/+7XyX
 Svp7DPND/lNESWuzRCzlr9BW253e19rfIHOllLTLHRzkXGezUFDERAnvujCezLoCflgZ
 HG5oqc+kLOo+7xP62amcprHmYxXMhY6RtYHbKDbRCDkLecl6KZNF8M9OgX3wUppftDVS
 G5OPvuNlde/1KjJisSGh8aL3F9VbpV23rCXLIM2Tlh36CyVfeqb2GaOriF9tl/7ViBkw
 SxayYZQ3KYzEpPSPkvybYzjNgIsvp2hQOkxIFGcWnyHYPd4688lY3T1mmDOSzYYgR60j
 nj/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=fhV6b78r
Subject: Re: [Buildroot] [PATCH 04/31] package/diffutils: disable busybox
 diff
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
Content-Type: multipart/mixed; boundary="===============7075903032367020234=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7075903032367020234==
Content-Type: multipart/alternative; boundary="0000000000002c25d70613c50623"

--0000000000002c25d70613c50623
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 15 mars 2024 =C3=A0 20:57, Arnout Vandecappelle via buildroot <
buildroot@buildroot.org> a =C3=A9crit :

>   Hi Francois,
>
> On 13/03/2024 10:13, Francois Perrad wrote:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >   package/diffutils/diffutils.mk | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/package/diffutils/diffutils.mk b/package/diffutils/
> diffutils.mk
> > index 111926686..fe20a0e67 100644
> > --- a/package/diffutils/diffutils.mk
> > +++ b/package/diffutils/diffutils.mk
> > @@ -18,4 +18,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
> >   DIFFUTILS_CONF_ENV +=3D gl_cv_func_getopt_gnu=3Dyes
> >   endif
> >
> > +define DIFFUTILS_BUSYBOX_CONFIG_FIXUPS
> > +     $(call KCONFIG_DISABLE_OPT,CONFIG_DIFF)
>
>   I don't understand the point of this series. In general, there is no
> reason to
> disable applets from busybox just because there's a "full" alternative
> installed
> on the system. Usually the busybox size difference is completely
> negligible
> compared to the the "full" installation size. And the busybox one can
> still be
> useful in some cases (when called as 'busybox diff' instead of 'diff').
>
>   If you really care about removing the redundant busybox options, you ca=
n
> easily supply a custom busybox config.
>
>   Is there a really good reason for all this?
>
>
In fact, in this serie, the only important patches are the 2 first.

I wrote the nexts, like this one, in order to show an use case of the 2nd
patch "package/busybox: handle LIBFOO_BUSYBOX_CONFIG_FIXUPS".
But it was a bad idea.

Note that my goal is not to reducing the image size, but to reducing the
attack surface (from a cyber security point of view).

Busybox uses the Kconfig infrastructure.
Currently, it could be configured via a full custom defconfig or via
fragments.
But, I think that altering the configuration by fixups could be also useful=
.

Francois


>   Regards,
>   Arnout
>
> > +endef
> > +
> >   $(eval $(autotools-package))
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--0000000000002c25d70613c50623
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 15 mars 2024 =C3=A0=C2=
=A020:57, Arnout Vandecappelle via buildroot &lt;<a href=3D"mailto:buildroo=
t@buildroot.org">buildroot@buildroot.org</a>&gt; a =C3=A9crit=C2=A0:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 Hi Francois,<br=
>
<br>
On 13/03/2024 10:13, Francois Perrad wrote:<br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0package/diffutils/<a href=3D"http://diffutils.mk" rel=3D"n=
oreferrer" target=3D"_blank">diffutils.mk</a> | 4 ++++<br>
&gt;=C2=A0 =C2=A01 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/diffutils/<a href=3D"http://diffutils.mk" rel=3D"=
noreferrer" target=3D"_blank">diffutils.mk</a> b/package/diffutils/<a href=
=3D"http://diffutils.mk" rel=3D"noreferrer" target=3D"_blank">diffutils.mk<=
/a><br>
&gt; index 111926686..fe20a0e67 100644<br>
&gt; --- a/package/diffutils/<a href=3D"http://diffutils.mk" rel=3D"norefer=
rer" target=3D"_blank">diffutils.mk</a><br>
&gt; +++ b/package/diffutils/<a href=3D"http://diffutils.mk" rel=3D"norefer=
rer" target=3D"_blank">diffutils.mk</a><br>
&gt; @@ -18,4 +18,8 @@ ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)<br>
&gt;=C2=A0 =C2=A0DIFFUTILS_CONF_ENV +=3D gl_cv_func_getopt_gnu=3Dyes<br>
&gt;=C2=A0 =C2=A0endif<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +define DIFFUTILS_BUSYBOX_CONFIG_FIXUPS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(call KCONFIG_DISABLE_OPT,CONFIG_DIFF)<br>
<br>
=C2=A0 I don&#39;t understand the point of this series. In general, there i=
s no reason to <br>
disable applets from busybox just because there&#39;s a &quot;full&quot; al=
ternative installed <br>
on the system. Usually the busybox size difference is completely negligible=
 <br>
compared to the the &quot;full&quot; installation size. And the busybox one=
 can still be <br>
useful in some cases (when called as &#39;busybox diff&#39; instead of &#39=
;diff&#39;).<br>
<br>
=C2=A0 If you really care about removing the redundant busybox options, you=
 can <br>
easily supply a custom busybox config.<br>
<br>
=C2=A0 Is there a really good reason for all this?<br>
<br></blockquote><div><br></div><div>In fact, in this serie, the only impor=
tant patches are the 2 first.<br><br>I wrote the nexts, like this one, in o=
rder to show an use case of the 2nd patch &quot;package/busybox: handle LIB=
FOO_BUSYBOX_CONFIG_FIXUPS&quot;.<br>But it was a bad idea.<br><br>Note that=
 my goal is not to reducing the image size, but to reducing the attack surf=
ace (from a cyber security point of view).<br><br>Busybox uses the Kconfig =
infrastructure.<br>Currently, it could be configured via a full custom defc=
onfig or via fragments.<br>But, I think that altering the configuration by =
fixups could be also useful.</div><div><br></div><div>Francois<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; +endef<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0$(eval $(autotools-package))<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--0000000000002c25d70613c50623--

--===============7075903032367020234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7075903032367020234==--
