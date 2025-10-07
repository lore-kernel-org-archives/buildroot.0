Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E925CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 19:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44F2840865;
	Tue,  7 Oct 2025 19:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHdTNnMCD4nq; Tue,  7 Oct 2025 19:32:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4439740869
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4439740869;
	Tue,  7 Oct 2025 19:32:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4608B9DA
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2FF4D400A2
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvre1eF5ELbq for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 19:32:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=nhed@starry.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6EFBC40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EFBC40018
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6EFBC40018
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 19:32:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-46f53f88e0bso20880635e9.1
 for <buildroot@buildroot.org>; Tue, 07 Oct 2025 12:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759865522; x=1760470322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SnrCCPEnDrOmgOAUYgXlJVd9g0Sn/+C9u2injPcmwyo=;
 b=TMQxVj2rU67mqbbLh8w4sIu4XlOPkS6A9vm9d6yaw+yUp7CoCcAD3nXCHLePdgS8CS
 ojAYxjVZEDHjpxF23GujuVoEnzSObjCCAVFEgkNk8VB+VmNuDhGbeJcpV8AJW5FCQmTI
 Gr3laFvHzonOSNn8wtmRES40IuM+OJUbtORb6cwqFoULutTSII37zbAQFkb/pSspkArk
 OAyHzOMjaTV6Ufn4nStvGNTM8q+78p5ajZNS5N1WAupvfo2vBTQEjmaYdBviKfJmmaQD
 U/MmPIr8JUr2UC4JnDQqtf9WkyX3veD3er95EcQhxm+c5xca/vMW9VulGgQiChQtLFaO
 vzZQ==
X-Gm-Message-State: AOJu0YwE5nH8Y3mWjO+CH/Z+9IPdSXsC6U+xfIIARWZ500pSAJVi15Ey
 FkS6XraAcEGIUmjjYlQiVFlS24+SadXqUZFjnvvGh3g1JEZn6C9evPzlN5RJjsJlcYJA3M/1C4l
 V3gMIMwiJAw6rp9PpZdQ1vnU+oy/kx4FezIYDQaUHmMj1QtIpNXyj6VzdYQ==
X-Gm-Gg: ASbGncsehHmSwgvlnVus6ByffoAQESQWHUiJalO80FE1MNx7gS6whXslcrKVP2cXygH
 bCdYS3RVW62ilInSUBHFWfIp3JK+rN9mDDCMOUFlZBSJSewJh0UncB1pVjdsf+H0H3QR8PeSuW1
 B0XgBXlTRKH2nJEUHDLJdhXOtih9w58Zy/er2kOVuo5oRL5VcNzZQdpqHu69BDL5Dtm3W/WEMbh
 UcUfw3fU+cvzirNKXiu5R6ZD0nbKoY=
X-Google-Smtp-Source: AGHT+IHLMNQ59jnjLwDO2YMjj9YsaQ0NxOoS+TNQDTp6Qj6iBUEPVogsWOY0IRih+sqYguZMu1OS9WdnOnmS/u8/tCU=
X-Received: by 2002:a5d:5d85:0:b0:425:7e45:a4df with SMTP id
 ffacd0b85a97d-42666ac60c3mr339782f8f.11.1759865521611; Tue, 07 Oct 2025
 12:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <20251007174036.1178955-1-nhed+buildroot@starry.com>
In-Reply-To: <20251007174036.1178955-1-nhed+buildroot@starry.com>
Date: Tue, 7 Oct 2025 15:31:49 -0400
X-Gm-Features: AS18NWCcqTn9aRoXZihdPPnegtZfRCa1jEBUZzV4-htgUlFfxOVypFiTCgCgG3I
Message-ID: <CABGDZCk0d6-FpiNYbyGhay+t6ARO8NGveakFugWDYtExn2eqbQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Content-Type: multipart/mixed; boundary="00000000000044cf290640969fea"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google; t=1759865522; x=1760470322; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SnrCCPEnDrOmgOAUYgXlJVd9g0Sn/+C9u2injPcmwyo=;
 b=kNFT6yWCNcNzpl3oxD5YyoN4hLln8KYi/ECkT23EeamujfH1On94Mfjm0Jvj4h/gh3
 PlqQH/TADpErXTFvyQUyTWeYVg0bKqq3rmywtTeWVPS8txfIZ2UoW4uJsvNwdB5wkXph
 a5+EZkvC/yktiqL8ov3tGxZCxmO18qrbpXbbE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=starry.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=starry.com header.i=@starry.com header.a=rsa-sha256
 header.s=google header.b=kNFT6yWC
Subject: Re: [Buildroot] [PATCH] utils/generate-cyclonedx: fix monotonically
 increasing dependency list
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
From: Nevo Hed via buildroot <buildroot@buildroot.org>
Reply-To: Nevo Hed <nhed+buildroot@starry.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--00000000000044cf290640969fea
Content-Type: multipart/alternative; boundary="00000000000044cf270640969fe8"

--00000000000044cf270640969fe8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Forgot to mention my reproduction details

$ python3 --version
Python 3.13.7

With attached `show-info` json

Before change:
$ utils/generate-cyclonedx <     /tmp/test-show-info.json |     jq -c
'.dependencies[] | [.ref, (.dependsOn|length) ]'
["buildroot",28]
["bzip2",0]
["c-ares",0]
["elfutils",2]
["expat",2]
["kmod",2]
["libarchive",4]
["libcap",4]
["libcurl",5]
["libgcrypt",6]
["libgpg-error",6]
["libopenssl",6]
["libxcrypt",6]
["libzlib",6]
["lzo",6]
["ncurses",6]
["pcre2",6]
["readline",7]
["skeleton-init-common",7]
["skeleton-init-systemd",8]
["socat",8]
["systemd",17]
["toolchain-external-custom",17]
["util-linux",19]
["util-linux-libs",19]
["vim",19]
["wget",20]
["which",20]
["xz",20]


After change:
$ utils/generate-cyclonedx < \
    /tmp/test-show-info.json | \
    jq -c '.dependencies[] | [.ref, (.dependsOn|length) ]'
["buildroot",28]
["bzip2",0]
["c-ares",0]
["elfutils",2]
["expat",0]
["kmod",1]
["libarchive",4]
["libcap",0]
["libcurl",1]
["libgcrypt",1]
["libgpg-error",0]
["libopenssl",0]
["libxcrypt",0]
["libzlib",0]
["lzo",0]
["ncurses",0]
["pcre2",0]
["readline",1]
["skeleton-init-common",0]
["skeleton-init-systemd",1]
["socat",0]
["systemd",15]
["toolchain-external-custom",0]
["util-linux",18]
["util-linux-libs",1]
["vim",1]
["wget",19]
["which",0]
["xz",0]

On Tue, Oct 7, 2025 at 1:40=E2=80=AFPM Nevo Hed <nhed+buildroot@starry.com>=
 wrote:

> From: Nevo Hed <nhed+github@starry.com>
>
> Having mutables as default args has unexpected behaviors.
> br2_parse_deps_recursively had a default arg `deps` initialized to the
> empty list (`[]`) except that on subsequent calls from `main` deps would
> already be populated from prior components.
> ---
>  utils/generate-cyclonedx | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 60983ac1ea..7d3ef57ab3 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -238,7 +238,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
>      } for cve, components in cves.items()]
>
>
> -def br2_parse_deps_recursively(ref, show_info_dict, virtual=3DFalse,
> deps=3D[]):
> +def br2_parse_deps_recursively(ref, show_info_dict, virtual=3DFalse,
> deps=3DNone):
>      """Parse dependencies from the show-info output. This function will
>      recursively collect all dependencies, and return a list where each
> dependency
>      is stated at most once.
> @@ -258,6 +258,8 @@ def br2_parse_deps_recursively(ref, show_info_dict,
> virtual=3DFalse, deps=3D[]):
>      Returns:
>          list: A list of dependencies of the 'ref' package.
>      """
> +    if deps is None:
> +        deps =3D []
>      for dep in show_info_dict.get(ref, {}).get("dependencies", []):
>          if dep not in deps:
>              if virtual or show_info_dict.get(dep, {}).get("virtual") is
> False:
> --
> 2.51.0
>
>

--00000000000044cf270640969fe8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Forgot to mention my reproduction details<div><br></div><d=
iv>$ python3 --version<br>Python 3.13.7<br><br>With attached `show-info` js=
on<br><br>Before change:<br>$ utils/generate-cyclonedx &lt; =C2=A0 =C2=A0 /=
tmp/test-show-info.json | =C2=A0 =C2=A0 jq -c &#39;.dependencies[] | [.ref,=
 (.dependsOn|length) ]&#39;<br>[&quot;buildroot&quot;,28]<br>[&quot;bzip2&q=
uot;,0]<br>[&quot;c-ares&quot;,0]<br>[&quot;elfutils&quot;,2]<br>[&quot;exp=
at&quot;,2]<br>[&quot;kmod&quot;,2]<br>[&quot;libarchive&quot;,4]<br>[&quot=
;libcap&quot;,4]<br>[&quot;libcurl&quot;,5]<br>[&quot;libgcrypt&quot;,6]<br=
>[&quot;libgpg-error&quot;,6]<br>[&quot;libopenssl&quot;,6]<br>[&quot;libxc=
rypt&quot;,6]<br>[&quot;libzlib&quot;,6]<br>[&quot;lzo&quot;,6]<br>[&quot;n=
curses&quot;,6]<br>[&quot;pcre2&quot;,6]<br>[&quot;readline&quot;,7]<br>[&q=
uot;skeleton-init-common&quot;,7]<br>[&quot;skeleton-init-systemd&quot;,8]<=
br>[&quot;socat&quot;,8]<br>[&quot;systemd&quot;,17]<br>[&quot;toolchain-ex=
ternal-custom&quot;,17]<br>[&quot;util-linux&quot;,19]<br>[&quot;util-linux=
-libs&quot;,19]<br>[&quot;vim&quot;,19]<br>[&quot;wget&quot;,20]<br>[&quot;=
which&quot;,20]<br>[&quot;xz&quot;,20]<br><br><br>After change:<br>$ utils/=
generate-cyclonedx &lt; \<br>=C2=A0 =C2=A0 /tmp/test-show-info.json | \<br>=
=C2=A0 =C2=A0 jq -c &#39;.dependencies[] | [.ref, (.dependsOn|length) ]&#39=
;<br>[&quot;buildroot&quot;,28]<br>[&quot;bzip2&quot;,0]<br>[&quot;c-ares&q=
uot;,0]<br>[&quot;elfutils&quot;,2]<br>[&quot;expat&quot;,0]<br>[&quot;kmod=
&quot;,1]<br>[&quot;libarchive&quot;,4]<br>[&quot;libcap&quot;,0]<br>[&quot=
;libcurl&quot;,1]<br>[&quot;libgcrypt&quot;,1]<br>[&quot;libgpg-error&quot;=
,0]<br>[&quot;libopenssl&quot;,0]<br>[&quot;libxcrypt&quot;,0]<br>[&quot;li=
bzlib&quot;,0]<br>[&quot;lzo&quot;,0]<br>[&quot;ncurses&quot;,0]<br>[&quot;=
pcre2&quot;,0]<br>[&quot;readline&quot;,1]<br>[&quot;skeleton-init-common&q=
uot;,0]<br>[&quot;skeleton-init-systemd&quot;,1]<br>[&quot;socat&quot;,0]<b=
r>[&quot;systemd&quot;,15]<br>[&quot;toolchain-external-custom&quot;,0]<br>=
[&quot;util-linux&quot;,18]<br>[&quot;util-linux-libs&quot;,1]<br>[&quot;vi=
m&quot;,1]<br>[&quot;wget&quot;,19]<br>[&quot;which&quot;,0]<br>[&quot;xz&q=
uot;,0]</div></div><br><div class=3D"gmail_quote gmail_quote_container"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 7, 2025 at 1:40=E2=80=AFPM N=
evo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.com">nhed+buildroot@s=
tarry.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">From: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bgithub@starry.com" t=
arget=3D"_blank">nhed+github@starry.com</a>&gt;<br>
<br>
Having mutables as default args has unexpected behaviors.<br>
br2_parse_deps_recursively had a default arg `deps` initialized to the<br>
empty list (`[]`) except that on subsequent calls from `main` deps would<br=
>
already be populated from prior components.<br>
---<br>
=C2=A0utils/generate-cyclonedx | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx<br>
index 60983ac1ea..7d3ef57ab3 100755<br>
--- a/utils/generate-cyclonedx<br>
+++ b/utils/generate-cyclonedx<br>
@@ -238,7 +238,7 @@ def cyclonedx_vulnerabilities(show_info_dict):<br>
=C2=A0 =C2=A0 =C2=A0} for cve, components in cves.items()]<br>
<br>
<br>
-def br2_parse_deps_recursively(ref, show_info_dict, virtual=3DFalse, deps=
=3D[]):<br>
+def br2_parse_deps_recursively(ref, show_info_dict, virtual=3DFalse, deps=
=3DNone):<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Parse dependencies from the show-info=
 output. This function will<br>
=C2=A0 =C2=A0 =C2=A0recursively collect all dependencies, and return a list=
 where each dependency<br>
=C2=A0 =C2=A0 =C2=A0is stated at most once.<br>
@@ -258,6 +258,8 @@ def br2_parse_deps_recursively(ref, show_info_dict, vir=
tual=3DFalse, deps=3D[]):<br>
=C2=A0 =C2=A0 =C2=A0Returns:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0list: A list of dependencies of the &#39;=
ref&#39; package.<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 if deps is None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 deps =3D []<br>
=C2=A0 =C2=A0 =C2=A0for dep in show_info_dict.get(ref, {}).get(&quot;depend=
encies&quot;, []):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if dep not in deps:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if virtual or show_info_dic=
t.get(dep, {}).get(&quot;virtual&quot;) is False:<br>
-- <br>
2.51.0<br>
<br>
</blockquote></div>

--00000000000044cf270640969fe8--

