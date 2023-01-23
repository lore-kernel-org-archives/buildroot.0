Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA0DC05027
	for <buildroot@archiver.kernel.org>; Mon, 23 Jan 2023 13:32:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6060F81E00;
	Mon, 23 Jan 2023 13:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6060F81E00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEtmD6F4a3vg; Mon, 23 Jan 2023 13:32:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 16BF881E68;
	Mon, 23 Jan 2023 13:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16BF881E68
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 76ECC1BF359
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B3F24056B
 for <buildroot@lists.busybox.net>; Mon, 23 Jan 2023 13:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B3F24056B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LpIvuP3Dg5K for <buildroot@lists.busybox.net>;
 Mon, 23 Jan 2023 13:32:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 715EA4037E
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 715EA4037E
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 13:32:30 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id d30so18148753lfv.8
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 05:32:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ohDtHzm2M6Czp3Y+V7dEXz2BrFEGwE3OOxJs75hiJZI=;
 b=r1tZ0bT8tKLyGKDuvxuzixYgVpsQvu04EE1jcn/3nZ1UZOcoqujVxjExgFu2c7J3MK
 0fvbqyaYihdEfe1kxNB9h5PRXB3sjOo7pV3ElMVBeOnNGOd3ZbQO9H9fv9/f34kxB+gV
 isRYOiw92gTWN5d4GC84Y4tlfqPyEGFPonUHU66PijEONMI1msKyoF+cQp1W29GX3uGA
 yo9HXtpTGrOuT5LB1j0Q1+zHDRF4rVQ5shawxVXQU0vJiyXzYbq+VQc9/xTAAQRH8jKh
 n1skvUTGck9jUvKgQY5mxVRWFxrZ0i07I9KjWFypRgMOkx4XQzR4BmtV/PTVzbiATR3z
 l4IQ==
X-Gm-Message-State: AFqh2kpJuLdG4eBdnPre/q+/ecZxZr7S9AwBoYsFRD2KBveqVjr4oj7m
 8P+yI+4nFEwL70n2gbpldchqdGkpNmTIXu7E
X-Google-Smtp-Source: AMrXdXsPs2l8EsaBAJaIz1/MFh35J0Bo/Hc1ITyo0EgtVocRkzUT3EoG19cQTn6CjSIn6Fr8XNkGPA==
X-Received: by 2002:a05:6512:12cf:b0:4b5:5bc6:e3de with SMTP id
 p15-20020a05651212cf00b004b55bc6e3demr8985498lfg.65.1674480747713; 
 Mon, 23 Jan 2023 05:32:27 -0800 (PST)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48]) by smtp.gmail.com with ESMTPSA id
 k17-20020a05651210d100b004ab2cb8deb5sm6511974lfg.18.2023.01.23.05.32.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 05:32:27 -0800 (PST)
Received: by mail-lf1-f48.google.com with SMTP id a11so18284562lfg.0
 for <buildroot@buildroot.org>; Mon, 23 Jan 2023 05:32:26 -0800 (PST)
X-Received: by 2002:a05:6512:3b9b:b0:4d5:850a:8330 with SMTP id
 g27-20020a0565123b9b00b004d5850a8330mr1385873lfv.665.1674480746531; Mon, 23
 Jan 2023 05:32:26 -0800 (PST)
MIME-Version: 1.0
References: <20230123103224.1267225-1-thomas.devoogdt@barco.com>
 <87ilgxa1od.fsf@dell.be.48ers.dk>
In-Reply-To: <87ilgxa1od.fsf@dell.be.48ers.dk>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Mon, 23 Jan 2023 14:32:14 +0100
X-Gmail-Original-Message-ID: <CACXRmJirfv=4wCfwBWf6aAh39P=CBc5wB8TA6Era1FLOisDgFQ@mail.gmail.com>
Message-ID: <CACXRmJirfv=4wCfwBWf6aAh39P=CBc5wB8TA6Era1FLOisDgFQ@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/fluent-bit: add new package
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org,
 Anton Danneels <anton.danneels@barco.com>,
 Grim Delcour <grim.delcour@barco.com>
