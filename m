Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896C9C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 23:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A038D41CE4;
	Fri, 16 Feb 2024 23:09:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qVnFDTyfVKMf; Fri, 16 Feb 2024 23:09:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 023EC4011D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 023EC4011D;
	Fri, 16 Feb 2024 23:09:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 806201BF2EB
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 23:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6973D83E83
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 23:09:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xRI307m7WQYb for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 23:09:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89FDC83E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89FDC83E60
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89FDC83E60
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 23:09:12 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPA
 id b7KPr8AK0hJt7b7KPrQWcP; Sat, 17 Feb 2024 00:09:09 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 17 Feb 2024 00:09:08 +0100
Message-Id: <BA5C8834-E890-421E-97E6-AC00BAD5B424@benettiengineering.com>
References: <1881605.CQOukoFCf9@laptop>
In-Reply-To: <1881605.CQOukoFCf9@laptop>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
X-Mailer: iPhone Mail (21D61)
X-CMAE-Envelope: MS4xfA0zBwlERmX+O1tZaJVywHNty/Hpx80icKH6n6MqSNMD+jKkLAYwz0UWvJiSQ7WxRlFP6K49Mca0zgnRP1kTNqLlj9ZVTNxQcBcjuMxSPx9P29xdbVSH
 lgr7lTXos6va2iseHa62bmEgZS+Hb8eApRcJivwvaaq/PApT5Wgs36UtRKGLWIG/GTtYxRPPrbcuOtEXP2Nf7RLb8pKXapJDC0T8p3nwnhgP8ERBlKuTHlVs
 tOjFN3C7nN4DUGYYsnvUKg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708124949; bh=JdxiOpknaNYXVLBFvAIq+zoApltTePxx5U6a37kGoSE=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=INWnUle7mT0wJXXnOvPXj7Wk7d/kznEPdk0U3wZ/pmMKnzAD3aMndSDSvLQFenf8Y
 MBSK5JhJl26w4+cMDdqrKUKADdBe8P36ene1Xcvpkjqh5NNsT1TPFY723xIZxf4gSv
 fu7I0Ojyb5psUs3TmFFxlJHY7LN7rcH4lls/tK6o4uQibN3El2u5hEgllLk+z+Uua/
 W6ZtXbcjUtciIcQFSn+zPr/jI0AB6Rlp1J0yc/KJNOPu+P69FbuhVneE6eQjRdj732
 gH31gi5dZV74K1ylRvLNEExm6h/wNTpbJNsxrLrinOFE2ItHELfM8exzzke7k71bx5
 /mpMFnvEXJ7bQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=INWnUle7
Subject: Re: [Buildroot] [PATCH] configs/rock5b_defconfig: switch to
 mainline linux
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5430752155363797809=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5430752155363797809==
Content-Type: multipart/alternative; boundary=Apple-Mail-DDE61690-9D44-4624-AF2C-ED8E42A50155
Content-Transfer-Encoding: 7bit


--Apple-Mail-DDE61690-9D44-4624-AF2C-ED8E42A50155
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Kilian,

> Il giorno 16 feb 2024, alle ore 23:30, Kilian Zinnecker <kilian.zinnecker@=
mail.de> ha scritto:
>=20
> =EF=BB=BFHello Giulio,
>=20
> thanks for reviewing! I made changes according to your comments and sent a=
 v2
> of the patch.
>=20
> [--SNIP--]
>=20
>> It would be great if you switch to extlinux that is easier for debugging a=
nd
>> here you only override bootargs so you can add environment uboot variable=
s
>> file.
>=20
> Switching to extlinux played out very nicely: A lot of files became redund=
ant
> and this decluttered the board support.

Exactly :-)

> Thanks!

No problem

>=20
> I have a question though: Is it possible to specify in extlinux.conf, that=

> uboot shall fetch the kernel image and device tree via tftp? How would an
> example of such an extlinux.conf look like?

Here [0] they explain pretty well the difference between extlinux and boot.c=
md and they also point that they can be used together, of course depending o=
n the uboot environment variables.

Another chance is to specify:
BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE=3D=E2=80=9CuEnv.txt=E2=80=9D
And place the resulting uEnv.bin into genimage.cfg on a known address uboot w=
ill pick environment variables from.
This is another way to get what you were trying to do before using uEnv.txt,=
 but you need to find or specify the following 2 uboot options:
CONFIG_ENV_SIZE=3D0x2000
CONFIG_ENV_OFFSET=3D0xC0000
in a uboot.fragment
This ^^^ is an example and so in genimage.cfg you add something like:

partition uboot-env {
		image =3D "uboot-env.bin"
		offset =3D 768K
		size =3D 8K
	}

