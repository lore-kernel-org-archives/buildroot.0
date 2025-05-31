Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBC2C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 18:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0ED040641;
	Sat, 31 May 2025 18:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kG-lZgM6x1H; Sat, 31 May 2025 18:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF25940638
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF25940638;
	Sat, 31 May 2025 18:16:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5975235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 18:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7127607FA
 for <buildroot@buildroot.org>; Sat, 31 May 2025 18:16:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8Zj2oByG-pD for <buildroot@buildroot.org>;
 Sat, 31 May 2025 18:16:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1133; helo=mail-yw1-x1133.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02EE86072A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02EE86072A
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02EE86072A
 for <buildroot@buildroot.org>; Sat, 31 May 2025 18:16:10 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7086dcab64bso28487257b3.1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 11:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748715370; x=1749320170;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J/1jPJ394t09koCANIUn0za1y0ZqKjPKlVO9e4Ip+kk=;
 b=XMqFXuIdhdTbxYGlwpWpkng/F1J8MwEIIuk7ilLAKDXGm6aZLWooc73LggVf5p+CJk
 SOvWFiBpt7sCZ/GF3bVZtrGzc/ef78r3mSeCeK46pG/07MrnQq6vo98q1G5FIUQa/qFa
 D2WEuIGu8Ozf1HPtgLygLxltdB8V3zZso5YaNRgjEorZQYDL0FTLTmz12EDR4bhne36y
 9ZDhvBb6y+BhY/4ceFrvgjwkv+dE7ON/22E9aAyHQFInmyq8fgav+ZxIThSbrWduAvh9
 TRizASRvHM9OT3G3moY7dvP74lo9hM5+Ka6meb4uu0qqiy0YcIdhcONT8oykn2Pgstdt
 jeeg==
X-Gm-Message-State: AOJu0YzmhcepiEgfC0jWP5SJUuVKSRieHTh+5ejdrjWHtqNDZMJE2dVP
 pTDCwazvZz+glZnGbAzU/eB73DJM9QTs7sg85KjoUZ2KZ3ZKMtYfVSaW2WR3D8faozwcEeE4vFv
 My+zsNUjU8OKDxWjExx4pTnzjEDtREPU0tA==
X-Gm-Gg: ASbGncuuoQFLcItpt27WctBx3i7Hhg53jdL/WmQvJZlUylO3qnIDC0yyhszctmMSlju
 H+Cc5IfODeMLu4AfEmOG8iwD4+pdS0rTAMYRjZ1r829OdSZSnlqQtpFRiREZyghqP1Yx9cK1/0j
 9t3iTWhYvpoK1jcLZnSEtyIJrP9Ku3xolKpbn9/NRNPMOQSM9VCvOgWiY9M+1XhyNQrQ==
X-Google-Smtp-Source: AGHT+IGARfJJV4gljN/we82BiXmDXe4a5MBA033HQWQs6FTMV6dyPGpwAXzpVFRc96zocvsIgbDl4uH+0dw/FPSoU2s=
X-Received: by 2002:a05:690c:4512:b0:70e:15e7:59bf with SMTP id
 00721157ae682-71097c56f78mr37252827b3.15.1748715369504; Sat, 31 May 2025
 11:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <CACmEUZ=evS-cmamNZEJZpdzwmzoeo2=662kdP5JtDGVtsMPNMQ@mail.gmail.com>
In-Reply-To: <CACmEUZ=evS-cmamNZEJZpdzwmzoeo2=662kdP5JtDGVtsMPNMQ@mail.gmail.com>
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Date: Sat, 31 May 2025 20:15:46 +0200
X-Gm-Features: AX0GCFsIlCNP0oSaWsWX1OKxxl6CdDFMtE8IAmwJYJQPmoTJKTmFqLv5Vk4WMW8
Message-ID: <CA+R_dep4CDxx4Kw5KT7imLFtOM7sXH2E=W47TxYKztaNJgFrNw@mail.gmail.com>
To: monish moni <vkmoni18@gmail.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748715370; x=1749320170; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=J/1jPJ394t09koCANIUn0za1y0ZqKjPKlVO9e4Ip+kk=;
 b=dSsGwmDXniFWdfx7l0dsd+NqmteBAUCI+fDQ1/MSkSnSIP4OKnloLy/oroDopMNdGp
 Cr39GzZcaOyIQaTfof/hKMmt3DvOhwXQWib4gvu6Kt1V5VxMstvzVGHyn5KmNG5WZ+83
 X3Hix8Ga6Yl004YedPNP47PxnFdif9oEG8gdLYJ4Olyz92QkeL0pg8IMzDhjo06kyQ43
 qHMwcQctzxxHzPloPuwD5fPtKseL9ZfYdicJNdpZN7I3esxr2osaVxEv2Fr4REwNhGzd
 nN0kQfyuMdGa1zocghUf/yj8jSfO9yXG0tq0+e47F0Z2BsayhIrVOtF7jGQvIAh6Pp4N
 AYJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dSsGwmDX