Content-Type: multipart/mixed; boundary="===============6532743012751142023=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6532743012751142023==
Content-Type: multipart/alternative; boundary="00000000000014936c05f2ee6e9f"

--00000000000014936c05f2ee6e9f
Content-Type: text/plain; charset="UTF-8"

Op ma 23 jan. 2023 om 13:13 schreef Peter Korsgaard <peter@korsgaard.com>:
> >>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:
>
>  > Fluent Bit is a super fast, lightweight, and highly
>  > scalable logging and metrics processor and forwarder.
>
>  > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
>
> Thanks. When you send an update to a patch, then please mark it as v2,
> v3, .. (git send-email -v<n>) and include a summary of what you have
> changed since the previous version for easier review:
>
>
https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog
>
> > ---
>  >  package/Config.in                  |  1 +
>  >  package/fluent-bit/Config.in       | 13 ++++++++
>  >  package/fluent-bit/S99fluent-bit   | 51 ++++++++++++++++++++++++++++++
>  >  package/fluent-bit/fluent-bit.hash |  3 ++
>  >  package/fluent-bit/fluent-bit.mk   | 43 +++++++++++++++++++++++++
>  >  5 files changed, 111 insertions(+)
>  >  create mode 100644 package/fluent-bit/Config.in
>  >  create mode 100644 package/fluent-bit/S99fluent-bit
>  >  create mode 100644 package/fluent-bit/fluent-bit.hash
>  >  create mode 100644 package/fluent-bit/fluent-bit.mk
>
>  > diff --git a/package/Config.in b/package/Config.in
>  > index 995dae2c57..b281a67157 100644
>  > --- a/package/Config.in
>  > +++ b/package/Config.in
>  > @@ -2610,6 +2610,7 @@ menu "System tools"
>  >      source "package/efivar/Config.in"
>  >      source "package/embiggen-disk/Config.in"
>  >      source "package/emlog/Config.in"
>  > +    source "package/fluent-bit/Config.in"
>  >      source "package/ftop/Config.in"
>  >      source "package/getent/Config.in"
>  >      source "package/gkrellm/Config.in"
>  > diff --git a/package/fluent-bit/Config.in
b/package/fluent-bit/Config.in
>  > new file mode 100644
>  > index 0000000000..c8f9d4e489
>  > --- /dev/null
>  > +++ b/package/fluent-bit/Config.in
>  > @@ -0,0 +1,13 @@
>  > +config BR2_PACKAGE_FLUENT_BIT
>  > +    bool "fluent-bit"
>  > +    depends on BR2_TOOLCHAIN_USES_GLIBC
>  > +    depends on !BR2_STATIC_LIBS
>  > +    select BR2_PACKAGE_OPENSSL
>
> Can this work with libressl? If not, then it needs to select
> BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

I don't see any reasons why it shouldn't work with it. But I couldn't
test it with ./utils/test-pkg (yet).

>  > +stop() {
>  > +    printf "Stopping fluent-bit: "
>  > +    start-stop-daemon -K -q -p $PID_FILE
>  > +    # Fluent-bit takes max 5 seconds to exit,
>
> Where does this guarantee come from?

Part of the config, but the default is 5 seconds.
https://github.com/fluent/fluent-bit/blob/617f69597e60c440e73667a11d40f9fec26aa57b/src/flb_engine.c#L526
https://github.com/fluent/fluent-bit/blob/617f69597e60c440e73667a11d40f9fec26aa57b/src/flb_config.c#L125

>  > +    # so wait max 30 x 0.2 = 6 seconds.
>  > +    TIMEOUT=30
>  > +    while pidof $NAME >/dev/null; do
>
> You already told start-stop-daemon to write a pidfile, so it would be
> better to use that (and possibly remove it at the end). You can use kill
> -0 <pid> to check if the pid is still running.

Ok, will change that.

>  > +            [ $TIMEOUT -eq 0 ] && echo "FAIL" && return 1
>  > +            TIMEOUT=$((TIMEOUT - 1))
>  > +            sleep 0.2
>
> busybox sleep only support fractional seconds if FEATURE_FANCY_SLEEP is
> enabled, so it would be better to use sleep 1.

Ok, will change that.

> > +     done
>  > +    echo "OK"
>  > +}
>  > +restart() {
>  > +    stop
>  > +    start
>  > +}
>  > +
>  > +case "$1" in
>  > +start)
>  > +    start
>  > +    ;;
>  > +stop)
>  > +    stop
>  > +    ;;
>  > +restart | reload)
>  > +    restart
>  > +    ;;
>  > +*)
>  > +    echo "Usage: $0 {start|stop|restart}"
>  > +    exit 1
>  > +    ;;
>  > +esac
>  > +
>  > +exit $?
>  > diff --git a/package/fluent-bit/fluent-bit.hash
b/package/fluent-bit/fluent-bit.hash
>  > new file mode 100644
>  > index 0000000000..ce7cea7b59
>  > --- /dev/null
>  > +++ b/package/fluent-bit/fluent-bit.hash
>  > @@ -0,0 +1,3 @@
>  > +# Locally computed
>  > +sha256
 8ff5566389033669feabc9c69a5c6f417dad5c8b066454388e6a706507262acf
 fluent-bit-2.0.8.tar.gz
