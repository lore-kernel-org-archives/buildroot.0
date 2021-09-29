Return-Path: <SRS0=V5PJ=OT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32369C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 11:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CF1B61409
	for <buildroot@archiver.kernel.org>; Wed, 29 Sep 2021 11:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CF1B61409
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D34481A34;
	Wed, 29 Sep 2021 11:37:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1-6FMAjURxz; Wed, 29 Sep 2021 11:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0437A81D2D;
	Wed, 29 Sep 2021 11:37:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8587B1BF951
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 11:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BC246069B
 for <buildroot@lists.busybox.net>; Wed, 29 Sep 2021 11:37:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HE16mzrLF1Kj for <buildroot@lists.busybox.net>;
 Wed, 29 Sep 2021 11:37:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23DAA60634
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 11:37:44 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id y35so7486271ede.3
 for <buildroot@buildroot.org>; Wed, 29 Sep 2021 04:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=VEEgN2kNRjIDbF8F7E9KZijXozD0GGkqHUOxzWZbL0Y=;
 b=ljHOPT2E6pVTEdYjcYYcS9TewtwDXFDGCkrJqsO6JNpga7x2UQVvchoCwRoRPvxKBK
 Ov1/7UxvXMeRAFk33QUb73dfyzHD21iaKd1HQGr2wdlcJxRFDd0VBxP5XQAye287PI5S
 mdaivl97bdV+6vmVEqwo8vdtAV57C1ry23evKDqQMdsHJXH/r656RL+/D9TBfepzSbI7
 NJulgA2lX/QmztzWx1r0Hi646FmKY7nbKhiMvkK61+s86bpEedHIIj/8HznCet38CPkP
 KKyJGK8/E31cDpX/+nrACBqR5M3rWwOcr9dMEQTRup+Et6Ru7I8Z/sDAqsVNXIlA0Ptb
 jzwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=VEEgN2kNRjIDbF8F7E9KZijXozD0GGkqHUOxzWZbL0Y=;
 b=3GVQpKO4pr3jgJQze9UDt2mr0hgY2/otCmUOmHKqLULGCcLPHOFeP4/7MrmrcrDhQv
 lnA6gBh/nDD1uyxWeYCsb9WETbD/YOLSVda9l1sjF7QcRC1LVn5wjLrvu3znbGrsuDDr
 wdeV/Vh0fyeD3c31EoNiFRIj0bbgDwJCIKWAbwbSAY8zqlmAEE2ptT/yIHH0dveNCI04
 gQSzHdiLjxbz+ECA+KD9Sib2it3gJ0W8oZtTjt3kapG9/Ll1aYTC9chJYfN11bJe2aWi
 eowE3lzDdqKF3n0CESphWn+WKFyn2tjrs1DD4uSeb7D5zpL/sgRAPC5F8p/BH8XEPqdh
 2asQ==
X-Gm-Message-State: AOAM530w9bYIyGoz+ogCMUK9Tn1his7O/Aef9EEWyjbrJnRbofnNpa0r
 zG9jljc0HtkIKlWZWbV1/xkw74yEsNAb92XKY7QsSR8v1yaRx3bT
X-Google-Smtp-Source: ABdhPJwO0Ry5Nbdsy6Npa/xB/tww7BYfZqI/PXTVa25A5WvyrBZfXL+TMKoWxEQM9JsZK4i0FbOElKyU4ZMA7OGWk6w=
X-Received: by 2002:a50:da0a:: with SMTP id z10mr13910479edj.298.1632915462104; 
 Wed, 29 Sep 2021 04:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210907125841.509792-1-jose.pekkarinen@unikie.com>