That way in the resulting image at 0xC0000(768K) uboot will find the environ=
ment variables including the commands to run if you specify bootcmd.

[0]: https://developer.toradex.com/linux-bsp/os-development/boot/distro-boot=
/#boot-sequence

Best regards
Giulio

>=20
> Best regards,
> Kilian
>=20
>=20

--Apple-Mail-DDE61690-9D44-4624-AF2C-ED8E42A50155
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Kilian,<div dir=3D"ltr"><br><blockquote t=
ype=3D"cite">Il giorno 16 feb 2024, alle ore 23:30, Kilian Zinnecker &lt;kil=
ian.zinnecker@mail.de&gt; ha scritto:<br><br></blockquote></div><blockquote t=
ype=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Hello Giulio,</span><br><span><=
/span><br><span>thanks for reviewing! I made changes according to your comme=
nts and sent a v2 </span><br><span>of the patch.</span><br><span></span><br>=
<span>[--SNIP--]</span><br><span></span><br><blockquote type=3D"cite"><span>=
It would be great if you switch to extlinux that is easier for debugging and=
</span><br></blockquote><blockquote type=3D"cite"><span>here you only overri=
de bootargs so you can add environment uboot variables</span><br></blockquot=
e><blockquote type=3D"cite"><span>file.</span><br></blockquote><span></span>=
<br><span>Switching to extlinux played out very nicely: A lot of files becam=
e redundant </span><br><span>and this decluttered the board support.</span><=
/div></blockquote><div><br></div><div>Exactly :-)</div><br><blockquote type=3D=
"cite"><div dir=3D"ltr"><span> Thanks!</span><br></div></blockquote><div><br=
></div><div>No problem</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><=
span></span><br><span>I have a question though: Is it possible to specify in=
 extlinux.conf, that </span><br><span>uboot shall fetch the kernel image and=
 device tree via tftp? How would an </span><br><span>example of such an extl=
inux.conf look like?</span><br></div></blockquote><div><br></div><div>Here [=
0] they explain pretty well the difference between extlinux and boot.cmd and=
 they also point that they can be used together, of course depending on the u=
boot environment variables.</div><div><br></div><div>Another chance is to sp=
ecify:</div><div><p class=3D"p1" style=3D"margin: 0px; font-stretch: normal;=
 line-height: normal; font-size-adjust: none; font-kerning: auto; font-varia=
nt-alternates: normal; font-variant-ligatures: normal; font-variant-numeric:=
 normal; font-variant-east-asian: normal; font-variant-position: normal; fon=
t-feature-settings: normal; font-optical-sizing: auto; font-variation-settin=
gs: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -webkit-text-siz=
e-adjust: auto;"><span class=3D"s1">BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SO=
URCE=3D=E2=80=9CuEnv.txt=E2=80=9D</span></p><p class=3D"p1" style=3D"margin:=
 0px; font-stretch: normal; line-height: normal; font-size-adjust: none; fon=
t-kerning: auto; font-variant-alternates: normal; font-variant-ligatures: no=
rmal; font-variant-numeric: normal; font-variant-east-asian: normal; font-va=
riant-position: normal; font-feature-settings: normal; font-optical-sizing: a=
uto; font-variation-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(=
0, 0, 0); -webkit-text-size-adjust: auto;"><span class=3D"s1">And place the r=
esulting uEnv.bin into genimage.cfg on a known address uboot will pick envir=
onment variables from.</span></p><p class=3D"p1" style=3D"margin: 0px; font-=
stretch: normal; line-height: normal; font-size-adjust: none; font-kerning: a=
uto; font-variant-alternates: normal; font-variant-ligatures: normal; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; font-feature-settings: normal; font-optical-sizing: auto; font-v=
ariation-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -=
webkit-text-size-adjust: auto;"><span class=3D"s1">This is another way to ge=
t what you were trying to do before using uEnv.txt, but you need to find or s=
pecify the following 2 uboot options:</span></p><p class=3D"p1" style=3D"mar=
gin: 0px; font-stretch: normal; line-height: normal; font-size-adjust: none;=
 font-kerning: auto; font-variant-alternates: normal; font-variant-ligatures=
: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fon=
t-variant-position: normal; font-feature-settings: normal; font-optical-sizi=
ng: auto; font-variation-settings: normal; caret-color: rgb(0, 0, 0); color:=
 rgb(0, 0, 0); -webkit-text-size-adjust: auto;"><span class=3D"s1">CONFIG_EN=
