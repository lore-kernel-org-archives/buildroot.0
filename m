Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBF0C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 09:13:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0E42607CA;
	Sun,  7 Aug 2022 09:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0E42607CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WrgEzOIBz5qx; Sun,  7 Aug 2022 09:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7749B607CE;
	Sun,  7 Aug 2022 09:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7749B607CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 462991BF83B
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 09:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F067416E4
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 09:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F067416E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T8rh_08IKGMt for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 09:12:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9894E416E3
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9894E416E3
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 09:12:55 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id y127so9666979yby.8
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 02:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YtkcU/RIibIlQAMmQjObIF/6GY8tyYZ2Nw7Fn/6Xe/I=;
 b=YJ1AdbKVRPIwKxNZhGyvdKWFrRwCQ7Cx6NgsmoEA3PR8QUG83OGibuT0ASen4uPkv7
 DjAqzttfMUDTgR2/03bImT7Vlvr6j60qtAtsnDFQrPB3CHzQeSEdJeRlpu9JLmhLfgWA
 q9K2dUaT1/girDICCn+GvASAgBRW18hzf/PB89Z00cpzIjr4rdfSwKfpp7S+WpwwmCO/
 unn/GMJy+Zt8kMCmxdUbWVPvgEyJTUfkEdFsD5k1nHT+XnfxUxUEOzNJbG7wXLK94/2d
 Cq1gf/8TM54ZcOAo+UxR1UMIPoh8V9UOO5n7SS5w4WfHkPeDZyj0rO/dfEGLKNc2f/Yq
 UA4g==
X-Gm-Message-State: ACgBeo3l8U6/YSiQE4kdkmNLmkYo4p7jZVRxZeMVGOGMRi3NP252u/SH
 Kl3iyeWTSYhg6HWfLQ39HDP10rwf7bOX6q3K4Wf94Hjdg9c+xA==
X-Google-Smtp-Source: AA6agR6xDBnBhd9Ec3RqTO+5t+XF7u8oA7igOcMLiGXg/KoNwHmFZ1R818bfceI9HaSVC7MhREejFJN0SxtUE1zYu+Q=
X-Received: by 2002:a25:f309:0:b0:671:8725:7f22 with SMTP id
 c9-20020a25f309000000b0067187257f22mr11770368ybs.512.1659863574127; Sun, 07
 Aug 2022 02:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <CAPn86JAvLDjLZYGTvCeJDD45o7Erro2aM8wYzRO73OWW3ehfVw@mail.gmail.com>
 <575D4695-1A46-4431-90F2-63212188CDD1@benettiengineering.com>
 <CAPn86JC8tsPtbGZ=W1V5sgf70UsaFOtLWKwhdChxBg-k2RZVDA@mail.gmail.com>
 <8aafffc2-748f-becd-cac3-da7a3fad44be@benettiengineering.com>
 <bd7951cb-20cd-ed82-90c1-5eb6cf6af3e7@benettiengineering.com>
In-Reply-To: <bd7951cb-20cd-ed82-90c1-5eb6cf6af3e7@benettiengineering.com>
From: Stefano Cottafavi <stefano.cottafavi@gmail.com>
Date: Sun, 7 Aug 2022 11:12:43 +0200
Message-ID: <CAPn86JDxY2BXfUYJ5pq9+ZkuhihgFhP7uGx9q=vkCK-1v2hyhA@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YtkcU/RIibIlQAMmQjObIF/6GY8tyYZ2Nw7Fn/6Xe/I=;
 b=jMp1YD+UY4wNo+/xc/EeMBYtGn/4s7ekEu0KBrdEgcmMyVG1dmqu8+YnEOo37OvTwi
 uThSUhe7cqa/QOHRFckfcmncvWdw/NvTRgfawF0WiX0W8HCBY2DcfhMVqXY3/Ag9yglu
 H8CcjjjrmO78OlXjo+rbCVy639zLThty0PLnlEO8YNRFtbf9sOvsddiHBjJIBUS0ga/l
 L3P0luIqP2hzn4jpwJWSgHnggsjxfYZ+UwRn8/B43ey2kG5VTuMzVsWtXWQ0aaiFlx/+
 md9XilcyW52MHdmI6ICTQdNSmXS67Al6VlmUzh7JC1hdszZ53lEhvvFUm+gTF80xw/hk
 sM8Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jMp1YD+U