In-Reply-To: <20210907125841.509792-1-jose.pekkarinen@unikie.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 29 Sep 2021 14:37:31 +0300
Message-ID: <CAJPV9MqUtYv4sCEkq5o8DT+vsbMoSw_D2-e8G2+yOFdfJ51kBw@mail.gmail.com>
To: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/policycoreutils: Add service to
 handle selinux autorelabel
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
Content-Type: multipart/mixed; boundary="===============8109033389265613310=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8109033389265613310==
Content-Type: multipart/alternative; boundary="000000000000113f4905cd20c251"

--000000000000113f4905cd20c251
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Can I get some comments here? I'm starting

to do some tests with 2021.08 and I find unlabeled
stuff like the following ones:

[   10.534555] SELinux:  Context Default is not valid (left unmapped).
[   10.562318] audit: type=3D1400 audit(1632913977.130:4): avc:  denied  {
read } for  pid=3D108 comm=3D"auditd" name=3D"audit" dev=3D"vda" ino=3D1638=
7
scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabele=
d_t
tclass=3Ddir permissive=3D1 trawcon=3D"Default"
[   10.579085] audit: type=3D1400 audit(1632913977.146:5): avc:  denied  {
open } for  pid=3D108 comm=3D"auditd" path=3D"/var/log/audit" dev=3D"vda" i=
no=3D16387
scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabele=
d_t
tclass=3Ddir permissive=3D1 trawcon=3D"Def"
[   10.594226] audit: type=3D1400 audit(1632913977.146:6): avc:  denied  {
getattr } for  pid=3D108 comm=3D"auditd" path=3D"/var/log/audit" dev=3D"vda=
"
ino=3D16387 scontext=3Dsystem_u:system_r:auditd_t
tcontext=3Dsystem_u:object_r:unlabeled_t tclass=3Ddir permissive=3D1 trawco=
n=3D""
[   10.610371] audit: type=3D1400 audit(1632913977.146:7): avc:  denied  {
search } for  pid=3D108 comm=3D"auditd" name=3D"audit" dev=3D"vda" ino=3D16=
387
scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabele=
d_t
tclass=3Ddir permissive=3D1 trawcon=3D"Default"
[   10.629470] audit: type=3D1400 audit(1632913977.197:8): avc:  denied  {
setattr } for  pid=3D109 comm=3D"auditd" name=3D"audit" dev=3D"vda" ino=3D1=
6387
scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabele=
d_t
tclass=3Ddir permissive=3D1 trawcon=3D"Default"
[   10.646993] audit: type=3D1400 audit(1632913977.214:9): avc:  denied  {
write } for  pid=3D109 comm=3D"auditd" name=3D"audit" dev=3D"vda" ino=3D163=
87
scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabele=
d_t
tclass=3Ddir permissive=3D1 trawcon=3D"Default"
[   10.662781] audit: type=3D1400 audit(1632913977.214:10): avc:  denied  {
add_name } for  pid=3D109 comm=3D"auditd" name=3D"audit.log"
scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabele=
d_t
tclass=3Ddir permissive=3D1 trawcon=3D"Default"
[   10.677266] audit: type=3D1400 audit(1632913977.214:11): avc:  denied  {
create } for  pid=3D109 comm=3D"auditd" name=3D"audit.log"
scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabele=
d_t
tclass=3Dfile permissive=3D1

These makes me think adding some via to

handle the autorelabel mechanism is still needed.

Best regards.

Jos=C3=A9.


On Tue, Sep 7, 2021 at 3:58 PM Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie=
.com>
wrote:

