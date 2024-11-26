Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD2AD6553E
	for <buildroot@archiver.kernel.org>; Tue, 26 Nov 2024 18:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B04A66FAB6;
	Tue, 26 Nov 2024 18:10:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wbfd7nWD_McX; Tue, 26 Nov 2024 18:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D3A460685
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D3A460685;
	Tue, 26 Nov 2024 18:10:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67FFB1DA8
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 486AC4DF56
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNDvRO78Q2kM for <buildroot@buildroot.org>;
 Tue, 26 Nov 2024 18:10:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 459E24EB95
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 459E24EB95
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 459E24EB95
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 18:10:37 +0000 (UTC)
Received: from [10.30.147.173] (unknown [37.166.97.95])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 178E12003ED;
 Tue, 26 Nov 2024 19:10:31 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Brandon Maier <brandon.maier@gmail.com>
CC: Robin Jarry <robin@jarry.cc>, <buildroot@buildroot.org>
Date: Tue, 26 Nov 2024 19:10:32 +0100
Message-ID: <19369aaf5c0.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <CADwxmTk+-1moJHWyPXsxrgN+aiG0biNCU-m86a+Rguw04SDaJg@mail.gmail.com>
References: <20241119205901.58762-1-vjardin@free.fr>
 <CADwxmTktxHDhbw56oraJFHrNknUD+sqNvbAD8EpOEJHKs-5vDQ@mail.gmail.com>
 <q75xktmldvlans2dyvm2ssodi7bzjcpqb7yyjw6mowmb4i5yhc@em7opvmlgjgm>
 <CADwxmTk+-1moJHWyPXsxrgN+aiG0biNCU-m86a+Rguw04SDaJg@mail.gmail.com>
User-Agent: AquaMail/1.53.0 (build: 105300523)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732644634;
 bh=t1UJWheoU8SmbqwoBk054EsInwa8DnWprxn3YTxXxQk=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=I8kzREx1g6jWzMhIr0lOmV9472q+pr3wsoBl9gsZrJ9SX+Tw/BTZQBc53P/UsptRx
 XJo7XI9WqoAZNElUgPvrHzW2WmwI2kltcIbMSmQEKdbW9xnCQzBWCv3CPZsYMtiXZ9
 Z8nch6TZTfzYA7eXmYBHi97f376yCogJAZSwxIIAhtWDfSgSvNKagOcJsS6sB7m3An
 /thsdbE4xj7TumEiisu3s4yE8dfqQd9XlPsFn4xIHa30DT/AKNKIAx9O1Hkj7+eZUd
 pnSCQunp8OS+o16B7Yy3PJKQSNttc+zEyRqL7MjrufrmkbSxcPOlgTzU9L/d+b6bBd
 m8OESFD38B7hw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=I8kzREx1
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: h files only into
 sysroot
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
Content-Type: multipart/mixed; boundary="===============4686045638796974712=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4686045638796974712==
Content-Type: multipart/alternative; boundary="19369aaf6d731f72856e227081"

This is a multi-part message in MIME format.
--19369aaf6d731f72856e227081
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Brandon,

Le 26 novembre 2024 15:17:44 Brandon Maier <brandon.maier@gmail.com> a écrit :

> Hi Vincent
>
> On Thu, Nov 21, 2024 at 6:20 PM Vincent Jardin <vjardin@free.fr> wrote:
>>
>> Hi Brandon,
>>
>> On Thu, Nov 21, 2024 at 07:49:15AM UTC, Brandon Maier wrote:
>>>> define $(2)_INSTALL_STAGING_CMDS
>>>>    $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
>>>> -               $$(NINJA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install
>>>> +               $$(MESON) install -C $$($$(PKG)_SRCDIR)/build 
>>>> --tags=runtime,devel
>>>
>>> Perhaps a new variable like $(PKG)_MESON_INSTALL_STAGING_TAGS.
>>
>> I guess I get your point, just to confirm and then I'll submit an
>> update: do you suggess,
>>
>> - if there is a $(PKG)_INSTALL_STAGING = YES
>> and
>> a $(PKG)_MESON_INSTALL_STAGING_TAGS = YES
>> then, we should use the meson's tags ?
>
> This one, my naming was a bit off though. It would make more sense to
> drop the "STAGING" from the name, i.e. `$(PKG)_MESON_INSTALL_TAGS`. So
> that it can apply to both STAGING and TARGET.
>
> Then you end up with something like
>
>  $(2)_MESON_INSTALL_TAGS ?= YES
>  ...
>  define $(2)_INSTALL_STAGING_CMDS
>         $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) DESTDIR=$$(STAGING_DIR) \
>                 $$(MESON) install -C \
>                  $$($$(PKG)_SRCDIR)/build $(if $(filter
> YES,$($(PKG)_MESON_INSTALL_TAGS)),--tags=runtime,devel)
>  endef
>
> And a similar change for INSTALL_TARGET_CMDS
>
>>
>> or
>>
>> - if there is a $(PKG)_MESON_INSTALL_STAGING_TAGS = YES
>> whatever the $(PKG)_INSTALL_STAGING = YES/NO/not set
>> then, we should use the meson's tags ?
>>
>> I am just concerned about two conflicting interpertations. Are there any
>> other cases from Buildroot that could inspire to apply the same logic ?
>
> I based my snippet above on package/pkg-kconfig.mk 
> "_KCONFIG_SUPPORTS_DEFCONFIG"
>
> Sorry for the delayed reply Vincent, thank you for looking into this!