Subject: Re: [Buildroot] OpenCV modules headers not in the SDK
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
Content-Type: multipart/mixed; boundary="===============6994680976390533207=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6994680976390533207==
Content-Type: multipart/alternative; boundary="000000000000b6284105e5a31a24"

--000000000000b6284105e5a31a24
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giulio,
thanks for trying that out. Your assumptions are correct, I export the SDK
with "make sdk" and use that in QtCreator to build my application.

Looking at the location you pointed out I can indeed find some of the
headers, but not all of the opencv modules that have been enabled in the
defconfig.
As per my original message I believe the problem is somewhat related to
(some of?) the modules.
Sticking to the case of objdetect module and following the breadcrumbs:
- the module is enabled in defconfig with
BR2_PACKAGE_OPENCV4_LIB_OBJDETECT=3Dy
- the module src are available to buildroot in
output/build/opencv4-4.5.5/modules/objdetect/

yet the module is not flagged for compilation in
output/build/opencv4-4.5.5/buildroot-build/opencv2/

#define HAVE_OPENCV_CALIB3D
#define HAVE_OPENCV_CORE
#define HAVE_OPENCV_FEATURES2D
#define HAVE_OPENCV_FLANN
#define HAVE_OPENCV_GAPI
#define HAVE_OPENCV_IMGCODECS
#define HAVE_OPENCV_IMGPROC
#define HAVE_OPENCV_ML
#define HAVE_OPENCV_VIDEO
#define HAVE_OPENCV_VIDEOIO

and never makes it to the sysroot of the sdk, on my end.
can you reproduce the issue?

Stef


