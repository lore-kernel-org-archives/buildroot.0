Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE754C77B76
	for <buildroot@archiver.kernel.org>; Mon, 17 Apr 2023 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F77B81A1C;
	Mon, 17 Apr 2023 20:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F77B81A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgCViqAR7N9R; Mon, 17 Apr 2023 20:43:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66F1E8193E;
	Mon, 17 Apr 2023 20:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66F1E8193E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AE4CF1C420D
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 20:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 716218193E
 for <buildroot@lists.busybox.net>; Mon, 17 Apr 2023 20:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 716218193E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tqdmDLAgvIEd for <buildroot@lists.busybox.net>;
 Mon, 17 Apr 2023 20:43:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48AA8818CA
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 48AA8818CA
 for <buildroot@busybox.net>; Mon, 17 Apr 2023 20:43:48 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-54f21cdfadbso380947647b3.7
 for <buildroot@busybox.net>; Mon, 17 Apr 2023 13:43:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681764227; x=1684356227;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1Hgc+eeQY5sTPJD7jYsxcrWHvBNTMASFc87kNmPi7oY=;
 b=G2d9jto23WHsoCyL72HRV3z88pE3iq2sqYKke31ZTu6utUftOth66GVP2BbocmI5Fb
 RlPyeUR4lv5lADIJFio4oOlP8pGvuUT++umO7pfm6MSwuZUH58ERinO61HlPIRQv8xqu
 AAEh6N9EOgRMTS4u0wsKNBoJUt2rxkmm4e7Hl8HYZjw1ZmVCcO6wkWPMFMARynElz/RH
 g46QPnJM15xhphUqjE7EVNXDfq0gqTFIVK9LSiFzYW98s9vw7lSO8aTbn/bnwIrZKRBB
 Z21zr4hIC7u+xtIJyIXGUJUU28Ntjw/MAxH+MGozOIWYoGVlE8DsgMm7aTPZGEAl7pmp
 /pcA==
X-Gm-Message-State: AAQBX9f8h/z5+AYqk5PJNx8brCIXmoIA4lIo/n/FG9EIRWdz6qXGLLzX
 +9wjI9afca/PKffts1/ZjoOrLdQoBBr340X3EAkm41X8XX5CNnKuvfg=
X-Google-Smtp-Source: AKy350aXhjZseuqcVqA131ZG/ruJlasbKHVSD3iHt2NM/GizMxsJFEk5eDoMKRR6ZD7jDpN/cyuwQ2NG4g28lWyCCZ8=
X-Received: by 2002:a81:c649:0:b0:54f:2b65:a865 with SMTP id
 q9-20020a81c649000000b0054f2b65a865mr10126483ywj.8.1681764227088; Mon, 17 Apr
 2023 13:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230417203722.49416-1-francois.perrad@gadz.org>
In-Reply-To: <20230417203722.49416-1-francois.perrad@gadz.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 17 Apr 2023 22:43:36 +0200
Message-ID: <CAAE6iEXdCxD27Wgx7V6sfj+zo6aReVoSqu+q5U5Z2t_+y6mHUw@mail.gmail.com>
To: buildroot@busybox.net
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1681764227; x=1684356227;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Hgc+eeQY5sTPJD7jYsxcrWHvBNTMASFc87kNmPi7oY=;
 b=FtDDbuGA25+UD+cTUh8V7BZHOHLB4Uit2zPOcX4KjQiaU3ink16HuTxTGDAp60b+qK
 dniqLF3IEAhxmJXflO3c2CSXw8U0TevTcaUqQ0JwpnBbmAVvY3/g32OYoDjUmXpWJFmR
 TwRiBZ5mx0RGxBtk8a5jDSgUutyzCHNjRy+/gWS9vD6vQhnuvnR0ZkaG2BvZlpaFwvnt
 XEew9yZo0SJlsoED3S7Co9l3/ZCC7D9HyAuYuhHlRqADyFazV4hD/cG33jlBeOOjIdQj
 LVIgHaor7wDbkqLiXGGUv/ubZOuU4Tun4T1QzhKOdbWwj+WKIy3TfAIp2Guya8eBn1Qe
 FrtQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=FtDDbuGA
Subject: Re: [Buildroot] [PATCH] package/tcpdump: bump to version 4.99.4
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
Content-Type: multipart/mixed; boundary="===============5041216827065412776=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5041216827065412776==
Content-Type: multipart/alternative; boundary="0000000000005a13b705f98e3ffd"

--0000000000005a13b705f98e3ffd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sorry, duplicated.
see
https://patchwork.ozlabs.org/project/buildroot/patch/20230417192046.601662-=
1-dalang@gmx.at/

Fran=C3=A7ois

