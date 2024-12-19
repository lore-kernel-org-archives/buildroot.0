Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3F5E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 08:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1978261357;
	Thu, 19 Dec 2024 08:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMF3rU1cd5eG; Thu, 19 Dec 2024 08:01:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B39960E35
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B39960E35;
	Thu, 19 Dec 2024 08:01:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E72B2CE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7BA840A12
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:00:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6J6eTfGosmMz for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 08:00:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFA5D4003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA5D4003A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFA5D4003A
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 08:00:56 +0000 (UTC)
Received: from [10.143.95.133] (unknown [78.244.1.173])
 (Authenticated sender: vjardin@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8007A19F741;
 Thu, 19 Dec 2024 09:00:50 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>, Peter Korsgaard <peter@korsgaard.com>
CC: <buildroot@buildroot.org>
Date: Thu, 19 Dec 2024 09:00:50 +0100
Message-ID: <193ddef0750.2856.ffe91ee9dc07baa0c1c4561a0e181c1b@free.fr>
In-Reply-To: <347c6f7297fe983edb7a5658a19605e0@free.fr>
References: <20241218220907.762527-1-peter@korsgaard.com>
 <347c6f7297fe983edb7a5658a19605e0@free.fr>
User-Agent: AquaMail/1.54.0 (build: 105400535)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734595253;
 bh=bga8moc5e3Sd/uRTVhj6hQdT//btBplu1sOj8teD4IY=;
 h=From:To:CC:Date:In-Reply-To:References:Subject:From;
 b=Sk2VZ7wXlHAjphQBtcIad5XG/iJREPienglAZBHtm04j6EYG3fN7qK2YlktO/TO9W
 h67xL+bYKREpE9qS3EeUF05+L9PkFFZAAv3BjWLRVQgLIY25KwvHqTXIMxHio5AoPA
 z2ECwtbe7APvKax8XtA9WPy1528Qao1btXohM8u1FieK136LiAvItHZU2+lHFl66+M
 oMEsCYcg12COUFrZ056mJ/I4Sd1tvhTlPd4z2T5N4xSk3pCZDIFIXH/8rP560niRJx
 7h+Y0tsy7Jtrc2eqQaFKfJb/jsP0Sn8i51YmpAD0EKa/VwCr8EuZUuCgrUXe48dQTR
 Ohv3DD+ZV7dPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Sk2VZ7wX
Subject: Re: [Buildroot] [PATCH] package/dpdk: security bump to version
 24.11.1
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
Content-Type: multipart/mixed; boundary="===============4679266041949892318=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============4679266041949892318==
Content-Type: multipart/alternative; boundary="193ddef09c94da28564d54088"

This is a multi-part message in MIME format.
--193ddef09c94da28564d54088
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Julien and Peter,

Thank, you have been quick on it. For my and maybe some other people of the 
Buildroot community,
   - how did you track and detect quickly the needed CVE on a package ? Do 
you have a specific notification/alert script ?

    - when do you need an ack't of the develeper of a package ? If needed.

Definitivley, this upgrade to 24.11.1 is needed.

Thanks,
   Vincent

Le 19 décembre 2024 00:03:53 Julien Olivain <ju.o@free.fr> a écrit :

> On 18/12/2024 23:09, Peter Korsgaard wrote:
>> Fixes the following security issue:
>>
>> CVE-2024-11614: An out-of-bounds read vulnerability was found in DPDK's
>> Vhost library checksum offload feature.  This issue enables an
>> untrusted or
>> compromised guest to crash the hypervisor's vSwitch by forging Virtio
>> descriptors to cause out-of-bounds reads.  This flaw allows an attacker
>> with
>> a malicious VM using a virtio driver to cause the vhost-user side to
>> crash
>> by sending a packet with a Tx checksum offload request and an invalid
>> csum_start offset.
>>
>> https://www.openwall.com/lists/oss-security/2024/12/17/3
>>
>> Release notes:
>> http://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html
>>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> Applied to master, thanks.
>
>> ---
>>  package/dpdk/dpdk.hash | 2 +-
>>  package/dpdk/dpdk.mk   | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.hash
>> index 27c06476e7..e9a22736b0 100644
>> --- a/package/dpdk/dpdk.hash
>> +++ b/package/dpdk/dpdk.hash
>> @@ -1,5 +1,5 @@
>>  # Locally computed
>> -sha256
>> 9944f7e5f268e7ac9b4193e2cd54ef6d98f6e1d7dddc967c77ae4f6616d6fbbd
>> dpdk-24.07.tar.xz
>> +sha256
>> bcae7d42c449fc456dfb279feabcbe0599a29bebb2fe2905761e187339d96b8e
>> dpdk-24.11.1.tar.xz
>>  sha256
>> 9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712
>> license/bsd-3-clause.txt
>>  sha256
>> e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf5f2ce05
>> license/exceptions.txt
>>  sha256
>> 6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01d4f4845
>> license/mit.txt
>> diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
>> index 2200f5fa00..0cbdc67e87 100644
>> --- a/package/dpdk/dpdk.mk
>> +++ b/package/dpdk/dpdk.mk
>> @@ -4,7 +4,7 @@
>>  #
>>
>> ################################################################################
>>
>> -DPDK_VERSION = 24.07
>> +DPDK_VERSION = 24.11.1
>>  DPDK_SOURCE = dpdk-$(DPDK_VERSION).tar.xz
>>  DPDK_SITE = https://fast.dpdk.org/rel
>>  DPDK_LICENSE = \
>> --
>> 2.39.5
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot


--193ddef09c94da28564d54088
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">
<html>
<body>
<div dir=3D"auto">
<div dir=3D"auto">Hi Julien and Peter,</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Thank, you have been quick on it. For my and maybe some othe=
r people of the Buildroot community,</div><div dir=3D"auto">&nbsp; &nbsp;- =
how did you track and detect quickly the needed CVE on a package ? Do you h=
ave a specific notification/alert script ?</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">&nbsp; &nbsp; - when do you need an ack't of the develep=
er of a package ? If needed.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Definitivley, this upgrade to 24.11.1 is needed.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">&nbsp; &nbsp;V=
incent&nbsp;</div><div dir=3D'auto'><br></div>
<div id=3D"aqm-original" style=3D"color: black;">
<div dir=3D"auto">Le 19 d=C3=A9cembre 2024 00:03:53 Julien Olivain &lt;ju.o=
@free.fr&gt; a =C3=A9crit :</div>
<div><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #808080; padding-left: 0.75ex;">
<div dir=3D"auto">On 18/12/2024 23:09, Peter Korsgaard wrote:</div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">Fixes the following security issue:</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">CVE-2024-11614: An out-of-bounds read vulnerability was f=
ound in DPDK's</div>
<div dir=3D"auto">Vhost library checksum offload feature. &nbsp;This issue =
enables an&nbsp;</div>
<div dir=3D"auto">untrusted or</div>
<div dir=3D"auto">compromised guest to crash the hypervisor's vSwitch by fo=
rging Virtio</div>
<div dir=3D"auto">descriptors to cause out-of-bounds reads. &nbsp;This flaw=
 allows an attacker&nbsp;</div>
<div dir=3D"auto">with</div>
<div dir=3D"auto">a malicious VM using a virtio driver to cause the vhost-u=
ser side to&nbsp;</div>
<div dir=3D"auto">crash</div>
<div dir=3D"auto">by sending a packet with a Tx checksum offload request an=
d an invalid</div>
<div dir=3D"auto">csum_start offset.</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">https://www.openwall.com/lists/oss-security/2024/12/17/3<=
/div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Release notes:&nbsp;</div>
<div dir=3D"auto">http://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.=
html</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Signed-off-by: Peter Korsgaard &lt;peter@korsgaard.com&gt=
;</div>
</blockquote>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">Applied to master, thanks.</div>
<div dir=3D"auto"><br></div>
<blockquote type=3D"cite" class=3D"gmail_quote" style=3D"margin: 0 0 0 0.75=
ex; border-left: 1px solid #0099CC; padding-left: 0.75ex;">
<div dir=3D"auto">---</div>
<div dir=3D"auto">package/dpdk/dpdk.hash | 2 +-</div>
<div dir=3D"auto">package/dpdk/dpdk.mk &nbsp; | 2 +-</div>
<div dir=3D"auto">2 files changed, 2 insertions(+), 2 deletions(-)</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">diff --git a/package/dpdk/dpdk.hash b/package/dpdk/dpdk.h=
ash</div>
<div dir=3D"auto">index 27c06476e7..e9a22736b0 100644</div>
<div dir=3D"auto">--- a/package/dpdk/dpdk.hash</div>
<div dir=3D"auto">+++ b/package/dpdk/dpdk.hash</div>
<div dir=3D"auto">@@ -1,5 +1,5 @@</div>
<div dir=3D"auto"># Locally computed</div>
<div dir=3D"auto">-sha256 &nbsp;</div>
<div dir=3D"auto">9944f7e5f268e7ac9b4193e2cd54ef6d98f6e1d7dddc967c77ae4f661=
6d6fbbd &nbsp;</div>
<div dir=3D"auto">dpdk-24.07.tar.xz</div>
<div dir=3D"auto">+sha256 &nbsp;</div>
<div dir=3D"auto">bcae7d42c449fc456dfb279feabcbe0599a29bebb2fe2905761e18733=
9d96b8e &nbsp;</div>
<div dir=3D"auto">dpdk-24.11.1.tar.xz</div>
<div dir=3D"auto">sha256 &nbsp;</div>
<div dir=3D"auto">9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f=
6322712 &nbsp;</div>
<div dir=3D"auto">license/bsd-3-clause.txt</div>
<div dir=3D"auto">sha256 &nbsp;</div>
<div dir=3D"auto">e19808bccd90c238fac06da2fc3683e094c64f7ba647e9d86f03a98cf=
5f2ce05 &nbsp;</div>
<div dir=3D"auto">license/exceptions.txt</div>
<div dir=3D"auto">sha256 &nbsp;</div>
<div dir=3D"auto">6c54c4d44faf3cba829b3d0c21c6955953e758767018fd7244f809b01=
d4f4845 &nbsp;</div>
<div dir=3D"auto">license/mit.txt</div>
<div dir=3D"auto">diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk<=
/div>
<div dir=3D"auto">index 2200f5fa00..0cbdc67e87 100644</div>
<div dir=3D"auto">--- a/package/dpdk/dpdk.mk</div>
<div dir=3D"auto">+++ b/package/dpdk/dpdk.mk</div>
<div dir=3D"auto">@@ -4,7 +4,7 @@</div>
<div dir=3D"auto">#</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">#########################################################=
#######################</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">-DPDK_VERSION =3D 24.07</div>
<div dir=3D"auto">+DPDK_VERSION =3D 24.11.1</div>
<div dir=3D"auto">DPDK_SOURCE =3D dpdk-$(DPDK_VERSION).tar.xz</div>
<div dir=3D"auto">DPDK_SITE =3D https://fast.dpdk.org/rel</div>
<div dir=3D"auto">DPDK_LICENSE =3D \</div>
<div dir=3D"auto">--</div>
<div dir=3D"auto">2.39.5</div>
<div dir=3D"auto"><br></div>
<div dir=3D"auto">_______________________________________________</div>
<div dir=3D"auto">buildroot mailing list</div>
<div dir=3D"auto">buildroot@buildroot.org</div>
<div dir=3D"auto">https://lists.buildroot.org/mailman/listinfo/buildroot</d=
iv>
</blockquote>
</blockquote>
</div><div dir=3D"auto"><br></div>
</div></body>
</html>

--193ddef09c94da28564d54088--


--===============4679266041949892318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4679266041949892318==--

