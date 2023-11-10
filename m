Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D343C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 10:46:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B892740292;
	Fri, 10 Nov 2023 10:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B892740292
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lFd91FGcj34u; Fri, 10 Nov 2023 10:46:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E13B2403A2;
	Fri, 10 Nov 2023 10:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E13B2403A2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF4D81BF348
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 10:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9588860E82
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 10:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9588860E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VJlwSsjJMT3u for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 10:46:53 +0000 (UTC)
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C6AA60D62
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 10:46:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C6AA60D62
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-5a7dd65052aso22950517b3.0
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 02:46:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699613212; x=1700218012;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rlzYbTHklFrxRU25uIy4qa2x/CuuO3jYL9m2qAw1Wcs=;
 b=RVRR/2F7ro9441BhIVsfeyDPYaXizWLwoHJtrvk4sKa9VhsovMWscB83Qa19xgAJrr
 t9eKRrrB2Ljj4a5KXx8NuTZGEBCNkydwwT7vBExj7YAOsD8tkbHqAaI6Ao83jLB+mE0v
 yckVkJDiFQqBrvmmzjbn/0U1uavhA1dSVH/ePCe0eGV/ISBL5tMVK9FiiyUDg9RLPYAD
 b/hU/umQRo/Wx2e0aIk4PYEwdIOjly9QZqzeCikCIAcOC8FJmadArejCT5lZthykY2/E
 OkS+zIMG2ghT9YUnydFvOB3c6/42xS8jwKIHwbLo0VJm1KSrdDuFQl2JkNFfWykWB/5e
 lFuA==
X-Gm-Message-State: AOJu0YxGkCgg6IiTQ7eETA1sRINrg0wXiDW+uXQ8wJ/dpIuVGcE1v2EW
 7RGX5gjdVxAQsGiT3LkDXEBeOzHU9/AlPaMlc0zlsg==
X-Google-Smtp-Source: AGHT+IEZMN0aEi4kQJdRkkn2hzu85GIC/HC/Yms9Sw+ALNvsJup0/8PTonF6nB8Ulvgr1/mNBJukRXYssG5fS6F32YY=
X-Received: by 2002:a25:f449:0:b0:da0:228e:9cc5 with SMTP id
 p9-20020a25f449000000b00da0228e9cc5mr7295220ybe.42.1699613211986; Fri, 10 Nov
 2023 02:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20231109142009.3490104-1-jonhenrik@qbee.io>
 <ZU379oHV4pCxnXmH@tl-lnx-nyma7486-2>
In-Reply-To: <ZU379oHV4pCxnXmH@tl-lnx-nyma7486-2>
Date: Fri, 10 Nov 2023 11:46:41 +0100
Message-ID: <CAC3uuevNSnwGp0Adr0sRT_LuRswj22ia7qDsF6VeG6k6ajqwBQ@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qbee.io; s=google; t=1699613212; x=1700218012; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rlzYbTHklFrxRU25uIy4qa2x/CuuO3jYL9m2qAw1Wcs=;
 b=UI9X3jhJP1ljunnBh9qM+p5Uev+T4Lh7RJGBfhtEc57wKJ9ncBqy9fyDw5qJ0kbEy+
 YlzsdTuhSnhUMspDEVTDio9Bp1QcA0N+QyLTphn2ydWE0JJdJGpWIOzv3VClrDb6QDMk
 nEsSLBtNBTVppECbmcOCKRFnrBoydL7+D/jxE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=qbee.io header.i=@qbee.io
 header.a=rsa-sha256 header.s=google header.b=UI9X3jhJ
Subject: Re: [Buildroot] [PATCH 0/1] Regarding review of qbee-agent patch
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
From: =?utf-8?q?Jon_Henrik_Bj=C3=B8rnstad_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Jon_Henrik_Bj=C3=B8rnstad?= <jonhenrik@qbee.io>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6972458636731396770=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6972458636731396770==
Content-Type: multipart/alternative; boundary="000000000000c1a32a0609ca09ba"

--000000000000c1a32a0609ca09ba
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

Thanks for all the valuable feedback. I have just submitted a new patch
where I've tried to incorporate it as best as I can.

