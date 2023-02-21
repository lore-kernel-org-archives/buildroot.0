Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10FDC64EC4
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 11:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A5C942A1D;
	Tue, 21 Feb 2023 11:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A5C942A1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDjFgIPmqLGv; Tue, 21 Feb 2023 11:34:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8AD842A70;
	Tue, 21 Feb 2023 11:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8AD842A70
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8499C1BF33F
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 11:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B9016113C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 11:34:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B9016113C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Mjmgdhv5UfpQ for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 11:34:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A80C6110D
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A80C6110D
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 11:34:44 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id 99so4561774pjz.4
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 03:34:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CyDN7gQot7TPvJ3Mg2drt9XpeodIBIYn7OsexPZMM9A=;
 b=TQDQi/8QmAezzrnfLKE1lwkpFdjMbnJRzcR6Vs6lt318kHi502F1M9CFl76KHeTz1E
 Jx4PeBvPCNkGlNBHmXsDmy5szzTuuvTItx+BGTq0iqF6cAOVWebaeytsJ9GbyPaUX06l
 4KKW4Ym7BcHUiys148QrDufSJNoJUhdOEpQ4+lYxd+DT5zqQxFPZsmvjWPN9A2hl/rOy
 cb4Lbx/CzpYwqaVy4nkhwQkqrtcOmX2tNT6MVc2/klkg2zwgk0/UU8fRoFF4NNBalsMi
 +t1svey5cApJNQyBGYmdPVgSGSkpGO12jAIjXvVErJhnTDoS+mneo/A1Uq5sF6u+AfXZ
 HFJA==
X-Gm-Message-State: AO0yUKV4iRPlGr/EjQOtcbJ+zIIelb6UonkHnXkUn2CjY2xHkiPJI4El
 spazHk8iIFACZDAtiqjw8wilFHofdcMHToQ+Pdko3sKzYso=
X-Google-Smtp-Source: AK7set8JOrQCNBXi6m0nw+jK5hVlw8kmXRTvQ1kEfcKFiScpNS+2fOase97Fn6whygE+yQkCFlUo8rfzkraSfqG1jx4=
X-Received: by 2002:a17:90b:1b0a:b0:233:ebe0:371 with SMTP id
 nu10-20020a17090b1b0a00b00233ebe00371mr2212225pjb.40.1676979283485; Tue, 21
 Feb 2023 03:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20230220231902.340496-1-fontaine.fabrice@gmail.com>
 <20230221093719.5215ef5d@windsurf>
In-Reply-To: <20230221093719.5215ef5d@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 21 Feb 2023 12:34:32 +0100
Message-ID: <CAPi7W83eNioTFO9ok7gz9LBZVCorpiaAbU917y9EVtDdgbwX0A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CyDN7gQot7TPvJ3Mg2drt9XpeodIBIYn7OsexPZMM9A=;
 b=E7t+zaRN55I5Co6X2bswfNsyvZOqCvBuelaBqZuEorbnFxLAw+xdIfLgLLD59FU8e0
 uhXyo81mhJWMtrwB9rpto4AgBLCFk6liaUM8tHMA4vP39jBOyKZaCB6bZTCiR54d0O5+
 lKBe/8KXZ+zrDJgKnCtYntM66SZSPWiNwkfTXE217lFHcIdGEo8UjOV8zcKqjq0g+MXx
 36d9vYK6jN2jcKbaPAe8xbBmUkOkM6lfetOUBboTV4vGhCBWi9XKw4eXanQDE/33Ehfs
 Vu231sRY0GItZ5EVZ8O9DyA8p3pmwQGpsssfSg2V4bO/BS2wAoV5R5gEQ/dsV6/phNwW
 vGxg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=E7t+zaRN
Subject: Re: [Buildroot] [PATCH 1/1] package/fluent-bit: fix build without
 C++
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8040491164790247416=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8040491164790247416==
Content-Type: multipart/alternative; boundary="0000000000007cec5705f5342af8"

--0000000000007cec5705f5342af8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 21 f=C3=A9vr. 2023 =C3=A0 09:37, Thomas Petazzoni <
thomas.petazzoni@bootlin.com> a =C3=A9crit :

> On Tue, 21 Feb 2023 00:19:02 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > Commit dedbc69022ba0beaf259463ac8082c86776f7e88 was incomplete resuling
> > in the following build failure since the addition of the package in
> > commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483:
> >
> > -- Check for working CXX compiler: /usr/bin/c++ - broken
> > CMake Error at
> /home/autobuild/autobuild/instance-15/output-1/per-package/fluent-bit/hos=
t/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62
> (message):
> >   The C++ compiler
> >
> >     "/usr/bin/c++"
> >
> >   is not able to compile a simple test program.
> >
> >   It fails with the following output:
> >
> >     Change Dir:
> /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMa=
keFiles/CMakeTmp
> >
> >     Run Build Command(s):/home/autobuild/make/make -f Makefile
> cmTC_bfb29/fast && make[1]: Entering directory
> '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CM=
akeFiles/CMakeTmp'
> >     /home/autobuild/make/make  -f CMakeFiles/cmTC_bfb29.dir/build.make
> CMakeFiles/cmTC_bfb29.dir/build
> >     make[2]: Entering directory
> '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CM=
akeFiles/CMakeTmp'
> >     Building CXX object CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o
> >     /usr/bin/c++
> --sysroot=3D/home/autobuild/autobuild/instance-15/output-1/per-package/fl=
uent-bit/host/xtensa-buildroot-linux-uclibc/sysroot
>  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64
> -mlongcalls -mauto-litpools -O2 -g0  -fcommon -U_FILE_OFFSET_BITS  -g -fP=
IE
> -o CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o -c
> /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMa=
keFiles/CMakeTmp/testCXXCompiler.cxx
> >     c++: error: unrecognized command-line option '-mlongcalls'
> >     c++: error: unrecognized command-line option '-mauto-litpools'
> >     make[2]: *** [CMakeFiles/cmTC_bfb29.dir/build.make:78:
> CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o] Error 1
> >     make[2]: Leaving directory
> '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CM=
akeFiles/CMakeTmp'
> >     make[1]: *** [Makefile:127: cmTC_bfb29/fast] Error 2
> >     make[1]: Leaving directory
> '/home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CM=
akeFiles/CMakeTmp'
> >
> >   CMake will not be able to correctly generate this project.
> > Call Stack (most recent call first):
> >   lib/msgpack-c/CMakeLists.txt:2 (project)
> >
> > While at it, add missing comment about C++ dependency for wasm
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/4b0f90d79d6dbbf976acf1da839260b0ee=
94ddda
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../fluent-bit/0003-fix-build-without-C.patch | 131 ++++++++++++++++++
> >  package/fluent-bit/Config.in                  |   4 +
> >  2 files changed, 135 insertions(+)
> >  create mode 100644 package/fluent-bit/0003-fix-build-without-C.patch
>
> Applied to master, thanks.
>

