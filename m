Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4FCC2A074
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 10:28:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CED96608A6;
	Mon,  5 Jan 2026 10:28:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wgah99ulhSpd; Mon,  5 Jan 2026 10:28:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6CE360876
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767608890;
	bh=+UqsE6ch1uLlubCqO6TCLp0sdTWs9jHCEhBHeLLKA1w=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XgDS5gbp5HQKufcTpCYxs3sK600n+Ro1FwhOMFxNUY8oLj9rx0cGPsKgOoR1DMgqX
	 pMPw/LFEvsDFuPMC6PILaYBV4qwL0fyJUDNuXqdVBC+kCkYNslrZzbWsH5pCqgKfdk
	 OAX0SpcWydtCMgq+g6l/m0JpTMxSlegDybjOebVucSDU1NZEYdgRJL2VoaWBK8m/xZ
	 9sh/1fG6+2PDSgZeaDDqiYmnB3RRqQnekiq6MB5LwwvlQDjfKcSKXP8ff8XTbz8lJj
	 hgVvcJX1LVb5NcaxNgw7DGAhm5hc0vZSWt800LxZgJpsNOT0CokFXGXGCiMRPFgsY9
	 NMuvKr+if2/2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6CE360876;
	Mon,  5 Jan 2026 10:28:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D1832DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A8C24066A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unTD3sFsqFlP for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 10:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4107240669
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4107240669
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4107240669
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 10:28:08 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-597d712c0a7so14363231e87.0
 for <buildroot@buildroot.org>; Mon, 05 Jan 2026 02:28:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767608886; x=1768213686;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zk8FQ5R2nYXtsGdmHA2hTiUIH8ykrmY74tSN/scx36c=;
 b=abjecYyHy3UUchlH4DUQOk0fopzXnwTBHacP0c9ZdxLyqxzuhLPIjFtiWpSmqYs0cj
 mlJkmAv/YUWopkQCknh/urxQewsVvWI+jXz5bNTEGTpCFd0F/+Q4Tr4NVTVRe70GIdM2
 /BUk6pXoek9klBXLHWyoI4ue2v06uyLbOjrYSQT9Nwq0ZWucLIW/G0A2tydGiv/hN5k7
 IYoa7w403eriri6vkk4XWGqL8SggvQFllK7b2tFHHtbCeArx3zXzkQIQ06QGHcq6C4LO
 +W+KKiNm6GUTWQ4mroPuDXD41bILKzkysNNyfLA83fatC1+aWD53ZacjcLHFsN9nT155
 HF8Q==
X-Gm-Message-State: AOJu0YyzQpbodrAwD7l4aTfZ3D9AAhvnR3QvbcTBhMC8OCgW3F+mxR1r
 TuFkT2fTEcNE2LyYm5zP2RcV8PdhQZCd0bAVBtcnpzNovHw5cDz59DrB9v5NoZ3tH0QO1UCD15y
 Olspbns2w44kIUu53ZmGW6Rou72i5z9RrmIpR8+Bs70dRPQK03Aq6sN4=
X-Gm-Gg: AY/fxX5qJS0JJhriKtZOY3Fr+e4L1c86xSdACloPaIIY1d761GHD7MTyrlUHWhOWEb1
 6Nr+O2PkgdkfRYRsVHNcp2ObcjkXegtMkjxu75mXyQuwcBp/c++YM+5Mw0kKXruTKmo8HUQA2BT
 DTSMm5ps1zwakC9cs3/qrhW7LN+g9Vge3K8jQGolbZOdII5wmYa3rYosAPVLhObyZbolQ+MgGdn
 16+tufm+2Q1ZvsGaPKjsPl98FGTiFa0+K/SuTS4mfnMQOXgTzZDfU+Eg+vtBWk/gGTUnnhxxw==
X-Google-Smtp-Source: AGHT+IEV6Zk39u0cnEr0rRFm5OCUPAmHk+8d3Q5rUXa81tfkDn97NwpD20eHiRCnd3PxRFLOlGJqA2azNcRgBrd7DNw=
X-Received: by 2002:a05:6512:104f:b0:59a:1240:dec3 with SMTP id
 2adb3069b0e04-59a17de0950mr16673872e87.52.1767608885670; Mon, 05 Jan 2026
 02:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20260102150757.1480511-3-fabien.lehoussel@smile.fr>
 <20260102160348.712155-1-thomas.perale@mind.be>
