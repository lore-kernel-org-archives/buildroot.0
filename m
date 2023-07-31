Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8622C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 22:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BE9F40514;
	Mon, 31 Jul 2023 22:34:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BE9F40514
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fAaHoxp8-unx; Mon, 31 Jul 2023 22:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6B7440BAC;
	Mon, 31 Jul 2023 22:34:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6B7440BAC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 83E921BF2B8
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4003940BC7
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 22:34:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4003940BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id os7AtPOTqqX3 for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 22:34:00 +0000 (UTC)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A96AC40A07
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 22:33:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A96AC40A07
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5221cf2bb8cso7351988a12.1
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 15:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690842838; x=1691447638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOb/lWzwc4A6dySezCuxV1u+5swqupKVciLzKLcVGNg=;
 b=gIzC502gEjzW1Wjbq5C3PSggcUDSY18PeGleASUlJLncOF3uSlI+sHL6vAUq8WKyVP
 U3C0INgUnGBlCz5cAVuqg/9RbILCkjcE7GsE0GzZS70FHEUVUm0V1rq0B2xlrJFVCRFs
 lMwjpokAP0uaKI61xVkSNogBWIQzRncxSklDZYCaffMmnONMdLl5NjuzWHjG4Jlnax1K
 xtl4UPCA+iyJyYkbqkn9n7IIMN9WSpwAA+eRzqMk01jGycKippZl4sQ+Rq1yb5dCZ6oG
 8TWNeaSSEWyF/aWj/SKiSz6FpBpZ57IpqrSrlOF9qFdANKW2x8SczJjbrfJtVUE3KFBg
 fOAw==
X-Gm-Message-State: ABy/qLZyv15FXv1kuaa1HYnWqLrYlTuVSPFzoWSdxMm97KConiF4TVyD
 IPFgRwbGdEIA6RN0f46eLueEmFX1wYgJjmQig/i9gc2t
X-Google-Smtp-Source: APBJJlFFCloUf3ZGtSCAv0iccZjwera6NLdnc+jpUNuH9WCQMtqVvzLzIAcaCqiReYZOt/rFpv+bq7pMblgaFWd0roU=
X-Received: by 2002:aa7:c9c9:0:b0:51b:e4b4:8bb0 with SMTP id
 i9-20020aa7c9c9000000b0051be4b48bb0mr804322edt.2.1690842837404; Mon, 31 Jul
 2023 15:33:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230730173242.6669-1-vfazio@gmail.com>
 <20230731191402.1508702-1-vfazio@gmail.com>
 <20230801001839.58d7ecb1@windsurf>
In-Reply-To: <20230801001839.58d7ecb1@windsurf>
From: Vincent Fazio <vfazio@gmail.com>
Date: Mon, 31 Jul 2023 17:33:47 -0500
Message-ID: <CAOrEah4GkZiv-zBiP6UhrSA7xenZ=Y5RmbF7gXJ_H5enMLPD+g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690842838; x=1691447638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wOb/lWzwc4A6dySezCuxV1u+5swqupKVciLzKLcVGNg=;
 b=n8n8ayN+y9ZFzSGuCp++dm8FDGeWyXNABeKYTNg126d4RHpD+FECBEUUXcHcurUMq0
 uDHd5xgskBp9GcMF+nDMWAIJa3F1ki/ShWcrzy/Wq1ExnNipJjQng535psEgXGlhpPDL
 1sm+YnwZkc5X842Dh01fp71V1UQagtEn6/J7XVsE8yVESuqO6bvDMnbP//gtw4Wx8gD0
 A6K8jBFKMypsNvyyBjyVVW+c8AFBtI3wDck/5IGTaPLJo8/Oecxt7JW4Z4/WQesIMJh1
 v30FuwsmgOGy3Hb6zmjQseFcIdtkpOEHHXvJuQUTIpwr9ukBD7yVpG+Sn6izjISvft6f
 nt5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=n8n8ayN+
Subject: Re: [Buildroot] [PATCH v2 1/1] arch/Config.in.x86: add Intel and
 AMD GCC targets
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
Content-Type: multipart/mixed; boundary="===============2493845315100180165=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2493845315100180165==
Content-Type: multipart/alternative; boundary="000000000000b1ced60601d0068c"

