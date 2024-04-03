Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5295ECD128A
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 21:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B54E7417F7;
	Wed,  3 Apr 2024 21:17:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NCifipJVEr1K; Wed,  3 Apr 2024 21:17:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C826D41899
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C826D41899;
	Wed,  3 Apr 2024 21:17:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D54891BF3D4
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:17:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF1A082282
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 21:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JB-p67IAqSpq for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 21:17:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112a; helo=mail-yw1-x112a.google.com;
 envelope-from=emile.cormier.jr@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F12E821CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F12E821CB
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F12E821CB
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 21:17:36 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-6098a20ab22so3081427b3.2
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 14:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712179055; x=1712783855;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ppHAINQ06wTK8FB2mFAiYlARiOLaO4hGyfn/VRd0VCA=;
 b=IInMfXm6d5YDnNeNBYUskezK6V+/BpbCXSTMmJGYuU/MWWD6cql9BjkMEkvEgkbK3q
 DX4UVT5XhNTtdhJr55Jzff4/9anU4g6R+ju7ZhaVthsaiSkkFtufZ5IOoPeQJ2/g7413
 s8m6PZGX35AK3+u4QY61VJY1efMm9LuTuDaeoyLPiFh1PqOKH7Utj7922cxzlmdEeITE
 klK7uYdA1XEJYmJdhzNJRkciNHdP7gqiLZafVuQVvwNsHd52UNTsg3/NnxXSzTWU9btd
 n9v8wlN08XXEgiw7j+tbz7LVJ9zNeRPJ2U8yfvwiNl8EWloLwnMTVNJIbblQ/JnkdAi+
 yjbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtG7wk/5cus3Hl8xTTSHnRff5+6MTR/db86qQMSV8VDcnnkh1MIkkvqHK/I8Z0pXMJfQYXJ3o7XYEetpib1izZscg9Nnc=
X-Gm-Message-State: AOJu0Yw6HlpjsTmkKH4Ep8+ErNwgUz8mlNmsb4NVjQX0jF6gaePMdVCZ
 c+1WW9PscQzMjyon5I0uY7itg3MLj+VUTFmDNmX7QVpx3qA4lhc2Y97b+TVYY/zSMq/zSsUI1h1
 kiK+TI7+ctP5tE/NinZKE7JdclEI=
X-Google-Smtp-Source: AGHT+IGRgkUJ5Rti8S6SOWElwQX+1tRC/BKOw6sHe755KbeKZvmZu9RGzhQbLBsbx2HqlWTqXirKmy/+5uYKNWOvOrk=
X-Received: by 2002:a0d:ea04:0:b0:614:d22e:a5ec with SMTP id
 t4-20020a0dea04000000b00614d22ea5ecmr655500ywe.45.1712179055445; Wed, 03 Apr
 2024 14:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240403085424.1650628-1-francois.perrad@gadz.org>
 <Zg3Ct67Am5lo_rh-@landeda>
In-Reply-To: <Zg3Ct67Am5lo_rh-@landeda>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 3 Apr 2024 18:17:24 -0300
Message-ID: <CAM70yxB0ApbHut9Bc=uKyY96zX+yvuoA2wUCbf-xBtE6UQ_N=g@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712179055; x=1712783855; darn=busybox.net;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ppHAINQ06wTK8FB2mFAiYlARiOLaO4hGyfn/VRd0VCA=;
 b=eX2B+mDFslkhX30auCRAbqxDo511Y4/+f/8EjbqYQ4zDmEJF1qk7fW+/3MHEZTAvVP
 +w4rEsjUq1pNpSxy6Hd5UmP1zcXYs1/WFE2AZ1yB12PBO/vwKEg5rG33/I4rlMB4sWdc
 8iOSFfwPvHkQD7vbVJVX6IpQ47dbVioUvSfuS/J/z1Vnr+WSBnS6lp+MHOfiwo/JHWxu
 LneP2VAnjvjZSTffMFi4qNRFB0w1kJm8MI4tCK28PKWw662Mk+1ayyPTibtBhd+Qq9NN
 YS9psabZQUes89EqWbRUIvEhkCU/nwUk92EZcFV+Oll38y8RtHuVrYlqNLs/KH105Tup
 ebjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eX2B+mDF
Subject: Re: [Buildroot] [PATCH 1/3] package/lmdb: new package
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
Cc: buildroot@busybox.net, i Mauro Condarelli <mc5686@mclink.it>
Content-Type: multipart/mixed; boundary="===============5399217887238234107=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5399217887238234107==
Content-Type: multipart/alternative; boundary="000000000000645371061537c043"

--000000000000645371061537c043
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

My only interest in python-zlmdb was to be able to build a more recent
version of Crossbar, and I didn't even use that database component of
Crossbar that depended on ZLMDB.