Le lun. 17 avr. 2023 =C3=A0 22:39, Francois Perrad <fperrad@gmail.com> a =
=C3=A9crit :

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/tcpdump/tcpdump.hash | 4 ++--
>  package/tcpdump/tcpdump.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash
> index e548e3262..58190356a 100644
> --- a/package/tcpdump/tcpdump.hash
> +++ b/package/tcpdump/tcpdump.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature at
> -# https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz.sig
> +# https://www.tcpdump.org/release/tcpdump-4.99.4.tar.gz.sig
>  # using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D
> -sha256  ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3
> tcpdump-4.99.3.tar.gz
> +sha256  0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49fea
> tcpdump-4.99.4.tar.gz
>  sha256  8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce2697014eda7afd
> LICENSE
> diff --git a/package/tcpdump/tcpdump.mk b/package/tcpdump/tcpdump.mk
> index 7a679ce4b..91643e7be 100644
> --- a/package/tcpdump/tcpdump.mk
> +++ b/package/tcpdump/tcpdump.mk
> @@ -4,7 +4,7 @@
>  #
>
>  ########################################################################=
########
>
> -TCPDUMP_VERSION =3D 4.99.3
> +TCPDUMP_VERSION =3D 4.99.4
>  TCPDUMP_SITE =3D https://www.tcpdump.org/release
>  TCPDUMP_LICENSE =3D BSD-3-Clause
>  TCPDUMP_LICENSE_FILES =3D LICENSE
> --
> 2.37.2
>
>

--0000000000005a13b705f98e3ffd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>sorry, duplicated.</div><div>see <a href=3D"https://p=
atchwork.ozlabs.org/project/buildroot/patch/20230417192046.601662-1-dalang@=
gmx.at/">https://patchwork.ozlabs.org/project/buildroot/patch/2023041719204=
6.601662-1-dalang@gmx.at/</a></div><div><br></div><div>Fran=C3=A7ois<br></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">Le=C2=A0lun. 17 avr. 2023 =C3=A0=C2=A022:39, Francois Perrad &lt;<a href=
=3D"mailto:fperrad@gmail.com">fperrad@gmail.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Signed-off-by: =
Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org" target=3D"_=
blank">francois.perrad@gadz.org</a>&gt;<br>
---<br>
=C2=A0package/tcpdump/tcpdump.hash | 4 ++--<br>
=C2=A0package/tcpdump/<a href=3D"http://tcpdump.mk" rel=3D"noreferrer" targ=
et=3D"_blank">tcpdump.mk</a>=C2=A0 =C2=A0| 2 +-<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/package/tcpdump/tcpdump.hash b/package/tcpdump/tcpdump.hash<br=
>
index e548e3262..58190356a 100644<br>
--- a/package/tcpdump/tcpdump.hash<br>
+++ b/package/tcpdump/tcpdump.hash<br>
@@ -1,5 +1,5 @@<br>
=C2=A0# Locally calculated after checking pgp signature at<br>
-# <a href=3D"https://www.tcpdump.org/release/tcpdump-4.99.3.tar.gz.sig" re=
l=3D"noreferrer" target=3D"_blank">https://www.tcpdump.org/release/tcpdump-=
4.99.3.tar.gz.sig</a><br>
+# <a href=3D"https://www.tcpdump.org/release/tcpdump-4.99.4.tar.gz.sig" re=
l=3D"noreferrer" target=3D"_blank">https://www.tcpdump.org/release/tcpdump-=
4.99.4.tar.gz.sig</a><br>
=C2=A0# using key 1F166A5742ABB9E0249A8D30E089DEF1D9C15D0D<br>
-sha256=C2=A0 ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e7=
3b3=C2=A0 tcpdump-4.99.3.tar.gz<br>
+sha256=C2=A0 0232231bb2f29d6bf2426e70a08a7e0c63a0d59a9b44863b7f5e2357a6e49=
fea=C2=A0 tcpdump-4.99.4.tar.gz<br>
=C2=A0sha256=C2=A0 8a54594d257e14a5260ac770f1633516cb51e3fc28c40136ce269701=
4eda7afd=C2=A0 LICENSE<br>
diff --git a/package/tcpdump/<a href=3D"http://tcpdump.mk" rel=3D"noreferre=
r" target=3D"_blank">tcpdump.mk</a> b/package/tcpdump/<a href=3D"http://tcp=
dump.mk" rel=3D"noreferrer" target=3D"_blank">tcpdump.mk</a><br>
index 7a679ce4b..91643e7be 100644<br>
--- a/package/tcpdump/<a href=3D"http://tcpdump.mk" rel=3D"noreferrer" targ=
et=3D"_blank">tcpdump.mk</a><br>
+++ b/package/tcpdump/<a href=3D"http://tcpdump.mk" rel=3D"noreferrer" targ=
et=3D"_blank">tcpdump.mk</a><br>
@@ -4,7 +4,7 @@<br>
=C2=A0#<br>
=C2=A0#####################################################################=
###########<br>
<br>
-TCPDUMP_VERSION =3D 4.99.3<br>
+TCPDUMP_VERSION =3D 4.99.4<br>
=C2=A0TCPDUMP_SITE =3D <a href=3D"https://www.tcpdump.org/release" rel=3D"n=
oreferrer" target=3D"_blank">https://www.tcpdump.org/release</a><br>
=C2=A0TCPDUMP_LICENSE =3D BSD-3-Clause<br>
=C2=A0TCPDUMP_LICENSE_FILES =3D LICENSE<br>
-- <br>
2.37.2<br>
<br>
</blockquote></div>

--0000000000005a13b705f98e3ffd--

--===============5041216827065412776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5041216827065412776==--
