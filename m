Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BEE2C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 12:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B506D6135A
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 12:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B506D6135A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 651DD80BD7;
	Wed, 15 Sep 2021 12:20:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjygL-bxC4jo; Wed, 15 Sep 2021 12:20:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD0F826B4;
	Wed, 15 Sep 2021 12:20:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 509FC1BF404
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 12:20:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4088A826B4
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 12:20:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tEUyfTs32xq for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 12:20:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A158F80BD7
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:20:45 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id q3so4033915edt.5
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 05:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qLGvJ9eLReJvK1uV409MUTccL7wm6kIo51dkzJYtOBk=;
 b=REOaZEnlUqs4CkyKJAzciZwieRjlxEb7z+CinZlxs0h1okm9F0yy3wUQ/lNNLAUmwH
 CRk3tMPgxzmrIAfer1C8AEdFkoo6+RtiH2RHkbPVWDU4hE4/dFn0V2wCVx5+f4QSnj5k
 u57XG40x97J8JEffmB887K1omEDJ7Ivl3OQuDF7KKk/uVlTU5bGZPA1qqWBNLrWuanSG
 +MZCVDZlRk922PSOm2i820e5lHYV2gv7Iw4e31/SqQw0niB4UzniRf0K5Cn7i7EpMbnh
 UHPJhs0tqKNeGCf0pU+bwMEbfVlZoSPrOKlnCXgvlf98hyBbOspIJdkBhHqRorzrhJq+
 bUMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qLGvJ9eLReJvK1uV409MUTccL7wm6kIo51dkzJYtOBk=;
 b=objJol3ifOZBRkTSVRIcpgkHflFu4PMV16cjSsP3yVmtPDCJbhnywblwUmjaI4s3u1
 Gac6gv2xfNJGP0gQF3XE4iw9xRvTPa3SW7J6UqCIR77NmLFmQcR0fxjpU02B3ih8ExHk
 soplhoOEp6+XOmopTm9ncHDM5e+ouNhgBxnFr7Lbg7dD885r90SNls2kkJAuhxxpKKQI
 b6Gx5fgBTMrVX3z6nXB5IeqvQl/ABsZJDE1GPdJOhIKH0cq7uk01COjdPSrh6MJbGQRB
 5KNiJvwqgTEbo3nSK+U5TILRzcOpMaJZ31b0RJWtxGCMsTHVxSwxWl7PXkom28juq/YY
 12Xw==
X-Gm-Message-State: AOAM533poXWkY3tEe/DhvPoqsQPc0KKMTRP21AwwJn05I3gZB02cBieR
 SuAuiDRtDPK1L3hZYY+kqd3b6dSp9EqBgU9Lqr5xow==
X-Google-Smtp-Source: ABdhPJzKOB7LRKtMmXk3e8m3BmwaAWo6NifIJ5g/VnO3mlyn+k9aWG2jvIOs1bHYtCyD1FdkYJ5apOL4UjB89pSI8oY=
X-Received: by 2002:a05:6402:148:: with SMTP id
 s8mr25063243edu.298.1631708443709; 
 Wed, 15 Sep 2021 05:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210914132139.3597322-1-jose.pekkarinen@unikie.com>
 <87ee9rgm9e.fsf@tarshish>
 <CAJPV9MoTBjbwuAbtWaeHeSJBOKtYAbpOtJCJTAj3NW8ZF8HRSQ@mail.gmail.com>
 <87k0jif8w4.fsf@tarshish>
 <CAJPV9MpYfzoEN3qbMMmFvQy78-=i4VP39_0KzZ2GraYDnNwd3Q@mail.gmail.com>
 <c4771a62-e0e7-939c-703f-00b89267569c@grinn-global.com>
In-Reply-To: <c4771a62-e0e7-939c-703f-00b89267569c@grinn-global.com>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Wed, 15 Sep 2021 15:20:32 +0300
Message-ID: <CAJPV9MqPs6CGtH+XQgEd2GDTvyb4ZCB7rRqyqLDPOUqE+JNpDA@mail.gmail.com>
To: =?UTF-8?Q?Bartosz_Bi=C5=82as?= <b.bilas@grinn-global.com>
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
Content-Type: multipart/mixed; boundary="===============9169618713871017576=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============9169618713871017576==
Content-Type: multipart/alternative; boundary="0000000000002a2df905cc07bade"

