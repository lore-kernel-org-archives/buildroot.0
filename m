Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D739FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 09:15:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70D6561246
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 09:15:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70D6561246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42C3540041;
	Wed, 15 Sep 2021 09:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 57NaccrLh-YM; Wed, 15 Sep 2021 09:15:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33DE64021E;
	Wed, 15 Sep 2021 09:15:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4A691BF3F6
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 09:15:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A463E81A34
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 09:15:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G-1TU7wv7dbU for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 09:15:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 66E8080F22
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 09:15:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bt14so4692219ejb.3
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 02:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=curKqqfewdJLRUF0Uw8KlqNJ0YIxh/tB/oGjwznFcP8=;
 b=bxKMmYg5GZNBVOi6jih70raafnzTv7lzRnZPIK+ys8QDy4faaA2J/UkWTmJvpAVw+L
 /4ZCvYjWuCT7ZprM8moWGvJ5Cq+Bn4KIBTaSGqOAdebedaEhkc9anmge3fmsGnYwzcAD
 ISK/65CjSzFLjgjCht+umE1laEENfRVsmUPc1L6d6LGhFyvQM76usI/ZbVwwa3FNW1Oj
 Au4IhPaytKjw865p3fz7MoqG1ZQn2yOvqfJE9qLqpe+2yRFKM36MTHfQDWHw19HCQgT3
 9Yu3CmwBaIe8zspXijDQnY7DJuz3ZQJwis+ADsVipNjUAbIf3ecQaopi+pm3ryHu3f9N
 6kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=curKqqfewdJLRUF0Uw8KlqNJ0YIxh/tB/oGjwznFcP8=;
 b=d7QhI52Ok8zU9UySxFopc6SPZfs4ubl5bvpGfVrD8LQYGHLg/i+l9lRn5/9PXvudbu
 uNQtwSbtSW+NICQVJrJgHxsxPufVbHfazmDVqTFDX2KFIhi05vLJI4R8EopZ3jvG9s1N
 UeST6qx/tZ4ift6euePdIcNOCmiXgUkz0rxwkb2ZTnHbdzLzK36M1JzSrqyOj31lCGRP
 agkoKNhIvkLras6Z2VovyJTYs7RfeOJs0OkqpSzBl4G9xawtqo6O4vjY7VXv2iWvqevl
 6PB1XFvjvV6ku40d9NzBegr5aPra3PSvTS1Yitc2ircCIFN1V+ddoIxD5wqWLmuQM/v0
 d+og==
X-Gm-Message-State: AOAM531OC+NmoLfTB7eo/htW6py7ONkDGWJhwDfNUnD70TsoiUPa4hrx
 iIYAv4V+5RMX6S2IwDG+ZvvAjzgb7bzI4UWK5oCFhi5Rcj212g==
X-Google-Smtp-Source: ABdhPJx/u9XJ/lA2tOSYThFlO6gCepUZVPiJ1lqr3LZ4Lrns85oHMGBxJfgj82CQC0DeAOcSf99Pe3ZZQkU07F2alKM=
X-Received: by 2002:a17:906:6403:: with SMTP id
 d3mr23306298ejm.37.1631697310276; 
 Wed, 15 Sep 2021 02:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210914132139.3597322-1-jose.pekkarinen@unikie.com>
 <87ee9rgm9e.fsf@tarshish>
In-Reply-To: <87ee9rgm9e.fsf@tarshish>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 15 Sep 2021 12:14:59 +0300
Message-ID: <CAJPV9MoTBjbwuAbtWaeHeSJBOKtYAbpOtJCJTAj3NW8ZF8HRSQ@mail.gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
Subject: Re: [Buildroot] [PATCH v2] package/iptables: add init script
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0538690365544843393=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============0538690365544843393==
Content-Type: multipart/alternative; boundary="0000000000008f75f405cc0522d7"

