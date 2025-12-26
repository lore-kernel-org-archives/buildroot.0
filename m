Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A52E8FDB5
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 19:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5862605AA;
	Fri, 26 Dec 2025 19:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dxYiQ-Ey9uL; Fri, 26 Dec 2025 19:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD386606F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766778972;
	bh=loKVF+CxjhT/GNXXUSzhluvea2bvevUmlkE80cTrCXw=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rOljn+yUkH8PPD38/9Op2Pu04Y9ZmfnvRKpJKUhEGFGlkMY+Qygt+otJWr/tE0zeS
	 bcZ7cOpzZYxlTGzE775N6jl+zh4Hg4ybqJeFrNnvqrq1sk/MiqveMMfbxAcCXTXzLn
	 LrYFxZBpMRB7o2QVK9w0flXl4tQNx1RtKVpYAnpYDI0Ro24G8gv/YlQPGNdI342sxM
	 ODS1J9lvRYXQqJiWF6J2hGN+cTzGtTuYGjOcH1sYLWpomH9YStyB9UjI5ktgFlWjQR
	 9DuuGQnV4OK01XYpBhBvKDanVtdF6zylHtJSEuTItcfv6Qh32VrAtDAeT/sR3Mm0Id
	 Z/UFWfCX4feQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD386606F6;
	Fri, 26 Dec 2025 19:56:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB1C1B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7C94606F6
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W2d8tjqyXw3f for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 19:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=nhed@starry.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 771F9605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 771F9605AA
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 771F9605AA
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 19:56:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso6195005f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:56:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766778968; x=1767383768;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L6QxdtvYuSCS14+eXvN53DAi0bE+3ocegMfwVFGyWjI=;
 b=YlRMAeMKOSQtsxv9QxG67Xc56r42nIHkJwrr/H7KjoWzK2BPsMpvYRXo4YOQmn02Bw
 fpgNZCnqjHf0n4Y7F3HX73/5EBZERzq33LSU45sr1Hvs/xZj47a/cJLWsMD7YUOvPi02
 ckdYylHDumDejNqDbRxPrsPSsC/lIw3c0AddIecASF7/iWXa4/AqthP9m986Hehf5xZX
 y7vXkLZlEf0KY9BQmglspbFM/0A7JZPLGtruxwmMDzMDzz+n8rL3Oib0X7Zubn1H/q8x
 lhSmr/DNjmxTtl3cmrBaoGT5Q/XIaufW2MOBD0p6UUncyecTQyXnqO079FFDSyKL1HZ2
 /2kQ==
X-Gm-Message-State: AOJu0YyRoyR7+RgsphXnf1UvD5yyNWBtwo9ZRQjSuqJuj67dlqYtrzjK
 O2wR1deTM4g/cyF6guv4FlaleyHH47P01BRfOusq1/JFc+r8Gh60WXDkQrD+/vLBY7847ph2Q41
 6MB+ziB934CIVn3bLHkpfj/24w41GYRGKVsQpB+N1Txpb7UeNqsGj
X-Gm-Gg: AY/fxX7rbSqjXn0kXNt9FsMomMq45WZCs36w/rZCFDw9KvhPJAW+sbDQONDdMioF3uo
 SyXmgjy8TkOl/pz2ndsHjp/5STJnvGXapia66mdNGOE5w5DyOtkAa8K8mjUTB2LyHrhyG/1FH1k
 uFTL7aJNOmnw32SgPiAxj5DmbbUklwXOdpqgGHSz7fFJv6i2mvQGg4BSP2Ksoz9SfiNST+jWcA/
 d9Ghox+7RjyBrn1pSCklooiudTzu341AlvW7S1vN3o5e+w7Hv8z2p34kqb1kR9uhzeYf8U=
X-Google-Smtp-Source: AGHT+IFKe4G//1/4W/66BBvzZDmz6huT14ZUOWg1dNq8AQPVJ6342X9WNpYBadZ2nyeK2TMnXOeitew0T1W6udb9dWk=
X-Received: by 2002:a05:6000:2303:b0:430:fdb8:8516 with SMTP id
 ffacd0b85a97d-4324e506039mr29163524f8f.35.1766778967593; Fri, 26 Dec 2025
 11:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20251007174036.1178955-1-nhed+buildroot@starry.com>
 <20251226041452.1040838-1-nhed+github@starry.com>
 <20251226041452.1040838-2-nhed+github@starry.com>
