Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30A0C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 15:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2437040339;
	Mon, 21 Nov 2022 15:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2437040339
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xxgvEDJFaUnK; Mon, 21 Nov 2022 15:08:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E410940332;
	Mon, 21 Nov 2022 15:08:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E410940332
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 195F51BF396
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 15:08:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3E1D40332
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 15:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3E1D40332
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8KqB9Uo8Htgu for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 15:08:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1244031C
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C1244031C
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 15:08:31 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id kt23so29189671ejc.7
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 07:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sPZIeNl2rjX6NFcTR9NSOhEmoTjWgYh/Y8xH1bx1ghA=;
 b=XuzYldAPb87b85PRwPaDTos5dz4Wao46DbSqASHETMiP4qEJdfXoWXnftwukhjDbcg
 8oMmc5gFPswmIYjvGB83g0KBGxBQMBSLgp5Yc7pp/3x1Kp7CvOrepzEqnrE9JqLmd3Bv
 3CeJ8WU8Kpx86MUiJoelETgXx+iE6V4efGkiCiCWDFWJBAqbYfGc6NIJ1FGlK8O0kIAd
 USe202TOm24J3GQWSDvCf2QMtP2Fnfan+1rPelKk6+kI4wYZf6o/e2ZmStpD2CuPZpm/
 X4QIGWRtjJwRghiFRyZgIvXtkMQzENjdldU/g6UIWrbHfS6x9YnXDJcPzNTZvYAC3lSI
 rEAQ==
X-Gm-Message-State: ANoB5pkMga+X0hQAaxogDAZOCzdyYlqbDqr2W6VHYZZBmkfb1ABzZy11
 07OSaPVV1cCCggiuz9xpKhp0u/a4PLRYVPtd
X-Google-Smtp-Source: AA0mqf6AopWWRSGqzHqy8hP+xQ4cRX0rFgwx0nc7sSvW+C9hoVBSR6lfMk61NrhzdJheWy/Xvqx9Fg==
X-Received: by 2002:a17:906:cb99:b0:7ad:e178:de59 with SMTP id
 mf25-20020a170906cb9900b007ade178de59mr15812551ejb.449.1669043309295; 
 Mon, 21 Nov 2022 07:08:29 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 o11-20020aa7d3cb000000b0046951b43e84sm2883311edr.55.2022.11.21.07.08.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 07:08:28 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id i10so29193438ejg.6
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 07:08:28 -0800 (PST)
X-Received: by 2002:a17:906:c042:b0:781:541:8f1d with SMTP id
 bm2-20020a170906c04200b0078105418f1dmr16269720ejb.117.1669043307875; Mon, 21
 Nov 2022 07:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20221006140754.46144-1-tianyuanhao3@163.com>
In-Reply-To: <20221006140754.46144-1-tianyuanhao3@163.com>
Date: Mon, 21 Nov 2022 07:08:16 -0800
X-Gmail-Original-Message-ID: <CA+h8R2pa8eLdFOTB_r1bEF+8tfvBY-3QXA-NbXuZFLruc-XhJg@mail.gmail.com>
Message-ID: <CA+h8R2pa8eLdFOTB_r1bEF+8tfvBY-3QXA-NbXuZFLruc-XhJg@mail.gmail.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paral.in; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sPZIeNl2rjX6NFcTR9NSOhEmoTjWgYh/Y8xH1bx1ghA=;
 b=WYGd3ZMDwNRfDXBwFfZ229BMvYPtvW8yY0cOSfxtfPlgpDiYyRO+o4st950CEXOnS4
 Uv1nDxMeZYNV1EW9Z5neawsRJm7cZFRqKZ1/OFN25EY4cXTZ/d6gN3VgqIwXfI4N9YKs
 Lw+Ghzywn65sXu4UL2RzmRv1gqmOjJ9+zU/3+UGfS7VUYjs9G22X7zHLuLGd4bzLkSYb
 AyaZkqZcryJdDJp4+ew9lBXT10aTns5yTS/NcJM93FEMhr67dQO6cpRNUQAg6iaoagFq
 aV7UHnNFBtjHE6Gycy1OSP2KZEDJYJHqUSCfINDDa3ufkEy1qiFy4hr6dTWQDFhQrgN2
 z1Hg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=paral.in header.i=@paral.in
 header.a=rsa-sha256 header.s=google header.b=WYGd3ZMD
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: support crun as runtime
 in containerd
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5489749226072040355=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5489749226072040355==
Content-Type: multipart/alternative; boundary="0000000000007b142e05edfc6d6a"

--0000000000007b142e05edfc6d6a
Content-Type: text/plain; charset="UTF-8"

Hi all,