--0000000000008f75f405cc0522d7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 14, 2021 at 7:22 PM Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Jos=C3=A9,
>
> On Tue, Sep 14 2021, Jos=C3=A9 Pekkarinen wrote:
> > This patch will add an init script that allows
> > to set a ruleset in /etc/iptables.conf to be loaded
> > on boot, or flushed on stop, as well as a saving
> > command to generate a new file.
> >
> > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
> > ---
> > [v1 -> v2] s/touch $(DESTDIR)/touch $(TARGET_DIR)/
> >
> >  package/iptables/S41iptables | 58 ++++++++++++++++++++++++++++++++++++
> >  package/iptables/iptables.mk |  6 ++++
> >  2 files changed, 64 insertions(+)
> >  create mode 100644 package/iptables/S41iptables
> >
> > diff --git a/package/iptables/S41iptables b/package/iptables/S41iptable=
s
> > new file mode 100644
> > index 0000000000..93998b78de
> > --- /dev/null
> > +++ b/package/iptables/S41iptables
> > @@ -0,0 +1,58 @@
> > +#!/bin/sh
> > +
> > +DAEMON=3D"iptables"
> > +
> > +IPTABLES_ARGS=3D""
> > +
> > +start() {
> > +     printf 'Starting %s: ' "$DAEMON"
> > +     iptables-restore < /etc/iptables.conf
> > +     status=3D$?
> > +     if [ "$status" -eq 0 ]; then
> > +             echo "OK"
> > +     else
> > +             echo "FAIL"
> > +     fi
> > +     return "$status"
> > +}
> > +
> > +stop() {
> > +     printf 'Stopping %s: ' "$DAEMON"
> > +     iptables -F
> > +     status=3D$?
> > +     if [ "$status" -eq 0 ]; then
> > +             echo "OK"
> > +     else
> > +             echo "FAIL"
> > +     fi
> > +     return "$status"
> > +}
> > +
> > +restart() {
> > +     stop
> > +     sleep 1
> > +     start
> > +}
> > +
> > +save() {
> > +     printf 'Saving %s: ' "$DAEMON"
> > +     iptables-save > /etc/iptables.conf
>
> What about read-only rootfs?
>

    Very good point, will it work if we check the rootfs
whether is ro or rw, and execute on that behalf?

    Thanks for the comments!

    Jos=C3=A9.


> baruch
>
> > +     status=3D$?
> > +     if [ "$status" -eq 0 ]; then
> > +             echo "OK"
> > +     else
> > +             echo "FAIL"
> > +     fi
> > +     return "$status"
> > +}
> > +
> > +case "$1" in
> > +     start|stop|restart|save)
> > +             "$1";;
> > +     reload)
> > +             # Restart, since there is no true "reload" feature.
> > +             restart;;
> > +     *)
> > +             echo "Usage: $0 {start|stop|restart|reload}"
> > +             exit 1
> > +esac
> > diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.m=
k
> > index dc01466607..1d3612dbf6 100644
> > --- a/package/iptables/iptables.mk
> > +++ b/package/iptables/iptables.mk
> > @@ -57,4 +57,10 @@ define IPTABLES_LINUX_CONFIG_FIXUPS
> >       $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
> >  endef
> >
> > +define IPTABLES_INSTALL_INIT_SYSV
> > +     $(INSTALL) -m 0755 -D package/iptables/S41iptables \
> > +             $(TARGET_DIR)/etc/init.d/S41iptables
> > +     touch $(TARGET_DIR)/etc/iptables.conf
> > +endef
> > +
> >  $(eval $(autotools-package))
>
>
> --
>                                                      ~. .~   Tk Open
> Systems
> =3D}------------------------------------------------ooO--U--Ooo----------=
--{=3D
>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>


--=20

Jos=C3=A9.

--0000000000008f75f405cc0522d7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 14, 2021 at 7:22 PM Baruc=
h Siach &lt;<a href=3D"mailto:baruch@tkos.co.il">baruch@tkos.co.il</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Jos=C3=
=A9,<br>
<br>
On Tue, Sep 14 2021, Jos=C3=A9 Pekkarinen wrote:<br>
&gt; This patch will add an init script that allows<br>
&gt; to set a ruleset in /etc/iptables.conf to be loaded<br>
&gt; on boot, or flushed on stop, as well as a saving<br>
&gt; command to generate a new file.<br>
&gt;<br>
&gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=3D"mailto:jose.pekkari=
nen@unikie.com" target=3D"_blank">jose.pekkarinen@unikie.com</a>&gt;<br>
&gt; ---<br>
&gt; [v1 -&gt; v2] s/touch $(DESTDIR)/touch $(TARGET_DIR)/<br>
&gt;<br>
&gt;=C2=A0 package/iptables/S41iptables | 58 ++++++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 package/iptables/<a href=3D"http://iptables.mk" rel=3D"noreferre=
r" target=3D"_blank">iptables.mk</a> |=C2=A0 6 ++++<br>
&gt;=C2=A0 2 files changed, 64 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/iptables/S41iptables<br>
&gt;<br>
&gt; diff --git a/package/iptables/S41iptables b/package/iptables/S41iptabl=
es<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..93998b78de<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/iptables/S41iptables<br>
&gt; @@ -0,0 +1,58 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +DAEMON=3D&quot;iptables&quot;<br>
&gt; +<br>
&gt; +IPTABLES_ARGS=3D&quot;&quot;<br>
&gt; +<br>
&gt; +start() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Starting %s: &#39; &quot;$DAEMON&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iptables-restore &lt; /etc/iptables.conf<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +stop() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Stopping %s: &#39; &quot;$DAEMON&quot=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iptables -F<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +restart() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0stop<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sleep 1<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start<br>
&gt; +}<br>
&gt; +<br>
&gt; +save() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Saving %s: &#39; &quot;$DAEMON&quot;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0iptables-save &gt; /etc/iptables.conf<br>
<br>
What about read-only rootfs?<br></blockquote><div><br></div><div>=C2=A0 =C2=
=A0 Very good point, will it work if we check the rootfs</div><div>whether =
is ro or rw, and execute on that behalf?</div><div><br></div><div>=C2=A0 =
=C2=A0 Thanks for the comments!</div><div><br></div><div>=C2=A0 =C2=A0 Jos=
=C3=A9.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
baruch<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -eq 0 ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;OK&quot;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;FAIL&quot;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;<br>
&gt; +}<br>
&gt; +<br>
&gt; +case &quot;$1&quot; in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0start|stop|restart|save)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;$1&quot;;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0reload)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Restart, since ther=
e is no true &quot;reload&quot; feature.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restart;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Usage: $0 =
{start|stop|restart|reload}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exit 1<br>
&gt; +esac<br>
&gt; diff --git a/package/iptables/<a href=3D"http://iptables.mk" rel=3D"no=
referrer" target=3D"_blank">iptables.mk</a> b/package/iptables/<a href=3D"h=
ttp://iptables.mk" rel=3D"noreferrer" target=3D"_blank">iptables.mk</a><br>
&gt; index dc01466607..1d3612dbf6 100644<br>
&gt; --- a/package/iptables/<a href=3D"http://iptables.mk" rel=3D"noreferre=
r" target=3D"_blank">iptables.mk</a><br>
&gt; +++ b/package/iptables/<a href=3D"http://iptables.mk" rel=3D"noreferre=
r" target=3D"_blank">iptables.mk</a><br>
&gt; @@ -57,4 +57,10 @@ define IPTABLES_LINUX_CONFIG_FIXUPS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_X=
TABLES)<br>
&gt;=C2=A0 endef<br>
&gt;=C2=A0 <br>
&gt; +define IPTABLES_INSTALL_INIT_SYSV<br>
&gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D package/iptables/S41iptable=
s \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/etc/ini=
t.d/S41iptables<br>
&gt; +=C2=A0 =C2=A0 =C2=A0touch $(TARGET_DIR)/etc/iptables.conf<br>
&gt; +endef<br>
&gt; +<br>
&gt;=C2=A0 $(eval $(autotools-package))<br>
<br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0 =C2=A0Tk Open Systems<=
br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
=C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruc=
h@tkos.co.il</a> - tel: +972.52.368.4656, <a href=3D"http://www.tkos.co.il"=
 rel=3D"noreferrer" target=3D"_blank">http://www.tkos.co.il</a> -<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div><=
/div>

--0000000000008f75f405cc0522d7--

--===============0538690365544843393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0538690365544843393==--
