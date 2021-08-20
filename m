Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A2EC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 12:20:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04BB610C8
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 12:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E04BB610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B66380AA4;
	Fri, 20 Aug 2021 12:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 68uBhVcjnJn4; Fri, 20 Aug 2021 12:20:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13B2B80D4C;
	Fri, 20 Aug 2021 12:20:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 706CC1BF35D
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 12:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6018E613EF
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 12:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3PfBjF_kj7-l for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 12:20:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41C456060B
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 12:20:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g21so13742952edw.4
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 05:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y/BO+HPPVCcdPOKOsbLX+S3FhQIKGNiAQBttVsShqtY=;
 b=aEgr8WnBrlnKb/mNhx3bs5aVaE9D6rivwxjlL9PgABRij97/bY4LVfNflz7OlvI5QU
 UyvncyUgL/Alz0SuYaED1Xvz0gLsn1/dTiluTrUa/eI9ZfWiIKILrKp4BZk/sKnwOeHy
 SuuZWywGtIOcNvmOY05HGk2Y8AOnoPfFVStl5kpW/bJgQtm4kyDb34fz9cklk6r6de7U
 kqlXX/WgiLYO13KlZGD4zd1FRj/8V76Bl8p+3pMvZmDO9Ggqn7BWvILQ/FwJMkZPr+EI
 UAniy2rkZ19emFCDijP9291L+IQ0MTxEmMsYx0LrXYRpYN8Jx7i06HzuYV5mKZCiVSTI
 0slg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y/BO+HPPVCcdPOKOsbLX+S3FhQIKGNiAQBttVsShqtY=;
 b=atGmNAuouuNoGGVcohdkc+AbhJYuPu/Ks2nKfAREA0LTsVjgbI/ndvgG80lunPLvsZ
 o39M++ZTtHv//OyqD7dTY4qsjGRjOY+ErADF9WWoop4kXf2757jR+8sSx9K+zA5SRq9A
 gbi6CsE9lUmKWQX8PQ6vJX9WXJvLE5m+b7rNIhyq7AaxMrmfQc3Beprm5robPXaHxteg
 Or1dVWQ6VXoYOzdxBGTG41ItZ8PqYQyZchwrTpWwVgDwrCHDyWvCCBnvjFv+mkiaqku2
 APfD08NcStyAdK0hx24klrXTACY2sJd/R6bSpFlfyv7UPE/Vn87+dRLpqWYX0W3bIwwv
 /s+w==
X-Gm-Message-State: AOAM5327cpRq4EjYtpMhR5eJyr3QbltMOoHINNGVAyWlI4iZ+bfeBB2d
 2BA2dTYli66w8lE/rCGFo9XWZU6D6tyTba3gUi36fZw4Vbi6ew==
X-Google-Smtp-Source: ABdhPJxfDkm/B7EJ1Kkgat1lzoFwS5x4URFNrQ4b8PmvV1bKvyHDrzugeskwJ4n8o7sU5/dWWDV9aKvLQ0aWZMUpByw=
X-Received: by 2002:a05:6402:2348:: with SMTP id
 r8mr22293912eda.184.1629462006423; 
 Fri, 20 Aug 2021 05:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210819092904.2942827-1-jose.pekkarinen@unikie.com>
 <20210819210517.GF27036@scaer>
In-Reply-To: <20210819210517.GF27036@scaer>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Fri, 20 Aug 2021 15:19:55 +0300
Message-ID: <CAJPV9Mqd-c_0JD82KQU5hMH32UVMy71ded1Ht7vtEr6iJhw+xg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v2] package/libselinux: Add autorelabel for
 first boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6732464787899178323=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6732464787899178323==
Content-Type: multipart/alternative; boundary="0000000000001174ae05c9fcb0fd"

