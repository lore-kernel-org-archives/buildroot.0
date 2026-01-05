Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F755C2A088
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 10:11:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F54360889;
	Mon,  5 Jan 2026 10:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s32qNySMvtsR; Mon,  5 Jan 2026 10:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF54D60884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767607875;
	bh=Aez+RxKShnXCxnl0BjAukARdj9vE5WJLEaHQlJV6duY=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S+cmHevipftm2txobSCqNqAHcCKRqyZp/OhlR8TAs7AWrSNU7ixM4w+wc2hHdoAiq
	 I91GY4JaWgz8mfTgmtt3fzpFv6HgvEBIxvtQFFhuh3y+aKMI4XEzOxQJcT6mCDsuhA
	 f1pyCsRwnUiwxkBcctRNG1+NAEzdeRG7cTVDvH3lueJOkMtFqL47rmcV0q5eeCe/Zr
	 9Go9L9yHBClOGm0loxRQv1POhGJYnA7bbE4ZvlWdFN3/leroTYMVlFNQRYQosvKdgn
	 KeO3kIXx3E2zha232TZWDxT5cERYUI7j1Fj8voKTTFeFOdTOh5ysYfH6rUJ2bgxFI1
	 m3BqtfZiVnv9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF54D60884;
	Mon,  5 Jan 2026 10:11:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09E8B2DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F02BD8079A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:11:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mEQKUcHgM2gB for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 10:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C336080795
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C336080795
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C336080795
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:11:12 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-59584301f0cso5144603e87.0
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 02:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767607870; x=1768212670;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nkS+iMO7DgT7kmEmy5HLJYjyhEf36/tC4vL1Dc8wNMI=;
 b=fm40fVEWryFIOX1RBjd9VZEL2ReKW9GkZ2zdDyIwieEcAvf6Wg/1NpaaLFu0/if0EF
 aTPNBCNg4Hc7nWDB1Bh9WN60TyoGB9u+qVhHMPfN6qZYqYDVnvSbsGF867WOjAlmHrH9
 DbOPF0xWlXpyCalWuSD+lGQG0Y3aDAVsyYRcdaD96ehL1e56v3In7F4XHIWwXz6QsUZo
 LzMv21cImL/AR2DYWeORicPgmRufsKsJBXE+je4I+lvHaU/9Ycla7/NiBWhJ1Une9kax
 3rq5MAm8TuaketdTlhLuuqnyEgJoQLsQ5uwOF7+TNdo8ntPKO8P07F08ZJpgA6jaFcGj
 nQ0Q==
X-Gm-Message-State: AOJu0Yx9YOzPKJCm7p2vIpzpDv9QBc8n7NxHTV8WAL0w4fh9FlKj9vBS
 YBO9sXYlKJqDPP08pKkCSg1jnpljLTxZ/KENbcx/JhW09SPnS1l6K21nHNR2y9N2J3WdhuHalzt
 +WJFImrQeQO+R9WU6IzETwJOs0zzyvR5Pm8rs92pYcvwY6yzldWkoZMY=
X-Gm-Gg: AY/fxX5xBiAIy+j9Of+//R6HJqXyyNrgBqBvOdHyattTuCcE8zqStl5WwVVxPLBE3Jp
 vqaImGWn9kCPXOqsckuPg/2eeL+l5Oz8TbpQhNSMy44f824QqPhWaEn7A7xCbPFAqDO3ey9qi3D
 vmIiaEqEGiU3UKosaZQAmWAn1hKeUdrRuc0XcVtoMkOiJRHOWhNFwKUpDyQfBgP53wQUw4W4R3/
 2pFuLB6IB2sNOIwyjJi99+VXY+naW6clivCwBg5Dg1k2nF4egaiRNgtTxq6NgvOcCBHi4ALFQ==
X-Google-Smtp-Source: AGHT+IHK1Ss0TyKp2W7uJ7p4iiXgwp/x1I+rQXhhSGgUZvYL7g3fSreZoWbCC3ZNL/PFYQdtqvcnDmeULGCaqm+2giY=
X-Received: by 2002:a05:6512:3e1a:b0:594:2c51:f27b with SMTP id
 2adb3069b0e04-59a17d2375emr15679743e87.18.1767607870050; Mon, 05 Jan 2026
 02:11:10 -0800 (PST)
MIME-Version: 1.0
References: <20260102150757.1480511-4-fabien.lehoussel@smile.fr>
 <20260102155708.709573-1-thomas.perale@mind.be>
In-Reply-To: <20260102155708.709573-1-thomas.perale@mind.be>
Date: Mon, 5 Jan 2026 11:10:58 +0100
X-Gm-Features: AQt7F2oaPsRV671VFtx_w7BfK7JJwLsmPp02DVlzRV4dG6J4xBx5WZypQmw5Osc
Message-ID: <CAKWtHtyWjXasfrmJ8tty0USL3rffKtrSL9Y5Ra8Epzn8Vjf6pw@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1767607870; x=1768212670; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nkS+iMO7DgT7kmEmy5HLJYjyhEf36/tC4vL1Dc8wNMI=;
 b=oILmdbsjnXcnIkG8f9nCgVrwjd9du42m7vSTlCz2F8/WodYpNkAB543m6ef9LcmoPs
 uaTHpNYlwe8sUhYRPznFW7qWbZ3hW7rW+Gt/509XpUkH1MEjxEQsmOZ+2GKmB+cWKL1N
 LAuWZ3hAJo+oLOTT3iBHC+9Sn2l4OXNZldSJ0=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=oILmdbsj
