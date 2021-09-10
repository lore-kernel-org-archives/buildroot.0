Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56289C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 19:41:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6223F611BF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 19:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6223F611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCFA837C0;
	Fri, 10 Sep 2021 19:41:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t556eBDKu_0f; Fri, 10 Sep 2021 19:41:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B7D883A53;
	Fri, 10 Sep 2021 19:41:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2F301BF352
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 19:40:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A23EB83A53
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 19:40:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xhoy7RwRaDWW for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 19:40:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5B85837C0
 for <buildroot@busybox.net>; Fri, 10 Sep 2021 19:40:55 +0000 (UTC)
Received: from smtpclient.apple ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPA
 id OmOJmFkN0iqGsOmOKmbLAD; Fri, 10 Sep 2021 21:40:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631302853; bh=9TDQmFfB53wel9Di+sEy71DZG4uC3j8ZZZeZyIbvawc=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=RJL79MEBU6S4pexx4Kb2Q7ulAZXC85pHwljjkWY3sSFd2YAVTlToxcrscYN7NYzmd
 dH5vIszVCDjzQOhMvHF83ngGwywkYztrBQoijyJvJH9Afdjv5X5s736P0/YIGNXi2R
 rTbx7TZ4RnECy8ILwJPr4z9j7MKkh0KHdE+tCXvip3jaJQEUh5UAZvE/clHnvofLed
 W2Wm4QYNBjtlHcxVmgEa1ut4+HxLWPhBQTMgeIi2bUw2RQJ+JK6Ain6VHPp47Tf3sU
 LafWuZ/7AP056rHjsX4cDhKzqqDnrb0b6tXXjRBG8Cr4OYXmxjkhhaMJ7VXfp6yVh3
 tpCmbeK2+6gOA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 10 Sep 2021 21:40:51 +0200
Message-Id: <DA971654-1893-453C-A37D-BC4C6E772195@benettiengineering.com>
References: <87ilz8ad2f.fsf@dell.be.48ers.dk>
In-Reply-To: <87ilz8ad2f.fsf@dell.be.48ers.dk>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailer: iPhone Mail (18G82)
X-CMAE-Envelope: MS4wfEuCwPqv6jQ4qtkh/mb7nK5poLYvSsJR4aYULumsxVSuDfmHd8qEeDvFrTqGTfDoJ4Ukcj8L6o1xx/22MHLwdiJ/aPmOpVzyMNIt5NR/i2HyHNbctaaM
 w4C4En5jRf9USewjophYEaI+qiUHxIf0hqdlmyEtOg/QxrkmoQj2AyPriqFdwjBGG+Y5u3HQZ5j3Y6yfyrNaEm7hSFLDnTQMLZs4F+KA6bVYu4uuzp5IS82G
 auX3oahCWT0pnHCGAl/2I99yeNuvVyJY3B7aEnaGF1U=
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 2.9.0
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
Cc: buildroot@busybox.net, Francois Perrad <fperrad@gmail.com>
Content-Type: multipart/mixed; boundary="===============7318183975859286423=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>


--===============7318183975859286423==
Content-Type: multipart/alternative; boundary=Apple-Mail-66F962E3-2A5D-4E4C-8AEC-58336DD7E185
Content-Transfer-Encoding: 7bit


--Apple-Mail-66F962E3-2A5D-4E4C-8AEC-58336DD7E185
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Peter, Francois,

> Il giorno 10 set 2021, alle ore 13:24, Peter Korsgaard <peter@korsgaard.co=
m> ha scritto:
>=20
> =EF=BB=BF
>>=20
>>>>>> "Francois" =3D=3D Francois Perrad <fperrad@gmail.com> writes:
>=20
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>> ---
>> package/harfbuzz/harfbuzz.hash | 2 +-
>> package/harfbuzz/harfbuzz.mk   | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>=20
>> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.h=
ash
>> index 774b3104a..a101f3e7d 100644
>> --- a/package/harfbuzz/harfbuzz.hash
>> +++ b/package/harfbuzz/harfbuzz.hash
>> @@ -1,3 +1,3 @@
>> # Locally computed
>> -sha256  d58461395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7=
  harfbuzz-2.8.2.tar.xz
>> +sha256  3e1c2e1d2c65d56364fd16d1c41a06b2a35795496f78dfff635c2b7414b54c5a=
  harfbuzz-2.9.0.tar.xz
>> sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692 =
 COPYING
>> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
>> index c7f5dfe9d..ccb0d940d 100644
>> --- a/package/harfbuzz/harfbuzz.mk
>> +++ b/package/harfbuzz/harfbuzz.mk
>> @@ -4,7 +4,7 @@
>> #
>> #########################################################################=
#######
>=20
>> -HARFBUZZ_VERSION =3D 2.8.2
>> +HARFBUZZ_VERSION =3D 2.9.0
>=20
> Doesn't harbuzz follow the gnome-style odd versions are development
> versions? If so, do we want to have 2.9.x in Buildroot?

It doesn=E2=80=99t seem to follow that scheme anymore since some time.
If we check what Ubuntu uses in last versions:
https://pkgs.org/search/?q=3DHarfbuzz
they=E2=80=99re either odd and even.
Ubuntu          Harfbuzz
18.04(LTS)     1.7.2
20.04(LTS)    2.6.4
21.04              2.7.4

So I think we=E2=80=99re fine following every release.
After this patch there is mine with version 2.9.1

Best regards
Giulio Benetti

