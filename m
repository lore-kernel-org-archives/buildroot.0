Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C953C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:12:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E6260F22
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 16E6260F22
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1EBA6081F;
	Tue, 17 Aug 2021 08:12:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wsSRps1oxvhy; Tue, 17 Aug 2021 08:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF5CC60802;
	Tue, 17 Aug 2021 08:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 03CDA1BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E34A283753
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:12:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0GPW0FHB_h0 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:12:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C07A80FF9
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 08:12:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id bq25so26908987ejb.11
 for <buildroot@busybox.net>; Tue, 17 Aug 2021 01:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJXrmDAnvqIoP+K3RL8gt+Mf3QWRQv0CQrwibXwonKE=;
 b=ORs1/tADKVNDoiGxbXlaZv7WSmKnnNOgW7efKl1s08Qvb3fCfcJGdzyRFm1Q3FCBvM
 QFw23tyrk9usbbQwgl8O5sCLgEklsAHTGn7QwvlS9afRLRYW0Eg9m9z6V/EGpRNQyWuA
 NDfbFVGh0pC9VSsI/AbSfQ40Ngs+RB9Zm+72MhiLjy6n4GY/NNm9c3bqyVjoG5yxgr0J
 g8XYwxw6bjbA78xWZt4jwIidpGf032welVTh4u0md4zcR7rReft1B3N6autcqs+Oc5uo
 +TJCkmqnQqF3ZTPEatMSnBfEtQ9gMbXZCZ942a4/GmcCJwEux3Ytskn2tXvwuADDGTeB
 hVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJXrmDAnvqIoP+K3RL8gt+Mf3QWRQv0CQrwibXwonKE=;
 b=UN5DHTMHMP+c4HjskaIw6muQwtOQzlh84/s5TRzVYZb/WUhPDFtKr4lW3XFmNZh0sB
 xNyYEtH5Nu7GxlRqDCZQRvUPviX/0IjpXpRUhOPZPlsPQzCol+fzO+yifdUeXK/di+M7
 qNidALimMK1mvqgXFsbZGp82O2ZVkLdNI1sWtnbEKHwK55rknKjTDG1du0cI/kVlTi0L
 o+z/IZSyeWMG4CGRfq5UbnoSQ9q6ODwfcQPpRUWmMr9e1G6NGtIxzMvguvDvotqN/qGJ
 0/ojHsz8r5SkQP9QlQo7aFLUgy9hk9IIeJj5hfhOeIDj6AzfmRBTWm21O87HXJjhe7Ap
 OroQ==
X-Gm-Message-State: AOAM531V6Tz14clJYStMYOGOA5dcafWrH920+KFy0wrgVYscSknmD0Tw
 +VRXzuJRmJNLYWcjHxq5fZhLOg0YqSkhFduEho1m2w==
X-Google-Smtp-Source: ABdhPJzzwxqMO6gHaH1ukswhYSODdYKIowCPxSlh72jXOvdc1o+jrZk1tGtBOwugqxw5li6a4CwVDPbG7KkvXaOYGBw=
X-Received: by 2002:a17:906:cd02:: with SMTP id
 oz2mr2644343ejb.227.1629187921099; 
 Tue, 17 Aug 2021 01:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210727120711.4160529-1-jose.pekkarinen@unikie.com>
In-Reply-To: <20210727120711.4160529-1-jose.pekkarinen@unikie.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 17 Aug 2021 11:11:49 +0300
Message-ID: <CAJPV9MrGyFL9C5jpUz5oL=cYRWnXnmoWNwHhJSWQK3tN79a6_g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/restorecond: Add new init script
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
Cc: buildroot@busybox.net
Content-Type: multipart/mixed; boundary="===============9121063996716675496=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============9121063996716675496==
Content-Type: multipart/alternative; boundary="0000000000004f552105c9bcdf5e"

--0000000000004f552105c9bcdf5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Would you mind to take a look here or forward

it to the relevant people? The get_developers script
doesn't give much of a clue.

Thanks!

Jos=C3=A9 Pekkarinen.


On Tue, Jul 27, 2021 at 3:07 PM Jos=C3=A9 Pekkarinen <jose.pekkarinen@uniki=
e.com>
wrote:

> The current restorecond upstream init script is no
> good fit for the user space generated by buildroot,
> this script is an extension of the original, that
> brings some changes from the debian init script to
> use start-stop-daemon instead of daemon, while
> removing dependencies on /etc/rc.d/init.d/functions
> and /lib/lsb/init-functions.
>
> Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> ---
>  package/restorecond/S02restorecond | 113 +++++++++++++++++++++++++++++
>  package/restorecond/restorecond.mk |   4 +-
>  2 files changed, 115 insertions(+), 2 deletions(-)
>  create mode 100644 package/restorecond/S02restorecond
>
> diff --git a/package/restorecond/S02restorecond
> b/package/restorecond/S02restorecond
> new file mode 100644
> index 0000000000..24ee30853f
> --- /dev/null
> +++ b/package/restorecond/S02restorecond
> @@ -0,0 +1,113 @@
> +#!/bin/sh
> +#
> +# restorecond:         Daemon used to maintain path file context
> +#
> +# chkconfig:   - 12 87
> +# description: restorecond uses inotify to look for creation of new file=
s
> \
> +# listed in the /etc/selinux/restorecond.conf file, and restores the \
> +# correct security context.
> +#
> +# processname: /usr/sbin/restorecond
> +# config: /etc/selinux/restorecond.conf
> +# pidfile: /run/restorecond.pid
> +#
> +# Return values according to LSB for all commands but status:
> +# 0 - success
> +# 1 - generic or unspecified error
> +# 2 - invalid or excess argument(s)
> +# 3 - unimplemented feature (e.g. "reload")
> +# 4 - insufficient privilege
> +# 5 - program is not installed
> +# 6 - program is not configured
> +# 7 - program is not running
> +
> +PATH=3D/sbin:/bin:/usr/bin:/usr/sbin
> +DESC=3D"SELinux file context maintaining daemon"
> +NAME=3Drestorecond
> +DAEMON=3D/usr/sbin/$NAME
> +DAEMON_ARGS=3D""
> +PIDFILE=3D/var/run/$NAME.pid
> +LOCKFILE=3D/var/run/$NAME.pid
> +SCRIPTNAME=3D/etc/init.d/$NAME
> +
> +[ -x /usr/sbin/selinuxenabled ] && /usr/sbin/selinuxenabled || exit 7
> +
> +# Check that we are root ... so non-root users stop here
> +test $EUID =3D 0  || exit 4
> +
> +test -x /usr/sbin/restorecond  || exit 5
> +test -f /etc/selinux/restorecond.conf  || exit 6
> +
> +RETVAL=3D0
> +
> +start()
> +{
> +       # Return
> +       #   0 if daemon has been started
> +       #   1 if daemon was already running
> +       #   2 if daemon could not be started
> +       start-stop-daemon --start --quiet --pidfile $PIDFILE --exec
> $DAEMON --test > /dev/null \
> +               || return 1
> +       start-stop-daemon --start --quiet --pidfile $PIDFILE --exec
> $DAEMON -- \
> +               $DAEMON_ARGS \
> +               || return 2
> +       touch $LOCKFILE
> +       return "$RETVAL"
> +}
> +
> +stop()
> +{
> +       # Return
> +       #   0 if daemon has been stopped
> +       #   1 if daemon was already stopped
> +       #   2 if daemon could not be stopped
> +       #   other if a failure occurred
> +       start-stop-daemon --stop --quiet --retry=3DTERM/30/KILL/5 --pidfi=
le
> $PIDFILE --name $NAME
> +       RETVAL=3D"$?"
> +       [ "$RETVAL" =3D 2 ] && return 2
> +
> +       rm -f $PIDFILE
> +       rm -f $LOCKFILE
> +       return "$RETVAL"
> +}
> +
> +restart()
> +{
> +    stop
> +    start
> +}
> +
> +# See how we were called.
> +case "$1" in
> +  start)
> +       echo -n $"Starting restorecond: "
> +       start
> +    case "$?" in
> +        0|1) echo "Ok!" ;;
> +        2) echo "Failed" ;;
> +    esac
> +       ;;
> +  stop)
> +       echo -n $"Shutting down restorecond: "
> +       stop
> +    case "$?" in
> +        0|1) echo "Ok!" ;;
> +        2) echo "Failed" ;;
> +    esac
> +       ;;
> +  status)
> +       status restorecond
> +       RETVAL=3D$?
> +       ;;
> +  force-reload|restart|reload)
> +       restart
> +       ;;
> +  condrestart)
> +       [ -e /var/lock/subsys/restorecond ] && restart || :
> +       ;;
> +  *)
> +        echo $"Usage: $0
> {start|stop|restart|force-reload|status|condrestart}"
> +        RETVAL=3D3
> +esac
> +
> +exit $RETVAL
> diff --git a/package/restorecond/restorecond.mk b/package/restorecond/
> restorecond.mk
> index 7ab7e978dd..3c6fb57ea6 100644
> --- a/package/restorecond/restorecond.mk
> +++ b/package/restorecond/restorecond.mk
> @@ -27,8 +27,8 @@ define RESTORECOND_BUILD_CMDS
>  endef
>
>  define RESTORECOND_INSTALL_INIT_SYSV
> -       $(INSTALL) -m 0755 -D $(@D)/restorecond.init \
> -               $(TARGET_DIR)/etc/init.d/S20restorecond
> +       $(INSTALL) -m 0755 -D package/restorecond/S02restorecond \
> +               $(TARGET_DIR)/etc/init.d/S02restorecond
>  endef
>
>  define RESTORECOND_INSTALL_INIT_SYSTEMD
> --
> 2.25.1
>
>