On Sun, Aug 7, 2022 at 12:46 AM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Stefano,
>
> On 06/08/22 23:54, Giulio Benetti wrote:
> > Subject:
> > Re: [Buildroot] OpenCV modules headers not in the SDK
> > From:
> > Giulio Benetti <giulio.benetti@benettiengineering.com>
> > Date:
> > 06/08/22, 23:54
> >
> > To:
> > Stefano Cottafavi <stefano.cottafavi@gmail.com>
> > CC:
> > buildroot@buildroot.org
> >
> >
> > Hi Stefano,
> >
> > On 06/08/22 20:15, Stefano Cottafavi wrote:
> >> Hi Giulio,
> >> thanks for the quick reply. Here's the defconfig
> >> https://pastebin.com/Xsh5d4HG <https://pastebin.com/Xsh5d4HG>
> >> For the sake of completeness I didn't remove any of the lines, but
> >> some are specific to my out-of-tree folder and overlays, so you might
> >> want to get rid of those.
> >>
> >> I'm currently building the 2022.05.1 tag with SHA
> >> 2e399893b4f60f1e103228df6e4439d4e4ac3dd5
> >
> > Thank you. I'm building it right now. The package opencv4.mk looks
> > correct because it does have OPENCV4_INSTALL_STAGING =3D YES, and that
> > should install the header files. If there is a bug it could be inside
> > opencv4 cmake itself.
> >
> > By the way, I guess the problem you're experience is that you after
> > building the Buildroot's defconfig you try to build another application
> > (i.e. a qt5 application) that requires opencv4 and it can't find the
> > headers, right?
>
> I've built and I can find the headers(.hpp) files under:
>
> output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/opencv4/ope=
ncv2
> according to:
> https://docs.opencv.org/4.x/examples.html
> where all examples include directly:
> #include "opencv2/shape.hpp"
> ...
>
> Can you double check if files are there?
>
> If you can find them then it could be a problem with your application
> include path where you should explictly add
> "output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/opencv4"
> to -I search path. In Qt5,
> that I suspect you're using, add INCLUDEPATH to .pro file and re-run
> qmake and then rebuild.
>
> Let me know if this fixes the problems.
>
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
>
> > Best regards
> > --
> > Giulio Benetti
> > Benetti Engineering sas
> >
> >> Looking forward to your insights.
> >>
> >> Best
> >> Stefano
> >>
> >> On Sat, Aug 6, 2022 at 7:43 PM Giulio Benetti
> >> <giulio.benetti@benettiengineering.com
> >> <mailto:giulio.benetti@benettiengineering.com>> wrote:
> >>
> >>     Hi Stefano,
> >>
> >>>     Il giorno 6 ago 2022, alle ore 19:29, Stefano Cottafavi
> >>>     <stefano.cottafavi@gmail.com <mailto:stefano.cottafavi@gmail.com>=
>
> >>>     ha scritto:
> >>>
> >>>     =EF=BB=BF
> >>>     Hi all,
> >>>     I've successfully built Buildroot 2022.05 for the Raspberry Pi4
> >>>     adding support for Qt5 and OpenCV (including objdetect module
> >>>     amongst few other).
> >>>     I've also managed to generate the SDK for such a build however I
> >>>     can't find the header files of those OpenCV modules anywhere in
> >>>     the SDK.
> >>>
> >>>     Is this expected or a bug?
> >>
> >>     It looks like a bug. Can you please pastebin your specific
> defconfig?
> >>
> >>     You can obtain it moving to your output folder and  issuing:
> >>     $ make savedeconfig
> >>     then you obtain a file called defconfig so copy and paste it on
> >>     pastebin and provide here
> >>     the link to the pastebin and also the SHA1 commit of your Buildroo=
t
> >>     git or the specific version.
> >>
> >>     This way we can help you.
> >>
> >>     Best regards
> >>     =E2=80=94
> >>     Giulio Benetti
> >>     CEO/CTO@Benetti Engineering sas
> >>
> >>>
> >>>     Cheers,
> >>>     Stefano
> >>>     _______________________________________________
> >>>     buildroot mailing list
> >>> buildroot@buildroot.org <mailto:buildroot@buildroot.org>
> >>> https://lists.buildroot.org/mailman/listinfo/buildroot
> >>> <https://lists.buildroot.org/mailman/listinfo/buildroot>
> >>
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot@buildroot.org
> >> https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000b6284105e5a31a24
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Giulio,</div><div class=3D"gmail_default" s=
tyle=3D"font-family:monospace,monospace;font-size:small">thanks for trying =
that out. Your assumptions are correct, I export the SDK with &quot;make sd=
k&quot; and use that in QtCreator to build my application.</div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,mon=
ospace;font-size:small">Looking at the location you pointed out I can indee=
d find some of the headers, but not all of the opencv modules that have bee=
n enabled in the defconfig.</div><div class=3D"gmail_default" style=3D"font=
-family:monospace,monospace;font-size:small">As per my original message I b=
elieve the problem is somewhat related to (some of?) the modules.=C2=A0</di=
v><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;fon=
t-size:small">Sticking to the case of objdetect module and following the br=
eadcrumbs:</div><div class=3D"gmail_default" style=3D"font-family:monospace=
,monospace;font-size:small">- the module is enabled in defconfig with=C2=A0=
<span style=3D"color:rgb(0,0,0);white-space:pre-wrap;font-family:Consolas,M=
enlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;De=
jaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,monospace,serif;f=
ont-size:12px">BR2_PACKAGE_OPENCV4_LIB_OBJDETECT=3Dy</span></div><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small=
"><span style=3D"color:rgb(0,0,0);white-space:pre-wrap;font-family:Consolas=
,Menlo,Monaco,&quot;Lucida Console&quot;,&quot;Liberation Mono&quot;,&quot;=
DejaVu Sans Mono&quot;,&quot;Bitstream Vera Sans Mono&quot;,monospace,serif=
;font-size:12px">- the module src are available to buildroot in </span><spa=
n style=3D"font-family:Arial,Helvetica,sans-serif">output/build/opencv4-4.5=
.5/modules/objdetect/</span></div><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace;font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">yet the module is not flagged for compi=
lation in output/build/opencv4-4.5.5/buildroot-build/opencv2/<br><br>#defin=
e HAVE_OPENCV_CALIB3D<br>#define HAVE_OPENCV_CORE<br>#define HAVE_OPENCV_FE=
ATURES2D<br>#define HAVE_OPENCV_FLANN<br>#define HAVE_OPENCV_GAPI<br>#defin=
e HAVE_OPENCV_IMGCODECS<br>#define HAVE_OPENCV_IMGPROC<br>#define HAVE_OPEN=
CV_ML<br>#define HAVE_OPENCV_VIDEO<br>#define HAVE_OPENCV_VIDEOIO<br></div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">and never makes it to the sysr=
oot of the sdk, on my end.</div><div class=3D"gmail_default" style=3D"font-=
size:small">can you reproduce the issue?</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">Stef</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Aug 7, 2022 at 12:46 AM Giulio Benetti &lt;<a href=
=3D"mailto:giulio.benetti@benettiengineering.com" target=3D"_blank">giulio.=
benetti@benettiengineering.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi Stefano,<br>
<br>
On 06/08/22 23:54, Giulio Benetti wrote:<br>
&gt; Subject:<br>
&gt; Re: [Buildroot] OpenCV modules headers not in the SDK<br>
&gt; From:<br>
&gt; Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengineering=
.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;<br>
&gt; Date:<br>
&gt; 06/08/22, 23:54<br>
&gt; <br>
&gt; To:<br>
&gt; Stefano Cottafavi &lt;<a href=3D"mailto:stefano.cottafavi@gmail.com" t=
arget=3D"_blank">stefano.cottafavi@gmail.com</a>&gt;<br>
&gt; CC:<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <br>
&gt; <br>
&gt; Hi Stefano,<br>
&gt; <br>
&gt; On 06/08/22 20:15, Stefano Cottafavi wrote:<br>
&gt;&gt; Hi Giulio,<br>
&gt;&gt; thanks for the quick reply. Here&#39;s the defconfig <br>
&gt;&gt; <a href=3D"https://pastebin.com/Xsh5d4HG" rel=3D"noreferrer" targe=
t=3D"_blank">https://pastebin.com/Xsh5d4HG</a> &lt;<a href=3D"https://paste=
bin.com/Xsh5d4HG" rel=3D"noreferrer" target=3D"_blank">https://pastebin.com=
/Xsh5d4HG</a>&gt;<br>
&gt;&gt; For the sake of completeness I didn&#39;t remove any of the lines,=
 but <br>
