Return-Path: <SRS0=Qe4W=PG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B91CC433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 18:07:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA0860F25
	for <buildroot@archiver.kernel.org>; Mon, 18 Oct 2021 18:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FA0860F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 236BB40226;
	Mon, 18 Oct 2021 18:07:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1tQ0Y2VG6n8; Mon, 18 Oct 2021 18:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFD88402B5;
	Mon, 18 Oct 2021 18:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80F691BF2C8
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 18:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E94540459
 for <buildroot@lists.busybox.net>; Mon, 18 Oct 2021 18:07:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FsaNUf0oVYg7 for <buildroot@lists.busybox.net>;
 Mon, 18 Oct 2021 18:07:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92b.google.com (mail-ua1-x92b.google.com
 [IPv6:2607:f8b0:4864:20::92b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F865402A2
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 18:07:11 +0000 (UTC)
Received: by mail-ua1-x92b.google.com with SMTP id i15so6869513uap.0
 for <buildroot@buildroot.org>; Mon, 18 Oct 2021 11:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=C5/+8BX8G3B/6hT+I5cG2wACa1aiueCdw/Uek0Bmcq8=;
 b=AjWqTcfqKJoNsKjafwhOKjdRJod+J8WTfzUmQlU27LFvOd5Z14l5LtHrQlIoPG4GFM
 +muA4LbAFoTXsDxgxZ+/rQKGbrQ4n9hjhVXS2j/37EopcBRabXkmyaUdziK+3m7axb+Q
 2J4llC4KPwDoy5kNbAgDHA3Pmj+gRn3WS2gzh37JPObUjEeslJhyWZ7Vyk2CGiLwjnsJ
 R4o2Jh2T5PajXGQST7PNWSqQLTN5JdAZ/Xyl7YFpKdjxRyzp7paCzKt0C0AcVimM3Fbc
 j+d0g5sGVOjJ2eFG773h3uTeE2UzgnLWnwOkuj3ISS93xjQEsnIQw3MFmXUdjcFYzxBx
 x5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=C5/+8BX8G3B/6hT+I5cG2wACa1aiueCdw/Uek0Bmcq8=;
 b=sIvTCHcjaFR9wazYltDm7u5AAyjnuUIHzjMWP8ncJFXlGU5fWsnuTtwXQGtE2Q4m2G
 BoTMNP+8AJeGvUIbEdzw3POIjqmrW8BOw/Vr9Wk9QB+BHWLQNFqG/QTMkaFfPjkJ0VNM
 p4AxooRIjtI4zQlmcTwcu762SbXDZ92Ckb1PcHNSaXrjYo9/VFwFacGKNe89qGv/WWhV
 kB7s7fzQZKYxpS9QnNwPZxVUKsbjIAF1+WoLtdl1WF/zv0F+EMOvadNhT0rLNB2qCiXf
 E1IirZ2GkXC71YSJsRZqK4Ag6pm3Gc5yobxsud3eGUt0+fLkQT+2u7N9fwiVBzObeaLY
 sPUw==
X-Gm-Message-State: AOAM5308b4RkbJ2Qkf6gZO0aN6RllnC6JE3I/EuM/kt+oRaoQXBM+QQE
 njJ7wM6hSF3bBfPfQaPohAEX+WKpNrh/n6MggMI=
X-Google-Smtp-Source: ABdhPJxB9HWcDeL/NvELSuUb3e1arLsBgmiF3UDCdbMIAovO6g7ahMr7PQ6QoO0cyptWcBFLcL1zSNNrI6SLoKN5jH4=
X-Received: by 2002:a67:d583:: with SMTP id m3mr29573280vsj.41.1634580429824; 
 Mon, 18 Oct 2021 11:07:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211015083830.1971193-1-jose.pekkarinen@unikie.com>
 <CAKcgs2zBHeE_G-LA6dsCRZpLvx6Ox9mf6s_d347cZO+fJZbfxA@mail.gmail.com>
 <CAJPV9Mpdk_sGtcVhQV=B6BSviwxtemEk28g_zUfLtk3pQ1cTag@mail.gmail.com>
In-Reply-To: <CAJPV9Mpdk_sGtcVhQV=B6BSviwxtemEk28g_zUfLtk3pQ1cTag@mail.gmail.com>
From: Gilles Talis <gilles.talis@gmail.com>
Date: Mon, 18 Oct 2021 20:06:58 +0200
Message-ID: <CAKcgs2w6TRZCZjuFmdx2NJonYX90QyB9DJDKiY_DsCX45exMyw@mail.gmail.com>
To: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>, 
 buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] [PATCH] package/softhsm2: new package
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
Content-Type: multipart/mixed; boundary="===============0252316633696689951=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0252316633696689951==
Content-Type: multipart/alternative; boundary="000000000000e067db05cea46992"

--000000000000e067db05cea46992
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(adding the buildroot mailing list)

Hi Jose,
Please add the buildroot mailing list to your emails so that they can help
if I miss something or if I am not able to answer your questions.

Le lun. 18 oct. 2021 =C3=A0 16:31, Jos=C3=A9 Pekkarinen <jose.pekkarinen@un=
ikie.com>
a =C3=A9crit :

>
>
> On Sun, Oct 17, 2021 at 2:14 PM Gilles Talis <gilles.talis@gmail.com>
> wrote:
>
>> [...]
>>
>> I would also recommend you run the following utilities to verify that
>> your patch is correct:
>> 1) check-package (
>> https://buildroot.org/downloads/manual/manual.html#check-package) to
>> check the coding style of added files
>> 2) test-pkg (chapter 18.24.3 of the buildroot documentation) to check if
>> your package can build in various configurations.
>>
>
> Hi,
>
> Do you have any insights how other packages
>
> get around the following error?
>
> >>> softhsm2 2.6.1 Patching libtool
> patching file
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/build/softhsm2-2.6.1/ltma=
in.sh
>
> Hunk #1 succeeded at 2694 (offset 7 lines).
> Hunk #2 succeeded at 4284 (offset 7 lines).
> Hunk #3 succeeded at 6579 (offset 25 lines).
> Hunk #4 succeeded at 6589 (offset 25 lines).
> Hunk #5 succeeded at 6882 (offset 25 lines).
> Hunk #6 succeeded at 7174 (offset 25 lines).
> Hunk #7 succeeded at 8140 (offset 28 lines).
> Hunk #8 succeeded at 10769 (offset 59 lines).
> (cd /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/build/softhsm2-2.6.1/
> && rm -rf config.cache &&
> PATH=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin:/home/pe=
kkari/br-test-pkg/bootlin-armv7m-uclibc/host/sbin:/usr/local/sbin:/usr/loca=
l/bin:/usr/sbin
> :/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
> AR=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-=
ar"
> AS=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-=
as"
> LD=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc
> /host/bin/arm-linux-ld"
> NM=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-=
nm"
> CC=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-=
gcc"
> GCC=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux=
-gcc"
> CPP=3D"/hom
> e/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-cpp"
> CXX=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux=
-g++"
> FC=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-=
gfortran"
> F77=3D"/home/pekkari/br-test-pkg/boot
> lin-armv7m-uclibc/host/bin/arm-linux-gfortran"
> RANLIB=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-li=
nux-ranlib"
> READELF=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-l=
inux-readelf"
> STRIP=3D"/home/pekkari/br-test-pkg/bootlin-armv7
> m-uclibc/host/bin/arm-linux-strip"
> OBJCOPY=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-l=
inux-objcopy"
> OBJDUMP=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-l=
inux-objdump"
> AR_FOR_BUILD=3D"/usr/bin/ar" AS_FOR_BUILD=3D"/usr/bin/as" CC
> _FOR_BUILD=3D"/usr/bin/gcc" GCC_FOR_BUILD=3D"/usr/bin/gcc"
> CXX_FOR_BUILD=3D"/usr/bin/g++" LD_FOR_BUILD=3D"/usr/bin/ld"
> CPPFLAGS_FOR_BUILD=3D"-I/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/h=
ost/include"
> CFLAGS_FOR_BUILD=3D"-O2 -I/home/pekkari/br-test-pkg/bootlin-armv7m-u
> clibc/host/include" CXXFLAGS_FOR_BUILD=3D"-O2
> -I/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/include"
> LDFLAGS_FOR_BUILD=3D"-L/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/ho=
st/lib
> -Wl,-rpath,/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/lib" FCFL=
AG
> S_FOR_BUILD=3D""
> DEFAULT_ASSEMBLER=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host=
/bin/arm-linux-as"
> DEFAULT_LINKER=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bi=
n/arm-linux-ld"
> CPPFLAGS=3D"-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BI
> TS=3D64" CFLAGS=3D"-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=3D64  -Os -g0   -Wl,-elf2flt -static"
> CXXFLAGS=3D"-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
=3D64
>  -Os -g0   -Wl,-elf2flt -static  -Wl,-elf2flt -static" LDFLAGS=3D" -Wl,-e=
lf
> 2flt -static" FCFLAGS=3D" -Os -g0  -Wl,-elf2flt -static" FFLAGS=3D" -Os -=
g0
>  -Wl,-elf2flt -static"
> PKG_CONFIG=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/pk=
g-config"
> STAGING_DIR=3D"/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/arm-b=
uildroot-uclin
> ux-uclibcgnueabi/sysroot" INTLTOOL_PERL=3D/usr/bin/perl
> ac_cv_lbl_unaligned_fail=3Dyes ac_cv_func_mmap_fixed_mapped=3Dyes
> ac_cv_func_memcmp_working=3Dyes ac_cv_have_decl_malloc=3Dyes
> gl_cv_func_malloc_0_nonnull=3Dyes ac_cv_func_malloc_0_nonnull=3Dyes
> ac_cv_func_calloc_0_nonn
> ull=3Dyes ac_cv_func_realloc_0_nonnull=3Dyes lt_cv_sys_lib_search_path_sp=
ec=3D""
> ac_cv_c_bigendian=3Dno   CONFIG_SITE=3D/dev/null ./configure
> --target=3Darm-buildroot-uclinux-uclibcgnueabi
> --host=3Darm-buildroot-uclinux-uclibcgnueabi --build=3Dx86_64-pc-linux-gn=
u
> --prefix=3D/usr
> --exec-prefix=3D/usr --sysconfdir=3D/etc --localstatedir=3D/var
> --program-prefix=3D"" --disable-gtk-doc --disable-gtk-doc-html --disable-=
doc
> --disable-docs --disable-documentation --with-xmlto=3Dno --with-fop=3Dno
> --disable-dependency-tracking --enable-ipv6 --disable-nls
> --enable-static --disable-shared )
> configure: WARNING: unrecognized options: --disable-gtk-doc,
> --disable-gtk-doc-html, --disable-doc, --disable-docs,
> --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6,
> --disable-nls
> checking for a BSD-compatible install... /usr/bin/install -c
> checking whether build environment is sane... yes
> checking for arm-buildroot-uclinux-uclibcgnueabi-strip...
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-strip
> checking for a race-free mkdir -p... /usr/bin/mkdir -p
> checking for gawk... gawk
> checking whether make sets $(MAKE)... yes
> checking whether make supports nested variables... yes
> checking for arm-buildroot-uclinux-uclibcgnueabi-gcc...
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-gcc
> checking whether the C compiler works... yes
> checking for C compiler default output file name... a.out
> checking for suffix of executables...
> checking whether we are cross compiling... yes
> checking for suffix of object files... o
> checking whether the compiler supports GNU C... yes
> checking whether
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-gcc
> accepts -g... yes
> checking for
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-gcc
> option to enable C11 features... none needed
> checking whether
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-gcc
> understands -c and -o together... yes
> checking whether make supports the include directive... yes (GNU style)
> checking dependency style of
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-gcc...
> none
> checking whether the compiler supports GNU C++... yes
> checking whether
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-g++
> accepts -g... yes
> checking for
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-g++
> option to enable C++11 features... none needed
> checking dependency style of
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-g++...
> none
> checking pkg-config is at least version 0.9.0... ./configure: line 5559:
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/pkg-config: No
> such file or directory
> no
>
Here you are missing pkg-config on the host, so you need to add a
dependency to host-pkgconf in your mk file