With kind regards,

Jon Henrik Bj=C3=B8rnstad

On Fri, Nov 10, 2023 at 10:46=E2=80=AFAM <yann.morin@orange.com> wrote:

> Jon, All,
>
> On 2023-11-09 15:20 +0100, Jon Henrik Bj=C3=B8rnstad via buildroot spake =
thusly:
> > License file:
> > The tarball in use does not contain a license file. I'm fairly new to
> > the buildroot project and have used a lot of existing package
> implementations
> > as inspiration. Is a license file required when using a general license
> > like Apache 2.0?
>
> Yes, we want to point to the livense file. If you build from the go
> sources as they are on github, you'll then be able to use the LICENSE
> file present there.
>
> You will also need to provide a hash (in the .hash file) for the license
> file, so that it is checked when running "make legal-info". If the
> license changes, then the LICENSE file will no longer match the expected
> hash, and we will notice and be able to rebioew the new licensing terms.
>
> > Static binaries:
> > The binaries are statically built with a public part of a signing key
> > as part of the compile time arguments. This public key is used to verif=
y
> > downloaded static runtime binaries from the qbee.io SaaS platform which
> > is signed with the production signing key.
>
> > Currently only arms and intels
> > are supported,
>
> If there are dependencies on the taget arch, then you must add that in
> the Config.in:
>
>     config on BR2_PACKAGE_QBEE_AGENT_ARCH_SUPPORTS
>         bool
>         default y if BR2_arm
>         default i if BR2_x86_64
>         and so on...
>
>     config BR2_PACKAGE_QBEE_AGENT
>         bool "qbee-agent"
>         depends on BR2_PACKAGE_QBEE_AGENT_ARCH_SUPPORTS
>
> > but this will change with future releases where the
> > dependency on downloaded static runtime binaries will be removed.
>
> I hope I provided enough feedback and suggestion about that in the
> review of the patch.
>
> > QBEE_AGENT_GOARCH vs. GO_GOARCH:
> > I changed this due to errors produced by the check-package utility:
> > With GO_GOARCH:
> > $ utils/docker-run make check-package
> > package/qbee-agent/qbee-agent.mk:12: possible typo: GO_GOARCH ->
> *QBEE_AGENT*
> > package/qbee-agent/qbee-agent.mk:14: possible typo: GO_GOARCH ->
> *QBEE_AGENT*
> > package/qbee-agent/qbee-agent.mk:16: possible typo: GO_GOARCH ->
> *QBEE_AGENT*
> > package/qbee-agent/qbee-agent.mk:18: possible typo: GO_GOARCH ->
> *QBEE_AGENT*
>
> What thomas meant, was to actually directly use $(GO_GOARCH), like so:
>
>     $(INSTALL) -m 0755 $(@D)/qbee-agent-$(GO_GOARCH)
> $(TARGET_DIR)/usr/bin/qbee-agent
>
> But this is not going to be needed when you switch the package to use
> the golang-package infra to build from source.
>
> Regards,
> Yann E. MORIN.
>
> > Thank you again for your feedback.
> >
> > With kind regards,
> >
> > Jon Henrik Bj=C3=B8rnstad
> >
> >
> > Jon Henrik Bj=C3=B8rnstad (1):
> >   package/qbee-agent: new package
> >
> >  DEVELOPERS                         |  3 +++
> >  package/Config.in                  |  1 +
> >  package/qbee-agent/Config.in       | 17 ++++++++++++
> >  package/qbee-agent/qbee-agent.hash |  2 ++
> >  package/qbee-agent/qbee-agent.mk   | 42 ++++++++++++++++++++++++++++++
> >  5 files changed, 65 insertions(+)
> >  create mode 100644 package/qbee-agent/Config.in
> >  create mode 100644 package/qbee-agent/qbee-agent.hash
> >  create mode 100644 package/qbee-agent/qbee-agent.mk
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>                                         ____________
> .-----------------.--------------------:       _    :------------------.
> |  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
> |                 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
> | +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
> | yann.morin (at) orange.com           |_=3D"    ,--' | / \ HTML MAIL    =
|
> '--------------------------------------:______/_____:------------------'
>
>
> _________________________________________________________________________=
___________________________________
> Ce message et ses pieces jointes peuvent contenir des informations
> confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez
> recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages
> electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme o=
u
> falsifie. Merci.
>
> This message and its attachments may contain confidential or privileged
> information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and
> delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have bee=
n
> modified, changed or falsified.
> Thank you.
>