--000000000000b1ced60601d0068c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thomas,

On Mon, Jul 31, 2023 at 5:18=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Vincent,
>
> On Mon, 31 Jul 2023 14:14:02 -0500
> Vincent Fazio <vfazio@gmail.com> wrote:
>
> > Sync the Intel and AMD CPU target list with GCC 13.
> >
> > Multiple references are used for flags and synonyms [0] [1] [2] [3].
> >
> > For Intel:
> >   Add Ivy Bridge, Sierra Forest, Grand Ridge, Knights Landing, Knights
> >   Mill, Granite Rapids, and Granite Rapids-D.
> >
> >   The Sapphire Rapids CPU target supports Emerald Rapids.
> >   The Alder Lake CPU target supports Raptor Lake and Meteor Lake.
> >
> >   Note: Knights Landing/Mills are based on Xeon Phi and do support
> >   some AVX512 extensions, but not the full subset required by
> >   BR2_X86_CPU_HAS_AVX512
> >
> > For AMD:
> >   Add Bobcat, Bulldozer, Piledriver, Excavator, and Zen 1-4.
> >
> > Add a comment to BR2_X86_CPU_HAS_AVX512 to explain the expected
> > extensions supported by the CPU. This flag was first selected by
> > skylake-avx512 and encompasses what appears to be a standard subset
> > across CPUs [3] and chapter 3 of the x86-64 psABI [4]:
> >   AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL
> >
> > CPUs selecting this flag should, at a minimum, support this subset of
> > AVX512 extensions.
> >
> > [0]: https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Options.html
> > [1]:
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain;f=3Dgcc/config/i386/i=
386.h;hb=3Drefs/tags/releases/gcc-13.2.0
> > [2]:
> https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain;f=3Dgcc/common/config=
/i386/i386-common.cc;hb=3Drefs/tags/releases/gcc-13.2.0
> > [3]: https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-512
> > [4]:
> https://gitlab.com/x86-psABIs/x86-64-ABI/-/raw/master/x86-64-ABI/low-leve=
l-sys-info.tex
> >
> > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> > ---
> > Changes v1 -> v2:
> >   - Clarify the BR2_X86_CPU_HAS_AVX512 comment (suggested by Thomas)
> >   - Flesh out the commit message with the additions made
> > ---
> >  arch/Config.in.x86 | 200 ++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 199 insertions(+), 1 deletion(-)
>
> Applied to master, thanks.
>
> Does this mean we can do:
>
> diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/
> qt6base.mk
> index e6cf4f14bb..7b520cdf3d 100644
> --- a/package/qt6/qt6base/qt6base.mk
> +++ b/package/qt6/qt6base/qt6base.mk
> @@ -53,9 +53,9 @@ QT6BASE_CONF_OPTS =3D \
>         -DFEATURE_system_zlib=3DON \
>         -DFEATURE_system_libb2=3DON
>
> -# x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it
> -# is not clear yet how it maps to all the avx512* options of Qt, so we
> -# for now keeps them disabled.
> +# x86 optimization options. AVX512F, AVX512BW, AVX512CD, AVX512DQ,
> +# AVX512VL are implied by BR2_X86_CPU_HAS_AVX512. We don't have
> +# options for the other AVX512 extensions.
>  QT6BASE_CONF_OPTS +=3D \
>         -DFEATURE_sse2=3D$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
>         -DFEATURE_sse3=3D$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
> @@ -64,16 +64,16 @@ QT6BASE_CONF_OPTS +=3D \
>         -DFEATURE_ssse3=3D$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF) \
>         -DFEATURE_avx=3D$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
>         -DFEATURE_avx2=3D$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
> -       -DFEATURE_avx512bw=3DOFF \
> -       -DFEATURE_avx512cd=3DOFF \
> -       -DFEATURE_avx512dq=3DOFF \
> +       -DFEATURE_avx512bw=3D$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
> +       -DFEATURE_avx512cd=3D$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
> +       -DFEATURE_avx512dq=3D$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
>         -DFEATURE_avx512er=3DOFF \
> -       -DFEATURE_avx512f=3DOFF \
> +       -DFEATURE_avx512f=3D$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
>         -DFEATURE_avx512ifma=3DOFF \
>         -DFEATURE_avx512pf=3DOFF \
>         -DFEATURE_avx512vbmi=3DOFF \
>         -DFEATURE_avx512vbmi2=3DOFF \
> -       -DFEATURE_avx512vl=3DOFF \
> +       -DFEATURE_avx512vl=3D$(if $(BR2_X86_CPU_HAS_AVX512),ON,OFF) \
>         -DFEATURE_vaes=3DOFF
>
>  define QT6BASE_BUILD_CMDS
>
>  ?
>
>
Yes, I expect this should work fine, though I have not personally tested.

