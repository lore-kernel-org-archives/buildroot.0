Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85667C636D3
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 08:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1281360888;
	Mon,  6 Feb 2023 08:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1281360888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUsGborQ_GC1; Mon,  6 Feb 2023 08:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34F02605A0;
	Mon,  6 Feb 2023 08:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34F02605A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7841BF329
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC1B6408EC
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 08:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC1B6408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UA-iujDyMFVg for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 08:12:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA203408EB
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA203408EB
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 08:12:34 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id w5so1289820plg.8
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 00:12:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HxqbJ8fS0Xq2iHhfmJ5DhzmNZ1rh9YHbVxv22n/GHlI=;
 b=aTsiMuRvutP1iw5pbjlsIMT22Oe3hESN4YbV+lxLD9O5LTNjaxTgj2ajIGYysCldPG
 bxfd1lGNOOYGegqiLQolYVgQchtENpy/R95jrAjLBDLqxce9cbzhemeajrWXxjpQZdOm
 u4aWko1u1LGmR8tk61bzig7PcsX+fseLmA5eC0ei7eMplrsW/9jdLMZ1MArN8tHDGu2N
 cTnTeRhOUJcaenrONS9UZyO5q1hcv0gfU/eINljKagAH4uCZF/LsNO3LHecD/c+DY9Qb
 AOkOQDO0DmZFDdy9BaTRaaDQpLyFFusgWZ/9NP7wGNkpxc0ItJqTJrXxxO48djnRu76r
 PPSw==
X-Gm-Message-State: AO0yUKVMOnI9UgIH7d6FHGtWh0MAQLATCfP+4OppOhRemiA+gXWrqO7o
 w+vmaquBP3fJc2/UVIXlRnCIpBuAYhE+fingrmAbH04Q
X-Google-Smtp-Source: AK7set/8GazMlqa3Exbnr8761qVGkkENfU3RNxaq+2FFUNNzysKOWPf7LDqOrfszySzkNFgs8O2ZbawBMsaqPX8ETXk=
X-Received: by 2002:a17:902:ed83:b0:198:e70d:7248 with SMTP id
 e3-20020a170902ed8300b00198e70d7248mr1965825plj.5.1675671154027; Mon, 06 Feb
 2023 00:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20230120192846.7362-1-fontaine.fabrice@gmail.com>
 <87y1pbwwdl.fsf@dell.be.48ers.dk>
In-Reply-To: <87y1pbwwdl.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 6 Feb 2023 09:12:22 +0100
Message-ID: <CAPi7W80p85w6n_PDPnQysjB8QMsWKtVK-A8BrH5YmjROSwEFEw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HxqbJ8fS0Xq2iHhfmJ5DhzmNZ1rh9YHbVxv22n/GHlI=;
 b=hFxriUGtmzfmFut5aQYNxFF+Aq/KZIi/Idax6DL+w2YJ1rMm/npJvsjEckHN+gm/RU
 Ejp3rA/qopuY5q4blLZax4FY2WPTPtK/YE6PuvPn9daNJ4uY7JZtNegaN2rajVMPeyP4
 LdIIfzi1T8+/+g7rFkAbQljaz84LFnw2KPa+SZb8LEmCUIgQ6hs+++0DatebWEOz8PZv
 SkWM3IIkP21z0ga+NtacKhWaDNCBbAGzr+GPyoalBD6W9mWJleqzCJp5wE7ZNBppibOY
 pcOr1694yfySs1Yw+mBtEVVL3CZ+bIBOsWATO056aPMULcMZGgDmQbT6iHSqpMc4LKAe
 VFHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hFxriUGt
Subject: Re: [Buildroot] [PATCH 1/1] package/lxc: security bump to version
 5.0.2
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
Cc: =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jezz@sysmic.org>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6828327634769449530=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6828327634769449530==
Content-Type: multipart/alternative; boundary="000000000000e572bb05f4039734"

