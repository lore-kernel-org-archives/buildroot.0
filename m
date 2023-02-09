Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33FB3C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 04:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A2BA40236;
	Thu,  9 Feb 2023 04:13:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A2BA40236
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eodIVxf__ELc; Thu,  9 Feb 2023 04:13:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F80F404D8;
	Thu,  9 Feb 2023 04:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F80F404D8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C1A111BF31E
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 04:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A85FE60D55
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 04:13:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A85FE60D55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P7e8IeUKPK4W for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 04:13:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62E5D60BF0
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62E5D60BF0
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 04:13:44 +0000 (UTC)
Received: by mail-vk1-f182.google.com with SMTP id v189so342473vkf.6
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 20:13:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1675916023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A13B5WNZ8kytYQj7dIonIuqJIFleynqg5HEqcbwQs28=;
 b=G322ckeHn4QmLCk1T4iMv3p8Guvc4mIvDD0XwcuJkYYZy8Qc3QRf9fYyRMGjcU/q1c
 Wwz1Ugnjw6M2e3tV88/POFLFBrKeQH7aUKi+HIpV9umlREBHE8aI/6+WxOqT/mbA6cpH
 vAWd7Gu1/9jNv+/bJfVB5+oYxdDQSeW5KdoyLTp6zZ9bWRxHS+Aqg4n6jAgWrv9wU60z
 ggvX7UzRNcKXaG/NXtZIKALAuUSUVce5WE5qQtAzF6RNH43yJ3UjIIlXKJJTcaSat8nq
 cswaPeapN/ODCHv6e2JxhZhI+mOu7g071SuhZirJzcx8oW7gqdl9VE63ntZkNxqlKF/e
 qA+A==
X-Gm-Message-State: AO0yUKUa2t8V0F3FWMOBgSgBY3lKA+wN68GA+B14ueTeV2Im6ih5YPBN
 +8BYpxiQvr/m7yT0QlPPxB0hqCjnxnFXCOq9mrHFclk3csYy5Wd7
X-Google-Smtp-Source: AK7set9LsJg9Uuimy15cwUiB26fupU3e1VUUGVDQXB94bOjRUCcKqw/0ZsNR4TH0djKadmp7LThbHx6V8rQF1KmsrP8=
X-Received: by 2002:a1f:2392:0:b0:3d9:55d2:ac0e with SMTP id
 j140-20020a1f2392000000b003d955d2ac0emr2077054vkj.22.1675916022906; Wed, 08
 Feb 2023 20:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
 <20230208230721.3269610-2-giulio.benetti@benettiengineering.com>
In-Reply-To: <20230208230721.3269610-2-giulio.benetti@benettiengineering.com>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 9 Feb 2023 05:13:31 +0100
Message-ID: <CAB0FRsvEN6wVApkLAR6tawE_sq5SvLFVpat-wObYC9FEqDqP-A@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/libgtk3: fix build failure on
 libinput due to the presence of atk-bridge-2.0 in gtk+-3.0.pc
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0516248490773223406=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0516248490773223406==
Content-Type: multipart/alternative; boundary="000000000000381f5605f43c9b50"

--000000000000381f5605f43c9b50
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 9 f=C3=A9vr. 2023 =C3=A0 00:07, Giulio Benetti <
giulio.benetti@benettiengineering.com> a =C3=A9crit :

> Patch 0001-disable-atk-bridge.patch misses to remove:
> atk_pkgs +=3D ['atk-bridge-2.0']
> that is not affected by any meson variable, this results in having libgtk=
3
> to have atk-bridge-2.0 in its gtk+-3.0.pc and so other libraries(i.e.
> libinput) tries to {pkgconf}find it failing. So let's convert the patch t=
o
> git format and add the removal of such line.
>
> Fixes:
> still not found
>

this patch (disable-atk-bridge) will be removed soon, see
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D336254
(package/atk: remove package)

Fran=C3=A7ois


> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  ...h =3D> 0001-Remove-atk-bridge-support.patch} | 31 +++++++++++++++++--
>  1 file changed, 28 insertions(+), 3 deletions(-)
>  rename package/libgtk3/{0001-disable-atk-bridge.patch =3D>
> 0001-Remove-atk-bridge-support.patch} (59%)
>
> diff --git a/package/libgtk3/0001-disable-atk-bridge.patch
> b/package/libgtk3/0001-Remove-atk-bridge-support.patch
> similarity index 59%
> rename from package/libgtk3/0001-disable-atk-bridge.patch
> rename to package/libgtk3/0001-Remove-atk-bridge-support.patch
> index f3e9bff2ba..b52c9be650 100644
> --- a/package/libgtk3/0001-disable-atk-bridge.patch
> +++ b/package/libgtk3/0001-Remove-atk-bridge-support.patch
> @@ -1,16 +1,27 @@
> -Remove atk-bridge support.
> +From 923ba2a1653b942093e9d25f8f4d2e7c09a66328 Mon Sep 17 00:00:00 2001
> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +Date: Wed, 8 Feb 2023 23:50:56 +0100
> +Subject: [PATCH] Remove atk-bridge support.
>
>  atk-bridge doesn't seem useful for now in Buildroot and requires to
>  add two new packages just for it: at-spi2-core and at-spi2-atk.
>
>  Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
> +[Giulio: remove 'atk-bridge-2.0' too]
> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> +---
> + gtk/a11y/gtkaccessibility.c | 8 --------
> + meson.build                 | 4 +---
> + 2 files changed, 1 insertion(+), 11 deletions(-)
>
> +diff --git a/gtk/a11y/gtkaccessibility.c b/gtk/a11y/gtkaccessibility.c
> +index 7f0e5207d9..14da1e80e2 100644
>  --- a/gtk/a11y/gtkaccessibility.c
>  +++ b/gtk/a11y/gtkaccessibility.c
>  @@ -37,10 +37,6 @@
>   #include <gtk/gtktogglebutton.h>
>   #include <gtk/gtkaccessible.h>
> -
> +
>  -#ifdef GDK_WINDOWING_X11
>  -#include <atk-bridge.h>
>  -#endif
> @@ -21,13 +32,15 @@ Signed-off-by: Hadrien Boutteville <
> hadrien.boutteville@gmail.com>
>  @@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
>     _gtk_accessibility_override_atk_util ();
>     do_window_event_initialization ();
> -
> +
>  -#ifdef GDK_WINDOWING_X11
>  -  atk_bridge_adaptor_init (NULL, NULL);
>  -#endif
>  -
>     atk_misc_instance =3D g_object_new (GTK_TYPE_MISC_IMPL, NULL);
>   }
> +diff --git a/meson.build b/meson.build
> +index aed48fc3f6..370bf1cce1 100644
>  --- a/meson.build
>  +++ b/meson.build
>  @@ -564,7 +564,7 @@ if x11_enabled
> @@ -39,3 +52,15 @@ Signed-off-by: Hadrien Boutteville <
> hadrien.boutteville@gmail.com>
>
>     backend_immodules +=3D ['xim']
>
> +@@ -583,8 +583,6 @@ if x11_enabled
> +     x11_pkgs +=3D ['xdamage']
> +   endif
> +
> +-  atk_pkgs +=3D ['atk-bridge-2.0']
> +-
> +   cdata.set('HAVE_XDAMAGE', xdamage_dep.found() ? 1 : false)
> +   cdata.set('HAVE_XCURSOR', xcursor_dep.found() ? 1 : false)
> +   cdata.set('HAVE_XCOMPOSITE', xcomposite_dep.found() ? 1 : false)
> +--
> +2.34.1
> +
> --
> 2.34.1
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000381f5605f43c9b50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 9 f=C3=A9vr. 2023 =C3=A0=
=C2=A000:07, Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com">giulio.benetti@benettiengineering.com</a>&gt; a =C3=A9crit=C2=
=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Patch 0001-=
disable-atk-bridge.patch misses to remove:<br>
atk_pkgs +=3D [&#39;atk-bridge-2.0&#39;]<br>
that is not affected by any meson variable, this results in having libgtk3<=
br>
to have atk-bridge-2.0 in its gtk+-3.0.pc and so other libraries(i.e.<br>
libinput) tries to {pkgconf}find it failing. So let&#39;s convert the patch=
 to<br>
git format and add the removal of such line.<br>
<br>
Fixes:<br>
still not found<br></blockquote><div><br></div><div>this patch (disable-atk=
-bridge) will be removed soon, see <a href=3D"https://patchwork.ozlabs.org/=
project/buildroot/list/?series=3D336254">https://patchwork.ozlabs.org/proje=
ct/buildroot/list/?series=3D336254</a> (package/atk: remove package)</div><=
div><br></div><div>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
Signed-off-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettie=
ngineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>=
&gt;<br>
---<br>
=C2=A0...h =3D&gt; 0001-Remove-atk-bridge-support.patch} | 31 +++++++++++++=
++++--<br>
=C2=A01 file changed, 28 insertions(+), 3 deletions(-)<br>
=C2=A0rename package/libgtk3/{0001-disable-atk-bridge.patch =3D&gt; 0001-Re=
move-atk-bridge-support.patch} (59%)<br>
<br>
diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk=
3/0001-Remove-atk-bridge-support.patch<br>
similarity index 59%<br>
rename from package/libgtk3/0001-disable-atk-bridge.patch<br>
rename to package/libgtk3/0001-Remove-atk-bridge-support.patch<br>
index f3e9bff2ba..b52c9be650 100644<br>
--- a/package/libgtk3/0001-disable-atk-bridge.patch<br>
+++ b/package/libgtk3/0001-Remove-atk-bridge-support.patch<br>
@@ -1,16 +1,27 @@<br>
-Remove atk-bridge support.<br>
+From 923ba2a1653b942093e9d25f8f4d2e7c09a66328 Mon Sep 17 00:00:00 2001<br>
+From: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineeri=
ng.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;<br>
+Date: Wed, 8 Feb 2023 23:50:56 +0100<br>
+Subject: [PATCH] Remove atk-bridge support.<br>
<br>
=C2=A0atk-bridge doesn&#39;t seem useful for now in Buildroot and requires =
to<br>
=C2=A0add two new packages just for it: at-spi2-core and at-spi2-atk.<br>
<br>
=C2=A0Signed-off-by: Hadrien Boutteville &lt;<a href=3D"mailto:hadrien.bout=
teville@gmail.com" target=3D"_blank">hadrien.boutteville@gmail.com</a>&gt;<=
br>
+[Giulio: remove &#39;atk-bridge-2.0&#39; too]<br>
+Signed-off-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benetti=
engineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a=
>&gt;<br>
+---<br>
+ gtk/a11y/gtkaccessibility.c | 8 --------<br>
+ meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 4 +---<br>
+ 2 files changed, 1 insertion(+), 11 deletions(-)<br>
<br>
+diff --git a/gtk/a11y/gtkaccessibility.c b/gtk/a11y/gtkaccessibility.c<br>
+index 7f0e5207d9..14da1e80e2 100644<br>
=C2=A0--- a/gtk/a11y/gtkaccessibility.c<br>
=C2=A0+++ b/gtk/a11y/gtkaccessibility.c<br>
=C2=A0@@ -37,10 +37,6 @@<br>
=C2=A0 #include &lt;gtk/gtktogglebutton.h&gt;<br>
=C2=A0 #include &lt;gtk/gtkaccessible.h&gt;<br>
-<br>
+ <br>
=C2=A0-#ifdef GDK_WINDOWING_X11<br>
=C2=A0-#include &lt;atk-bridge.h&gt;<br>
=C2=A0-#endif<br>
@@ -21,13 +32,15 @@ Signed-off-by: Hadrien Boutteville &lt;<a href=3D"mailt=
o:hadrien.boutteville@gmail.com" target=3D"_blank">hadrien.boutteville@gmai=
l.com</a>&gt;<br>
=C2=A0@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)<br>
=C2=A0 =C2=A0 _gtk_accessibility_override_atk_util ();<br>
=C2=A0 =C2=A0 do_window_event_initialization ();<br>
-<br>
+ <br>
=C2=A0-#ifdef GDK_WINDOWING_X11<br>
=C2=A0-=C2=A0 atk_bridge_adaptor_init (NULL, NULL);<br>
=C2=A0-#endif<br>
=C2=A0-<br>
=C2=A0 =C2=A0 atk_misc_instance =3D g_object_new (GTK_TYPE_MISC_IMPL, NULL)=
;<br>
=C2=A0 }<br>
+diff --git a/meson.build b/meson.build<br>
+index aed48fc3f6..370bf1cce1 100644<br>
=C2=A0--- a/meson.build<br>
=C2=A0+++ b/meson.build<br>
=C2=A0@@ -564,7 +564,7 @@ if x11_enabled<br>
@@ -39,3 +52,15 @@ Signed-off-by: Hadrien Boutteville &lt;<a href=3D"mailto=
:hadrien.boutteville@gmail.com" target=3D"_blank">hadrien.boutteville@gmail=
.com</a>&gt;<br>
<br>
=C2=A0 =C2=A0 backend_immodules +=3D [&#39;xim&#39;]<br>
<br>
+@@ -583,8 +583,6 @@ if x11_enabled<br>
+=C2=A0 =C2=A0 =C2=A0x11_pkgs +=3D [&#39;xdamage&#39;]<br>
+=C2=A0 =C2=A0endif<br>
+ <br>
+-=C2=A0 atk_pkgs +=3D [&#39;atk-bridge-2.0&#39;]<br>
+-<br>
+=C2=A0 =C2=A0cdata.set(&#39;HAVE_XDAMAGE&#39;, xdamage_dep.found() ? 1 : f=
alse)<br>
+=C2=A0 =C2=A0cdata.set(&#39;HAVE_XCURSOR&#39;, xcursor_dep.found() ? 1 : f=
alse)<br>
+=C2=A0 =C2=A0cdata.set(&#39;HAVE_XCOMPOSITE&#39;, xcomposite_dep.found() ?=
 1 : false)<br>
+-- <br>
+2.34.1<br>
+<br>
-- <br>
2.34.1<br>
<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000381f5605f43c9b50--

--===============0516248490773223406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0516248490773223406==--
