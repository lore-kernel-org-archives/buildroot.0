Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA05C61DA4
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 09:03:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4360260AE9;
	Thu,  9 Feb 2023 09:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4360260AE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iuQnDsHfFr7E; Thu,  9 Feb 2023 09:03:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C07660008;
	Thu,  9 Feb 2023 09:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C07660008
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D1B9B1BF361
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 09:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9B3B402BD
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 09:03:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B3B402BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 57ap_8kuOKKY for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 09:03:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E6D2402B2
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E6D2402B2
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 09:03:19 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-16aaa20f516so1770925fac.1
 for <buildroot@buildroot.org>; Thu, 09 Feb 2023 01:03:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TkU43s4eR7uChhTakK3MBTHSx8H5+Oujx3GiXosfFD4=;
 b=r8bmI9FQnziZ+EHnlW6c7xmKQPZDNIuLKpKDNFa1ZUAQLqnxJCmTwtJ+d+6TwaS5c3
 QtabAlZ4AoBjHyMiT2Ifaz7AI9vrv3rHBCA2gibUJV8xWBAzPaFc/6WJmDTlEi/4CZRc
 K8OWM2pXdUxnHvEar3Khtm1UUp/KeDhwwzI2UfkpRQbqXxs+tW4BdVsbJw7AlJ3pygTD
 gPF0aTlrAfQThauSa0rTlaIrpwDENFXdtc7OAPAJGdH58r9nCPKF+TLHXp4399bBgGDt
 RsUFXWPcPNCQj8lltjUkYD0bonSd8sHkcrXyX4QH7v0Vbvaju9/7rAdwDeBNBDNveTAy
 tYyA==
X-Gm-Message-State: AO0yUKWdnBZh29Jb+BOOtU0FIxfAp8qL6oQ6qMbOwKWTlzJOgcN31q9B
 +y8EYSNsKOFKkCARs1ItNmD/567ao5n1vqjc7BggjMIoy5U=
X-Google-Smtp-Source: AK7set/ZaNsIx2sZ1pN7/O7qUyIHDx3REZ9tC54i8TyTNJbrjGmBygaqPBD2BTWhr3fm7ObkhI5xBYXfvo74u087MMc=
X-Received: by 2002:a05:6870:4346:b0:163:42d7:fa0d with SMTP id
 x6-20020a056870434600b0016342d7fa0dmr938490oah.208.1675933398225; Thu, 09 Feb
 2023 01:03:18 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeSsqfaF0P7g_hxQ2EjSh=zDG9=FTnLrbq5g4+22UNJq-xw@mail.gmail.com>
 <CACHw65+r07g=hU4yv1Xhb3TFVmOVkYdSpRy3dZF9y+U44TK=Qw@mail.gmail.com>
 <CADYjeStPWnGcr23XOGnB+61eZ=iZKVj8YkhDKSaw0BUFT7WC-A@mail.gmail.com>
 <36be5bdc-591c-71cb-ea31-9e38ae8d643d@inbox.ru>
 <CADYjeSuvmoMXDGgN9rmv+RecroVxqj1_d9x3G4iakwkvLs+j9Q@mail.gmail.com>
 <22e489f3-cc1d-985d-cca6-18f4f6ddecfa@inbox.ru>
 <CADYjeSuBvHsij7YTnyq5tW9jEv1JtV3u1WyYkX2cbffgkQ6_Kw@mail.gmail.com>
 <a481ffb1-5c10-d913-0f8a-cbb5e11ff631@inbox.ru>
In-Reply-To: <a481ffb1-5c10-d913-0f8a-cbb5e11ff631@inbox.ru>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Thu, 9 Feb 2023 10:03:09 +0100
Message-ID: <CADYjeStesndVUqdWqmPVP5=xfW1PFcwzNk=9o0TUM+tXBez8mA@mail.gmail.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TkU43s4eR7uChhTakK3MBTHSx8H5+Oujx3GiXosfFD4=;
 b=BzO0wJ7bzRgm4QOl9zWm/iaDjnrlD2fktQUtNDO3kr1LhGO+fOsGmHpw9TmgO9YjeC
 qpkVF0N/CKxw4mBqOj6/cz40nwFiskGuhVFeburUhm6XbN2RQBJIfVo7axcOaO0RYk4D
 rAdEiP+2NXGySM9G9Ine8k7IribLAo5Q6hpT54DYhZOaD7v9tJxKULiGrINJ1K4/5YfJ
 05czjPNDJVC+b+Hylc6HuPmOBivTSvKRyN83Juv+8q3k/bLwdDnlx8iGVXZnXeYpQAbK
 /dAZMJRUPOHFqvNqEpuzq9akYycmlAGRHD2+WH8dNYZzuTpbxVloD5heu7s/UyL9n406
 Gd1w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BzO0wJ7b
