Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D95C4332F
	for <buildroot@archiver.kernel.org>; Tue,  4 Oct 2022 09:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEDE14090E;
	Tue,  4 Oct 2022 09:19:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEDE14090E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JT3nXWeeK3GP; Tue,  4 Oct 2022 09:19:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD912404F8;
	Tue,  4 Oct 2022 09:19:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD912404F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC7051BF27C
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:18:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8308F40321
 for <buildroot@lists.busybox.net>; Tue,  4 Oct 2022 09:18:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8308F40321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QlbwAlJ1yInP for <buildroot@lists.busybox.net>;
 Tue,  4 Oct 2022 09:18:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB6D240304
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB6D240304
 for <buildroot@buildroot.org>; Tue,  4 Oct 2022 09:18:54 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id j71so6072189pge.2
 for <buildroot@buildroot.org>; Tue, 04 Oct 2022 02:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=fva48tmKqnmKs6FzCKJrXLBX9eEXCABID66kGekSxCg=;
 b=xSdixmh9+FCNkbPJeq/rMEeLcUfucWre2EUGOzbHd9KPIViAd1OLcC4qBsN7RUGPxu
 yyF1HKKt9pnD680e0cV9VAewuT2NRrLKNASTO7M02rxzIhasPFcquKGALb4abC8S5/7A
 OSnjXCi+xg6HIZTNfnGur747ECW081VbK6Kh8Nx9aRQnXza4j40ek7saEqm4EXDJm8uK
 f4CZucInL2XLT40JMDumQt3IbeHT63VXyJu3eu+vwl5kXSxhsadBdIDTy3KF0/gEcBJo
 HNN8LG+xB3B5CDu4nTleREBpoM+GzZ6CdLaJ+RAgcl66mIfpRE8jhcVOQHZv4T8xC3mt
 yTgQ==
X-Gm-Message-State: ACrzQf1qL6h7awwFqgMF6uojqOhmnj1EewBOFBPnvvzK6dIBTXitkJoW
 CuuxHvnygbSWPvcxf7ZzLKqVlcSc27IEtzekBT43RXQElA==
X-Google-Smtp-Source: AMsMyM61Io3wUN2OyuYgc47+A5bWcydQlS31pNR9FV/VuIwg9C07/FqUaAIBYydHahTWvWjVpKmm9dYzcnfKvC+Vklk=
X-Received: by 2002:a05:6a00:248b:b0:542:6ae2:24d5 with SMTP id
 c11-20020a056a00248b00b005426ae224d5mr27234979pfv.65.1664875134023; Tue, 04
 Oct 2022 02:18:54 -0700 (PDT)
MIME-Version: 1.0
From: Ryota Kinukawa <pojiro.jp@gmail.com>
Date: Tue, 4 Oct 2022 18:18:38 +0900
Message-ID: <CAALxPJ341BXmFBRE5DBTMd0CJU-ScxD3D1LCS_Avvg0RMRTpug@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=fva48tmKqnmKs6FzCKJrXLBX9eEXCABID66kGekSxCg=;
 b=R+UDTeHxmkNark8LHYFr5udM7H+/d+dp5Cs+cMQwzx4Nfc2jYIBX9MtCcCe+y7vFNz
 sJxg2FmyUXsCEhrT0dlfljX/rS+8KxBoKXERl6l0BAS1Dfy7+ORIv3gbxHaQzy+SPlxy
 lE0hXO9LCkSRPgZj0IKDuxUc1BZ/p5UK0C+SVuzs4jUezEY3onz1n6I3TXmspLhBzpJO
 DHNzhg97IGTo4fDp9V3vxGtPnQxl9mHc7bKKJJRAlYjO2TRGhmgy8xWuub2ggSEporg9
 1VM06KLOqHe3nIOY1Rc3kvKFKJqtL/hZewn9bTJo7Ybyuq/2aRwU4C2TANfMuw23iJLK
 GT3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=R+UDTeHx
Subject: [Buildroot] How to compile Cairo with EGL_NO_X11
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
Content-Type: multipart/mixed; boundary="===============2574338057546075598=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2574338057546075598==
Content-Type: multipart/alternative; boundary="000000000000f57df905ea31f238"

--000000000000f57df905ea31f238
Content-Type: text/plain; charset="UTF-8"

Hi. Thank you for your great work, Buildroot team.
I'm writing this email to ask how to compile Cairo with EGL_NO_X11.

Currently I am trying to use Weston on Rpi4 with Buildroot.
I got an error which was caused by Cairo trying to include X11.

This error is caused by <EGL/eglplatform.h>, which Cairo includes, has
following conditional include

```
#elif defined(__unix__) && defined(EGL_NO_X11)
...
#elif defined(__unix__) || defined(USE_X11)
/* X11 (tentative)  */
#include <X11/Xlib.h>
#include <X11/Xutil.h>
...
```

So, this error can be avoided by passing -DEGL_NO_X11, but I don't know how
to do that in Buildroot.
If this requires a change in the package, please let me know for a
contribution. (I don't know if I can do it with my capabilities

Thank you for reading.

--000000000000f57df905ea31f238
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi. Thank you for your great work, Buildroot team.<br>I&#3=
9;m writing this email to ask how to compile Cairo with EGL_NO_X11.<div><br=
></div><div>Currently I am trying to use Weston on Rpi4 with Buildroot.</di=
v><div>I got an=C2=A0error which was caused by Cairo trying to include X11.=
<br></div><div><br></div><div>This error is caused by &lt;EGL/eglplatform.h=
&gt;, which Cairo includes, has following conditional include</div><div><br=
></div><div>```</div><div>#elif defined(__unix__) &amp;&amp; defined(EGL_NO=
_X11)<br>...<br>#elif defined(__unix__) || defined(USE_X11)<br>/* X11 (tent=
ative) =C2=A0*/<br>#include &lt;X11/Xlib.h&gt;<br>#include &lt;X11/Xutil.h&=
gt;<br>...<br></div><div>```<br></div><div><br></div><div>So, this error ca=
n be avoided by passing -DEGL_NO_X11, but I don&#39;t know how to do that i=
n Buildroot.<br></div><div>If this requires a change in the package, please=
 let me know for a contribution. (I don&#39;t know if I can do it with my c=
apabilities</div><div><br></div><div>Thank you for reading.</div></div>

--000000000000f57df905ea31f238--

--===============2574338057546075598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2574338057546075598==--