> This patch adds a system service to check whether the
> autorelabel via is requested or not, and produce the
> labeling of the system under the loaded final kernel,
> including automatically populated fs by the kernel.
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> ---
>  .../policycoreutils/S00selinux-autorelabel    | 49 +++++++++++++++++++
>  package/policycoreutils/policycoreutils.mk    |  5 ++
>  2 files changed, 54 insertions(+)
>  create mode 100644 package/policycoreutils/S00selinux-autorelabel
>
> diff --git a/package/policycoreutils/S00selinux-autorelabel
> b/package/policycoreutils/S00selinux-autorelabel
> new file mode 100644
> index 0000000000..7a47db891f
> --- /dev/null
> +++ b/package/policycoreutils/S00selinux-autorelabel
> @@ -0,0 +1,49 @@
> +#!/bin/sh
> +
> +DAEMON=3D"Autorelabel check"
> +
> +start() {
> +    printf 'Starting %s: ' "$DAEMON"
> +
> +    if [ -f /.autorelabel ]; then
> +        echo "Relabeling"
> +        echo "*** Warning -- SELinux ${SELINUXTYPE} policy relabel is
> required."
> +        echo "*** Relabeling could take a very long time, depending on
> file"
> +        echo "*** system size and speed of hard drives."
> +        mount -a
> +        setfiles -m -r /
> +
> +        # Remove label
> +        rm -f  /.autorelabel || failed "Failed to remove the autorelabel
> flag"
> +
> +        # Reboot to activate relabeled file system
> +        echo "Automatic reboot in progress."
> +        reboot -f
> +    fi
> +
> +    echo "OK"
> +    return 0
> +}
> +
> +stop() {
> +    printf 'Stopping %s: ' "$DAEMON"
> +    echo "OK"
> +    return 0
> +}
> +
> +restart() {
> +       stop
> +       sleep 1
> +       start
> +}
> +
> +case "$1" in
> +       start|stop|restart)
> +               "$1";;
> +       reload)
> +               # Restart, since there is no true "reload" feature.
> +               restart;;
> +       *)
> +               echo "Usage: $0 {start|stop|restart|reload}"
> +               exit 1
> +esac
> diff --git a/package/policycoreutils/policycoreutils.mk
> b/package/policycoreutils/policycoreutils.mk
> index 5290c5b9f8..f698698059 100644
> --- a/package/policycoreutils/policycoreutils.mk
> +++ b/package/policycoreutils/policycoreutils.mk
> @@ -93,5 +93,10 @@ define HOST_POLICYCOREUTILS_INSTALL_CMDS
>         )
>  endef
>
> +define POLICYCOREUTILS_INSTALL_INIT_SYSV
> +       $(INSTALL) -m 0755 -D
> package/policycoreutils/S00selinux-autorelabel \
> +               $(TARGET_DIR)/etc/init.d/S00selinux-autorelabel
> +endef
> +
>  $(eval $(generic-package))
>  $(eval $(host-generic-package))
> --
> 2.25.1
>
>

--=20

Jos=C3=A9.

--000000000000113f4905cd20c251
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><blockquote style=3D"margin:0 0 0 40px;border:non=
e;padding:0px"><div>Hi,</div><div><br></div></blockquote><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Can I get some comments=
 here? I&#39;m starting</div></blockquote>to do some tests with 2021.08 and=
 I find unlabeled</div><div>stuff like the following ones:</div><div><br></=