>  > +sha256
 0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
>  > diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/
fluent-bit.mk
>  > new file mode 100644
>  > index 0000000000..c213ca2239
>  > --- /dev/null
>  > +++ b/package/fluent-bit/fluent-bit.mk
>  > @@ -0,0 +1,43 @@
>  >
+################################################################################
>  > +#
>  > +# fluent-bit
>  > +#
>  >
+################################################################################
>  > +
>  > +FLUENT_BIT_VERSION = 2.0.8
>  > +FLUENT_BIT_SITE = $(call
github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION))
>  > +FLUENT_BIT_LICENSE = Apache-2.0
>  > +FLUENT_BIT_LICENSE_FILES = LICENSE
>  > +FLUENT_BIT_DEPENDENCIES = host-bison host-flex libyaml libopenssl
>  > +
>  > +FLUENT_BIT_CONF_OPTS += \
>  > +    -DFLB_DEBUG=No \
>  > +    -DFLB_RELEASE=Yes \
>  > +    -DFLB_EXAMPLES=No \
>  > +    -DFLB_CHUNK_TRACE=No \
>  > +    -DFLB_BACKTRACE=No \
>  > +    -DFLB_LUAJIT=No
>  > +
>  > +# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc
fts.h
>  > +# large file support.
>  > +# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more
information.
>  > +FLUENT_BIT_CONF_OPTS += \
>  > +    -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
>  > +    -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS"
>  > +
>  > +# Move the config files from /usr/etc/ to /etc/.
>  > +FLUENT_BIT_CONF_OPTS += \
>  > +    -DCMAKE_INSTALL_SYSCONFDIR="/etc/"
>
> Hmm, why is this needed? This should already default to "etc"?
> https://cmake.org/cmake/help/latest/command/install.html#installing-files
>
> I see that there are some bug reports related to this, E.G.:
> https://github.com/fluent/fluent-bit/issues/6619

I guess that this option comes from CMake, based on other options:
https://cmake.org/cmake/help/latest/module/GNUInstallDirs.html#special-cases

But I see that fluent-bit had to do the same for their docker file.
https://github.com/fluent/fluent-bit/issues/6711#issuecomment-1400192636