In-Reply-To: <20251226041452.1040838-2-nhed+github@starry.com>
Date: Fri, 26 Dec 2025 14:55:55 -0500
X-Gm-Features: AQt7F2ovfj1jIZAYG-Tbe9PhMSNlqZNhli0aVvwadiRunOTCnU4zH_75jBewq44
Message-ID: <CABGDZCkgwxhZLDUNbZG1H214-njnpbO=UgK_dHxPboqdHJfjdQ@mail.gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=starry.com; s=google; t=1766778968; x=1767383768; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L6QxdtvYuSCS14+eXvN53DAi0bE+3ocegMfwVFGyWjI=;
 b=L8BTyCI97KKw6AnAAONg5FHKNG3JmrQLkKEis4qBrAmm8dglH1QjCAE5Xp6+7jCWtw
 bkG/5/o31IAe4KFCAmDeQg/Jql56NLSaVDB5Gsy7bqB5SB58cc+M0LvpoHk2jv1RcUt1
 1+wtcu6oQl64gyY1kzwhGn9b5HO1HYtl3idMI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=starry.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=starry.com header.i=@starry.com header.a=rsa-sha256
 header.s=google header.b=L8BTyCI9
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/generate-cyclonedx: fix
 monotonically increasing dependency list
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
Content-Type: multipart/mixed; boundary="===============1200213681027203103=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1200213681027203103==
Content-Type: multipart/alternative; boundary="000000000000c2a5b70646e04895"

--000000000000c2a5b70646e04895
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I sent an updated patch last night and not seeing it in patchworks

Not sure what I did  wrong or if there are issues with patchworks (I did
experience non-responsiveness today)

On Thu, Dec 25, 2025 at 11:15=E2=80=AFPM Nevo Hed <nhed@starry.com> wrote:

