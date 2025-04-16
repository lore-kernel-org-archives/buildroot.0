Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500ABC369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B0C26F5C3;
	Wed, 16 Apr 2025 21:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C1CWFD_kQoMq; Wed, 16 Apr 2025 21:09:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362E76F5D2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 362E76F5D2;
	Wed, 16 Apr 2025 21:09:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ACC11159
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9972881AF5
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIdg17xKU4gd for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:08:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7915984958
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7915984958
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7915984958
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:08:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9526B1C00C0; Wed, 16 Apr 2025 23:08:57 +0200 (CEST)
Message-ID: <7af90bd7-80c5-4f74-8915-76195a74b80c@rnout.be>
Date: Wed, 16 Apr 2025 23:08:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20250324115215.972943-1-alex.bennee@linaro.org>
Content-Language: en-GB
In-Reply-To: <20250324115215.972943-1-alex.bennee@linaro.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1744837737; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cVJ4G26USkd8sYl/6bUkZFWwqtoILO+LvODmAG3jsxk=;
 b=hHJrT94HQ683/AEMmbCfh0U6ugE7WgT+/lwoRjkVp/s6yX66M68Yum3rHM5mydnyU2+iBX
 0SebQmPughOj7P4eqUlBNl97zTZ4T3xZfVzoLa4zd2PhbSAvyGhB612R8BXSQ52wsVRhS7
 3eAvmXpIdMjujZrs1JvJnLIUvp4/A/Fq8YUjoqU17ltEUSVX7A8TaAnTadstcpaL8+y3cd
 2RiXFuR0hUjRwi+P06BEFYm/9TiNQhR0Dkgw9jb0lBMHcrEQPt6NmEF01YKrd5v4CPst7D
 7gxWr2J0QrhSOToHPY8UWnGISLEwEm11SnyyCCqThcD0CNMtBhHkfIAnXTE+rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [RFC PATCH] support/testing: make time setting
 portable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDI0LzAzLzIwMjUgMTI6NTIsIEFsZXggQmVubsOpZSB3cm90ZToKPiBUaGUgYnVzeWJveCBk
YXRlIGFwcGxldCBhY2NlcHRzIHRoZSBmb2xsb3dpbmc6Cj4KPiAgICBkYXRlIEAxMjM0NTY3Cj4K
PiBidXQgdGhpcyBjb25mdXNlcyB0aGUgY29yZXV0aWxzIHZlcnNpb24gd2hpY2ggZG9lc24ndCBp
bXBsaWNpdGx5IHNldAo+IHRpbWUuIEFzIHNvbWUgdGVzdHMgbWlnaHQgbmVlZCBjb3JldXRpbHMg
YmluYXJpZXMgd2Ugc2hvdWxkIGVuc3VyZSB0aGUKPiBlbXVsYXRvciBsb2dpbiB3aWxsIHdvcmsg
d2l0aCBib3RoLiBGaXggdGhpcyBieSBwYXNzaW5nIHRoZSAtcyAoc2V0KQo+IG9wdGlvbiB0byB0
aGUgY29tbWFuZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVA
bGluYXJvLm9yZz4KCiDCoEFwcGxpZWQgdG8gMjAyNS4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRz
LAogwqBBcm5vdXQKCj4gLS0tCj4gICBzdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkg
fCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkgYi9zdXBw
b3J0L3Rlc3RpbmcvaW5mcmEvZW11bGF0b3IucHkKPiBpbmRleCA3ZjQxZTUyYTQ0Li5hNmZlOTYx
M2I3IDEwMDY0NAo+IC0tLSBhL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weQo+ICsr
KyBiL3N1cHBvcnQvdGVzdGluZy9pbmZyYS9lbXVsYXRvci5weQo+IEBAIC0xNTUsNyArMTU1LDcg
QEAgY2xhc3MgRW11bGF0b3Iob2JqZWN0KToKPiAgIAo+ICAgICAgICAgICBzZWxmLmNvbm5lY3Rf
c2hlbGwoKQo+ICAgCj4gLSAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBzZWxmLnJ1bihmImRh
dGUgQHtpbnQodGltZS50aW1lKCkpfSIpCj4gKyAgICAgICAgb3V0cHV0LCBleGl0X2NvZGUgPSBz
ZWxmLnJ1bihmImRhdGUgLXMgQHtpbnQodGltZS50aW1lKCkpfSIpCj4gICAgICAgICAgIGlmIGV4
aXRfY29kZToKPiAgICAgICAgICAgICAgIHJhaXNlIFN5c3RlbUVycm9yKCJDYW5ub3Qgc2V0IGRh
dGUgaW4gdmlydHVhbCBtYWNoaW5lIikKPiAgIApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
