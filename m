Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DCAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 17:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A495960BCB;
	Thu, 13 Jan 2022 17:55:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7My1xKgd4TPB; Thu, 13 Jan 2022 17:55:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD46060A99;
	Thu, 13 Jan 2022 17:55:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E459F1BF4DA
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2D08415B0
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:55:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=carnegierobotics.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jUeh61GbaLyj for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 17:55:50 +0000 (UTC)
X-Greylist: delayed 00:06:49 by SQLgrey-1.8.0
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F04294159A
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:55:49 +0000 (UTC)
Received: from 005.lax.mailroute.net (005.lax.mailroute.net [199.89.1.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by 011.lax.mailroute.net (Postfix) with ESMTPS id 4JZX3y11MBz1KBSJ
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:49:02 +0000 (UTC)
Received: from localhost (005.lax.mailroute.net [127.0.0.1])
 by 005.lax.mailroute.net (Postfix) with ESMTP id 4JZX3v3xS8z1T5Hq
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-type:content-type
 :content-language:accept-language:message-id:date:date:subject
 :subject:from:from:received:received:received:received; s=mr01;
 t=1642096138; x=1644688139; bh=G4S6AfbrpBLph04GY11u8jx+zDsn/N9b
 n3s43rQL53Y=; b=hXTZCV2mraHL393PADDgQ/6630YFVBOtjodnEoogqTIZQPFn
 wzx361auDf2OleNKi0VKrWCBt6h0ELh+kPeJTng1ysqG1jMekpyBW9WnVcKXEbMt
 NgyabFjqRTuDcnclmXTZ/zsQPS6pTDWhr0hKAxb6sha/2/v1CCfCL3Mm1/15vzjD
 QVO9rWfd0AQpWzNhQTIaSS77gOHrcIlI0NCtH+ezLFw2/ziG89QPmkrIPy0pXdxT
 fLKsF7EPihNpfsUi1YYFsacIzaBHdgr4UAdHO6fkBIHT0KbtSezi5nxPgByTdFBc
 pqRnqVm5zE2VFDG8BAO9Vg8eRu/CKitbFGzCHw==
X-Virus-Scanned: by MailRoute
Received: from 005.lax.mailroute.net ([199.89.1.8])
 by localhost (005.lax [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id trYVd0HENWUB for <buildroot@buildroot.org>;
 Thu, 13 Jan 2022 17:48:58 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 005.lax.mailroute.net (Postfix) with ESMTPS id 4JZX3t5Mtfz1T59B
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:48:58 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 13 Jan 2022 12:48:57 -0500
Received: from CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c]) by
 CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c%7]) with mapi id
 15.02.0858.015; Thu, 13 Jan 2022 12:48:57 -0500
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/lvm2: LC_ALL set to "C" locale before
 generating cmds
Thread-Index: AQHYCKWTYn5GCxU4e0qVwklrtu3mtg==
Date: Thu, 13 Jan 2022 17:48:57 +0000
Message-ID: <03d134dec448470eb60d56a0c8a6ceb5@carnegierobotics.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.20.93]
Content-Type: multipart/mixed;
 boundary="_004_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_"
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lvm2: LC_ALL set to "C" locale
 before generating cmds
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
From: Jeremy Lyda via buildroot <buildroot@buildroot.org>
Reply-To: Jeremy Lyda <jlyda@carnegierobotics.com>
Cc: Jeremy Lyda <jlyda@carnegierobotics.com>
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--_004_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_
Content-Type: multipart/alternative;
	boundary="_000_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_"

--_000_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



--_000_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p><br>
</p>
</div>
</body>
</html>

--_000_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_--

--_004_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_
Content-Type: text/x-patch;
	name="package-lvm2-LC_ALL-set-to-C-locale-before-generatin.patch"
Content-Description: package-lvm2-LC_ALL-set-to-C-locale-before-generatin.patch
Content-Disposition: attachment;
	filename="package-lvm2-LC_ALL-set-to-C-locale-before-generatin.patch";
	size=2475; creation-date="Thu, 13 Jan 2022 17:47:53 GMT";
	modification-date="Thu, 13 Jan 2022 17:47:53 GMT"
Content-Transfer-Encoding: base64

