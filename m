Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D44ECC52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 09:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D44B412F3;
	Tue, 13 Aug 2024 09:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5V3riIa5h-sJ; Tue, 13 Aug 2024 09:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0110F41302
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0110F41302;
	Tue, 13 Aug 2024 09:09:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14B071BF3DC
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 09:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EEF4481DF6
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 09:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ubdn4uz-p8-N for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 09:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=80.12.210.124;
 helo=smtp-out.orange.com; envelope-from=yann.morin@orange.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DD531818D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD531818D7
Received: from smtp-out.orange.com (smtp-out.orange.com [80.12.210.124])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD531818D7
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 09:09:07 +0000 (UTC)
Received: from unknown (HELO opfedv1rlp0c.nor.fr.ftgroup) ([x.x.x.x]) by
 smtp-out.orange.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2024 11:09:04 +0200
Received: from unknown (HELO OPE16NORMBX305.corporate.adroot.infra.ftgroup)
 ([x.x.x.x]) by opfedv1rlp0c.nor.fr.ftgroup with
 ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 13 Aug 2024 11:09:04 +0200
Received: from tl-lnx-nyma7486-2 [x.x.x.x] by
 OPE16NORMBX305.corporate.adroot.infra.ftgroup [x.x.x.x] with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 11:09:03 +0200
Received: by tl-lnx-nyma7486-2 (sSMTP sendmail emulation);
 Tue, 13 Aug 2024 11:09:02 +0200
