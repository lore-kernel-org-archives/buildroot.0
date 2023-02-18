Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3786C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 18 Feb 2023 10:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 320EF410B2;
	Sat, 18 Feb 2023 10:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 320EF410B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yfqWLcprSPNG; Sat, 18 Feb 2023 10:28:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41EAC409DD;
	Sat, 18 Feb 2023 10:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41EAC409DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 003931BF5DB
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:28:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE79D409DD
 for <buildroot@lists.busybox.net>; Sat, 18 Feb 2023 10:28:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE79D409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzZepmcO1Z6Y for <buildroot@lists.busybox.net>;
 Sat, 18 Feb 2023 10:28:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9DF40947
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F9DF40947
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 10:28:43 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-171b0cfc092so303108fac.4
 for <buildroot@buildroot.org>; Sat, 18 Feb 2023 02:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4wbhlvLrXddHoPBXQYA+aCX6T7nr4yEnHS+MDI71z88=;
 b=ycYMTG2q1DE798nU6jVHIBU0lBONendRnXhviqvCeVzpdYKzipfvpwrDMqcm5o5ECZ
 NySvSiR0xqs43SjkjR+xCjUawRAsymxD80Ua8+w85/ZrJG5+ief6L1tgC5+34hnatpYz
 n9PjMWPsq+khdf3IzD749jOay+IVxwmj+mbmcqDAJBSEXYAD7OuAP/FHBuRmRHppz9ux
 vhUW0/Hqjwo+1/WNBXd1x3CdV+aH3DOI9WRzUl31HErI/YuX6/ro5QEyzWaZjqAdaGLx
 wedMqrA/VIWmUeGqFycUF+pI8enBmUH4dZkr7Z4cCac38rxj1zspya3CW0Q8xJ4PCbr/
 xCBw==
X-Gm-Message-State: AO0yUKWlb+KZ9thlfTYA8ohoc5OZIxXOdeGyLUtplUewNC9MDl4sI18V
 YGoc2OAL67U/WKoLwIxPJEJdGvPHlwHI1rUUGSD89SA8
X-Google-Smtp-Source: AK7set/iqNjb1+jMjz3gdKuQ0jiyt2dEPVPONj14F2tGJvy9ZzXGS5oMsFypeSi26/3pSzii939boWdVnKUdEuuDapA=
X-Received: by 2002:a05:6870:a18b:b0:16e:8b95:8548 with SMTP id
 a11-20020a056870a18b00b0016e8b958548mr656926oaf.208.1676716122956; Sat, 18
 Feb 2023 02:28:42 -0800 (PST)
MIME-Version: 1.0
References: <CADYjeStw7HOAxA_ipNUNW4EsQzUZQydhW+Uaa8_UusE_wisy-g@mail.gmail.com>
In-Reply-To: <CADYjeStw7HOAxA_ipNUNW4EsQzUZQydhW+Uaa8_UusE_wisy-g@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Sat, 18 Feb 2023 11:28:33 +0100
Message-ID: <CADYjeSu9k+yqBH4D+-VWxEHuZA2njPZPwLNBx-BVNaSqWA1n-w@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4wbhlvLrXddHoPBXQYA+aCX6T7nr4yEnHS+MDI71z88=;
 b=en8eNz0sYoR+QwrQiQhYAV8iENVPt16bYGANbudZ5GVGDNTLpLsQN5we/6ZoMS2VGu
 avvr5OoDC8e9qAgfZQYUlB2+LW8NFo/FX8qurc/lPVEhn4e2DVmr1/DytaX5rXXPSCPs
 YaU/ciQ8iaefn5CBnBiONAFhJici0Qmx490MiDKvkeIQZxWQBwKZgZW/oTCMUrRKX8mn
 5BY+SwfHC5LRBkh/Iw2frz+EvsdryiMh1iM+P6MFFqdb/0rjWisokHQA5P1m6pWi0MCu
 HGDo1xh7tEIIW497yWwkoCMtOXLRSaxnEO9X07rer64hioYhYvWfOl+RZySYY93l5BRY
 GZbg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=en8eNz0s
Subject: Re: [Buildroot] Missing curl binary
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
Content-Type: multipart/mixed; boundary="===============0945601526140385451=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0945601526140385451==
Content-Type: multipart/alternative; boundary="000000000000e5e71205f4f6e4cd"

--000000000000e5e71205f4f6e4cd
Content-Type: text/plain; charset="UTF-8"

Can anyone please let me know how to resolve this?

On Fri, Feb 17, 2023, 16:52 Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello,
>
> I am trying to include curl binary in my image. I have
> selected BR2_PACKAGE_LIBCURL=y , BR2_PACKAGE_LIBCURL_CURL=y in the Config.
> But still the curl binary is not installed in the target. Can anyone please
> let me know what is the issue here and how to resolve it?
>
> Thank you,
> Sourabh
>

--000000000000e5e71205f4f6e4cd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can anyone please let me know how to resolve this?</div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Feb 17, 2023, 16:52 Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail=
.com">hrsourabh011@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex"><div dir=3D"ltr">Hello,<br><div><br></div><div>I am trying to incl=
ude curl binary in my image. I have selected=C2=A0BR2_PACKAGE_LIBCURL=3Dy ,=
=C2=A0BR2_PACKAGE_LIBCURL_CURL=3Dy in the Config. But still the curl binary=
 is not installed in the target. Can anyone please let me know what is the =
issue here and how to resolve it?</div><div><br></div><div>Thank you,</div>=
<div>Sourabh</div></div>
</blockquote></div>

--000000000000e5e71205f4f6e4cd--

--===============0945601526140385451==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0945601526140385451==--