> > +
>  > +define FLUENT_BIT_INSTALL_INIT_SYSV
>  > +    $(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \
>  > +            $(TARGET_DIR)/etc/init.d/S99fluent-bit
>  > +endef
>  > +
>  > +define FLUENT_BIT_POST_INSTALL_TARGET_HOOK
>  > +    cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/
>  > +endef
>
> Why is this needed? Is it possible to link against an external miniz? If
> not, perhaps we should build with BUILD_SHARED_LIBS=off to ensure no
> conflicts in case we ever get a miniz package?

Reported an issue related to the same problem:
https://github.com/fluent/fluent-bit/issues/6711

I'm still trying to find how to make sure that this library is
statically linked.
Enabling the miniz package in buildroot might not be a good idea
related to versioning.

> --
> Bye, Peter Korsgaard
>

Kr,
Thomas

--00000000000014936c05f2ee6e9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Op ma 23 jan. 2023 om 13:13 schreef Peter Korsgaard &lt;<a=
 href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt;:<br>&gt; &=
gt;&gt;&gt;&gt;&gt; &quot;Thomas&quot; =3D=3D Thomas Devoogdt &lt;<a href=
=3D"mailto:thomas@devoogdt.com">thomas@devoogdt.com</a>&gt; writes:<br>&gt;=
<br>&gt; =C2=A0&gt; Fluent Bit is a super fast, lightweight, and highly<br>=
&gt; =C2=A0&gt; scalable logging and metrics processor and forwarder.<br>&g=
t;<br>&gt; =C2=A0&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:=
thomas.devoogdt@barco.com">thomas.devoogdt@barco.com</a>&gt;<br>&gt;<br>&gt=
; Thanks. When you send an update to a patch, then please mark it as v2,<br=
>&gt; v3, .. (git send-email -v&lt;n&gt;) and include a summary of what you=
 have<br>&gt; changed since the previous version for easier review:<br>&gt;=
<br>&gt; <a href=3D"https://buildroot.org/downloads/manual/manual.html#_pat=
ch_revision_changelog">https://buildroot.org/downloads/manual/manual.html#_=
patch_revision_changelog</a><br>&gt;<br>&gt; &gt; ---<br>&gt; =C2=A0&gt; =
=C2=A0package/Config.in =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| =C2=A01 +<br>&gt; =C2=A0&gt; =C2=A0package/fluent-bit/Config=
.in =C2=A0 =C2=A0 =C2=A0 | 13 ++++++++<br>&gt; =C2=A0&gt; =C2=A0package/flu=
ent-bit/S99fluent-bit =C2=A0 | 51 ++++++++++++++++++++++++++++++<br>&gt; =
=C2=A0&gt; =C2=A0package/fluent-bit/fluent-bit.hash | =C2=A03 ++<br>&gt; =
=C2=A0&gt; =C2=A0package/fluent-bit/<a href=3D"http://fluent-bit.mk">fluent=
-bit.mk</a> =C2=A0 | 43 +++++++++++++++++++++++++<br>&gt; =C2=A0&gt; =C2=A0=
5 files changed, 111 insertions(+)<br>&gt; =C2=A0&gt; =C2=A0create mode 100=
644 package/fluent-bit/Config.in<br>&gt; =C2=A0&gt; =C2=A0create mode 10064=
4 package/fluent-bit/S99fluent-bit<br>&gt; =C2=A0&gt; =C2=A0create mode 100=
644 package/fluent-bit/fluent-bit.hash<br>&gt; =C2=A0&gt; =C2=A0create mode=
 100644 package/fluent-bit/<a href=3D"http://fluent-bit.mk">fluent-bit.mk</=
a><br>&gt;<br>&gt; =C2=A0&gt; diff --git a/package/Config.in b/package/Conf=
ig.in<br>&gt; =C2=A0&gt; index 995dae2c57..b281a67157 100644<br>&gt; =C2=A0=
&gt; --- a/package/Config.in<br>&gt; =C2=A0&gt; +++ b/package/Config.in<br>=
&gt; =C2=A0&gt; @@ -2610,6 +2610,7 @@ menu &quot;System tools&quot;<br>&gt;=
 =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0source &quot;package/efivar/Config.in&quot;=
<br>&gt; =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0source &quot;package/embiggen-disk/=
Config.in&quot;<br>&gt; =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0source &quot;package=
/emlog/Config.in&quot;<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0source &quot;packa=
ge/fluent-bit/Config.in&quot;<br>&gt; =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0source=
 &quot;package/ftop/Config.in&quot;<br>&gt; =C2=A0&gt; =C2=A0 =C2=A0 =C2=A0=
source &quot;package/getent/Config.in&quot;<br>&gt; =C2=A0&gt; =C2=A0 =C2=
=A0 =C2=A0source &quot;package/gkrellm/Config.in&quot;<br>&gt; =C2=A0&gt; d=
iff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in<br>=
&gt; =C2=A0&gt; new file mode 100644<br>&gt; =C2=A0&gt; index 0000000000..c=
8f9d4e489<br>&gt; =C2=A0&gt; --- /dev/null<br>&gt; =C2=A0&gt; +++ b/package=
/fluent-bit/Config.in<br>&gt; =C2=A0&gt; @@ -0,0 +1,13 @@<br>&gt; =C2=A0&gt=
; +config BR2_PACKAGE_FLUENT_BIT<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0bool &qu=
ot;fluent-bit&quot;<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0depends on BR2_TOOLCH=
AIN_USES_GLIBC<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0depends on !BR2_STATIC_LIB=
S<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0select BR2_PACKAGE_OPENSSL<br>&gt;<br>&=
gt; Can this work with libressl? If not, then it needs to select<br>&gt; BR=
2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL<br><br>I don&#39;t see any reasons why i=
t shouldn&#39;t work with it. But I couldn&#39;t<br>test it with ./utils/te=
st-pkg (yet).<br><br>&gt; =C2=A0&gt; +stop() {<br>&gt; =C2=A0&gt; + =C2=A0 =
=C2=A0printf &quot;Stopping fluent-bit: &quot;<br>&gt; =C2=A0&gt; + =C2=A0 =
=C2=A0start-stop-daemon -K -q -p $PID_FILE<br>&gt; =C2=A0&gt; + =C2=A0 =C2=
=A0# Fluent-bit takes max 5 seconds to exit,<br>&gt;<br>&gt; Where does thi=
s guarantee come from?<br><br>Part of the config, but the default is 5 seco=
nds.<br><a href=3D"https://github.com/fluent/fluent-bit/blob/617f69597e60c4=
40e73667a11d40f9fec26aa57b/src/flb_engine.c#L526">https://github.com/fluent=
/fluent-bit/blob/617f69597e60c440e73667a11d40f9fec26aa57b/src/flb_engine.c#=
L526</a><br><a href=3D"https://github.com/fluent/fluent-bit/blob/617f69597e=
60c440e73667a11d40f9fec26aa57b/src/flb_config.c#L125">https://github.com/fl=
uent/fluent-bit/blob/617f69597e60c440e73667a11d40f9fec26aa57b/src/flb_confi=
g.c#L125</a><br><br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0# so wait max 30 x 0.2 =
=3D 6 seconds.<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0TIMEOUT=3D30<br>&gt; =C2=
=A0&gt; + =C2=A0 =C2=A0while pidof $NAME &gt;/dev/null; do<br>&gt;<br>&gt; =
You already told start-stop-daemon to write a pidfile, so it would be<br>&g=
t; better to use that (and possibly remove it at the end). You can use kill=
<br>&gt; -0 &lt;pid&gt; to check if the pid is still running.<br><br>Ok, wi=
ll change that.<br><br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0[ $TIMEOUT -eq 0 ] &amp;&amp; echo &quot;FAIL&quot; &amp;&amp; retur=
n 1<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIMEOUT=
=3D$((TIMEOUT - 1))<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0sleep 0.2<br>&gt;<br>&gt; busybox sleep only support fractional seco=
nds if FEATURE_FANCY_SLEEP is<br>&gt; enabled, so it would be better to use=
 sleep 1.<br><br>Ok, will change that.<br><br>&gt; &gt; + =C2=A0 =C2=A0 don=
e<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0echo &quot;OK&quot;<br>&gt; =C2=A0&gt; =
+}<br>&gt; =C2=A0&gt; +restart() {<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0stop<b=
r>&gt; =C2=A0&gt; + =C2=A0 =C2=A0start<br>&gt; =C2=A0&gt; +}<br>&gt; =C2=A0=
&gt; +<br>&gt; =C2=A0&gt; +case &quot;$1&quot; in<br>&gt; =C2=A0&gt; +start=
)<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0start<br>&gt; =C2=A0&gt; + =C2=A0 =C2=
=A0;;<br>&gt; =C2=A0&gt; +stop)<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0stop<br>&=
gt; =C2=A0&gt; + =C2=A0 =C2=A0;;<br>&gt; =C2=A0&gt; +restart | reload)<br>&=
gt; =C2=A0&gt; + =C2=A0 =C2=A0restart<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0;;<=
br>&gt; =C2=A0&gt; +*)<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0echo &quot;Usage: =
$0 {start|stop|restart}&quot;<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0exit 1<br>&=
gt; =C2=A0&gt; + =C2=A0 =C2=A0;;<br>&gt; =C2=A0&gt; +esac<br>&gt; =C2=A0&gt=
; +<br>&gt; =C2=A0&gt; +exit $?<br>&gt; =C2=A0&gt; diff --git a/package/flu=
ent-bit/fluent-bit.hash b/package/fluent-bit/fluent-bit.hash<br>&gt; =C2=A0=
&gt; new file mode 100644<br>&gt; =C2=A0&gt; index 0000000000..ce7cea7b59<b=
r>&gt; =C2=A0&gt; --- /dev/null<br>&gt; =C2=A0&gt; +++ b/package/fluent-bit=
/fluent-bit.hash<br>&gt; =C2=A0&gt; @@ -0,0 +1,3 @@<br>&gt; =C2=A0&gt; +# L=
ocally computed<br>&gt; =C2=A0&gt; +sha256 =C2=A08ff5566389033669feabc9c69a=
5c6f417dad5c8b066454388e6a706507262acf =C2=A0fluent-bit-2.0.8.tar.gz<br>&gt=
; =C2=A0&gt; +sha256 =C2=A00d542e0c8804e39aa7f37eb00da5a762149dc682d7829451=
287e11b938e94594 =C2=A0LICENSE<br>&gt; =C2=A0&gt; diff --git a/package/flue=
nt-bit/<a href=3D"http://fluent-bit.mk">fluent-bit.mk</a> b/package/fluent-=
bit/<a href=3D"http://fluent-bit.mk">fluent-bit.mk</a><br>&gt; =C2=A0&gt; n=
ew file mode 100644<br>&gt; =C2=A0&gt; index 0000000000..c213ca2239<br>&gt;=
 =C2=A0&gt; --- /dev/null<br>&gt; =C2=A0&gt; +++ b/package/fluent-bit/<a hr=
