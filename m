Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0582EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 14:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4641F81E90;
	Mon, 17 Jul 2023 14:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4641F81E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wj4nBs7HAGCE; Mon, 17 Jul 2023 14:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46A5C81E4A;
	Mon, 17 Jul 2023 14:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46A5C81E4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AADC81BF304
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 14:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FBFA81E8A
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 14:10:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FBFA81E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s_6955rkJj5O for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 14:10:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02B3981E4E
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02B3981E4E
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 14:10:19 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so7267415e87.2
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 07:10:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689603017; x=1692195017;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ll5IyW/aitkSdkU8hws6nRQg4oGL1UGCyWasFbEoaFs=;
 b=c2SevRseBvoSOYK1lJB//FNajPlSbSB8IcP4ezxvCUndhAxlE78E8mh4zY/qMOwQy+
 cJd+El90WpMzVUgG7LrDY8k3DgXeXJWbvihAOcRwtbxS2/tFBO9ynDEDwwA2gq+aunc1
 qnqwVMVy0LdYuzcqBKcNrUA7/v4C3hXMCPvRTbp57muYVVXlBNAwZ7dXIm1sW1Yo7UPH
 0IuOqm787y+m3bInaSus4W0728U6oHazkpBIP9mBGBbLZGERFK9gCDDg1jPfmJebUhc+
 5C/hifePXGRRo3fkkkYEzef/sZixBy+ZYAEGeMMjIvCLzG+w9kpVInizm5JWr2XImdwA
 nTMg==
X-Gm-Message-State: ABy/qLZFfO9VseKHYUJmhF/u2qfiEZ6FBb9MxXfKJBqXPSASIxrkdZZf
 GCOHedXNXpvvQFSX4Wg/Lqbt37w5V4Sas/+C1hjJUCP9eV1rrRgxX6k=
X-Google-Smtp-Source: APBJJlGqszBsr4CUqlxB5g2wTLzZAis4Mbkr0rZkfEdDZLZtWuEx7n/3kkmA1lDAGA3iTb+bb7Tw5lIT13Ole8o0OBs=
X-Received: by 2002:a05:6512:3c90:b0:4f1:3d7d:409e with SMTP id
 h16-20020a0565123c9000b004f13d7d409emr10159712lfv.0.1689603017132; Mon, 17
 Jul 2023 07:10:17 -0700 (PDT)
MIME-Version: 1.0
From: Andreas <andreasembbuild@gmail.com>
Date: Mon, 17 Jul 2023 16:10:05 +0200
Message-ID: <CAOLWrZ-zYdgpvg-UUrHb8-Y+dfSauONGxf+Uynjj0d7XQ2HFYQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689603017; x=1692195017;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ll5IyW/aitkSdkU8hws6nRQg4oGL1UGCyWasFbEoaFs=;
 b=JIchxnIL7XiMwX6CHPscPRwjP/1b+xx/9idCGKFWSgTGZmFNtcR2iNKetbyz+PBKob
 vcBElgfGPlzByaqgajJeZa+0TppePDypfC2uHfBYU4zBieqb6QNxeJwOIhptMJCo1LdL
 tylRo8MCXGnVeiBp0LRGYCcNlp+0ffxEnF5/rQuwW4+ykiZu2kXRefydUGHVwQLY+oNr
 UtHhSt3wNPntQFMrC6lYskRUqJfQxTnYp5ms6/HUIA3U0mXxbIF/4HQbGrBvmsWBjsjI
 5zULQU2wehrYKmvVQ+7sMYXbIV8aH2w1ecioLTC5BSojIWfNiF4EqxbPfmxBwqi4wS10
 bjKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JIchxnIL
Subject: [Buildroot] Missing dependencies
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
Content-Type: multipart/mixed; boundary="===============5613178615244346953=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5613178615244346953==
Content-Type: multipart/alternative; boundary="000000000000a5cf1d0600af5b52"

--000000000000a5cf1d0600af5b52
Content-Type: text/plain; charset="UTF-8"

Hi,

I am new to buildroot and I am trying to build the package
python-hatchling-1.18.0. However it fails with the following message:

* Getting dependencies for wheel...

ERROR Missing dependencies:
tomli>=1.2.2; python_version < '3.11'
make: *** [package/pkg-generic.mk:293:
/buildroot/output/build/python-hatchling-1.18.0/.stamp_built] Error 1

The python-hatchling.mk file looks as follows:
################################################################################
#
# python-hatchling
#
################################################################################

PYTHON_HATCHLING_VERSION = 1.18.0
PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
PYTHON_HATCHLING_SITE =
https://files.pythonhosted.org/packages/e3/57/87da2c5adc173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637
PYTHON_HATCHLING_SETUP_TYPE = pep517
PYTHON_HATCHLING_LICENSE = MIT
PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt

PYTHON_HATCHLING_DEPENDENCIES = \
python-tomli \
python-editables \
python-packaging \
python-pathspec \
python-pluggy \
python-trove-classifiers
HOST_PYTHON_HATCHLING_DEPENDENCIES = \
host-python-tomli \
host-python-editables \
host-python-packaging \
host-python-pathspec \
host-python-pluggy \
host-python-trove-classifiers