Subject: Re: [Buildroot] [PATCH 4/5] utils/generate-cyclonedx: remove unused
 Buildroot dependency
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
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Content-Type: multipart/mixed; boundary="===============8920702866000683889=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8920702866000683889==
Content-Type: multipart/alternative; boundary="00000000000032653d0647a147e9"

--00000000000032653d0647a147e9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 2 janv. 2026 =C3=A0 16:57, Thomas Perale <thomas.perale@mind.be> a
=C3=A9crit :

> In reply of:
> > Buildroot is a build tool, not a component or package that should be
> included in the generated SBOM
> >
> > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
>
> > ---
> >  utils/generate-cyclonedx | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> > index 23176bc2c2..e47b6f2f6e 100755
> > --- a/utils/generate-cyclonedx
> > +++ b/utils/generate-cyclonedx
> > @@ -467,7 +467,6 @@ def main():
> >              cyclonedx_component(name, comp) for name, comp in
> filtered_show_info_dict.items()
> >          ],
> >          "dependencies": [
> > -            cyclonedx_dependency("buildroot",
> list(filtered_show_info_dict)),
>
> This is needed if you use tools such as DependencyTrack to use the
> 'Dependency
> Graph' feature so I don't think we should remove it.
>
> But while reviewing this change I saw that there is indeed an error in th=
is
> line the dependencies should not be for 'buildroot' but for
> `args.project_name`
> instead.
>
> Does this line cause any issues in your usage for SBOMs ?
>
>
Hi Thomas,

I now understand why no information was displayed in my dependency graph
screen (Buildroot vs. my custom project name).
I will send new patch with :

diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
index 23176bc2c2..8d250c89ab 100755
--- a/utils/generate-cyclonedx
+++ b/utils/generate-cyclonedx
@@ -467,7 +467,7 @@ def main():
             cyclonedx_component(name, comp) for name, comp in
filtered_show_info_dict.items()
         ],
         "dependencies": [
-            cyclonedx_dependency("buildroot",
list(filtered_show_info_dict)),
+            cyclonedx_dependency(args.project_name,
list(filtered_show_info_dict)),
             *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref,
filtered_show_info_dict))
               for ref in filtered_show_info_dict],
         ],
--=20
2.43.0

Fabien

>              *[cyclonedx_dependency(ref, br2_parse_deps_recursively(ref,
> filtered_show_info_dict))
> >                for ref in filtered_show_info_dict],
> >          ],
> > --
> > 2.43.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000032653d0647a147e9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 2 =
janv. 2026 =C3=A0=C2=A016:57, Thomas Perale &lt;<a href=3D"mailto:thomas.pe=
rale@mind.be">thomas.perale@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">In reply of:<br>
&gt; Buildroot is a build tool, not a component or package that should be i=
ncluded in the generated SBOM<br>
&gt; <br>
&gt; Signed-off-by: Fabien Lehoussel &lt;<a href=3D"mailto:fabien.lehoussel=
@smile.fr" target=3D"_blank">fabien.lehoussel@smile.fr</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 utils/generate-cyclonedx | 1 -<br>
&gt;=C2=A0 1 file changed, 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx<br>
&gt; index 23176bc2c2..e47b6f2f6e 100755<br>
&gt; --- a/utils/generate-cyclonedx<br>
&gt; +++ b/utils/generate-cyclonedx<br>
&gt; @@ -467,7 +467,6 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cyclonedx_component(na=
me, comp) for name, comp in filtered_show_info_dict.items()<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dependencies&quot;: [<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cyclonedx_dependency(&quot;=
buildroot&quot;, list(filtered_show_info_dict)),<br>
<br>
This is needed if you use tools such as DependencyTrack to use the &#39;Dep=
endency<br>
Graph&#39; feature so I don&#39;t think we should remove it.<br>
<br>
But while reviewing this change I saw that there is indeed an error in this=
<br>
line the dependencies should not be for &#39;buildroot&#39; but for `args.p=
roject_name`<br>
instead.<br>
<br>
Does this line cause any issues in your usage for SBOMs ?<br>
<br></blockquote><div><br></div><div>Hi Thomas,=C2=A0</div><div>
<p>I now understand why no information was displayed in my dependency graph=
 screen (Buildroot vs. my custom project name).</p></div><div>I will send n=
ew patch with :</div><div><br></div><div>diff --git a/utils/generate-cyclon=
edx b/utils/generate-cyclonedx<br>index 23176bc2c2..8d250c89ab 100755<br>--=
- a/utils/generate-cyclonedx<br>+++ b/utils/generate-cyclonedx<br>@@ -467,7=
 +467,7 @@ def main():<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c=
yclonedx_component(name, comp) for name, comp in filtered_show_info_dict.it=
ems()<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0&quot;dependencies&quot;: [<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cyclonedx_dependency(&quot;buildroot&quot;, list(filtered_show_in=
fo_dict)),<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cyclonedx_dependen=
cy(args.project_name, list(filtered_show_info_dict)),<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*[cyclonedx_dependency(ref, br2_parse_deps_r=
ecursively(ref, filtered_show_info_dict))<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0for ref in filtered_show_info_dict],<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0],<br>-- <br>2.43.0</div><div><br></div><div>Fab=
ien</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *[cyclonedx_dependency=
(ref, br2_parse_deps_recursively(ref, filtered_show_info_dict))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for ref in filt=
ered_show_info_dict],<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ],<br>
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
</blockquote></div></div>

--00000000000032653d0647a147e9--

--===============8920702866000683889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8920702866000683889==--