--0000000000002a2df905cc07bade
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 15, 2021 at 3:11 PM Bartosz Bi=C5=82as <b.bilas@grinn-global.co=
m>
wrote:

> Hello Jos=C3=A9,
> On 9/15/21 1:41 PM, Jos=C3=A9 Pekkarinen wrote:
>
>
>
> On Wed, Sep 15, 2021 at 1:09 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
>> Hi Jos=C3=A9,
>>
>> On Wed, Sep 15 2021, Jos=C3=A9 Pekkarinen wrote:
>> > On Tue, Sep 14, 2021 at 7:22 PM Baruch Siach <baruch@tkos.co.il> wrote=
:
>> >  On Tue, Sep 14 2021, Jos=C3=A9 Pekkarinen wrote:
>> >  > This patch will add an init script that allows
>> >  > to set a ruleset in /etc/iptables.conf to be loaded
>> >  > on boot, or flushed on stop, as well as a saving
>> >  > command to generate a new file.
>> >  >
>> >  > Signed-off-by: Jos=C3=A9 Pekkarinen <jose.pekkarinen@unikie.com>
>> >  > ---
>> >  > [v1 -> v2] s/touch $(DESTDIR)/touch $(TARGET_DIR)/
>> >  >
>> >  >  package/iptables/S41iptables | 58
>> ++++++++++++++++++++++++++++++++++++
>> >  >  package/iptables/iptables.mk |  6 ++++
>> >  >  2 files changed, 64 insertions(+)
>> >  >  create mode 100644 package/iptables/S41iptables
>> >  >
>> >  > diff --git a/package/iptables/S41iptables
>> b/package/iptables/S41iptables
>> >  > new file mode 100644
>> >  > index 0000000000..93998b78de
>> >  > --- /dev/null
>> >  > +++ b/package/iptables/S41iptables
>> >  > @@ -0,0 +1,58 @@
>> >  > +#!/bin/sh
>> >  > +
>> >  > +DAEMON=3D"iptables"
>> >  > +
>> >  > +IPTABLES_ARGS=3D""
>> >  > +
>> >  > +start() {
>> >  > +     printf 'Starting %s: ' "$DAEMON"
>> >  > +     iptables-restore < /etc/iptables.conf
>> >  > +     status=3D$?
>> >  > +     if [ "$status" -eq 0 ]; then
>> >  > +             echo "OK"
>> >  > +     else
>> >  > +             echo "FAIL"
>> >  > +     fi
>> >  > +     return "$status"
>> >  > +}
>> >  > +
>> >  > +stop() {
>> >  > +     printf 'Stopping %s: ' "$DAEMON"
>> >  > +     iptables -F
>> >  > +     status=3D$?
>> >  > +     if [ "$status" -eq 0 ]; then
>> >  > +             echo "OK"
>> >  > +     else
>> >  > +             echo "FAIL"
>> >  > +     fi
>> >  > +     return "$status"
>> >  > +}
>> >  > +
>> >  > +restart() {
>> >  > +     stop
>> >  > +     sleep 1
>> >  > +     start
>> >  > +}
>> >  > +
>> >  > +save() {
>> >  > +     printf 'Saving %s: ' "$DAEMON"
>> >  > +     iptables-save > /etc/iptables.conf
>> >
>> >  What about read-only rootfs?
>> >
>> >     Very good point, will it work if we check the rootfs
>> > whether is ro or rw, and execute on that behalf?
>>
>> I'm not sure that this script is a good idea to begin with for the
>> default installation. But if the maintainers think it is, the script
>> should skip the save operation for read-only filesystems. See how
>> package/urandom-scripts/S20urandom handles that.
>>
>
>     Thanks again, I'm testing a patch to solve the ro rootfs
> issue. Is there any better approach to have a firewall ruleset
> by default in the final image?
>
> Did you try to use post-build script to copy this file into your image?
>
    Hi,

    I'm using the overlay to populate the final file,
but iptables doesn't look for it itself, it requires
some external mechanism to load the rules. That
is why I proposed this init script, to have a sort
of default via from buildroot.

    Best regards.

    Jos=C3=A9.


> Best
> Bartek
>
>
>     Best regards.
>
>     Jos=C3=A9.
>
>
>>
>> baruch
>>
>> >
>> >     Thanks for the comments!
>> >
>> >     Jos=C3=A9.
>> >
>> >  baruch
>> >
>> >  > +     status=3D$?
>> >  > +     if [ "$status" -eq 0 ]; then
>> >  > +             echo "OK"
>> >  > +     else
>> >  > +             echo "FAIL"
>> >  > +     fi
>> >  > +     return "$status"
>> >  > +}
>> >  > +
>> >  > +case "$1" in
>> >  > +     start|stop|restart|save)
>> >  > +             "$1";;
>> >  > +     reload)
>> >  > +             # Restart, since there is no true "reload" feature.
>> >  > +             restart;;
>> >  > +     *)
>> >  > +             echo "Usage: $0 {start|stop|restart|reload}"
>> >  > +             exit 1
>> >  > +esac
>> >  > diff --git a/package/iptables/iptables.mk b/package/iptables/
>> iptables.mk
>> >  > index dc01466607..1d3612dbf6 100644
>> >  > --- a/package/iptables/iptables.mk
>> >  > +++ b/package/iptables/iptables.mk
>> >  > @@ -57,4 +57,10 @@ define IPTABLES_LINUX_CONFIG_FIXUPS
>> >  >       $(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)
>> >  >  endef
>> >  >
>> >  > +define IPTABLES_INSTALL_INIT_SYSV
>> >  > +     $(INSTALL) -m 0755 -D package/iptables/S41iptables \
>> >  > +             $(TARGET_DIR)/etc/init.d/S41iptables
>> >  > +     touch $(TARGET_DIR)/etc/iptables.conf
>> >  > +endef
>> >  > +
>> >  >  $(eval $(autotools-package))
>>
>> --
>>                                                      ~. .~   Tk Open
>> Systems
>>
>> =3D}------------------------------------------------ooO--U--Ooo---------=
---{=3D
>>    - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>>
>
>
> --
>
> Jos=C3=A9.
>
>
> _______________________________________________
> buildroot mailing listbuildroot@lists.buildroot.orghttps://lists.buildroo=
t.org/mailman/listinfo/buildroot
>
> --
>
>

--=20

Jos=C3=A9.

--0000000000002a2df905cc07bade
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 3:11 PM Barto=
sz Bi=C5=82as &lt;<a href=3D"mailto:b.bilas@grinn-global.com">b.bilas@grinn=
-global.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
 =20
   =20
 =20
  <div>
    <p>Hello Jos=C3=A9,</p>
    <div>On 9/15/21 1:41 PM, Jos=C3=A9 Pekkarinen
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 15, 2021 at 1:0=
9
            PM Baruch Siach &lt;<a href=3D"mailto:baruch@tkos.co.il" target=
=3D"_blank">baruch@tkos.co.il</a>&gt; wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Jos=C3=A9,<b=
r>
            <br>
            On Wed, Sep 15 2021, Jos=C3=A9 Pekkarinen wrote:<br>
            &gt; On Tue, Sep 14, 2021 at 7:22 PM Baruch Siach &lt;<a href=
=3D"mailto:baruch@tkos.co.il" target=3D"_blank">baruch@tkos.co.il</a>&gt; w=
rote:<br>
            &gt;=C2=A0 On Tue, Sep 14 2021, Jos=C3=A9 Pekkarinen wrote:<br>
            &gt;=C2=A0 &gt; This patch will add an init script that allows<=
br>
            &gt;=C2=A0 &gt; to set a ruleset in /etc/iptables.conf to be
            loaded<br>
            &gt;=C2=A0 &gt; on boot, or flushed on stop, as well as a savin=
g<br>
            &gt;=C2=A0 &gt; command to generate a new file.<br>
            &gt;=C2=A0 &gt;<br>
            &gt;=C2=A0 &gt; Signed-off-by: Jos=C3=A9 Pekkarinen &lt;<a href=
=3D"mailto:jose.pekkarinen@unikie.com" target=3D"_blank">jose.pekkarinen@un=
ikie.com</a>&gt;<br>
            &gt;=C2=A0 &gt; ---<br>
            &gt;=C2=A0 &gt; [v1 -&gt; v2] s/touch $(DESTDIR)/touch
            $(TARGET_DIR)/<br>
            &gt;=C2=A0 &gt;<br>
            &gt;=C2=A0 &gt;=C2=A0 package/iptables/S41iptables | 58
            ++++++++++++++++++++++++++++++++++++<br>
            &gt;=C2=A0 &gt;=C2=A0 package/iptables/<a href=3D"http://iptabl=
es.mk" rel=3D"noreferrer" target=3D"_blank">iptables.mk</a>
            |=C2=A0 6 ++++<br>
            &gt;=C2=A0 &gt;=C2=A0 2 files changed, 64 insertions(+)<br>
            &gt;=C2=A0 &gt;=C2=A0 create mode 100644 package/iptables/S41ip=
tables<br>
            &gt;=C2=A0 &gt;<br>
            &gt;=C2=A0 &gt; diff --git a/package/iptables/S41iptables
            b/package/iptables/S41iptables<br>
            &gt;=C2=A0 &gt; new file mode 100644<br>
            &gt;=C2=A0 &gt; index 0000000000..93998b78de<br>
            &gt;=C2=A0 &gt; --- /dev/null<br>
            &gt;=C2=A0 &gt; +++ b/package/iptables/S41iptables<br>
            &gt;=C2=A0 &gt; @@ -0,0 +1,58 @@<br>
            &gt;=C2=A0 &gt; +#!/bin/sh<br>
            &gt;=C2=A0 &gt; +<br>
            &gt;=C2=A0 &gt; +DAEMON=3D&quot;iptables&quot;<br>
            &gt;=C2=A0 &gt; +<br>
            &gt;=C2=A0 &gt; +IPTABLES_ARGS=3D&quot;&quot;<br>
            &gt;=C2=A0 &gt; +<br>
            &gt;=C2=A0 &gt; +start() {<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Starting %s: &=
#39; &quot;$DAEMON&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0iptables-restore &lt; /etc=
/iptables.conf<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -=
eq 0 ]; then<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;OK&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0else<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;FAIL&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;=
<br>
            &gt;=C2=A0 &gt; +}<br>
            &gt;=C2=A0 &gt; +<br>
            &gt;=C2=A0 &gt; +stop() {<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Stopping %s: &=
#39; &quot;$DAEMON&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0iptables -F<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -=
eq 0 ]; then<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;OK&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0else<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;FAIL&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;=
<br>
            &gt;=C2=A0 &gt; +}<br>
            &gt;=C2=A0 &gt; +<br>
            &gt;=C2=A0 &gt; +restart() {<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0stop<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0sleep 1<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0start<br>
            &gt;=C2=A0 &gt; +}<br>
            &gt;=C2=A0 &gt; +<br>
            &gt;=C2=A0 &gt; +save() {<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0printf &#39;Saving %s: &#3=
9; &quot;$DAEMON&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0iptables-save &gt; /etc/ip=
tables.conf<br>
            &gt;<br>
            &gt;=C2=A0 What about read-only rootfs?<br>
            &gt;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0Very good point, will it work if we che=
ck the
            rootfs<br>
            &gt; whether is ro or rw, and execute on that behalf?<br>
            <br>
            I&#39;m not sure that this script is a good idea to begin with
            for the<br>
            default installation. But if the maintainers think it is,
            the script<br>
            should skip the save operation for read-only filesystems.
            See how<br>
            package/urandom-scripts/S20urandom handles that.<br>
          </blockquote>
          <div><br>
          </div>
          <div>=C2=A0 =C2=A0 Thanks again, I&#39;m testing a patch to solve=
 the ro
            rootfs</div>
          <div>issue. Is there any better approach to have a firewall
            ruleset</div>
          <div>by default in the final image?</div>
        </div>
      </div>
    </blockquote>
    <p>Did you try to use post-build script to copy this file into your
      image?</p></div></blockquote><div>=C2=A0 =C2=A0 Hi,</div><div><br></d=
iv><div>=C2=A0 =C2=A0 I&#39;m using the overlay to populate the final file,=
</div><div>but iptables doesn&#39;t look for it itself, it requires</div><d=
iv>some external mechanism to load the rules. That</div><div>is why I propo=
sed this init script, to have a sort</div><div>of default via from buildroo=
t.</div><div><br></div><div>=C2=A0 =C2=A0 Best regards.</div><div><br></div=
><div>=C2=A0 =C2=A0 Jos=C3=A9.</div><div>=C2=A0</div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex"><div>
    Best<br>
    Bartek<br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_quote">
          <div><br>
          </div>
          <div>=C2=A0 =C2=A0 Best regards.</div>
          <div><br>
          </div>
          <div>=C2=A0 =C2=A0 Jos=C3=A9.</div>
          <div>=C2=A0</div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            baruch<br>
            <br>
            &gt;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0Thanks for the comments!<br>
            &gt;<br>
            &gt;=C2=A0 =C2=A0 =C2=A0Jos=C3=A9.<br>
            &gt;=C2=A0 <br>
            &gt;=C2=A0 baruch<br>
            &gt;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0status=3D$?<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$status&quot; -=
eq 0 ]; then<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;OK&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0else<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;FAIL&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0fi<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0return &quot;$status&quot;=
<br>
            &gt;=C2=A0 &gt; +}<br>
            &gt;=C2=A0 &gt; +<br>
            &gt;=C2=A0 &gt; +case &quot;$1&quot; in<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0start|stop|restart|save)<b=
