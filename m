Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56D3EC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 12:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C06A560F25
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 12:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C06A560F25
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 775084011C;
	Fri, 20 Aug 2021 12:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vgLdvfmFTKtl; Fri, 20 Aug 2021 12:09:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A49E3401B4;
	Fri, 20 Aug 2021 12:09:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EAAC81BF35D
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 12:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5DFB4011C
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 12:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ui1YStkzetMS for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 12:09:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 912AB40107
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 12:09:14 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id s3so1434891edd.11
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q2ylXh67hnSOafY44HRVhyIRIOGKBOB1Eoswu13Y4Cw=;
 b=XjOvdN6W0mvDRuqRw9gPQOqC14sfzjwhOYK2uG4VHqzsSWxMaH7YXOY4RSyBBbLxZb
 xUT641mMerRAec7san4rB2MSfLsLNkub/Bv+8NZXUagtO2ntbr9lm2vtchyqlQ61pyii
 wYI2YRKDn2wY2BsAe4kPdI2Z6lQFYFKZZ8o7Sz2C8C2RvrZs8zGNATT8+GGCY8YisAH/
 gRvqOkuB6wwkJBBj5j1rUMofLxHUlCG0Rd93oeFOUK81dz3MwesEl2cfIw5fO9/K53xI
 mhB/bh5wWZ1G8cDysvv80fi0l4BJoxkgzc4S7JY8b9/lH00/xNG9H7quwQwrKmLEQ/uh
 ZRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q2ylXh67hnSOafY44HRVhyIRIOGKBOB1Eoswu13Y4Cw=;
 b=dCCYq68Zowyp9fR9wDCi0oiGHyxRvdL2mOmmxEYfwIBZVh6WIQi3oJQq2hKP5ph0cQ
 uh62YkbAk7xPuJtNojtHrMOzRb3SnoEshaZ5wG8NeTxjRJOdZFhF0ZgH4VgzUEAXW7gm
 WjJqmhO7LoPDWrCjkvTes5H+N9vYHx3y1FvFKL8+5kkNo+6qLb1y2R4kSTKiBZRF8Gj4
 oDr5AVu2Y4SIAh2JUSjrSAydYTsK5WU4TfTsNVfRmbM4xMJ7qDX8RYzmcSAw+cFVX3ij
 6xzyoANGzEvCUk55TUS4kEGKcgHQYQhJ8/DJLaRdX0ZbEL/NgXxXPoIiIFSlu8EDOfNr
 6NLg==
X-Gm-Message-State: AOAM5336VQXz5oblx3MYHV+ayXWBYN23rhOrjWvP7jlVwPRv+BzuDZQ9
 PncxBEsG32ngGzlkXRpPzzmHq6Rk3kQsO/1gE7X1zgu0RUyB+g==
X-Google-Smtp-Source: ABdhPJxAgssXIQ78fLGMbBbJRaP9GCTa31gOM8R3jrrI3lZYUtQrBLfb43Ckks9lTXaHOlgpV1rsoMkGdIan8v/pS6A=
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr22401650edt.194.1629461352799; 
 Fri, 20 Aug 2021 05:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210809055557.8698-1-jose.pekkarinen@unikie.com>
 <20210819232156.688fdc7d@windsurf>
In-Reply-To: <20210819232156.688fdc7d@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Fri, 20 Aug 2021 15:09:01 +0300
Message-ID: <CAJPV9MqLKCFuYvtfaxs=rOwDWWFWXHiK+ECYSfqQYOuUpHF5hg@mail.gmail.com>
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3163029285488983484=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============3163029285488983484==
Content-Type: multipart/alternative; boundary="0000000000001c100305c9fc8949"