> From: Nevo Hed <nhed+buildroot@starry.com>
>
> Having mutables as default args has unexpected behaviors.
> br2_parse_deps_recursively had a default arg `deps` initialized to the
> empty list (`[]`) except that on subsequent calls from `main` deps would
> already be populated from prior components.
>
> Reproduction details:
>
> $ python3 --version
> Python 3.13.7
>
> Run this script which
>   - Emits a very reduced set of a very theoretical `make show-info`.
>   - Runs utils/generate-cyclonedx on that set as input.
>   - Reduces the generate-cyclonedx output to pairs of component name
>     and dependencies for that component.
>
> ---
> function dummy_json_input {
>     echo '{
>       "systemd": {
>         "type": "target",
>         "name": "systemd",
>         "virtual": false,
>         "version": "256.7",
>         "dependencies": [
>           "bzip2"
>         ]
>       },
>       "bzip2": {
>         "type": "target",
>         "name": "bzip2",
>         "virtual": false,
>         "version": "1.0.8"
>       },
>       "util-linux": {
>         "type": "target",
>         "name": "util-linux",
>         "virtual": false,
>         "version": "2.40.2",
>         "dependencies": [
>           "systemd"
>         ]
>       }
>     }'
> }
>
> dummy_json_input | \
>     utils/generate-cyclonedx | \
>     jq -c '.dependencies[] | [.ref, (.dependsOn|length) ]'
> ---
>
> Output before change:
> ["buildroot",3]
> ["systemd",1]
> ["bzip2",1]
> ["util-linux",2]
>
> Output after change:
> ["buildroot",3]
> ["systemd",1]
> ["bzip2",0]
> ["util-linux",2]
>
> We can see in the "before" that the number of dependencies is
> monotonically increasing - specifically the bzip2 input is listed
> without dependencies but sows as having dependencies in the output.
> The "after" output shows 0 dependencoes for that component.
>
> Reviewed-by: Thomas Perale <thomas.perale@mind.be>
> Signed-off-by: Nevo Hed <nhed+buildroot@starry.com>
> ---
>  utils/generate-cyclonedx | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index a103b7b707..9d5451793d 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -337,7 +337,7 @@ def cyclonedx_vulnerabilities(show_info_dict):
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
> @@ -357,6 +357,8 @@ def br2_parse_deps_recursively(ref, show_info_dict,
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

--000000000000c2a5b70646e04895
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I sent an updated patch last night and not seeing it in pa=
tchworks<div><br></div><div>Not sure what I did=C2=A0 wrong or if there are=
 issues with patchworks (I did experience=C2=A0non-responsiveness=C2=A0toda=
y)</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Dec 25, 2025 at 11:15=E2=80=AFPM Nevo=
 Hed &lt;<a href=3D"mailto:nhed@starry.com">nhed@starry.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Nevo Hed &=
lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.com" target=3D"_blank">nhed+bu=
ildroot@starry.com</a>&gt;<br>
<br>
Having mutables as default args has unexpected behaviors.<br>
br2_parse_deps_recursively had a default arg `deps` initialized to the<br>
empty list (`[]`) except that on subsequent calls from `main` deps would<br=
>
already be populated from prior components.<br>
<br>
Reproduction details:<br>
<br>
$ python3 --version<br>
Python 3.13.7<br>
<br>
Run this script which<br>
=C2=A0 - Emits a very reduced set of a very theoretical `make show-info`.<b=
r>
=C2=A0 - Runs utils/generate-cyclonedx on that set as input.<br>
=C2=A0 - Reduces the generate-cyclonedx output to pairs of component name<b=
r>
=C2=A0 =C2=A0 and dependencies for that component.<br>
<br>
---<br>
function dummy_json_input {<br>
=C2=A0 =C2=A0 echo &#39;{<br>
=C2=A0 =C2=A0 =C2=A0 &quot;systemd&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;target&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;systemd&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;virtual&quot;: false,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: &quot;256.7&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dependencies&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;bzip2&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 &quot;bzip2&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;target&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;bzip2&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;virtual&quot;: false,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: &quot;1.0.8&quot;<br>
=C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 &quot;util-linux&quot;: {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;type&quot;: &quot;target&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;name&quot;: &quot;util-linux&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;virtual&quot;: false,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;version&quot;: &quot;2.40.2&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;dependencies&quot;: [<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;systemd&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ]<br>
=C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 }&#39;<br>
}<br>
<br>
dummy_json_input | \<br>
=C2=A0 =C2=A0 utils/generate-cyclonedx | \<br>
=C2=A0 =C2=A0 jq -c &#39;.dependencies[] | [.ref, (.dependsOn|length) ]&#39=
;<br>
---<br>
<br>
Output before change:<br>
[&quot;buildroot&quot;,3]<br>
[&quot;systemd&quot;,1]<br>
[&quot;bzip2&quot;,1]<br>
[&quot;util-linux&quot;,2]<br>
<br>
Output after change:<br>
[&quot;buildroot&quot;,3]<br>
[&quot;systemd&quot;,1]<br>
[&quot;bzip2&quot;,0]<br>
[&quot;util-linux&quot;,2]<br>
<br>
We can see in the &quot;before&quot; that the number of dependencies is<br>
monotonically increasing - specifically the bzip2 input is listed<br>
without dependencies but sows as having dependencies in the output.<br>
The &quot;after&quot; output shows 0 dependencoes for that component.<br>
<br>
Reviewed-by: Thomas Perale &lt;<a href=3D"mailto:thomas.perale@mind.be" tar=
get=3D"_blank">thomas.perale@mind.be</a>&gt;<br>
Signed-off-by: Nevo Hed &lt;<a href=3D"mailto:nhed%2Bbuildroot@starry.com" =
target=3D"_blank">nhed+buildroot@starry.com</a>&gt;<br>
---<br>
=C2=A0utils/generate-cyclonedx | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx<br>
index a103b7b707..9d5451793d 100755<br>
--- a/utils/generate-cyclonedx<br>
+++ b/utils/generate-cyclonedx<br>
@@ -337,7 +337,7 @@ def cyclonedx_vulnerabilities(show_info_dict):<br>
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
@@ -357,6 +357,8 @@ def br2_parse_deps_recursively(ref, show_info_dict, vir=
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

--000000000000c2a5b70646e04895--

--===============1200213681027203103==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1200213681027203103==--
