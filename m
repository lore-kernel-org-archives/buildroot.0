Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CAFC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 10:22:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F51560F42
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 10:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F51560F42
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADE1183716;
	Fri,  3 Sep 2021 10:22:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AnyIYNqCJ_T3; Fri,  3 Sep 2021 10:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA0F18348C;
	Fri,  3 Sep 2021 10:22:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E1611BF40E
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 10:22:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 475D8834E3
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 10:22:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HxndrGFuzqK5 for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 10:21:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb147.aruba.it (smtpweb147.aruba.it [62.149.158.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DECC8348C
 for <buildroot@busybox.net>; Fri,  3 Sep 2021 10:21:57 +0000 (UTC)
Received: from smtpclient.apple ([151.34.157.101])
 by Aruba Outgoing Smtp  with ESMTPA
 id M6KRmqyuia4UMM6KTmuxoA; Fri, 03 Sep 2021 12:21:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1630664515; bh=PHsPxCSlxb7OAWoyQD0SI3yeOvdpoO3hqQ0Z7ze/zD8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=AsFijuZgeMO6P1b8PULgbL0NzCjQG25b4dH7tuPfWCUwhQTqEozL/sKW+RqnpWmRo
 uSUKXv5zH5hQYUY2nP9s7NZkYne/4SvQ2yquIBKvoGjTRRxt7/j6LDQERZcDSSNHWK
 gIPnEznxXl+eIwyf0uYsFEsHc4ZZL8R5O2CtS6YCQgGAlsTj5GyOMiWxveu+5H2fbS
 /dgb74MUYEVZYy0sEUGAEFoeULEuKV3Cxl3iIEWnVt4TNkWUCU+d90x0H3OwqY3V+l
 4Bf5M/Icq+dpQ5pVAOlLKsrJbEewqAKiL+jyTiA2LozAfxZkGS5A/ksTcJJk+jKyWm
 HypoksFFjpAeg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 3 Sep 2021 12:21:47 +0200
Message-Id: <30117DCC-D442-43F5-8388-384C8EE48769@benettiengineering.com>
References: <877dfyrwao.fsf@dell.be.48ers.dk>
In-Reply-To: <877dfyrwao.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfBU2cKRdBUcisyW7gzEC5CSgYqXkRAZxWT35cUPpWmSwkqMD4PbuhB+lKBxqV1TNTuSIvzZTYQvsch3tsTa71gQkJjOMH+IZSe9QGmnIY6j0E07deHal
 3E+DMdFBBAArHfu1BEHKR0t6FSL1yj7V2hiuKbTdCcFzR/CAWIngGTf2Jdeiwz1kYOPugKT6ur18Zz8VHBE4e44HVz/hExYRSEnvyFDB2E3uvktHx/CztVGF
 zP5KRdz04N4FLRebd2vZopOYC1YLCSIhol+2Zmjo+vgg2dJasQJKWXvM5jI9VnQ5yEpE3bgIR21ghvgAKGUueA==
Subject: Re: [Buildroot] What's wrong with patchwork
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: buildroot@busybox.net, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>
Content-Type: multipart/mixed; boundary="===============3339119315894334498=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>


--===============3339119315894334498==
Content-Type: multipart/alternative; boundary=Apple-Mail-031CCFE3-6A48-468C-A7F0-A596E0E0BF6C
Content-Transfer-Encoding: 7bit


--Apple-Mail-031CCFE3-6A48-468C-A7F0-A596E0E0BF6C
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,

> Il giorno 3 set 2021, alle ore 08:46, Peter Korsgaard <peter@korsgaard.com=
> ha scritto:
>=20
> =EF=BB=BF
>>=20
>>>>>> "Jeremy" =3D=3D Jeremy Kerr <jk@ozlabs.org> writes:
>=20
> Hi,
>=20
>>> I just noticed that my buildroot list filter is no longer working.
>>> The listid used to be:
>>>=20
>>> List-Id: Discussion and development of buildroot
>>> <buildroot.busybox.net>
>>>=20
>>> but now it is set to:
>>>=20
>>> List-Id: Discussion and development of buildroot
>>> <buildroot.lists.buildroot.org>
>>>=20
>>> It looks like buildroot list changed domains recently. Perhaps the
>>> subscription for incoming-buildroot@ didn't get moved over to the new
>>> setup?
>=20
>> Ah, that'd explain missing patches then (assuming delivery is
>> working...). Patchwork relies on the list ID to correlate mail to
>> projects. Since it doesn't know about the new list-id, it'll be
>> dropping those.
>=20
>> I'll update the list-id for the buildroot patchwork project.
>=20
> Sorry about this. The mailing list setup had a number of annoying issues
> (the busybox.net vs buildroot.org, how uclibc/busybox lists were also
> shown, TLS certificate not matching the hostname, ..) so we recently
> worked with the OSUOSL guys to fix it.
>=20
> We've had some teething issues, but I believe it is working now, if not
> let me know.
>=20
> With the changes, the list page
> (https://lists.buildroot.org/mailman/listinfo) now has correct TLS
> config and only shows the buildroot list and the List-id is
> buildroot.lists.buildroot.org.

This patch[1] still doesn=E2=80=99t show up.
Do I resend it?
Maybe other patches have been lost on patchwork. I don=E2=80=99t know if pat=
chwork works in polling or triggering.

[1]: https://lists.buildroot.org/pipermail/buildroot/2021-September/621975.h=
tml

Thank you
Best regards
Giulio Benetti

>=20
> --=20
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-031CCFE3-6A48-468C-A7F0-A596E0E0BF6C
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Peter,<br><div dir=3D"ltr"><br><blockquo=
te type=3D"cite">Il giorno 3 set 2021, alle ore 08:46, Peter Korsgaard &lt;p=
eter@korsgaard.com&gt; ha scritto:<br><br></blockquote></div><blockquote typ=
e=3D"cite"><div dir=3D"ltr">=EF=BB=BF<blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite"><blockquote=
 type=3D"cite"><span>"Jeremy" =3D=3D Jeremy Kerr &lt;jk@ozlabs.org&gt; write=
s:</span><br></blockquote></blockquote></blockquote></blockquote></blockquot=
e><span></span><br><span>Hi,</span><br><span></span><br><blockquote type=3D"=
cite"><blockquote type=3D"cite"><span>I just noticed that my buildroot list f=
ilter is no longer working.</span><br></blockquote></blockquote><blockquote t=
ype=3D"cite"><blockquote type=3D"cite"><span>The listid used to be:</span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span></span><br></blockquote></blockquote><blockquote type=3D"cite"><bl=
ockquote type=3D"cite"><span>List-Id: Discussion and development of buildroo=
t</span><br></blockquote></blockquote><blockquote type=3D"cite"><blockquote t=
ype=3D"cite"><span>&lt;buildroot.busybox.net&gt;</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span></span><b=
r></blockquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"ci=
te"><span>but now it is set to:</span><br></blockquote></blockquote><blockqu=
ote type=3D"cite"><blockquote type=3D"cite"><span></span><br></blockquote></=
blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>List-Id=
: Discussion and development of buildroot</span><br></blockquote></blockquot=
e><blockquote type=3D"cite"><blockquote type=3D"cite"><span>&lt;buildroot.li=
sts.buildroot.org&gt;</span><br></blockquote></blockquote><blockquote type=3D=
"cite"><blockquote type=3D"cite"><span></span><br></blockquote></blockquote>=
<blockquote type=3D"cite"><blockquote type=3D"cite"><span>It looks like buil=
droot list changed domains recently. Perhaps the</span><br></blockquote></bl=
ockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><span>subscript=
ion for incoming-buildroot@ didn't get moved over to the new</span><br></blo=
ckquote></blockquote><blockquote type=3D"cite"><blockquote type=3D"cite"><sp=
an>setup?</span><br></blockquote></blockquote><span></span><br><blockquote t=
ype=3D"cite"><span>Ah, that'd explain missing patches then (assuming deliver=
y is</span><br></blockquote><blockquote type=3D"cite"><span>working...). Pat=
chwork relies on the list ID to correlate mail to</span><br></blockquote><bl=
ockquote type=3D"cite"><span>projects. Since it doesn't know about the new l=
ist-id, it'll be</span><br></blockquote><blockquote type=3D"cite"><span>drop=
ping those.</span><br></blockquote><span></span><br><blockquote type=3D"cite=
"><span>I'll update the list-id for the buildroot patchwork project.</span><=
br></blockquote><span></span><br><span>Sorry about this. The mailing list se=
tup had a number of annoying issues</span><br><span>(the busybox.net vs buil=
droot.org, how uclibc/busybox lists were also</span><br><span>shown, TLS cer=
tificate not matching the hostname, ..) so we recently</span><br><span>worke=
d with the OSUOSL guys to fix it.</span><br><span></span><br><span>We've had=
 some teething issues, but I believe it is working now, if not</span><br><sp=
an>let me know.</span><br><span></span><br><span>With the changes, the list p=
age</span><br><span>(https://lists.buildroot.org/mailman/listinfo) now has c=
orrect TLS</span><br><span>config and only shows the buildroot list and the L=
ist-id is</span><br><span>buildroot.lists.buildroot.org.</span><br></div></b=
lockquote><div><br></div><div>This patch[1] still doesn=E2=80=99t show up.</=
div><div>Do I resend it?</div><div>Maybe other patches have been lost on pat=
chwork. I don=E2=80=99t know if patchwork works in polling or triggering.</d=
iv><div><br></div><div>[1]:&nbsp;<a href=3D"https://lists.buildroot.org/pipe=
rmail/buildroot/2021-September/621975.html">https://lists.buildroot.org/pipe=
rmail/buildroot/2021-September/621975.html</a></div><div><br></div><div>Than=
k you</div><div>Best regards</div><div>Giulio Benetti</div><br><blockquote t=
ype=3D"cite"><div dir=3D"ltr"><span></span><br><span>-- </span><br><span>Bye=
, Peter Korsgaard</span><br><span>__________________________________________=
_____</span><br><span>buildroot mailing list</span><br><span>buildroot@lists=
.buildroot.org</span><br><span>https://lists.buildroot.org/mailman/listinfo/=
buildroot</span><br></div></blockquote></body></html>=

--Apple-Mail-031CCFE3-6A48-468C-A7F0-A596E0E0BF6C--

--===============3339119315894334498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3339119315894334498==--