r>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;$1&quot;;;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0reload)<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0# Restart, since there is no true
            &quot;reload&quot; feature.<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0restart;;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0*)<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0echo &quot;Usage: $0
            {start|stop|restart|reload}&quot;<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0exit 1<br>
            &gt;=C2=A0 &gt; +esac<br>
            &gt;=C2=A0 &gt; diff --git a/package/iptables/<a href=3D"http:/=
/iptables.mk" rel=3D"noreferrer" target=3D"_blank">iptables.mk</a> b/packag=
e/iptables/<a href=3D"http://iptables.mk" rel=3D"noreferrer" target=3D"_bla=
nk">iptables.mk</a><br>
            &gt;=C2=A0 &gt; index dc01466607..1d3612dbf6 100644<br>
            &gt;=C2=A0 &gt; --- a/package/iptables/<a href=3D"http://iptabl=
es.mk" rel=3D"noreferrer" target=3D"_blank">iptables.mk</a><br>
            &gt;=C2=A0 &gt; +++ b/package/iptables/<a href=3D"http://iptabl=
es.mk" rel=3D"noreferrer" target=3D"_blank">iptables.mk</a><br>
            &gt;=C2=A0 &gt; @@ -57,4 +57,10 @@ define
            IPTABLES_LINUX_CONFIG_FIXUPS<br>
            &gt;=C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(call
            KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_XTABLES)<br>
            &gt;=C2=A0 &gt;=C2=A0 endef<br>
            &gt;=C2=A0 &gt;=C2=A0 <br>
            &gt;=C2=A0 &gt; +define IPTABLES_INSTALL_INIT_SYSV<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0$(INSTALL) -m 0755 -D
            package/iptables/S41iptables \<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0
            =C2=A0$(TARGET_DIR)/etc/init.d/S41iptables<br>
            &gt;=C2=A0 &gt; +=C2=A0 =C2=A0 =C2=A0touch $(TARGET_DIR)/etc/ip=