--000000000000c1a32a0609ca09ba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Yann,</div><div><br></div><div>Thanks for all the =
valuable feedback. I have just submitted a new patch where I&#39;ve tried t=
o incorporate it as best as I can.</div><div><br></div><div>With kind regar=
ds,</div><div><br></div><div>Jon Henrik Bj=C3=B8rnstad<br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov=
 10, 2023 at 10:46=E2=80=AFAM &lt;<a href=3D"mailto:yann.morin@orange.com">=
yann.morin@orange.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Jon, All,<br>
<br>
On 2023-11-09 15:20 +0100, Jon Henrik Bj=C3=B8rnstad via buildroot spake th=
usly:<br>
&gt; License file:<br>
&gt; The tarball in use does not contain a license file. I&#39;m fairly new=
 to<br>
&gt; the buildroot project and have used a lot of existing package implemen=
tations<br>
&gt; as inspiration. Is a license file required when using a general licens=
e <br>
&gt; like Apache 2.0?<br>
<br>
Yes, we want to point to the livense file. If you build from the go<br>
sources as they are on github, you&#39;ll then be able to use the LICENSE<b=
r>
file present there.<br>
<br>
You will also need to provide a hash (in the .hash file) for the license<br=
>
file, so that it is checked when running &quot;make legal-info&quot;. If th=
e<br>
license changes, then the LICENSE file will no longer match the expected<br=
>
hash, and we will notice and be able to rebioew the new licensing terms.<br=
>
<br>
&gt; Static binaries:<br>
&gt; The binaries are statically built with a public part of a signing key<=
br>
&gt; as part of the compile time arguments. This public key is used to veri=
fy<br>
&gt; downloaded static runtime binaries from the <a href=3D"http://qbee.io"=
 rel=3D"noreferrer" target=3D"_blank">qbee.io</a> SaaS platform which<br>