I no longer use Crossbar (I'm developing my own C++ WAMP router), so I've
lost interest in those packages long ago.

Sorry, but I don't remember much about what I did concerning Crossbar and
Buildroot. I can tell you that the philosophy behind Crossbar's build is
not to rely too much on installed system packages.

Unless someone is still actively using it, you may want to consider
dropping Crossbar support in Buildroot because the amount of work needed to
be able to build the latest version in Buildroot is monumental.

Cheers,
Emile Cormier

On Wed, Apr 3, 2024 at 5:57=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free.=
fr>
wrote:

> Fran=C3=A7ois, All,
>
> +Mauro for pyhon-lmdb
> +Emile for python-zlmdb
>
> On 2024-04-03 10:54 +0200, Francois Perrad spake thusly:
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> [--SNIP--]
> > diff --git a/package/lmdb/Config.in b/package/lmdb/Config.in
> > new file mode 100644
> > index 0000000000..f4ae9f3103
> > --- /dev/null
> > +++ b/package/lmdb/Config.in
> > @@ -0,0 +1,13 @@
> > +config BR2_PACKAGE_LMDB
> > +     bool "lmdb"
> > +     depends on BR2_TOOLCHAIN_HAS_THREADS
> > +     help
> > +       OpenLDAP Lightning Memory-Mapped Database
> > +
> > +       LMDB is compact, fast, powerful, and robust and implements
> > +       a simplified variant of the BerkeleyDB (BDB) API.
> > +
> > +       https://symas.com/lmdb/
> > +
> > +comment "lmdb needs a toolchain w/ threads"
> > +     depends on !BR2_TOOLCHAIN_HAS_THREADS
>
> Mauro, Emile: python-lmdb bundles a copy of lmdb, but it is possible to
> configure it to use the system-provided library instead [0]. Do you know
> if there would be adverse effects to do so in Buildroot? Indeed, we
> prefer to configure packages to use system libraries rather than use
> there bundled copy whenever possible...
>
> [0] https://lmdb.readthedocs.io/en/release/#installation-unix
>
> I haven't looked at python-zlmdb, though...
>
> [--SNIP--]
> > diff --git a/package/lmdb/lmdb.mk b/package/lmdb/lmdb.mk
> > new file mode 100644
> > index 0000000000..5e2ad2d05a
> > --- /dev/null
> > +++ b/package/lmdb/lmdb.mk
> > @@ -0,0 +1,35 @@
> >
> +########################################################################=
########
> > +#
> > +# lmdb
> > +#
> >
> +########################################################################=
########
> > +
> > +LMDB_VERSION =3D 0.9.31
> > +LMDB_SITE =3D $(call github,LMDB,lmdb,LMDB_$(LMDB_VERSION))
> > +LMDB_LICENSE =3D OpenLDAP Public License
>
> I think we want to use the SPDX short tag here: OLDAP-2.8. Incidentally,
> this is also what is already used for python-lmdb.
>
> > +LMDB_LICENSE_FILES =3D libraries/liblmdb/LICENSE
> > +LMDB_INSTALL_STAGING =3D YES
> > +
> > +define LMDB_BUILD_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
> > +             CC=3D"$(TARGET_CC)" \
> > +             XCFLAGS=3D"$(TARGET_CFLAGS)" \
> > +             AR=3D"$(TARGET_CROSS)ar" \
>
> Why not use $(TARGET_CONFIGURE_OPTS) and just add the special XCFLAGS?
>
> > +             all
>
> 'all' is usually the default target, for being the first in the
> Makefile, which is also the cae here, so there is no reason to specify
> it.
>
> > +endef
> > +
> > +define LMDB_INSTALL_STAGING_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
> > +             DESTDIR=3D"$(STAGING_DIR)" \
> > +             prefix=3D/usr \
> > +             install
> > +endef
> > +
> > +define LMDB_INSTALL_TARGET_CMDS
> > +     $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/liblmdb \
> > +             DESTDIR=3D"$(TARGET_DIR)" \
> > +             prefix=3D/usr \
> > +             install
> > +endef
> > +
> > +$(eval $(generic-package))
> > --
> > 2.39.2
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--000000000000645371061537c043
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>My only interest in pyth=
on-zlmdb was to be able to build a more recent version of Crossbar, and I d=
idn&#39;t even use that database component of Crossbar that depended on ZLM=
DB.</div><div><br></div><div>I no longer use Crossbar (I&#39;m developing m=
y own C++ WAMP router), so I&#39;ve lost interest in those packages long ag=
o.</div><div><br></div><div>Sorry, but I don&#39;t remember much about what=
 I did concerning Crossbar and Buildroot. I can tell you that the philosoph=
y behind Crossbar&#39;s build is not to rely too much on installed system p=
ackages.</div><div><br></div><div>Unless someone is still actively using it=
, you may want to consider dropping Crossbar support in Buildroot because t=
he amount of work needed to be able to build the latest version in Buildroo=
t is monumental.</div><div><br></div><div>Cheers,</div><div>Emile Cormier<b=
r></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Wed, Apr 3, 2024 at 5:57=E2=80=AFPM Yann E. MORIN &lt;<a href=3D=
"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Fran=C3=A7ois, All,=
<br>
<br>
+Mauro for pyhon-lmdb<br>
+Emile for python-zlmdb<br>
<br>
On 2024-04-03 10:54 +0200, Francois Perrad spake thusly:<br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
[--SNIP--]<br>
&gt; diff --git a/package/lmdb/Config.in b/package/lmdb/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f4ae9f3103<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/lmdb/Config.in<br>
&gt; @@ -0,0 +1,13 @@<br>
&gt; +config BR2_PACKAGE_LMDB<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;lmdb&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_TOOLCHAIN_HAS_THREADS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0OpenLDAP Lightning Memory-Mapped Database<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0LMDB is compact, fast, powerful, and robus=
t and implements<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0a simplified variant of the BerkeleyDB (BD=
B) API.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://symas.com/lmdb/" rel=3D=
"noreferrer" target=3D"_blank">https://symas.com/lmdb/</a><br>
&gt; +<br>
&gt; +comment &quot;lmdb needs a toolchain w/ threads&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on !BR2_TOOLCHAIN_HAS_THREADS<br>
<br>
Mauro, Emile: python-lmdb bundles a copy of lmdb, but it is possible to<br>
configure it to use the system-provided library instead [0]. Do you know<br=
>
if there would be adverse effects to do so in Buildroot? Indeed, we<br>
prefer to configure packages to use system libraries rather than use<br>
there bundled copy whenever possible...<br>
<br>
[0] <a href=3D"https://lmdb.readthedocs.io/en/release/#installation-unix" r=
el=3D"noreferrer" target=3D"_blank">https://lmdb.readthedocs.io/en/release/=
#installation-unix</a><br>
<br>
I haven&#39;t looked at python-zlmdb, though...<br>
<br>
[--SNIP--]<br>
&gt; diff --git a/package/lmdb/<a href=3D"http://lmdb.mk" rel=3D"noreferrer=
" target=3D"_blank">lmdb.mk</a> b/package/lmdb/<a href=3D"http://lmdb.mk" r=
el=3D"noreferrer" target=3D"_blank">lmdb.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5e2ad2d05a<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/lmdb/<a href=3D"http://lmdb.mk" rel=3D"noreferrer" targe=
t=3D"_blank">lmdb.mk</a><br>
&gt; @@ -0,0 +1,35 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# lmdb<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +LMDB_VERSION =3D 0.9.31<br>
&gt; +LMDB_SITE =3D $(call github,LMDB,lmdb,LMDB_$(LMDB_VERSION))<br>
&gt; +LMDB_LICENSE =3D OpenLDAP Public License<br>
<br>
I think we want to use the SPDX short tag here: OLDAP-2.8. Incidentally,<br=
>
this is also what is already used for python-lmdb.<br>
<br>
&gt; +LMDB_LICENSE_FILES =3D libraries/liblmdb/LICENSE<br>
&gt; +LMDB_INSTALL_STAGING =3D YES<br>
&gt; +<br>
&gt; +define LMDB_BUILD_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/lib=
lmdb \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0CC=3D&quot;$(TARGET_C=
C)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0XCFLAGS=3D&quot;$(TAR=
GET_CFLAGS)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AR=3D&quot;$(TARGET_C=
ROSS)ar&quot; \<br>
<br>
Why not use $(TARGET_CONFIGURE_OPTS) and just add the special XCFLAGS?<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0all<br>
<br>
&#39;all&#39; is usually the default target, for being the first in the<br>
Makefile, which is also the cae here, so there is no reason to specify<br>
it.<br>
<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define LMDB_INSTALL_STAGING_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/lib=
lmdb \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=3D&quot;$(STA=
GING_DIR)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix=3D/usr \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<br>
&gt; +endef<br>
&gt; +<br>
&gt; +define LMDB_INSTALL_TARGET_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libraries/lib=
lmdb \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DESTDIR=3D&quot;$(TAR=
GET_DIR)&quot; \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0prefix=3D/usr \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install<br>
&gt; +endef<br>
&gt; +<br>
&gt; +$(eval $(generic-package))<br>
&gt; -- <br>
&gt; 2.39.2<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--000000000000645371061537c043--

--===============5399217887238234107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5399217887238234107==--