div>[ =C2=A0 10.534555] SELinux: =C2=A0Context Default is not valid (left u=
nmapped).<br>[ =C2=A0 10.562318] audit: type=3D1400 audit(1632913977.130:4)=
: avc: =C2=A0denied =C2=A0{ read } for =C2=A0pid=3D108 comm=3D&quot;auditd&=
quot; name=3D&quot;audit&quot; dev=3D&quot;vda&quot; ino=3D16387 scontext=
=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabeled_t tcla=
ss=3Ddir permissive=3D1 trawcon=3D&quot;Default&quot;<br>[ =C2=A0 10.579085=
] audit: type=3D1400 audit(1632913977.146:5): avc: =C2=A0denied =C2=A0{ ope=
n } for =C2=A0pid=3D108 comm=3D&quot;auditd&quot; path=3D&quot;/var/log/aud=
it&quot; dev=3D&quot;vda&quot; ino=3D16387 scontext=3Dsystem_u:system_r:aud=
itd_t tcontext=3Dsystem_u:object_r:unlabeled_t tclass=3Ddir permissive=3D1 =
trawcon=3D&quot;Def&quot;<br>[ =C2=A0 10.594226] audit: type=3D1400 audit(1=
632913977.146:6): avc: =C2=A0denied =C2=A0{ getattr } for =C2=A0pid=3D108 c=
omm=3D&quot;auditd&quot; path=3D&quot;/var/log/audit&quot; dev=3D&quot;vda&=
quot; ino=3D16387 scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u=
:object_r:unlabeled_t tclass=3Ddir permissive=3D1 trawcon=3D&quot;&quot;<br=
>[ =C2=A0 10.610371] audit: type=3D1400 audit(1632913977.146:7): avc: =C2=
=A0denied =C2=A0{ search } for =C2=A0pid=3D108 comm=3D&quot;auditd&quot; na=
me=3D&quot;audit&quot; dev=3D&quot;vda&quot; ino=3D16387 scontext=3Dsystem_=
u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabeled_t tclass=3Ddir p=
ermissive=3D1 trawcon=3D&quot;Default&quot;<br>[ =C2=A0 10.629470] audit: t=
ype=3D1400 audit(1632913977.197:8): avc: =C2=A0denied =C2=A0{ setattr } for=
 =C2=A0pid=3D109 comm=3D&quot;auditd&quot; name=3D&quot;audit&quot; dev=3D&=
quot;vda&quot; ino=3D16387 scontext=3Dsystem_u:system_r:auditd_t tcontext=
=3Dsystem_u:object_r:unlabeled_t tclass=3Ddir permissive=3D1 trawcon=3D&quo=
t;Default&quot;<br>[ =C2=A0 10.646993] audit: type=3D1400 audit(1632913977.=
214:9): avc: =C2=A0denied =C2=A0{ write } for =C2=A0pid=3D109 comm=3D&quot;=
auditd&quot; name=3D&quot;audit&quot; dev=3D&quot;vda&quot; ino=3D16387 sco=
ntext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:object_r:unlabeled_t=
 tclass=3Ddir permissive=3D1 trawcon=3D&quot;Default&quot;<br>[ =C2=A0 10.6=
62781] audit: type=3D1400 audit(1632913977.214:10): avc: =C2=A0denied =C2=
=A0{ add_name } for =C2=A0pid=3D109 comm=3D&quot;auditd&quot; name=3D&quot;=
audit.log&quot; scontext=3Dsystem_u:system_r:auditd_t tcontext=3Dsystem_u:o=
bject_r:unlabeled_t tclass=3Ddir permissive=3D1 trawcon=3D&quot;Default&quo=
t;<br>[ =C2=A0 10.677266] audit: type=3D1400 audit(1632913977.214:11): avc:=
 =C2=A0denied =C2=A0{ create } for =C2=A0pid=3D109 comm=3D&quot;auditd&quot=
; name=3D&quot;audit.log&quot; scontext=3Dsystem_u:system_r:auditd_t tconte=
xt=3Dsystem_u:object_r:unlabeled_t tclass=3Dfile permissive=3D1<div><br></d=
iv><div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"><di=
v>These makes me think adding some via to</div></blockquote>handle the auto=
relabel mechanism is still needed.</div><div><br></div><div><blockquote sty=
le=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Best regards.</div><d=
iv><br></div></blockquote><blockquote style=3D"margin:0 0 0 40px;border:non=
e;padding:0px"><div>Jos=C3=A9.</div></blockquote></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 7, 2021 =
at 3:58 PM Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@uniki=
e.com">jose.pekkarinen@unikie.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">This patch adds a system service to check =
whether the<br>
autorelabel via is requested or not, and produce the<br>
labeling of the system under the loaded final kernel,<br>
including automatically populated fs by the kernel.<br>
<br>
Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@u=
nikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
---<br>
=C2=A0.../policycoreutils/S00selinux-autorelabel=C2=A0 =C2=A0 | 49 ++++++++=
+++++++++++<br>
=C2=A0package/policycoreutils/<a href=3D"http://policycoreutils.mk" rel=3D"=
noreferrer" target=3D"_blank">policycoreutils.mk</a>=C2=A0 =C2=A0 |=C2=A0 5=
 ++<br>
