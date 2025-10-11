Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D400CCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 08:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA5CF40567;
	Sat, 11 Oct 2025 08:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a9lh8PDfyHtw; Sat, 11 Oct 2025 08:57:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A6440558
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28A6440558;
	Sat, 11 Oct 2025 08:57:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16315119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 08:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0707E606D9
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 08:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDMr9mgleH_Z for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 08:57:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.219.47;
 helo=mail-qv1-f47.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D99D3606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D99D3606A9
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D99D3606A9
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 08:57:05 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id
 6a1803df08f44-7900f7f4ba9so30686916d6.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 01:57:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760173024; x=1760777824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ibh02DOdcK4VHZ7E5voCoCdzvzB/zecRrAqusZ6XChs=;
 b=F11VyQn3EmBW9M0IKP6eVAlgbHZY74KMqU3QQcrBJJS+7sv1Evv3YSnfRQA0t/RMq1
 SXpZ2YI8t4hUjmOi9Z1eFhO5mQy/3OKFbs+BR1p+bNavcfUN08Qce0MB3wnKUKlE+y8M
 UW/f7pKbzQosliitafHwX/L1yHDsJhn3t3k5hAftvuS2bjWFkQK4FdI0ybogl+UQzR9g
 AjEDf5k2MnunctQA04q2g9FhKX0Mv+blUpb5Fta+0vCKsplKK9XeBy/O1iFyGX7ec/8A
 6GYf+6GKgYyPQzRI7VLrHQEeOuckEaQd9OQ+T9br+Iibgjzkhr2buk//sz0V0hEqCfze
 z5QA==
X-Gm-Message-State: AOJu0YxYI2kjRd2TAR46sWOrE7+nCK19u4Kqy0e+qynfTwLNV/P1lyim
 nfUObSLeZ2VELFiexzeLieZXenf43wgFsj8OhNJWBHyL5AsF4qVzLa4QQQlkXvx8SsE=
X-Gm-Gg: ASbGncvD7BhHrkieUw1nGUmbyn11Ivsof8NVfa0fofNxQ34aITeBoITNJ1cfOfQLX8M
 XSSLrhn5EBx9IsQAoMJ650NgZ/JfmjSXjR/6PoZYkqqrwMPnTxg8Q8i69OoHlfAVCAnBEcXUTps
 RomIY3XZoeI9IzlKUr+XoH1N4q0k5ADFCs/NuQhpF7FJgLGS0wBEuGgdVWfO9uBJqSzMXaNUK9P
 nqFtMqcj2b3c28U/SgE4zdD3YAJrk4w59BB8ZZy7gKR+0CuH7zPJDM5uqV+AhykjaXZFg1MA16M
 vegXl98Iux3U8YuBABU55QOBx8/k4DIO5pSNYiBR9fgqCF7p3R9HhJklHVAMSg802+WNMbGSPxm
 9DhA+tXXhIDrRamlbeelOjrcJ8cjLw2v2AJ4A0xO9ZJVCHPPSZHZWdO9Gxdxq8AD58icU8XkwiS
 DdKPeYNRBvPJ7qGRKOjLt19NIOXodMclZNIp0/WEpH12PwOmZQr6uFHLfE1kffVo659vHd5eeaT
 Q==
X-Google-Smtp-Source: AGHT+IGjIcSmnQ4qbqZ9Q7thHv3OaKI9VCa0mRM6hXVmK22es6hs0Lw+oigSbvkT7ig/Fyw7wGo+BQ==
X-Received: by 2002:a05:622a:1e14:b0:4b5:d932:15c5 with SMTP id
 d75a77b69052e-4e6eacf99b3mr209012101cf.25.1760173024091; 
 Sat, 11 Oct 2025 01:57:04 -0700 (PDT)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com.
 [209.85.219.42]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4e706d5e59esm35124461cf.25.2025.10.11.01.57.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Oct 2025 01:57:03 -0700 (PDT)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-7900f7f4ba9so30686746d6.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 01:57:03 -0700 (PDT)