In-Reply-To: <20260102160348.712155-1-thomas.perale@mind.be>
Date: Mon, 5 Jan 2026 11:27:54 +0100
X-Gm-Features: AQt7F2o5lA57mWjKiW6c9akGBM_FbBT-LuHYkfWBj1qAGfhtaVNSp4DXDefZOCU
Message-ID: <CAKWtHtxKbF2Arb=ifesYBG20singjjd215y_POs84N8fGA6jOA@mail.gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1767608886; x=1768213686; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Zk8FQ5R2nYXtsGdmHA2hTiUIH8ykrmY74tSN/scx36c=;
 b=w+59jY5dat1b7Gx4tNJw0VDWpMO4UTDNbl2JGOejOI7miRk4dJfTwT/AKWpdw10QH5
 m+fiildI29buoYRy5/5geawHQV9i4JRskMOE3KxuhKqffUq6uBO4eRinYcKS5uzPsat+
 4gj6c+5CbY8jLiwXKdK045CTBvcgX9A4HPwSQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=w+59jY5d
Subject: Re: [Buildroot] [PATCH 3/5] utils/generate-cyclonedx: add option to
 filter only target packages
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
Content-Type: multipart/mixed; boundary="===============7938647251471050955=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7938647251471050955==
Content-Type: multipart/alternative; boundary="000000000000bb88240647a183ed"

--000000000000bb88240647a183ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 2 janv. 2026 =C3=A0 17:03, Thomas Perale <thomas.perale@mind.be> a
=C3=A9crit :

> In reply of:
> > - Introduces the `--only-target-packages` argument to control package
> inclusion.
> > - Ensures the generated SBOM includes only target components and their
> associated dependencies.
> > - Excludes host-only packages from the SBOM output.
> >
> > Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>
>
> Tested-By: Thomas Perale <thomas.perale@mind.be>
>
> > ---
> >  utils/generate-cyclonedx | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> > index 5de6afa39a..23176bc2c2 100755
> > --- a/utils/generate-cyclonedx
> > +++ b/utils/generate-cyclonedx
> > @@ -410,6 +410,8 @@ def main():
> >                          default=3D(None if sys.stdin.isatty() else
> sys.stdin))
> >      parser.add_argument("-o", "--out-file", nargs=3D"?",
> type=3Dargparse.FileType("w"),
> >                          default=3Dsys.stdout)
> > +    parser.add_argument("--only-target-packages", default=3DFalse,
> action=3D'store_true',
> > +                        help=3D"This option includes only packages
> installed on the target (components and dependencies)")
> >      parser.add_argument("--project-name", type=3Dstr, default=3D"build=
root",
> >                          help=3D"Specify the project name to use in the
> SBOM metadata (default:'buildroot')")
> >      parser.add_argument("--project-version", type=3Dstr,
> default=3Df"{BR2_VERSION_FULL}",
> > @@ -427,7 +429,8 @@ def main():
> >      # Keep only packages with at least one download source defined
> >      # (packages with _SITE variable in Buildroot makefile).
> >      filtered_show_info_dict =3D {k: v for k, v in show_info_dict.items=
()
> > -                                if (len(v.get('downloads', [])) > 0)}
> > +                                if (len(v.get('downloads', [])) > 0 an=
d
> > +                                    (not args.only_target_packages or
> v.get('install_target') is True))}
>
> Maybe I did something wrong but here the issue is the same as the similar
> patch
> that was sent for this feature. I still see references to 'host-' package=
s
> in
> the dependencies even though they don't exist in the components.
>
>
Hi Thomas,

You=E2=80=99re right, there is an issue that I had missed.

The problem is in my first patch when updating the filter, I forgot to
check if the dependency is defined as a package in the dictionary

Correction :

@@ -337,12 +337,10 @@ def cyclonedx_vulnerabilities(show_info_dict):
     } for cve, components in cves.items()]