&gt; is signed with the production signing key.<br>
<br>
&gt; Currently only arms and intels<br>
&gt; are supported,<br>
<br>
If there are dependencies on the taget arch, then you must add that in<br>
the Config.in:<br>
<br>
=C2=A0 =C2=A0 config on BR2_PACKAGE_QBEE_AGENT_ARCH_SUPPORTS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default y if BR2_arm<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default i if BR2_x86_64<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 and so on...<br>
<br>
=C2=A0 =C2=A0 config BR2_PACKAGE_QBEE_AGENT<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;qbee-agent&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_QBEE_AGENT_ARCH_SUPPORTS=
<br>
<br>
&gt; but this will change with future releases where the<br>
&gt; dependency on downloaded static runtime binaries will be removed.<br>
<br>
I hope I provided enough feedback and suggestion about that in the<br>
review of the patch.<br>
<br>
&gt; QBEE_AGENT_GOARCH vs. GO_GOARCH:<br>
&gt; I changed this due to errors produced by the check-package utility:<br=
>
&gt; With GO_GOARCH:<br>
&gt; $ utils/docker-run make check-package<br>
&gt; package/qbee-agent/<a href=3D"http://qbee-agent.mk:12" rel=3D"noreferr=
er" target=3D"_blank">qbee-agent.mk:12</a>: possible typo: GO_GOARCH -&gt; =
*QBEE_AGENT*<br>
&gt; package/qbee-agent/<a href=3D"http://qbee-agent.mk:14" rel=3D"noreferr=
er" target=3D"_blank">qbee-agent.mk:14</a>: possible typo: GO_GOARCH -&gt; =
*QBEE_AGENT*<br>
&gt; package/qbee-agent/<a href=3D"http://qbee-agent.mk:16" rel=3D"noreferr=
er" target=3D"_blank">qbee-agent.mk:16</a>: possible typo: GO_GOARCH -&gt; =
*QBEE_AGENT*<br>
&gt; package/qbee-agent/<a href=3D"http://qbee-agent.mk:18" rel=3D"noreferr=
er" target=3D"_blank">qbee-agent.mk:18</a>: possible typo: GO_GOARCH -&gt; =
*QBEE_AGENT*<br>
<br>
What thomas meant, was to actually directly use $(GO_GOARCH), like so:<br>
<br>
=C2=A0 =C2=A0 $(INSTALL) -m 0755 $(@D)/qbee-agent-$(GO_GOARCH) $(TARGET_DIR=
)/usr/bin/qbee-agent<br>
<br>
But this is not going to be needed when you switch the package to use<br>
the golang-package infra to build from source.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Thank you again for your feedback. <br>
&gt; <br>
&gt; With kind regards,<br>
&gt; <br>
&gt; Jon Henrik Bj=C3=B8rnstad<br>
&gt; <br>
&gt; <br>
&gt; Jon Henrik Bj=C3=B8rnstad (1):<br>
&gt;=C2=A0 =C2=A0package/qbee-agent: new package<br>
&gt; <br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 package/qbee-agent/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0| 17 ++++=
++++++++<br>
&gt;=C2=A0 package/qbee-agent/qbee-agent.hash |=C2=A0 2 ++<br>
&gt;=C2=A0 package/qbee-agent/<a href=3D"http://qbee-agent.mk" rel=3D"noref=
errer" target=3D"_blank">qbee-agent.mk</a>=C2=A0 =C2=A0| 42 +++++++++++++++=
+++++++++++++++<br>
&gt;=C2=A0 5 files changed, 65 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/qbee-agent/Config.in<br>
&gt;=C2=A0 create mode 100644 package/qbee-agent/qbee-agent.hash<br>
&gt;=C2=A0 create mode 100644 package/qbee-agent/<a href=3D"http://qbee-age=
nt.mk" rel=3D"noreferrer" target=3D"_blank">qbee-agent.mk</a><br>
&gt; <br>
&gt; -- <br>
&gt; 2.25.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
-- <br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ________=
____<br>
.-----------------.--------------------:=C2=A0 =C2=A0 =C2=A0 =C2=A0_=C2=A0 =
=C2=A0 :------------------.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded |=C2=A0 =C2=A0 __/ )=C2=A0=
 =C2=A0| /&quot;\ ASCII RIBBON |<br>
|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| Software=
=C2=A0 Designer |=C2=A0 _/ - /&#39;=C2=A0 =C2=A0| \ / CAMPAIGN=C2=A0 =C2=A0=
 =C2=A0|<br>
| +33 638.411.245 &#39;--------------------: (_=C2=A0 =C2=A0 `--, |=C2=A0 X=
=C2=A0 AGAINST=C2=A0 =C2=A0 =C2=A0 |<br>
| yann.morin (at) <a href=3D"http://orange.com" rel=3D"noreferrer" target=
=3D"_blank">orange.com</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|_=3D&qu=
ot;=C2=A0 =C2=A0 ,--&#39; | / \ HTML MAIL=C2=A0 =C2=A0 |<br>
&#39;--------------------------------------:______/_____:------------------=
&#39;<br>
<br>
___________________________________________________________________________=
_________________________________<br>
Ce message et ses pieces jointes peuvent contenir des informations confiden=
tielles ou privilegiees et ne doivent donc<br>
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu=
 ce message par erreur, veuillez le signaler<br>
a l&#39;expediteur et le detruire ainsi que les pieces jointes. Les message=
s electroniques etant susceptibles d&#39;alteration,<br>
Orange decline toute responsabilite si ce message a ete altere, deforme ou =
falsifie. Merci.<br>
<br>
This message and its attachments may contain confidential or privileged inf=
ormation that may be protected by law;<br>
they should not be distributed, used or copied without authorisation.<br>
If you have received this email in error, please notify the sender and dele=
te this message and its attachments.<br>
As emails may be altered, Orange is not liable for messages that have been =
modified, changed or falsified.<br>
Thank you.<br>
</blockquote></div>

--000000000000c1a32a0609ca09ba--

--===============6972458636731396770==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6972458636731396770==--