Other packages may have AVX512 configure options, but those need to be
examined
closely to know what that package's assumptions are about available AVX512
extensions.


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

--000000000000b1ced60601d0068c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thomas,<br></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 31, 2023 at 5:18=E2=80=AFPM Th=
omas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.p=
etazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hello Vincent,<br>
<br>
On Mon, 31 Jul 2023 14:14:02 -0500<br>
Vincent Fazio &lt;<a href=3D"mailto:vfazio@gmail.com" target=3D"_blank">vfa=
zio@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Sync the Intel and AMD CPU target list with GCC 13.<br>
&gt; <br>
&gt; Multiple references are used for flags and synonyms [0] [1] [2] [3].<b=
r>
&gt; <br>
&gt; For Intel:<br>
&gt;=C2=A0 =C2=A0Add Ivy Bridge, Sierra Forest, Grand Ridge, Knights Landin=
g, Knights<br>
&gt;=C2=A0 =C2=A0Mill, Granite Rapids, and Granite Rapids-D.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0The Sapphire Rapids CPU target supports Emerald Rapids.<br=
>
&gt;=C2=A0 =C2=A0The Alder Lake CPU target supports Raptor Lake and Meteor =
Lake.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Note: Knights Landing/Mills are based on Xeon Phi and do s=
upport<br>
&gt;=C2=A0 =C2=A0some AVX512 extensions, but not the full subset required b=
y<br>
&gt;=C2=A0 =C2=A0BR2_X86_CPU_HAS_AVX512<br>
&gt; <br>
&gt; For AMD:<br>
&gt;=C2=A0 =C2=A0Add Bobcat, Bulldozer, Piledriver, Excavator, and Zen 1-4.=
<br>
&gt; <br>
&gt; Add a comment to BR2_X86_CPU_HAS_AVX512 to explain the expected<br>
&gt; extensions supported by the CPU. This flag was first selected by<br>
&gt; skylake-avx512 and encompasses what appears to be a standard subset<br=
>
&gt; across CPUs [3] and chapter 3 of the x86-64 psABI [4]:<br>
&gt;=C2=A0 =C2=A0AVX512F, AVX512BW, AVX512CD, AVX512DQ, AVX512VL<br>
&gt; <br>
&gt; CPUs selecting this flag should, at a minimum, support this subset of<=
br>
&gt; AVX512 extensions.<br>
&gt; <br>
&gt; [0]: <a href=3D"https://gcc.gnu.org/onlinedocs/gcc-13.2.0/gcc/x86-Opti=
ons.html" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/onlinedo=
cs/gcc-13.2.0/gcc/x86-Options.html</a><br>
&gt; [1]: <a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain;f=
=3Dgcc/config/i386/i386.h;hb=3Drefs/tags/releases/gcc-13.2.0" rel=3D"norefe=
rrer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain=
;f=3Dgcc/config/i386/i386.h;hb=3Drefs/tags/releases/gcc-13.2.0</a><br>
&gt; [2]: <a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dblob_plain;f=
=3Dgcc/common/config/i386/i386-common.cc;hb=3Drefs/tags/releases/gcc-13.2.0=
" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/git/?p=3Dgcc.git=
;a=3Dblob_plain;f=3Dgcc/common/config/i386/i386-common.cc;hb=3Drefs/tags/re=
leases/gcc-13.2.0</a><br>
&gt; [3]: <a href=3D"https://en.wikipedia.org/wiki/AVX-512#CPUs_with_AVX-51=
2" rel=3D"noreferrer" target=3D"_blank">https://en.wikipedia.org/wiki/AVX-5=
12#CPUs_with_AVX-512</a><br>
&gt; [4]: <a href=3D"https://gitlab.com/x86-psABIs/x86-64-ABI/-/raw/master/=
x86-64-ABI/low-level-sys-info.tex" rel=3D"noreferrer" target=3D"_blank">htt=
ps://gitlab.com/x86-psABIs/x86-64-ABI/-/raw/master/x86-64-ABI/low-level-sys=
-info.tex</a><br>
&gt; <br>
&gt; Signed-off-by: Vincent Fazio &lt;<a href=3D"mailto:vfazio@gmail.com" t=
arget=3D"_blank">vfazio@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; Changes v1 -&gt; v2:<br>
&gt;=C2=A0 =C2=A0- Clarify the BR2_X86_CPU_HAS_AVX512 comment (suggested by=
 Thomas)<br>
