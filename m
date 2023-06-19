Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBBAEB64D9
	for <buildroot@archiver.kernel.org>; Mon, 19 Jun 2023 20:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31AC440164;
	Mon, 19 Jun 2023 20:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31AC440164
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CbwgGRaglBWv; Mon, 19 Jun 2023 20:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42607401F3;
	Mon, 19 Jun 2023 20:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42607401F3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 913441BF2CF
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6060381815
 for <buildroot@lists.busybox.net>; Mon, 19 Jun 2023 20:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6060381815
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id clM_7wV-0HMM for <buildroot@lists.busybox.net>;
 Mon, 19 Jun 2023 20:24:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFBC38144A
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFBC38144A
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 20:24:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-983f499fc81so469910266b.3
 for <buildroot@buildroot.org>; Mon, 19 Jun 2023 13:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687206288; x=1689798288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8D9O++tztJ2CLUIUyv65RnTxWsXl3cx+vETPOW6blBI=;
 b=eZTW0j+59a1vm/bJ1dTI3GeequoOIDhlIJtI43JQJpf/G7fkbJuyktSFpsknK7UyMX
 Yk2hwV/uYaUTLYJyad1zhXkxcQ2a5gh+bOAOoGmbwl6NY/WYL+Kn3+EquS2hiikL+3IA
 lf2XvR5gfNOrSRagGQEPZXZevZO/KiLVIcXePKSet3dM0Ed2v0Yy99USoafVfGg2UEWW
 aRxhGXBFufnwxVoBt00q/ziSjptiAXOwQH/FNOylfUOdsbFQt0+YU3zGYLmcvCTpMpJ6
 pE74yLBcIKpMLMZttitA05kT6uupXaJi6MWEMQxFwwv5c3yhTTT+DvfP6IHM7vczJQgC
 1DXA==
X-Gm-Message-State: AC+VfDx/0TI5h8hwIxtLWLLzusrYNajmMuM8I02Dxf/UC/McRTY4DYFh
 YO4qPAHKdk3SEQLFC0l15wvMtg5pev0Peeed4mk=
X-Google-Smtp-Source: ACHHUZ6/WziSFMfIywePFyIKtSL9YW55kSd6rrv981hjVJF90ZrzPSa/EbHUT1pHpmgN+AUbaE3I1mDZ5tmsxakSAWQ=
X-Received: by 2002:a17:907:5ca:b0:97b:6c24:8d2b with SMTP id
 wg10-20020a17090705ca00b0097b6c248d2bmr9137702ejb.55.1687206287995; Mon, 19
 Jun 2023 13:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230611175142.5235-1-bernd.kuhls@t-online.de>
 <7bbe9b12-46bc-70d2-38a7-f76f5f8118c5@benettiengineering.com>
In-Reply-To: <7bbe9b12-46bc-70d2-38a7-f76f5f8118c5@benettiengineering.com>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 19 Jun 2023 22:24:36 +0200
Message-ID: <CAB1t1CyZAsjPHZtPA9VKd+n7nmYYBgXSvYN-j1WAyw561Z0JFw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687206288; x=1689798288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8D9O++tztJ2CLUIUyv65RnTxWsXl3cx+vETPOW6blBI=;
 b=iwGLE0NvjvukQT1Bz8HTxl5PEPHMRSWosxtttAULGx/t1NwBUHZ6KX4fImLiR3PnD/
 e660IQ7GjcTkcNNxXHXDHXmDJhxrkE2iDQ6XkWlCEduHRwbZWBAgM1AMCwvcctXStmba
 0x7ZqRFkPzoq1oC9xqBGvseQ78oyVSgbvdl7Tl4cJiqfUdEIHEu0xLrWclNhVwZxvVkb
 UTwsIbURuImI6RI75XOxdg8jbiCqoxxk4arFvMI7RYt14QrvuTYCdY1b3wkJpyKdjmBt
 lwy6o6pDSbep1Ttgz4wfMCCMDZaWw6LkT1T49t52Y2xXzcaaeddLaoqNfZueFp3eNgRD
 l3uw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=iwGLE0Nv