--0000000000001c100305c9fc8949
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 20, 2021 at 12:21 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Jos=C3=A9,
>
> On Mon,  9 Aug 2021 08:55:57 +0300
> Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com> wrote:
>
> > The current restorecond upstream init script is no
> > good fit for the user space generated by buildroot,
> > this script is an extension of the original, that
> > brings some changes from the debian init script to
> > use start-stop-daemon instead of daemon, while
> > removing dependencies on /etc/rc.d/init.d/functions
> > and /lib/lsb/init-functions.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>
> Thanks a lot, but unfortunately your proposed script still doesn't
> follow the model/template of package/busybox/S01syslogd. Could you try
> to follow the template as closely as possible ?
>
> > diff --git a/package/restorecond/S02restorecond
> b/package/restorecond/S02restorecond
> > new file mode 100644
> > index 0000000000..24ee30853f
> > --- /dev/null
> > +++ b/package/restorecond/S02restorecond
> > @@ -0,0 +1,113 @@
> > +#!/bin/sh
> > +#
> > +# restorecond:               Daemon used to maintain path file context
> > +#
> > +# chkconfig: - 12 87
> > +# description:       restorecond uses inotify to look for creation of
> new files \
> > +# listed in the /etc/selinux/restorecond.conf file, and restores the \
> > +# correct security context.
> > +#
> > +# processname: /usr/sbin/restorecond
> > +# config: /etc/selinux/restorecond.conf
> > +# pidfile: /run/restorecond.pid
> > +#
> > +# Return values according to LSB for all commands but status:
> > +# 0 - success
> > +# 1 - generic or unspecified error
> > +# 2 - invalid or excess argument(s)
> > +# 3 - unimplemented feature (e.g. "reload")
> > +# 4 - insufficient privilege
> > +# 5 - program is not installed
> > +# 6 - program is not configured
> > +# 7 - program is not running
>
> We don't care about all those comments.
>
> > +PATH=3D/sbin:/bin:/usr/bin:/usr/sbin
> > +DESC=3D"SELinux file context maintaining daemon"
>
> These variables are not needed.
>
> > +NAME=3Drestorecond
> > +DAEMON=3D/usr/sbin/$NAME
> > +DAEMON_ARGS=3D""
> > +PIDFILE=3D/var/run/$NAME.pid
> > +LOCKFILE=3D/var/run/$NAME.pid
> > +SCRIPTNAME=3D/etc/init.d/$NAME
> > +
> > +[ -x /usr/sbin/selinuxenabled ] && /usr/sbin/selinuxenabled || exit 7
>
> We don't care about this either.
>
> > +# Check that we are root ... so non-root users stop here
> > +test $EUID =3D 0  || exit 4
>
> Same.
>
> > +test -x /usr/sbin/restorecond  || exit 5
> > +test -f /etc/selinux/restorecond.conf  || exit 6
>
> Same.
>
> > +
> > +RETVAL=3D0
> > +
> > +start()
> > +{
> > +     # Return
> > +     #   0 if daemon has been started
> > +     #   1 if daemon was already running
> > +     #   2 if daemon could not be started
> > +     start-stop-daemon --start --quiet --pidfile $PIDFILE --exec
> $DAEMON --test > /dev/null \
> > +             || return 1
>
> Don't test.
>
> > +     start-stop-daemon --start --quiet --pidfile $PIDFILE --exec
> $DAEMON -- \
> > +             $DAEMON_ARGS \
> > +             || return 2
>
> Please see S01syslogd on how to do this.
>
> > +stop()
> > +{
> > +     # Return
> > +     #   0 if daemon has been stopped
> > +     #   1 if daemon was already stopped
> > +     #   2 if daemon could not be stopped
> > +     #   other if a failure occurred
> > +     start-stop-daemon --stop --quiet --retry=3DTERM/30/KILL/5 --pidfi=
le
> $PIDFILE --name $NAME
> > +     RETVAL=3D"$?"
> > +     [ "$RETVAL" =3D 2 ] && return 2
> > +
> > +     rm -f $PIDFILE
> > +     rm -f $LOCKFILE
> > +     return "$RETVAL"
>
> Please do like S01syslogd.
>
> Thanks a lot!
>

Thanks for the comments! A new version is now

ready for consumption for when somebody have some
time to check it.

Best regards.

Jos=C3=A9.

--0000000000001c100305c9fc8949
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 20, 2021 at 12:21 AM Thom=
as Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.pet=
azzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hello Jos=C3=A9,<br>
<br>
On Mon,=C2=A0 9 Aug 2021 08:55:57 +0300<br>
Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkarinen@unikie.com" targ=
et=3D"_blank">jose.pekkarinen@unikie.com</a>&gt; wrote:<br>
<br>
&gt; The current restorecond upstream init script is no<br>
&gt; good fit for the user space generated by buildroot,<br>
&gt; this script is an extension of the original, that<br>
&gt; brings some changes from the debian init script to<br>
&gt; use start-stop-daemon instead of daemon, while<br>
&gt; removing dependencies on /etc/rc.d/init.d/functions<br>
&gt; and /lib/lsb/init-functions.<br>
&gt; <br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
<br>
Thanks a lot, but unfortunately your proposed script still doesn&#39;t<br>
follow the model/template of package/busybox/S01syslogd. Could you try<br>
to follow the template as closely as possible ?<br>
<br>
&gt; diff --git a/package/restorecond/S02restorecond b/package/restorecond/=
S02restorecond<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..24ee30853f<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/restorecond/S02restorecond<br>
&gt; @@ -0,0 +1,113 @@<br>
&gt; +#!/bin/sh<br>
&gt; +#<br>
&gt; +# restorecond:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
Daemon used to maintain path file context<br>
&gt; +#<br>
&gt; +# chkconfig: - 12 87<br>
&gt; +# description:=C2=A0 =C2=A0 =C2=A0 =C2=A0restorecond uses inotify to =
look for creation of new files \<br>
&gt; +# listed in the /etc/selinux/restorecond.conf file, and restores the =
\<br>
&gt; +# correct security context.<br>
&gt; +#<br>
&gt; +# processname: /usr/sbin/restorecond<br>
&gt; +# config: /etc/selinux/restorecond.conf<br>
&gt; +# pidfile: /run/restorecond.pid<br>
&gt; +#<br>
&gt; +# Return values according to LSB for all commands but status:<br>
&gt; +# 0 - success<br>
&gt; +# 1 - generic or unspecified error<br>
&gt; +# 2 - invalid or excess argument(s)<br>
&gt; +# 3 - unimplemented feature (e.g. &quot;reload&quot;)<br>
&gt; +# 4 - insufficient privilege<br>
&gt; +# 5 - program is not installed<br>
&gt; +# 6 - program is not configured<br>
&gt; +# 7 - program is not running<br>
<br>
We don&#39;t care about all those comments.<br>
<br>
&gt; +PATH=3D/sbin:/bin:/usr/bin:/usr/sbin<br>
&gt; +DESC=3D&quot;SELinux file context maintaining daemon&quot;<br>
<br>
These variables are not needed.<br>
<br>
&gt; +NAME=3Drestorecond<br>
&gt; +DAEMON=3D/usr/sbin/$NAME<br>
&gt; +DAEMON_ARGS=3D&quot;&quot;<br>
&gt; +PIDFILE=3D/var/run/$NAME.pid<br>
&gt; +LOCKFILE=3D/var/run/$NAME.pid<br>
&gt; +SCRIPTNAME=3D/etc/init.d/$NAME<br>
&gt; +<br>
&gt; +[ -x /usr/sbin/selinuxenabled ] &amp;&amp; /usr/sbin/selinuxenabled |=
| exit 7<br>
<br>
We don&#39;t care about this either.<br>
<br>
&gt; +# Check that we are root ... so non-root users stop here<br>
&gt; +test $EUID =3D 0=C2=A0 || exit 4<br>
<br>
Same.<br>
<br>
&gt; +test -x /usr/sbin/restorecond=C2=A0 || exit 5<br>
&gt; +test -f /etc/selinux/restorecond.conf=C2=A0 || exit 6<br>
<br>
Same.<br>
<br>
&gt; +<br>
&gt; +RETVAL=3D0<br>
&gt; +<br>
&gt; +start()<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A00 if daemon has been started<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A01 if daemon was already running<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A02 if daemon could not be started<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon --start --quiet --pidfile $PIDF=
ILE --exec $DAEMON --test &gt; /dev/null \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| return 1<br>
<br>
Don&#39;t test.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon --start --quiet --pidfile $PIDF=
ILE --exec $DAEMON -- \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$DAEMON_ARGS \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|| return 2<br>
<br>
Please see S01syslogd on how to do this.<br>
<br>
&gt; +stop()<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Return<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A00 if daemon has been stopped<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A01 if daemon was already stopped<br>
&gt; +=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A02 if daemon could not be stopped<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0other if a failure occurred<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start-stop-daemon --stop --quiet --retry=3DTERM/3=
0/KILL/5 --pidfile $PIDFILE --name $NAME<br>
&gt; +=C2=A0 =C2=A0 =C2=A0RETVAL=3D&quot;$?&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0[ &quot;$RETVAL&quot; =3D 2 ] &amp;&amp; return 2=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -f $PIDFILE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm -f $LOCKFILE<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$RETVAL&quot;<br>
<br>
Please do like S01syslogd.<br>
<br>
Thanks a lot!<br></blockquote><div><br></div></div><blockquote style=3D"mar=
gin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>Tha=
nks for the comments! A new version is now</div></div></blockquote>ready fo=
r consumption for when somebody have some<div>time to check it.=C2=A0<br><d=
iv><br></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px=
"><div>Best regards.</div><div><br></div></blockquote><div dir=3D"ltr" clas=
s=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px =
0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div></div>=
</div>

--0000000000001c100305c9fc8949--

--===============3163029285488983484==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============3163029285488983484==--