--=20

Jos=C3=A9.

--0000000000004f552105c9bcdf5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div><blockquote style=3D"margin:0 0 0 40px;border:non=
e;padding:0px"><div>Hi,</div><div><br></div></blockquote><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div>Would you mind to take =
a look here or forward</div></blockquote>it to the relevant people? The get=
_developers script</div><div>doesn&#39;t give much of a clue.</div><div><br=
></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"=
><div>Thanks!</div><div><br></div></blockquote><blockquote style=3D"margin:=
0 0 0 40px;border:none;padding:0px"><div>Jos=C3=A9 Pekkarinen.</div></block=
quote></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Tue, Jul 27, 2021 at 3:07 PM Jos=C3=A9 Pekkarinen &lt;<a hre=
f=3D"mailto:jose.pekkarinen@unikie.com">jose.pekkarinen@unikie.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The curre=
nt restorecond upstream init script is no<br>
good fit for the user space generated by buildroot,<br>
this script is an extension of the original, that<br>
brings some changes from the debian init script to<br>
use start-stop-daemon instead of daemon, while<br>
removing dependencies on /etc/rc.d/init.d/functions<br>
and /lib/lsb/init-functions.<br>
<br>
Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@u=
nikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
---<br>
=C2=A0package/restorecond/S02restorecond | 113 ++++++++++++++++++++++++++++=
+<br>
=C2=A0package/restorecond/<a href=3D"http://restorecond.mk" rel=3D"noreferr=
er" target=3D"_blank">restorecond.mk</a> |=C2=A0 =C2=A04 +-<br>
=C2=A02 files changed, 115 insertions(+), 2 deletions(-)<br>
=C2=A0create mode 100644 package/restorecond/S02restorecond<br>
<br>
diff --git a/package/restorecond/S02restorecond b/package/restorecond/S02re=
storecond<br>
new file mode 100644<br>
index 0000000000..24ee30853f<br>
--- /dev/null<br>
+++ b/package/restorecond/S02restorecond<br>
@@ -0,0 +1,113 @@<br>
+#!/bin/sh<br>
+#<br>
+# restorecond:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Daemon used to maintain pa=
th file context<br>
+#<br>
+# chkconfig:=C2=A0 =C2=A0- 12 87<br>
+# description: restorecond uses inotify to look for creation of new files =
\<br>
+# listed in the /etc/selinux/restorecond.conf file, and restores the \<br>
+# correct security context.<br>
+#<br>
+# processname: /usr/sbin/restorecond<br>
+# config: /etc/selinux/restorecond.conf<br>
+# pidfile: /run/restorecond.pid<br>
+#<br>
+# Return values according to LSB for all commands but status:<br>
+# 0 - success<br>
+# 1 - generic or unspecified error<br>
+# 2 - invalid or excess argument(s)<br>
+# 3 - unimplemented feature (e.g. &quot;reload&quot;)<br>
+# 4 - insufficient privilege<br>
+# 5 - program is not installed<br>
+# 6 - program is not configured<br>
+# 7 - program is not running<br>
+<br>
+PATH=3D/sbin:/bin:/usr/bin:/usr/sbin<br>
+DESC=3D&quot;SELinux file context maintaining daemon&quot;<br>
+NAME=3Drestorecond<br>
+DAEMON=3D/usr/sbin/$NAME<br>
+DAEMON_ARGS=3D&quot;&quot;<br>
+PIDFILE=3D/var/run/$NAME.pid<br>
+LOCKFILE=3D/var/run/$NAME.pid<br>
+SCRIPTNAME=3D/etc/init.d/$NAME<br>
+<br>
+[ -x /usr/sbin/selinuxenabled ] &amp;&amp; /usr/sbin/selinuxenabled || exi=
t 7<br>
+<br>
+# Check that we are root ... so non-root users stop here<br>
+test $EUID =3D 0=C2=A0 || exit 4<br>
+<br>
+test -x /usr/sbin/restorecond=C2=A0 || exit 5<br>
+test -f /etc/selinux/restorecond.conf=C2=A0 || exit 6<br>
+<br>
+RETVAL=3D0<br>
+<br>
+start()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A00 if daemon has been started<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A01 if daemon was already running<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A02 if daemon could not be started<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon --start --quiet --pidfile $PI=
DFILE --exec $DAEMON --test &gt; /dev/null \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| return 1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon --start --quiet --pidfile $PI=
DFILE --exec $DAEMON -- \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$DAEMON_ARGS \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| return 2<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0touch $LOCKFILE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;$RETVAL&quot;<br>
+}<br>
+<br>
+stop()<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# Return<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A00 if daemon has been stopped<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A01 if daemon was already stopped<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A02 if daemon could not be stopped<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0other if a failure occurred<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start-stop-daemon --stop --quiet --retry=3DTERM=
/30/KILL/5 --pidfile $PIDFILE --name $NAME<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0RETVAL=3D&quot;$?&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ &quot;$RETVAL&quot; =3D 2 ] &amp;&amp; return=
 2<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $PIDFILE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $LOCKFILE<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return &quot;$RETVAL&quot;<br>