-def br2_parse_deps_recursively(ref, show_info_dict, virtual=3DFalse,
deps=3D[]):
+def br2_parse_deps_recursively(ref, show_info_dict, deps=3D[]):
     """Parse dependencies from the show-info output. This function will
     recursively collect all dependencies, and return a list where each
dependency
     is stated at most once.
-    The dependency on virtual package will collect the final dependency
without
-    including the virtual one.

     Args:
         ref (str): The identifier of the package for which the
dependencies have
@@ -358,10 +356,13 @@ def br2_parse_deps_recursively(ref, show_info_dict,
virtual=3DFalse, deps=3D[]):
         list: A list of dependencies of the 'ref' package.
     """
     for dep in show_info_dict.get(ref, {}).get("dependencies", []):
+        # Ignore dependencies that are not exist as a package in the
dictionary
+        if dep not in show_info_dict:
+            continue
+
         if dep not in deps:
-            if virtual or show_info_dict.get(dep, {}).get("virtual") is
False:
-                deps.append(dep)
-            br2_parse_deps_recursively(dep, show_info_dict, virtual, deps)
+            deps.append(dep)
+            br2_parse_deps_recursively(dep, show_info_dict, deps)

     return deps

I will send a new patch.

Fabien



> Example for minidlna
>
> ```
>     {
>       "ref": "minidlna",
>       "dependsOn": [
>         "ffmpeg",
>         "flac",
>         "host-pkgconf",
>         "host-skeleton",
>         "host-xutil_makedepend",
>         "jpeg",
>         "libexif",
>         "libid3tag",
>         "libogg",
>         "libvorbis",
>         "skeleton",
>         "sqlite",
>         "toolchain",
>         "zlib"
>       ]
>     },
> ```
>
> All the 'host-' packages are not present in the components.
>
> >
> >      # Show differences between original and filtered dictionary
> >      print_dict_diff(show_info_dict, filtered_show_info_dict,
> verbose=3Dargs.print_info)
> > --
> > 2.43.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000bb88240647a183ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 2 =
janv. 2026 =C3=A0=C2=A017:03, Thomas Perale &lt;<a href=3D"mailto:thomas.pe=
rale@mind.be">thomas.perale@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">In reply of:<br>
&gt; - Introduces the `--only-target-packages` argument to control package =
inclusion.<br>
&gt; - Ensures the generated SBOM includes only target components and their=
 associated dependencies.<br>