V_SIZE=3D0x2000</span></p><p class=3D"p1" style=3D"margin: 0px; font-stretch=
: normal; line-height: normal; font-size-adjust: none; font-kerning: auto; f=
ont-variant-alternates: normal; font-variant-ligatures: normal; font-variant=
-numeric: normal; font-variant-east-asian: normal; font-variant-position: no=
rmal; font-feature-settings: normal; font-optical-sizing: auto; font-variati=
on-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -webkit=
-text-size-adjust: auto;"><span class=3D"s1"></span></p><p class=3D"p1" styl=
e=3D"margin: 0px; font-stretch: normal; line-height: normal; font-size-adjus=
t: none; font-kerning: auto; font-variant-alternates: normal; font-variant-l=
igatures: normal; font-variant-numeric: normal; font-variant-east-asian: nor=
mal; font-variant-position: normal; font-feature-settings: normal; font-opti=
cal-sizing: auto; font-variation-settings: normal; caret-color: rgb(0, 0, 0)=
; color: rgb(0, 0, 0); -webkit-text-size-adjust: auto;"><span class=3D"s1">C=
ONFIG_ENV_OFFSET=3D0xC0000</span></p><p class=3D"p1" style=3D"margin: 0px; f=
ont-stretch: normal; line-height: normal; font-size-adjust: none; font-kerni=
ng: auto; font-variant-alternates: normal; font-variant-ligatures: normal; f=
ont-variant-numeric: normal; font-variant-east-asian: normal; font-variant-p=
osition: normal; font-feature-settings: normal; font-optical-sizing: auto; f=
ont-variation-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0=
); -webkit-text-size-adjust: auto;"><span class=3D"s1">in a uboot.fragment</=
span></p></div><div>This ^^^ is an example and so in genimage.cfg you add so=
mething like:</div><div><p class=3D"p1" style=3D"margin: 0px; font-stretch: n=
ormal; line-height: normal; font-size-adjust: none; font-kerning: auto; font=
-variant-alternates: normal; font-variant-ligatures: normal; font-variant-nu=
meric: normal; font-variant-east-asian: normal; font-variant-position: norma=
l; font-feature-settings: normal; font-optical-sizing: auto; font-variation-=
settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -webkit-te=
xt-size-adjust: auto;"><span class=3D"s1"><br></span></p><p class=3D"p1" sty=
le=3D"margin: 0px; font-stretch: normal; line-height: normal; font-size-adju=
st: none; font-kerning: auto; font-variant-alternates: normal; font-variant-=
ligatures: normal; font-variant-numeric: normal; font-variant-east-asian: no=
rmal; font-variant-position: normal; font-feature-settings: normal; font-opt=
ical-sizing: auto; font-variation-settings: normal; caret-color: rgb(0, 0, 0=
); color: rgb(0, 0, 0); -webkit-text-size-adjust: auto;"><span class=3D"s1">=
partition uboot-env {</span></p><p class=3D"p1" style=3D"margin: 0px; font-s=
tretch: normal; line-height: normal; font-size-adjust: none; font-kerning: a=
uto; font-variant-alternates: normal; font-variant-ligatures: normal; font-v=
ariant-numeric: normal; font-variant-east-asian: normal; font-variant-positi=
on: normal; font-feature-settings: normal; font-optical-sizing: auto; font-v=
ariation-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -=
webkit-text-size-adjust: auto;"><span class=3D"s1"><span class=3D"Apple-tab-=
span" style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-spa=
n" style=3D"white-space: pre;">	</span>image =3D "uboot-env.bin"</span></p>=
<p class=3D"p1" style=3D"margin: 0px; font-stretch: normal; line-height: nor=
mal; font-size-adjust: none; font-kerning: auto; font-variant-alternates: no=
rmal; font-variant-ligatures: normal; font-variant-numeric: normal; font-var=
iant-east-asian: normal; font-variant-position: normal; font-feature-setting=
s: normal; font-optical-sizing: auto; font-variation-settings: normal; caret=
-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -webkit-text-size-adjust: auto;">=
<span class=3D"s1"><span class=3D"Apple-tab-span" style=3D"white-space: pre;=
">	</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">=
	</span>offset =3D 768K</span></p><p class=3D"p1" style=3D"margin: 0px; font=
-stretch: normal; line-height: normal; font-size-adjust: none; font-kerning:=
 auto; font-variant-alternates: normal; font-variant-ligatures: normal; font=
-variant-numeric: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; font-feature-settings: normal; font-optical-sizing: auto; font=
-variation-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);=
 -webkit-text-size-adjust: auto;"><span class=3D"s1"><span class=3D"Apple-ta=
b-span" style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-spa=
n" style=3D"white-space: pre;">	</span>size =3D 8K</span></p><p class=3D"p1=
" style=3D"margin: 0px; font-stretch: normal; line-height: normal; font-size=
-adjust: none; font-kerning: auto; font-variant-alternates: normal; font-var=
iant-ligatures: normal; font-variant-numeric: normal; font-variant-east-asia=
n: normal; font-variant-position: normal; font-feature-settings: normal; fon=
t-optical-sizing: auto; font-variation-settings: normal; caret-color: rgb(0,=
 0, 0); color: rgb(0, 0, 0); -webkit-text-size-adjust: auto;"><span class=3D=
