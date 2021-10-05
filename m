Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14E9C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:28:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F418E61381
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 16:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F418E61381
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB89860B54;
	Tue,  5 Oct 2021 16:28:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QSnyWOEYLPM9; Tue,  5 Oct 2021 16:28:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E366660901;
	Tue,  5 Oct 2021 16:28:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 76B031BF2F2
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6330E60901
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 16:28:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O6KfruCAC58i for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 16:28:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A683606A7
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 16:28:06 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id dj4so1040723edb.5
 for <buildroot@buildroot.org>; Tue, 05 Oct 2021 09:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r1qBWlYYPWVIAZg5OM7yVDZuSbRhRGAE75mvbo5Tm5g=;
 b=NZuQNxVOu7fgkNyrBtuDIC9cwPZiPZTB3xAS8377ux0F47BAXs9bK41Eu8lUw03BPy
 2kyORDniRRUYL9NnbhL1U/JqP70iJKjgpcoBmdUkEsma4SmdFPe77DTEE5KiZuAe+ppW
 OeFUWwnEef91ddlMDZHNQRD8L/yFYBV1Urjjpa6kRmDEjNN9KxPChoDpoMJ8YMdg+mXV
 VjwHWzdYwqgsRAC568AO8efIAKoIrJnj63j801/ooL/WcsHTvAjdJp/z2ZoIOSO/2Y1s
 qPTNbeYKNjXeiqiFuZHESdxubOkCKcup+AV124UI8krCJUxjeQvIEtVv5pURlD+gHuOr
 Y46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r1qBWlYYPWVIAZg5OM7yVDZuSbRhRGAE75mvbo5Tm5g=;
 b=Xo5Xce9VkZRQZ+fCp6ZTFMp46DdwrUNOVfZHc7jnXU13AEjvkBtPcQESMLBzbM4l+2
 7bOilYgfV9vMdd4lDIRRWFysMGeD6KqUDrP+jIsnVGuD/gnUUUhUfxmccvdVUIMwPYEZ
 Q0FGUwNKKzSKvXTsd3Jdq+aMrYSoGp4fWJdpuqzW4WhhPPa6XTZYw6ELbrbGg1HaKOs7
 Hh7XaLtqVexeAYRnbBpRgGvcu8Dn5SKViRQBzN+2W/3/8vv85F6jN14Wfzu81OOjP8J9
 zpkHxxcqpCLYv8KQvLYkfEzCYnuZk7+esaPCyjy9/tORoxTuX1piCBzfx+1jsARiMsrf
 RbDg==
X-Gm-Message-State: AOAM531boxHP062wlRTi/94NLp+tf657yhc7OB4ngLb5qNaEtTNAYYM8
 se1AsYz1EU+fVmPKTMdKLD0uv1oyl1T4fp+HWpi9nA==
X-Google-Smtp-Source: ABdhPJxxg2Gd4OsjXKCsaLNReOjC2LyqbY7vL9tNME9JxAHXqeTdoMoTu0EFk6fVD4HYdZLwbSifazvlbRRed2mUoqE=
X-Received: by 2002:aa7:dcc5:: with SMTP id w5mr10137857edu.169.1633451284375; 
 Tue, 05 Oct 2021 09:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210915130620.3162787-1-jose.pekkarinen@unikie.com>
 <87zgrnd1xu.fsf@dell.be.48ers.dk>
In-Reply-To: <87zgrnd1xu.fsf@dell.be.48ers.dk>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 5 Oct 2021 19:28:31 +0300
Message-ID: <CAJPV9MqO8ZLq9TUH7Oj_-JrxZpXjQeDZ3a+-sNg-nXFNbwwV7A@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v3] package/iptables: add init script
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
Content-Type: multipart/mixed; boundary="===============0071438008096026280=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0071438008096026280==
Content-Type: multipart/alternative; boundary="00000000000090407305cd9d8389"

--00000000000090407305cd9d8389
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2021 at 4:41 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Jos=C3=A9" =3D=3D Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com=
> writes:
>
>  > This patch will add an init script that allows
>  > to set a ruleset in /etc/iptables.conf to be loaded
>  > on boot, or flushed on stop, as well as a saving
>  > command to generate a new file.
>
>  > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>  > ---
>  > [v1 -> v2] s/touch $(DESTDIR)/touch $(TARGET_DIR)/
>  > [v2 -> v3] Execute before networking script, handle ro rootfs
>
>  >  package/iptables/S35iptables | 62 +++++++++++++++++++++++++++++++++++=
+
>  >  package/iptables/iptables.mk |  6 ++++
>  >  2 files changed, 68 insertions(+)
>  >  create mode 100644 package/iptables/S35iptables
>
>  > diff --git a/package/iptables/S35iptables b/package/iptables/S35iptabl=
es
>  > new file mode 100644
>  > index 0000000000..6023297236
>  > --- /dev/null
>  > +++ b/package/iptables/S35iptables
>  > @@ -0,0 +1,62 @@
>  > +#!/bin/sh
>  > +
>  > +DAEMON=3D"iptables"
>  > +
>  > +IPTABLES_ARGS=3D""
>  > +
>  > +start() {
>  > +    printf 'Starting %s: ' "$DAEMON"
>  > +    iptables-restore < /etc/iptables.conf
>
> Any special reason for the redirect? iptables-save / restor accepts a
> filename argument.
>

Not from my side, I just didn't notice. I can

change it for you if you want.




>  > +case "$1" in
>  > +    start|stop|restart|save)
>  > +            "$1";;
>  > +    reload)
>  > +            # Restart, since there is no true "reload" feature.
>  > +            restart;;
>  > +    *)
>  > +            echo "Usage: $0 {start|stop|restart|reload}"
>
> NIT: This doesn't document the save argument.
>