OK I'll submit an update.

Regarding the documentation, should the update of 
https://buildroot.org/downloads/manual/adding-packages-meson.txt be part of 
a same commit or should it be another change set ?

Best regards,
   Vincent

>
>
> - Brandon
>
>>
>> best regards,
>> Vincent


--19369aaf6d731f72856e227081
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi Brandon,</div><div dir=3D"auto"><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 26 novembre 2024 15:17:44 Brandon Maier &lt;brandon.ma=
ier@gmail.com&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">Hi Vincent</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Thu, Nov 21, 2024 at 6:20=E2=80=AFPM Vincent Jardin &l=
t;vjardin@free.fr&gt; wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Hi Brandon,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">On Thu, Nov 21, 2024 at 07:49:15AM UTC, Brandon Maier wro=
te:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #9933CC; padding-left: 0.75ex;">
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #669900; padding-left: 0.75ex;">
<div dir=3D"auto">define $(2)_INSTALL_STAGING_CMDS</div>
<div dir=3D"auto">&nbsp; &nbsp; $$(TARGET_MAKE_ENV) $$($$(PKG)_NINJA_ENV) D=
ESTDIR=3D$$(STAGING_DIR) \</div>
<div dir=3D"auto">- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $$(NIN=
JA) $$(NINJA_OPTS) -C $$($$(PKG)_SRCDIR)/build install</div>
<div dir=3D"auto">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; $$(MES=
ON) install -C $$($$(PKG)_SRCDIR)/build --tags=3Druntime,devel</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Perhaps a new variable like $(PKG)_MESON_INSTALL_STAGING_=
TAGS.</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I guess I get your point, just to confirm and then I'll s=
ubmit an</div>
<div dir=3D"auto">update: do you suggess,</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">- if there is a $(PKG)_INSTALL_STAGING =3D YES</div>
<div dir=3D"auto">and</div>
<div dir=3D"auto">a $(PKG)_MESON_INSTALL_STAGING_TAGS =3D YES</div>
<div dir=3D"auto">then, we should use the meson's tags ?</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">This one, my naming was a bit off though. It would make m=
ore sense to</div>
<div dir=3D"auto">drop the "STAGING" from the name, i.e. `$(PKG)_MESON_INST=
ALL_TAGS`. So</div>
<div dir=3D"auto">that it can apply to both STAGING and TARGET.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Then you end up with something like</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">&nbsp; $(2)_MESON_INSTALL_TAGS ?=3D YES</div>
<div dir=3D"auto">&nbsp; ...</div>
<div dir=3D"auto">&nbsp; define $(2)_INSTALL_STAGING_CMDS</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;$$(TARGET_MAKE_ENV) $$(=
$$(PKG)_NINJA_ENV) DESTDIR=3D$$(STAGING_DIR) \</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;$$(MESON) install -C \</div>
<div dir=3D"auto">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; $$($$(PKG)_SRCDIR)/build $(if $(filter</div>
<div dir=3D"auto">YES,$($(PKG)_MESON_INSTALL_TAGS)),--tags=3Druntime,devel)=
</div>
<div dir=3D"auto">&nbsp; endef</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">And a similar change for INSTALL_TARGET_CMDS</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">or</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">- if there is a $(PKG)_MESON_INSTALL_STAGING_TAGS =3D YES=
</div>
<div dir=3D"auto">whatever the $(PKG)_INSTALL_STAGING =3D YES/NO/not set</d=
iv>
<div dir=3D"auto">then, we should use the meson's tags ?</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I am just concerned about two conflicting interpertations=
. Are there any</div>
<div dir=3D"auto">other cases from Buildroot that could inspire to apply th=
e same logic ?</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">I based my snippet above on package/pkg-kconfig.mk "_KCON=
FIG_SUPPORTS_DEFCONFIG"</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Sorry for the delayed reply Vincent, thank you for lookin=
g into this!</div></blockquote></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">OK I'll submit an update.</div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">Regarding the documentation, should the update of <a href=3D"ht=
tps://buildroot.org/downloads/manual/adding-packages-meson.txt">https://bui=
ldroot.org/downloads/manual/adding-packages-meson.txt</a> be part of a same=
 commit or should it be another change set ?</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Best regards,</div><div dir=3D"auto">&nbsp; &nbsp;Vinc=
ent&nbsp;</div><div dir=3D"auto"><br></div><div id=3D"aqm-original" style=
=3D"color: black;" dir=3D"auto"><blockquote type=3D"cite" class=3D"gmail_qu=
ote" style=3D"margin: 0 0 0 0.75ex; border-left: 1px solid #808080; padding=
-left: 0.75ex;"><div dir=3D"auto"></div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">- Brandon</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto"><br></div>
<div dir=3D"auto">best regards,</div>
<div dir=3D"auto">Vincent</div>
</blockquote>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--19369aaf6d731f72856e227081--


--===============4686045638796974712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4686045638796974712==--