+}<br>
+<br>
+restart()<br>
+{<br>
+=C2=A0 =C2=A0 stop<br>
+=C2=A0 =C2=A0 start<br>
+}<br>
+<br>
+# See how we were called.<br>
+case &quot;$1&quot; in<br>
+=C2=A0 start)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n $&quot;Starting restorecond: &quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0start<br>
+=C2=A0 =C2=A0 case &quot;$?&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0|1) echo &quot;Ok!&quot; ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 2) echo &quot;Failed&quot; ;;<br>
+=C2=A0 =C2=A0 esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 stop)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0echo -n $&quot;Shutting down restorecond: &quot=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0stop<br>
+=C2=A0 =C2=A0 case &quot;$?&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 0|1) echo &quot;Ok!&quot; ;;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 2) echo &quot;Failed&quot; ;;<br>
+=C2=A0 =C2=A0 esac<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 status)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0status restorecond<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0RETVAL=3D$?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 force-reload|restart|reload)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0restart<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 condrestart)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -e /var/lock/subsys/restorecond ] &amp;&amp; =
restart || :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
+=C2=A0 *)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $&quot;Usage: $0 {start|stop|restart|forc=
e-reload|status|condrestart}&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 RETVAL=3D3<br>
+esac<br>
+<br>
+exit $RETVAL<br>
diff --git a/package/restorecond/<a href=3D"http://restorecond.mk" rel=3D"n=
oreferrer" target=3D"_blank">restorecond.mk</a> b/package/restorecond/<a hr=
ef=3D"http://restorecond.mk" rel=3D"noreferrer" target=3D"_blank">restoreco=
nd.mk</a><br>
index 7ab7e978dd..3c6fb57ea6 100644<br>
--- a/package/restorecond/<a href=3D"http://restorecond.mk" rel=3D"noreferr=
er" target=3D"_blank">restorecond.mk</a><br>
+++ b/package/restorecond/<a href=3D"http://restorecond.mk" rel=3D"noreferr=
er" target=3D"_blank">restorecond.mk</a><br>
@@ -27,8 +27,8 @@ define RESTORECOND_BUILD_CMDS<br>
=C2=A0endef<br>
<br>
=C2=A0define RESTORECOND_INSTALL_INIT_SYSV<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D $(@D)/restorecond.init \<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/i=
nit.d/S20restorecond<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D package/restorecond/S02re=
storecond \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/i=
nit.d/S02restorecond<br>
=C2=A0endef<br>
<br>
=C2=A0define RESTORECOND_INSTALL_INIT_SYSTEMD<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div>

--0000000000004f552105c9bcdf5e--

--===============9121063996716675496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============9121063996716675496==--