$(eval $(python-package))
$(eval $(host-python-package))

I do have a python-tomli.mk file therefore I am confused why I am seeing
this error. If I remove the tomli dependency from the pyproject.toml file
in hatchling (in output/build/python-hatchling-1.18.0) manually it
continoues the build.

dependencies = [
  "editables>=0.3",
  "packaging>=21.3",
  "pathspec>=0.10.1",
  "pluggy>=1.0.0",
  "tomli>=1.2.2; python_version < '3.11'",
  "trove-classifiers",
]

My impression is that my current buildroot setup has a problem to properly
interpret the line ` "tomli>=1.2.2; python_version < '3.11'"` maybe because
of an outdated package that I am not aware of. Any idea how to address this
issue and how to debug such an error in buildroot in future? I already
checked the manual, especially the section for python packages.

Regards,
Andreas

--000000000000a5cf1d0600af5b52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am new to buildroot and I am tryi=
ng to build the package python-hatchling-1.18.0. However it fails with the =
following message:</div><div><br></div><div>* Getting dependencies for whee=
l...<br><br>ERROR Missing dependencies:<br>	tomli&gt;=3D1.2.2; python_versi=
on &lt; &#39;3.11&#39;<br>make: *** [package/<a href=3D"http://pkg-generic.=
mk:293">pkg-generic.mk:293</a>: /buildroot/output/build/python-hatchling-1.=
18.0/.stamp_built] Error 1<br></div><div><br></div><div>The <a href=3D"http=
://python-hatchling.mk">python-hatchling.mk</a> file looks as follows:</div=
><div>#####################################################################=
###########<br>#<br># python-hatchling<br>#<br>############################=
####################################################<br><br>PYTHON_HATCHLIN=
G_VERSION =3D 1.18.0<br>PYTHON_HATCHLING_SOURCE =3D hatchling-$(PYTHON_HATC=
HLING_VERSION).tar.gz<br>PYTHON_HATCHLING_SITE =3D <a href=3D"https://files=
.pythonhosted.org/packages/e3/57/87da2c5adc173950ebe9f1acce4d5f2cd0a9607839=
92fd4879a899a0b637">https://files.pythonhosted.org/packages/e3/57/87da2c5ad=
c173950ebe9f1acce4d5f2cd0a960783992fd4879a899a0b637</a><br>PYTHON_HATCHLING=
_SETUP_TYPE =3D pep517<br>PYTHON_HATCHLING_LICENSE =3D MIT<br>PYTHON_HATCHL=
ING_LICENSE_FILES =3D LICENSE.txt<br><br>PYTHON_HATCHLING_DEPENDENCIES =3D =
\<br>	python-tomli \<br>	python-editables \<br>	python-packaging \<br>	pyth=
on-pathspec \<br>	python-pluggy \<br>	python-trove-classifiers <br>HOST_PYT=
HON_HATCHLING_DEPENDENCIES =3D \<br>	host-python-tomli \<br>	host-python-ed=
itables \<br>	host-python-packaging \<br>	host-python-pathspec \<br>	host-p=
ython-pluggy \<br>	host-python-trove-classifiers <br>	<br>$(eval $(python-p=
ackage))<br>$(eval $(host-python-package))<br></div><div><br></div><div>I d=
o have a <a href=3D"http://python-tomli.mk">python-tomli.mk</a> file theref=
ore I am confused why I am seeing this error. If I remove the tomli depende=
ncy from the pyproject.toml file in hatchling (in output/build/python-hatch=
ling-1.18.0) manually it continoues=C2=A0the build.</div><div><br></div><di=
v>dependencies =3D [<br>=C2=A0 &quot;editables&gt;=3D0.3&quot;,<br>=C2=A0 &=
quot;packaging&gt;=3D21.3&quot;,<br>=C2=A0 &quot;pathspec&gt;=3D0.10.1&quot=
;,<br>=C2=A0 &quot;pluggy&gt;=3D1.0.0&quot;,<br>=C2=A0 &quot;tomli&gt;=3D1.=
2.2; python_version &lt; &#39;3.11&#39;&quot;,<br>=C2=A0 &quot;trove-classi=
fiers&quot;,<br>]<br></div><div><br></div><div>My impression is that my cur=
rent buildroot setup has a problem to properly interpret the line ` &quot;t=
omli&gt;=3D1.2.2; python_version &lt; &#39;3.11&#39;&quot;` maybe because o=
f an outdated package that I am not aware of. Any idea how to address=C2=A0=
this issue and=C2=A0how to debug such an error in=C2=A0buildroot in future?=
 I already checked the manual, especially the section for python packages.<=
/div><div><br></div><div>Regards,</div><div>Andreas</div><div><br></div></d=
iv>

--000000000000a5cf1d0600af5b52--

--===============5613178615244346953==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5613178615244346953==--