X-Received: by 2002:a05:6214:20af:b0:7ee:aaf0:b759 with SMTP id
 6a1803df08f44-87b20ff9d6fmr209520296d6.7.1760173023436; Sat, 11 Oct 2025
 01:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250930080750.353542-1-thomas@devoogdt.com>
In-Reply-To: <20250930080750.353542-1-thomas@devoogdt.com>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Sat, 11 Oct 2025 10:56:53 +0200
X-Gmail-Original-Message-ID: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
X-Gm-Features: AS18NWCeR34acK0rIQrVR1y05ld2bvzJ3p8o1nWTaRO3QjHoRX261oA7ihkpS6Y
Message-ID: <CACXRmJitiNM=oBYeGc2C40vP=wRYaaYJjiGMN7siwTWJ=vWPwQ@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [PATCH v5 1/3] package/pkg-cargo: add support to
 bundle a custom Cargo.lock file
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Guillaume Chaye <guillaume.chaye@zeetim.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7421840745692343016=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7421840745692343016==
Content-Type: multipart/alternative; boundary="000000000000ce272f0640de37d9"

--000000000000ce272f0640de37d9
Content-Type: text/plain; charset="UTF-8"

Hi all,


I just see that I made a typo.

+ rm -f "${lockfile}"

It's obviously not the new file that should be removed, but the the
existing Cargo.lock file.

I will push a new update when I have time, or take it into account when
applying the patch. Thanks.


Kind regards

Thomas Devoogdt


Op di 30 sep 2025, 10:07 schreef Thomas Devoogdt <thomas@devoogdt.com>:

> E.g. https://github.com/lu-zero/cargo-c/releases/tag/v0.10.15
>
> Cargo-c releases a separate Cargo.lock file, but doesn't bundle
> one in its normal .tar.gz code source target.
>
> We can't use extra downloads/patches/... as cargo is a vendored
> package, which is done quite early in the chain.
>
> This patch allows us to define a custom Cargo.lock source.
> Both a local bundled file and remote (only wget) file can be linked.
>
> Usage:
>
> <PKG>_CARGO_LOCK_FILE = <PKG>_PKGDIR/Cargo.lock
>
> <PKG>_CARGO_LOCK_FILE = https://.../Cargo.lock
>
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
> ---
> Superseeds
> https://patchwork.ozlabs.org/project/buildroot/patch/20250324173246.100112-1-guillaume.chaye@zeetim.com/.
> v2
> <https://patchwork.ozlabs.org/project/buildroot/patch/20250324173246.100112-1-guillaume.chaye@zeetim.com/.v2>:
> no change
> v3: no change
> v4: no change
> v4: no change
> ---
>  package/pkg-cargo.mk                |  5 +++++
>  support/download/cargo-post-process | 14 +++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> index 47a6353f25..626e5ea472 100644
> --- a/package/pkg-cargo.mk
> +++ b/package/pkg-cargo.mk
> @@ -195,6 +195,11 @@ ifneq ($$($(2)_SUBDIR),)
>  $(2)_DOWNLOAD_POST_PROCESS_OPTS += -m$$($(2)_SUBDIR)/Cargo.toml
>  endif
>
> +# Allow to download a custom Cargo.lock file.
> +ifneq ($$($(3)_CARGO_LOCK_FILE),)
> +$(2)_DOWNLOAD_POST_PROCESS_OPTS += -l$$($(3)_CARGO_LOCK_FILE)
> +endif
> +
>  # Because we append vendored info, we can't rely on the values being empty
>  # once we eventually get into the generic-package infra. So, we duplicate
>  # the heuristics here
> diff --git a/support/download/cargo-post-process
> b/support/download/cargo-post-process
> index b0e59ad74d..7913724fe2 100755
> --- a/support/download/cargo-post-process
> +++ b/support/download/cargo-post-process
> @@ -11,11 +11,12 @@ if [ "${BR_CARGO_MANIFEST_PATH}" ]; then
>  fi
>
>  manifest=Cargo.toml
> -while getopts "n:o:m:" OPT; do
> +while getopts "n:o:m:l:" OPT; do
>      case "${OPT}" in
>      o)  output="${OPTARG}";;
>      n)  base_name="${OPTARG}";;
>      m)  manifest="${OPTARG}";;
> +    l)  lockfile="${OPTARG}";;
>      :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
>      \?) error "unknown option '%s'\n" "${OPTARG}";;
>      esac
> @@ -31,6 +32,17 @@ post_process_unpack "${base_name}" "${output}"
>  # Do the Cargo vendoring
>  pushd "${base_name}" > /dev/null
>
> +# Copy the custom lockfile path if given
> +# TODO: use --lockfile-path once stable
> +if [ -n "${lockfile}" ] ; then
> +    rm -f "${lockfile}"
> +    if [ -f "${lockfile}" ] ; then
> +        cp "${lockfile}" Cargo.lock
> +    else
> +        ${WGET} "${lockfile}" -O Cargo.lock
> +    fi
> +fi
> +
>  # Create the local .cargo/config.toml with vendor info
>  mkdir -p .cargo/
>  mkdir -p "${CARGO_HOME}"
> --
> 2.43.0
>
>

