Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD51BC4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 20:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80F0240448;
	Fri,  1 Dec 2023 20:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80F0240448
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RoolRjuajKIs; Fri,  1 Dec 2023 20:32:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17B6C40492;
	Fri,  1 Dec 2023 20:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17B6C40492
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E995E1BF2BF
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEDBB845F9
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 20:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEDBB845F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlY3lqt8ahHF for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 20:32:16 +0000 (UTC)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B30A845EF
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 20:32:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B30A845EF
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bc4fe8158so3669906e87.0
 for <buildroot@buildroot.org>; Fri, 01 Dec 2023 12:32:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701462734; x=1702067534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H2/oZvwJILB3PRFY+AnkxrmdarRO1MSHtwMoqQoMiQo=;
 b=aCxlTaPZ0j4lO0/yYjCsVy8erHdmwSe6mL2QbEa8SPZdr/zFuXzHkXgRdkvVYLgYTx
 QDNpEOfVmSjdpP4QXbXpPkjUYZLUkddvyjwEiuE5grPY5Gns+zPb1oApR4Pd7GZt75QW
 94L0biTQr+ua6LwaRYTIV0j2iqVX08kxooWKSHxUQcTbknJczbfI9hH1fzPMrHntzdxw
 Omvydqu9IhYCBdfKQ1R5RDSI+HX6upFLoxFMz6YShumoIO58JZGq8Ekp/pCZhiTf76t6
 Hc07FG7a26/VzuNN2mfeEWjqoRSARa6ZZ4NA3JkejADm5V4LNpnKgo3Ms1ePj+fxNPyV
 2zzg==
X-Gm-Message-State: AOJu0YxWFRrsbiL/h7cOSlVLY6ydB6gZR50MAKXw0mSew9xju0fWNhpF
 QKJ7EKpJLxwwE0B9feYObDBb6V5+1FNrfRSw6kw=
X-Google-Smtp-Source: AGHT+IFMkgvaPksqtJXjTnIZK67kug8VBtSBBheBpkLmeE73CpL1JhKkjo0S7uhrdL4JVEnk2F2FvYWCk+Z9AHlqR/4=
X-Received: by 2002:a05:6512:3d05:b0:50b:d764:9666 with SMTP id
 d5-20020a0565123d0500b0050bd7649666mr1769504lfv.74.1701462733734; Fri, 01 Dec
 2023 12:32:13 -0800 (PST)
MIME-Version: 1.0
References: <20231130191305.5345-1-fontaine.fabrice@gmail.com>
 <87fs0l4qfj.fsf@48ers.dk>
In-Reply-To: <87fs0l4qfj.fsf@48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 1 Dec 2023 21:32:02 +0100
Message-ID: <CAPi7W82HqhVMjhKYQrFX2QYSR6=PrTX=bkzfioa4NHyBM6+rAg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701462734; x=1702067534; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H2/oZvwJILB3PRFY+AnkxrmdarRO1MSHtwMoqQoMiQo=;
 b=iw65b/N6QeVJT4H+oAewDhhaY49zLxjjSFJF379pLHV9DhHKuHd8hkVFCnixVNP8vB
 qU7LSNAUnMw5cED5YGBtuH1NnkDVKYE+jwXHVUS713A88cvzCfcOmf7a/Zzfr2qYdi60
 3+qlvyH+p0Z5e7eGWTk5VVkh8109joQ0DojJDeBfvHnqIQFRSPOjV7o+4qHpPYxa/2V+
 PQ/m+2B2FuRan17ni7SkVG8svTXJV02CH1Diesb4KhHsE66QyfM1DOvkLjyqKlK8Ivst
 LFg/UAL/SLpOLvZNyPuf6/DLhXCk4S4B8ynMbcEAmU+Xu3msOqdli9RVOm76xn3qYF+5
 gRQQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iw65b/N6
Subject: Re: [Buildroot] [PATCH 1/1] package/libselinux: fix build with
 BR2_TIME_BITS_64
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8905644050444586876=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8905644050444586876==
Content-Type: multipart/alternative; boundary="000000000000d7c8c4060b78a96a"

--000000000000d7c8c4060b78a96a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le ven. 1 d=C3=A9c. 2023 =C3=A0 21:29, Peter Korsgaard <peter@korsgaard.com=
> a =C3=A9crit :

> >>>>> "Fabrice" =3D=3D Fabrice Fontaine <fontaine.fabrice@gmail.com> writ=
es:
>
>  > Do not remove _FILE_OFFSET_BITS=3D64 from CFLAGS and CPPFLAGS to avoid=
 the
