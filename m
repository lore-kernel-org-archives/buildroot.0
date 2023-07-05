Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB684EB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 08:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76C7D408E7;
	Wed,  5 Jul 2023 08:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76C7D408E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T-Gy1Ap2ev1u; Wed,  5 Jul 2023 08:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44908416DD;
	Wed,  5 Jul 2023 08:59:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44908416DD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0741BF228
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 08:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2364340A1C
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 08:59:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2364340A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RGg3jM6VNtsf for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 08:59:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1017B40526
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1017B40526
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 08:59:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-98273ae42d0so191793866b.0
 for <buildroot@buildroot.org>; Wed, 05 Jul 2023 01:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688547549; x=1691139549;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+sJwC2z92PCowUFf5ZJnIcx7opdNaVTnZTBc6jNqTLw=;
 b=OiPDcG9MWBggKNziXSSMSQzpzn/q6XqWkls0wjUrYhQiWmmZAFyCKjy+zn1pjQ2GeU
 b0MXgmVnagJ1Sv6Yik5VUAbZfEg+TiAXmyT0Tn+MpFcWJXeOf4kxVUlkm1hAbydOBxNJ
 pfyujsXSjl/wnZWHQy3CZpiPoN3IEC2ZZ42gcyHLBLkkJ9UQZl23Hnk5nQF5zMRNum+7
 tqEpEzNncNIjbW78dxyXBXdyIH0g4iD2ijyHF8Ya0Mg61DZCfUlKBhIp+QjVRdvuV0Dr
 CnetJucsSvvwqxqeoz+KwnlCvyGRj+6ZarwcX9lfL7XSXRcM4nX9a9igqkUKtnpxX/IU
 R1+w==
X-Gm-Message-State: AC+VfDwgKbd0F6xDz6bp0sgKVaUktzuE3tOmnyYJzga7J+APhhWF7Dcv
 2GCo+TRerX0Zk6TjqedGOJ1hKyJSb1Nv11dwG5A0hQqjmxd3aQ==
X-Google-Smtp-Source: APBJJlGTifY+sT+AX1/M33YcmLR+bZxpW7dMd11joTwhP/QEYrsMiR75VlDah4DhB6uYyFLSESk6lCqdOINf8Rn0vPs=
X-Received: by 2002:a17:906:a88b:b0:988:a037:9dad with SMTP id
 ha11-20020a170906a88b00b00988a0379dadmr11836504ejb.4.1688547548770; Wed, 05
 Jul 2023 01:59:08 -0700 (PDT)
MIME-Version: 1.0
From: Guillermo G <ggalan3@gmail.com>
Date: Wed, 5 Jul 2023 10:58:32 +0200
Message-ID: <CAMMZEfypg2ibkon3n34gRqqZzfL7Y0JMGvKU2WJx_ko4LigU9g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688547549; x=1691139549;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=+sJwC2z92PCowUFf5ZJnIcx7opdNaVTnZTBc6jNqTLw=;
 b=mO96xauvmIXafZ/5lyjqZ2wEimOqpXSgapzX/FSDZ9hiL0k619vDoJKEejYIBObGOU
 6mqy14koE37DRA+6MgUkX8UgCr7e8iULIrYGzU5asqxUtG3lyBfBT5VMP/QmFLQuuwcM
 4hlqgcbBMu+cTBirlkQoJSJspquzJGVhgEms4+IBoyk68NCaQPygQFLjL4VUKjRDH4mP
 tzdZ8MkKwHrRj2498Rv2yzVwzZAU3OqiI4F+YSqSXKJb0Z91uKlmlkXd5UbZLNxAZ5sc
 yNO2VeC5ERB+sPolFhrou9+csPwTdI2PKMdJAkw4sQDjl3hbtXUlqrA3jHEq9O7q+zgJ
 +CGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=mO96xauv
Subject: [Buildroot] ffmpeg: disable mmal in 64bit arm
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
Content-Type: multipart/mixed; boundary="===============8052301641164139416=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8052301641164139416==
Content-Type: multipart/alternative; boundary="000000000000d4b53505ffb99cd4"

--000000000000d4b53505ffb99cd4
Content-Type: text/plain; charset="UTF-8"

Hello! This is my first time writing to the buildroot mailing list, so
first thanks everyone for all the work that goes into this project, it's
really great.

I have found a possible error in the ffmpeg configuration (present in 2023.02.1
but also in master). Specifically in package/ffmpeg/ffmpeg.mk - Line 284
<https://github.com/buildroot/buildroot/blob/11aa7ac8fa3a21dc2476dd09539ea3cf3e48f03d/package/ffmpeg/ffmpeg.mk#L284>
.

