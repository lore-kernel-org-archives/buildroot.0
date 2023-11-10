Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C14DC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 23:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9F3660F74;
	Fri, 10 Nov 2023 23:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9F3660F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Tx8hUpBdyKc; Fri, 10 Nov 2023 23:24:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D070C6172D;
	Fri, 10 Nov 2023 23:24:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D070C6172D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59F671BF84C
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 23:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 347C683C6B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 23:24:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 347C683C6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSy1IS3OwTk9 for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 23:24:06 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95F3183C0A
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 23:24:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95F3183C0A
Received: from sslproxy02.your-server.de ([78.47.166.47])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <martin@geanix.com>)
 id 1r1ar3-00015Z-6Q; Sat, 11 Nov 2023 00:24:01 +0100
Received: from 85.184.138.13.dynamic.dhcp.aura-net.dk ([85.184.138.13]
 helo=[127.0.0.1])
 by sslproxy02.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <martin@geanix.com>)
 id 1r1ar2-00054A-U1; Sat, 11 Nov 2023 00:24:00 +0100
Date: Sat, 11 Nov 2023 00:24:00 +0100 (GMT+01:00)
From: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <ebf3cf7a-911f-44a7-8621-c4d276963952@geanix.com>
In-Reply-To: <43f28d31-bb14-4051-9fea-0eb9322e4ebc@mind.be>
References: <20231107191809.1338200-1-martin@geanix.com>
 <43f28d31-bb14-4051-9fea-0eb9322e4ebc@mind.be>
MIME-Version: 1.0
X-Correlation-ID: <ebf3cf7a-911f-44a7-8621-c4d276963952@geanix.com>
X-Authenticated-Sender: martin@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27089/Fri Nov 10 09:39:24 2023)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=geanix.com; 
 s=default2211; h=Content-Type:MIME-Version:Subject:References:In-Reply-To:
 Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID;
 bh=QeVM2g6nDd7C6QTL0TuviUfBH167SGeJt+3rRQGsPEY=; b=QlHcQM7lc2QCtEBCMJxbLAxgeH
 PyyRXECxc5BBhJ/VFzyqeWGH8vaztHqNxf2j6/XHfhh83q/ifcGcQmx9Q6kWkPOWrnckfX7vLdChT
 xwel31ETEtQI1qwe2FWWE4Jem9yIu6rC96jkjbv36+lT0Oix+yv7ivswRVSN6H5QFgNuub7WrCWyD
 gnbfBHmEK1KSImMVJKw/ygX9wRr2+TMA928r9LWhjN9B9dxuOSmK5jUVeh0yalimOPCMLOikmfRFo
 iuyhCCXI+YSgqWVzXdocn/mGkOCARLAdCWgajAXqr7uvU1hp3P4KxXq/0UJTqH/zScbIMR1Jvo1RO
 Ry+UHpUA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com
 header.a=rsa-sha256 header.s=default2211 header.b=QlHcQM7l
Subject: Re: [Buildroot] [PATCH] python-gpiozero: update to version 2.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7575268450111229479=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7575268450111229479==
Content-Type: multipart/alternative; 
	boundary="----=_Part_11_34152897.1699658640521"

------=_Part_11_34152897.1699658640521
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Nov 10, 2023 22:16:16 Arnout Vandecappelle <arnout@mind.be>:

> =C2=A0 Hi Martin,
>
> On 07/11/2023 20:18, Martin Hundeb=C3=B8ll wrote:
>> Most notably, this removes puython2 support and adds support for RPi5.
>> While here, the package is enabled for aarch64 too.
>
> =C2=A0 Jamer already submitted this version bump last Sunday, and Thomas =
applied it on Monday. So your patch unfortunately came too late. I marked i=
t as Superseded.
>
> =C2=A0 However, James didn't enable it for aarch64, so perhaps you can su=
bmit a patch doing that?

Aaah, yes. I'm still on 2023.08-something.

I'm submit a patch to enable arm64.

// Martin

