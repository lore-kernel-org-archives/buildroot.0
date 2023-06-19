Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCEBEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 19:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 002FE401F3;
	Mon, 19 Jun 2023 19:55:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 002FE401F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lTxukn9WPRAJ; Mon, 19 Jun 2023 19:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2186403C0;
	Mon, 19 Jun 2023 19:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2186403C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2BD481BF2E4
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0571761290
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 19:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0571761290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8lvvF_sTK2pJ for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 19:55:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87AC761289
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87AC761289
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 19:55:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f8777caaa1so700515e87.3
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 12:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687204520; x=1689796520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lu3hcUqmewPwzMEkSzwMVFTZRRTYUwsLivfYQ9fnlEg=;
 b=Z/Pgfz1LQ+tuP5jmzZ0QLZqUTXXz6OPVsEauMh93mhMCXu0vIy9OOJV48U8vzOgIq8
 8CcePTeFYSQH08xVxsBp0Msv1p+K6SPulwVKC+zSLgg+0BF5zWVtW/dFVipMP6FkLTXj
 sa/IvawGFt221eDDiqf63e8h2JDktmpE2Xm8eBH0esiNqsIO7JSLPsBJgC51C8FNVKzM
 NoLCpwI8/ktgjGcOlpvVY+mo2GdXwrI+2yTD+9Epkkv3swJwGylCaHpjpx/b+EdtGRh6
 RXKCRM63fORqCg1iGzNfCVdf7bIFmxm0LpfImecKO5B+qO1j4lh046/qlL/Ai2QVfZUB
 CRRw==
X-Gm-Message-State: AC+VfDw/PdIiWmmLzzi8TzdzxKap37VzD0ZvtRwTMbEGUjH+ALBKZRoF
 Fw/LdMaKGbLCxHgIqbqd/cXOXrLGPI9Jkwtb2xE=
X-Google-Smtp-Source: ACHHUZ4M+D9g1M1veQhDIqa4pyWJVTke5eGjR9iioxVfIqSMghaa1GMXdd8ZKs/msdDYlhGpyJ35xpSfVaaz8z/Ox28=
X-Received: by 2002:a19:8c55:0:b0:4f8:770f:1b08 with SMTP id
 i21-20020a198c55000000b004f8770f1b08mr842109lfj.13.1687204520115; Mon, 19 Jun
 2023 12:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230619181458.1596060-1-bernd@kuhls.net>
 <20230619181458.1596060-2-bernd@kuhls.net>
In-Reply-To: <20230619181458.1596060-2-bernd@kuhls.net>
From: Chris Packham <judge.packham@gmail.com>
Date: Tue, 20 Jun 2023 07:55:08 +1200
Message-ID: <CAFOYHZBSkfLS=e699AWeathxXH+ds_Fj=ABgQt3O3yXBUYG1TQ@mail.gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687204520; x=1689796520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lu3hcUqmewPwzMEkSzwMVFTZRRTYUwsLivfYQ9fnlEg=;
 b=LoCeCpphzsTK2FoWcHTKfd2bB8L5I/IczXrgGHL/S1fCsf3d7Uj86ka7tPe6Z5PwGX
 FvtT4af0LTEDtnldviPJGmjsyZ9R7lZhDGdYj0sO3LiiWBoKxksew4/0/v21ZTTPP8aU
 jRQmjHg/8WwuJma+oRxQuLqeZmOC+JJYoAjytz+298UwWv9P9PPfY374FS12FjWQzGll
 8IxHw03QSUp8JfDIWbGAPDctyn3S44i/fm95qrcZJkMnoFkj1+/dZLwrrXWcd8yHnNNR
 DPDN6TgZBIFOHfZT105XODvddmlCpCAAK9+gR4q43/Dvw4yG4qXFxnWVX+gi8Hsayml7
 YD2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=LoCeCpph
Subject: Re: [Buildroot] [PATCH 2/2] package/syslog-ng: bump version to 4.2.0
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2196411494530752441=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2196411494530752441==
Content-Type: multipart/alternative; boundary="00000000000015c30d05fe80eab4"

--00000000000015c30d05fe80eab4
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Jun 2023, 6:15 am Bernd Kuhls, <bernd@kuhls.net> wrote:

> Updated upstream URL of patch file.
>
> Release notes:
> https://axoflow.com/axosyslog-release-4-2/
> https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.2.0
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>

Reviewed-by: Chris Packham <judge.packham@gmail.com>