RnJvbSA4NTI3YWNmNTE3N2RkMTdjMGZmYWZjZDFiMzMxYjI1YTUxZDdhNzA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKZXJlbXkgTHlkYSA8amx5ZGFAY2FybmVnaWVyb2JvdGljcy5j
b20+CkRhdGU6IFRodSwgMTMgSmFuIDIwMjIgMTI6MTQ6MDEgLTA1MDAKU3ViamVjdDogW1BBVENI
IDEvMV0gcGFja2FnZS9sdm0yOiBMQ19BTEwgc2V0IHRvICJDIiBsb2NhbGUgYmVmb3JlIGdlbmVy
YXRpbmcKIGNtZHMKClNpZ25lZC1vZmYtYnk6IEplcmVteSBMeWRhIDxqbHlkYUBjYXJuZWdpZXJv
Ym90aWNzLmNvbT4KLS0tCiAuLi50LXRvLUMtbG9jYWxlLWJlZm9yZS1nZW5lcmF0aW5nLWNtZHMu
cGF0Y2ggfCAzNSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzUgaW5zZXJ0
aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbHZtMi8wMDAxLUxDX0FMTC1zZXQt
dG8tQy1sb2NhbGUtYmVmb3JlLWdlbmVyYXRpbmctY21kcy5wYXRjaAoKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbHZtMi8wMDAxLUxDX0FMTC1zZXQtdG8tQy1sb2NhbGUtYmVmb3JlLWdlbmVyYXRpbmct
Y21kcy5wYXRjaCBiL3BhY2thZ2UvbHZtMi8wMDAxLUxDX0FMTC1zZXQtdG8tQy1sb2NhbGUtYmVm
b3JlLWdlbmVyYXRpbmctY21kcy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAw
MDAwMDAwLi5kOWMzMWNjM2YxCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9sdm0yLzAwMDEt
TENfQUxMLXNldC10by1DLWxvY2FsZS1iZWZvcmUtZ2VuZXJhdGluZy1jbWRzLnBhdGNoCkBAIC0w
LDAgKzEsMzUgQEAKK0Zyb20gODc0MmE4NzNkYzNhODkwOTU3NjAxNTJkYjYyYjgyN2RkYmE4Y2Ey
NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb206IEplcmVteSBMeWRhIDxqbHlkYUBjYXJu
ZWdpZXJvYm90aWNzLmNvbT4KK0RhdGU6IFRodSwgMTMgSmFuIDIwMjIgMTI6MDA6NTQgLTA1MDAK
K1N1YmplY3Q6IFtQQVRDSCAxLzFdIExDX0FMTCBzZXQgdG8gIkMiIGxvY2FsZSBiZWZvcmUgZ2Vu
ZXJhdGluZyBjbWRzCisKK0FuIGFzc3VtcHRpb24gaXMgbWFkZSBwcmlvciB0byBnZW5lcmF0aW5n
IHRoZSBjbWRzLmggaGVhZGVyIGZpbGUgdGhhdCB0aGUKK0xDX0NPTExBVEUgbG9jYWxlIHNldHRp
bmcgaXMgc2V0IHRvICJDIiAtLSB0aGlzIGlzIG5vdCBhbHdheXMgdGhlIGNhc2UuIElmIHRoZQor
bG9jYWxlIGlzIHNldCBmb3IgZXhhbXBsZSB0byAiZW5fVVMuVVRGOCIgdGhlbiBpdCB3aWxsIGFs
dGVyIHRoZSB3YXkgdGhhdAordW5kZXJzY29yZXMgY29tcGFyZSB0byBsZXR0ZXJzIGFuZCBudW1i
ZXJzIHN1Y2ggdGhhdCB1bmRlcnNjb3JlcyB3aWxsIGJlIHNvcnRlZAorYWZ0ZXIgbGV0dGVycyBh
bmQgbnVtYmVycy4gTFZNIGluIG91ciBleHBlcmllbmNlIGRvZXMgbm90IGdyYWNlZnVsbHkgaGFu
ZGxlCit0aGlzIGVycm9uZW91cyBzb3J0aW5nIGFuZCByZXN1bHRzIGluIGEgc2VnbWVudGF0aW9u
IGZhdWx0IGF0IHNvbWUgcG9pbnQgaW4KK3Byb2dyYW0gZXhlY3V0aW9uLiBTZXR0aW5nIExDX0FM
TCB0byB0aGUgIkMiIGxvY2FsZSAoc3BlY2lmaWNhbGx5IExDX0NPTExBVEUpCitlbnN1cmVzIGEg
Y29ycmVjdCwgY29uc2lzdGVudCBjb21tYW5kIGVudmlyb25tZW50IGFjcm9zcyB2YXJpb3VzIHN5
c3RlbXMuCisKK1NpZ25lZC1vZmYtYnk6IEplcmVteSBMeWRhIDxqbHlkYUBjYXJuZWdpZXJvYm90
aWNzLmNvbT4KKy0tLQorIHRvb2xzL01ha2VmaWxlLmluIHwgMiArLQorIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQorCitkaWZmIC0tZ2l0IGEvdG9vbHMvTWFr
ZWZpbGUuaW4gYi90b29scy9NYWtlZmlsZS5pbgoraW5kZXggZWM1NDZjYTYzLi5jODUzMDkxNWMg
MTAwNjQ0CistLS0gYS90b29scy9NYWtlZmlsZS5pbgorKysrIGIvdG9vbHMvTWFrZWZpbGUuaW4K
K0BAIC0xODEsNyArMTgxLDcgQEAgY21kcy5oOiAkKHNyY2RpcikvY29tbWFuZC1saW5lcy5pbiBN
YWtlZmlsZQorIAkoIGNhdCAkKHNyY2RpcikvbGljZW5zZS5pbmMgJiYgXAorIAkgIGVjaG8gIi8q
IERvIG5vdCBlZGl0LiBUaGlzIGZpbGUgaXMgZ2VuZXJhdGVkIGJ5IHRoZSBNYWtlZmlsZS4gKi8i
ICYmIFwKKyAJICBlY2hvICJjbWQoQ01EX05PTkUsIG5vbmUpIiAmJiBcCistCSAgJChHUkVQKSAn
XklEOicgJChzcmNkaXIpL2NvbW1hbmQtbGluZXMuaW4gfCBMQU5HPUMgJChTT1JUKSAtdSB8ICQo
QVdLKSAne3ByaW50ICJjbWQoIiAkJDIgIl9DTUQsICIgJCQyICIpIn0nICYmIFwKKysJICAkKEdS
RVApICdeSUQ6JyAkKHNyY2RpcikvY29tbWFuZC1saW5lcy5pbiB8IExBTkc9QyBMQ19BTEw9QyAk
KFNPUlQpIC11IHwgJChBV0spICd7cHJpbnQgImNtZCgiICQkMiAiX0NNRCwgIiAkJDIgIikifScg
JiYgXAorIAkgIGVjaG8gImNtZChDTURfQ09VTlQsIGNvdW50KSIgXAorIAkpID4gJEAKKyAKKy0t
IAorMi4yNS4xCisKLS0gCjIuMjUuMQoK

--_004_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--_004_03d134dec448470eb60d56a0c8a6ceb5carnegieroboticscom_--
