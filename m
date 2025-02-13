Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A13C021A8
	for <buildroot@archiver.kernel.org>; Thu, 13 Feb 2025 06:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CCBC611B2;
	Thu, 13 Feb 2025 06:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XUgnklHnx7HH; Thu, 13 Feb 2025 06:39:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B427A611A0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B427A611A0;
	Thu, 13 Feb 2025 06:39:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B3096C2
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86696405BA
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E5vGG7i9hrhf for <buildroot@buildroot.org>;
 Thu, 13 Feb 2025 06:39:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 98F1B40139
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98F1B40139
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98F1B40139
 for <buildroot@buildroot.org>; Thu, 13 Feb 2025 06:39:37 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6fb2a0e4125so4227587b3.1
 for <buildroot@buildroot.org>; Wed, 12 Feb 2025 22:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739428776; x=1740033576;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yMd2nUXsBrTgzyXeFsJmbH/3U5aDN+UB/F60Mf0Sb8o=;
 b=gpd26HPmuVIvMZ8jxO2ev9uCWtdYO9D7aEobBD97KuP2h7zZxmwwkfwOie1Bsl095O
 sjdNvUPPkpEoPgj0gtF2shmesfTodl5lGraYRDxlgNDRu6kOUNlb209q2XqCx8cdNWfl
 2lBHbt50TYj+hp4teWYwyBkmXOyWacLm04NtP8lE6gjAtbA1NLxWQOde8Ka3pEy8ETYS
 FS4riY2HPyIFOiKeNM8o9cQjFLqKSMWSwMg8SdpQvv61tCKzQxNyeH9jyUpYsEuijibq
 VAe5iI8p+VBFaf/BRenso4a1L3ciK2T57idzAo/y01NSz4wkp/bQAZ9sWUQsaoFH36vs
 CZSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsc1LVV8lVKIJ5DwweSXehwhkfnUY3n3Djg/YRfvXBwrGhMTQ1+SPyn4N0bvMx3Ch+GAk9eM7Vu38=@buildroot.org
X-Gm-Message-State: AOJu0Yxbv9psh7OOkkAGmGeNzEtZTG9YUphS6V+ggBjIXCWfVP4Xneqj
 FSeL+8+zHivQaoazgNwvTgv+VIxOH2ITaxX26X8E5MBE1TPCc6ySDpWKPn1iDClxTXq9yok6rl0
 ONclPX3AtogpZXAKoqQMvSI2BeJo=
X-Gm-Gg: ASbGncs+6kNFS/3wBQHVYVpoOXxkqCBcqc5no7gzszJi9a1U8iJz+7T5VOh7+3FHbyK
 QSd+hUYp2nTSyZLUbITTa9GSv65s5a4a4g2YZzDkiPSSH8mpzRXcQq8tR4Ul0WDeXUp4pz55faQ
 ==
X-Google-Smtp-Source: AGHT+IG0K42ETw7+BejaXQRdI9fGOGsrRUntbXoIvJjkn3c2hDGY3vnh7GJblbQMVAWIsNA0dzwKFSq6bh+G1z3RCog=
X-Received: by 2002:a05:690c:6f88:b0:6f7:ae50:6f0a with SMTP id
 00721157ae682-6fb32d8705fmr24554737b3.24.1739428776247; Wed, 12 Feb 2025
 22:39:36 -0800 (PST)
MIME-Version: 1.0
References: <20250212135027.759121-1-fancp2007@gmail.com>
 <87tt8znsuq.fsf@tarshish>
 <30ddb8d5-72c7-475c-a02e-6b9160cbaae9@gmx.de>
 <CAFkzVZYXo0EALs-dV=VgnSYhOh28YT9wip99UVutHcuesEfw2g@mail.gmail.com>
