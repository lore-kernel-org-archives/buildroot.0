Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21408C5AD4E
	for <buildroot@archiver.kernel.org>; Sun,  9 Aug 2026 17:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF206066D;
	Sun,  9 Aug 2026 17:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sl8A-mQ7VTE6; Sun,  9 Aug 2026 17:57:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AB38660600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786298254;
	bh=jaiw6LBbvbAgJviswUth0ZcP+ruCi6x+4l6kDtQ+008=;
	h=From:Date:In-Reply-To:Cc:To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQ2nTYcHgMBoC8e4MtoRhuXGoXawtkXHuuE6ZascflgAYpxzs2rQdDcWGKqwTACuB
	 kh6X4+LIY6WMdqTHlnsJXvFRXgrD7N8lj8Di4cLFtsltjYCHY/hyTlIA5TNY6/O/+P
	 AIuUVzdQGP6lC9iNwgzCB0llAljxjsuThzh3m32yY23AJBwKzIxvrLeTwd/uouKx74
	 DIN1yS89bwouHipn1mV/OBhjeJT5aHD/jIuXkAO9EO1YTUNQbCCh7U12he2b4vyfWZ
	 +2TF1cONmkSOmXM35wNuScH7+CHE68hxTntAz3VwIzHhB7VjYib1+iIo8cRySQHYE+
	 I9q+mfQPmZoyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB38660600;
	Sun,  9 Aug 2026 17:57:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97D7A40A
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 17:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DF9A80D00
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 17:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMV8jChcl_UV for <buildroot@buildroot.org>;
 Sun,  9 Aug 2026 17:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72c; helo=mail-qk1-x72c.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2560580CED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2560580CED
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com
 [IPv6:2607:f8b0:4864:20::72c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2560580CED
 for <buildroot@buildroot.org>; Sun,  9 Aug 2026 17:57:31 +0000 (UTC)
Received: by mail-qk1-x72c.google.com with SMTP id
 af79cd13be357-92e57a753f9so90814685a.2
 for <buildroot@buildroot.org>; Sun, 09 Aug 2026 10:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786298251; x=1786903051;
 h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
 :message-id:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ci8x+3vkQYa0CqpKduti4P4RpNosWQ6PizOw6B/JsT8=;
 b=I/zApS+wzli9KuB5jjaW7M6fDUtXPfncoHftH0liNgSWHFdwteDlc5L0fVedcmclub
 smK6h33ty8xuGw6E1cZugX00b2tYIJbQl+kwgBFxG21ymyg0x1rohdWWLDCSEe1IO60u
 isCziXRW5BYGxGi6eKQz40wkY2b5FY4Gn3Mn1NIy63KzGCuSXSIY2NL+sehaV/viMx9e
 zz2Gy6KBoWUl97PMLfEvv6TkhjmE7O3ZEWxkoT1Cboeno9xn4waGMWbZfmOI3UEjln+u
 9Umn0Twty6Qn5I1Q/Q0VwhwTVp7dTjEsN2sfYEzJCdKhU8wjcX3HSqdEbkuSwDoFizsj
 0RVw==
X-Gm-Message-State: AOJu0YyJNWfNpMQv3FLaoJX2nj8DPkOPI8jVavP0HLiuCYep2nmOY5Zw
 ua1/2ApjINdu1e++e0ZfaZtBJlMZd5o7p+1mVygOCnFUJjIhQya87UkY
X-Gm-Gg: AR+sD12mUNp3FZVVmJSfmRQ4zc/VJSE+NXKqH9ZBieRBTukb4upqL7AEQ9sHNK4bTq/
 en7do/QY7CRgdY3olX80EpsMBNak3B72aZOX9jU0RCEovbfL3In0PnqZ39KytUjXQ6nZZfGYO4x
 18xFnenrUGZ1/1ynM9GzO9HuaJ1Z8JqdvoxT7R9ZoS4/v8e3qLwyCs3fUnyBWP4xSdi4gr5Vs8T
 m485JWTUjbghvzdV4bQ7PSIZaQyb2bGdfLNOf0X22p6f+oIVJKBcjHZq5sWiKo0ZwSLjvt/uXxJ
 dFJvm9GICZqlAOsWgySGWZEof92hVusv2UMRd4q8QM/sL7/nFBNzlvYBdsK2aFWsNPAXnOlB8zP
 +b60BWb9i/E9mJOTDBAAFtrDLTnQdT261kELSyiB+vUJftVswh6yEHHaEN6IXumEi5Dvm1Be9Uo
 AGw4KdEx0EoAVZAxkWUG7oSmpxBLAHqn/g39s7k9znc5AQoh9LAsyRGUg3MfT+zl1O4IZCj+7w4
 h1LLGBJuxX3
X-Received: by 2002:a05:620a:a10f:b0:92e:bd39:9993 with SMTP id
 af79cd13be357-936491af165mr3361138585a.31.1786298250539; 
 Sun, 09 Aug 2026 10:57:30 -0700 (PDT)
Received: from smtpclient.apple ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9366e03aac7sm614442285a.10.2026.08.09.10.57.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 09 Aug 2026 10:57:29 -0700 (PDT)
From: Alsey Miller <alseycmiller@gmail.com>
X-Google-Original-From: Alsey Miller <Alseycmiller@gmail.com>
Message-Id: <85954D5C-F875-4074-A24D-182D3301E905@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Date: Sun, 9 Aug 2026 13:57:18 -0400
In-Reply-To: <anXQGyU9dHYRMR0I@windsurf>
Cc: buildroot@buildroot.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260807002109.2479876-1-alseycmiller@gmail.com>
 <anXQGyU9dHYRMR0I@windsurf>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786298251; x=1786903051; darn=buildroot.org;
 h=references:to:cc:in-reply-to:date:subject:mime-version:content-type
 :message-id:from:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Ci8x+3vkQYa0CqpKduti4P4RpNosWQ6PizOw6B/JsT8=;
 b=PoAEJuefCmV2J8O7WR7L2/URuQTnrcQR6fpOp/+Mk2jOBo7uuEvsgVKWLJO47zPQzM
 YjaoU4/kvkpQwExihlsM7jO9RoyFkSwXMfgHMevzxTG8g/twpk+89ld2Q3DThReV8fPa
 RWzy1ZbGe26L8v4wi8qxc5f0XnDXlmngCuHQ06hbMEfYyyvZra2siT1H6K23Tn6Ng6k+
 OsBqI6SOTWnScnNCzBGPSeVOXwUZmECLg9cUL44tCnNAKLcyOYx4Qs+oLBRyIY6MCwOG
 HUMCPP3rJ16RSLdIqd8qmlM146x/dUTu7z5TktC7dFMPpFbyEaNCfujJuz6rEzwYIL5i
 EFWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=PoAEJuef
Subject: Re: [Buildroot] [PATCH] package/libxkbcommon: build libxkbregistry
 when libxml2 is available
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
Content-Type: multipart/mixed; boundary="===============0052257132487933798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0052257132487933798==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_19BC22B5-E1D4-49C7-8EAC-2378BF99EE43"


--Apple-Mail=_19BC22B5-E1D4-49C7-8EAC-2378BF99EE43
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Thomas,

Thanks for the review.

> Shouldn't this be associated with a change in the wine package to =
select BR2_PACKAGE_LIBXML2 when wayland support is enabled?

Yes =E2=80=94 and it turns out wine needs a bit more than that: wine.mk =
has no dependency on libxkbcommon at all, so wine + wayland without =
libxkbcommon fails on the XKBCOMMON_LIBS term of the very same configure =
test. v2 adds a second patch that selects both BR2_PACKAGE_LIBXKBCOMMON =
and BR2_PACKAGE_LIBXML2 when BR2_PACKAGE_WAYLAND is enabled, and adds =
libxkbcommon to WINE_DEPENDENCIES. libxml2 is only selected, not added =
to WINE_DEPENDENCIES, since wine does not link against it =E2=80=94 it =
only has to be in the configuration so libxkbcommon builds =
libxkbregistry.

> We would need your commit log to be extended to indicate since when =
this problem exists.

Done in v2. Short version: libxkbcommon has passed =
-Denable-xkbregistry=3Dfalse since 1791bc30a5 (1.0.1, Buildroot =
2020.11), wine's configure gained the XKBREGISTRY_LIBS term in its =
Wayland test in wine 9.0 (upstream d64ea8e4a6c9, Nov 2023), and wine.mk =
started passing --with-wayland in 7cb49e7712 ("package/wine: bump to =
version 9.19", Oct 2024) =E2=80=94 which is what turns the notice into a =
hard error.

So the breakage dates from 2024.11. 2025.02.x is affected: it has wine =
10.0 (XKBREGISTRY_LIBS check present), --with-wayland in wine.mk, and =
libxkbcommon 1.9.2 with xkbregistry disabled. 2025.05.x and 2025.08.x =
are in the same state. A backport to 2025.02.x is needed.

Best regards,
Alsey Coleman Miller IV

> On Aug 7, 2026, at 8:33=E2=80=AFAM, Thomas Petazzoni =
<thomas.petazzoni@bootlin.com> wrote:
>=20
> Hello Alsey,
>=20
> On Thu, Aug 06, 2026 at 08:21:09PM -0400, Alsey Coleman Miller wrote:
>> libxkbregistry is the keyboard layout catalogue half of the library. =
It
>> parses the XML layout registry and so needs libxml2, which is =
presumably
>> why it was disabled unconditionally rather than wired to a =
dependency.
>>=20
>> wine needs it. Its configure.ac requires XKBREGISTRY_LIBS alongside
>> wayland-client, wayland-scanner, xkbcommon and linux/input.h before =
it
>> will build the Wayland driver, and wine.mk passes --with-wayland for =
any
>> build with BR2_PACKAGE_WAYLAND - which turns that notice into a hard
>> error:
>>=20
>>  checking for wayland-client.h... yes
>>  checking for wl_display_connect in -lwayland-client... yes
>>  checking for wayland-scanner... .../host/bin/wayland-scanner
>>  checking for xkb_context_new in -lxkbcommon... yes
>>  checking for wayland-egl.h... yes
>>  checking for wl_egl_window_create in -lwayland-egl... yes
>>  configure: error: Wayland development files not found, the Wayland
>>    driver won't be supported.
>>  This is an error since --with-wayland was requested.
>>=20
>> Every other term of that test passes; only XKBREGISTRY_LIBS is empty, =
so
>> wine and wayland together could not be built on any architecture.
>>=20
>> Gated on BR2_PACKAGE_LIBXML2 rather than turned on outright, because
>> meson.build takes dependency('libxml-2.0') unconditionally once
>> enable-xkbregistry is set, so a target without libxml2 would fail to
>> configure.
>>=20
>> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
>=20
> The patch obviously looks good and relevant. However, I have two
> comments:
>=20
> - Shouldn't this be associated with a change in the wine package to
>  select BR2_PACKAGE_LIBXML2 when wayland support is enabled?
>=20
> - We would need your commit log to be extended to indicate since when
>  this problem exists. Indeed, since your change is a fix, we will
>  have to figure out whether we need to backport it to our LTS branch
>  2025.02.x. And for that, we need to understand if 2025.02.x is
>  affected by the problem or not.
>=20
> Thanks a lot in advance for your feedback!
>=20
> Best regards,
>=20
> Thomas
> --=20
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com <https://bootlin.com/>

--Apple-Mail=_19BC22B5-E1D4-49C7-8EAC-2378BF99EE43
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html aria-label=3D"message body"><head><meta http-equiv=3D"content-type" =
content=3D"text/html; charset=3Dutf-8"></head><body =
style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; =
line-break: after-white-space;"><div>Hi =
Thomas,</div><div><br></div><div>Thanks for the =
review.</div><div><br></div><div>&gt; Shouldn't this be associated with =
a change in the wine package to select BR2_PACKAGE_LIBXML2 when wayland =
support is enabled?</div><div><br></div><div>Yes =E2=80=94 and it turns =
out wine needs a bit more than that: wine.mk has no dependency on =
libxkbcommon at all, so wine + wayland without libxkbcommon fails on the =
XKBCOMMON_LIBS term of the very same configure test. v2 adds a second =
patch that selects both BR2_PACKAGE_LIBXKBCOMMON and BR2_PACKAGE_LIBXML2 =
when BR2_PACKAGE_WAYLAND is enabled, and adds libxkbcommon to =
WINE_DEPENDENCIES. libxml2 is only selected, not added to =
WINE_DEPENDENCIES, since wine does not link against it =E2=80=94 it only =
has to be in the configuration so libxkbcommon builds =
libxkbregistry.</div><div><br></div><div>&gt; We would need your commit =
log to be extended to indicate since when this problem =
exists.</div><div><br></div><div>Done in v2. Short version: libxkbcommon =
has passed -Denable-xkbregistry=3Dfalse since 1791bc30a5 (1.0.1, =
Buildroot 2020.11), wine's configure gained the XKBREGISTRY_LIBS term in =
its Wayland test in wine 9.0 (upstream d64ea8e4a6c9, Nov 2023), and =
wine.mk started passing --with-wayland in 7cb49e7712 ("package/wine: =
bump to version 9.19", Oct 2024) =E2=80=94 which is what turns the =
notice into a hard error.</div><div><br></div><div>So the breakage dates =
from 2024.11. 2025.02.x is affected: it has wine 10.0 (XKBREGISTRY_LIBS =
check present), --with-wayland in wine.mk, and libxkbcommon 1.9.2 with =
xkbregistry disabled. 2025.05.x and 2025.08.x are in the same state. A =
backport to 2025.02.x is needed.</div><div><br></div><div>Best =
regards,</div><div>Alsey Coleman Miller IV</div><div><br><blockquote =
type=3D"cite"><div>On Aug 7, 2026, at 8:33=E2=80=AFAM, Thomas Petazzoni =
&lt;thomas.petazzoni@bootlin.com&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div><meta charset=3D"UTF-8"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Hello Alsey,</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">On Thu, Aug 06, 2026 at 08:21:09PM -0400, =
Alsey Coleman Miller wrote:</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: =
solid;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; widows: 2; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-line: =
none; text-decoration-thickness: auto; text-decoration-style: =
solid;">libxkbregistry is the keyboard layout catalogue half of the =
library. It<br>parses the XML layout registry and so needs libxml2, =
which is presumably<br>why it was disabled unconditionally rather than =
wired to a dependency.<br><br>wine needs it. Its configure.ac requires =
XKBREGISTRY_LIBS alongside<br>wayland-client, wayland-scanner, xkbcommon =
and linux/input.h before it<br>will build the Wayland driver, and =
wine.mk passes --with-wayland for any<br>build with BR2_PACKAGE_WAYLAND =
- which turns that notice into a hard<br>error:<br><br>&nbsp;checking =
for wayland-client.h... yes<br>&nbsp;checking for wl_display_connect in =
-lwayland-client... yes<br>&nbsp;checking for wayland-scanner... =
.../host/bin/wayland-scanner<br>&nbsp;checking for xkb_context_new in =
-lxkbcommon... yes<br>&nbsp;checking for wayland-egl.h... =
yes<br>&nbsp;checking for wl_egl_window_create in -lwayland-egl... =
yes<br>&nbsp;configure: error: Wayland development files not found, the =
Wayland<br>&nbsp;&nbsp;&nbsp;driver won't be supported.<br>&nbsp;This is =
an error since --with-wayland was requested.<br><br>Every other term of =
that test passes; only XKBREGISTRY_LIBS is empty, so<br>wine and wayland =
together could not be built on any architecture.<br><br>Gated on =
BR2_PACKAGE_LIBXML2 rather than turned on outright, =
because<br>meson.build takes dependency('libxml-2.0') unconditionally =
once<br>enable-xkbregistry is set, so a target without libxml2 would =
fail to<br>configure.<br><br>Signed-off-by: Alsey Coleman Miller =
&lt;alseycmiller@gmail.com&gt;<br></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">The patch obviously looks good and =
relevant. However, I have two</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">comments:</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">- Shouldn't this be associated with a =
change in the wine package to</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">&nbsp;select BR2_PACKAGE_LIBXML2 when =
wayland support is enabled?</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">- We would need your commit log to be =
extended to indicate since when</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">&nbsp;this problem exists. Indeed, since =
your change is a fix, we will</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">&nbsp;have to figure out whether we need to =
backport it to our LTS branch</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">&nbsp;2025.02.x. And for that, we need to =
understand if 2025.02.x is</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">&nbsp;affected by the problem or =
not.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Thanks a lot in advance for your =
feedback!</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Best regards,</span><br style=3D"caret-color:=
 rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Thomas</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: 400; letter-spacing: =
normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">--<span =
class=3D"Apple-converted-space">&nbsp;</span></span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration-line: none; =
text-decoration-thickness: auto; text-decoration-style: solid;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Thomas Petazzoni, co-owner and CEO, =
Bootlin</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">Embedded Linux and Kernel engineering and =
training</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: 2; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration-line: none; text-decoration-thickness: auto; =
text-decoration-style: solid;"><a href=3D"https://bootlin.com/" =
style=3D"font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
orphans: 2; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-text-stroke-width: =
0px;">https://bootlin.com</a></div></blockquote></div><br></body></html>=

--Apple-Mail=_19BC22B5-E1D4-49C7-8EAC-2378BF99EE43--

--===============0052257132487933798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0052257132487933798==--
