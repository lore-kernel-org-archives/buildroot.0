Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1598BC001B0
	for <buildroot@archiver.kernel.org>; Wed, 16 Aug 2023 05:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4385641BAE;
	Wed, 16 Aug 2023 05:44:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4385641BAE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t2xxku2tURZT; Wed, 16 Aug 2023 05:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0563D41D67;
	Wed, 16 Aug 2023 05:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0563D41D67
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 710A31BF407
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 05:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4753E41D67
 for <buildroot@lists.busybox.net>; Wed, 16 Aug 2023 05:44:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4753E41D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3bXFlbYvYAj1 for <buildroot@lists.busybox.net>;
 Wed, 16 Aug 2023 05:44:29 +0000 (UTC)
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D170E41BAE
 for <buildroot@buildroot.org>; Wed, 16 Aug 2023 05:44:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D170E41BAE
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-56c4c4e822eso4541779eaf.3
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 22:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692164667; x=1692769467;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1rZ4G5XjMbM3ru9neSlDcML/lkb8wHlSQuHfYUNCpF0=;
 b=AyzuwpzyTUEf9jG7QDNj0OSRdMDrJNPEXcjQf4/xzGYTZxjAur5X68wIpWuvGg1y29
 SPPNRVKIN3GPj2uYQxan/ctAVVgHo+EE98YSi8HhKWiXixJAE+YbnDDNsJ1KjQ+nXiL2
 1/IM5poDOFi4pSp4nbGUrQfuPKUjdOvz/zJ+hpA870drdLp5uLEic73alox+aMt03VxA
 WLLS1DQuL0pUcVJPj40XNP7FIrjD0cbrDs5/zUW5G/M0uvUZ8BmAR2HDD4QTylsAl8iT
 iLwQhhY7fYDhvZcbBSz58QIMUUuPPh9nqLhv2D1E9BANILenwWqI/Ym7I5poqoQwa9Xv
 K9Lg==
X-Gm-Message-State: AOJu0YywEuvu9dv/MdnSfogXskOWDqblSwkN40APgD4EWTse76tK8K66
 ACjR9BIVSSUeit8ejV6+pfnrk862M0s/o7lMaInyCvko
X-Google-Smtp-Source: AGHT+IEnpWF1BbUU/Dp0Zxin0sHcwlruhK7/U2M7bQX+RANZMJhKhzUr310SnLSomJyJUQzqRxiGeU15jIjxKDZ0Uyo=
X-Received: by 2002:a4a:6c56:0:b0:56e:5a8e:654f with SMTP id
 u22-20020a4a6c56000000b0056e5a8e654fmr862957oof.8.1692164667516; Tue, 15 Aug
 2023 22:44:27 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeStRcjcU0o3u1y7h5H3p6=of8ZB5+5-zPKdO7r9=Y1bMJA@mail.gmail.com>
In-Reply-To: <CADYjeStRcjcU0o3u1y7h5H3p6=of8ZB5+5-zPKdO7r9=Y1bMJA@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 16 Aug 2023 07:44:16 +0200
Message-ID: <CADYjeStqc2-PSZ3oOm_tXxg1pA_WG2hRi1m2Gfo+U6Zp9TbXtQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692164667; x=1692769467;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1rZ4G5XjMbM3ru9neSlDcML/lkb8wHlSQuHfYUNCpF0=;
 b=ZXl7xe5h4d8OI6EEOcI0PUi2QWurzgZ9wW5tONrEdiWWDqcngaxhOHsEgBTSg5MmKz
 EbwwayKZ1CAB90FEcGFs2oxMfIxuQ8xFfmOaRQ7pGtv7jkCStJjfbYlukBVULII15KWa
 fKJxJMxfQUrkKHn4De0rLc/76VXYyByLo0pV5taptNt6EL4c9PngO2mmPXSYFnCPzZV4
 M8YsPxFuZm6teJ9kiSGnedmNBr3tGlTivY6cWO5dMsNL1fQTLSQoEFyYHMClQT0baGF9
 TKkIJE0vRAMav3XILyswCzRZx2K8FWGgyVNMeya+IDZ5tjugV4lFgGfMqJFa2XRspegp
 YDWA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZXl7xe5h
Subject: Re: [Buildroot] Error while generating buildroot package using
 scanpypi tool
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
Content-Type: multipart/mixed; boundary="===============1597894128553803722=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1597894128553803722==
Content-Type: multipart/alternative; boundary="000000000000e8ada0060303c95d"

--000000000000e8ada0060303c95d
Content-Type: text/plain; charset="UTF-8"

Can anyone please provide an update on this?
Your support would be much appreciated.

Best Regards,
Sourabh

On Tue, 15 Aug 2023 at 17:23, Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello All,
>
> I am trying to generate a Buildroot package for a Python package available
> from https://pypi.org/ using utils/scanpypi tool.
>
> utils/scanpypi loguru black -o package/
>
> But this is giving an error:
>
> Traceback (most recent call last):
>   File "utils/scanpypi", line 743, in <module>
>     main()
>   File "utils/scanpypi", line 691, in main
>     package.load_setup()
>   File "utils/scanpypi", line 299, in load_setup
>     s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
>   File "/usr/lib/python3.8/imp.py", line 296, in find_module
>     raise ImportError(_ERR_MSG.format(name), name=name)
> ImportError: No module named 'setup'
>
> I have installed python3-setuptools and  pip3 install setuptools. Still
> the same error.
>
> Can anyone please let me know what is the issue here and how to resolve it?
>
> Thanks in advance.
>
>

--000000000000e8ada0060303c95d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can anyone please provide an update on this?=C2=A0<br><div=
>Your support would be much appreciated.</div><div><br></div><div>Best Rega=
rds,</div><div>Sourabh</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, 15 Aug 2023 at 17:23, Sourabh Hegde &=
lt;<a href=3D"mailto:hrsourabh011@gmail.com">hrsourabh011@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Hello All,<div><br></div><div>I am trying to generate a Buildroot =
package for a Python package available from=C2=A0<a href=3D"https://pypi.or=
g/" target=3D"_blank">https://pypi.org/</a> using utils/scanpypi tool.=C2=
=A0</div><div><br></div><div>utils/scanpypi loguru black -o package/<br></d=
iv><div><br></div><div>But this=C2=A0is giving an error:</div><div><br></di=
v><div>Traceback (most recent call last):<br>=C2=A0 File &quot;utils/scanpy=
pi&quot;, line 743, in &lt;module&gt;<br>=C2=A0 =C2=A0 main()<br>=C2=A0 Fil=
e &quot;utils/scanpypi&quot;, line 691, in main<br>=C2=A0 =C2=A0 package.lo=
ad_setup()<br>=C2=A0 File &quot;utils/scanpypi&quot;, line 299, in load_set=
up<br>=C2=A0 =C2=A0 s_file, s_path, s_desc =3D imp.find_module(&#39;setup&#=
39;, [self.tmp_extract])<br>=C2=A0 File &quot;/usr/lib/python3.8/imp.py&quo=
t;, line 296, in find_module<br>=C2=A0 =C2=A0 raise ImportError(_ERR_MSG.fo=
rmat(name), name=3Dname)<br>ImportError: No module named &#39;setup&#39;<br=
></div><div><br></div><div>I have installed python3-setuptools and=C2=A0=C2=
=A0pip3 install setuptools. Still the same error.</div><div><br></div><div>=
Can anyone please let me know what is the issue here and how to resolve it?=
</div><div><br></div><div>Thanks in advance.</div><div><br></div></div>
</blockquote></div>

--000000000000e8ada0060303c95d--

--===============1597894128553803722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1597894128553803722==--