ef=3D"http://fluent-bit.mk">fluent-bit.mk</a><br>&gt; =C2=A0&gt; @@ -0,0 +1=
,43 @@<br>&gt; =C2=A0&gt; +################################################=
################################<br>&gt; =C2=A0&gt; +#<br>&gt; =C2=A0&gt; +=
# fluent-bit<br>&gt; =C2=A0&gt; +#<br>&gt; =C2=A0&gt; +####################=
############################################################<br>&gt; =C2=A0=
&gt; +<br>&gt; =C2=A0&gt; +FLUENT_BIT_VERSION =3D 2.0.8<br>&gt; =C2=A0&gt; =
+FLUENT_BIT_SITE =3D $(call github,fluent,fluent-bit,v$(FLUENT_BIT_VERSION)=
)<br>&gt; =C2=A0&gt; +FLUENT_BIT_LICENSE =3D Apache-2.0<br>&gt; =C2=A0&gt; =
+FLUENT_BIT_LICENSE_FILES =3D LICENSE<br>&gt; =C2=A0&gt; +FLUENT_BIT_DEPEND=
ENCIES =3D host-bison host-flex libyaml libopenssl<br>&gt; =C2=A0&gt; +<br>=
&gt; =C2=A0&gt; +FLUENT_BIT_CONF_OPTS +=3D \<br>&gt; =C2=A0&gt; + =C2=A0 =
=C2=A0-DFLB_DEBUG=3DNo \<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0-DFLB_RELEASE=3D=
Yes \<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0-DFLB_EXAMPLES=3DNo \<br>&gt; =C2=
=A0&gt; + =C2=A0 =C2=A0-DFLB_CHUNK_TRACE=3DNo \<br>&gt; =C2=A0&gt; + =C2=A0=
 =C2=A0-DFLB_BACKTRACE=3DNo \<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0-DFLB_LUAJI=
