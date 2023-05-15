Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739D8C77B75
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 08:47:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 079C542002;
	Mon, 15 May 2023 08:47:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 079C542002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQHEPR27NY2e; Mon, 15 May 2023 08:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA6E941E79;
	Mon, 15 May 2023 08:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA6E941E79
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F05E11BF592
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 08:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA1D840FBF
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 08:47:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA1D840FBF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jI0qRheAfnQH for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 08:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 33C684014E
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 33C684014E
 for <buildroot@buildroot.org>; Mon, 15 May 2023 08:47:01 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-55272ea18e4so674366eaf.3
 for <buildroot@buildroot.org>; Mon, 15 May 2023 01:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684140420; x=1686732420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Sv/YcL6WGFde1mxDpKln/lXISe7AHMJwXhg6v1zGvok=;
 b=cT0hpBnaWlMrCntpOJmPWORD3iQYdOq4rhGD+OTICbs/f4uLDhwjzfeCm1hFWcYcQS
 vqZW9HIVzlHqXSD5K/wId+K/811bjO6mVnTemnU8Mo/dVWSr9zzg0JjxwRLNY/9OIsz/
 Jxb2fZiJXZh4Qrq95/RKSaUIwuBtIoaoc4+Tt24cYKnyOrvRuovcj6K+nxWXH/JlI9iM
 qc6S3X+5qpXsliT8T4Hr0MFcy+Vrz7DJ40VeUO5C/p0ZucvTR5C7oH2HWYFtfkgAuFxz
 2yixrtYjt45E3uGGRc6QMLq4oTKXkKku2a5+8ZRIPnSc3cUMQ9ZwI0/8ecJygqpzTtLb
 uOQA==
X-Gm-Message-State: AC+VfDyDlc99AIXIYV2w41beh6iESBAzxi028QzCpUoO21rjvkRrrbfC
 AeingJBITZWgeGCmeKMW9K/Meri4xtlmPo+clUgJZJL6
X-Google-Smtp-Source: ACHHUZ6rBF6t/UoSNqfhcFQLPARNoCxekNYsTf/DDtxgkpRWuT4MED5kMXHNGCi8HyRq4+WrZaXVa6IYBmwFTtICt0E=
X-Received: by 2002:a05:6820:291:b0:54f:84d1:51ac with SMTP id
 q17-20020a056820029100b0054f84d151acmr9132958ood.6.1684140420086; Mon, 15 May
 2023 01:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSuD1_iZ8qpTwmAyTmbJT6Ah9gFENtge+inogwmcg=i1Ng@mail.gmail.com>
 <20230513000754.57c0ac48@gmx.net>
In-Reply-To: <20230513000754.57c0ac48@gmx.net>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 15 May 2023 10:46:49 +0200
Message-ID: <CADYjeSt8aNewmt=b9c_NdjwqK2h9JCeQnYQu2+BhU7hsd_FEdQ@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684140420; x=1686732420;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Sv/YcL6WGFde1mxDpKln/lXISe7AHMJwXhg6v1zGvok=;
 b=rYQiVZpmdpm4fcz+8kNy9+kcnO1Q18ekyRhcAGkJvcETCotszKRooc2MlMV32CXThu
 mQVC3O7m0VT4gkjDdCZDT8+WjBOXmPS+91EmixqTQdSeJXZRZILzjBxOMWncxi7d8FrI
 ScxdsmmTUgx5bYngV8TyILMDv1zdIXuhvMcxspyQF05YDrqFyICZfCK4zjBcqciW5KcE
 E8CeqPXyguXuWNIywfdH6Ow2/Ek/XK9dpCKIHrz/UfFihqALmx9tEiXPl3D8g2TGk5lW
 lGLJJRrGqzO+zFbjb5Z1d4GzimyLH3+l/dEjfFPkmus1Tg8V6hS6qG8rYkY1gi2sAGyN
 1MSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=rYQiVZpm