> ---
>  .checkpackageignore                              | 1 -
>  package/syslog-ng/0001-fix-build-on-uclibc.patch | 3 ++-
>  package/syslog-ng/syslog-ng.conf                 | 2 +-
>  package/syslog-ng/syslog-ng.hash                 | 2 +-
>  package/syslog-ng/syslog-ng.mk                   | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/.checkpackageignore b/.checkpackageignore
> index c78168e5ea..36ab2845d7 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1483,7 +1483,6 @@
> package/suricata/0002-configure.ac-allow-the-user-to-override-RUST_TARGET.patch
>  package/suricata/S99suricata Shellcheck
>  package/swupdate/swupdate.sh Shellcheck
>  package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
> Upstream
> -package/syslog-ng/0001-fix-build-on-uclibc.patch Upstream
>  package/sysprof/0001-define-NT_GNU_BUILD_ID.patch Upstream
>  package/sysrepo/S51sysrepo-plugind Indent Shellcheck
>  package/system-config-printer/0001-Add-option-to-disable-xmlto-manual-generation.patch
> Upstream
> diff --git a/package/syslog-ng/0001-fix-build-on-uclibc.patch
> b/package/syslog-ng/0001-fix-build-on-uclibc.patch
> index dbb9b66b5c..07c3f0721c 100644
> --- a/package/syslog-ng/0001-fix-build-on-uclibc.patch
> +++ b/package/syslog-ng/0001-fix-build-on-uclibc.patch
> @@ -9,8 +9,9 @@ pthread_spin_trylock so check for this function before
> using it
>  Fixes:
>   -
> http://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463d1b
>
> +Upstream: https://github.com/buytenh/ivykis/pull/22
> +
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/buytenh/ivykis/pull/17]
>  ---
>   configure.ac   | 3 +++
>   src/spinlock.h | 4 ++++
> diff --git a/package/syslog-ng/syslog-ng.conf
> b/package/syslog-ng/syslog-ng.conf
> index f4b74dc8c1..a3cfa8dacf 100644
> --- a/package/syslog-ng/syslog-ng.conf
> +++ b/package/syslog-ng/syslog-ng.conf
> @@ -1,4 +1,4 @@
> -@version: 4.1
> +@version: 4.2
>
>  source s_sys {
>         file("/proc/kmsg" program_override("kernel"));
> diff --git a/package/syslog-ng/syslog-ng.hash
> b/package/syslog-ng/syslog-ng.hash
> index 8ab4d5ac3b..a917331580 100644
> --- a/package/syslog-ng/syslog-ng.hash
> +++ b/package/syslog-ng/syslog-ng.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  d7df3cfa32d1a750818d94b8ea582dea54c37226e7b55a88c3d2f3a543d8f20e
> syslog-ng-4.1.1.tar.gz
> +sha256  092bd17fd47002c988aebdf81d0ed3f3cfd0e82b388d2453bcaa5e67934f4dda
> syslog-ng-4.2.0.tar.gz
>  sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd
> COPYING
>  sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2
> GPL.txt
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551
> LGPL.txt
> diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/
> syslog-ng.mk
> index ecc8eeddce..39433185b4 100644
> --- a/package/syslog-ng/syslog-ng.mk
> +++ b/package/syslog-ng/syslog-ng.mk
> @@ -6,7 +6,7 @@
>
>  # When updating the version, please check at runtime if the version in
>  # syslog-ng.conf header needs to be updated
> -SYSLOG_NG_VERSION = 4.1.1
> +SYSLOG_NG_VERSION = 4.2.0
>  SYSLOG_NG_SITE =
> https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
>  SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
>  SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
> --
> 2.39.2
>
>

--00000000000015c30d05fe80eab4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 20 Jun 2023, 6:15 am Bernd Kuhls, &lt;<a href=
=3D"mailto:bernd@kuhls.net">bernd@kuhls.net</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">Updated upstream URL of patch file.<br>
<br>
Release notes:<br>
<a href=3D"https://axoflow.com/axosyslog-release-4-2/" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://axoflow.com/axosyslog-release-4-2/</a><=
br>
<a href=3D"https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.=
2.0" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/sys=
log-ng/syslog-ng/releases/tag/syslog-ng-4.2.0</a><br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" target=3D=
"_blank" rel=3D"noreferrer">bernd@kuhls.net</a>&gt;<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">Reviewed-by: Chris Packh=
am &lt;<a href=3D"mailto:judge.packham@gmail.com">judge.packham@gmail.com</=
a>&gt;</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
---<br>
=C2=A0.checkpackageignore=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
=C2=A0package/syslog-ng/0001-fix-build-on-uclibc.patch | 3 ++-<br>
=C2=A0package/syslog-ng/syslog-ng.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0package/syslog-ng/syslog-ng.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">syslog-ng.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A05 files changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/.checkpackageignore b/.checkpackageignore<br>
index c78168e5ea..36ab2845d7 100644<br>
--- a/.checkpackageignore<br>
+++ b/.checkpackageignore<br>
@@ -1483,7 +1483,6 @@ package/suricata/0002-configure.ac-allow-the-user-to-=
override-RUST_TARGET.patch<br>
=C2=A0package/suricata/S99suricata Shellcheck<br>
=C2=A0package/swupdate/swupdate.sh Shellcheck<br>
=C2=A0package/sylpheed/0001-harden-link-checker-before-accepting-click.patc=
h Upstream<br>
-package/syslog-ng/0001-fix-build-on-uclibc.patch Upstream<br>
=C2=A0package/sysprof/0001-define-NT_GNU_BUILD_ID.patch Upstream<br>
=C2=A0package/sysrepo/S51sysrepo-plugind Indent Shellcheck<br>
=C2=A0package/system-config-printer/0001-Add-option-to-disable-xmlto-manual=
-generation.patch Upstream<br>
diff --git a/package/syslog-ng/0001-fix-build-on-uclibc.patch b/package/sys=
log-ng/0001-fix-build-on-uclibc.patch<br>
index dbb9b66b5c..07c3f0721c 100644<br>
--- a/package/syslog-ng/0001-fix-build-on-uclibc.patch<br>
+++ b/package/syslog-ng/0001-fix-build-on-uclibc.patch<br>
@@ -9,8 +9,9 @@ pthread_spin_trylock so check for this function before usin=
g it<br>
=C2=A0Fixes:<br>
=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/0a6de11c030a4f39=
e402917809fc6d33fb463d1b" rel=3D"noreferrer noreferrer" target=3D"_blank">h=
ttp://autobuild.buildroot.org/results/0a6de11c030a4f39e402917809fc6d33fb463=
d1b</a><br>
<br>
+Upstream: <a href=3D"https://github.com/buytenh/ivykis/pull/22" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">https://github.com/buytenh/ivykis/pul=
l/22</a><br>
+<br>
=C2=A0Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabric=
e@gmail.com" target=3D"_blank" rel=3D"noreferrer">fontaine.fabrice@gmail.co=
m</a>&gt;<br>
-[Upstream status: <a href=3D"https://github.com/buytenh/ivykis/pull/17" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/buytenh/iv=
ykis/pull/17</a>]<br>
=C2=A0---<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer noreferrer" target=
=3D"_blank">configure.ac</a>=C2=A0 =C2=A0| 3 +++<br>
=C2=A0 src/spinlock.h | 4 ++++<br>
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng=
.conf<br>
index f4b74dc8c1..a3cfa8dacf 100644<br>
--- a/package/syslog-ng/syslog-ng.conf<br>
+++ b/package/syslog-ng/syslog-ng.conf<br>
@@ -1,4 +1,4 @@<br>
-@version: 4.1<br>
+@version: 4.2<br>
<br>
=C2=A0source s_sys {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 file(&quot;/proc/kmsg&quot; program_override(&q=
uot;kernel&quot;));<br>
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng=
.hash<br>
index 8ab4d5ac3b..a917331580 100644<br>
--- a/package/syslog-ng/syslog-ng.hash<br>
+++ b/package/syslog-ng/syslog-ng.hash<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# Locally computed<br>
-sha256=C2=A0 d7df3cfa32d1a750818d94b8ea582dea54c37226e7b55a88c3d2f3a543d8f=
20e=C2=A0 syslog-ng-4.1.1.tar.gz<br>
+sha256=C2=A0 092bd17fd47002c988aebdf81d0ed3f3cfd0e82b388d2453bcaa5e67934f4=
dda=C2=A0 syslog-ng-4.2.0.tar.gz<br>
=C2=A0sha256=C2=A0 c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715d=
ae3ca9bd=C2=A0 COPYING<br>
=C2=A0sha256=C2=A0 ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd3=
9db1e1d2=C2=A0 GPL.txt<br>
=C2=A0sha256=C2=A0 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab=
032fe551=C2=A0 LGPL.txt<br>
diff --git a/package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"noref=
errer noreferrer" target=3D"_blank">syslog-ng.mk</a> b/package/syslog-ng/<a=
 href=3D"http://syslog-ng.mk" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">syslog-ng.mk</a><br>
index ecc8eeddce..39433185b4 100644<br>
--- a/package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">syslog-ng.mk</a><br>
+++ b/package/syslog-ng/<a href=3D"http://syslog-ng.mk" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">syslog-ng.mk</a><br>
@@ -6,7 +6,7 @@<br>
<br>
=C2=A0# When updating the version, please check at runtime if the version i=
n<br>
=C2=A0# syslog-ng.conf header needs to be updated<br>
-SYSLOG_NG_VERSION =3D 4.1.1<br>
+SYSLOG_NG_VERSION =3D 4.2.0<br>
=C2=A0SYSLOG_NG_SITE =3D <a href=3D"https://github.com/balabit/syslog-ng/re=
leases/download/syslog-ng-$(SYSLOG_NG_VERSION)" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://github.com/balabit/syslog-ng/releases/download=
/syslog-ng-$(SYSLOG_NG_VERSION)</a><br>
=C2=A0SYSLOG_NG_LICENSE =3D LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)<=
br>
=C2=A0SYSLOG_NG_LICENSE_FILES =3D COPYING GPL.txt LGPL.txt<br>
-- <br>
2.39.2<br>
<br>
</blockquote></div></div></div>

--00000000000015c30d05fe80eab4--

--===============2196411494530752441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2196411494530752441==--