From: yann.morin@orange.com
X-IronPort-AV: E=Sophos;i="6.09,285,1716242400"; d="scan'208";a="181544538"
Date: Tue, 13 Aug 2024 11:09:02 +0200
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Message-ID: <ZrsirnrvgsEIpAJI@tl-lnx-nyma7486-2>
References: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240719-ztext-v5-1-ec46696d4ed9@gmx.net>
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX402.corporate.adroot.infra.ftgroup
 (10.115.26.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; i=@orange.com; q=dns/txt; s=orange002;
 t=1723540147; x=1755076147;
 h=date:to:cc:subject:message-id:references:mime-version:
 in-reply-to:content-transfer-encoding:from;
 bh=zYQq4A9PIlCt/6YZVe6NBRRUG7UuF0aSDZ4rZnnHORM=;
 b=jWcFkG0l5L4d8IDZwzYfPR0NOCQabNRq0P4HHwClF0wpksos4Etn1biq
 QJGyDHjZMBUAJuJ5scf8YdxZdALUpLTUYY8B92afeol9Q0gF8Ug7NthAz
 B1f98s1HZlfpvAU20ZvTOmms+fuS9vOArSpx/hcP1T95lzIFlKLXWlIXm
 rwEgAIvLMPM8Nnkx9lbMP175ts8T0oN6OYyXc4tH/H+K+IRfh7bLZlgr7
 X9PEhAS5O0TjaElbXcrZychAFMhjD+RJuwmgovJKRNPZ0uzzWw5GvJ1ci
 HvCs9E+AnoyfEQcJSEZZ93oAd3INeZeQC66LkD+IbtVkipeqScPOqotxh
 g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=orange.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=orange.com header.i=@orange.com header.a=rsa-sha256
 header.s=orange002 header.b=jWcFkG0l
Subject: Re: [Buildroot] [PATCH v5] Config.in: ban textrels on musl
 toolchains
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
Cc: David du Colombier <0intro@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Si4sIEFsbCwKCitCZXJuZCBhbmQgK0RhdmlkIGZvciB4MjY0OgoKT24gMjAyNC0wNy0xOSAxNzoy
NyArMDIwMCwgSi4gTmV1c2Now6RmZXIgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gVGhp
cyBwYXRjaCBmb3JiaWRzIHRoZSB1c2Ugb2YgVEVYVFJFTHMgb24gbXVzbCB0b29sY2hhaW5zIHdp
dGggZHluYW1pYwo+IGxpbmtpbmcuCgpBbm90aGVyIGJ1aWxkIGZhaWx1cmUgZHVlIHRvIHRoaXMg
Y2hhbmdlOgoKICAgIFsuLi5dL2J1aWxkcm9vdC9vdXRwdXQvcGVyLXBhY2thZ2UveDI2NC9ob3N0
L2Jpbi8uLi9saWIvZ2NjL2k1ODYtYnVpbGRyb290LWxpbnV4LW11c2wvMTIuNC4wLy4uLy4uLy4u
Ly4uL2k1ODYtYnVpbGRyb290LWxpbnV4LW11c2wvYmluL2xkOiBjb21tb24veDg2L2RjdC1hLTgu
bzogd2FybmluZzogcmVsb2NhdGlvbiBpbiByZWFkLW9ubHkgc2VjdGlvbiBgLnRleHQnCiAgICBb
Li4uXS9idWlsZHJvb3Qvb3V0cHV0L3Blci1wYWNrYWdlL3gyNjQvaG9zdC9iaW4vaTU4Ni1idWls
ZHJvb3QtbGludXgtbXVzbC1nY2MtcmFubGliIGxpYngyNjQuYQogICAgWy4uLl0vYnVpbGRyb290
L291dHB1dC9wZXItcGFja2FnZS94MjY0L2hvc3QvYmluLy4uL2xpYi9nY2MvaTU4Ni1idWlsZHJv
b3QtbGludXgtbXVzbC8xMi40LjAvLi4vLi4vLi4vLi4vaTU4Ni1idWlsZHJvb3QtbGludXgtbXVz
bC9iaW4vbGQ6IHJlYWQtb25seSBzZWdtZW50IGhhcyBkeW5hbWljIHJlbG9jYXRpb25zCiAgICBj
b2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0dXMKICAgIG1ha2VbMl06ICoq
KiBbTWFrZWZpbGU6MjUxOiBsaWJ4MjY0LnNvLjE2NF0gRXJyb3IgMQogICAgbWFrZVsyXTogKioq
IFdhaXRpbmcgZm9yIHVuZmluaXNoZWQgam9icy4uLi4KICAgIG1ha2VbMV06ICoqKiBbcGFja2Fn
ZS9wa2ctZ2VuZXJpYy5tazoyODk6IFsuLi5dL2J1aWxkcm9vdC9vdXRwdXQvYnVpbGQveDI2NC1i
YWVlNDAwZmE5Y2VkNmY1NDgxYTcyODEzOGZlZDZlODY3YjBmZjdmLy5zdGFtcF9idWlsdF0gRXJy
b3IgMgogICAgbWFrZTogKioqIFtNYWtlZmlsZTo4MzogX2FsbF0gRXJyb3IgMgoKVGhlcmUgaXMg
c3RpbGwgbm8gZmFpbHVyZSBpbiB0aGUgYXV0b2J1aWxkZXJzLCBhcyB4MjY0IGlzIHF1aXRlIGxh
dGUKaW4gdGhlIGFscGhhYmV0aWNhbCBvcmRlciwgc28gaXQgcHJvYmFibHkgaXMganVzdCBoaWRk
ZW4gYnkgZWFybGllcgpmYWlsdXJlcy4uLgoKSSBoYXZlIG5vIGlkZWEgd2hhdCB0byBsb29rIGZv
ciB0byBhdm9pZCB0aG9zZSByZWxvY2F0aW9ucyBpbiB0aGUgZmlyc3QKcGxhY2UsIHNvIGNvdWxk
IHlvdSBoYXZlIGEgbG9vaywgcGxlYXNlPwoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCi0tIAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19fX19fX19fX19fCi4tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLTogICAgICAgXyAgICA6LS0tLS0tLS0t
LS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8ICAgIF9f
LyApICAgfCAvIlwgQVNDSUkgUklCQk9OIHwKfCAgICAgICAgICAgICAgICAgfCBTb2Z0d2FyZSAg
RGVzaWduZXIgfCAgXy8gLSAvJyAgIHwgXCAvIENBTVBBSUdOICAgICB8CnwgKzMzIDYzOC40MTEu
MjQ1ICctLS0tLS0tLS0tLS0tLS0tLS0tLTogKF8gICAgYC0tLCB8ICBYICBBR0FJTlNUICAgICAg
fAp8IHlhbm4ubW9yaW4gKGF0KSBvcmFuZ2UuY29tICAgICAgICAgICB8Xz0iICAgICwtLScgfCAv
IFwgSFRNTCBNQUlMICAgIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
Ol9fX19fXy9fX19fXzotLS0tLS0tLS0tLS0tLS0tLS0nCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCkNlIG1lc3NhZ2UgZXQgc2VzIHBpZWNlcyBq
b2ludGVzIHBldXZlbnQgY29udGVuaXIgZGVzIGluZm9ybWF0aW9ucyBjb25maWRlbnRpZWxsZXMg
b3UgcHJpdmlsZWdpZWVzIGV0IG5lIGRvaXZlbnQgZG9uYw0KcGFzIGV0cmUgZGlmZnVzZXMsIGV4
cGxvaXRlcyBvdSBjb3BpZXMgc2FucyBhdXRvcmlzYXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNl
IG1lc3NhZ2UgcGFyIGVycmV1ciwgdmV1aWxsZXogbGUgc2lnbmFsZXINCmEgbCdleHBlZGl0ZXVy
IGV0IGxlIGRldHJ1aXJlIGFpbnNpIHF1ZSBsZXMgcGllY2VzIGpvaW50ZXMuIExlcyBtZXNzYWdl
cyBlbGVjdHJvbmlxdWVzIGV0YW50IHN1c2NlcHRpYmxlcyBkJ2FsdGVyYXRpb24sDQpPcmFuZ2Ug
ZGVjbGluZSB0b3V0ZSByZXNwb25zYWJpbGl0ZSBzaSBjZSBtZXNzYWdlIGEgZXRlIGFsdGVyZSwg
ZGVmb3JtZSBvdSBmYWxzaWZpZS4gTWVyY2kuDQoNClRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFj
aG1lbnRzIG1heSBjb250YWluIGNvbmZpZGVudGlhbCBvciBwcml2aWxlZ2VkIGluZm9ybWF0aW9u
IHRoYXQgbWF5IGJlIHByb3RlY3RlZCBieSBsYXc7DQp0aGV5IHNob3VsZCBub3QgYmUgZGlzdHJp
YnV0ZWQsIHVzZWQgb3IgY29waWVkIHdpdGhvdXQgYXV0aG9yaXNhdGlvbi4NCklmIHlvdSBoYXZl
IHJlY2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBh
bmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBhbmQgaXRzIGF0dGFjaG1lbnRzLg0KQXMgZW1haWxzIG1h
eSBiZSBhbHRlcmVkLCBPcmFuZ2UgaXMgbm90IGxpYWJsZSBmb3IgbWVzc2FnZXMgdGhhdCBoYXZl
IGJlZW4gbW9kaWZpZWQsIGNoYW5nZWQgb3IgZmFsc2lmaWVkLg0KVGhhbmsgeW91LgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