Subject: Re: [Buildroot] Compiling issue while adding tpm2-tss-engine as
 Buildroot package
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
Content-Type: multipart/mixed; boundary="===============3020090492063510933=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3020090492063510933==
Content-Type: multipart/alternative; boundary="0000000000007dc0aa05fbb77f79"

--0000000000007dc0aa05fbb77f79
Content-Type: text/plain; charset="UTF-8"

Hello Peter,

Thanks for the update.

Yes, the above option fixed it. Now it's building fine.

Regards,
Sourabh

On Sat, 13 May 2023 at 00:07, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Sourabh,
>
> On Fri, 12 May 2023 14:27:09 +0200, Sourabh Hegde <hrsourabh011@gmail.com>
> wrote:
>
> > Hello,
> >
> > I am trying to add tpm2-tss-engine (OpenSSL Engine for TPM2 devices) (
> > https://github.com/tpm2-software/tpm2-tss-engine) as a Buildroot package
> > and below is the tpm2-tss-engine.mk file
> >
> >
> ################################################################################
> > #
> > # tpm2-tss-engine
> > #
> >
> ################################################################################
> >
> > TPM2_TSS_ENGINE_VERSION = 1.2.0
> > TPM2_TSS_ENGINE_SITE =
> >
> https://github.com/tpm2-software/tpm2-tss-engine/releases/download/$(TPM2_TSS_ENGINE_VERSION)
> > TPM2_TSS_ENGINE_LICENSE = BSD-3-Clause
> > TPM2_TSS_ENGINE_LICENSE_FILES = LICENSE
> > TPM2_TSS_ENGINE_DEPENDENCIES = libqrencode tpm2-tss host-pkgconf
> > host-autoconf-archive
> > TPM2_TSS_ENGINE_AUTORECONF = YES
> > TPM2_TSS_ENGINE_AUTORECONF_OPTS = -I $(HOST_DIR)/share/autoconf-archive
> > TPM2_TSS_ENGINE_CONF_OPTS = \
> >         --disable-defaultflags \
> >         --disable-doxygen-doc \
> >         --disable-plymouth \
> >         --without-initramfstoolsdir \
> >         --without-mkinitcpiodir
> >
> > # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags
> is
> > used
> > TPM2_TSS_ENGINE_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
> >
> > # do not build man pages
> > TPM2_TSS_ENGINE_CONF_ENV += ac_cv_path_PANDOC=''
> >
> > $(eval $(autotools-package))
> >
> > Source code is being downloaded from Git and building. But in the next
> step
> > I am getting below error:
> >
> > >>> tpm2-tss-engine 1.2.0 Building
> >
> PATH="/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
> >  /usr/bin/make -j17  -C
> > /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/
> > make[2]: Nothing to be done for 'all'.
> > >>> tpm2-tss-engine 1.2.0 Installing to target
> >
> PATH="/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
> >  /usr/bin/make -j17
> >
> DESTDIR=/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target
> > install -C /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/
> > ([ -e
> >
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1
> > ] || \
> >          /usr/bin/mkdir -p
> >
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1)
> >  /usr/bin/mkdir -p
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin'
> >  /usr/bin/mkdir -p
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/bash-completion/completions'
> >  /usr/bin/mkdir -p
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/include'
> >  /usr/bin/mkdir -p
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
> >  /usr/bin/mkdir -p
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man1'
> >  /usr/bin/mkdir -p
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man3'
> >  /bin/bash ./libtool   --mode=install /usr/bin/install -c
> libtpm2tss.la
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
> >   /bin/bash ./libtool   --mode=install /usr/bin/install -c tpm2tss-genkey
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin'
> >  /usr/bin/install -c -m 644 bash-completion/tpm2tss-genkey
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/bash-completion/completions'
> >  /usr/bin/install -c -m 644 include/tpm2-tss-engine.h
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/include'
> >  /usr/bin/install -c -m 644 man/man1/tpm2tss-genkey.1
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man1'
> >  /usr/bin/install -c -m 644 man/man3/tpm2tss_tpm2data_write.3
> > man/man3/tpm2tss_rsa_makekey.3 man/man3/tpm2tss_rsa_genkey.3
> > man/man3/tpm2tss_ecc_makekey.3 man/man3/tpm2tss_ecc_genkey.3
> > man/man3/tpm2tss_ecc_getappdata.3 man/man3/tpm2tss_tpm2data_read.3
> > man/man3/tpm2tss_ecc_setappdata.3
> >
> '/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/share/man/man3'
> > libtool: install: /usr/bin/install -c .libs/libtpm2tss.so
> >
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/libtpm2tss.so
> > libtool: install: /usr/bin/install -c tpm2tss-genkey
> >
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/usr/bin/tpm2tss-genkey
> > libtool: install: /usr/bin/install -c .libs/libtpm2tss.lai
> >
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/
> > libtpm2tss.la
> > /usr/bin/make  install-exec-hook
> > (cd
> >
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1
> > && \
> >          ln -s -f libtpm2tss.so tpm2tss.so)
> > libtool: warning: remember to run 'libtool --finish
> >
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1'
> > tpm2-tss-engine: installs files in
> >
> /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target//home/[...]/tmp/br.test.standard
>
> This is a check for files installed into target replicating your build
> path, e.g.
> in case your build in /home/my_name/buildroot_build_001 and your package
> installs
> files into
> /home/my_name/buildroot_build_001/target/home/my_name/buildroot_build_001/usr/lib/...
> instead into /home/my_name/buildroot_build_001/target/usr/lib/...
>
> In your case this can be fixed by adding
> '--with-enginesdir=/usr/lib/engines-1.1' to
> TPM2_TSS_ENGINE_CONF_OPTS options...
>
> Regards,
> Peter
>
>
> > make[1]: *** [package/pkg-generic.mk:390:
> >
> /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/.stamp_target_installed]
> > Error 1
> > make: *** [Makefile:23: _all] Error 2
> >
> >
> > I have also added `libtool` (`BR2_PACKAGE_LIBTOOL`) in the `make
> > menuconfig`.
> > I am not sure what the actual error is.
> >
> > Can anyone please let me know how to resolve the above issue?
> >
> > Thank you,
> > Sourabh
>
>

--0000000000007dc0aa05fbb77f79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Peter,<div><br></div><div>Thanks for the update.</di=
v><div><br></div><div>Yes, the above option fixed it. Now it&#39;s building=
 fine.</div><div><br></div><div>Regards,</div><div>Sourabh</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, 13 =
May 2023 at 00:07, Peter Seiderer &lt;<a href=3D"mailto:ps.report@gmx.net">=
ps.report@gmx.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Hello Sourabh,<br>
<br>
On Fri, 12 May 2023 14:27:09 +0200, Sourabh Hegde &lt;<a href=3D"mailto:hrs=
ourabh011@gmail.com" target=3D"_blank">hrsourabh011@gmail.com</a>&gt; wrote=
:<br>
<br>
&gt; Hello,<br>
&gt;<br>
&gt; I am trying to add tpm2-tss-engine (OpenSSL Engine for TPM2 devices) (=
<br>
&gt; <a href=3D"https://github.com/tpm2-software/tpm2-tss-engine" rel=3D"no=
referrer" target=3D"_blank">https://github.com/tpm2-software/tpm2-tss-engin=
e</a>) as a Buildroot package<br>
&gt; and below is the <a href=3D"http://tpm2-tss-engine.mk" rel=3D"noreferr=
er" target=3D"_blank">tpm2-tss-engine.mk</a> file<br>
&gt;<br>
&gt; ######################################################################=
##########<br>
&gt; #<br>
&gt; # tpm2-tss-engine<br>
&gt; #<br>
&gt; ######################################################################=
##########<br>
&gt;<br>
&gt; TPM2_TSS_ENGINE_VERSION =3D 1.2.0<br>
&gt; TPM2_TSS_ENGINE_SITE =3D<br>
&gt; <a href=3D"https://github.com/tpm2-software/tpm2-tss-engine/releases/d=
ownload/$(TPM2_TSS_ENGINE_VERSION)" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/tpm2-software/tpm2-tss-engine/releases/download/$(TPM2_TSS=
_ENGINE_VERSION)</a><br>
&gt; TPM2_TSS_ENGINE_LICENSE =3D BSD-3-Clause<br>
&gt; TPM2_TSS_ENGINE_LICENSE_FILES =3D LICENSE<br>
&gt; TPM2_TSS_ENGINE_DEPENDENCIES =3D libqrencode tpm2-tss host-pkgconf<br>
&gt; host-autoconf-archive<br>
&gt; TPM2_TSS_ENGINE_AUTORECONF =3D YES<br>
&gt; TPM2_TSS_ENGINE_AUTORECONF_OPTS =3D -I $(HOST_DIR)/share/autoconf-arch=
ive<br>
&gt; TPM2_TSS_ENGINE_CONF_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-defaultflags \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-doxygen-doc \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-plymouth \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-initramfstoolsdir \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--without-mkinitcpiodir<br>
&gt;<br>
&gt; # uses C99 code but forgets to pass -std=3Dc99 when --disable-defaultf=
lags is<br>
&gt; used<br>
&gt; TPM2_TSS_ENGINE_CONF_ENV +=3D CFLAGS=3D&quot;$(TARGET_CFLAGS) -std=3Dc=
99&quot;<br>
&gt;<br>
&gt; # do not build man pages<br>
&gt; TPM2_TSS_ENGINE_CONF_ENV +=3D ac_cv_path_PANDOC=3D&#39;&#39;<br>
&gt;<br>
&gt; $(eval $(autotools-package))<br>
&gt;<br>
&gt; Source code is being downloaded from Git and building. But in the next=
 step<br>