Subject: Re: [Buildroot] How to install custom sdk in buildroot?
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
Cc: Ramon Crichlow <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0792890857193396043=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0792890857193396043==
Content-Type: multipart/alternative; boundary="000000000000de596c05f440a605"

--000000000000de596c05f440a605
Content-Type: text/plain; charset="UTF-8"

Hello Maxim,

Update:

The above issue resolved by itself!

Now when I do: utils/scanpypi awscrt -o package , it says

spdx_lookup module is not installed. This can lead to an inaccurate licence
detection. Please install it via
pip install spdx_lookup
buildroot package name for awscrt: python-awscrt
Package: python-awscrt
Fetching package awscrt
ERROR: Could not find package awscrt.
Check syntax inside the python package index:
https://pypi.python.org/pypi/

But the package is available at https://pypi.org/project/awscrt/

On Thu, 9 Feb 2023 at 09:58, Maxim Kochetkov <fido_max@inbox.ru> wrote:

>
>
> On 09.02.2023 11:14, Sourabh Hegde wrote:
> > Hello Maxim,
> >
> > Thanks for the explanation.
> >
> > When I tried this : utils/scanpypi awscrt awsiotsdk -o package ,  I am
> > getting below error:
> >
> > utils/scanpypi:21: DeprecationWarning: the imp module is deprecated in
> > favour of importlib; see the module's documentation for alternative uses
> >    import imp
> > Traceback (most recent call last):
> >    File "utils/scanpypi", line 23, in <module>
> >      import six.moves.urllib.request
> > ModuleNotFoundError: No module named 'six'
>
> You have no "six" module installed for python. I have to install it
> first. For ubuntu: sudo apt install python3-six
>
>

--000000000000de596c05f440a605
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Maxim,<div><br>Update:</div><div><br>The above issue=
 resolved by itself!</div><div><br>Now when I do:=C2=A0utils/scanpypi awscr=
t -o package , it says</div><div><br>spdx_lookup module is not installed. T=
his can lead to an inaccurate licence detection. Please install it via<br>p=
ip install spdx_lookup<br>buildroot package name for awscrt: python-awscrt<=
br>Package: python-awscrt<br>Fetching package awscrt<br>ERROR: Could not fi=
nd package awscrt.<br>Check syntax inside the python package index:<br><a h=
ref=3D"https://pypi.python.org/pypi/">https://pypi.python.org/pypi/</a><br>=
<br>But the package is available=C2=A0at=C2=A0<a href=3D"https://pypi.org/p=
roject/awscrt/">https://pypi.org/project/awscrt/</a><br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Feb=
 2023 at 09:58, Maxim Kochetkov &lt;<a href=3D"mailto:fido_max@inbox.ru">fi=
do_max@inbox.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
<br>
On 09.02.2023 11:14, Sourabh Hegde wrote:<br>
&gt; Hello Maxim,<br>
&gt; <br>
&gt; Thanks for the explanation.<br>
&gt; <br>
&gt; When I tried this :=C2=A0utils/scanpypi awscrt awsiotsdk -o package ,=
=C2=A0 I am <br>
&gt; getting below error:<br>
&gt; <br>
&gt; utils/scanpypi:21: DeprecationWarning: the imp module is deprecated in=
 <br>
&gt; favour of importlib; see the module&#39;s documentation for alternativ=
e uses<br>
&gt;=C2=A0 =C2=A0 import imp<br>
&gt; Traceback (most recent call last):<br>
&gt;=C2=A0 =C2=A0 File &quot;utils/scanpypi&quot;, line 23, in &lt;module&g=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import six.moves.urllib.request<br>
&gt; ModuleNotFoundError: No module named &#39;six&#39;<br>
<br>
You have no &quot;six&quot; module installed for python. I have to install =
it <br>
first. For ubuntu: sudo apt install python3-six<br>
<br>
</blockquote></div>

--000000000000de596c05f440a605--

--===============0792890857193396043==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0792890857193396043==--