T=3DNo<br>&gt; =C2=A0&gt; +<br>&gt; =C2=A0&gt; +# Undefining _FILE_OFFSET_B=
ITS here because of a &quot;bug&quot; with glibc fts.h<br>&gt; =C2=A0&gt; +=
# large file support.<br>&gt; =C2=A0&gt; +# See <a href=3D"https://bugzilla=
.redhat.com/show_bug.cgi?id=3D574992">https://bugzilla.redhat.com/show_bug.=
cgi?id=3D574992</a> for more information.<br>&gt; =C2=A0&gt; +FLUENT_BIT_CO=
NF_OPTS +=3D \<br>&gt; =C2=A0&gt; + =C2=A0 =C2=A0-DCMAKE_C_FLAGS=3D&quot;$(=
TARGET_CFLAGS) -U_FILE_OFFSET_BITS&quot; \<br>&gt; =C2=A0&gt; + =C2=A0 =C2=
=A0-DCMAKE_CXX_FLAGS=3D&quot;$(TARGET_CXXFLAGS) -U_FILE_OFFSET_BITS&quot;<b=
r>&gt; =C2=A0&gt; +<br>&gt; =C2=A0&gt; +# Move the config files from /usr/e=
tc/ to /etc/.<br>&gt; =C2=A0&gt; +FLUENT_BIT_CONF_OPTS +=3D \<br>&gt; =C2=
=A0&gt; + =C2=A0 =C2=A0-DCMAKE_INSTALL_SYSCONFDIR=3D&quot;/etc/&quot;<br>&g=
t;<br>&gt; Hmm, why is this needed? This should already default to &quot;et=
c&quot;?<br>&gt; <a href=3D"https://cmake.org/cmake/help/latest/command/ins=
tall.html#installing-files">https://cmake.org/cmake/help/latest/command/ins=
tall.html#installing-files</a><br>&gt;<br>&gt; I see that there are some bu=
g reports related to this, E.G.:<br>&gt; <a href=3D"https://github.com/flue=
nt/fluent-bit/issues/6619">https://github.com/fluent/fluent-bit/issues/6619=
</a><br><br>I guess that this option comes from CMake, based on other optio=
ns:<br><a href=3D"https://cmake.org/cmake/help/latest/module/GNUInstallDirs=
.html#special-cases">https://cmake.org/cmake/help/latest/module/GNUInstallD=
irs.html#special-cases</a><br><br>But I see that fluent-bit had to do the s=
ame for their docker file.<br><a href=3D"https://github.com/fluent/fluent-b=
it/issues/6711#issuecomment-1400192636">https://github.com/fluent/fluent-bi=
t/issues/6711#issuecomment-1400192636</a><br><br>&gt; &gt; +<br>&gt; =C2=A0=
&gt; +define FLUENT_BIT_INSTALL_INIT_SYSV<br>&gt; =C2=A0&gt; + =C2=A0 =C2=
=A0$(INSTALL) -D -m 0755 package/fluent-bit/S99fluent-bit \<br>&gt; =C2=A0&=
gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/init.d/S99=
fluent-bit<br>&gt; =C2=A0&gt; +endef<br>&gt; =C2=A0&gt; +<br>&gt; =C2=A0&gt=
; +define FLUENT_BIT_POST_INSTALL_TARGET_HOOK<br>&gt; =C2=A0&gt; + =C2=A0 =
=C2=A0cp -dpf $(@D)/lib/libminiz*.so* $(TARGET_DIR)/usr/lib/<br>&gt; =C2=A0=
&gt; +endef<br>&gt;<br>&gt; Why is this needed? Is it possible to link agai=
nst an external miniz? If<br>&gt; not, perhaps we should build with BUILD_S=
HARED_LIBS=3Doff to ensure no<br>&gt; conflicts in case we ever get a miniz=
 package?<br><br>Reported an issue related to the same problem:<br><a href=
=3D"https://github.com/fluent/fluent-bit/issues/6711">https://github.com/fl=
uent/fluent-bit/issues/6711</a><br><br>I&#39;m still trying to find how to =
make sure that this library is<br>statically linked.<br>Enabling the miniz =
package in buildroot might not be a good idea<br>related to versioning.<br>=
<br>&gt; --<br>&gt; Bye, Peter Korsgaard<br>&gt;<div><br></div><div>Kr,</di=
v><div>Thomas</div></div>

--00000000000014936c05f2ee6e9f--

--===============6532743012751142023==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6532743012751142023==--