&gt; I am getting below error:<br>
&gt;<br>
&gt; &gt;&gt;&gt; tpm2-tss-engine 1.2.0 Building<br>
&gt; PATH=3D&quot;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-eng=
ine/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/h=
ost/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot;=
<br>
&gt;=C2=A0 /usr/bin/make -j17=C2=A0 -C<br>
&gt; /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/<br>
&gt; make[2]: Nothing to be done for &#39;all&#39;.<br>
&gt; &gt;&gt;&gt; tpm2-tss-engine 1.2.0 Installing to target<br>
&gt; PATH=3D&quot;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-eng=
ine/host/bin:/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/h=
ost/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin&quot;=
<br>
&gt;=C2=A0 /usr/bin/make -j17<br>
&gt; DESTDIR=3D/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine=
/target<br>
&gt; install -C /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.=
0/<br>
&gt; ([ -e<br>
&gt; /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/ho=
me/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch=
64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1<br>
&gt; ] || \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /usr/bin/mkdir -p<br>
&gt; /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/ho=
me/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch=
64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1)<br>
&gt;=C2=A0 /usr/bin/mkdir -p<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/bin&#39;<br>
&gt;=C2=A0 /usr/bin/mkdir -p<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/share/bash-completion/completions&#39;<br>
&gt;=C2=A0 /usr/bin/mkdir -p<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/include&#39;<br>
&gt;=C2=A0 /usr/bin/mkdir -p<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../=
aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1&#39;<br>
&gt;=C2=A0 /usr/bin/mkdir -p<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/share/man/man1&#39;<br>
&gt;=C2=A0 /usr/bin/mkdir -p<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/share/man/man3&#39;<br>
&gt;=C2=A0 /bin/bash ./libtool=C2=A0 =C2=A0--mode=3Dinstall /usr/bin/instal=
l -c=C2=A0 =C2=A0<a href=3D"http://libtpm2tss.la" rel=3D"noreferrer" target=
=3D"_blank">libtpm2tss.la</a><br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../=
aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1&#39;<br>
&gt;=C2=A0 =C2=A0/bin/bash ./libtool=C2=A0 =C2=A0--mode=3Dinstall /usr/bin/=
install -c tpm2tss-genkey<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/bin&#39;<br>
&gt;=C2=A0 /usr/bin/install -c -m 644 bash-completion/tpm2tss-genkey<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/share/bash-completion/completions&#39;<br>
&gt;=C2=A0 /usr/bin/install -c -m 644 include/tpm2-tss-engine.h<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/include&#39;<br>
&gt;=C2=A0 /usr/bin/install -c -m 644 man/man1/tpm2tss-genkey.1<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/share/man/man1&#39;<br>
&gt;=C2=A0 /usr/bin/install -c -m 644 man/man3/tpm2tss_tpm2data_write.3<br>
&gt; man/man3/tpm2tss_rsa_makekey.3 man/man3/tpm2tss_rsa_genkey.3<br>
&gt; man/man3/tpm2tss_ecc_makekey.3 man/man3/tpm2tss_ecc_genkey.3<br>
&gt; man/man3/tpm2tss_ecc_getappdata.3 man/man3/tpm2tss_tpm2data_read.3<br>
&gt; man/man3/tpm2tss_ecc_setappdata.3<br>
&gt; &#39;/home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/targ=
et/usr/share/man/man3&#39;<br>
&gt; libtool: install: /usr/bin/install -c .libs/libtpm2tss.so<br>
&gt; /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/ho=
me/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch=
64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/libtpm2tss.so<br>
&gt; libtool: install: /usr/bin/install -c tpm2tss-genkey<br>
&gt; /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/us=
r/bin/tpm2tss-genkey<br>
&gt; libtool: install: /usr/bin/install -c .libs/libtpm2tss.lai<br>
&gt; /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/ho=
me/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch=
64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1/<br>
&gt; <a href=3D"http://libtpm2tss.la" rel=3D"noreferrer" target=3D"_blank">=
libtpm2tss.la</a><br>
&gt; /usr/bin/make=C2=A0 install-exec-hook<br>
&gt; (cd<br>
&gt; /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target/ho=
me/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/../aarch=
64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1<br>
&gt; &amp;&amp; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s -f libtpm2tss.so tpm2tss.so)<b=
r>
&gt; libtool: warning: remember to run &#39;libtool --finish<br>
&gt; /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/host/bin/=
../aarch64-buildroot-linux-gnu/sysroot/usr/lib/engines-1.1&#39;<br>
&gt; tpm2-tss-engine: installs files in<br>
&gt; /home/[...]/tmp/br.test.standard/per-package/tpm2-tss-engine/target//h=
ome/[...]/tmp/br.test.standard<br>
<br>
This is a check for files installed into target replicating your build path=
, e.g.<br>
in case your build in /home/my_name/buildroot_build_001 and your package in=
stalls<br>
files into /home/my_name/buildroot_build_001/target/home/my_name/buildroot_=
build_001/usr/lib/...<br>
instead into /home/my_name/buildroot_build_001/target/usr/lib/...<br>
<br>
In your case this can be fixed by adding &#39;--with-enginesdir=3D/usr/lib/=
engines-1.1&#39; to<br>
TPM2_TSS_ENGINE_CONF_OPTS options...<br>
<br>
Regards,<br>
Peter<br>
<br>
<br>
&gt; make[1]: *** [package/<a href=3D"http://pkg-generic.mk:390" rel=3D"nor=
eferrer" target=3D"_blank">pkg-generic.mk:390</a>:<br>
&gt; /home/[...]/tmp/br.test.standard/build/tpm2-tss-engine-1.2.0/.stamp_ta=
rget_installed]<br>
&gt; Error 1<br>
&gt; make: *** [Makefile:23: _all] Error 2<br>
&gt;<br>
&gt;<br>
&gt; I have also added `libtool` (`BR2_PACKAGE_LIBTOOL`) in the `make<br>
&gt; menuconfig`.<br>
&gt; I am not sure what the actual error is.<br>
&gt;<br>
&gt; Can anyone please let me know how to resolve the above issue?<br>
&gt;<br>
&gt; Thank you,<br>
&gt; Sourabh<br>
<br>
</blockquote></div>

--0000000000007dc0aa05fbb77f79--

--===============3020090492063510933==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3020090492063510933==--