> checking whether
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-g++
> supports C++11 features by default... yes
> checking for dlopen... no
> checking for dlopen in -ldl... no
> checking for LoadLibrary... no
> configure: error: No dynamic library loading support
>
This means that your package needs dynamic library support. Which means
that your package cannot be built statically. Unless there's an option to
build the package statically, you would need to add a "depends on
!BR2_STATIC_LIBS" and the corresponding comment in your Config.in file. You
can find examples in existing buildroot Config.in files.


> make[1]: *** [package/pkg-generic.mk:284:
> /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/build/softhsm2-2.6.1/.sta=
mp_configured]
> Error 1
>
>
> Thanks!
>
>
> Jos=C3=A9.
>
>
thanks
Gilles.

--000000000000e067db05cea46992
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:arial,sans-serif;font-size:small">(adding the buildroot mailing li=
st)</div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif=
;font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-fami=
ly:arial,sans-serif;font-size:small">Hi Jose,</div><div class=3D"gmail_defa=
ult" style=3D"font-family:arial,sans-serif;font-size:small">Please add the =
buildroot mailing list to your emails so that they can help if I miss somet=
hing or if I am not able to answer your questions.<br></div></div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 18=
 oct. 2021 =C3=A0=C2=A016:31, Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jo=
se.pekkarinen@unikie.com">jose.pekkarinen@unikie.com</a>&gt; a =C3=A9crit=
=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sun, Oct 17, 2021 at 2:14 PM Gilles Talis =
&lt;<a href=3D"mailto:gilles.talis@gmail.com" target=3D"_blank">gilles.tali=
s@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-family:aria=
l,sans-serif;font-size:small">[...]</div></div><div class=3D"gmail_quote"><=
div><div style=3D"font-family:arial,sans-serif;font-size:small"><br></div><=
div style=3D"font-family:arial,sans-serif;font-size:small">I would also rec=
ommend you run the following utilities to verify that your patch is correct=
:<br></div><div style=3D"font-family:arial,sans-serif;font-size:small">1) c=
heck-package (<a href=3D"https://buildroot.org/downloads/manual/manual.html=
#check-package" target=3D"_blank">https://buildroot.org/downloads/manual/ma=
nual.html#check-package</a>) to check the coding style of added files</div>=
<div style=3D"font-family:arial,sans-serif;font-size:small">2) test-pkg (ch=
apter 18.24.3 of the buildroot documentation) to check if your package can =
build in various configurations.</div></div></div></div></blockquote><div><=
br></div></div><blockquote style=3D"margin:0px 0px 0px 40px;border:medium n=
one;padding:0px"><div class=3D"gmail_quote"><div>Hi,</div><div><br></div></=
div></blockquote><blockquote style=3D"margin:0px 0px 0px 40px;border:medium=
 none;padding:0px"><div class=3D"gmail_quote"><div>Do you have any insights=
 how other packages</div></div></blockquote>get around the following error?=