&gt;&gt; some are specific to my out-of-tree folder and overlays, so you mi=
ght <br>
&gt;&gt; want to get rid of those.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m currently building the 2022.05.1 tag with SHA <br>
&gt;&gt; 2e399893b4f60f1e103228df6e4439d4e4ac3dd5<br>
&gt; <br>
&gt; Thank you. I&#39;m building it right now. The package <a href=3D"http:=
//opencv4.mk" rel=3D"noreferrer" target=3D"_blank">opencv4.mk</a> looks<br>
&gt; correct because it does have OPENCV4_INSTALL_STAGING =3D YES, and that=
<br>
&gt; should install the header files. If there is a bug it could be inside<=
br>
&gt; opencv4 cmake itself.<br>
&gt; <br>
&gt; By the way, I guess the problem you&#39;re experience is that you afte=
r<br>
&gt; building the Buildroot&#39;s defconfig you try to build another applic=
ation<br>
&gt; (i.e. a qt5 application) that requires opencv4 and it can&#39;t find t=
he<br>
&gt; headers, right?<br>
<br>
I&#39;ve built and I can find the headers(.hpp) files under:<br>
output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/opencv4/openc=
v2<br>
according to:<br>
<a href=3D"https://docs.opencv.org/4.x/examples.html" rel=3D"noreferrer" ta=
rget=3D"_blank">https://docs.opencv.org/4.x/examples.html</a><br>
where all examples include directly:<br>
#include &quot;opencv2/shape.hpp&quot;<br>
...<br>
<br>
Can you double check if files are there?<br>
<br>
If you can find them then it could be a problem with your application<br>
include path where you should explictly add <br>
&quot;output/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/opencv4=
&quot; <br>
to -I search path. In Qt5,<br>
that I suspect you&#39;re using, add INCLUDEPATH to .pro file and re-run<br=
>
qmake and then rebuild.<br>
<br>
Let me know if this fixes the problems.<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
Benetti Engineering sas<br>
<br>
&gt; Best regards<br>
&gt; -- <br>
&gt; Giulio Benetti<br>
&gt; Benetti Engineering sas<br>
&gt; <br>
&gt;&gt; Looking forward to your insights.<br>
&gt;&gt;<br>
&gt;&gt; Best<br>
&gt;&gt; Stefano<br>
&gt;&gt;<br>
&gt;&gt; On Sat, Aug 6, 2022 at 7:43 PM Giulio Benetti <br>
&gt;&gt; &lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com" targe=
t=3D"_blank">giulio.benetti@benettiengineering.com</a> <br>
&gt;&gt; &lt;mailto:<a href=3D"mailto:giulio.benetti@benettiengineering.com=
" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt;&gt; wrote=
:<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Hi Stefano,<br>
&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 Il giorno 6 ago 2022, alle ore 19:29, Stefa=
no Cottafavi<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 &lt;<a href=3D"mailto:stefano.cottafavi@gma=
il.com" target=3D"_blank">stefano.cottafavi@gmail.com</a> &lt;mailto:<a hre=
f=3D"mailto:stefano.cottafavi@gmail.com" target=3D"_blank">stefano.cottafav=
i@gmail.com</a>&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 ha scritto:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 =EF=BB=BF<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 Hi all,<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 I&#39;ve successfully built Buildroot 2022.=
05 for the Raspberry Pi4<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 adding support for Qt5 and OpenCV (includin=
g objdetect module<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 amongst few other).<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 I&#39;ve also managed to generate=C2=A0the =
SDK for such a build however I<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 can&#39;t find the header files of those Op=
enCV modules anywhere in<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 the SDK.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 Is this expected or a bug?<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 It looks like a bug. Can you please pastebin yo=
ur specific defconfig?<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 You can obtain it moving to your output folder =
and =C2=A0issuing:<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 $ make savedeconfig<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 then you obtain a file called defconfig so copy=
 and paste it on<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 pastebin and provide here<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 the link to the pastebin and also the SHA1 comm=