--000000000000e572bb05f4039734
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le lun. 6 f=C3=A9vr. 2023 =C3=A0 00:00, Peter Korsgaard <peter@korsgaard.co=
m> a
=C3=A9crit :

> >>>>> "Fabrice" =3D=3D Fabrice Fontaine <fontaine.fabrice@gmail.com> writ=
es:
>
>  > - Fix CVE-2022-47952: lxc-user-nic in lxc through 5.0.1 is installed
>  >   setuid root, and may allow local users to infer whether any file
>  >   exists, even within a protected directory tree, because "Failed to
>  >   open" often indicates that a file does not exist, whereas "does not
>  >   refer to a network namespace path" often indicates that a file exist=
s.
>  >   NOTE: this is different from CVE-2018-6556 because the CVE-2018-6556
>  >   fix design was based on the premise that "we will report back to the
>  >   user that the open() failed but the user has no way of knowing why i=
t
>  >   failed"; however, in many realistic cases, there are no plausible
>  >   reasons for failing except that the file does not exist.
>  > - Drop patches (already in version)
>
>  > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Committed to 2022.11.x, thanks.
>
> I see that there isn't a new 4.0.x release. Do you know if 4.0.x is also
> vulnerable to this issue?
>

To my understanding 4.0.x is also vulnerable.
https://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8
should be backported.


>
> --
> Bye, Peter Korsgaard
>

Best Regards,

Fabrice

--000000000000e572bb05f4039734
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hello,</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 6 f=C3=A9vr=
. 2023 =C3=A0=C2=A000:00, Peter Korsgaard &lt;<a href=3D"mailto:peter@korsg=
aard.com" target=3D"_blank">peter@korsgaard.com</a>&gt; a =C3=A9crit=C2=A0:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt=
;&gt; &quot;Fabrice&quot; =3D=3D Fabrice Fontaine &lt;<a href=3D"mailto:fon=
taine.fabrice@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&g=
t; writes:<br>
<br>
=C2=A0&gt; - Fix CVE-2022-47952: lxc-user-nic in lxc through 5.0.1 is insta=
lled<br>
=C2=A0&gt;=C2=A0 =C2=A0setuid root, and may allow local users to infer whet=
her any file<br>
=C2=A0&gt;=C2=A0 =C2=A0exists, even within a protected directory tree, beca=
use &quot;Failed to<br>
=C2=A0&gt;=C2=A0 =C2=A0open&quot; often indicates that a file does not exis=
t, whereas &quot;does not<br>
=C2=A0&gt;=C2=A0 =C2=A0refer to a network namespace path&quot; often indica=
tes that a file exists.<br>
=C2=A0&gt;=C2=A0 =C2=A0NOTE: this is different from CVE-2018-6556 because t=
he CVE-2018-6556<br>
=C2=A0&gt;=C2=A0 =C2=A0fix design was based on the premise that &quot;we wi=
ll report back to the<br>
=C2=A0&gt;=C2=A0 =C2=A0user that the open() failed but the user has no way =
of knowing why it<br>
=C2=A0&gt;=C2=A0 =C2=A0failed&quot;; however, in many realistic cases, ther=
e are no plausible<br>
=C2=A0&gt;=C2=A0 =C2=A0reasons for failing except that the file does not ex=
ist.<br>
=C2=A0&gt; - Drop patches (already in version)<br>
<br>
=C2=A0&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.f=
abrice@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
<br>
Committed to 2022.11.x, thanks.<br>
<br>
I see that there isn&#39;t a new 4.0.x release. Do you know if 4.0.x is als=
o<br>
vulnerable to this issue?<br></blockquote><div><br></div><div>To my underst=
anding 4.0.x is also vulnerable.</div><div><a href=3D"https://github.com/lx=
c/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8" target=3D"_blank">ht=
tps://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8</a=
></div><div>should be backported.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br></blockquote><div><br></div><div>Best Regards,</div=
><div><br></div><div>Fabrice <br></div></div></div>

--000000000000e572bb05f4039734--

--===============6828327634769449530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6828327634769449530==--
