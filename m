Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF4BDD743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6155160BCA;
	Wed, 20 Nov 2024 21:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yRXVHSrSL0ZV; Wed, 20 Nov 2024 21:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AAE4607D5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AAE4607D5;
	Wed, 20 Nov 2024 21:24:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE459970
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC025607D5
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:24:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z3ZLoaDg9fS8 for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:24:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a42; helo=mail-vk1-xa42.google.com;
 envelope-from=pholden@nklabs.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3D69A605C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D69A605C7
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3D69A605C7
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:24:13 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id
 71dfb90a1353d-50d32d82bd8so74321e0c.1
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 13:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732137852; x=1732742652;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UGnZznUpRhAOH/Y4u7iL0QvFxalqPvo6yFmqwesEDEQ=;
 b=C9BqWCbsNI3GwC40v+l+mVR3ERRqYtPxPPbuJyfNuL9GN0uS9gFOF4xWXyFUqL9nAi
 NVG627B6Oa3gDeYcjDoo7NlHcdUnSTdRDjgzQ2i8/jN8liUdLZcdYbvFwVrzAUe1VysG
 2kOUn8oYWKlIAEWKQ6oQxJSGgXAQDom+vZo0zd+Hwc9TILKEAOnJ7FVWSVbwsICIE9i5
 FSP8eCmTet9mK6FIWKdfsPY1SkU3MG0aNcirhjkI5RcDlbrRy15a5aEcgqE/w8FGh1sl
 PBA+dcBwOCf1L5MrIE0AcWvPXMQ7QMLt7GWeDpCsFpT//+OL2H6yZaeomTeyMeSjicVF
 GYTw==
X-Gm-Message-State: AOJu0YwrIq5cHia27HjPMYFBlKaL36P18ColY8hmVQBVElIZ+wIWR6dO
 gymCsaH1owXrc2EsvbUB+gLGbakKYc/qNlLsSSpmIcI6d8qlYRymWknXJMeyCIv68NQDClGkRyJ
 CfGtbWLq+BPjUqPJr+MXYD3MnPkaw7BY3SMVoLbzwuoOonxFAPqsXxnBg
X-Google-Smtp-Source: AGHT+IHB8iaRKuaSMLsHHfTCtUgBOWUad/BwJEsnCbOcYsSsdJx9bRA0bl1sjmsJ5EI4wAQvSzPE7KEYQ6p+a1372zo=
X-Received: by 2002:a05:6122:168b:b0:50d:4285:1409 with SMTP id
 71dfb90a1353d-514cf8bead9mr4641971e0c.6.1732137852469; Wed, 20 Nov 2024
 13:24:12 -0800 (PST)
MIME-Version: 1.0
From: Patricia Holden <pholden@nklabs.com>
Date: Wed, 20 Nov 2024 16:24:02 -0500
Message-ID: <CAJ6EmCfeCT6uAJ-F9x4+MmWbiik2Jp162oWDiinb7urth5eO-A@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nklabs.com; s=google; t=1732137852; x=1732742652; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UGnZznUpRhAOH/Y4u7iL0QvFxalqPvo6yFmqwesEDEQ=;
 b=dNegRcPtcuphTPlxd042ZjNV6IfC8gUci0X+WSNl2cyKx8dI+CfRirdgN1iA0xoAV1
 1wEiN7tSU0LiTd8tkGhyL9ALOE9f7RLfl2xviP1NXYIsaPfN/H0yoA8ktrZly+J5Qsyt
 9myCRI/xmBg2IcfWbxSCnC+7wnJIWMiy2Ncu2XRYSJEHa+j5tk6AUfLlJXKKSbAFfy/p
 zF1NfFGshe2MloKOXqkF8eVBKJb4aDKLUnxvq/AuA2KODEYNTy6w/M3oVt/inGHi11l1
 5C4V9eV3VDf81WsHx0q/KCwT+MkqOdFZ5uFW8V4w/jrl0C9Nnf6nuQ/L0TXTMZMmCfvE
 tVnw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=nklabs.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=nklabs.com header.i=@nklabs.com header.a=rsa-sha256
 header.s=google header.b=dNegRcPt
Subject: [Buildroot] python-gevent package failing for me
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
Content-Type: multipart/mixed; boundary="===============4953521289956241272=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4953521289956241272==
Content-Type: multipart/alternative; boundary="0000000000006619ff06275ec548"

--0000000000006619ff06275ec548
Content-Type: text/plain; charset="UTF-8"

I'm working with the latest drop, 2024.11-rc1.  I need to have
python-gevents package so I added the following:

Config.in:

config BR2_PACKAGE_PYTHON_GEVENT
bool "python-gevent"
select BR2_PACKAGE_PYTHON_GREENLET
help
 GEvent event loop for python3.11

 https://pypi.org/project/gevent/

python-gevents.mk:

################################################################################
#
# python-gevent
#
################################################################################

PYTHON_GEVENT_VERSION = 24.11.1
PYTHON_GEVENT_SITE =
https://files.pythonhosted.org/packages/ab/75/a53f1cb732420f5e5d79b2563fc3504d22115e7ecfe7966e5cf9b3582ae7
PYTHON_GEVENT_SOURCE = gevent-$(PYTHON_GEVENT_VERSION).tar.gz
PYTHON_GEVENT_SETUP_TYPE = setuptools
PYTHON_GEVENT_LICENSE = MIT
PYTHON_GEVENT_LICENSE_FILES = LICENSE
PYTHON_GEVENT_ENV = GEVENTSETUP_EMBED_LIBEV=0 GEVENTSETUP_EMBED_CARES=0
PYTHON_GEVENT_DEPENDENCIES = libev c-ares