--0000000000001174ae05c9fcb0fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 12:05 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Jos=C3=A9, All,
>
> On 2021-08-19 12:29 +0300, Jos=C3=A9 Pekkarinen spake thusly:
> > Currently buildroot ship libselinux without triggering
> > this option, which often shows inconsistencies between
> > what the refpolicy defines as a label for a file and
> > what the actual file has. Triggering an initial relabel
> > would help activating enforcing state right away without
> > requiring to enter it once in permissive and tweak the
> > labels.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> > ---
> > [ v1 -> v2 ] Fix if statement in libselinux recipe
> >
> >  package/libselinux/Config.in     | 7 +++++++
> >  package/libselinux/libselinux.mk | 3 +++
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/package/libselinux/Config.in b/package/libselinux/Config.i=
n
> > index 62070c8d59..df8bd7ffd0 100644
> > --- a/package/libselinux/Config.in
> > +++ b/package/libselinux/Config.in
> > @@ -18,3 +18,10 @@ config BR2_PACKAGE_LIBSELINUX
> >
> >  comment "libselinux needs a toolchain w/ threads, dynamic library"
> >       depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> > +
> > +config BR2_PACKAGE_LIBSELINUX_AUTORELABEL
> > +     bool
> > +     depends on BR2_PACKAGE_LIBSELINUX
> > +     depends on BR2_PACKAGE_FINDUTILS
> > +     depends on BR2_PACKAGE_GREP
> > +     default y
> > diff --git a/package/libselinux/libselinux.mk b/package/libselinux/
> libselinux.mk
> > index fdd13aa942..adf4b3d6f6 100644
> > --- a/package/libselinux/libselinux.mk
> > +++ b/package/libselinux/libselinux.mk
> > @@ -71,6 +71,9 @@ define LIBSELINUX_INSTALL_TARGET_CMDS
> >       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> >               $(LIBSELINUX_MAKE_OPTS) DESTDIR=3D$(TARGET_DIR) \
> >               $(LIBSELINUX_MAKE_INSTALL_TARGETS)
> > +     $(if $(BR2_PACKAGE_LIBSELINUX_AUTORELABEL),
> > +             echo "-F" > $(TARGET_DIR)/.autorelabel
> > +             mkdir $(TARGET_DIR)/var/lib/selinux)
>
> Isn't this going to fail on read-only filesystems? Relabelling suposedly
> requires that extended attributes be added/updated/removed, and that
> requires a read-write filesystem...
>
> Can't we do the re-labelling at the time we create the filesystem, i.e.
> in fs/common.mk?
>
> And it seems we already have that:
>
>    52 ifeq ($(BR2_PACKAGE_REFPOLICY),y)
>    53 define ROOTFS_SELINUX
>    54     $(HOST_DIR)/sbin/setfiles -m -r $(TARGET_DIR) \
>    55         -c
> $(TARGET_DIR)/etc/selinux/targeted/policy/policy.$(BR2_PACKAGE_LIBSEPOL_P=
OLICY_VERSION)
> \
>    56
>  $(TARGET_DIR)/etc/selinux/targeted/contexts/files/file_contexts \
>    57         $(TARGET_DIR)
>    58 endef
>    59 ROOTFS_COMMON_DEPENDENCIES +=3D host-policycoreutils
>    60 endif
>
> So why is the labelling wrong? Can't we fix it right there rather than
> at runtime?
>

It's is not wrong, it was just unnoticed by my eyeballs,

however, there is a case this is not covering properly and preventing
the userspace to run right away in enforcing mode, because at
this time not all files in /dev are populated, and running it in
permissive mode multiple complains from selinux to the serial
devices turn up. If you have some suggestions how we can
improve this case, I'm happy to bring more changes.

Best regards.


Jos=C3=A9.

--0000000000001174ae05c9fcb0fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 20, 2021 at 12:05 AM Yann=
 E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@fr=
ee.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Jos=C3=A9, All,<br>
<br>
On 2021-08-19 12:29 +0300, Jos=C3=A9 Pekkarinen spake thusly:<br>
&gt; Currently buildroot ship libselinux without triggering<br>
&gt; this option, which often shows inconsistencies between<br>
&gt; what the refpolicy defines as a label for a file and<br>
&gt; what the actual file has. Triggering an initial relabel<br>
&gt; would help activating enforcing state right away without<br>
&gt; requiring to enter it once in permissive and tweak the<br>
&gt; labels.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; ---<br>
&gt; [ v1 -&gt; v2 ] Fix if statement in libselinux recipe<br>
&gt; <br>
&gt;=C2=A0 package/libselinux/Config.in=C2=A0 =C2=A0 =C2=A0| 7 +++++++<br>
&gt;=C2=A0 package/libselinux/<a href=3D"http://libselinux.mk" rel=3D"noref=
errer" target=3D"_blank">libselinux.mk</a> | 3 +++<br>
&gt;=C2=A0 2 files changed, 10 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/libselinux/Config.in b/package/libselinux/Config.=
in<br>
&gt; index 62070c8d59..df8bd7ffd0 100644<br>
&gt; --- a/package/libselinux/Config.in<br>
&gt; +++ b/package/libselinux/Config.in<br>
&gt; @@ -18,3 +18,10 @@ config BR2_PACKAGE_LIBSELINUX<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 comment &quot;libselinux needs a toolchain w/ threads, dynamic l=
ibrary&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2=
_STATIC_LIBS<br>
&gt; +<br>
&gt; +config BR2_PACKAGE_LIBSELINUX_AUTORELABEL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_LIBSELINUX<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_FINDUTILS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_GREP<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default y<br>
&gt; diff --git a/package/libselinux/<a href=3D"http://libselinux.mk" rel=
=3D"noreferrer" target=3D"_blank">libselinux.mk</a> b/package/libselinux/<a=
 href=3D"http://libselinux.mk" rel=3D"noreferrer" target=3D"_blank">libseli=