<div><br></div><div><span style=3D"font-family:monospace"><span style=3D"co=
lor:rgb(255,255,255);background-color:rgb(0,0,0)">&gt;&gt;&gt; softhsm2 2.6=
.1 Patching libtool</span><span style=3D"color:rgb(0,0,0)">
</span><br>patching file /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/bu=
ild/softhsm2-2.6.1/ltmain.sh
<br>Hunk #1 succeeded at 2694 (offset 7 lines).
<br>Hunk #2 succeeded at 4284 (offset 7 lines).
<br>Hunk #3 succeeded at 6579 (offset 25 lines).
<br>Hunk #4 succeeded at 6589 (offset 25 lines).
<br>Hunk #5 succeeded at 6882 (offset 25 lines).
<br>Hunk #6 succeeded at 7174 (offset 25 lines).
<br>Hunk #7 succeeded at 8140 (offset 28 lines).
<br>Hunk #8 succeeded at 10769 (offset 59 lines).
<br>(cd /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/build/softhsm2-2.6.=
1/ &amp;&amp; rm -rf config.cache &amp;&amp; PATH=3D&quot;/home/pekkari/br-=
test-pkg/bootlin-armv7m-uclibc/host/bin:/home/pekkari/br-test-pkg/bootlin-a=
rmv7m-uclibc/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin<br>:/usr/bi=
n:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin&quot; AR=3D&quot;/home/p=
ekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-ar&quot; AS=3D&=
quot;/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-as&=
quot; LD=3D&quot;/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc<br>/host/b=
in/arm-linux-ld&quot; NM=3D&quot;/home/pekkari/br-test-pkg/bootlin-armv7m-u=
clibc/host/bin/arm-linux-nm&quot; CC=3D&quot;/home/pekkari/br-test-pkg/boot=
lin-armv7m-uclibc/host/bin/arm-linux-gcc&quot; GCC=3D&quot;/home/pekkari/br=
-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-gcc&quot; CPP=3D&quot;/h=
om<br>e/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-cpp&qu=
ot; CXX=3D&quot;/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/ar=
m-linux-g++&quot; FC=3D&quot;/home/pekkari/br-test-pkg/bootlin-armv7m-uclib=
c/host/bin/arm-linux-gfortran&quot; F77=3D&quot;/home/pekkari/br-test-pkg/b=
oot<br>lin-armv7m-uclibc/host/bin/arm-linux-gfortran&quot; RANLIB=3D&quot;/=
home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-ranlib&qu=
ot; READELF=3D&quot;/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bi=
n/arm-linux-readelf&quot; STRIP=3D&quot;/home/pekkari/br-test-pkg/bootlin-a=
rmv7<br>m-uclibc/host/bin/arm-linux-strip&quot; OBJCOPY=3D&quot;/home/pekka=
ri/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-objcopy&quot; OBJDU=
MP=3D&quot;/home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-lin=
ux-objdump&quot; AR_FOR_BUILD=3D&quot;/usr/bin/ar&quot; AS_FOR_BUILD=3D&quo=
t;/usr/bin/as&quot; CC<br>_FOR_BUILD=3D&quot;/usr/bin/gcc&quot; GCC_FOR_BUI=
LD=3D&quot;/usr/bin/gcc&quot; CXX_FOR_BUILD=3D&quot;/usr/bin/g++&quot; LD_F=
OR_BUILD=3D&quot;/usr/bin/ld&quot; CPPFLAGS_FOR_BUILD=3D&quot;-I/home/pekka=
ri/br-test-pkg/bootlin-armv7m-uclibc/host/include&quot; CFLAGS_FOR_BUILD=3D=
&quot;-O2 -I/home/pekkari/br-test-pkg/bootlin-armv7m-u<br>clibc/host/includ=
e&quot; CXXFLAGS_FOR_BUILD=3D&quot;-O2 -I/home/pekkari/br-test-pkg/bootlin-=
armv7m-uclibc/host/include&quot; LDFLAGS_FOR_BUILD=3D&quot;-L/home/pekkari/=
br-test-pkg/bootlin-armv7m-uclibc/host/lib -Wl,-rpath,/home/pekkari/br-test=
-pkg/bootlin-armv7m-uclibc/host/lib&quot; FCFLAG<br>S_FOR_BUILD=3D&quot;&qu=
ot; DEFAULT_ASSEMBLER=3D&quot;/home/pekkari/br-test-pkg/bootlin-armv7m-ucli=
bc/host/bin/arm-linux-as&quot; DEFAULT_LINKER=3D&quot;/home/pekkari/br-test=
-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-ld&quot; CPPFLAGS=3D&quot;-D_=
LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BI<br>TS=3D64&quot; C=
FLAGS=3D&quot;-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=
=3D64 =C2=A0-Os -g0 =C2=A0=C2=A0-Wl,-elf2flt -static&quot; CXXFLAGS=3D&quot=
;-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=3D64 =C2=A0-=
Os -g0 =C2=A0=C2=A0-Wl,-elf2flt -static =C2=A0-Wl,-elf2flt -static&quot; LD=
FLAGS=3D&quot; -Wl,-elf<br>2flt -static&quot; FCFLAGS=3D&quot; -Os -g0 =C2=
=A0-Wl,-elf2flt -static&quot; FFLAGS=3D&quot; -Os -g0 =C2=A0-Wl,-elf2flt -s=
tatic&quot; PKG_CONFIG=3D&quot;/home/pekkari/br-test-pkg/bootlin-armv7m-ucl=
ibc/host/bin/pkg-config&quot; STAGING_DIR=3D&quot;/home/pekkari/br-test-pkg=
/bootlin-armv7m-uclibc/host/arm-buildroot-uclin<br>ux-uclibcgnueabi/sysroot=
&quot; INTLTOOL_PERL=3D/usr/bin/perl ac_cv_lbl_unaligned_fail=3Dyes ac_cv_f=
unc_mmap_fixed_mapped=3Dyes ac_cv_func_memcmp_working=3Dyes ac_cv_have_decl=
_malloc=3Dyes gl_cv_func_malloc_0_nonnull=3Dyes ac_cv_func_malloc_0_nonnull=
=3Dyes ac_cv_func_calloc_0_nonn<br>ull=3Dyes ac_cv_func_realloc_0_nonnull=
=3Dyes lt_cv_sys_lib_search_path_spec=3D&quot;&quot; ac_cv_c_bigendian=3Dno=
 =C2=A0=C2=A0CONFIG_SITE=3D/dev/null ./configure --target=3Darm-buildroot-u=
clinux-uclibcgnueabi --host=3Darm-buildroot-uclinux-uclibcgnueabi --build=
=3Dx86_64-pc-linux-gnu --prefix=3D/usr<br> --exec-prefix=3D/usr --sysconfdi=
r=3D/etc --localstatedir=3D/var --program-prefix=3D&quot;&quot; --disable-g=
tk-doc --disable-gtk-doc-html --disable-doc --disable-docs --disable-docume=
ntation --with-xmlto=3Dno --with-fop=3Dno --disable-dependency-tracking --e=
nable-ipv6 --disable-nls <br>--enable-static --disable-shared )
<br>configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-=
gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --wit=
h-xmlto, --with-fop, --enable-ipv6, --disable-nls
<br>checking for a BSD-compatible install... /usr/bin/install -c
<br>checking whether build environment is sane... yes
<br>checking for arm-buildroot-uclinux-uclibcgnueabi-strip... /home/pekkari=
/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-strip
<br>checking for a race-free mkdir -p... /usr/bin/mkdir -p
<br>checking for gawk... gawk
<br>checking whether make sets $(MAKE)... yes
<br>checking whether make supports nested variables... yes
<br>checking for arm-buildroot-uclinux-uclibcgnueabi-gcc... /home/pekkari/b=
r-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-linux-gcc
<br>checking whether the C compiler works... yes
<br>checking for C compiler default output file name... a.out
<br>checking for suffix of executables... =C2=A0<br>checking whether we are=
 cross compiling... yes