Very true, please let me know and I'm happy to send a v3

tomorrow with those stuff.

Thanks!

Jos=C3=A9.

--00000000000090407305cd9d8389
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 5, 2021 at 4:41 PM Peter =
Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt=
;&gt;&gt;&gt;&gt; &quot;Jos=C3=A9&quot; =3D=3D Jos=C3=A9 Pekkarinen &lt;<a =
href=3D"mailto:jose.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarine=
n@unikie.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; This patch will add an init script that allows<br>
=C2=A0&gt; to set a ruleset in /etc/iptables.conf to be loaded<br>
=C2=A0&gt; on boot, or flushed on stop, as well as a saving<br>
=C2=A0&gt; command to generate a new file.<br>
<br>
=C2=A0&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.p=
ekkarinen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<=
br>
=C2=A0&gt; ---<br>
=C2=A0&gt; [v1 -&gt; v2] s/touch $(DESTDIR)/touch $(TARGET_DIR)/<br>
=C2=A0&gt; [v2 -&gt; v3] Execute before networking script, handle ro rootfs=
<br>
<br>
=C2=A0&gt;=C2=A0 package/iptables/S35iptables | 62 ++++++++++++++++++++++++=
++++++++++++<br>
=C2=A0&gt;=C2=A0 package/iptables/<a href=3D"http://iptables.mk" rel=3D"nor=
eferrer" target=3D"_blank">iptables.mk</a> |=C2=A0 6 ++++<br>
=C2=A0&gt;=C2=A0 2 files changed, 68 insertions(+)<br>
=C2=A0&gt;=C2=A0 create mode 100644 package/iptables/S35iptables<br>
<br>
=C2=A0&gt; diff --git a/package/iptables/S35iptables b/package/iptables/S35=
iptables<br>
=C2=A0&gt; new file mode 100644<br>
=C2=A0&gt; index 0000000000..6023297236<br>
=C2=A0&gt; --- /dev/null<br>
=C2=A0&gt; +++ b/package/iptables/S35iptables<br>
=C2=A0&gt; @@ -0,0 +1,62 @@<br>
=C2=A0&gt; +#!/bin/sh<br>
=C2=A0&gt; +<br>
=C2=A0&gt; +DAEMON=3D&quot;iptables&quot;<br>
=C2=A0&gt; +<br>
=C2=A0&gt; +IPTABLES_ARGS=3D&quot;&quot;<br>
=C2=A0&gt; +<br>
=C2=A0&gt; +start() {<br>
=C2=A0&gt; +=C2=A0 =C2=A0 printf &#39;Starting %s: &#39; &quot;$DAEMON&quot=
;<br>
=C2=A0&gt; +=C2=A0 =C2=A0 iptables-restore &lt; /etc/iptables.conf<br>
<br>
Any special reason for the redirect? iptables-save / restor accepts a<br>
filename argument.<br></blockquote><div><br></div></div><blockquote style=
=3D"margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><=
div>Not from my side, I just didn&#39;t notice. I can</div></div></blockquo=
te>change it for you if you want.<br><blockquote style=3D"margin:0 0 0 40px=
;border:none;padding:0px"><div class=3D"gmail_quote"><div>=C2=A0</div></div=
></blockquote><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
=C2=A0&gt; +case &quot;$1&quot; in<br>
=C2=A0&gt; +=C2=A0 =C2=A0 start|stop|restart|save)<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;$1&quot;;;<br>
=C2=A0&gt; +=C2=A0 =C2=A0 reload)<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Restart, since ther=
e is no true &quot;reload&quot; feature.<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 restart;;<br>
=C2=A0&gt; +=C2=A0 =C2=A0 *)<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo &quot;Usage: $0 =
{start|stop|restart|reload}&quot;<br>
<br>
NIT: This doesn&#39;t document the save argument.<br></blockquote><div><br>=
</div></div><blockquote style=3D"margin:0 0 0 40px;border:none;padding:0px"=
><div class=3D"gmail_quote"><div>Very true, please let me know and I&#39;m =
happy to send a v3</div></div></blockquote>tomorrow with those stuff.=C2=A0=
<br><div><br></div><div><blockquote style=3D"margin:0 0 0 40px;border:none;=
padding:0px"><div>Thanks!</div><div><br></div></blockquote></div><div dir=
=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"ma=
rgin:0px 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div=
></div></div>

--00000000000090407305cd9d8389--

--===============0071438008096026280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0071438008096026280==--