it of your Buildroot<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 git or the specific version.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 This way we can help you.<br>
&gt;&gt;<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Best regards<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 =E2=80=94<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 Giulio Benetti<br>
&gt;&gt; =C2=A0=C2=A0=C2=A0 CEO/CTO@Benetti Engineering sas<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 Cheers,<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 Stefano<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 ___________________________________________=
____<br>
&gt;&gt;&gt; =C2=A0=C2=A0=C2=A0 buildroot mailing list<br>
&gt;&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">b=
uildroot@buildroot.org</a> &lt;mailto:<a href=3D"mailto:buildroot@buildroot=
.org" target=3D"_blank">buildroot@buildroot.org</a>&gt;<br>
&gt;&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildr=
oot" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailm=
an/listinfo/buildroot</a><br>
&gt;&gt;&gt; &lt;<a href=3D"https://lists.buildroot.org/mailman/listinfo/bu=
ildroot" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/m=
ailman/listinfo/buildroot</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; _______________________________________________<br>
&gt;&gt; buildroot mailing list<br>
&gt;&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">build=
root@buildroot.org</a><br>
&gt;&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/l=
istinfo/buildroot</a><br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
</blockquote></div>

--000000000000b6284105e5a31a24--

--===============6994680976390533207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6994680976390533207==--
