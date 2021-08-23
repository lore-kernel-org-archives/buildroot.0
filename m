Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9BEC4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 05:46:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6338861042
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 05:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6338861042
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24E37400EF;
	Mon, 23 Aug 2021 05:46:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-nTkvhnU2Rf; Mon, 23 Aug 2021 05:46:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A8B8400FE;
	Mon, 23 Aug 2021 05:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24F5D1BF429
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 05:45:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 150AE6066E
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 05:45:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qI3EUauGfyoz for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 05:45:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0DA56065C
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 05:45:57 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id d6so24440725edt.7
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 22:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B8+GiDYNIwZmvVOWDUjSylTDZsvTQ+9V0cM69P2k85E=;
 b=VlirKSrcmKZ3qlir9KQ6hBxSfhCX9fSsjaDl24qt0RuxN0R06hFgRDWfSBXuuCRVui
 ccOY3GkceR7egyL6LvRDOHfmLIwfvugYXtji+m+pMbdlF0OzYbW1nyO+9U3p2YJ442o/
 jqJg2cVwRe9y0CnZZMPGNonurZOkMFA71ByGBid1PrWBmCTmMux2V+D3fMJ1ikz1I8bC
 J6MUbb4BZSqzJcQBm5jDjY/yDjpJDalC+/KbqJrZYJRkecjAcJnqKDAaOHYsiBH2mTgR
 QxPJJQjbBX6UmF2pDQqqVYSuaI+kF6/6Ax7WgjhvkWw2A8jvge0THQYAOJonHulJSO/w
 7KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8+GiDYNIwZmvVOWDUjSylTDZsvTQ+9V0cM69P2k85E=;
 b=spWXenv4QuTjzGK6Um+VjLrpB/oXRpvT7wNi5hLcM9nZrCK1bmpm/KyWpa4J7pYey2
 R1kgqiO4qmjiO6R4ZVUQr3da3/opq2zvl01CgYxwdZrxovFfpN5kRidLl/1a5IgJa7Zw
 WnCQZa9BOHXNaPPT2Hm7YXcdRg74XlfVJpLB5mrWkSRdHt+bvnu0pSSCYzUqSa1/C1SM
 fYZijjCFq1JnLZTNuAcmEdHiD+5oBOV/m54GGYrJoEIdIl8VA616eB1swg4kqPTiGWs3
 D7rwFhzTh5RTNfruqFWKNRK/akyRnX8G/nRftTmr2L0vF91HtlcPf0gC9JPRoPyz3gv4
 X/yg==
X-Gm-Message-State: AOAM532lcYjracCdqaN2bJYNxwrhsLE9498Cof6uE47PuFWYK3GxVBHQ
 lw4a5/H32PBN0mNcqW+R+UHoD2GNR0+oyKgP/Tlp0J4+zXSnnw==
X-Google-Smtp-Source: ABdhPJw/ckEzV+DVIIV3vNyxPvsTuFUDOpvJdPbXXJGQy903tKWjIR467kwxN+PuUsVHgzhP8TFekNtFKc6zPkB3Puc=
X-Received: by 2002:a05:6402:375:: with SMTP id
 s21mr36525239edw.318.1629697555921; 
 Sun, 22 Aug 2021 22:45:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210820112322.5762-1-jose.pekkarinen@unikie.com>
 <20210820233611.1d6d1c71@windsurf>
In-Reply-To: <20210820233611.1d6d1c71@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Mon, 23 Aug 2021 08:45:45 +0300
Message-ID: <CAJPV9MqEN+zLtFw_70cK1CURFp87Nynt_bOhfxBfgVNnCdN+Qg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2] package/restorecond: Add new init script
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
Content-Type: multipart/mixed; boundary="===============5336244515522257310=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============5336244515522257310==
Content-Type: multipart/alternative; boundary="000000000000e9894f05ca3387b8"

--000000000000e9894f05ca3387b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 21, 2021 at 12:36 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Jos=C3=A9,
>
> On Fri, 20 Aug 2021 14:23:22 +0300
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
> > ---
> > [ v1 -> v2 ] Moved to upstream script template
>
> I have further simplified the script to better match the S01syslogd
> template, added the inclusion of /etc/default/restorecond, and applied
> to next. Thanks!
>

Perfect! Thanks!


Jos=C3=A9.

--000000000000e9894f05ca3387b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 21, 2021 at 12:36 AM Thom=
as Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.pet=
azzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hello Jos=C3=A9,<br>
<br>
On Fri, 20 Aug 2021 14:23:22 +0300<br>
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
&gt; ---<br>
&gt; [ v1 -&gt; v2 ] Moved to upstream script template<br>
<br>
I have further simplified the script to better match the S01syslogd<br>
template, added the inclusion of /etc/default/restorecond, and applied<br>
to next. Thanks!<br></blockquote><div><br></div></div><blockquote style=3D"=
margin:0 0 0 40px;border:none;padding:0px"><div class=3D"gmail_quote"><div>=
Perfect! Thanks!=C2=A0</div></div></blockquote><br><div dir=3D"ltr" class=
=3D"gmail_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0px 0px 0=
px 40px;border:none;padding:0px">Jos=C3=A9.</blockquote></div></div></div>

--000000000000e9894f05ca3387b8--

--===============5336244515522257310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============5336244515522257310==--