$(eval $(python-package))

I am getting the following error when building with this package:


ERROR Missing dependencies:
cffi>=1.17.1; platform_python_implementation == "CPython"
make[1]: *** [package/pkg-generic.mk:289:
/home/pholden/Projects/BR2024-11/edvotek-edvocycler3/buildroot-2024.11-rc1/output/build/python-gevent-24.11.1/.stamp_built]
Error 1
make: *** [Makefile:83: _all] Error 2

There is a comment in the python-gevents description about this error:


   - If you see ValueError: ("Expected ',' or end-of-list in", "cffi >=
   1.11.5 ; sys_platform == 'win32' and platform_python_implementation ==
   'CPython'", 'at', " ; sys_platform == 'win32' and
   platform_python_implementation == 'CPython'"), the version of setuptools
   is too old. Install a more recent version of setuptools.



Have you run into this problem?  Do you have a patch for python-gevents for
BR2024.11-rc1?

Thanks!

--0000000000006619ff06275ec548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m working with the latest drop, 2024.11-rc1.=C2=A0 I=
 need to have python-gevents package so I added the following:<div><br></di=
v><div>Config.in:</div><div><br></div><div>config BR2_PACKAGE_PYTHON_GEVENT=
<br>	bool &quot;python-gevent&quot;<br>	select BR2_PACKAGE_PYTHON_GREENLET<=
br>	help<br>	 =C2=A0GEvent event loop for python3.11<br><br>	 =C2=A0<a href=
=3D"https://pypi.org/project/gevent/">https://pypi.org/project/gevent/</a><=
br></div><div><br></div><div><a href=3D"http://python-gevents.mk">python-ge=
vents.mk</a>:</div><div><br></div><div>####################################=
############################################<br>#<br># python-gevent<br>#<b=
r>#########################################################################=
#######<br><br>PYTHON_GEVENT_VERSION =3D 24.11.1<br>PYTHON_GEVENT_SITE =3D =
<a href=3D"https://files.pythonhosted.org/packages/ab/75/a53f1cb732420f5e5d=
79b2563fc3504d22115e7ecfe7966e5cf9b3582ae7">https://files.pythonhosted.org/=
packages/ab/75/a53f1cb732420f5e5d79b2563fc3504d22115e7ecfe7966e5cf9b3582ae7=
</a><br>PYTHON_GEVENT_SOURCE =3D gevent-$(PYTHON_GEVENT_VERSION).tar.gz<br>=
PYTHON_GEVENT_SETUP_TYPE =3D setuptools<br>PYTHON_GEVENT_LICENSE =3D MIT<br=
>PYTHON_GEVENT_LICENSE_FILES =3D LICENSE<br>PYTHON_GEVENT_ENV =3D GEVENTSET=
UP_EMBED_LIBEV=3D0 GEVENTSETUP_EMBED_CARES=3D0<br>PYTHON_GEVENT_DEPENDENCIE=
S =3D libev c-ares<br><br>$(eval $(python-package))<br></div><div><br></div=
><div>I am getting the following error when building with this package:</di=
v><div><br></div><div><br>ERROR Missing dependencies:<br>	cffi&gt;=3D1.17.1=
; platform_python_implementation =3D=3D &quot;CPython&quot;<br>make[1]: ***=
 [package/<a href=3D"http://pkg-generic.mk:289">pkg-generic.mk:289</a>: /ho=
me/pholden/Projects/BR2024-11/edvotek-edvocycler3/buildroot-2024.11-rc1/out=
put/build/python-gevent-24.11.1/.stamp_built] Error 1<br>make: *** [Makefil=
e:83: _all] Error 2<br></div><div><br></div><div>There is a comment in the =
python-gevents description about this error:</div><div><br></div><div><ul c=
lass=3D"gmail-p-rich_text_list gmail-p-rich_text_list__bullet gmail-p-rich_=
text_list--nested" style=3D"box-sizing:inherit;margin:0px;padding:0px;list-=
style-type:none;color:rgb(29,28,29);font-family:Slack-Lato,Slack-Fractions,=
appleLogo,sans-serif;font-size:15px;font-variant-ligatures:common-ligatures=
;background-color:rgb(248,248,248)"><li style=3D"box-sizing:inherit;margin-=
bottom:0px;margin-left:28px">If you see=C2=A0<code class=3D"gmail-c-mrkdwn_=
_code" style=3D"box-sizing:inherit;font-variant-ligatures:none;word-break:n=
ormal;border-radius:3px;padding:2px 3px 1px;font-size:12px;line-height:1.50=
001;font-family:Monaco,Menlo,Consolas,&quot;Courier New&quot;,monospace">Va=
lueError: (&quot;Expected &#39;,&#39; or end-of-list in&quot;, &quot;cffi &=
gt;=3D 1.11.5 ; sys_platform =3D=3D &#39;win32&#39; and platform_python_imp=
lementation =3D=3D &#39;CPython&#39;&quot;, &#39;at&#39;, &quot; ; sys_plat=
form =3D=3D &#39;win32&#39; and platform_python_implementation =3D=3D &#39;=
CPython&#39;&quot;)</code>, the version of setuptools is too old. Install a=
 more recent version of setuptools.</li></ul><br class=3D"gmail-Apple-inter=
change-newline"></div><div><br></div><div>Have you run into this problem?=
=C2=A0 Do you have a patch for python-gevents for BR2024.11-rc1?</div><div>=
<br></div><div>Thanks!</div></div>

--0000000000006619ff06275ec548--

--===============4953521289956241272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4953521289956241272==--
