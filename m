Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D32DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:39:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81F95611AF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 08:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81F95611AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3315C40392;
	Tue,  9 Nov 2021 08:39:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LTxXHFeRy8z7; Tue,  9 Nov 2021 08:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5801E403EF;
	Tue,  9 Nov 2021 08:39:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFBA71BF3B9
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDBE960621
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 08:39:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pqpiUOoyd_d9 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 08:39:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id 919A9605FA
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 08:39:04 +0000 (UTC)
Received: from smtpclient.apple ([151.68.167.252])
 by Aruba Outgoing Smtp  with ESMTPA
 id kMeemlCAUDBs2kMegm3Hkk; Tue, 09 Nov 2021 09:39:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636447142; bh=V4Alj3wMa7c6fgjXJNtWvGdwXKMBIVuMt3uAKFSQztM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=hAB3ayku6iyXAjXAyyAlRezP3Cl+TXY8B9TAfZiydHO/LTP4rudO4FH4mrFoMuuk+
 b+cIm0oaFF8gVtQoc3bncV3sMdVUksRqbojLITomCZ47SMukftAHsUnYtXQesUbvHC
 6NvyXqLqJnsgr6w+xwd2S0ldsSu9r8LydSuMY5h3zGT83O7/alNSrFVos2xw+ATchY
 06En7ISI1tDrMOhUjdsc4R+314tKFYfattzY2tAfh6DpeTyCIXbxiBfAbkC8QsdTH/
 x1gFav78PtvjPeXN90fPQ4chM7xaEqwFHA34Xm8TlLlMct/vdit7mih70DBHjkTtzI
 6BGhFbJMEr7NA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 9 Nov 2021 09:38:54 +0100
Message-Id: <B4721363-6522-40D2-AA25-B015E2BD5C43@benettiengineering.com>
References: <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
In-Reply-To: <eea83befc9a6f40dad4efa7a4ae019de@walle.cc>
To: Michael Walle <michael@walle.cc>
X-Mailer: iPhone Mail (18H107)
X-CMAE-Envelope: MS4wfDzGnnfq3fuHhF+E/6GHgbTgRGhVlqVtX65Nipihl8Ueiqmof84SP5Ls6tux5qS+/NcGIae+7Y7PTsnlhs6CDEqWaNTz3HT63DH7cPrXaSUmTT5paRPq
 M00mWY67n1n9tXwbbQ8SQYPM/sT4sLgfjfQ9vfF/YoFxue0cYPXAmDSjGoIkNxDjvqOmDAFAfoW2PX1GD7UQF9RCq/PQmu0/YXwLSEEdXAJygLNnXcDriDWa
 VMZ7T2zDqwtuYbMqkC+UbRww4S/ooDWEcAtFGbBQNgR/54l250Sn1XXOgMxmBgru9N1LlYok9yUYQXPgmrTqJAlEAOZqRm+nNZgje0epzZn+G4Q/SuysQEql
 kanAYi0uwddjJpS+3ZorJbRcXHpQEuVeM/ZXw8mbv5iR8QPQiQ3m+g6m1dJnbVveH7r+mcHNZW4Fn82SDmpsWTLNkGeu/aOhtRYRkOBAKCWp/gEQUgHoP8Io
 bQVFaFHaNxYX/wWRIYYT6wFJQ61AsGvH0dEeXQ==
Subject: Re: [Buildroot] [PATCH 7/7] board/kontron/smarc-sal28/genimage.cfg:
 fix option suffix
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 =?utf-8?Q?Micha=C5=82_=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org, Luca Ceresoli <luca@lucaceresoli.net>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============3699735955154783588=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3699735955154783588==
Content-Type: multipart/alternative; boundary=Apple-Mail-0BA162EC-F942-46F7-AD6F-C07A846DD199
Content-Transfer-Encoding: 7bit


--Apple-Mail-0BA162EC-F942-46F7-AD6F-C07A846DD199
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Michael, All,

> Il giorno 9 nov 2021, alle ore 09:05, Michael Walle <michael@walle.cc> ha s=
critto:
>=20
> =EF=BB=BFAm 2021-11-09 00:05, schrieb Giulio Benetti:
>> Option 'offset =3D 4k' must be 'option =3D 4K'.
>=20
> Why is this is a 'must'? Apparently it works, no?