--000000000000ce272f0640de37d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi all,<div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I just see that I made a typo.=C2=A0</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">+    rm -f &quot;${lockfile}&quot=
;</div><div dir=3D"auto"><br></div><div dir=3D"auto">It&#39;s obviously not=
 the new file that should be removed, but the the existing Cargo.lock file.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">I will push a new=
 update when I have time, or take it into account when applying the patch. =
Thanks.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Kind regards=C2=A0</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Thomas Devoogdt=C2=A0</div><br><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Op di 30 sep 20=
25, 10:07 schreef Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com=
">thomas@devoogdt.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">E.g.=
 <a href=3D"https://github.com/lu-zero/cargo-c/releases/tag/v0.10.15" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/lu-zero/car=
go-c/releases/tag/v0.10.15</a><br>
<br>
Cargo-c releases a separate Cargo.lock file, but doesn&#39;t bundle<br>
one in its normal .tar.gz code source target.<br>
<br>
We can&#39;t use extra downloads/patches/... as cargo is a vendored<br>
package, which is done quite early in the chain.<br>
<br>
This patch allows us to define a custom Cargo.lock source.<br>
Both a local bundled file and remote (only wget) file can be linked.<br>
<br>
Usage:<br>
<br>
&lt;PKG&gt;_CARGO_LOCK_FILE =3D &lt;PKG&gt;_PKGDIR/Cargo.lock<br>
<br>
&lt;PKG&gt;_CARGO_LOCK_FILE =3D https://.../Cargo.lock<br>
<br>
Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas@devoogdt.com" t=
arget=3D"_blank" rel=3D"noreferrer">thomas@devoogdt.com</a>&gt;<br>
---<br>
Superseeds <a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/=
20250324173246.100112-1-guillaume.chaye@zeetim.com/.v2" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">https://patchwork.ozlabs.org/project/buildroot=
/patch/20250324173246.100112-1-guillaume.chaye@zeetim.com/.<br>
v2</a>: no change<br>
v3: no change<br>
v4: no change<br>
v4: no change<br>
---<br>
=C2=A0package/<a href=3D"http://pkg-cargo.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">pkg-cargo.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 5 +++++<br>
=C2=A0support/download/cargo-post-process | 14 +++++++++++++-<br>
=C2=A02 files changed, 18 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/package/<a href=3D"http://pkg-cargo.mk" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">pkg-cargo.mk</a> b/package/<a href=3D"http://pkg-=
cargo.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">pkg-cargo.mk</a><=
br>
index 47a6353f25..626e5ea472 100644<br>
--- a/package/<a href=3D"http://pkg-cargo.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">pkg-cargo.mk</a><br>
+++ b/package/<a href=3D"http://pkg-cargo.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">pkg-cargo.mk</a><br>
@@ -195,6 +195,11 @@ ifneq ($$($(2)_SUBDIR),)<br>
=C2=A0$(2)_DOWNLOAD_POST_PROCESS_OPTS +=3D -m$$($(2)_SUBDIR)/Cargo.toml<br>
=C2=A0endif<br>
<br>
+# Allow to download a custom Cargo.lock file.<br>
+ifneq ($$($(3)_CARGO_LOCK_FILE),)<br>
+$(2)_DOWNLOAD_POST_PROCESS_OPTS +=3D -l$$($(3)_CARGO_LOCK_FILE)<br>
+endif<br>
+<br>
=C2=A0# Because we append vendored info, we can&#39;t rely on the values be=
ing empty<br>
=C2=A0# once we eventually get into the generic-package infra. So, we dupli=
cate<br>
=C2=A0# the heuristics here<br>
diff --git a/support/download/cargo-post-process b/support/download/cargo-p=
ost-process<br>
index b0e59ad74d..7913724fe2 100755<br>
--- a/support/download/cargo-post-process<br>
+++ b/support/download/cargo-post-process<br>
@@ -11,11 +11,12 @@ if [ &quot;${BR_CARGO_MANIFEST_PATH}&quot; ]; then<br>
=C2=A0fi<br>
<br>
=C2=A0manifest=3DCargo.toml<br>
-while getopts &quot;n:o:m:&quot; OPT; do<br>
+while getopts &quot;n:o:m:l:&quot; OPT; do<br>
=C2=A0 =C2=A0 =C2=A0case &quot;${OPT}&quot; in<br>
=C2=A0 =C2=A0 =C2=A0o)=C2=A0 output=3D&quot;${OPTARG}&quot;;;<br>
=C2=A0 =C2=A0 =C2=A0n)=C2=A0 base_name=3D&quot;${OPTARG}&quot;;;<br>
=C2=A0 =C2=A0 =C2=A0m)=C2=A0 manifest=3D&quot;${OPTARG}&quot;;;<br>
+=C2=A0 =C2=A0 l)=C2=A0 lockfile=3D&quot;${OPTARG}&quot;;;<br>
=C2=A0 =C2=A0 =C2=A0:)=C2=A0 error &quot;option &#39;%s&#39; expects a mand=
atory argument\n&quot; &quot;${OPTARG}&quot;;;<br>
=C2=A0 =C2=A0 =C2=A0\?) error &quot;unknown option &#39;%s&#39;\n&quot; &qu=
ot;${OPTARG}&quot;;;<br>
=C2=A0 =C2=A0 =C2=A0esac<br>
@@ -31,6 +32,17 @@ post_process_unpack &quot;${base_name}&quot; &quot;${out=
put}&quot;<br>
=C2=A0# Do the Cargo vendoring<br>
=C2=A0pushd &quot;${base_name}&quot; &gt; /dev/null<br>
<br>
+# Copy the custom lockfile path if given<br>
+# TODO: use --lockfile-path once stable<br>
+if [ -n &quot;${lockfile}&quot; ] ; then<br>
+=C2=A0 =C2=A0 rm -f &quot;${lockfile}&quot;<br>
+=C2=A0 =C2=A0 if [ -f &quot;${lockfile}&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp &quot;${lockfile}&quot; Cargo.lock<br>
+=C2=A0 =C2=A0 else<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${WGET} &quot;${lockfile}&quot; -O Cargo.lock<=
br>
+=C2=A0 =C2=A0 fi<br>
+fi<br>
+<br>
=C2=A0# Create the local .cargo/config.toml with vendor info<br>
=C2=A0mkdir -p .cargo/<br>
=C2=A0mkdir -p &quot;${CARGO_HOME}&quot;<br>
-- <br>
2.43.0<br>
<br>
</blockquote></div></div></div>

--000000000000ce272f0640de37d9--

--===============7421840745692343016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7421840745692343016==--