tables.conf<br>
            &gt;=C2=A0 &gt; +endef<br>
            &gt;=C2=A0 &gt; +<br>
            &gt;=C2=A0 &gt;=C2=A0 $(eval $(autotools-package))<br>
            <br>
            -- <br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0~. .~=C2=A0
            =C2=A0Tk Open Systems<br>
=3D}------------------------------------------------ooO--U--Ooo------------=
{=3D<br>
            =C2=A0 =C2=A0- <a href=3D"mailto:baruch@tkos.co.il" target=3D"_=
blank">baruch@tkos.co.il</a> - tel:
            +972.52.368.4656, <a href=3D"http://www.tkos.co.il" rel=3D"nore=
ferrer" target=3D"_blank">http://www.tkos.co.il</a>
            -<br>
          </blockquote>
        </div>
        <br clear=3D"all">
        <div><br>
        </div>
        -- <br>
        <div dir=3D"ltr">
          <div dir=3D"ltr">
            <blockquote style=3D"margin:0px 0px 0px 40px;border:none;paddin=
g:0px">Jos=C3=A9.</blockquote>
          </div>
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <pre>_______________________________________________
buildroot mailing list
<a href=3D"mailto:buildroot@lists.buildroot.org" target=3D"_blank">buildroo=
t@lists.buildroot.org</a>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" target=
=3D"_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
    </blockquote>
    <div>-- <br>
     =20
     =20
      <br>
    </div>
  </div>

</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px=
 0px 0px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div><=
/div>

--0000000000002a2df905cc07bade--

--===============9169618713871017576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9169618713871017576==--