Subject: Re: [Buildroot] [PATCH v3 00/12] Bump Qt6 to 6.9.0,
 add and fix packages
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0999782917717538779=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0999782917717538779==
Content-Type: multipart/alternative; boundary="00000000000069a4b40636728691"

--00000000000069a4b40636728691
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Monish,

Thanks for you feedback. I'll try to keep fixes and bumps separated in the
future.

I'll follow your suggestions in the next iteration of the version bump to
6.9.0

Regards,
Roy

l=C3=B8r. 31. mai 2025 kl. 11:42 skrev monish moni <vkmoni18@gmail.com>:

> Hi Thomas and Roy,
>
> Thanks for the insightful discussion on the Qt6 version bump and related
> fixes.
>
> Just wanted to suggest a possible way to improve the patch series
> structure and clarity:
>
> - If the fixes apply to both the current Qt6 version (e.g., 6.8.1 or
> 6.8.2) **and** 6.9.0, consider **splitting the series into two logical
> parts**:
>   1. **Fixes for existing Qt6 version** in Buildroot
>   2. **Version bump + new packages** (qt6speech, qt6sensors, etc.)
>
> This approach ensures:
> - Fixes get applied faster, even if the version bump takes more review
> time.
> - Reviewers can better isolate regressions or improvements between
> versions.
>
> Optionally, in the commit messages, it might help to explicitly say:
> > "Tested with Qt 6.8.1 and 6.9.0"
> or
> > "Applies to current Buildroot Qt6 version as well"
>
> This helps clarify applicability and avoids ambiguity.
>
> Thanks again for the work! Qt6 support is getting stronger with each
> iteration.
>
> Best regards,
> Monish Kumar
> https://github.com/VK-Monish
> vkmoni18@gmail.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--00000000000069a4b40636728691
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Monish,</div><div><br></div><div>Thanks for you fe=
edback. I&#39;ll try to keep fixes and bumps separated in the future.</div>=
<div><br></div><div>I&#39;ll follow your suggestions in the next iteration =
of the version bump to 6.9.0</div><div><br></div><div>Regards,</div><div>Ro=
y</div></div><br><div class=3D"gmail_quote gmail_quote_container"><div dir=
=3D"ltr" class=3D"gmail_attr">l=C3=B8r. 31. mai 2025 kl. 11:42 skrev monish=
 moni &lt;<a href=3D"mailto:vkmoni18@gmail.com">vkmoni18@gmail.com</a>&gt;:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
">Hi Thomas and Roy,<br><br>Thanks for the insightful discussion on the Qt6=
 version bump and related fixes.<br><br>Just wanted to suggest a possible w=
ay to improve the patch series structure and clarity:<br><br>- If the fixes=
 apply to both the current Qt6 version (e.g., 6.8.1 or 6.8.2) **and** 6.9.0=
, consider **splitting the series into two logical parts**:<br>=C2=A0 1. **=
Fixes for existing Qt6 version** in Buildroot<br>=C2=A0 2. **Version bump +=
 new packages** (qt6speech, qt6sensors, etc.)<br><br>This approach ensures:=
<br>- Fixes get applied faster, even if the version bump takes more review =
time.<br>- Reviewers can better isolate regressions or improvements between=
 versions.<br><br>Optionally, in the commit messages, it might help to expl=
icitly say:<br>&gt; &quot;Tested with Qt 6.8.1 and 6.9.0&quot; =C2=A0<br>or=
 =C2=A0<br>&gt; &quot;Applies to current Buildroot Qt6 version as well&quot=
;<br><br>This helps clarify applicability and avoids ambiguity.<br><br>Than=
ks again for the work! Qt6 support is getting stronger with each iteration.=
<br><br>Best regards, =C2=A0<br>Monish Kumar =C2=A0<br><a href=3D"https://g=
ithub.com/VK-Monish" target=3D"_blank">https://github.com/VK-Monish</a> =C2=
=A0<br><a href=3D"mailto:vkmoni18@gmail.com" target=3D"_blank">vkmoni18@gma=
il.com</a><br></div>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--00000000000069a4b40636728691--

--===============0999782917717538779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0999782917717538779==--