Subject: Re: [Buildroot] [PATCH v2 1/1] package/nfs-utils: fix static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4544490592858033611=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4544490592858033611==
Content-Type: multipart/alternative; boundary="0000000000007578f305fe81532a"

--0000000000007578f305fe81532a
Content-Type: text/plain; charset="UTF-8"

On Sunday, 11 June 2023, Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> On 11/06/23 19:51, Bernd Kuhls wrote:
>
>> Fixes:
>>
>> http://autobuild.buildroot.net/results/f17/f17a554c86f0b24327b49fdc75612cc133f129ed/
>>
>> f9dc4bab9f4576eed3a22ca7517bfc88d9812c34 bumped nfs-utils to version
>> 2.6.3 which includes the addition of the two files patched here.
>>
>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>>
>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>
>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Fixes: f9dc4bab9f ("package/nfs-utils: bump to version 2.6.3")

Thanks!

Kind regards,
Petr
Petr



> Best regards
> --
> Giulio Benetti
> CEO&CTO@Benetti Engineering sas
>
> ---
>> v2: added upstream URL
>>
>>   ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 +++++++++++++++++++
>>   1 file changed, 44 insertions(+)
>>   create mode 100644
>> package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
>>
>> diff --git
>> a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
>> b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
>> new file mode 100644
>> index 0000000000..5ffb15d86d
>> --- /dev/null
>> +++
>> b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HAVE_DLF.patch
>> @@ -0,0 +1,44 @@
>> +From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001
>> +From: Bernd Kuhls <bernd.kuhls@t-online.de>
>> +Date: Sun, 11 Jun 2023 08:57:11 +0200
>> +Subject: [PATCH] support/reexport: guard dlfcn.h include with
>> HAVE_DLFCN_H
>> +
>> +Upstream: https://marc.info/?l=linux-nfs&m=168650558019402&w=2
>> +
>> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>> +---
>> + support/reexport/fsidd.c    | 2 ++
>> + support/reexport/reexport.c | 2 ++
>> + 2 files changed, 4 insertions(+)
>> +
>> +diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c
>> +index 37649d06..d4b245e8 100644
>> +--- a/support/reexport/fsidd.c
>> ++++ b/support/reexport/fsidd.c
>> +@@ -3,7 +3,9 @@
>> + #endif
>> +
>> + #include <assert.h>
>> ++#ifdef HAVE_DLFCN_H
>> + #include <dlfcn.h>
>> ++#endif
>> + #include <event2/event.h>
>> + #include <limits.h>
>> + #include <stdint.h>
>> +diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c
>> +index d597a2f7..d9a700af 100644
>> +--- a/support/reexport/reexport.c
>> ++++ b/support/reexport/reexport.c
>> +@@ -2,7 +2,9 @@
>> + #include <config.h>
>> + #endif
>> +
>> ++#ifdef HAVE_DLFCN_H
>> + #include <dlfcn.h>
>> ++#endif
>> + #include <stdint.h>
>> + #include <stdio.h>
>> + #include <sys/random.h>
>> +--
>> +2.39.2
>> +
>>
>
>

--0000000000007578f305fe81532a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Sunday, 11 June 2023, Giulio Benetti &lt;<a hre=
f=3D"mailto:giulio.benetti@benettiengineering.com" target=3D"_blank">giulio=
.benetti@benettiengineering.com</a>&gt; wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On 11/06/23 19:51, Bernd Kuhls wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Fixes:<br>
<a href=3D"http://autobuild.buildroot.net/results/f17/f17a554c86f0b24327b49=
fdc75612cc133f129ed/" target=3D"_blank">http://autobuild.buildroot.net/resu=
lts/f17/f17a554c86f0b24327b49fdc75612cc133f129ed/</a><br>
<br>
f9dc4bab9f4576eed3a22ca7517bfc88d9812c34 bumped nfs-utils to version<br>
2.6.3 which includes the addition of the two files patched here.<br>
<br>
Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online.de" t=
arget=3D"_blank">bernd.kuhls@t-online.de</a>&gt;<br>
</blockquote>
<br>
Reviewed-by: Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettieng=
ineering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&g=
t;<br>
<br></blockquote><div><br></div><div>Reviewed-by: Petr Vorel &lt;<a href=3D=
"mailto:petr.vorel@gmail.com" target=3D"_blank">petr.vorel@gmail.com</a>&gt=
;</div><div><br></div><div>Fixes: f9dc4bab9f (&quot;package/nfs-utils: bump=
 to version 2.6.3&quot;)<br><br></div><div>Thanks!</div><div><br></div><div=