On Thu, Oct 6, 2022, 7:08 AM TIAN Yuanhao <tianyuanhao3@163.com> wrote:

> Create runc symlink to crun when runc is missing.
>
> See: https://github.com/containerd/containerd/discussions/6162
>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/containerd/Config.in | 2 +-
>  package/crun/crun.mk         | 7 +++++++
>  2 files changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/package/containerd/Config.in b/package/containerd/Config.in
> index 0e3a55ef39..e69dd6768a 100644
> --- a/package/containerd/Config.in
> +++ b/package/containerd/Config.in
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_CONTAINERD
>         depends on BR2_TOOLCHAIN_HAS_THREADS
>         depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc
>         depends on BR2_USE_MMU # util-linux
> -       select BR2_PACKAGE_RUNC # runtime dependency
> +       select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # runtime dependency
>         select BR2_PACKAGE_UTIL_LINUX # runtime dependency
>         select BR2_PACKAGE_UTIL_LINUX_BINARIES
>         select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
> diff --git a/package/crun/crun.mk b/package/crun/crun.mk
> index 4a0c150594..19dda71a9f 100644
> --- a/package/crun/crun.mk
> +++ b/package/crun/crun.mk
> @@ -36,4 +36,11 @@ else
>  CRUN_CONF_OPTS += --disable-systemd
>  endif
>
> +ifeq ($(BR2_PACKAGE_RUNC),)
> +define CRUN_CREATE_SYMLINK
> +       ln -sf crun $(TARGET_DIR)/usr/bin/runc
> +endef
> +CRUN_POST_INSTALL_TARGET_HOOKS += CRUN_CREATE_SYMLINK
> +endif
> +
>  $(eval $(autotools-package))
> --
> 2.25.1
>

Reviewed-by: Christian Stewart <christian@paral.in>

Thanks!

>
>

--0000000000007b142e05edfc6d6a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi all,<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Thu, Oct 6, 2022, 7:08 AM TIAN Yuanhao &lt=
;<a href=3D"mailto:tianyuanhao3@163.com">tianyuanhao3@163.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Create runc symlink to crun when =
runc is missing.<br>
<br>
See: <a href=3D"https://github.com/containerd/containerd/discussions/6162" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/containe=
rd/containerd/discussions/6162</a><br>
<br>
Signed-off-by: TIAN Yuanhao &lt;<a href=3D"mailto:tianyuanhao3@163.com" tar=
get=3D"_blank" rel=3D"noreferrer">tianyuanhao3@163.com</a>&gt;<br>
---<br>
=C2=A0package/containerd/Config.in | 2 +-<br>
=C2=A0package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">crun.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 7 +++++++=
<br>
=C2=A02 files changed, 8 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/package/containerd/Config.in b/package/containerd/Config.in<br=
>
index 0e3a55ef39..e69dd6768a 100644<br>
--- a/package/containerd/Config.in<br>
+++ b/package/containerd/Config.in<br>
@@ -5,7 +5,7 @@ config BR2_PACKAGE_CONTAINERD<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_HAS_THREADS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !BR2_TOOLCHAIN_USES_UCLIBC # runc<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_USE_MMU # util-linux<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_RUNC # runtime dependency<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_RUNC if !BR2_PACKAGE_CRUN # =
runtime dependency<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_UTIL_LINUX # runtime depende=
ncy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_UTIL_LINUX_BINARIES<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT<br>
diff --git a/package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer nore=
ferrer" target=3D"_blank">crun.mk</a> b/package/crun/<a href=3D"http://crun=
.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">crun.mk</a><br>
index 4a0c150594..19dda71a9f 100644<br>
--- a/package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">crun.mk</a><br>
+++ b/package/crun/<a href=3D"http://crun.mk" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">crun.mk</a><br>
@@ -36,4 +36,11 @@ else<br>
=C2=A0CRUN_CONF_OPTS +=3D --disable-systemd<br>
=C2=A0endif<br>
<br>
+ifeq ($(BR2_PACKAGE_RUNC),)<br>
+define CRUN_CREATE_SYMLINK<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ln -sf crun $(TARGET_DIR)/usr/bin/runc<br>
+endef<br>
+CRUN_POST_INSTALL_TARGET_HOOKS +=3D CRUN_CREATE_SYMLINK<br>
+endif<br>
+<br>
=C2=A0$(eval $(autotools-package))<br>
-- <br>
2.25.1<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Reviewed-by: Christian Stewart &lt;<a href=3D"mailto:christian@paral.=
in">christian@paral.in</a>&gt;</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">Thanks!</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
</blockquote></div></div></div>

--0000000000007b142e05edfc6d6a--

--===============5489749226072040355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5489749226072040355==--