In-Reply-To: <CAFkzVZYXo0EALs-dV=VgnSYhOh28YT9wip99UVutHcuesEfw2g@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Thu, 13 Feb 2025 07:39:24 +0100
X-Gm-Features: AWEUYZm_k8-vWk95ArS9G15mI9Lha4YCm57QSMu-0kJBWsEZQs-1aqAuGBnjF0E
Message-ID: <CA+R_depGhKXfGn2BUxGd+HkiWgY4ip2ZAm5ObwWJA4B6Bh4GpA@mail.gmail.com>
To: Scott Fan <fancp2007@gmail.com>
Cc: Fiona Klute <fiona.klute@gmx.de>, Bernd Kuhls <bernd@kuhls.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739428776; x=1740033576; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yMd2nUXsBrTgzyXeFsJmbH/3U5aDN+UB/F60Mf0Sb8o=;
 b=MPrP9SUoDYzxPtL1GV10wpZQoiaP8yMn7RbQDPf74SU1PDR//fFQoZjngewu2xBPPY
 nGcJc32BWwDkrVwUJFgefotxgOpRHydmaWnrtVHqNfZCU9xJYnB8zzAzGpw7qRhNB02B
 QHmr18p44OX34wh6wvUSY0NDL4I76uQRVoV6QGGOgLQgqA/LfaIIOzoU1lqQ8Ig3QFIu
 AUUdD1KyTu5ZmWIyKs2pRMARixr0ObYP2+NZ6mQ/jv76dT1gQLrdDBThtgt+XAHAiDsI
 8EFwBYJ07r3h7yBdHx00TfnXM/aSP0U8of5aRb+WT2lwsSl22goa4hrWU5qhxEDSrNlJ
 gUgQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=MPrP9SUo
Subject: Re: [Buildroot] [PATCH] package/sqlite: fix build issue since bump
 to 3.49.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2692184407651850258=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2692184407651850258==
Content-Type: multipart/alternative; boundary="00000000000052091d062e005297"

--00000000000052091d062e005297
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Fixes:
2025-02-13T06:48:18 >>> sqlite 3.49.0 Configuring
...
2025-02-13T06:48:19 Error: Unknown option --target

Tested-By: Roy Kollen Svendsen <roykollensvendsen@gmail.com>


tor. 13. feb. 2025 kl. 04:59 skrev Scott Fan <fancp2007@gmail.com>:

> Hi
>
> On Wed, Feb 12, 2025 at 11:47=E2=80=AFPM Fiona Klute via buildroot
> <buildroot@buildroot.org> wrote:
> >
> > Hi Scott, Baruch!
> >
> > Am 12.02.25 um 15:24 schrieb Baruch Siach via buildroot:
> > > Hi Scott,
> > >
> > > On Wed, Feb 12 2025, Scott Fan wrote:
> > >> As of release 3.49.0, the author has replaced the configure script
> used in
> > >> the precompiled amalgamation tarball with Autosetup instead of
> Autotools.
> > >>
> > >> Fixes:
> > >>    https://autobuild.buildroot.org/?reason=3Dsqlite-3.49.0
> > >>
> > >> Signed-off-by: Scott Fan <fancp2007@gmail.com>
> >
> > Together with the "host-generic-package" Baruch pointed out this fixed
> > my build, thanks! One thing looks odd though, see below.
>
> I will add the missing configurations for the "host-generic-package".
>
> >
> > Best regards,
> > Fiona
> >
> > >> ---
> > >>   package/sqlite/sqlite.mk | 59
> ++++++++++++++++++++++++----------------
> > >>   1 file changed, 36 insertions(+), 23 deletions(-)
> > >>
> > >> diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
> > >> index a23f6e1d66..30385f9821 100644
> > >> --- a/package/sqlite/sqlite.mk
> > >> +++ b/package/sqlite/sqlite.mk
> > >> @@ -21,14 +21,6 @@ ifeq
> ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_METADATA),y)
> > >>   SQLITE_CFLAGS +=3D -DSQLITE_ENABLE_COLUMN_METADATA
> > >>   endif
> > >>
> > >> -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
> > >> -SQLITE_CFLAGS +=3D -DSQLITE_ENABLE_FTS3
> > >> -endif
> > >> -
> > >> -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)
> > >> -SQLITE_CFLAGS +=3D -DSQLITE_ENABLE_JSON1
> > >> -endif
> > >> -
> > >>   ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),y)
> > >>   SQLITE_CFLAGS +=3D -DSQLITE_ENABLE_UNLOCK_NOTIFY
> > >>   endif
> > >> @@ -50,30 +42,51 @@ else
> > >>   SQLITE_CFLAGS +=3D $(subst -Ofast,-O3,$(TARGET_CFLAGS))
> > >>   endif
> > >>
> > >> -SQLITE_CONF_ENV =3D CFLAGS=3D"$(SQLITE_CFLAGS)"
> > >> -
> > >> -ifeq ($(BR2_STATIC_LIBS),y)
> > >> -SQLITE_CONF_OPTS +=3D --enable-dynamic-extensions=3Dno
> > >> -else
> > >> -SQLITE_CONF_OPTS +=3D --disable-static-shell
> > >> -endif
> > >> -
> > >>   ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> > >> -SQLITE_CONF_OPTS +=3D --enable-threadsafe
> > >> +SQLITE_CFLAGS +=3D -DSQLITE_THREADSAFE=3D1
> > >>   else
> > >>   SQLITE_CONF_OPTS +=3D --disable-threadsafe
> > >> -SQLITE_CFLAGS +=3D -DSQLITE_THREADSAFE=3D0
> > >>   endif
> >
> > Why does --disable-threadsafe remain, while --enable-threadsafe is
> > removed in the other branch, and -DSQLITE_THREADSAFE=3D0 removed while
> > -DSQLITE_THREADSAFE=3D1 is added in the other branch? That seems
> > inconsistent. My setup has BR2_TOOLCHAIN_HAS_THREADS=3Dy, so I can only
> > confirm the branch with threads works.
>
> When using the ./configure --help command in the release 3.49.0 to
> view the usage, you can only see the --disable-threadsafe option, but
> not the --enable-threadsafe option. Autosetup will automatically
> detect whether threads are supported and set SQLITE_THREADSAFE to 1 or
> 0. If threads are supported, SQLITE_THREADSAFE=3D1 is automatically set
> by default, but you can force SQLITE_THREADSAFE=3D0 with the
> --disable-threadsafe option.
>
> In my opinion, Autosetup has already done what it should do. I will
> delete the lines related to thread safety options in the sqlite.mk
> file.
>
>
> >
> > >>   ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLINE),yy)
> > >>   SQLITE_DEPENDENCIES +=3D ncurses readline
> > >> -SQLITE_CONF_OPTS +=3D --disable-editline --enable-readline
> > >>   else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
> > >>   SQLITE_DEPENDENCIES +=3D libedit
> > >> -SQLITE_CONF_OPTS +=3D --enable-editline --disable-readline
> > >> +SQLITE_CONF_OPTS +=3D --disable-readline --editline
> > >>   else
> > >> -SQLITE_CONF_OPTS +=3D --disable-editline --disable-readline
> > >> +SQLITE_CONF_OPTS +=3D --disable-readline
> > >>   endif
> > >>
> > >> -$(eval $(autotools-package))
> > >> -$(eval $(host-autotools-package))
> > >> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)
> > >> +SQLITE_CONF_OPTS +=3D --fts3
> > >> +endif
> > >> +
> > >> +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)
> > >> +SQLITE_CONF_OPTS +=3D --disable-json
> > >> +endif
> > >> +
> > >> +SQLITE_CONF_ENV =3D CFLAGS=3D"$(SQLITE_CFLAGS)"
> > >> +
> > >> +define SQLITE_CONFIGURE_CMDS
> > >> +    (cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_CONF_ENV)
> ./configure \
> > >> +            --prefix=3D/usr \
> > >> +            --host=3D"$(GNU_TARGET_NAME)" \
> > >> +            --build=3D"$(GNU_HOST_NAME)" \
> > >> +            --sysroot=3D"$(STAGING_DIR)" \
> > >> +            $(SQLITE_CONF_OPTS) \
> > >> +    )
> > >> +endef
> > >> +
> > >> +define SQLITE_BUILD_CMDS
> > >> +    $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
> > >> +endef
> > >> +
> > >> +define SQLITE_INSTALL_STAGING_CMDS
> > >> +    $(TARGET_MAKE_ENV) $(MAKE) DESTDIR=3D"$(STAGING_DIR)" -C $(@D)
> install
> > >> +endef
> > >> +
> > >> +define SQLITE_INSTALL_TARGET_CMDS
> > >> +    $(TARGET_MAKE_ENV) $(MAKE) DESTDIR=3D"$(TARGET_DIR)" -C $(@D)
> install
> > >> +endef
> > >> +
> > >> +$(eval $(generic-package))
> > >
> > > We also need host-generic-package to replace the host-autotools-packa=
ge
> > > removed above.
> > >
> > > baruch
> > >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000052091d062e005297
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>Fixes:</div><div>2025-02=
-13T06:48:18 &gt;&gt;&gt; sqlite 3.49.0 Configuring</div>...<br><div>2025-0=
2-13T06:48:19 Error: Unknown option --target</div><div><br></div><div>Teste=
d-By: Roy Kollen Svendsen &lt;<a href=3D"mailto:roykollensvendsen@gmail.com=
">roykollensvendsen@gmail.com</a>&gt;</div><div><span></span></div><div><br=
></div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">tor. 13. feb. 2025 kl. 04:59 skrev Scott Fan =
&lt;<a href=3D"mailto:fancp2007@gmail.com">fancp2007@gmail.com</a>&gt;:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi<br>
<br>
On Wed, Feb 12, 2025 at 11:47=E2=80=AFPM Fiona Klute via buildroot<br>
&lt;<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@=
buildroot.org</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Scott, Baruch!<br>
&gt;<br>
&gt; Am 12.02.25 um 15:24 schrieb Baruch Siach via buildroot:<br>
&gt; &gt; Hi Scott,<br>
&gt; &gt;<br>
&gt; &gt; On Wed, Feb 12 2025, Scott Fan wrote:<br>
&gt; &gt;&gt; As of release 3.49.0, the author has replaced the configure s=
cript used in<br>
&gt; &gt;&gt; the precompiled amalgamation tarball with Autosetup instead o=
f Autotools.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Fixes:<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 <a href=3D"https://autobuild.buildroot.org/?reas=
on=3Dsqlite-3.49.0" rel=3D"noreferrer" target=3D"_blank">https://autobuild.=
buildroot.org/?reason=3Dsqlite-3.49.0</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Signed-off-by: Scott Fan &lt;<a href=3D"mailto:fancp2007@gmai=
l.com" target=3D"_blank">fancp2007@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Together with the &quot;host-generic-package&quot; Baruch pointed out =
this fixed<br>
&gt; my build, thanks! One thing looks odd though, see below.<br>
<br>
I will add the missing configurations for the &quot;host-generic-package&qu=
ot;.<br>
<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Fiona<br>
&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 =C2=A0package/sqlite/<a href=3D"http://sqlite.mk" rel=
=3D"noreferrer" target=3D"_blank">sqlite.mk</a> | 59 ++++++++++++++++++++++=
++----------------<br>
&gt; &gt;&gt;=C2=A0 =C2=A01 file changed, 36 insertions(+), 23 deletions(-)=
<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; diff --git a/package/sqlite/<a href=3D"http://sqlite.mk" rel=
=3D"noreferrer" target=3D"_blank">sqlite.mk</a> b/package/sqlite/<a href=3D=
"http://sqlite.mk" rel=3D"noreferrer" target=3D"_blank">sqlite.mk</a><br>
&gt; &gt;&gt; index a23f6e1d66..30385f9821 100644<br>
&gt; &gt;&gt; --- a/package/sqlite/<a href=3D"http://sqlite.mk" rel=3D"nore=
ferrer" target=3D"_blank">sqlite.mk</a><br>
&gt; &gt;&gt; +++ b/package/sqlite/<a href=3D"http://sqlite.mk" rel=3D"nore=
ferrer" target=3D"_blank">sqlite.mk</a><br>
&gt; &gt;&gt; @@ -21,14 +21,6 @@ ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_COLUMN_M=
ETADATA),y)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0SQLITE_CFLAGS +=3D -DSQLITE_ENABLE_COLUMN_METADAT=
A<br>
&gt; &gt;&gt;=C2=A0 =C2=A0endif<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)<br>
&gt; &gt;&gt; -SQLITE_CFLAGS +=3D -DSQLITE_ENABLE_FTS3<br>
&gt; &gt;&gt; -endif<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; -ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),y)<br>
&gt; &gt;&gt; -SQLITE_CFLAGS +=3D -DSQLITE_ENABLE_JSON1<br>
&gt; &gt;&gt; -endif<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt;=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_UNLOCK_NOTIFY),=
y)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0SQLITE_CFLAGS +=3D -DSQLITE_ENABLE_UNLOCK_NOTIFY<=
br>
&gt; &gt;&gt;=C2=A0 =C2=A0endif<br>
&gt; &gt;&gt; @@ -50,30 +42,51 @@ else<br>
&gt; &gt;&gt;=C2=A0 =C2=A0SQLITE_CFLAGS +=3D $(subst -Ofast,-O3,$(TARGET_CF=
LAGS))<br>
&gt; &gt;&gt;=C2=A0 =C2=A0endif<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -SQLITE_CONF_ENV =3D CFLAGS=3D&quot;$(SQLITE_CFLAGS)&quot;<br=
>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; -ifeq ($(BR2_STATIC_LIBS),y)<br>
&gt; &gt;&gt; -SQLITE_CONF_OPTS +=3D --enable-dynamic-extensions=3Dno<br>
&gt; &gt;&gt; -else<br>
&gt; &gt;&gt; -SQLITE_CONF_OPTS +=3D --disable-static-shell<br>
&gt; &gt;&gt; -endif<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt;=C2=A0 =C2=A0ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)<br>
&gt; &gt;&gt; -SQLITE_CONF_OPTS +=3D --enable-threadsafe<br>
&gt; &gt;&gt; +SQLITE_CFLAGS +=3D -DSQLITE_THREADSAFE=3D1<br>
&gt; &gt;&gt;=C2=A0 =C2=A0else<br>
&gt; &gt;&gt;=C2=A0 =C2=A0SQLITE_CONF_OPTS +=3D --disable-threadsafe<br>
&gt; &gt;&gt; -SQLITE_CFLAGS +=3D -DSQLITE_THREADSAFE=3D0<br>
&gt; &gt;&gt;=C2=A0 =C2=A0endif<br>
&gt;<br>
&gt; Why does --disable-threadsafe remain, while --enable-threadsafe is<br>
&gt; removed in the other branch, and -DSQLITE_THREADSAFE=3D0 removed while=
<br>
&gt; -DSQLITE_THREADSAFE=3D1 is added in the other branch? That seems<br>
&gt; inconsistent. My setup has BR2_TOOLCHAIN_HAS_THREADS=3Dy, so I can onl=
y<br>
&gt; confirm the branch with threads works.<br>
<br>
When using the ./configure --help command in the release 3.49.0 to<br>
view the usage, you can only see the --disable-threadsafe option, but<br>
not the --enable-threadsafe option. Autosetup will automatically<br>
detect whether threads are supported and set SQLITE_THREADSAFE to 1 or<br>
0. If threads are supported, SQLITE_THREADSAFE=3D1 is automatically set<br>
by default, but you can force SQLITE_THREADSAFE=3D0 with the<br>
--disable-threadsafe option.<br>
<br>
In my opinion, Autosetup has already done what it should do. I will<br>
delete the lines related to thread safety options in the <a href=3D"http://=
sqlite.mk" rel=3D"noreferrer" target=3D"_blank">sqlite.mk</a><br>
file.<br>
<br>
<br>
&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0ifeq ($(BR2_PACKAGE_NCURSES)$(BR2_PACKAGE_READLIN=
E),yy)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0SQLITE_DEPENDENCIES +=3D ncurses readline<br>
&gt; &gt;&gt; -SQLITE_CONF_OPTS +=3D --disable-editline --enable-readline<b=
r>
&gt; &gt;&gt;=C2=A0 =C2=A0else ifeq ($(BR2_PACKAGE_LIBEDIT),y)<br>
&gt; &gt;&gt;=C2=A0 =C2=A0SQLITE_DEPENDENCIES +=3D libedit<br>
&gt; &gt;&gt; -SQLITE_CONF_OPTS +=3D --enable-editline --disable-readline<b=
r>
&gt; &gt;&gt; +SQLITE_CONF_OPTS +=3D --disable-readline --editline<br>
&gt; &gt;&gt;=C2=A0 =C2=A0else<br>
&gt; &gt;&gt; -SQLITE_CONF_OPTS +=3D --disable-editline --disable-readline<=
br>
&gt; &gt;&gt; +SQLITE_CONF_OPTS +=3D --disable-readline<br>
&gt; &gt;&gt;=C2=A0 =C2=A0endif<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; -$(eval $(autotools-package))<br>
&gt; &gt;&gt; -$(eval $(host-autotools-package))<br>
&gt; &gt;&gt; +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_FTS3),y)<br>
&gt; &gt;&gt; +SQLITE_CONF_OPTS +=3D --fts3<br>
&gt; &gt;&gt; +endif<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +ifeq ($(BR2_PACKAGE_SQLITE_ENABLE_JSON1),)<br>
&gt; &gt;&gt; +SQLITE_CONF_OPTS +=3D --disable-json<br>
&gt; &gt;&gt; +endif<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +SQLITE_CONF_ENV =3D CFLAGS=3D&quot;$(SQLITE_CFLAGS)&quot;<br=
>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +define SQLITE_CONFIGURE_CMDS<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 (cd $(@D); $(TARGET_CONFIGURE_OPTS) $(SQLITE_C=
ONF_ENV) ./configure \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --prefix=3D/usr \<=
br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --host=3D&quot;$(G=
NU_TARGET_NAME)&quot; \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --build=3D&quot;$(=
GNU_HOST_NAME)&quot; \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysroot=3D&quot;=
$(STAGING_DIR)&quot; \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $(SQLITE_CONF_OPTS=
) \<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 )<br>
&gt; &gt;&gt; +endef<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +define SQLITE_BUILD_CMDS<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)<br>
&gt; &gt;&gt; +endef<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +define SQLITE_INSTALL_STAGING_CMDS<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE) DESTDIR=3D&quot;$(S=
TAGING_DIR)&quot; -C $(@D) install<br>
&gt; &gt;&gt; +endef<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +define SQLITE_INSTALL_TARGET_CMDS<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 $(TARGET_MAKE_ENV) $(MAKE) DESTDIR=3D&quot;$(T=
ARGET_DIR)&quot; -C $(@D) install<br>
&gt; &gt;&gt; +endef<br>
&gt; &gt;&gt; +<br>
&gt; &gt;&gt; +$(eval $(generic-package))<br>
&gt; &gt;<br>
&gt; &gt; We also need host-generic-package to replace the host-autotools-p=
ackage<br>
&gt; &gt; removed above.<br>
&gt; &gt;<br>
&gt; &gt; baruch<br>
&gt; &gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--00000000000052091d062e005297--

--===============2692184407651850258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2692184407651850258==--