>Kind regards,</div><div>Petr</div></div><div>Petr</div><div><br></div><div=
>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards<br>
-- <br>
Giulio Benetti<br>
CEO&amp;CTO@Benetti Engineering sas<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
v2: added upstream URL<br>
<br>
=C2=A0 ...-guard-dlfcn.h-include-with-HAVE_DLF.patch | 44 +++++++++++++++++=
++<br>
=C2=A0 1 file changed, 44 insertions(+)<br>
=C2=A0 create mode 100644 package/nfs-utils/0002-support-reexport-guard-dlf=
cn.h-include-with-HAVE_DLF.patch<br>
<br>
diff --git a/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-=
with-HAVE_DLF.patch b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h=
-include-with-HAVE_DLF.patch<br>
new file mode 100644<br>
index 0000000000..5ffb15d86d<br>
--- /dev/null<br>
+++ b/package/nfs-utils/0002-support-reexport-guard-dlfcn.h-include-with-HA=
VE_DLF.patch<br>
@@ -0,0 +1,44 @@<br>
+From 274e4d212c30183242e48b639889865819f3ac33 Mon Sep 17 00:00:00 2001<br>
+From: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online.de" target=3D=
"_blank">bernd.kuhls@t-online.de</a>&gt;<br>
+Date: Sun, 11 Jun 2023 08:57:11 +0200<br>
+Subject: [PATCH] support/reexport: guard dlfcn.h include with HAVE_DLFCN_H=
<br>
+<br>
+Upstream: <a href=3D"https://marc.info/?l=3Dlinux-nfs&amp;m=3D168650558019=
402&amp;w=3D2" target=3D"_blank">https://marc.info/?l=3Dlinux-nfs&amp;m=3D1=
68650558019402&amp;w=3D2</a><br>
+<br>
+Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd.kuhls@t-online.de" =
target=3D"_blank">bernd.kuhls@t-online.de</a>&gt;<br>
+---<br>
+ support/reexport/fsidd.c=C2=A0 =C2=A0 | 2 ++<br>
+ support/reexport/reexport.c | 2 ++<br>
+ 2 files changed, 4 insertions(+)<br>
+<br>
+diff --git a/support/reexport/fsidd.c b/support/reexport/fsidd.c<br>
+index 37649d06..d4b245e8 100644<br>
+--- a/support/reexport/fsidd.c<br>
++++ b/support/reexport/fsidd.c<br>
+@@ -3,7 +3,9 @@<br>
+ #endif<br>
+<br>
+ #include &lt;assert.h&gt;<br>
++#ifdef HAVE_DLFCN_H<br>
+ #include &lt;dlfcn.h&gt;<br>
++#endif<br>
+ #include &lt;event2/event.h&gt;<br>
+ #include &lt;limits.h&gt;<br>
+ #include &lt;stdint.h&gt;<br>
+diff --git a/support/reexport/reexport.c b/support/reexport/reexport.c<br>
+index d597a2f7..d9a700af 100644<br>
+--- a/support/reexport/reexport.c<br>
++++ b/support/reexport/reexport.c<br>
+@@ -2,7 +2,9 @@<br>
+ #include &lt;config.h&gt;<br>
+ #endif<br>
+<br>
++#ifdef HAVE_DLFCN_H<br>
+ #include &lt;dlfcn.h&gt;<br>
++#endif<br>
+ #include &lt;stdint.h&gt;<br>
+ #include &lt;stdio.h&gt;<br>
+ #include &lt;sys/random.h&gt;<br>
+--<br>
+2.39.2<br>
+<br>
</blockquote>
<br>
</blockquote>

--0000000000007578f305fe81532a--

--===============4544490592858033611==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4544490592858033611==--