>
> =C2=A0 Regards,
> =C2=A0 Arnout
>
>> Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
>> ---
>> =C2=A0 .../0001-Migrate-to-setup.cfg.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 855 ------------------
>> =C2=A0 package/python-gpiozero/Config.in=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
>> =C2=A0 package/python-gpiozero/python-gpiozero.hash=C2=A0 |=C2=A0=C2=A0 =
2 +-
>> =C2=A0 package/python-gpiozero/python-gpiozero.mk=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
>> =C2=A0 4 files changed, 3 insertions(+), 858 deletions(-)
>> =C2=A0 delete mode 100644 package/python-gpiozero/0001-Migrate-to-setup.=
cfg.patch
> [snip]
>> diff --git a/package/python-gpiozero/Config.in b/package/python-gpiozero=
/Config.in
>> index 93e5de3e55..4c2233519b 100644
>> --- a/package/python-gpiozero/Config.in
>> +++ b/package/python-gpiozero/Config.in
>> @@ -1,6 +1,6 @@
>> =C2=A0 config BR2_PACKAGE_PYTHON_GPIOZERO
>> =C2=A0=C2=A0=C2=A0 bool "python-gpiozero"
>> -=C2=A0=C2=A0 depends on BR2_arm
>> +=C2=A0=C2=A0 depends on (BR2_arm || BR2_aarch64)
>> =C2=A0=C2=A0=C2=A0 select BR2_PACKAGE_PYTHON_COLORZERO # runtime
>> =C2=A0=C2=A0=C2=A0 select BR2_PACKAGE_PYTHON_RPI_GPIO # runtime
>> =C2=A0=C2=A0=C2=A0 select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
>> diff --git a/package/python-gpiozero/python-gpiozero.hash b/package/pyth=
on-gpiozero/python-gpiozero.hash
>> index 7359f6405e..18153cf9d7 100644
>> --- a/package/python-gpiozero/python-gpiozero.hash
>> +++ b/package/python-gpiozero/python-gpiozero.hash
>> @@ -1,4 +1,4 @@
>> =C2=A0 # Locally computed
>> -sha256=C2=A0 7e6da923774437e24edc0c056e486415bace8c4ba4123c22ac42141478=
54ea6d=C2=A0 python-gpiozero-1.6.2.tar.gz
>> +sha256=C2=A0 c57d9c81854f72ab54351d72fa1e6b2e4bc1ff56c57422c30772d27182=
4e1916=C2=A0 python-gpiozero-2.0.tar.gz
>> =C2=A0 # Locally computed
>> =C2=A0 sha256=C2=A0 b6fdd587f3dc3a9b8cc5adae00918e3ffa909b1092bd4decf7e8=
b1b08fa5d0fb=C2=A0 LICENSE.rst
>> diff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python=
-gpiozero/python-gpiozero.mk
>> index a68c39db1f..830be391a1 100644
>> --- a/package/python-gpiozero/python-gpiozero.mk
>> +++ b/package/python-gpiozero/python-gpiozero.mk
>> @@ -4,7 +4,7 @@
>> =C2=A0 #
>> =C2=A0 #################################################################=
###############
>> =C2=A0 -PYTHON_GPIOZERO_VERSION =3D 1.6.2
>> +PYTHON_GPIOZERO_VERSION =3D 2.0
>> =C2=A0 PYTHON_GPIOZERO_SITE =3D $(call github,gpiozero,gpiozero,v$(PYTHO=
N_GPIOZERO_VERSION))
>> =C2=A0 PYTHON_GPIOZERO_LICENSE =3D BSD-3-Clause
>> =C2=A0 PYTHON_GPIOZERO_LICENSE_FILES =3D LICENSE.rst


------=_Part_11_34152897.1699658640521
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
 <head>
  <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=3D=
1.0">
 </head>
 <body>
  <span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Nov 10, 2023 2=
2:16:16 Arnout Vandecappelle &lt;arnout@mind.be&gt;:</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; &nbsp=
; Hi Martin,</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; On 07=
/11/2023 20:18, Martin Hundeb=C3=B8ll wrote:</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; M=
ost notably, this removes puython2 support and adds support for RPi5.</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; W=
hile here, the package is enabled for aarch64 too.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; &nbsp=
; Jamer already submitted this version bump last Sunday, and Thomas applied=
 it on Monday. So your patch unfortunately came too late. I marked it as Su=