This is a standard I=E2=80=99ve proposed and it=E2=80=99s been accepted by c=
ommitting all the 102 patches.
There is not an existing standard and I=E2=80=99ve created one, that=E2=80=99=
s all.

> So if anything
> it is for unifying; but even then it's moving in the wrong
> direction. There is no "K" prefix in si units. Stictly speaking
> there is no "KB"; there is a "kB" or a "KiB".

Here we had 2 choices using genimage =E2=80=9CK=E2=80=9D or =E2=80=9Ck=E2=80=
=9D. I went for =E2=80=9CK=E2=80=9D since the most of the files had =E2=80=9C=
K=E2=80=9D.
And anyway both =E2=80=9CK=E2=80=9D and =E2=80=9Ck=E2=80=9D are not that goo=
d, but it=E2=80=99s not our fault, it depends on genimage input format.

Yann already explained the differences between notations here:
https://lists.buildroot.org/pipermail/buildroot/2021-November/627885.html

You can follow-up the thread and the motivations on such thing.

Feel free to propose a modification on this topic since it=E2=80=99s =E2=80=9C=
fresh=E2=80=9D. I have to integrate a bit the manual and write a Linter for t=
his kind of files so it=E2=80=99s better I know it early.

Thank you
Best regards
Giulio Benetti
Benetti Engineering sas

>=20
> Anyway. I'll let the buildroot maintainers decide on this.
>=20
> -michael

--Apple-Mail-0BA162EC-F942-46F7-AD6F-C07A846DD199
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Michael, All,<br><div dir=3D"ltr"><br><b=
lockquote type=3D"cite">Il giorno 9 nov 2021, alle ore 09:05, Michael Walle &=
lt;michael@walle.cc&gt; ha scritto:<br><br></blockquote></div><blockquote ty=
pe=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>Am 2021-11-09 00:05, schrieb Giu=
lio Benetti:</span><br><blockquote type=3D"cite"><span>Option 'offset =3D 4k=
' must be 'option =3D 4K'.</span><br></blockquote><span></span><br><span>Why=
 is this is a 'must'? Apparently it works, no?</span></div></blockquote><div=
><br></div><div>This is a standard I=E2=80=99ve proposed and it=E2=80=99s be=
en accepted by committing all the 102 patches.</div><div>There is not an exi=
sting standard and I=E2=80=99ve created one, that=E2=80=99s all.</div><br><b=
lockquote type=3D"cite"><div dir=3D"ltr"><span> So if anything</span><br><sp=
an>it is for unifying; but even then it's moving in the wrong</span><br><spa=
n>direction. There is no "K" prefix in si units. Stictly speaking</span><br>=
<span>there is no "KB"; there is a "kB" or a "KiB".</span><br></div></blockq=
uote><div><br></div><div>Here we had 2 choices using genimage =E2=80=9CK=E2=80=
=9D or =E2=80=9Ck=E2=80=9D. I went for =E2=80=9CK=E2=80=9D since the most of=
 the files had =E2=80=9CK=E2=80=9D.</div><div>And anyway both =E2=80=9CK=E2=80=
=9D and =E2=80=9Ck=E2=80=9D are not that good, but it=E2=80=99s not our faul=
t, it depends on genimage input format.</div><div><br></div><div>Yann alread=
y explained the differences between notations here:</div><div><a href=3D"htt=
ps://lists.buildroot.org/pipermail/buildroot/2021-November/627885.html">http=
s://lists.buildroot.org/pipermail/buildroot/2021-November/627885.html</a></d=
iv><div><br></div><div>You can follow-up the thread and the motivations on s=
uch thing.</div><div><br></div><div>Feel free to propose a modification on t=
his topic since it=E2=80=99s =E2=80=9Cfresh=E2=80=9D. I have to integrate a b=
it the manual and write a Linter for this kind of files so it=E2=80=99s bett=
er I know it early.</div><div><br></div><div>Thank you</div><div>Best regard=
s</div><div>Giulio Benetti</div><div>Benetti Engineering sas</div><br><block=
quote type=3D"cite"><div dir=3D"ltr"><span></span><br><span>Anyway. I'll let=
 the buildroot maintainers decide on this.</span><br><span></span><br><span>=
-michael</span><br></div></blockquote></body></html>=

--Apple-Mail-0BA162EC-F942-46F7-AD6F-C07A846DD199--

--===============3699735955154783588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3699735955154783588==--