>  > following build failure with BR2_TIME_BITS_64 raised since commit
>  > 3c427c64726560ea1743282a3fdb78f5b28692eb:
>
>  > In file included from
> /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host=
/mipsel-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
>  >                  from
> /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host=
/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:33=
,
>  >                  from
> /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host=
/mipsel-buildroot-linux-gnu/sysroot/usr/include/stdint.h:26,
>  >                  from
> /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host=
/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/include/stdint.h:9,
>  >                  from ../include/selinux/avc.h:9,
>  >                  from avc.c:10:
>  >
> /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/host=
/mipsel-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5:
> error: #error "_TIME_BITS=3D64 is allowed only with _FILE_OFFSET_BITS=3D6=
4"
>  >    26 | #   error "_TIME_BITS=3D64 is allowed only with
> _FILE_OFFSET_BITS=3D64"
>  >       |     ^~~~~
>
>  > This LFS workaround for glibc < 2.23 was added in 2016 by commit
>  > ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0 and is probably not needed
>  > anymore as glibc 2.23 was released in February 2016:
>  > https://sourceware.org/glibc/wiki/Release/2.23
>
>  > Fixes:
>  >  -
> http://autobuild.buildroot.org/results/d85c81f87adf3a5945fa369bcec233e6de=
f2ed12
>
> Hmm, probably. We do have similar code elsewhere as well though,
> presumably that needs to be removed as well?
>

Yes, but before sending a bunch of patches, I wanted to get your feedback
on this one to avoid wasting time.


>
> git grep 'filter-out.*D_FILE_OFFSET_BITS=3D' package/**/*mk
> package/elfutils/elfutils.mk:ELFUTILS_CFLAGS =3D $(filter-out
> -D_FILE_OFFSET_BITS=3D64,$(TARGET_CFLAGS))
> package/elfutils/elfutils.mk:ELFUTILS_CPPFLAGS =3D $(filter-out
> -D_FILE_OFFSET_BITS=3D64,$(TARGET_CPPFLAGS))
> package/libselinux/libselinux.mk:       CFLAGS=3D"$(filter-out
> -D_FILE_OFFSET_BITS=3D64,$(TARGET_CFLAGS))" \
> package/libselinux/libselinux.mk:       CPPFLAGS=3D"$(filter-out
> -D_FILE_OFFSET_BITS=3D64,$(TARGET_CPPFLAGS))"
> package/ltp-testsuite/ltp-testsuite.mk:LTP_TESTSUITE_CFLAGS =3D
> $(filter-out -D_FILE_OFFSET_BITS=3D64,$(TARGET_CFLAGS))
> package/ltp-testsuite/ltp-testsuite.mk:LTP_TESTSUITE_CPPFLAGS =3D
> $(filter-out -D_FILE_OFFSET_BITS=3D64,$(TARGET_CPPFLAGS))
> package/musl/musl.mk:           CFLAGS=3D"$(filter-out -D_LARGEFILE_SOURC=
E
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64,$(TARGET_CFLAGS))
> $(MUSL_EXTRA_CFLAGS)" \
> package/musl/musl.mk:           CPPFLAGS=3D"$(filter-out
> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64,$(TARGET_CPPFLAGS))" \
>
> --
> Bye, Peter Korsgaard
>

Best Regards,

Fabrice

--000000000000d7c8c4060b78a96a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 1 d=C3=A9c. 2023 =C3=
=A0=C2=A021:29, Peter Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">=
peter@korsgaard.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Fabrice&quot; =
=3D=3D Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" t=
arget=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Do not remove _FILE_OFFSET_BITS=3D64 from CFLAGS and CPPFLAGS to=
 avoid the<br>