>=20
> --=20
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-66F962E3-2A5D-4E4C-8AEC-58336DD7E185
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Peter, Francois,<br><div dir=3D"ltr"><br=
><blockquote type=3D"cite">Il giorno 10 set 2021, alle ore 13:24, Peter Kors=
gaard &lt;peter@korsgaard.com&gt; ha scritto:<br><br></blockquote></div><blo=
ckquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<blockquote type=3D"cite"><b=
lockquote type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">=
<blockquote type=3D"cite"><span>"Francois" =3D=3D Francois Perrad &lt;fperra=
d@gmail.com&gt; writes:</span><br></blockquote></blockquote></blockquote></b=
lockquote></blockquote><span></span><br><blockquote type=3D"cite"><span>Sign=
ed-off-by: Francois Perrad &lt;francois.perrad@gadz.org&gt;</span><br></bloc=
kquote><blockquote type=3D"cite"><span>---</span><br></blockquote><blockquot=
e type=3D"cite"><span> package/harfbuzz/harfbuzz.hash | 2 +-</span><br></blo=
ckquote><blockquote type=3D"cite"><span> package/harfbuzz/harfbuzz.mk &nbsp;=
&nbsp;| 2 +-</span><br></blockquote><blockquote type=3D"cite"><span> 2 files=
 changed, 2 insertions(+), 2 deletions(-)</span><br></blockquote><span></spa=
n><br><blockquote type=3D"cite"><span>diff --git a/package/harfbuzz/harfbuzz=
.hash b/package/harfbuzz/harfbuzz.hash</span><br></blockquote><blockquote ty=
pe=3D"cite"><span>index 774b3104a..a101f3e7d 100644</span><br></blockquote><=
blockquote type=3D"cite"><span>--- a/package/harfbuzz/harfbuzz.hash</span><b=
r></blockquote><blockquote type=3D"cite"><span>+++ b/package/harfbuzz/harfbu=
zz.hash</span><br></blockquote><blockquote type=3D"cite"><span>@@ -1,3 +1,3 @=
@</span><br></blockquote><blockquote type=3D"cite"><span> # Locally computed=
</span><br></blockquote><blockquote type=3D"cite"><span>-sha256 &nbsp;d58461=
395ce28b9dc03903254374dd70c38c8c28c5046db123c08f7ab9417be7 &nbsp;harfbuzz-2.=
8.2.tar.xz</span><br></blockquote><blockquote type=3D"cite"><span>+sha256 &n=
bsp;3e1c2e1d2c65d56364fd16d1c41a06b2a35795496f78dfff635c2b7414b54c5a &nbsp;h=
arfbuzz-2.9.0.tar.xz</span><br></blockquote><blockquote type=3D"cite"><span>=
 sha256 &nbsp;4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee6=
92 &nbsp;COPYING</span><br></blockquote><blockquote type=3D"cite"><span>diff=
 --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk</span><=
br></blockquote><blockquote type=3D"cite"><span>index c7f5dfe9d..ccb0d940d 1=
00644</span><br></blockquote><blockquote type=3D"cite"><span>--- a/package/h=
arfbuzz/harfbuzz.mk</span><br></blockquote><blockquote type=3D"cite"><span>+=
++ b/package/harfbuzz/harfbuzz.mk</span><br></blockquote><blockquote type=3D=
"cite"><span>@@ -4,7 +4,7 @@</span><br></blockquote><blockquote type=3D"cite=
"><span> #</span><br></blockquote><blockquote type=3D"cite"><span> #########=
#######################################################################</spa=
n><br></blockquote><span></span><br><blockquote type=3D"cite"><span>-HARFBUZ=
Z_VERSION =3D 2.8.2</span><br></blockquote><blockquote type=3D"cite"><span>+=
HARFBUZZ_VERSION =3D 2.9.0</span><br></blockquote><span></span><br><span>Doe=
sn't harbuzz follow the gnome-style odd versions are development</span><br><=
span>versions? If so, do we want to have 2.9.x in Buildroot?</span><br></div=
></blockquote><div><br></div><div>It doesn=E2=80=99t seem to follow that sch=
eme anymore since some time.</div><div>If we check what Ubuntu uses in last v=
ersions:</div><div><a href=3D"https://pkgs.org/search/?q=3DHarfbuzz">https:/=
/pkgs.org/search/?q=3DHarfbuzz</a></div><div>they=E2=80=99re either odd and e=
ven.</div><div>Ubuntu &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Harfbuzz</div><div>1=
8.04(LTS) &nbsp; &nbsp; 1.7.2</div><div>20.04(LTS) &nbsp; &nbsp;2.6.4</div><=
div>21.04 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;2.7.4</div><div><b=
r></div><div>So I think we=E2=80=99re fine following every release.</div><di=
v>After this patch there is mine with version 2.9.1</div><div><br></div><div=
>Best regards</div><div>Giulio Benetti</div><br><blockquote type=3D"cite"><d=
iv dir=3D"ltr"><span></span><br><span>-- </span><br><span>Bye, Peter Korsgaa=
rd</span><br><span>_______________________________________________</span><br=
><span>buildroot mailing list</span><br><span>buildroot@lists.buildroot.org<=
/span><br><span>https://lists.buildroot.org/mailman/listinfo/buildroot</span=
><br></div></blockquote></body></html>=

--Apple-Mail-66F962E3-2A5D-4E4C-8AEC-58336DD7E185--

--===============7318183975859286423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7318183975859286423==--