nux.mk</a><br>
&gt; index fdd13aa942..adf4b3d6f6 100644<br>
&gt; --- a/package/libselinux/<a href=3D"http://libselinux.mk" rel=3D"noref=
errer" target=3D"_blank">libselinux.mk</a><br>
&gt; +++ b/package/libselinux/<a href=3D"http://libselinux.mk" rel=3D"noref=
errer" target=3D"_blank">libselinux.mk</a><br>
&gt; @@ -71,6 +71,9 @@ define LIBSELINUX_INSTALL_TARGET_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBSELINUX_MAK=
E_OPTS) DESTDIR=3D$(TARGET_DIR) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(LIBSELINUX_MAK=
E_INSTALL_TARGETS)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(if $(BR2_PACKAGE_LIBSELINUX_AUTORELABEL),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;-F&quot; &=
gt; $(TARGET_DIR)/.autorelabel<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir $(TARGET_DIR)/v=
ar/lib/selinux)<br>
<br>
Isn&#39;t this going to fail on read-only filesystems? Relabelling suposedl=
y<br>
requires that extended attributes be added/updated/removed, and that<br>
requires a read-write filesystem...<br>
<br>
Can&#39;t we do the re-labelling at the time we create the filesystem, i.e.=
<br>
in fs/<a href=3D"http://common.mk" rel=3D"noreferrer" target=3D"_blank">com=
mon.mk</a>?<br>
<br>
And it seems we already have that:<br>
<br>
=C2=A0 =C2=A052 ifeq ($(BR2_PACKAGE_REFPOLICY),y)<br>
=C2=A0 =C2=A053 define ROOTFS_SELINUX<br>
=C2=A0 =C2=A054=C2=A0 =C2=A0 =C2=A0$(HOST_DIR)/sbin/setfiles -m -r $(TARGET=
_DIR) \<br>
=C2=A0 =C2=A055=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-c $(TARGET_DIR)/etc/selin=
ux/targeted/policy/policy.$(BR2_PACKAGE_LIBSEPOL_POLICY_VERSION) \<br>
=C2=A0 =C2=A056=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/selinux/=
targeted/contexts/files/file_contexts \<br>
=C2=A0 =C2=A057=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)<br>
=C2=A0 =C2=A058 endef<br>
=C2=A0 =C2=A059 ROOTFS_COMMON_DEPENDENCIES +=3D host-policycoreutils<br>
=C2=A0 =C2=A060 endif<br>
<br>
So why is the labelling wrong? Can&#39;t we fix it right there rather than<=
br>
at runtime?<br></blockquote><div><br></div></div><blockquote style=3D"margi=
n:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote">It&#39;s i=
s not wrong, it was just unnoticed by my eyeballs,</div></blockquote><div>h=
owever, there is a case this is not covering properly and preventing</div><=
div>the userspace to run right away in enforcing mode, because at</div><div=
>this time not all files in /dev are populated, and running it in</div><div=
>permissive mode multiple complains from selinux to the serial</div><div>de=
vices turn up. If you have some suggestions how we can</div><div>improve th=
is case, I&#39;m happy to bring more changes.</div><div><div><br></div><blo=
ckquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Best regar=
ds.</div></blockquote></div><div><br><div dir=3D"ltr" class=3D"gmail_signat=
ure"><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0px 40px;border:n=
one;padding:0px">Jos=C3=A9.</blockquote></div></div></div></div>

--0000000000001174ae05c9fcb0fd--

--===============6732464787899178323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6732464787899178323==--