&gt; - Excludes host-only packages from the SBOM output.<br>
&gt; <br>
&gt; Signed-off-by: Fabien Lehoussel &lt;<a href=3D"mailto:fabien.lehoussel=
@smile.fr" target=3D"_blank">fabien.lehoussel@smile.fr</a>&gt;<br>
<br>
Tested-By: Thomas Perale &lt;<a href=3D"mailto:thomas.perale@mind.be" targe=
t=3D"_blank">thomas.perale@mind.be</a>&gt;<br>
<br>
&gt; ---<br>
&gt;=C2=A0 utils/generate-cyclonedx | 5 ++++-<br>
&gt;=C2=A0 1 file changed, 4 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx<br>
&gt; index 5de6afa39a..23176bc2c2 100755<br>
&gt; --- a/utils/generate-cyclonedx<br>
&gt; +++ b/utils/generate-cyclonedx<br>
&gt; @@ -410,6 +410,8 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 default=3D(None if sys.stdin.isatty() else sys.stdin))=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&quot;-o&quot;, &quot;--out-fi=
le&quot;, nargs=3D&quot;?&quot;, type=3Dargparse.FileType(&quot;w&quot;),<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 default=3Dsys.stdout)<br>
&gt; +=C2=A0 =C2=A0 parser.add_argument(&quot;--only-target-packages&quot;,=
 default=3DFalse, action=3D&#39;store_true&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 help=3D&quot;This option includes only packages installed on=
 the target (components and dependencies)&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&quot;--project-name&quot;, ty=
pe=3Dstr, default=3D&quot;buildroot&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 help=3D&quot;Specify the project name to use in the SB=
OM metadata (default:&#39;buildroot&#39;)&quot;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 parser.add_argument(&quot;--project-version&quot;,=
 type=3Dstr, default=3Df&quot;{BR2_VERSION_FULL}&quot;,<br>
&gt; @@ -427,7 +429,8 @@ def main():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Keep only packages with at least one download so=
urce defined<br>
&gt;=C2=A0 =C2=A0 =C2=A0 # (packages with _SITE variable in Buildroot makef=
ile).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 filtered_show_info_dict =3D {k: v for k, v in show=
_info_dict.items()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len(v.get(&#39;downloads&#39=
;, [])) &gt; 0)}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (len(v.get(&#39;downloads&#39=
;, [])) &gt; 0 and<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (not args.only_tar=
get_packages or v.get(&#39;install_target&#39;) is True))}<br>
<br>
Maybe I did something wrong but here the issue is the same as the similar p=
atch<br>
that was sent for this feature. I still see references to &#39;host-&#39; p=
ackages in<br>
the dependencies even though they don&#39;t exist in the components.<br>
<br></blockquote><div><br></div><div>Hi Thomas,=C2=A0</div><div><br></div><=
div>You=E2=80=99re right, there is an issue that I had missed.</div><div><b=
r></div><div>The problem is in my first patch when updating the filter, I f=
orgot to check if the dependency is defined as a package in the dictionary<=
/div><div><br></div><div>Correction :</div><div><br></div><div>@@ -337,12 +=
337,10 @@ def cyclonedx_vulnerabilities(show_info_dict):<br>=C2=A0 =C2=A0 =
=C2=A0} for cve, components in cves.items()]<br>=C2=A0<br>=C2=A0<br>-def br=
2_parse_deps_recursively(ref, show_info_dict, virtual=3DFalse, deps=3D[]):<=
br>+def br2_parse_deps_recursively(ref, show_info_dict, deps=3D[]):<br>=C2=
=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse dependencies from the show-info ou=
tput. This function will<br>=C2=A0 =C2=A0 =C2=A0recursively collect all dep=
endencies, and return a list where each dependency<br>=C2=A0 =C2=A0 =C2=A0i=
s stated at most once.<br>- =C2=A0 =C2=A0The dependency on virtual package =
will collect the final dependency without<br>- =C2=A0 =C2=A0including the v=
irtual one.<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0Args:<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0ref (str): The identifier of the package for which the depende=
ncies have<br>@@ -358,10 +356,13 @@ def br2_parse_deps_recursively(ref, sho=
w_info_dict, virtual=3DFalse, deps=3D[]):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0list: A list of dependencies of the &#39;ref&#39; package.<br>=C2=A0 =
=C2=A0 =C2=A0&quot;&quot;&quot;<br>=C2=A0 =C2=A0 =C2=A0for dep in show_info=
_dict.get(ref, {}).get(&quot;dependencies&quot;, []):<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0# Ignore dependencies that are not exist as a package in the d=
ictionary<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if dep not in show_info_dict:<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>+<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0if dep not in deps:<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0if virtual or show_info_dict.get(dep, {}).get(&quot;virtual&qu=
ot;) is False:<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
deps.append(dep)<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0br2_parse_de=
ps_recursively(dep, show_info_dict, virtual, deps)<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0deps.append(dep)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0br2_parse_deps_recursively(dep, show_info_dict, deps)<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0return deps</div><div><br></div><div>I will send=
 a new patch.</div><div><br></div><div>Fabien</div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Example for minidlna<br>
<br>
```<br>
=C2=A0 =C2=A0 {<br>
=C2=A0 =C2=A0 =C2=A0 &quot;ref&quot;: &quot;minidlna&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 &quot;dependsOn&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;ffmpeg&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;flac&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;host-pkgconf&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;host-skeleton&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;host-xutil_makedepend&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;jpeg&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;libexif&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;libid3tag&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;libogg&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;libvorbis&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;skeleton&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;sqlite&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;toolchain&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;zlib&quot;<br>
=C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 =C2=A0 },<br>
```<br>
<br>
All the &#39;host-&#39; packages are not present in the components.<br>
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 # Show differences between original and filtered d=
ictionary<br>
&gt;=C2=A0 =C2=A0 =C2=A0 print_dict_diff(show_info_dict, filtered_show_info=
_dict, verbose=3Dargs.print_info)<br>
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

--000000000000bb88240647a183ed--

--===============7938647251471050955==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7938647251471050955==--