=C2=A0&gt; following build failure with BR2_TIME_BITS_64 raised since commi=
t<br>
=C2=A0&gt; 3c427c64726560ea1743282a3fdb78f5b28692eb:<br>
<br>
=C2=A0&gt; In file included from /home/autobuild/autobuild/instance-9/outpu=
t-1/per-package/libselinux/host/mipsel-buildroot-linux-gnu/sysroot/usr/incl=
ude/features.h:394,<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fr=
om /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/hos=
t/mipsel-buildroot-linux-gnu/sysroot/usr/include/bits/libc-header-start.h:3=
3,<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fr=
om /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/hos=
t/mipsel-buildroot-linux-gnu/sysroot/usr/include/stdint.h:26,<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fr=
om /home/autobuild/autobuild/instance-9/output-1/per-package/libselinux/hos=
t/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/include/stdint.h:9,<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fr=
om ../include/selinux/avc.h:9,<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fr=
om avc.c:10:<br>
=C2=A0&gt; /home/autobuild/autobuild/instance-9/output-1/per-package/libsel=
inux/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:=
26:5: error: #error &quot;_TIME_BITS=3D64 is allowed only with _FILE_OFFSET=
_BITS=3D64&quot;<br>
=C2=A0&gt;=C2=A0 =C2=A0 26 | #=C2=A0 =C2=A0error &quot;_TIME_BITS=3D64 is a=
llowed only with _FILE_OFFSET_BITS=3D64&quot;<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0^~~~~<br>
<br>
=C2=A0&gt; This LFS workaround for glibc &lt; 2.23 was added in 2016 by com=
mit<br>
=C2=A0&gt; ebcca24c953d8df4b16bc52c5ba31feae4ed8ad0 and is probably not nee=
ded<br>
=C2=A0&gt; anymore as glibc 2.23 was released in February 2016:<br>
=C2=A0&gt; <a href=3D"https://sourceware.org/glibc/wiki/Release/2.23" rel=
=3D"noreferrer" target=3D"_blank">https://sourceware.org/glibc/wiki/Release=
/2.23</a><br>
<br>
=C2=A0&gt; Fixes:<br>
=C2=A0&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/d85c81=
f87adf3a5945fa369bcec233e6def2ed12" rel=3D"noreferrer" target=3D"_blank">ht=
tp://autobuild.buildroot.org/results/d85c81f87adf3a5945fa369bcec233e6def2ed=
12</a><br>
<br>
Hmm, probably. We do have similar code elsewhere as well though,<br>
presumably that needs to be removed as well?<br></blockquote><div><br></div=
><div>Yes, but before sending a bunch of patches, I wanted to get your feed=
back on this one to avoid wasting time.<br></div><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<br>
git grep &#39;filter-out.*D_FILE_OFFSET_BITS=3D&#39; package/**/*mk<br>
package/elfutils/elfutils.mk:ELFUTILS_CFLAGS =3D $(filter-out -D_FILE_OFFSE=
T_BITS=3D64,$(TARGET_CFLAGS))<br>
package/elfutils/elfutils.mk:ELFUTILS_CPPFLAGS =3D $(filter-out -D_FILE_OFF=
SET_BITS=3D64,$(TARGET_CPPFLAGS))<br>
package/libselinux/<a href=3D"http://libselinux.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libselinux.mk</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$=
(filter-out -D_FILE_OFFSET_BITS=3D64,$(TARGET_CFLAGS))&quot; \<br>
package/libselinux/<a href=3D"http://libselinux.mk" rel=3D"noreferrer" targ=
et=3D"_blank">libselinux.mk</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0CPPFLAGS=3D&quot=
;$(filter-out -D_FILE_OFFSET_BITS=3D64,$(TARGET_CPPFLAGS))&quot;<br>
package/ltp-testsuite/ltp-testsuite.mk:LTP_TESTSUITE_CFLAGS =3D $(filter-ou=
t -D_FILE_OFFSET_BITS=3D64,$(TARGET_CFLAGS))<br>
package/ltp-testsuite/ltp-testsuite.mk:LTP_TESTSUITE_CPPFLAGS =3D $(filter-=
out -D_FILE_OFFSET_BITS=3D64,$(TARGET_CPPFLAGS))<br>
package/musl/<a href=3D"http://musl.mk" rel=3D"noreferrer" target=3D"_blank=
">musl.mk</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CFLAGS=3D&quot;$(fil=
ter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64,=
$(TARGET_CFLAGS)) $(MUSL_EXTRA_CFLAGS)&quot; \<br>
package/musl/<a href=3D"http://musl.mk" rel=3D"noreferrer" target=3D"_blank=
">musl.mk</a>:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CPPFLAGS=3D&quot;$(f=
ilter-out -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D6=
4,$(TARGET_CPPFLAGS))&quot; \<br>
<br>
-- <br>
Bye, Peter Korsgaard<br></blockquote><div><br></div><div>Best Regards,</div=
><div><br></div><div>Fabrice <br></div></div></div>

--000000000000d7c8c4060b78a96a--

--===============8905644050444586876==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8905644050444586876==--