&gt;=C2=A0 =C2=A0- Flesh out the commit message with the additions made<br>
&gt; ---<br>
&gt;=C2=A0 arch/Config.in.x86 | 200 +++++++++++++++++++++++++++++++++++++++=
+++++-<br>
&gt;=C2=A0 1 file changed, 199 insertions(+), 1 deletion(-)<br>
<br>
Applied to master, thanks.<br>
<br>
Does this mean we can do:<br>
<br>
diff --git a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noref=
errer" target=3D"_blank">qt6base.mk</a> b/package/qt6/qt6base/<a href=3D"ht=
tp://qt6base.mk" rel=3D"noreferrer" target=3D"_blank">qt6base.mk</a><br>
index e6cf4f14bb..7b520cdf3d 100644<br>
--- a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
+++ b/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"noreferrer" =
target=3D"_blank">qt6base.mk</a><br>
@@ -53,9 +53,9 @@ QT6BASE_CONF_OPTS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_system_zlib=3DON \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_system_libb2=3DON<br>
<br>
-# x86 optimization options. While we have a BR2_X86_CPU_HAS_AVX512, it<br>
-# is not clear yet how it maps to all the avx512* options of Qt, so we<br>
-# for now keeps them disabled.<br>
+# x86 optimization options. AVX512F, AVX512BW, AVX512CD, AVX512DQ,<br>
+# AVX512VL are implied by BR2_X86_CPU_HAS_AVX512. We don&#39;t have<br>
+# options for the other AVX512 extensions.<br>
=C2=A0QT6BASE_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_sse2=3D$(if $(BR2_X86_CPU_HAS_SSE2),O=
N,OFF) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_sse3=3D$(if $(BR2_X86_CPU_HAS_SSE3),O=
N,OFF) \<br>
@@ -64,16 +64,16 @@ QT6BASE_CONF_OPTS +=3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_ssse3=3D$(if $(BR2_X86_CPU_HAS_SSSE3)=
,ON,OFF) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_avx=3D$(if $(BR2_X86_CPU_HAS_AVX),ON,=
OFF) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_avx2=3D$(if $(BR2_X86_CPU_HAS_AVX2),O=
N,OFF) \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512bw=3DOFF \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512cd=3DOFF \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512dq=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512bw=3D$(if $(BR2_X86_CPU_HAS_AVX=
512),ON,OFF) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512cd=3D$(if $(BR2_X86_CPU_HAS_AVX=
512),ON,OFF) \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512dq=3D$(if $(BR2_X86_CPU_HAS_AVX=
512),ON,OFF) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_avx512er=3DOFF \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512f=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512f=3D$(if $(BR2_X86_CPU_HAS_AVX5=
12),ON,OFF) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_avx512ifma=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_avx512pf=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_avx512vbmi=3DOFF \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_avx512vbmi2=3DOFF \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512vl=3DOFF \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0-DFEATURE_avx512vl=3D$(if $(BR2_X86_CPU_HAS_AVX=
512),ON,OFF) \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 -DFEATURE_vaes=3DOFF<br>
<br>
=C2=A0define QT6BASE_BUILD_CMDS<br>
<br>
=C2=A0?<br>
<br></blockquote><div><br></div><div>Yes, I expect this should work fine, t=
hough I have not personally tested.</div><div><br></div><div>Other packages=
 may have AVX512 configure options, but those need to be examined</div><div=
>closely to know what that package&#39;s assumptions are about available AV=
X512 extensions.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000b1ced60601d0068c--

--===============2493845315100180165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2493845315100180165==--