"s1"><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	</s=
pan>}</span></p><p class=3D"p1" style=3D"margin: 0px; font-stretch: normal; l=
ine-height: normal; font-size-adjust: none; font-kerning: auto; font-variant=
-alternates: normal; font-variant-ligatures: normal; font-variant-numeric: n=
ormal; font-variant-east-asian: normal; font-variant-position: normal; font-=
feature-settings: normal; font-optical-sizing: auto; font-variation-settings=
: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -webkit-text-size-=
adjust: auto;"><span class=3D"s1"><br></span></p><p class=3D"p1" style=3D"ma=
rgin: 0px; font-stretch: normal; line-height: normal; font-size-adjust: none=
; font-kerning: auto; font-variant-alternates: normal; font-variant-ligature=
s: normal; font-variant-numeric: normal; font-variant-east-asian: normal; fo=
nt-variant-position: normal; font-feature-settings: normal; font-optical-siz=
ing: auto; font-variation-settings: normal; caret-color: rgb(0, 0, 0); color=
: rgb(0, 0, 0); -webkit-text-size-adjust: auto;">That way in the resulting i=
mage at 0xC0000(768K) uboot will find the environment variables including th=
e commands to run if you specify bootcmd.</p><p class=3D"p1" style=3D"margin=
: 0px; font-stretch: normal; line-height: normal; font-size-adjust: none; fo=
nt-kerning: auto; font-variant-alternates: normal; font-variant-ligatures: n=
ormal; font-variant-numeric: normal; font-variant-east-asian: normal; font-v=
ariant-position: normal; font-feature-settings: normal; font-optical-sizing:=
 auto; font-variation-settings: normal; caret-color: rgb(0, 0, 0); color: rg=
b(0, 0, 0); -webkit-text-size-adjust: auto;"><br></p><p class=3D"p1" style=3D=
"margin: 0px; font-stretch: normal; line-height: normal; font-size-adjust: n=
one; font-kerning: auto; font-variant-alternates: normal; font-variant-ligat=
ures: normal; font-variant-numeric: normal; font-variant-east-asian: normal;=
 font-variant-position: normal; font-feature-settings: normal; font-optical-=
sizing: auto; font-variation-settings: normal; caret-color: rgb(0, 0, 0); co=
lor: rgb(0, 0, 0); -webkit-text-size-adjust: auto;">[0]:&nbsp;<a href=3D"htt=
ps://developer.toradex.com/linux-bsp/os-development/boot/distro-boot/#boot-s=
equence">https://developer.toradex.com/linux-bsp/os-development/boot/distro-=
boot/#boot-sequence</a></p><p class=3D"p1" style=3D"margin: 0px; font-stretc=
h: normal; line-height: normal; font-size-adjust: none; font-kerning: auto; f=
ont-variant-alternates: normal; font-variant-ligatures: normal; font-variant=
-numeric: normal; font-variant-east-asian: normal; font-variant-position: no=
rmal; font-feature-settings: normal; font-optical-sizing: auto; font-variati=
on-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0); -webkit=
-text-size-adjust: auto;"><br></p><p class=3D"p1" style=3D"margin: 0px; font=
-stretch: normal; line-height: normal; font-size-adjust: none; font-kerning:=
 auto; font-variant-alternates: normal; font-variant-ligatures: normal; font=
-variant-numeric: normal; font-variant-east-asian: normal; font-variant-posi=
tion: normal; font-feature-settings: normal; font-optical-sizing: auto; font=
-variation-settings: normal; caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);=
 -webkit-text-size-adjust: auto;">Best regards</p><p class=3D"p1" style=3D"m=
argin: 0px; font-stretch: normal; line-height: normal; font-size-adjust: non=
e; font-kerning: auto; font-variant-alternates: normal; font-variant-ligatur=
es: normal; font-variant-numeric: normal; font-variant-east-asian: normal; f=
ont-variant-position: normal; font-feature-settings: normal; font-optical-si=
zing: auto; font-variation-settings: normal; caret-color: rgb(0, 0, 0); colo=
r: rgb(0, 0, 0); -webkit-text-size-adjust: auto;">Giulio</p></div><br><block=
quote type=3D"cite"><div dir=3D"ltr"><span></span><br><span>Best regards,</s=
pan><br><span>Kilian</span><br><span></span><br><span></span><br></div></blo=
ckquote></body></html>=

--Apple-Mail-DDE61690-9D44-4624-AF2C-ED8E42A50155--

--===============5430752155363797809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5430752155363797809==--