<br>checking for suffix of object files... o
<br>checking whether the compiler supports GNU C... yes
<br>checking whether /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/b=
in/arm-linux-gcc accepts -g... yes
<br>checking for /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/a=
rm-linux-gcc option to enable C11 features... none needed
<br>checking whether /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/b=
in/arm-linux-gcc understands -c and -o together... yes
<br>checking whether make supports the include directive... yes (GNU style)
<br>checking dependency style of /home/pekkari/br-test-pkg/bootlin-armv7m-u=
clibc/host/bin/arm-linux-gcc... none
<br>checking whether the compiler supports GNU C++... yes
<br>checking whether /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/b=
in/arm-linux-g++ accepts -g... yes
<br>checking for /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/a=
rm-linux-g++ option to enable C++11 features... none needed
<br>checking dependency style of /home/pekkari/br-test-pkg/bootlin-armv7m-u=
clibc/host/bin/arm-linux-g++... none
<br>checking pkg-config is at least version 0.9.0... ./configure: line 5559=
: /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/pkg-config: No s=
uch file or directory
<br>no
<br></span></div></div></blockquote><div><div style=3D"font-family:arial,sa=
ns-serif;font-size:small" class=3D"gmail_default">Here you are missing pkg-=
config on the host, so you need to add a dependency to host-pkgconf in your=
 mk file</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div><span style=3D"font-family:monospace">che=