--00000000000044cf290640969fea
Content-Type: application/json; name="test-show-info.json"
Content-Disposition: attachment; filename="test-show-info.json"
Content-Transfer-Encoding: base64
Content-ID: <f_mggyheq20>
X-Attachment-Id: f_mggyheq20

ewogICJiemlwMiI6IHsKICAgICJ0eXBlIjogInRhcmdldCIsCiAgICAibmFtZSI6ICJiemlwMiIs
CiAgICAidmlydHVhbCI6IGZhbHNlLAogICAgInZlcnNpb24iOiAiMS4wLjgiLAogICAgImxpY2Vu
c2VzIjogImJ6aXAyIGxpY2Vuc2UiLAogICAgImxpY2Vuc2VfZmlsZXMiOiBbCiAgICAgICJMSUNF
TlNFIgogICAgXSwKICAgICJyZWRpc3RyaWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJi
emlwMiIsCiAgICAiZG93bmxvYWRzIjogWwogICAgICB7CiAgICAgICAgInNvdXJjZSI6ICJiemlw
Mi0xLjAuOC50YXIuZ3oiLAogICAgICAgICJ1cmlzIjogWwogICAgICAgICAgInMzfHVybGVuY29k
ZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlL2J6aXAyIiwKICAgICAgICAgICJzM3x1cmxl
bmNvZGUrczM6Ly9jcm93bi1yb290L3NvdXJjZS1jYWNoZSIsCiAgICAgICAgICAiaHR0cHMraHR0
cHM6Ly9zb3VyY2V3YXJlLm9yZy9wdWIvYnppcDIiLAogICAgICAgICAgImh0dHBzfHVybGVuY29k
ZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9iemlwMiIsCiAgICAgICAgICAiaHR0cHN8
dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0IgogICAgICAgIF0KICAgICAg
fQogICAgXSwKICAgICJwYXRjaGVzIjogWwogICAgICAicGFja2FnZS9iemlwMi8wMDAxLWJ1aWxk
LW9iamVjdHMtdHdpY2UucGF0Y2giLAogICAgICAicGFja2FnZS9iemlwMi8wMDAyLWltcHJvdmUt
YnVpbGQtc3lzdGVtLnBhdGNoIgogICAgXSwKICAgICJzdGFtcF9kaXIiOiAiYnVpbGQvYnppcDIt
MS4wLjgiLAogICAgInNvdXJjZV9kaXIiOiAiYnVpbGQvYnppcDItMS4wLjgiLAogICAgImJ1aWxk
X2RpciI6ICJidWlsZC9iemlwMi0xLjAuOC8iLAogICAgImluc3RhbGxfdGFyZ2V0IjogdHJ1ZSwK
ICAgICJpbnN0YWxsX3N0YWdpbmciOiB0cnVlLAogICAgImluc3RhbGxfaW1hZ2VzIjogZmFsc2Us
CiAgICAiZGVwZW5kZW5jaWVzIjogWwogICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1z
a2VsZXRvbiIsCiAgICAgICJza2VsZXRvbiIsCiAgICAgICJ0b29sY2hhaW4iCiAgICBdLAogICAg
InJldmVyc2VfZGVwZW5kZW5jaWVzIjogWwogICAgICAiZWxmdXRpbHMiLAogICAgICAiZ251cGci
LAogICAgICAibGliYXJjaGl2ZSIsCiAgICAgICJtYWtlZHVtcGZpbGUiLAogICAgICAib3BrZyIs
CiAgICAgICJzeXN0ZW1kIgogICAgXSwKICAgICJjcGUtaWQiOiAiY3BlOjIuMzphOmJ6aXA6Ynpp
cDI6MS4wLjg6KjoqOio6KjoqOio6KiIKICB9LAogICJjLWFyZXMiOiB7CiAgICAidHlwZSI6ICJ0
YXJnZXQiLAogICAgIm5hbWUiOiAiYy1hcmVzIiwKICAgICJ2aXJ0dWFsIjogZmFsc2UsCiAgICAi
dmVyc2lvbiI6ICIxLjM0LjUiLAogICAgImxpY2Vuc2VzIjogIk1JVCIsCiAgICAibGljZW5zZV9m
aWxlcyI6IFsKICAgICAgIkxJQ0VOU0UubWQiCiAgICBdLAogICAgInJlZGlzdHJpYnV0YWJsZSI6
IHRydWUsCiAgICAiZGxfZGlyIjogImMtYXJlcyIsCiAgICAiZG93bmxvYWRzIjogWwogICAgICB7
CiAgICAgICAgInNvdXJjZSI6ICJjLWFyZXMtMS4zNC41LnRhci5neiIsCiAgICAgICAgInVyaXMi
OiBbCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUv
Yy1hcmVzIiwKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290L3NvdXJjZS1j
YWNoZSIsCiAgICAgICAgICAiaHR0cHMraHR0cHM6Ly9naXRodWIuY29tL2MtYXJlcy9jLWFyZXMv
cmVsZWFzZXMvZG93bmxvYWQvdjEuMzQuNSIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0
dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L2MtYXJlcyIsCiAgICAgICAgICAiaHR0cHN8dXJs
ZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0IgogICAgICAgIF0KICAgICAgfQog
ICAgXSwKICAgICJwYXRjaGVzIjogW10sCiAgICAic3RhbXBfZGlyIjogImJ1aWxkL2MtYXJlcy0x
LjM0LjUiLAogICAgInNvdXJjZV9kaXIiOiAiYnVpbGQvYy1hcmVzLTEuMzQuNSIsCiAgICAiYnVp
bGRfZGlyIjogImJ1aWxkL2MtYXJlcy0xLjM0LjUvIiwKICAgICJpbnN0YWxsX3RhcmdldCI6IHRy
dWUsCiAgICAiaW5zdGFsbF9zdGFnaW5nIjogdHJ1ZSwKICAgICJpbnN0YWxsX2ltYWdlcyI6IGZh
bHNlLAogICAgImRlcGVuZGVuY2llcyI6IFsKICAgICAgImhvc3QtY2NhY2hlIiwKICAgICAgImhv
c3Qtc2tlbGV0b24iLAogICAgICAic2tlbGV0b24iLAogICAgICAidG9vbGNoYWluIgogICAgXSwK
ICAgICJyZXZlcnNlX2RlcGVuZGVuY2llcyI6IFsKICAgICAgImdycGMiLAogICAgICAibGliY3Vy
bCIsCiAgICAgICJ3Z2V0IgogICAgXSwKICAgICJjcGUtaWQiOiAiY3BlOjIuMzphOmMtYXJlczpj
LWFyZXM6MS4zNC41Oio6KjoqOio6KjoqOioiCiAgfSwKICAiZWxmdXRpbHMiOiB7CiAgICAidHlw
ZSI6ICJ0YXJnZXQiLAogICAgIm5hbWUiOiAiZWxmdXRpbHMiLAogICAgInZpcnR1YWwiOiBmYWxz
ZSwKICAgICJ2ZXJzaW9uIjogIjAuMTkyIiwKICAgICJsaWNlbnNlcyI6ICJHUEwtMi4wKyBvciBM
R1BMLTMuMCsgKGxpYnJhcnkpIiwKICAgICJsaWNlbnNlX2ZpbGVzIjogWwogICAgICAiQ09QWUlO
RyIsCiAgICAgICJDT1BZSU5HLUdQTFYyIiwKICAgICAgIkNPUFlJTkctTEdQTFYzIgogICAgXSwK
ICAgICJyZWRpc3RyaWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJlbGZ1dGlscyIsCiAg
ICAiZG93bmxvYWRzIjogWwogICAgICB7CiAgICAgICAgInNvdXJjZSI6ICJlbGZ1dGlscy0wLjE5
Mi50YXIuYnoyIiwKICAgICAgICAidXJpcyI6IFsKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6
Ly9jcm93bi1yb290L3NvdXJjZS1jYWNoZS9lbGZ1dGlscyIsCiAgICAgICAgICAiczN8dXJsZW5j
b2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUiLAogICAgICAgICAgImh0dHBzK2h0dHBz
Oi8vc291cmNld2FyZS5vcmcvZWxmdXRpbHMvZnRwLzAuMTkyIiwKICAgICAgICAgICJodHRwc3x1
cmxlbmNvZGUraHR0cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQvZWxmdXRpbHMiLAogICAgICAg
ICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAg
ICBdCiAgICAgIH0KICAgIF0sCiAgICAicGF0Y2hlcyI6IFsKICAgICAgInBhY2thZ2UvZWxmdXRp
bHMvMDAwMS1BZGQtYS1lbmFibGUtZGlzYWJsZS1wcm9ncy1jb25maWd1cmUtb3B0aW9uLnBhdGNo
IiwKICAgICAgInBhY2thZ2UvZWxmdXRpbHMvMDAwMi1SZWFsbHktbWFrZS1XZXJyb3ItY29uZGl0
aW9uYWwtdG8tQlVJTERfV0VSUk9SLnBhdGNoIiwKICAgICAgInBhY2thZ2UvZWxmdXRpbHMvMDAw
My1kZWZpbmUtdXNlcl9wYWNfbWFzay1pZi1uZWVkZWQucGF0Y2giCiAgICBdLAogICAgInN0YW1w
X2RpciI6ICJidWlsZC9lbGZ1dGlscy0wLjE5MiIsCiAgICAic291cmNlX2RpciI6ICJidWlsZC9l
bGZ1dGlscy0wLjE5MiIsCiAgICAiYnVpbGRfZGlyIjogImJ1aWxkL2VsZnV0aWxzLTAuMTkyLyIs
CiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxfc3RhZ2luZyI6IHRydWUs
CiAgICAiaW5zdGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBlbmRlbmNpZXMiOiBbCiAgICAg
ICJiemlwMiIsCiAgICAgICJob3N0LWF1dG9jb25mIiwKICAgICAgImhvc3QtYXV0b21ha2UiLAog
ICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1saWJ0b29sIiwKICAgICAgImhvc3QtcGtn
Y29uZiIsCiAgICAgICJob3N0LXNrZWxldG9uIiwKICAgICAgInNrZWxldG9uIiwKICAgICAgInRv
b2xjaGFpbiIsCiAgICAgICJ4eiIsCiAgICAgICJ6bGliIgogICAgXSwKICAgICJyZXZlcnNlX2Rl
cGVuZGVuY2llcyI6IFsKICAgICAgImlwcm91dGUyIiwKICAgICAgIm1ha2VkdW1wZmlsZSIsCiAg
ICAgICJzeXN0ZW1kIgogICAgXSwKICAgICJjcGUtaWQiOiAiY3BlOjIuMzphOmVsZnV0aWxzX3By
b2plY3Q6ZWxmdXRpbHM6MC4xOTI6KjoqOio6KjoqOio6KiIKICB9LAogICJleHBhdCI6IHsKICAg
ICJ0eXBlIjogInRhcmdldCIsCiAgICAibmFtZSI6ICJleHBhdCIsCiAgICAidmlydHVhbCI6IGZh
bHNlLAogICAgInZlcnNpb24iOiAiMi43LjEiLAogICAgImxpY2Vuc2VzIjogIk1JVCIsCiAgICAi
bGljZW5zZV9maWxlcyI6IFsKICAgICAgIkNPUFlJTkciCiAgICBdLAogICAgInJlZGlzdHJpYnV0
YWJsZSI6IHRydWUsCiAgICAiZGxfZGlyIjogImV4cGF0IiwKICAgICJkb3dubG9hZHMiOiBbCiAg
ICAgIHsKICAgICAgICAic291cmNlIjogImV4cGF0LTIuNy4xLnRhci54eiIsCiAgICAgICAgInVy
aXMiOiBbCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2Fj
aGUvZXhwYXQiLAogICAgICAgICAgInMzfHVybGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNl
LWNhY2hlIiwKICAgICAgICAgICJodHRwcytodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGli
ZXhwYXQvcmVsZWFzZXMvZG93bmxvYWQvUl8yXzdfMSIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5j
b2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L2V4cGF0IiwKICAgICAgICAgICJodHRw
c3x1cmxlbmNvZGUraHR0cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQiCiAgICAgICAgXQogICAg
ICB9CiAgICBdLAogICAgInBhdGNoZXMiOiBbXSwKICAgICJzdGFtcF9kaXIiOiAiYnVpbGQvZXhw
YXQtMi43LjEiLAogICAgInNvdXJjZV9kaXIiOiAiYnVpbGQvZXhwYXQtMi43LjEiLAogICAgImJ1
aWxkX2RpciI6ICJidWlsZC9leHBhdC0yLjcuMS8iLAogICAgImluc3RhbGxfdGFyZ2V0IjogdHJ1
ZSwKICAgICJpbnN0YWxsX3N0YWdpbmciOiB0cnVlLAogICAgImluc3RhbGxfaW1hZ2VzIjogZmFs
c2UsCiAgICAiZGVwZW5kZW5jaWVzIjogWwogICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9z
dC1za2VsZXRvbiIsCiAgICAgICJza2VsZXRvbiIsCiAgICAgICJ0b29sY2hhaW4iCiAgICBdLAog
ICAgInJldmVyc2VfZGVwZW5kZW5jaWVzIjogWwogICAgICAiYXByLXV0aWwiLAogICAgICAiZGJ1
cyIsCiAgICAgICJsaWJhcmNoaXZlIgogICAgXSwKICAgICJjcGUtaWQiOiAiY3BlOjIuMzphOmxp
YmV4cGF0X3Byb2plY3Q6bGliZXhwYXQ6Mi43LjE6KjoqOio6KjoqOio6KiIKICB9LAogICJrbW9k
IjogewogICAgInR5cGUiOiAidGFyZ2V0IiwKICAgICJuYW1lIjogImttb2QiLAogICAgInZpcnR1
YWwiOiBmYWxzZSwKICAgICJ2ZXJzaW9uIjogIjMzIiwKICAgICJsaWNlbnNlcyI6ICJMR1BMLTIu
MSsgKGxpYnJhcnkpICwgR1BMLTIuMCsgKHRvb2xzKSIsCiAgICAibGljZW5zZV9maWxlcyI6IFsK
ICAgICAgImxpYmttb2QvQ09QWUlORyIsCiAgICAgICJDT1BZSU5HIgogICAgXSwKICAgICJyZWRp
c3RyaWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJrbW9kIiwKICAgICJkb3dubG9hZHMi
OiBbCiAgICAgIHsKICAgICAgICAic291cmNlIjogImttb2QtMzMudGFyLnh6IiwKICAgICAgICAi
dXJpcyI6IFsKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290L3NvdXJjZS1j
YWNoZS9rbW9kIiwKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290L3NvdXJj
ZS1jYWNoZSIsCiAgICAgICAgICAiaHR0cHMraHR0cHM6Ly9jZG4ua2VybmVsLm9yZy9wdWIvbGlu
dXgvdXRpbHMva2VybmVsL2ttb2QiLAogICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczov
L3NvdXJjZXMuYnVpbGRyb290Lm5ldC9rbW9kIiwKICAgICAgICAgICJodHRwc3x1cmxlbmNvZGUr
aHR0cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQiCiAgICAgICAgXQogICAgICB9CiAgICBdLAog
ICAgInBhdGNoZXMiOiBbCiAgICAgICJwYWNrYWdlL2ttb2QvMDAwMS1maXgtT19DTE9FWEVDLnBh
dGNoIgogICAgXSwKICAgICJzdGFtcF9kaXIiOiAiYnVpbGQva21vZC0zMyIsCiAgICAic291cmNl
X2RpciI6ICJidWlsZC9rbW9kLTMzIiwKICAgICJidWlsZF9kaXIiOiAiYnVpbGQva21vZC0zMy8i
LAogICAgImluc3RhbGxfdGFyZ2V0IjogdHJ1ZSwKICAgICJpbnN0YWxsX3N0YWdpbmciOiB0cnVl
LAogICAgImluc3RhbGxfaW1hZ2VzIjogZmFsc2UsCiAgICAiZGVwZW5kZW5jaWVzIjogWwogICAg
ICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1wa2djb25mIiwKICAgICAgImhvc3Qtc2tlbGV0
b24iLAogICAgICAib3BlbnNzbCIsCiAgICAgICJza2VsZXRvbiIsCiAgICAgICJ0b29sY2hhaW4i
LAogICAgICAieHoiLAogICAgICAiemxpYiIKICAgIF0sCiAgICAicmV2ZXJzZV9kZXBlbmRlbmNp
ZXMiOiBbCiAgICAgICJidXN5Ym94IiwKICAgICAgInN5c3RlbWQiCiAgICBdLAogICAgImNwZS1p
ZCI6ICJjcGU6Mi4zOmE6a2VybmVsOmttb2Q6MzM6KjoqOio6KjoqOio6KiIKICB9LAogICJsaWJh
cmNoaXZlIjogewogICAgInR5cGUiOiAidGFyZ2V0IiwKICAgICJuYW1lIjogImxpYmFyY2hpdmUi
LAogICAgInZpcnR1YWwiOiBmYWxzZSwKICAgICJ2ZXJzaW9uIjogIjMuNy45IiwKICAgICJsaWNl
bnNlcyI6ICJCU0QtMi1DbGF1c2UsIEJTRC0zLUNsYXVzZSwgQ0MwLTEuMCwgT3BlblNTTCwgQXBh
Y2hlLTIuMCIsCiAgICAibGljZW5zZV9maWxlcyI6IFsKICAgICAgIkNPUFlJTkciCiAgICBdLAog
ICAgInJlZGlzdHJpYnV0YWJsZSI6IHRydWUsCiAgICAiZGxfZGlyIjogImxpYmFyY2hpdmUiLAog
ICAgImRvd25sb2FkcyI6IFsKICAgICAgewogICAgICAgICJzb3VyY2UiOiAibGliYXJjaGl2ZS0z
LjcuOS50YXIueHoiLAogICAgICAgICJ1cmlzIjogWwogICAgICAgICAgInMzfHVybGVuY29kZStz
MzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlL2xpYmFyY2hpdmUiLAogICAgICAgICAgInMzfHVy
bGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlIiwKICAgICAgICAgICJodHRwcyto
dHRwczovL3d3dy5saWJhcmNoaXZlLmRlL2Rvd25sb2FkcyIsCiAgICAgICAgICAiaHR0cHN8dXJs
ZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L2xpYmFyY2hpdmUiLAogICAgICAg
ICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAg
ICBdCiAgICAgIH0KICAgIF0sCiAgICAicGF0Y2hlcyI6IFsKICAgICAgInBhY2thZ2UvbGliYXJj
aGl2ZS8wMDAxLVJldmVydC1Pbmx5LWFkZC1pY29udi10by10aGUtLnBjLWZpbGUtaWYtbmVlZGVk
LTE4MjUucGF0Y2giLAogICAgICAicGFja2FnZS9saWJhcmNoaXZlLzAwMDItYXV0b3Rvb2xzLWRv
LW5vdC1hZGQtaWNvbnYtZm9yLVJlcXVpcmVzLnByaXZhdGUucGF0Y2giCiAgICBdLAogICAgInN0
YW1wX2RpciI6ICJidWlsZC9saWJhcmNoaXZlLTMuNy45IiwKICAgICJzb3VyY2VfZGlyIjogImJ1
aWxkL2xpYmFyY2hpdmUtMy43LjkiLAogICAgImJ1aWxkX2RpciI6ICJidWlsZC9saWJhcmNoaXZl
LTMuNy45LyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxfc3RhZ2lu
ZyI6IHRydWUsCiAgICAiaW5zdGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBlbmRlbmNpZXMi
OiBbCiAgICAgICJiemlwMiIsCiAgICAgICJleHBhdCIsCiAgICAgICJob3N0LWF1dG9jb25mIiwK
ICAgICAgImhvc3QtYXV0b21ha2UiLAogICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1s
aWJ0b29sIiwKICAgICAgImhvc3QtcGtnY29uZiIsCiAgICAgICJob3N0LXNrZWxldG9uIiwKICAg
ICAgImx6byIsCiAgICAgICJvcGVuc3NsIiwKICAgICAgInNrZWxldG9uIiwKICAgICAgInRvb2xj
aGFpbiIsCiAgICAgICJ4eiIsCiAgICAgICJ6bGliIgogICAgXSwKICAgICJyZXZlcnNlX2RlcGVu
ZGVuY2llcyI6IFsKICAgICAgIm9wa2ciLAogICAgICAic3lzdGVtZCIKICAgIF0sCiAgICAiY3Bl
LWlkIjogImNwZToyLjM6YTpsaWJhcmNoaXZlOmxpYmFyY2hpdmU6My43Ljk6KjoqOio6KjoqOio6
KiIKICB9LAogICJsaWJjYXAiOiB7CiAgICAidHlwZSI6ICJ0YXJnZXQiLAogICAgIm5hbWUiOiAi
bGliY2FwIiwKICAgICJ2aXJ0dWFsIjogZmFsc2UsCiAgICAidmVyc2lvbiI6ICIyLjczIiwKICAg
ICJsaWNlbnNlcyI6ICJHUEwtMi4wIG9yIEJTRC0zLUNsYXVzZSIsCiAgICAibGljZW5zZV9maWxl
cyI6IFsKICAgICAgIkxpY2Vuc2UiCiAgICBdLAogICAgInJlZGlzdHJpYnV0YWJsZSI6IHRydWUs
CiAgICAiZGxfZGlyIjogImxpYmNhcCIsCiAgICAiZG93bmxvYWRzIjogWwogICAgICB7CiAgICAg
ICAgInNvdXJjZSI6ICJsaWJjYXAtMi43My50YXIueHoiLAogICAgICAgICJ1cmlzIjogWwogICAg
ICAgICAgInMzfHVybGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlL2xpYmNhcCIs
CiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUiLAog
ICAgICAgICAgImh0dHBzK2h0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL2xpbnV4L2xpYnMvc2Vj
dXJpdHkvbGludXgtcHJpdnMvbGliY2FwMiIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0
dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L2xpYmNhcCIsCiAgICAgICAgICAiaHR0cHN8dXJs
ZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0IgogICAgICAgIF0KICAgICAgfQog
ICAgXSwKICAgICJwYXRjaGVzIjogW10sCiAgICAic3RhbXBfZGlyIjogImJ1aWxkL2xpYmNhcC0y
LjczIiwKICAgICJzb3VyY2VfZGlyIjogImJ1aWxkL2xpYmNhcC0yLjczIiwKICAgICJidWlsZF9k
aXIiOiAiYnVpbGQvbGliY2FwLTIuNzMvIiwKICAgICJpbnN0YWxsX3RhcmdldCI6IHRydWUsCiAg
ICAiaW5zdGFsbF9zdGFnaW5nIjogdHJ1ZSwKICAgICJpbnN0YWxsX2ltYWdlcyI6IGZhbHNlLAog
ICAgImRlcGVuZGVuY2llcyI6IFsKICAgICAgImhvc3QtY2NhY2hlIiwKICAgICAgImhvc3QtZ3Bl
cmYiLAogICAgICAiaG9zdC1za2VsZXRvbiIsCiAgICAgICJza2VsZXRvbiIsCiAgICAgICJ0b29s
Y2hhaW4iCiAgICBdLAogICAgInJldmVyc2VfZGVwZW5kZW5jaWVzIjogWwogICAgICAiYmluZCIs
CiAgICAgICJjaHJvbnkiLAogICAgICAiaHRvcCIsCiAgICAgICJpcHJvdXRlMiIsCiAgICAgICJp
cHV0aWxzIiwKICAgICAgImxsZHBkIiwKICAgICAgInJuZy10b29scyIsCiAgICAgICJzeXN0ZW1k
IgogICAgXSwKICAgICJjcGUtaWQiOiAiY3BlOjIuMzphOmxpYmNhcF9wcm9qZWN0OmxpYmNhcDoy
LjczOio6KjoqOio6KjoqOioiCiAgfSwKICAibGliY3VybCI6IHsKICAgICJ0eXBlIjogInRhcmdl
dCIsCiAgICAibmFtZSI6ICJsaWJjdXJsIiwKICAgICJ2aXJ0dWFsIjogZmFsc2UsCiAgICAidmVy
c2lvbiI6ICI4LjEyLjEiLAogICAgImxpY2Vuc2VzIjogImN1cmwiLAogICAgImxpY2Vuc2VfZmls
ZXMiOiBbCiAgICAgICJDT1BZSU5HIgogICAgXSwKICAgICJyZWRpc3RyaWJ1dGFibGUiOiB0cnVl
LAogICAgImRsX2RpciI6ICJsaWJjdXJsIiwKICAgICJkb3dubG9hZHMiOiBbCiAgICAgIHsKICAg
ICAgICAic291cmNlIjogImN1cmwtOC4xMi4xLnRhci54eiIsCiAgICAgICAgInVyaXMiOiBbCiAg
ICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUvbGliY3Vy
bCIsCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUi
LAogICAgICAgICAgImh0dHBzK2h0dHBzOi8vY3VybC5zZS9kb3dubG9hZCIsCiAgICAgICAgICAi
aHR0cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L2xpYmN1cmwiLAog
ICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIK
ICAgICAgICBdCiAgICAgIH0KICAgIF0sCiAgICAicGF0Y2hlcyI6IFtdLAogICAgInN0YW1wX2Rp
ciI6ICJidWlsZC9saWJjdXJsLTguMTIuMSIsCiAgICAic291cmNlX2RpciI6ICJidWlsZC9saWJj
dXJsLTguMTIuMSIsCiAgICAiYnVpbGRfZGlyIjogImJ1aWxkL2xpYmN1cmwtOC4xMi4xLyIsCiAg
ICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxfc3RhZ2luZyI6IHRydWUsCiAg
ICAiaW5zdGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBlbmRlbmNpZXMiOiBbCiAgICAgICJj
LWFyZXMiLAogICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1wa2djb25mIiwKICAgICAg
Imhvc3Qtc2tlbGV0b24iLAogICAgICAib3BlbnNzbCIsCiAgICAgICJza2VsZXRvbiIsCiAgICAg
ICJ0b29sY2hhaW4iLAogICAgICAiemxpYiIKICAgIF0sCiAgICAicmV2ZXJzZV9kZXBlbmRlbmNp
ZXMiOiBbCiAgICAgICJnbnVwZyIsCiAgICAgICJvcGtnIiwKICAgICAgInJzeXNsb2ciLAogICAg
ICAic3lzdGVtZCIKICAgIF0sCiAgICAiY3BlLWlkIjogImNwZToyLjM6YTpoYXh4OmxpYmN1cmw6
OC4xMi4xOio6KjoqOio6KjoqOioiLAogICAgImlnbm9yZV9jdmVzIjogWwogICAgICAiQ1ZFLTIw
MjQtMzI5MjgiCiAgICBdCiAgfSwKICAibGliZ2NyeXB0IjogewogICAgInR5cGUiOiAidGFyZ2V0
IiwKICAgICJuYW1lIjogImxpYmdjcnlwdCIsCiAgICAidmlydHVhbCI6IGZhbHNlLAogICAgInZl
cnNpb24iOiAiMS4xMS4wIiwKICAgICJsaWNlbnNlcyI6ICJMR1BMLTIuMSsiLAogICAgImxpY2Vu
c2VfZmlsZXMiOiBbCiAgICAgICJDT1BZSU5HLkxJQiIKICAgIF0sCiAgICAicmVkaXN0cmlidXRh
YmxlIjogdHJ1ZSwKICAgICJkbF9kaXIiOiAibGliZ2NyeXB0IiwKICAgICJkb3dubG9hZHMiOiBb
CiAgICAgIHsKICAgICAgICAic291cmNlIjogImxpYmdjcnlwdC0xLjExLjAudGFyLmJ6MiIsCiAg
ICAgICAgInVyaXMiOiBbCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9z
b3VyY2UtY2FjaGUvbGliZ2NyeXB0IiwKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93
bi1yb290L3NvdXJjZS1jYWNoZSIsCiAgICAgICAgICAiaHR0cHMraHR0cHM6Ly9nbnVwZy5vcmcv
ZnRwL2djcnlwdC9saWJnY3J5cHQiLAogICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczov
L3NvdXJjZXMuYnVpbGRyb290Lm5ldC9saWJnY3J5cHQiLAogICAgICAgICAgImh0dHBzfHVybGVu
Y29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAgICBdCiAgICAgIH0KICAg
IF0sCiAgICAicGF0Y2hlcyI6IFsKICAgICAgInBhY2thZ2UvbGliZ2NyeXB0LzAwMDEtY29uZmln
dXJlLmFjLWFkZC1hbi1vcHRpb24tdG8tZGlzYWJsZS10ZXN0cy5wYXRjaCIKICAgIF0sCiAgICAi
c3RhbXBfZGlyIjogImJ1aWxkL2xpYmdjcnlwdC0xLjExLjAiLAogICAgInNvdXJjZV9kaXIiOiAi
YnVpbGQvbGliZ2NyeXB0LTEuMTEuMCIsCiAgICAiYnVpbGRfZGlyIjogImJ1aWxkL2xpYmdjcnlw
dC0xLjExLjAvIiwKICAgICJpbnN0YWxsX3RhcmdldCI6IHRydWUsCiAgICAiaW5zdGFsbF9zdGFn
aW5nIjogdHJ1ZSwKICAgICJpbnN0YWxsX2ltYWdlcyI6IGZhbHNlLAogICAgImRlcGVuZGVuY2ll
cyI6IFsKICAgICAgImhvc3QtYXV0b2NvbmYiLAogICAgICAiaG9zdC1hdXRvbWFrZSIsCiAgICAg
ICJob3N0LWNjYWNoZSIsCiAgICAgICJob3N0LWxpYnRvb2wiLAogICAgICAiaG9zdC1za2VsZXRv
biIsCiAgICAgICJsaWJncGctZXJyb3IiLAogICAgICAic2tlbGV0b24iLAogICAgICAidG9vbGNo
YWluIgogICAgXSwKICAgICJyZXZlcnNlX2RlcGVuZGVuY2llcyI6IFsKICAgICAgImNvbGxlY3Rk
IiwKICAgICAgImNyZGEiLAogICAgICAicnN5c2xvZyIsCiAgICAgICJzeXN0ZW1kIgogICAgXSwK
ICAgICJjcGUtaWQiOiAiY3BlOjIuMzphOmdudXBnOmxpYmdjcnlwdDoxLjExLjA6KjoqOio6Kjoq
Oio6KiIKICB9LAogICJsaWJncGctZXJyb3IiOiB7CiAgICAidHlwZSI6ICJ0YXJnZXQiLAogICAg
Im5hbWUiOiAibGliZ3BnLWVycm9yIiwKICAgICJ2aXJ0dWFsIjogZmFsc2UsCiAgICAidmVyc2lv
biI6ICIxLjUxIiwKICAgICJsaWNlbnNlcyI6ICJHUEwtMi4wKywgTEdQTC0yLjErIiwKICAgICJs
aWNlbnNlX2ZpbGVzIjogWwogICAgICAiQ09QWUlORyIsCiAgICAgICJDT1BZSU5HLkxJQiIKICAg
IF0sCiAgICAicmVkaXN0cmlidXRhYmxlIjogdHJ1ZSwKICAgICJkbF9kaXIiOiAibGliZ3BnLWVy
cm9yIiwKICAgICJkb3dubG9hZHMiOiBbCiAgICAgIHsKICAgICAgICAic291cmNlIjogImxpYmdw
Zy1lcnJvci0xLjUxLnRhci5iejIiLAogICAgICAgICJ1cmlzIjogWwogICAgICAgICAgInMzfHVy
bGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlL2xpYmdwZy1lcnJvciIsCiAgICAg
ICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUiLAogICAgICAg
ICAgImh0dHBzK2h0dHBzOi8vd3d3LmdudXBnLm9yZy9mdHAvZ2NyeXB0L2xpYmdwZy1lcnJvciIs
CiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0
L2xpYmdwZy1lcnJvciIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNl
cy5idWlsZHJvb3QubmV0IgogICAgICAgIF0KICAgICAgfQogICAgXSwKICAgICJwYXRjaGVzIjog
W10sCiAgICAic3RhbXBfZGlyIjogImJ1aWxkL2xpYmdwZy1lcnJvci0xLjUxIiwKICAgICJzb3Vy
Y2VfZGlyIjogImJ1aWxkL2xpYmdwZy1lcnJvci0xLjUxIiwKICAgICJidWlsZF9kaXIiOiAiYnVp
bGQvbGliZ3BnLWVycm9yLTEuNTEvIiwKICAgICJpbnN0YWxsX3RhcmdldCI6IHRydWUsCiAgICAi
aW5zdGFsbF9zdGFnaW5nIjogdHJ1ZSwKICAgICJpbnN0YWxsX2ltYWdlcyI6IGZhbHNlLAogICAg
ImRlcGVuZGVuY2llcyI6IFsKICAgICAgImhvc3QtY2NhY2hlIiwKICAgICAgImhvc3Qtc2tlbGV0
b24iLAogICAgICAic2tlbGV0b24iLAogICAgICAidG9vbGNoYWluIgogICAgXSwKICAgICJyZXZl
cnNlX2RlcGVuZGVuY2llcyI6IFsKICAgICAgImxpYmFzc3VhbiIsCiAgICAgICJsaWJnY3J5cHQi
LAogICAgICAibGliZ3BnbWUiLAogICAgICAib3BrZyIKICAgIF0sCiAgICAiY3BlLWlkIjogImNw
ZToyLjM6YTpnbnVwZzpsaWJncGctZXJyb3I6MS41MToqOio6KjoqOio6KjoqIgogIH0sCiAgImxp
Ym9wZW5zc2wiOiB7CiAgICAidHlwZSI6ICJ0YXJnZXQiLAogICAgIm5hbWUiOiAibGlib3BlbnNz
bCIsCiAgICAidmlydHVhbCI6IGZhbHNlLAogICAgInZlcnNpb24iOiAiMy40LjEiLAogICAgImxp
Y2Vuc2VzIjogIkFwYWNoZS0yLjAiLAogICAgImxpY2Vuc2VfZmlsZXMiOiBbCiAgICAgICJMSUNF
TlNFLnR4dCIKICAgIF0sCiAgICAicmVkaXN0cmlidXRhYmxlIjogdHJ1ZSwKICAgICJkbF9kaXIi
OiAibGlib3BlbnNzbCIsCiAgICAiZG93bmxvYWRzIjogWwogICAgICB7CiAgICAgICAgInNvdXJj
ZSI6ICJvcGVuc3NsLTMuNC4xLnRhci5neiIsCiAgICAgICAgInVyaXMiOiBbCiAgICAgICAgICAi
czN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUvbGlib3BlbnNzbCIsCiAg
ICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUiLAogICAg
ICAgICAgImh0dHBzK2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuc3NsL29wZW5zc2wvcmVsZWFzZXMv
ZG93bmxvYWQvb3BlbnNzbC0zLjQuMSIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBz
Oi8vc291cmNlcy5idWlsZHJvb3QubmV0L2xpYm9wZW5zc2wiLAogICAgICAgICAgImh0dHBzfHVy
bGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAgICBdCiAgICAgIH0K
ICAgIF0sCiAgICAicGF0Y2hlcyI6IFsKICAgICAgInBhY2thZ2UvbGlib3BlbnNzbC8wMDAxLVJl
cHJvZHVjaWJsZS1idWlsZC1kby1ub3QtbGVhay1jb21waWxlci1wYXRoLnBhdGNoIiwKICAgICAg
InBhY2thZ2UvbGlib3BlbnNzbC8wMDAyLUNvbmZpZ3VyZS11c2UtRUxGdjItQUJJLW9uLXNvbWUt
cHBjNjQtYmlnLWVuZGlhbi1zeXMucGF0Y2giLAogICAgICAicGFja2FnZS9saWJvcGVuc3NsLzAw
MDMtUmV2ZXJ0LUZpeC1zdGF0aWMtYnVpbGRzLnBhdGNoIiwKICAgICAgInBhY2thZ2UvbGlib3Bl
bnNzbC8wMDA0LVNlcmlhbGl6ZS1pbnN0YWxsLXByb2Nlc3MtdG8tYXZvaWQtbXVsdGlwbGUtbWFr
ZS1kZXAucGF0Y2giCiAgICBdLAogICAgInN0YW1wX2RpciI6ICJidWlsZC9saWJvcGVuc3NsLTMu
NC4xIiwKICAgICJzb3VyY2VfZGlyIjogImJ1aWxkL2xpYm9wZW5zc2wtMy40LjEiLAogICAgImJ1
aWxkX2RpciI6ICJidWlsZC9saWJvcGVuc3NsLTMuNC4xLyIsCiAgICAiaW5zdGFsbF90YXJnZXQi
OiB0cnVlLAogICAgImluc3RhbGxfc3RhZ2luZyI6IHRydWUsCiAgICAiaW5zdGFsbF9pbWFnZXMi
OiBmYWxzZSwKICAgICJkZXBlbmRlbmNpZXMiOiBbCiAgICAgICJob3N0LWNjYWNoZSIsCiAgICAg
ICJob3N0LXNrZWxldG9uIiwKICAgICAgInNrZWxldG9uIiwKICAgICAgInRvb2xjaGFpbiIsCiAg
ICAgICJ6bGliIgogICAgXSwKICAgICJyZXZlcnNlX2RlcGVuZGVuY2llcyI6IFsKICAgICAgImhv
c3RhcGQiLAogICAgICAiaG9zdGFwZC1wcnMiLAogICAgICAib3BlbnNzbCIKICAgIF0sCiAgICAi
Y3BlLWlkIjogImNwZToyLjM6YTpvcGVuc3NsOm9wZW5zc2w6My40LjE6KjoqOio6KjoqOio6KiIK
ICB9LAogICJsaWJ4Y3J5cHQiOiB7CiAgICAidHlwZSI6ICJ0YXJnZXQiLAogICAgIm5hbWUiOiAi
bGlieGNyeXB0IiwKICAgICJ2aXJ0dWFsIjogZmFsc2UsCiAgICAidmVyc2lvbiI6ICI0LjQuMzgi
LAogICAgImxpY2Vuc2VzIjogIkxHUEwtMi4xKyIsCiAgICAibGljZW5zZV9maWxlcyI6IFsKICAg
ICAgIkxJQ0VOU0lORyIsCiAgICAgICJDT1BZSU5HLkxJQiIKICAgIF0sCiAgICAicmVkaXN0cmli
dXRhYmxlIjogdHJ1ZSwKICAgICJkbF9kaXIiOiAibGlieGNyeXB0IiwKICAgICJkb3dubG9hZHMi
OiBbCiAgICAgIHsKICAgICAgICAic291cmNlIjogImxpYnhjcnlwdC00LjQuMzgudGFyLnh6IiwK
ICAgICAgICAidXJpcyI6IFsKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290
L3NvdXJjZS1jYWNoZS9saWJ4Y3J5cHQiLAogICAgICAgICAgInMzfHVybGVuY29kZStzMzovL2Ny
b3duLXJvb3Qvc291cmNlLWNhY2hlIiwKICAgICAgICAgICJodHRwcytodHRwczovL2dpdGh1Yi5j
b20vYmVzc2VyODIvbGlieGNyeXB0L3JlbGVhc2VzL2Rvd25sb2FkL3Y0LjQuMzgiLAogICAgICAg
ICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9saWJ4Y3J5
cHQiLAogICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290
Lm5ldCIKICAgICAgICBdCiAgICAgIH0KICAgIF0sCiAgICAicGF0Y2hlcyI6IFtdLAogICAgInN0
YW1wX2RpciI6ICJidWlsZC9saWJ4Y3J5cHQtNC40LjM4IiwKICAgICJzb3VyY2VfZGlyIjogImJ1
aWxkL2xpYnhjcnlwdC00LjQuMzgiLAogICAgImJ1aWxkX2RpciI6ICJidWlsZC9saWJ4Y3J5cHQt
NC40LjM4LyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxfc3RhZ2lu
ZyI6IHRydWUsCiAgICAiaW5zdGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBlbmRlbmNpZXMi
OiBbCiAgICAgICJob3N0LWNjYWNoZSIsCiAgICAgICJob3N0LXNrZWxldG9uIiwKICAgICAgInNr
ZWxldG9uIiwKICAgICAgInRvb2xjaGFpbiIKICAgIF0sCiAgICAicmV2ZXJzZV9kZXBlbmRlbmNp
ZXMiOiBbCiAgICAgICJhcHIiLAogICAgICAiYnVzeWJveCIsCiAgICAgICJuZ2lueCIsCiAgICAg
ICJvcGVuc3NoIiwKICAgICAgInN5c3RlbWQiLAogICAgICAidXRpbC1saW51eCIsCiAgICAgICJ1
dGlsLWxpbnV4LWxpYnMiCiAgICBdCiAgfSwKICAibGliemxpYiI6IHsKICAgICJ0eXBlIjogInRh
cmdldCIsCiAgICAibmFtZSI6ICJsaWJ6bGliIiwKICAgICJ2aXJ0dWFsIjogZmFsc2UsCiAgICAi
dmVyc2lvbiI6ICIxLjMuMSIsCiAgICAibGljZW5zZXMiOiAiWmxpYiIsCiAgICAibGljZW5zZV9m
aWxlcyI6IFsKICAgICAgIkxJQ0VOU0UiCiAgICBdLAogICAgInJlZGlzdHJpYnV0YWJsZSI6IHRy
dWUsCiAgICAiZGxfZGlyIjogImxpYnpsaWIiLAogICAgImRvd25sb2FkcyI6IFsKICAgICAgewog
ICAgICAgICJzb3VyY2UiOiAiemxpYi0xLjMuMS50YXIueHoiLAogICAgICAgICJ1cmlzIjogWwog
ICAgICAgICAgInMzfHVybGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlL2xpYnps
aWIiLAogICAgICAgICAgInMzfHVybGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hl
IiwKICAgICAgICAgICJodHRwcytodHRwczovL3d3dy56bGliLm5ldCIsCiAgICAgICAgICAiaHR0
cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L2xpYnpsaWIiLAogICAg
ICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAg
ICAgICBdCiAgICAgIH0KICAgIF0sCiAgICAicGF0Y2hlcyI6IFtdLAogICAgInN0YW1wX2RpciI6
ICJidWlsZC9saWJ6bGliLTEuMy4xIiwKICAgICJzb3VyY2VfZGlyIjogImJ1aWxkL2xpYnpsaWIt
MS4zLjEiLAogICAgImJ1aWxkX2RpciI6ICJidWlsZC9saWJ6bGliLTEuMy4xLyIsCiAgICAiaW5z
dGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxfc3RhZ2luZyI6IHRydWUsCiAgICAiaW5z
dGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBlbmRlbmNpZXMiOiBbCiAgICAgICJob3N0LWNj
YWNoZSIsCiAgICAgICJob3N0LXNrZWxldG9uIiwKICAgICAgInNrZWxldG9uIiwKICAgICAgInRv
b2xjaGFpbiIKICAgIF0sCiAgICAicmV2ZXJzZV9kZXBlbmRlbmNpZXMiOiBbCiAgICAgICJ6bGli
IgogICAgXSwKICAgICJjcGUtaWQiOiAiY3BlOjIuMzphOnpsaWI6emxpYjoxLjMuMToqOio6Kjoq
Oio6KjoqIgogIH0sCiAgImx6byI6IHsKICAgICJ0eXBlIjogInRhcmdldCIsCiAgICAibmFtZSI6
ICJsem8iLAogICAgInZpcnR1YWwiOiBmYWxzZSwKICAgICJ2ZXJzaW9uIjogIjIuMTAiLAogICAg
ImxpY2Vuc2VzIjogIkdQTC0yLjArIiwKICAgICJsaWNlbnNlX2ZpbGVzIjogWwogICAgICAiQ09Q
WUlORyIKICAgIF0sCiAgICAicmVkaXN0cmlidXRhYmxlIjogdHJ1ZSwKICAgICJkbF9kaXIiOiAi
bHpvIiwKICAgICJkb3dubG9hZHMiOiBbCiAgICAgIHsKICAgICAgICAic291cmNlIjogImx6by0y
LjEwLnRhci5neiIsCiAgICAgICAgInVyaXMiOiBbCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3Mz
Oi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUvbHpvIiwKICAgICAgICAgICJzM3x1cmxlbmNvZGUr
czM6Ly9jcm93bi1yb290L3NvdXJjZS1jYWNoZSIsCiAgICAgICAgICAiaHR0cCtodHRwOi8vd3d3
Lm9iZXJodW1lci5jb20vb3BlbnNvdXJjZS9sem8vZG93bmxvYWQiLAogICAgICAgICAgImh0dHBz
fHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9sem8iLAogICAgICAgICAg
Imh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAgICBd
CiAgICAgIH0KICAgIF0sCiAgICAicGF0Y2hlcyI6IFtdLAogICAgInN0YW1wX2RpciI6ICJidWls
ZC9sem8tMi4xMCIsCiAgICAic291cmNlX2RpciI6ICJidWlsZC9sem8tMi4xMCIsCiAgICAiYnVp
bGRfZGlyIjogImJ1aWxkL2x6by0yLjEwLy9idWlsZHJvb3QtYnVpbGQiLAogICAgImluc3RhbGxf
dGFyZ2V0IjogdHJ1ZSwKICAgICJpbnN0YWxsX3N0YWdpbmciOiB0cnVlLAogICAgImluc3RhbGxf
aW1hZ2VzIjogZmFsc2UsCiAgICAiZGVwZW5kZW5jaWVzIjogWwogICAgICAiaG9zdC1jY2FjaGUi
LAogICAgICAiaG9zdC1wa2djb25mIiwKICAgICAgImhvc3Qtc2tlbGV0b24iLAogICAgICAic2tl
bGV0b24iLAogICAgICAidG9vbGNoYWluIgogICAgXSwKICAgICJyZXZlcnNlX2RlcGVuZGVuY2ll
cyI6IFsKICAgICAgImJ0cmZzLXByb2dzIiwKICAgICAgImxpYmFyY2hpdmUiLAogICAgICAibWFr
ZWR1bXBmaWxlIiwKICAgICAgIm10ZCIKICAgIF0sCiAgICAiY3BlLWlkIjogImNwZToyLjM6YTps
em9fcHJvamVjdDpsem86Mi4xMDoqOio6KjoqOio6KjoqIgogIH0sCiAgIm5jdXJzZXMiOiB7CiAg
ICAidHlwZSI6ICJ0YXJnZXQiLAogICAgIm5hbWUiOiAibmN1cnNlcyIsCiAgICAidmlydHVhbCI6
IGZhbHNlLAogICAgInZlcnNpb24iOiAiNi40LTIwMjMwNjAzIiwKICAgICJsaWNlbnNlcyI6ICJN
SVQgd2l0aCBhZHZlcnRpc2luZyBjbGF1c2UiLAogICAgImxpY2Vuc2VfZmlsZXMiOiBbCiAgICAg
ICJDT1BZSU5HIgogICAgXSwKICAgICJyZWRpc3RyaWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2Rp
ciI6ICJuY3Vyc2VzIiwKICAgICJkb3dubG9hZHMiOiBbCiAgICAgIHsKICAgICAgICAic291cmNl
IjogIm5jdXJzZXMtNi40LTIwMjMwNjAzLnRhci5neiIsCiAgICAgICAgInVyaXMiOiBbCiAgICAg
ICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUvbmN1cnNlcyIs
CiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUiLAog
ICAgICAgICAgImh0dHBzK2h0dHBzOi8vZ2l0aHViLmNvbS9UaG9tYXNEaWNrZXkvbmN1cnNlcy1z
bmFwc2hvdHMvYXJjaGl2ZS92Nl80XzIwMjMwNjAzIiwKICAgICAgICAgICJodHRwc3x1cmxlbmNv
ZGUraHR0cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQvbmN1cnNlcyIsCiAgICAgICAgICAiaHR0
cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0IgogICAgICAgIF0KICAg
ICAgfQogICAgXSwKICAgICJwYXRjaGVzIjogWwogICAgICAicGFja2FnZS9uY3Vyc2VzLzAwMDEt
Zml4LVhPUEVOX1NPVVJDRS1kZXRlY3Rpb24ucGF0Y2giCiAgICBdLAogICAgInN0YW1wX2RpciI6
ICJidWlsZC9uY3Vyc2VzLTYuNC0yMDIzMDYwMyIsCiAgICAic291cmNlX2RpciI6ICJidWlsZC9u
Y3Vyc2VzLTYuNC0yMDIzMDYwMyIsCiAgICAiYnVpbGRfZGlyIjogImJ1aWxkL25jdXJzZXMtNi40
LTIwMjMwNjAzLyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxfc3Rh
Z2luZyI6IHRydWUsCiAgICAiaW5zdGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBlbmRlbmNp
ZXMiOiBbCiAgICAgICJob3N0LWNjYWNoZSIsCiAgICAgICJob3N0LW5jdXJzZXMiLAogICAgICAi
aG9zdC1za2VsZXRvbiIsCiAgICAgICJza2VsZXRvbiIsCiAgICAgICJ0b29sY2hhaW4iCiAgICBd
LAogICAgInJldmVyc2VfZGVwZW5kZW5jaWVzIjogWwogICAgICAiYWxhY3JpdHR5LXRlcm1pbmZv
IiwKICAgICAgImJhc2giLAogICAgICAiYy1rZXJtaXQiLAogICAgICAiaHRvcCIsCiAgICAgICJs
aWJvcGluZyIsCiAgICAgICJwcm9jcHMtbmciLAogICAgICAicmVhZGxpbmUiLAogICAgICAidXRp
bC1saW51eCIsCiAgICAgICJ2aW0iCiAgICBdLAogICAgImNwZS1pZCI6ICJjcGU6Mi4zOmE6Z251
Om5jdXJzZXM6Ni40LjIwMjMwNjAzOio6KjoqOio6KjoqOioiCiAgfSwKICAicGNyZTIiOiB7CiAg
ICAidHlwZSI6ICJ0YXJnZXQiLAogICAgIm5hbWUiOiAicGNyZTIiLAogICAgInZpcnR1YWwiOiBm
YWxzZSwKICAgICJ2ZXJzaW9uIjogIjEwLjQ0IiwKICAgICJsaWNlbnNlcyI6ICJCU0QtMy1DbGF1
c2UiLAogICAgImxpY2Vuc2VfZmlsZXMiOiBbCiAgICAgICJMSUNFTkNFIgogICAgXSwKICAgICJy
ZWRpc3RyaWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJwY3JlMiIsCiAgICAiZG93bmxv
YWRzIjogWwogICAgICB7CiAgICAgICAgInNvdXJjZSI6ICJwY3JlMi0xMC40NC50YXIuYnoyIiwK
ICAgICAgICAidXJpcyI6IFsKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290
L3NvdXJjZS1jYWNoZS9wY3JlMiIsCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24t
cm9vdC9zb3VyY2UtY2FjaGUiLAogICAgICAgICAgImh0dHBzK2h0dHBzOi8vZ2l0aHViLmNvbS9Q
Q1JFMlByb2plY3QvcGNyZTIvcmVsZWFzZXMvZG93bmxvYWQvcGNyZTItMTAuNDQiLAogICAgICAg
ICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9wY3JlMiIs
CiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0
IgogICAgICAgIF0KICAgICAgfQogICAgXSwKICAgICJwYXRjaGVzIjogW10sCiAgICAic3RhbXBf
ZGlyIjogImJ1aWxkL3BjcmUyLTEwLjQ0IiwKICAgICJzb3VyY2VfZGlyIjogImJ1aWxkL3BjcmUy
LTEwLjQ0IiwKICAgICJidWlsZF9kaXIiOiAiYnVpbGQvcGNyZTItMTAuNDQvIiwKICAgICJpbnN0
YWxsX3RhcmdldCI6IHRydWUsCiAgICAiaW5zdGFsbF9zdGFnaW5nIjogdHJ1ZSwKICAgICJpbnN0
YWxsX2ltYWdlcyI6IGZhbHNlLAogICAgImRlcGVuZGVuY2llcyI6IFsKICAgICAgImhvc3QtYXV0
b2NvbmYiLAogICAgICAiaG9zdC1hdXRvbWFrZSIsCiAgICAgICJob3N0LWNjYWNoZSIsCiAgICAg
ICJob3N0LWxpYnRvb2wiLAogICAgICAiaG9zdC1za2VsZXRvbiIsCiAgICAgICJza2VsZXRvbiIs
CiAgICAgICJ0b29sY2hhaW4iCiAgICBdLAogICAgInJldmVyc2VfZGVwZW5kZW5jaWVzIjogWwog
ICAgICAibmdpbngiLAogICAgICAic3lzdGVtZCIsCiAgICAgICJ1dGlsLWxpbnV4IiwKICAgICAg
IndnZXQiCiAgICBdLAogICAgImNwZS1pZCI6ICJjcGU6Mi4zOmE6cGNyZTpwY3JlMjoxMC40NDoq
Oio6KjoqOio6KjoqIgogIH0sCiAgInJlYWRsaW5lIjogewogICAgInR5cGUiOiAidGFyZ2V0IiwK
ICAgICJuYW1lIjogInJlYWRsaW5lIiwKICAgICJ2aXJ0dWFsIjogZmFsc2UsCiAgICAidmVyc2lv
biI6ICI4LjIiLAogICAgImxpY2Vuc2VzIjogIkdQTC0zLjArIiwKICAgICJsaWNlbnNlX2ZpbGVz
IjogWwogICAgICAiQ09QWUlORyIKICAgIF0sCiAgICAicmVkaXN0cmlidXRhYmxlIjogdHJ1ZSwK
ICAgICJkbF9kaXIiOiAicmVhZGxpbmUiLAogICAgImRvd25sb2FkcyI6IFsKICAgICAgewogICAg
ICAgICJzb3VyY2UiOiAicmVhZGxpbmUtOC4yLnRhci5neiIsCiAgICAgICAgInVyaXMiOiBbCiAg
ICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUvcmVhZGxp
bmUiLAogICAgICAgICAgInMzfHVybGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hl
IiwKICAgICAgICAgICJodHRwcytodHRwczovL2Z0cG1pcnJvci5nbnUub3JnL3JlYWRsaW5lIiwK
ICAgICAgICAgICJodHRwc3x1cmxlbmNvZGUraHR0cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQv
cmVhZGxpbmUiLAogICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVp
bGRyb290Lm5ldCIKICAgICAgICBdCiAgICAgIH0KICAgIF0sCiAgICAicGF0Y2hlcyI6IFsKICAg
ICAgInBhY2thZ2UvcmVhZGxpbmUvMDAwMS1jdXJzZXMtbGluay5wYXRjaCIsCiAgICAgICJwYWNr
YWdlL3JlYWRsaW5lLzAwMDItUmVhZGxpbmUtOC4yLXBhdGNoLTEtZml4LWNyYXNoLXdoZW4tcmVh
ZGxpbmUtaXMtc3Rhci5wYXRjaCIKICAgIF0sCiAgICAic3RhbXBfZGlyIjogImJ1aWxkL3JlYWRs
aW5lLTguMiIsCiAgICAic291cmNlX2RpciI6ICJidWlsZC9yZWFkbGluZS04LjIiLAogICAgImJ1
aWxkX2RpciI6ICJidWlsZC9yZWFkbGluZS04LjIvIiwKICAgICJpbnN0YWxsX3RhcmdldCI6IHRy
dWUsCiAgICAiaW5zdGFsbF9zdGFnaW5nIjogdHJ1ZSwKICAgICJpbnN0YWxsX2ltYWdlcyI6IGZh
bHNlLAogICAgImRlcGVuZGVuY2llcyI6IFsKICAgICAgImhvc3QtYXV0b2NvbmYiLAogICAgICAi
aG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1za2VsZXRvbiIsCiAgICAgICJuY3Vyc2VzIiwKICAg
ICAgInNrZWxldG9uIiwKICAgICAgInRvb2xjaGFpbiIKICAgIF0sCiAgICAicmV2ZXJzZV9kZXBl
bmRlbmNpZXMiOiBbCiAgICAgICJiYXNoIiwKICAgICAgImJpbmQiLAogICAgICAiZ251cGciLAog
ICAgICAiZ3JvdW5kLWNvbnRyb2wiLAogICAgICAibGxkcGQiLAogICAgICAidXRpbC1saW51eCIK
ICAgIF0sCiAgICAiY3BlLWlkIjogImNwZToyLjM6YTpnbnU6cmVhZGxpbmU6OC4yOio6KjoqOio6
KjoqOioiCiAgfSwKICAic2tlbGV0b24taW5pdC1jb21tb24iOiB7CiAgICAidHlwZSI6ICJ0YXJn
ZXQiLAogICAgIm5hbWUiOiAic2tlbGV0b24taW5pdC1jb21tb24iLAogICAgInZpcnR1YWwiOiBm
YWxzZSwKICAgICJ2ZXJzaW9uIjogIiIsCiAgICAibGljZW5zZXMiOiAidW5rbm93biIsCiAgICAi
bGljZW5zZV9maWxlcyI6IFtdLAogICAgInJlZGlzdHJpYnV0YWJsZSI6IHRydWUsCiAgICAiZGxf
ZGlyIjogInNrZWxldG9uLWluaXQtY29tbW9uIiwKICAgICJkb3dubG9hZHMiOiBbXSwKICAgICJw
YXRjaGVzIjogW10sCiAgICAic3RhbXBfZGlyIjogImJ1aWxkL3NrZWxldG9uLWluaXQtY29tbW9u
IiwKICAgICJzb3VyY2VfZGlyIjogImJ1aWxkL3NrZWxldG9uLWluaXQtY29tbW9uIiwKICAgICJi
dWlsZF9kaXIiOiAiYnVpbGQvc2tlbGV0b24taW5pdC1jb21tb24vIiwKICAgICJpbnN0YWxsX3Rh
cmdldCI6IHRydWUsCiAgICAiaW5zdGFsbF9zdGFnaW5nIjogdHJ1ZSwKICAgICJpbnN0YWxsX2lt
YWdlcyI6IGZhbHNlLAogICAgImRlcGVuZGVuY2llcyI6IFsKICAgICAgImhvc3QtY2NhY2hlIiwK
ICAgICAgImhvc3Qtc2tlbGV0b24iCiAgICBdLAogICAgInJldmVyc2VfZGVwZW5kZW5jaWVzIjog
WwogICAgICAic2tlbGV0b24taW5pdC1zeXN0ZW1kIgogICAgXQogIH0sCiAgInNrZWxldG9uLWlu
aXQtc3lzdGVtZCI6IHsKICAgICJ0eXBlIjogInRhcmdldCIsCiAgICAibmFtZSI6ICJza2VsZXRv
bi1pbml0LXN5c3RlbWQiLAogICAgInZpcnR1YWwiOiBmYWxzZSwKICAgICJ2ZXJzaW9uIjogIiIs
CiAgICAibGljZW5zZXMiOiAidW5rbm93biIsCiAgICAibGljZW5zZV9maWxlcyI6IFtdLAogICAg
InJlZGlzdHJpYnV0YWJsZSI6IHRydWUsCiAgICAiZGxfZGlyIjogInNrZWxldG9uLWluaXQtc3lz
dGVtZCIsCiAgICAiZG93bmxvYWRzIjogW10sCiAgICAicGF0Y2hlcyI6IFtdLAogICAgInN0YW1w
X2RpciI6ICJidWlsZC9za2VsZXRvbi1pbml0LXN5c3RlbWQiLAogICAgInNvdXJjZV9kaXIiOiAi
YnVpbGQvc2tlbGV0b24taW5pdC1zeXN0ZW1kIiwKICAgICJidWlsZF9kaXIiOiAiYnVpbGQvc2tl
bGV0b24taW5pdC1zeXN0ZW1kLyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImlu
c3RhbGxfc3RhZ2luZyI6IGZhbHNlLAogICAgImluc3RhbGxfaW1hZ2VzIjogZmFsc2UsCiAgICAi
ZGVwZW5kZW5jaWVzIjogWwogICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1za2VsZXRv
biIsCiAgICAgICJza2VsZXRvbi1pbml0LWNvbW1vbiIKICAgIF0sCiAgICAicmV2ZXJzZV9kZXBl
bmRlbmNpZXMiOiBbCiAgICAgICJza2VsZXRvbiIKICAgIF0KICB9LAogICJzb2NhdCI6IHsKICAg
ICJ0eXBlIjogInRhcmdldCIsCiAgICAibmFtZSI6ICJzb2NhdCIsCiAgICAidmlydHVhbCI6IGZh
bHNlLAogICAgInZlcnNpb24iOiAiMS44LjAuMyIsCiAgICAibGljZW5zZXMiOiAiR1BMLTIuMCB3
aXRoIE9wZW5TU0wgZXhjZXB0aW9uIiwKICAgICJsaWNlbnNlX2ZpbGVzIjogWwogICAgICAiUkVB
RE1FIiwKICAgICAgIkNPUFlJTkciLAogICAgICAiQ09QWUlORy5PcGVuU1NMIgogICAgXSwKICAg
ICJyZWRpc3RyaWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJzb2NhdCIsCiAgICAiZG93
bmxvYWRzIjogWwogICAgICB7CiAgICAgICAgInNvdXJjZSI6ICJzb2NhdC0xLjguMC4zLnRhci5i
ejIiLAogICAgICAgICJ1cmlzIjogWwogICAgICAgICAgInMzfHVybGVuY29kZStzMzovL2Nyb3du
LXJvb3Qvc291cmNlLWNhY2hlL3NvY2F0IiwKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9j
cm93bi1yb290L3NvdXJjZS1jYWNoZSIsCiAgICAgICAgICAiaHR0cCtodHRwOi8vd3d3LmRlc3Qt
dW5yZWFjaC5vcmcvc29jYXQvZG93bmxvYWQiLAogICAgICAgICAgImh0dHBzfHVybGVuY29kZSto
dHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC9zb2NhdCIsCiAgICAgICAgICAiaHR0cHN8dXJs
ZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0IgogICAgICAgIF0KICAgICAgfQog
ICAgXSwKICAgICJwYXRjaGVzIjogWwogICAgICAicGFja2FnZS9zb2NhdC8wMDAxLW5vLWRvY3Vt
ZW50YXRpb24ucGF0Y2giCiAgICBdLAogICAgInN0YW1wX2RpciI6ICJidWlsZC9zb2NhdC0xLjgu
MC4zIiwKICAgICJzb3VyY2VfZGlyIjogImJ1aWxkL3NvY2F0LTEuOC4wLjMiLAogICAgImJ1aWxk
X2RpciI6ICJidWlsZC9zb2NhdC0xLjguMC4zLyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVl
LAogICAgImluc3RhbGxfc3RhZ2luZyI6IGZhbHNlLAogICAgImluc3RhbGxfaW1hZ2VzIjogZmFs
c2UsCiAgICAiZGVwZW5kZW5jaWVzIjogWwogICAgICAiaG9zdC1hdXRvY29uZiIsCiAgICAgICJo
b3N0LWNjYWNoZSIsCiAgICAgICJob3N0LXNrZWxldG9uIiwKICAgICAgIm9wZW5zc2wiLAogICAg
ICAic2tlbGV0b24iLAogICAgICAidG9vbGNoYWluIgogICAgXSwKICAgICJyZXZlcnNlX2RlcGVu
ZGVuY2llcyI6IFtdLAogICAgImNwZS1pZCI6ICJjcGU6Mi4zOmE6ZGVzdC11bnJlYWNoOnNvY2F0
OjEuOC4wLjM6KjoqOio6KjoqOio6KiIKICB9LAogICJzeXN0ZW1kIjogewogICAgInR5cGUiOiAi
dGFyZ2V0IiwKICAgICJuYW1lIjogInN5c3RlbWQiLAogICAgInZpcnR1YWwiOiBmYWxzZSwKICAg
ICJ2ZXJzaW9uIjogIjI1Ni43IiwKICAgICJsaWNlbnNlcyI6ICJMR1BMLTIuMSssIEdQTC0yLjAr
ICh1ZGV2KSwgUHVibGljIERvbWFpbiAoZmV3IHNvdXJjZSBmaWxlcywgc2VlIExJQ0VOU0VTL1JF
QURNRS5tZCksIEJTRC0yLUNsYXVzZSAoZUJQRiBpbnN0cnVjdGlvbiBtaW5pIGxpYnJhcnkpLCBC
U0QtMy1DbGF1c2UgKHRvb2xzL2Nocm9taXVtb3MpLCBDQzAtMS4wIChmZXcgc291cmNlIGZpbGVz
LCBzZWUgTElDRU5TRVMvUkVBRE1FLm1kKSwgR1BMLTIuMCB3aXRoIExpbnV4LXN5c2NhbGwtbm90
ZSAobGludXgga2VybmVsIGhlYWRlcnMpLCBNSVQtMCAoZmV3IHNvdXJjZSBmaWxlcywgc2VlIExJ
Q0VOU0VTL1JFQURNRS5tZCksIE1JVCAoZmV3IHNvdXJjZSBmaWxlcywgc2VlIExJQ0VOU0VTL1JF
QURNRS5tZCksIE9GTC0xLjEgKEhlZWJvIGZvbnRzKSIsCiAgICAibGljZW5zZV9maWxlcyI6IFsK
ICAgICAgIkxJQ0VOU0UuR1BMMiIsCiAgICAgICJMSUNFTlNFLkxHUEwyLjEiLAogICAgICAiTElD
RU5TRVMvQlNELTItQ2xhdXNlLnR4dCIsCiAgICAgICJMSUNFTlNFUy9CU0QtMy1DbGF1c2UudHh0
IiwKICAgICAgIkxJQ0VOU0VTL0NDMC0xLjAudHh0IiwKICAgICAgIkxJQ0VOU0VTL0xHUEwtMi4w
LW9yLWxhdGVyLnR4dCIsCiAgICAgICJMSUNFTlNFUy9MaW51eC1zeXNjYWxsLW5vdGUudHh0IiwK
ICAgICAgIkxJQ0VOU0VTL2xvb2t1cDMtcHVibGljLWRvbWFpbi50eHQiLAogICAgICAiTElDRU5T
RVMvTUlULTAudHh0IiwKICAgICAgIkxJQ0VOU0VTL01JVC50eHQiLAogICAgICAiTElDRU5TRVMv
bXVybXVyaGFzaDItcHVibGljLWRvbWFpbi50eHQiLAogICAgICAiTElDRU5TRVMvT0ZMLTEuMS50
eHQiLAogICAgICAiTElDRU5TRVMvUkVBRE1FLm1kIgogICAgXSwKICAgICJyZWRpc3RyaWJ1dGFi
bGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJzeXN0ZW1kIiwKICAgICJkb3dubG9hZHMiOiBbCiAg
ICAgIHsKICAgICAgICAic291cmNlIjogInN5c3RlbWQtMjU2LjcudGFyLmd6IiwKICAgICAgICAi
dXJpcyI6IFsKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290L3NvdXJjZS1j
YWNoZS9zeXN0ZW1kIiwKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290L3Nv
dXJjZS1jYWNoZSIsCiAgICAgICAgICAiaHR0cHMraHR0cHM6Ly9naXRodWIuY29tL3N5c3RlbWQv
c3lzdGVtZC9hcmNoaXZlL3YyNTYuNyIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBz
Oi8vc291cmNlcy5idWlsZHJvb3QubmV0L3N5c3RlbWQiLAogICAgICAgICAgImh0dHBzfHVybGVu
Y29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAgICBdCiAgICAgIH0KICAg
IF0sCiAgICAicGF0Y2hlcyI6IFsKICAgICAgIi9ob21lL25oZWQvUHJvamVjdHMvYnVpbGRyb290
LWV4dGVybmFsLXRyZWVzL3RyZWVzL29wZW5fc291cmNlX3NvZnR3YXJlL3BhdGNoZXMvc3lzdGVt
ZC8wMTAwLVBTU1QtMjQzOS1Ecm9wLUJlZm9yZS1kZXBlbmRlbmN5LXN5c2luaXQudGFyZ2V0LnBh
dGNoIgogICAgXSwKICAgICJzdGFtcF9kaXIiOiAiYnVpbGQvc3lzdGVtZC0yNTYuNyIsCiAgICAi
c291cmNlX2RpciI6ICJidWlsZC9zeXN0ZW1kLTI1Ni43IiwKICAgICJidWlsZF9kaXIiOiAiYnVp
bGQvc3lzdGVtZC0yNTYuNy8iLAogICAgImluc3RhbGxfdGFyZ2V0IjogdHJ1ZSwKICAgICJpbnN0
YWxsX3N0YWdpbmciOiB0cnVlLAogICAgImluc3RhbGxfaW1hZ2VzIjogZmFsc2UsCiAgICAiZGVw
ZW5kZW5jaWVzIjogWwogICAgICAiYnppcDIiLAogICAgICAiZWxmdXRpbHMiLAogICAgICAiaG9z
dC1jY2FjaGUiLAogICAgICAiaG9zdC1ncGVyZiIsCiAgICAgICJob3N0LW1lc29uIiwKICAgICAg
Imhvc3QtcHl0aG9uLWppbmphMiIsCiAgICAgICJob3N0LXNrZWxldG9uIiwKICAgICAgImttb2Qi
LAogICAgICAibGliYXJjaGl2ZSIsCiAgICAgICJsaWJjYXAiLAogICAgICAibGliY3VybCIsCiAg
ICAgICJsaWJnY3J5cHQiLAogICAgICAibGlieGNyeXB0IiwKICAgICAgIm9wZW5zc2wiLAogICAg
ICAicGNyZTIiLAogICAgICAic2tlbGV0b24iLAogICAgICAidG9vbGNoYWluIiwKICAgICAgInV0
aWwtbGludXgtbGlicyIsCiAgICAgICJ4eiIsCiAgICAgICJ6bGliIgogICAgXSwKICAgICJyZXZl
cnNlX2RlcGVuZGVuY2llcyI6IFsKICAgICAgImJ1c3lib3giLAogICAgICAiZGJ1cyIsCiAgICAg
ICJpcHV0aWxzIiwKICAgICAgImxpYmxvZ2dpbmciLAogICAgICAicHJvY3BzLW5nIiwKICAgICAg
InJzeXNsb2ciLAogICAgICAic2FtbXkiLAogICAgICAidWRldiIsCiAgICAgICJ1dGlsLWxpbnV4
IgogICAgXSwKICAgICJjcGUtaWQiOiAiY3BlOjIuMzphOnN5c3RlbWRfcHJvamVjdDpzeXN0ZW1k
OjI1Ni43Oio6KjoqOio6KjoqOioiCiAgfSwKICAidG9vbGNoYWluLWV4dGVybmFsLWN1c3RvbSI6
IHsKICAgICJ0eXBlIjogInRhcmdldCIsCiAgICAibmFtZSI6ICJ0b29sY2hhaW4tZXh0ZXJuYWwt
Y3VzdG9tIiwKICAgICJ2aXJ0dWFsIjogZmFsc2UsCiAgICAidmVyc2lvbiI6ICIiLAogICAgImxp
Y2Vuc2VzIjogInVua25vd24iLAogICAgImxpY2Vuc2VfZmlsZXMiOiBbXSwKICAgICJyZWRpc3Ry
aWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJ0b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9t
IiwKICAgICJkb3dubG9hZHMiOiBbCiAgICAgIHsKICAgICAgICAic291cmNlIjogImdjYy1hYXJj
aDY0LTguNS4wLXg4Nl82NC1hYXJjaDY0LWxpbnV4LWdudS50YXIueHoiLAogICAgICAgICJ1cmlz
IjogWwogICAgICAgICAgInMzfHVybGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hl
L3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20iLAogICAgICAgICAgInMzfHVybGVuY29kZStzMzov
L2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlIiwKICAgICAgICAgICJzMytzMzovL3N0YXJyeS1maXJt
d2FyZS10b29sY2hhaW5zL2djYy1hYXJjaDY0LTguNS4wLXg4Nl82NC1hYXJjaDY0LWxpbnV4LWdu
dSIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3Qu
bmV0L3Rvb2xjaGFpbi1leHRlcm5hbC1jdXN0b20iLAogICAgICAgICAgImh0dHBzfHVybGVuY29k
ZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAgICBdCiAgICAgIH0KICAgIF0s
CiAgICAicGF0Y2hlcyI6IFtdLAogICAgInN0YW1wX2RpciI6ICJidWlsZC90b29sY2hhaW4tZXh0
ZXJuYWwtY3VzdG9tIiwKICAgICJzb3VyY2VfZGlyIjogImJ1aWxkL3Rvb2xjaGFpbi1leHRlcm5h
bC1jdXN0b20iLAogICAgImJ1aWxkX2RpciI6ICJidWlsZC90b29sY2hhaW4tZXh0ZXJuYWwtY3Vz
dG9tLyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxfc3RhZ2luZyI6
IHRydWUsCiAgICAiaW5zdGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBlbmRlbmNpZXMiOiBb
CiAgICAgICJob3N0LWNjYWNoZSIsCiAgICAgICJob3N0LXNrZWxldG9uIiwKICAgICAgInNrZWxl
dG9uIgogICAgXSwKICAgICJyZXZlcnNlX2RlcGVuZGVuY2llcyI6IFsKICAgICAgInRvb2xjaGFp
bi1leHRlcm5hbCIKICAgIF0KICB9LAogICJ1dGlsLWxpbnV4IjogewogICAgInR5cGUiOiAidGFy
Z2V0IiwKICAgICJuYW1lIjogInV0aWwtbGludXgiLAogICAgInZpcnR1YWwiOiBmYWxzZSwKICAg
ICJ2ZXJzaW9uIjogIjIuNDAuMiIsCiAgICAibGljZW5zZXMiOiAiR1BMLTIuMCssIEJTRC00LUNs
YXVzZSwgTEdQTC0yLjErIChsaWJibGtpZCwgbGliZmRpc2ssIGxpYm1vdW50KSwgQlNELTMtQ2xh
dXNlIChsaWJ1dWlkKSwgQlNELTItQ2xhdXNlICh4eGhhc2gpLCBJU0MgKHJma2lsbCkgTUlUICho
YXJkbGluaywgZmxvY2spIiwKICAgICJsaWNlbnNlX2ZpbGVzIjogWwogICAgICAiUkVBRE1FLmxp
Y2Vuc2luZyIsCiAgICAgICJEb2N1bWVudGF0aW9uL2xpY2Vuc2VzL0NPUFlJTkcuQlNELTMtQ2xh
dXNlIiwKICAgICAgIkRvY3VtZW50YXRpb24vbGljZW5zZXMvQ09QWUlORy5CU0QtNC1DbGF1c2Ut
VUMiLAogICAgICAiRG9jdW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZSU5HLkdQTC0yLjAtb3ItbGF0
ZXIiLAogICAgICAiRG9jdW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZSU5HLklTQyIsCiAgICAgICJE
b2N1bWVudGF0aW9uL2xpY2Vuc2VzL0NPUFlJTkcuTEdQTC0yLjEtb3ItbGF0ZXIiLAogICAgICAi
RG9jdW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZSU5HLk1JVCIKICAgIF0sCiAgICAicmVkaXN0cmli
dXRhYmxlIjogdHJ1ZSwKICAgICJkbF9kaXIiOiAidXRpbC1saW51eCIsCiAgICAiZG93bmxvYWRz
IjogWwogICAgICB7CiAgICAgICAgInNvdXJjZSI6ICJ1dGlsLWxpbnV4LTIuNDAuMi50YXIueHoi
LAogICAgICAgICJ1cmlzIjogWwogICAgICAgICAgInMzfHVybGVuY29kZStzMzovL2Nyb3duLXJv
b3Qvc291cmNlLWNhY2hlL3V0aWwtbGludXgiLAogICAgICAgICAgInMzfHVybGVuY29kZStzMzov
L2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlIiwKICAgICAgICAgICJodHRwcytodHRwczovL2Nkbi5r
ZXJuZWwub3JnL3B1Yi9saW51eC91dGlscy91dGlsLWxpbnV4L3YyLjQwIiwKICAgICAgICAgICJo
dHRwc3x1cmxlbmNvZGUraHR0cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQvdXRpbC1saW51eCIs
CiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0
IgogICAgICAgIF0KICAgICAgfQogICAgXSwKICAgICJwYXRjaGVzIjogWwogICAgICAicGFja2Fn
ZS91dGlsLWxpbnV4LzAwMDEtc3lzLXV0aWxzLXNldGFyY2guYy1maXgtYnVpbGQtd2l0aC11Y2xp
YmMtbmctMS4wLjM5LnBhdGNoIiwKICAgICAgInBhY2thZ2UvdXRpbC1saW51eC8wMDAyLWMuaC1j
b25zb2xpZGF0ZS1USFJFQURfTE9DQUwucGF0Y2giLAogICAgICAicGFja2FnZS91dGlsLWxpbnV4
LzAwMDMtYXV0b3Rvb2xzLWRlZmluZS1IQVZFX0xJQlBUSFJFQUQtYW5kLVBUSFJFQURfTElCUy5w
YXRjaCIsCiAgICAgICJwYWNrYWdlL3V0aWwtbGludXgvMDAwNC1tZXNvbi1hZGQtSEFWRV9MSUJQ
VEhSRUFELnBhdGNoIiwKICAgICAgInBhY2thZ2UvdXRpbC1saW51eC8wMDA1LWxpYnV1aWQtc3Vw
cG9ydC1ub24tY2FjaGVkLXNjZW5hcmlvcy13aGVuLWxwdGhyZWFkLWkucGF0Y2giCiAgICBdLAog
ICAgInN0YW1wX2RpciI6ICJidWlsZC91dGlsLWxpbnV4LTIuNDAuMiIsCiAgICAic291cmNlX2Rp
ciI6ICJidWlsZC91dGlsLWxpbnV4LTIuNDAuMiIsCiAgICAiYnVpbGRfZGlyIjogImJ1aWxkL3V0
aWwtbGludXgtMi40MC4yLyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3Rh
bGxfc3RhZ2luZyI6IHRydWUsCiAgICAiaW5zdGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBl
bmRlbmNpZXMiOiBbCiAgICAgICJob3N0LWF1dG9jb25mIiwKICAgICAgImhvc3QtYXV0b21ha2Ui
LAogICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1saWJ0b29sIiwKICAgICAgImhvc3Qt
cGtnY29uZiIsCiAgICAgICJob3N0LXNrZWxldG9uIiwKICAgICAgImxpYnhjcnlwdCIsCiAgICAg
ICJuY3Vyc2VzIiwKICAgICAgInBjcmUyIiwKICAgICAgInJlYWRsaW5lIiwKICAgICAgInNrZWxl
dG9uIiwKICAgICAgInN5c3RlbWQiLAogICAgICAidG9vbGNoYWluIiwKICAgICAgInVkZXYiLAog
ICAgICAidXRpbC1saW51eC1saWJzIiwKICAgICAgInpsaWIiCiAgICBdLAogICAgInJldmVyc2Vf
ZGVwZW5kZW5jaWVzIjogWwogICAgICAiYXByIiwKICAgICAgImJ0cmZzLXByb2dzIiwKICAgICAg
ImJ1c3lib3giLAogICAgICAiZTJmc3Byb2dzIiwKICAgICAgInJzeXNsb2ciLAogICAgICAid2dl
dCIKICAgIF0sCiAgICAiY3BlLWlkIjogImNwZToyLjM6YTprZXJuZWw6dXRpbC1saW51eDoyLjQw
LjI6KjoqOio6KjoqOio6KiIKICB9LAogICJ1dGlsLWxpbnV4LWxpYnMiOiB7CiAgICAidHlwZSI6
ICJ0YXJnZXQiLAogICAgIm5hbWUiOiAidXRpbC1saW51eC1saWJzIiwKICAgICJ2aXJ0dWFsIjog
ZmFsc2UsCiAgICAidmVyc2lvbiI6ICIyLjQwLjIiLAogICAgImxpY2Vuc2VzIjogIkxHUEwtMi4x
KyAobGliYmxraWQsIGxpYmZkaXNrLCBsaWJtb3VudCksIEJTRC0zLUNsYXVzZSAobGlidXVpZCki
LAogICAgImxpY2Vuc2VfZmlsZXMiOiBbCiAgICAgICJSRUFETUUubGljZW5zaW5nIiwKICAgICAg
IkRvY3VtZW50YXRpb24vbGljZW5zZXMvQ09QWUlORy5CU0QtMy1DbGF1c2UiLAogICAgICAiRG9j
dW1lbnRhdGlvbi9saWNlbnNlcy9DT1BZSU5HLkxHUEwtMi4xLW9yLWxhdGVyIgogICAgXSwKICAg
ICJyZWRpc3RyaWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJ1dGlsLWxpbnV4IiwKICAg
ICJkb3dubG9hZHMiOiBbCiAgICAgIHsKICAgICAgICAic291cmNlIjogInV0aWwtbGludXgtMi40
MC4yLnRhci54eiIsCiAgICAgICAgInVyaXMiOiBbCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3Mz
Oi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUvdXRpbC1saW51eCIsCiAgICAgICAgICAiczN8dXJs
ZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUiLAogICAgICAgICAgImh0dHBzK2h0
dHBzOi8vY2RuLmtlcm5lbC5vcmcvcHViL2xpbnV4L3V0aWxzL3V0aWwtbGludXgvdjIuNDAiLAog
ICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC91
dGlsLWxpbnV4IiwKICAgICAgICAgICJodHRwc3x1cmxlbmNvZGUraHR0cHM6Ly9zb3VyY2VzLmJ1
aWxkcm9vdC5uZXQiCiAgICAgICAgXQogICAgICB9CiAgICBdLAogICAgInBhdGNoZXMiOiBbXSwK
ICAgICJzdGFtcF9kaXIiOiAiYnVpbGQvdXRpbC1saW51eC1saWJzLTIuNDAuMiIsCiAgICAic291
cmNlX2RpciI6ICJidWlsZC91dGlsLWxpbnV4LWxpYnMtMi40MC4yIiwKICAgICJidWlsZF9kaXIi
OiAiYnVpbGQvdXRpbC1saW51eC1saWJzLTIuNDAuMi8iLAogICAgImluc3RhbGxfdGFyZ2V0Ijog
dHJ1ZSwKICAgICJpbnN0YWxsX3N0YWdpbmciOiB0cnVlLAogICAgImluc3RhbGxfaW1hZ2VzIjog
ZmFsc2UsCiAgICAiZGVwZW5kZW5jaWVzIjogWwogICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAi
aG9zdC1wa2djb25mIiwKICAgICAgImhvc3Qtc2tlbGV0b24iLAogICAgICAibGlieGNyeXB0IiwK
ICAgICAgInNrZWxldG9uIiwKICAgICAgInRvb2xjaGFpbiIKICAgIF0sCiAgICAicmV2ZXJzZV9k
ZXBlbmRlbmNpZXMiOiBbCiAgICAgICJzeXN0ZW1kIiwKICAgICAgInV0aWwtbGludXgiCiAgICBd
LAogICAgImNwZS1pZCI6ICJjcGU6Mi4zOmE6a2VybmVsOnV0aWwtbGludXg6Mi40MC4yOio6Kjoq
Oio6KjoqOioiCiAgfSwKICAidmltIjogewogICAgInR5cGUiOiAidGFyZ2V0IiwKICAgICJuYW1l
IjogInZpbSIsCiAgICAidmlydHVhbCI6IGZhbHNlLAogICAgInZlcnNpb24iOiAiOS4xLjAxNDUi
LAogICAgImxpY2Vuc2VzIjogIkNoYXJpdHl3YXJlIiwKICAgICJsaWNlbnNlX2ZpbGVzIjogWwog
ICAgICAiTElDRU5TRSIsCiAgICAgICJSRUFETUUudHh0IgogICAgXSwKICAgICJyZWRpc3RyaWJ1
dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJ2aW0iLAogICAgImRvd25sb2FkcyI6IFsKICAg
ICAgewogICAgICAgICJzb3VyY2UiOiAidmltLTkuMS4wMTQ1LnRhci5neiIsCiAgICAgICAgInVy
aXMiOiBbCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8vY3Jvd24tcm9vdC9zb3VyY2UtY2Fj
aGUvdmltIiwKICAgICAgICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290L3NvdXJjZS1j
YWNoZSIsCiAgICAgICAgICAiaHR0cHMraHR0cHM6Ly9naXRodWIuY29tL3ZpbS92aW0vYXJjaGl2
ZS92OS4xLjAxNDUiLAogICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMu
YnVpbGRyb290Lm5ldC92aW0iLAogICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3Nv
dXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAgICBdCiAgICAgIH0KICAgIF0sCiAgICAicGF0Y2hl
cyI6IFtdLAogICAgInN0YW1wX2RpciI6ICJidWlsZC92aW0tOS4xLjAxNDUiLAogICAgInNvdXJj
ZV9kaXIiOiAiYnVpbGQvdmltLTkuMS4wMTQ1IiwKICAgICJidWlsZF9kaXIiOiAiYnVpbGQvdmlt
LTkuMS4wMTQ1L3NyYyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxf
c3RhZ2luZyI6IGZhbHNlLAogICAgImluc3RhbGxfaW1hZ2VzIjogZmFsc2UsCiAgICAiZGVwZW5k
ZW5jaWVzIjogWwogICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1za2VsZXRvbiIsCiAg
ICAgICJuY3Vyc2VzIiwKICAgICAgInNrZWxldG9uIiwKICAgICAgInRvb2xjaGFpbiIKICAgIF0s
CiAgICAicmV2ZXJzZV9kZXBlbmRlbmNpZXMiOiBbCiAgICAgICJidXN5Ym94IgogICAgXSwKICAg
ICJjcGUtaWQiOiAiY3BlOjIuMzphOnZpbTp2aW06OS4xLjAxNDU6KjoqOio6KjoqOio6KiIKICB9
LAogICJ3Z2V0IjogewogICAgInR5cGUiOiAidGFyZ2V0IiwKICAgICJuYW1lIjogIndnZXQiLAog
ICAgInZpcnR1YWwiOiBmYWxzZSwKICAgICJ2ZXJzaW9uIjogIjEuMjUuMCIsCiAgICAibGljZW5z
ZXMiOiAiR1BMLTMuMCsiLAogICAgImxpY2Vuc2VfZmlsZXMiOiBbCiAgICAgICJDT1BZSU5HIgog
ICAgXSwKICAgICJyZWRpc3RyaWJ1dGFibGUiOiB0cnVlLAogICAgImRsX2RpciI6ICJ3Z2V0IiwK
ICAgICJkb3dubG9hZHMiOiBbCiAgICAgIHsKICAgICAgICAic291cmNlIjogIndnZXQtMS4yNS4w
LnRhci5seiIsCiAgICAgICAgInVyaXMiOiBbCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3MzOi8v
Y3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUvd2dldCIsCiAgICAgICAgICAiczN8dXJsZW5jb2RlK3Mz
Oi8vY3Jvd24tcm9vdC9zb3VyY2UtY2FjaGUiLAogICAgICAgICAgImh0dHBzK2h0dHBzOi8vZnRw
bWlycm9yLmdudS5vcmcvd2dldCIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBzOi8v
c291cmNlcy5idWlsZHJvb3QubmV0L3dnZXQiLAogICAgICAgICAgImh0dHBzfHVybGVuY29kZSto
dHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldCIKICAgICAgICBdCiAgICAgIH0KICAgIF0sCiAg
ICAicGF0Y2hlcyI6IFsKICAgICAgInBhY2thZ2Uvd2dldC8wMDAxLWxpYi1nZXRyYW5kb20uYy1m
aXgtYnVpbGQtd2l0aC11Y2xpYmMtMS4wLjM1LnBhdGNoIgogICAgXSwKICAgICJzdGFtcF9kaXIi
OiAiYnVpbGQvd2dldC0xLjI1LjAiLAogICAgInNvdXJjZV9kaXIiOiAiYnVpbGQvd2dldC0xLjI1
LjAiLAogICAgImJ1aWxkX2RpciI6ICJidWlsZC93Z2V0LTEuMjUuMC8iLAogICAgImluc3RhbGxf
dGFyZ2V0IjogdHJ1ZSwKICAgICJpbnN0YWxsX3N0YWdpbmciOiBmYWxzZSwKICAgICJpbnN0YWxs
X2ltYWdlcyI6IGZhbHNlLAogICAgImRlcGVuZGVuY2llcyI6IFsKICAgICAgImMtYXJlcyIsCiAg
ICAgICJob3N0LWNjYWNoZSIsCiAgICAgICJob3N0LWx6aXAiLAogICAgICAiaG9zdC1wa2djb25m
IiwKICAgICAgImhvc3Qtc2tlbGV0b24iLAogICAgICAib3BlbnNzbCIsCiAgICAgICJwY3JlMiIs
CiAgICAgICJza2VsZXRvbiIsCiAgICAgICJ0b29sY2hhaW4iLAogICAgICAidXRpbC1saW51eCIs
CiAgICAgICJ6bGliIgogICAgXSwKICAgICJyZXZlcnNlX2RlcGVuZGVuY2llcyI6IFsKICAgICAg
ImJ1c3lib3giCiAgICBdLAogICAgImNwZS1pZCI6ICJjcGU6Mi4zOmE6Z251OndnZXQ6MS4yNS4w
Oio6KjoqOio6KjoqOioiCiAgfSwKICAid2hpY2giOiB7CiAgICAidHlwZSI6ICJ0YXJnZXQiLAog
ICAgIm5hbWUiOiAid2hpY2giLAogICAgInZpcnR1YWwiOiBmYWxzZSwKICAgICJ2ZXJzaW9uIjog
IjIuMjEiLAogICAgImxpY2Vuc2VzIjogIkdQTC0zLjArIiwKICAgICJsaWNlbnNlX2ZpbGVzIjog
WwogICAgICAiQ09QWUlORyIKICAgIF0sCiAgICAicmVkaXN0cmlidXRhYmxlIjogdHJ1ZSwKICAg
ICJkbF9kaXIiOiAid2hpY2giLAogICAgImRvd25sb2FkcyI6IFsKICAgICAgewogICAgICAgICJz
b3VyY2UiOiAid2hpY2gtMi4yMS50YXIuZ3oiLAogICAgICAgICJ1cmlzIjogWwogICAgICAgICAg
InMzfHVybGVuY29kZStzMzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlL3doaWNoIiwKICAgICAg
ICAgICJzM3x1cmxlbmNvZGUrczM6Ly9jcm93bi1yb290L3NvdXJjZS1jYWNoZSIsCiAgICAgICAg
ICAiaHR0cHMraHR0cHM6Ly9mdHBtaXJyb3IuZ251Lm9yZy93aGljaCIsCiAgICAgICAgICAiaHR0
cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L3doaWNoIiwKICAgICAg
ICAgICJodHRwc3x1cmxlbmNvZGUraHR0cHM6Ly9zb3VyY2VzLmJ1aWxkcm9vdC5uZXQiCiAgICAg
ICAgXQogICAgICB9CiAgICBdLAogICAgInBhdGNoZXMiOiBbXSwKICAgICJzdGFtcF9kaXIiOiAi
YnVpbGQvd2hpY2gtMi4yMSIsCiAgICAic291cmNlX2RpciI6ICJidWlsZC93aGljaC0yLjIxIiwK
ICAgICJidWlsZF9kaXIiOiAiYnVpbGQvd2hpY2gtMi4yMS8iLAogICAgImluc3RhbGxfdGFyZ2V0
IjogdHJ1ZSwKICAgICJpbnN0YWxsX3N0YWdpbmciOiBmYWxzZSwKICAgICJpbnN0YWxsX2ltYWdl
cyI6IGZhbHNlLAogICAgImRlcGVuZGVuY2llcyI6IFsKICAgICAgImhvc3QtY2NhY2hlIiwKICAg
ICAgImhvc3Qtc2tlbGV0b24iLAogICAgICAic2tlbGV0b24iLAogICAgICAidG9vbGNoYWluIgog
ICAgXSwKICAgICJyZXZlcnNlX2RlcGVuZGVuY2llcyI6IFtdCiAgfSwKICAieHoiOiB7CiAgICAi
dHlwZSI6ICJ0YXJnZXQiLAogICAgIm5hbWUiOiAieHoiLAogICAgInZpcnR1YWwiOiBmYWxzZSwK
ICAgICJ2ZXJzaW9uIjogIjUuNi40IiwKICAgICJsaWNlbnNlcyI6ICJQdWJsaWMgRG9tYWluLCBC
U0QtMC1DbGF1c2UsIEdQTC0yLjArLCBHUEwtMy4wKywgTEdQTC0yLjErIiwKICAgICJsaWNlbnNl
X2ZpbGVzIjogWwogICAgICAiQ09QWUlORyIsCiAgICAgICJDT1BZSU5HLjBCU0QiLAogICAgICAi
Q09QWUlORy5HUEx2MiIsCiAgICAgICJDT1BZSU5HLkdQTHYzIiwKICAgICAgIkNPUFlJTkcuTEdQ
THYyLjEiCiAgICBdLAogICAgInJlZGlzdHJpYnV0YWJsZSI6IHRydWUsCiAgICAiZGxfZGlyIjog
Inh6IiwKICAgICJkb3dubG9hZHMiOiBbCiAgICAgIHsKICAgICAgICAic291cmNlIjogInh6LTUu
Ni40LnRhci5iejIiLAogICAgICAgICJ1cmlzIjogWwogICAgICAgICAgInMzfHVybGVuY29kZStz
MzovL2Nyb3duLXJvb3Qvc291cmNlLWNhY2hlL3h6IiwKICAgICAgICAgICJzM3x1cmxlbmNvZGUr
czM6Ly9jcm93bi1yb290L3NvdXJjZS1jYWNoZSIsCiAgICAgICAgICAiaHR0cHMraHR0cHM6Ly9n
aXRodWIuY29tL3R1a2FhbmktcHJvamVjdC94ei9yZWxlYXNlcy9kb3dubG9hZC92NS42LjQiLAog
ICAgICAgICAgImh0dHBzfHVybGVuY29kZStodHRwczovL3NvdXJjZXMuYnVpbGRyb290Lm5ldC94
eiIsCiAgICAgICAgICAiaHR0cHN8dXJsZW5jb2RlK2h0dHBzOi8vc291cmNlcy5idWlsZHJvb3Qu
bmV0IgogICAgICAgIF0KICAgICAgfQogICAgXSwKICAgICJwYXRjaGVzIjogWwogICAgICAicGFj
a2FnZS94ei8wMDAxLWxpYmx6bWEtbXQtZGVjLUZpeC1hLWNvbW1lbnQucGF0Y2giLAogICAgICAi
cGFja2FnZS94ei8wMDAyLWxpYmx6bWEtbXQtZGVjLVNpbXBsaWZ5LWJ5LXJlbW92aW5nLXRoZS1U
SFJfU1RPUC1zdGEucGF0Y2giLAogICAgICAicGFja2FnZS94ei8wMDAzLWxpYmx6bWEtbXQtZGVj
LURvbi10LWZyZWUtdGhlLWlucHV0LWJ1ZmZlci10b28tZWFybHkucGF0Y2giLAogICAgICAicGFj
a2FnZS94ei8wMDA0LWxpYmx6bWEtbXQtZGVjLURvbi10LW1vZGlmeS10aHItaW5fc2l6ZS1pbi10
aGUtd29ya2UucGF0Y2giCiAgICBdLAogICAgInN0YW1wX2RpciI6ICJidWlsZC94ei01LjYuNCIs
CiAgICAic291cmNlX2RpciI6ICJidWlsZC94ei01LjYuNCIsCiAgICAiYnVpbGRfZGlyIjogImJ1
aWxkL3h6LTUuNi40LyIsCiAgICAiaW5zdGFsbF90YXJnZXQiOiB0cnVlLAogICAgImluc3RhbGxf
c3RhZ2luZyI6IHRydWUsCiAgICAiaW5zdGFsbF9pbWFnZXMiOiBmYWxzZSwKICAgICJkZXBlbmRl
bmNpZXMiOiBbCiAgICAgICJob3N0LWF1dG9jb25mIiwKICAgICAgImhvc3QtYXV0b21ha2UiLAog
ICAgICAiaG9zdC1jY2FjaGUiLAogICAgICAiaG9zdC1saWJ0b29sIiwKICAgICAgImhvc3Qtc2tl
bGV0b24iLAogICAgICAic2tlbGV0b24iLAogICAgICAidG9vbGNoYWluIgogICAgXSwKICAgICJy
ZXZlcnNlX2RlcGVuZGVuY2llcyI6IFsKICAgICAgImVsZnV0aWxzIiwKICAgICAgImtleGVjIiwK
ICAgICAgImttb2QiLAogICAgICAibGliYXJjaGl2ZSIsCiAgICAgICJtYWtlZHVtcGZpbGUiLAog
ICAgICAibWVuZGVyLWNsaWVudCIsCiAgICAgICJvcGtnIiwKICAgICAgInN5c3RlbWQiCiAgICBd
LAogICAgImNwZS1pZCI6ICJjcGU6Mi4zOmE6dHVrYWFuaTp4ejo1LjYuNDoqOio6KjoqOio6Kjoq
IiwKICAgICJpZ25vcmVfY3ZlcyI6IFsKICAgICAgIkNWRS0yMDI1LTMxMTE1IgogICAgXQogIH0K
fQo=
--00000000000044cf290640969fea
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--00000000000044cf290640969fea--