perseded.</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; &nbsp=
; However, James didn't enable it for aarch64, so perhaps you can submit a =
patch doing that?</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">Aaah, yes.=
 I'm still on 2023.08-something.</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">I'm submit=
 a patch to enable arm64.</span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">// Martin<=
/span>
  <br>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; &nbsp=
; Regards,</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; &nbsp=
; Arnout</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;</span=
>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; S=
igned-off-by: Martin Hundeb=C3=B8ll &lt;martin@geanix.com&gt;</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
--</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; .../0001-Migrate-to-setup.cfg.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 855 ------------------</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; package/python-gpiozero/Config.in&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 2 +-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; package/python-gpiozero/python-gpiozero.hash&nbsp; |&nbsp;&nbsp; 2 +-=
</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; package/python-gpiozero/python-gpiozero.mk&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 +-</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; 4 files changed, 3 insertions(+), 858 deletions(-)</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; delete mode 100644 package/python-gpiozero/0001-Migrate-to-setup.cfg.=
patch</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt; [snip=
]</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; d=
iff --git a/package/python-gpiozero/Config.in b/package/python-gpiozero/Con=
fig.in</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; i=
ndex 93e5de3e55..4c2233519b 100644</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
-- a/package/python-gpiozero/Config.in</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
++ b/package/python-gpiozero/Config.in</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; @=
@ -1,6 +1,6 @@</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; config BR2_PACKAGE_PYTHON_GPIOZERO</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;&nbsp;&nbsp; bool "python-gpiozero"</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
&nbsp;&nbsp; depends on BR2_arm</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
&nbsp;&nbsp; depends on (BR2_arm || BR2_aarch64)</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;&nbsp;&nbsp; select BR2_PACKAGE_PYTHON_COLORZERO # runtime</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;&nbsp;&nbsp; select BR2_PACKAGE_PYTHON_RPI_GPIO # runtime</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp;&nbsp;&nbsp; select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; d=
iff --git a/package/python-gpiozero/python-gpiozero.hash b/package/python-g=
piozero/python-gpiozero.hash</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; i=
ndex 7359f6405e..18153cf9d7 100644</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
-- a/package/python-gpiozero/python-gpiozero.hash</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
++ b/package/python-gpiozero/python-gpiozero.hash</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; @=
@ -1,4 +1,4 @@</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; # Locally computed</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
sha256&nbsp; 7e6da923774437e24edc0c056e486415bace8c4ba4123c22ac4214147854ea=
6d&nbsp; python-gpiozero-1.6.2.tar.gz</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
sha256&nbsp; c57d9c81854f72ab54351d72fa1e6b2e4bc1ff56c57422c30772d271824e19=
16&nbsp; python-gpiozero-2.0.tar.gz</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; # Locally computed</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; sha256&nbsp; b6fdd587f3dc3a9b8cc5adae00918e3ffa909b1092bd4decf7e8b1b0=
8fa5d0fb&nbsp; LICENSE.rst</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; d=
iff --git a/package/python-gpiozero/python-gpiozero.mk b/package/python-gpi=
ozero/python-gpiozero.mk</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; i=
ndex a68c39db1f..830be391a1 100644</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; -=
-- a/package/python-gpiozero/python-gpiozero.mk</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
++ b/package/python-gpiozero/python-gpiozero.mk</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; @=
@ -4,7 +4,7 @@</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; #</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; #####################################################################=
###########</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; -PYTHON_GPIOZERO_VERSION =3D 1.6.2</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; +=
PYTHON_GPIOZERO_VERSION =3D 2.0</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; PYTHON_GPIOZERO_SITE =3D $(call github,gpiozero,gpiozero,v$(PYTHON_GP=
IOZERO_VERSION))</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; PYTHON_GPIOZERO_LICENSE =3D BSD-3-Clause</span>
  <br><span dir=3D"ltr" style=3D"margin-top:0; margin-bottom:0;">&gt;&gt; &=
nbsp; PYTHON_GPIOZERO_LICENSE_FILES =3D LICENSE.rst</span>
  <br>
  <br>
 </body>
</html>
------=_Part_11_34152897.1699658640521--

--===============7575268450111229479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7575268450111229479==--