I am building for a 64bit ARM target, and mmal is not available for 64bit
ARM <https://github.com/raspberrypi/userland/issues/688>, therefore my
build crashes because it automatically sets the option --enable-mmal.
I modified line 285 manually to --disable-mmal which results in a working
build and a working ffmpeg buildroot (tested), but I was wondering if it
could be fixed for other users.

@fhunleth <https://github.com/fhunleth> from the Nerves project helped me
out to come up with a patch proposal
<https://gist.github.com/guillego/6e6c47c93f845d4477c0307dc4c1c772> so that
it gets disabled for 64 bit arm targets.

I've never submitted a patch so I thought it would be best to first search
in the mailing list and since I didn't find anything, send an email to see
what you think.

Additional details:

   - Host: Mac OS. Apple Silicon M1.
   - Buildroot version: 23.02.1
   - Target: Raspberry Pi 3A+/Zero 2W
   - Package for which the build fails: ffmpeg 4.4.4
   - Error message (simplified):

-----
>>> ffmpeg 4.4.4 Patching libtool
>>> ffmpeg 4.4.4 Configuring
[...ommited verbose...]
ERROR: mmal not found

make[1]: *** [package/pkg-generic.mk:283:
/nerves/build/build/ffmpeg-4.4.4/.stamp_configured] Error 1
make: *** [Makefile:23: _all] Error 2
-----

Thanks a lot!

Best,

Guillermo

--000000000000d4b53505ffb99cd4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello! This is my first time writing to the buildroot=
 mailing list, so first thanks everyone for all the work that goes into thi=
s project, it&#39;s really great.</div><div><br></div><div>I have found a p=
ossible error in the ffmpeg configuration (present in <span class=3D"gmail-=
css-truncate gmail-css-truncate-target gmail-d-block gmail-width-fit gmail-=
markdown-title">2023.02.1 but also in</span> master). Specifically in <a hr=
ef=3D"https://github.com/buildroot/buildroot/blob/11aa7ac8fa3a21dc2476dd095=
39ea3cf3e48f03d/package/ffmpeg/ffmpeg.mk#L284">package/ffmpeg/ffmpeg.mk - L=
ine 284</a>.</div><div><br></div><div>I am building for a 64bit ARM target,=
 and <a href=3D"https://github.com/raspberrypi/userland/issues/688">mmal is=
 not available for 64bit ARM</a>, therefore my build crashes because it aut=
omatically sets the option <span style=3D"font-family:monospace">--enable-m=
mal</span>.</div><div>I modified line 285 manually to <span style=3D"font-f=
amily:monospace">--disable-mmal </span>which results in a working build and=
 a working ffmpeg buildroot (tested), but I was wondering if it could be fi=
xed for other users.<br></div><div><br></div><div><a href=3D"https://github=
.com/fhunleth">@fhunleth</a> from the Nerves project helped me out to come =
up with a <a href=3D"https://gist.github.com/guillego/6e6c47c93f845d4477c03=
07dc4c1c772">patch proposal</a> so that it gets disabled for 64 bit arm tar=
gets.<br><br></div><div>I&#39;ve never submitted a patch so I thought it wo=
uld be best to first search in the mailing list and since I didn&#39;t find=
 anything, send an email to see what you think.</div><div><br></div><div>Ad=
ditional details:<br><div class=3D"gmail-itemizedlist"><ul class=3D"gmail-i=
temizedlist" style=3D"list-style-type:disc"><li class=3D"gmail-listitem">Ho=
st: Mac OS. Apple Silicon M1.<br></li><li class=3D"gmail-listitem">Buildroo=
t version: 23.02.1<br></li><li class=3D"gmail-listitem">Target: Raspberry P=
i 3A+/Zero 2W<br></li><li class=3D"gmail-listitem">Package for which the bu=
ild fails: ffmpeg 4.4.4<br></li><li class=3D"gmail-listitem">Error message =
(simplified):</li></ul><div>-----<br>&gt;&gt;&gt; ffmpeg 4.4.4 Patching lib=
tool<br>&gt;&gt;&gt; ffmpeg 4.4.4 Configuring<br></div><div>[...ommited ver=
bose...]<br></div><div>ERROR: mmal not found<br><br>make[1]: *** [package/<=
a href=3D"http://pkg-generic.mk:283">pkg-generic.mk:283</a>: /nerves/build/=
build/ffmpeg-4.4.4/.stamp_configured] Error 1<br>make: *** [Makefile:23: _a=
ll] Error 2<br>-----<br><br></div><div>Thanks a lot!</div><div><br></div><d=
iv>Best,</div><div><br></div><div>Guillermo<br></div></div></div></div>

--000000000000d4b53505ffb99cd4--

--===============8052301641164139416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8052301641164139416==--