A build failure is raised when applying patch because of line ending in
lib/snappy-fef67ac/CMakeLists.txt


>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com


Best Regards,

Fabrice

--0000000000007cec5705f5342af8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 21 f=C3=A9vr. 2023 =C3=
=A0=C2=A009:37, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@boo=
tlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 21 Feb 2023 00:1=
9:02 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Commit dedbc69022ba0beaf259463ac8082c86776f7e88 was incomplete resulin=
g<br>
&gt; in the following build failure since the addition of the package in<br=
>
&gt; commit 6a0f7c39bcb48fc13aa2ce3fc4996baf1be66483:<br>
&gt; <br>
&gt; -- Check for working CXX compiler: /usr/bin/c++ - broken<br>
&gt; CMake Error at /home/autobuild/autobuild/instance-15/output-1/per-pack=
age/fluent-bit/host/share/cmake-3.22/Modules/CMakeTestCXXCompiler.cmake:62 =
(message):<br>
&gt;=C2=A0 =C2=A0The C++ compiler<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;/usr/bin/c++&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0is not able to compile a simple test program.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0It fails with the following output:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Change Dir: /home/autobuild/autobuild/instance-15/o=
utput-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Run Build Command(s):/home/autobuild/make/make -f M=
akefile cmTC_bfb29/fast &amp;&amp; make[1]: Entering directory &#39;/home/a=
utobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/C=
MakeTmp&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0/home/autobuild/make/make=C2=A0 -f CMakeFiles/cmTC_=
bfb29.dir/build.make CMakeFiles/cmTC_bfb29.dir/build<br>
&gt;=C2=A0 =C2=A0 =C2=A0make[2]: Entering directory &#39;/home/autobuild/au=
tobuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp&#39=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Building CXX object CMakeFiles/cmTC_bfb29.dir/testC=
XXCompiler.cxx.o<br>
&gt;=C2=A0 =C2=A0 =C2=A0/usr/bin/c++ --sysroot=3D/home/autobuild/autobuild/=
instance-15/output-1/per-package/fluent-bit/host/xtensa-buildroot-linux-ucl=
ibc/sysroot=C2=A0 =C2=A0-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_O=
FFSET_BITS=3D64 -mlongcalls -mauto-litpools -O2 -g0=C2=A0 -fcommon -U_FILE_=
OFFSET_BITS=C2=A0 -g -fPIE -o CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx=
.o -c /home/autobuild/autobuild/instance-15/output-1/build/fluent-bit-2.0.9=
/CMakeFiles/CMakeTmp/testCXXCompiler.cxx<br>
&gt;=C2=A0 =C2=A0 =C2=A0c++: error: unrecognized command-line option &#39;-=
mlongcalls&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0c++: error: unrecognized command-line option &#39;-=
mauto-litpools&#39;<br>
&gt;=C2=A0 =C2=A0 =C2=A0make[2]: *** [CMakeFiles/cmTC_bfb29.dir/build.make:=
78: CMakeFiles/cmTC_bfb29.dir/testCXXCompiler.cxx.o] Error 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0make[2]: Leaving directory &#39;/home/autobuild/aut=
obuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp&#39;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0make[1]: *** [Makefile:127: cmTC_bfb29/fast] Error =
2<br>
&gt;=C2=A0 =C2=A0 =C2=A0make[1]: Leaving directory &#39;/home/autobuild/aut=
obuild/instance-15/output-1/build/fluent-bit-2.0.9/CMakeFiles/CMakeTmp&#39;=
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0CMake will not be able to correctly generate this project.=
<br>
&gt; Call Stack (most recent call first):<br>
&gt;=C2=A0 =C2=A0lib/msgpack-c/CMakeLists.txt:2 (project)<br>
&gt; <br>
&gt; While at it, add missing comment about C++ dependency for wasm<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/4b0f90d79d6d=
bbf976acf1da839260b0ee94ddda" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/4b0f90d79d6dbbf976acf1da839260b0ee94ddda</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../fluent-bit/0003-fix-build-without-C.patch | 131 ++++++++++++=
++++++<br>
&gt;=C2=A0 package/fluent-bit/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +<br>
&gt;=C2=A0 2 files changed, 135 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/fluent-bit/0003-fix-build-without-C.p=
atch<br>
<br>
Applied to master, thanks.<br></blockquote><div><br></div><div>A build fail=
ure is raised when applying patch because of line ending in lib/snappy-fef6=
7ac/CMakeLists.txt</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, CTO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice <br></div></div></div>

--0000000000007cec5705f5342af8--

--===============8040491164790247416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8040491164790247416==--