=C2=A02 files changed, 54 insertions(+)<br>
=C2=A0create mode 100644 package/policycoreutils/S00selinux-autorelabel<br>
<br>
diff --git a/package/policycoreutils/S00selinux-autorelabel b/package/polic=
ycoreutils/S00selinux-autorelabel<br>
new file mode 100644<br>
index 0000000000..7a47db891f<br>
--- /dev/null<br>
+++ b/package/policycoreutils/S00selinux-autorelabel<br>
@@ -0,0 +1,49 @@<br>
+#!/bin/sh<br>
+<br>
+DAEMON=3D&quot;Autorelabel check&quot;<br>
+<br>
+start() {<br>
+=C2=A0 =C2=A0 printf &#39;Starting %s: &#39; &quot;$DAEMON&quot;<br>
+<br>
+=C2=A0 =C2=A0 if [ -f /.autorelabel ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Relabeling&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** Warning -- SELinux ${SELINUXTYP=
E} policy relabel is required.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** Relabeling could take a very lo=
ng time, depending on file&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;*** system size and speed of hard d=
rives.&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 mount -a<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 setfiles -m -r /<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Remove label<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f=C2=A0 /.autorelabel || failed &quot;Fail=
ed to remove the autorelabel flag&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Reboot to activate relabeled file system<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Automatic reboot in progress.&quot;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 reboot -f<br>
+=C2=A0 =C2=A0 fi<br>
+<br>
+=C2=A0 =C2=A0 echo &quot;OK&quot;<br>
+=C2=A0 =C2=A0 return 0<br>
+}<br>
+<br>
+stop() {<br>
+=C2=A0 =C2=A0 printf &#39;Stopping %s: &#39; &quot;$DAEMON&quot;<br>
+=C2=A0 =C2=A0 echo &quot;OK&quot;<br>
+=C2=A0 =C2=A0 return 0<br>
+}<br>
+<br>
+restart() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stop<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sleep 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start<br>
+}<br>
+<br>
+case &quot;$1&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start|stop|restart)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$1&quot;;;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0reload)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restart, since th=
ere is no true &quot;reload&quot; feature.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0*)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Usage: $=
0 {start|stop|restart|reload}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
+esac<br>
diff --git a/package/policycoreutils/<a href=3D"http://policycoreutils.mk" =
rel=3D"noreferrer" target=3D"_blank">policycoreutils.mk</a> b/package/polic=
ycoreutils/<a href=3D"http://policycoreutils.mk" rel=3D"noreferrer" target=
=3D"_blank">policycoreutils.mk</a><br>
index 5290c5b9f8..f698698059 100644<br>
--- a/package/policycoreutils/<a href=3D"http://policycoreutils.mk" rel=3D"=
noreferrer" target=3D"_blank">policycoreutils.mk</a><br>
+++ b/package/policycoreutils/<a href=3D"http://policycoreutils.mk" rel=3D"=
noreferrer" target=3D"_blank">policycoreutils.mk</a><br>
@@ -93,5 +93,10 @@ define HOST_POLICYCOREUTILS_INSTALL_CMDS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br>
=C2=A0endef<br>
<br>
+define POLICYCOREUTILS_INSTALL_INIT_SYSV<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D package/policycoreutils/S=
00selinux-autorelabel \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/i=
nit.d/S00selinux-autorelabel<br>
+endef<br>
+<br>
=C2=A0$(eval $(generic-package))<br>
=C2=A0$(eval $(host-generic-package))<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div>

--000000000000113f4905cd20c251--

--===============8109033389265613310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8109033389265613310==--