cking whether /home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/host/bin/arm-=
linux-g++ supports C++11 features by default... yes
<br>checking for dlopen... no
<br>checking for dlopen in -ldl... no
<br>checking for LoadLibrary... no
<br>configure: error: No dynamic library loading support
<br></span></div></div></blockquote><div><span class=3D"gmail_default" styl=
e=3D"font-family:arial,sans-serif;font-size:small">This means that your pac=
kage needs dynamic library support. Which means that your package cannot be=
 built statically. Unless there&#39;s an option to build the package static=
ally, you would need to add a &quot;depends on !BR2_STATIC_LIBS&quot; and t=
he corresponding comment in your Config.in file. You can find examples in e=
xisting buildroot Config.in files. <br></span></div><div><span class=3D"gma=
il_default" style=3D"font-family:arial,sans-serif;font-size:small"></span>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div><span style=3D"font-family:monospace">make[1]: *** [package/<a hre=
f=3D"http://pkg-generic.mk:284" target=3D"_blank">pkg-generic.mk:284</a>: /=
home/pekkari/br-test-pkg/bootlin-armv7m-uclibc/build/softhsm2-2.6.1/.stamp_=
configured] Error 1<br></span>=C2=A0<br></div><blockquote style=3D"margin:0=
px 0px 0px 40px;border:medium none;padding:0px"><div><div>Thanks!</div></di=
v></blockquote><div><br><div dir=3D"ltr"><div dir=3D"ltr"><blockquote style=
=3D"margin:0px 0px 0px 40px;border:medium none;padding:0px">Jos=C3=A9.</blo=
ckquote></div></div></div></div></blockquote><div><br></div><div style=3D"f=
ont-family:arial,sans-serif;font-size:small" class=3D"gmail_default">thanks=
</div><div style=3D"font-family:arial,sans-serif;font-size:small" class=3D"=
gmail_default">Gilles.</div></div></div>

--000000000000e067db05cea46992--

--===============0252316633696689951==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0252316633696689951==--
