Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF0DC77B61
	for <buildroot@archiver.kernel.org>; Sun,  9 Apr 2023 13:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70B7D40022;
	Sun,  9 Apr 2023 13:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70B7D40022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLWWTzuVzygg; Sun,  9 Apr 2023 13:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F3DB40143;
	Sun,  9 Apr 2023 13:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F3DB40143
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 420311C2C89
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2014240988
 for <buildroot@lists.busybox.net>; Sun,  9 Apr 2023 13:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2014240988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5z66ck0NFOj for <buildroot@lists.busybox.net>;
 Sun,  9 Apr 2023 13:26:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB1340999
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADB1340999
 for <buildroot@buildroot.org>; Sun,  9 Apr 2023 13:26:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id sg7so18332014ejc.9
 for <buildroot@buildroot.org>; Sun, 09 Apr 2023 06:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681046767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YgEOq9McdJ7kn+p4N+AVYLJSSm7UFcuNJGvVIwHaGKI=;
 b=fT68xFdfL0vX1DMnvupul46SwCZSmwFT62QXXpJktb/PilDJYbzw8H1Mh3FvMAYxRp
 h73dvAmyjOngsEFcNovgas8P/CSyxhV/NJDLLPCU4jmRdfp1ESqm5HhecvWiOMODh5bS
 INrTXSKLb1X3X7FPwL1e/xHaxSZtDZDD/nkXFNladPTB2m8hh8kLa/7ODHu7/CFLq4dr
 qm4kthwPXFuTWybB1eAAqLH9Hx0fYOJO2cDWoFN2+zFeaBjqvVrLgvJxmcegozjJjXDr
 6QuxhE4S6Y/xLl+5xkBRA2NelXgXFg/2ZIYMMIwpI2ciRjCpltkgEVYkYJ4HY76L4hT8
 7ulg==
X-Gm-Message-State: AAQBX9f8uauO+yRbKagrD4jVr0UVSZQBhSvEbPs1wpF2mDi+pOBeIV5d
 9IIAfzgeQTj9SNxD5G/a0wGxDA==
X-Google-Smtp-Source: AKy350bfo7TCWzVKUe4NHUqgMNnUaXrUKsZ+dSVON+8f1tMw2owJu1bPhtZih1093xCGIfUYZbjoJA==
X-Received: by 2002:a17:907:bb8f:b0:94a:55ce:8155 with SMTP id
 xo15-20020a170907bb8f00b0094a55ce8155mr3264153ejc.38.1681046766761; 
 Sun, 09 Apr 2023 06:26:06 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 re9-20020a170906d8c900b0093dbb008281sm4149240ejb.130.2023.04.09.06.26.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 06:26:05 -0700 (PDT)
Message-ID: <a0a284d2-484c-cd50-d1a7-9278c1233c7b@mind.be>
Date: Sun, 9 Apr 2023 15:26:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Laurent Vivier <laurent@vivier.eu>, buildroot@buildroot.org
References: <20230201204848.2099336-1-laurent@vivier.eu>
 <20230201204848.2099336-2-laurent@vivier.eu>
 <52ab86d4-8008-9044-47e4-628c3da5ef7b@mind.be>
 <4c554ddf-38c1-ee71-826f-00e22f2cc180@vivier.eu>
 <194ac639-44e4-b267-7e8e-9739a15f12a4@vivier.eu>
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <194ac639-44e4-b267-7e8e-9739a15f12a4@vivier.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681046767;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YgEOq9McdJ7kn+p4N+AVYLJSSm7UFcuNJGvVIwHaGKI=;
 b=DseMN1JpPVTq82Ce3dpJzOc74IQvjPPdfVmOo73s11E0uhpX4hvlva2gMH3Dy8ik43
 Zt74VhMPKOng/hmySN+yM6WpTmitIpmyKFRqeBtTqs6RSD0nehUI1k5ux/frefQUtuvO
 Cf+NmC4cfkA3y/wNpug4bDSg200iYuagUQW/oCUHbBxsXWk07SXPg4098s/747Oyg1Rf
 zJlO2U8WgXipRzXiaEVlZwLGoLPQ9ofEe1IKidJ6FspeoP6XJ6E1LXJWphf7b3kMJC1O
 SKVI3wlkPyE50yEBURC9LQypTxxz0gvNBzdz2PAtPnRZFl53k2vvs7OUq5kokpeFmatU
 sl6Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DseMN1Jp
Subject: Re: [Buildroot] [PATCH v10 1/3] package: add petitboot
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
Cc: Thomas Huth <huth@tuxfamily.org>, Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNC8yMDIzIDE4OjEwLCBMYXVyZW50IFZpdmllciB3cm90ZToKPiBMZSAwNi8wNC8y
MDIzIMOgIDE1OjI0LCBMYXVyZW50IFZpdmllciBhIMOpY3JpdMKgOgo+PiBIaSBBcm5vdXQsCj4+
Cj4+IHRoYW5rIHlvdSBmb3IgeW91ciB3b3JrLgo+Pgo+PiBUaGUgdXBkYXRlIHRvIGtleGVjIDIu
MC4yNiBoYXMgYnJva2VuIHRoZSBidWlsZCB3aXRoIG02OGs6Cj4+Cj4+IGNvbW1pdCA2OTA1MzE4
NmM5ZjE1NjE4NTUzNTdiZTU3NGM3MGMwYjNhZDBkZGNiCj4+IEF1dGhvcjogSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4KPj4gRGF0ZTrCoMKgIFdlZCBNYXIgMSAyMzowMTo1OCAyMDIzICsw
MTAwCj4+Cj4+IMKgwqDCoMKgwqAgcGFja2FnZS9rZXhlYzogYnVtcCB0byB2ZXJzaW9uIDIuMC4y
Ngo+Pgo+PiDCoMKgwqDCoMKgIFNlZSByZWxlYXNlIGFubm91bmNlOgo+PiDCoMKgwqDCoMKgIGh0
dHBzOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9waXBlcm1haWwva2V4ZWMvMjAyMi1EZWNlbWJlci8w
MjYzOTkuaHRtbAo+Pgo+PiDCoMKgwqDCoMKgIFNpZ25lZC1vZmYtYnk6IEp1bGllbiBPbGl2YWlu
IDxqdS5vQGZyZWUuZnI+Cj4+IMKgwqDCoMKgwqAgU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6
em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPj4KPj4KPj4ga2V4ZWMvYXJjaC9t
NjhrL2Jvb3RpbmZvLmM6IEluIGZ1bmN0aW9uICdib290aW5mb19hZGRfcm5nX3NlZWQnOgo+PiBr
ZXhlYy9hcmNoL202OGsvYm9vdGluZm8uYzoyMzE6MTM6IHdhcm5pbmc6IGltcGxpY2l0IGRlY2xh
cmF0aW9uIG9mIGZ1bmN0aW9uIAo+PiAnZ2V0cmFuZG9tJzsgZGlkIHlvdSBtZWFuICdzcmFuZG9t
Jz8gWy1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCj4+IMKgwqDCoCAyMzEgfMKgwqDC
oMKgwqDCoMKgwqAgaWYgKGdldHJhbmRvbShiaS0+cm5nX3NlZWQuZGF0YSwgUk5HX1NFRURfTEVO
LCAKPj4gR1JORF9OT05CTE9DSykgIT0gUk5HX1NFRURfTEVOKSB7Cj4+IMKgwqDCoMKgwqDCoMKg
IHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn5+fn5+fn5+Cj4+IMKgwqDCoMKgwqDCoMKgIHzC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3JhbmRvbQo+PiBrZXhlYy9hcmNoL202OGsvYm9vdGlu
Zm8uYzoyMzE6NTY6IGVycm9yOiAnR1JORF9OT05CTE9DSycgdW5kZWNsYXJlZCAoZmlyc3QgCj4+
IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQo+PiDCoMKgwqAgMjMxIHzCoMKgwqDCoMKgwqDCoMKgIGlm
IChnZXRyYW5kb20oYmktPnJuZ19zZWVkLmRhdGEsIFJOR19TRUVEX0xFTiwgCj4+IEdSTkRfTk9O
QkxPQ0spICE9IFJOR19TRUVEX0xFTikgewo+Pgo+PiBJdCdzIHN0cmFuZ2UgYmVjYXVzZSBzeXMv
cmFuZG9tLmggaXMgY29ycmVjdGx5IGluY2x1ZGVkLgo+Pgo+PiBUaGlzIGNvbWVzIGZyb206Cj4+
Cj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9ob3Jtcy9rZXhlYy10b29scy9jb21taXQvYjlkZTA1MTg0
ODE2ZjE1ZjBkNjE1ZmUxOWM0MDY3YzEzODcyNTk4Ygo+Pgo+PiDCoMKgwqAgbTY4azogcGFzcyBy
bmcgc2VlZCB2aWEgQklfUk5HX1NFRUQKPj4gwqDCoMKgIEluIG9yZGVyIHRvIHBhc3MgZnJlc2gg
ZW50cm9weSB0byBrZXhlYydkIGtlcm5lbHMsIHVzZSBCSV9STkdfU0VFRAo+PiDCoMKgwqAgZm9y
IHBhc3NpbmcgYSBzZWVkLCB3aXRoIHRoZSBzYW1lIHNlbWFudGljcyB0aGF0IGtleGVjLXRvb2xz
IGN1cnJlbnRseQo+PiDCoMKgwqAgdXNlcyBmb3IgaTM4NidzIHNldHVwX2RhdGEuCj4+Cj4+IMKg
wqDCoCBMaW5rOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3RvcnZhbGRzL2MvZGM2M2EwODZkYWVl
OTJjNjNlMwo+PiDCoMKgwqAgU2lnbmVkLW9mZi1ieTogSmFzb24gQS4gRG9uZW5mZWxkIDxKYXNv
bkB6eDJjNC5jb20+Cj4+IMKgwqDCoCBTaWduZWQtb2ZmLWJ5OiBTaW1vbiBIb3JtYW4gPGhvcm1z
QGtlcm5lbC5vcmc+Cj4+Cj4+IERvIHdlIG5lZWQgc29tZXRoaW5nIHNwZWNpYWwgaW4gYnVpbGRy
b290Pwo+IAo+IFRoZSBwcm9ibGVtIHNlZW1zIHRvIGNvbWUgZnJvbSB1Y2xpYmMtMS4wLjQzLCBp
biBpbmNsdWRlL3N5cy9yYW5kb20uaCB0aGF0IAo+IGNvbmRpdGlvbmFsbHkgZGVmaW5lcyB0aGVt
Ogo+IAo+ICNpZiBkZWZpbmVkIF9fVUNMSUJDX0xJTlVYX1NQRUNJRklDX18gJiYgZGVmaW5lZCBf
X1VTRV9HTlUKPiAjIGlmIDAgLypkZWYgX19BU1NVTUVfR0VUUkFORE9NX1NZU0NBTEwgKi8KPiAj
wqAgaW5jbHVkZSA8bGludXgvcmFuZG9tLmg+Cj4gIyBlbHNlCj4gI8KgIHVuZGVmIEdSTkRfTk9O
QkxPQ0sKPiAjwqAgdW5kZWYgR1JORF9SQU5ET00KPiAvKgo+ICDCoCogRmxhZ3MgZm9yIGdldHJh
bmRvbSgyKQo+ICDCoCoKPiAgwqAqIEdSTkRfTk9OQkxPQ0vCoMKgwqDCoMKgwqDCoCBEb24ndCBi
bG9jayBhbmQgcmV0dXJuIEVBR0FJTiBpbnN0ZWFkCj4gIMKgKiBHUk5EX1JBTkRPTcKgwqDCoMKg
wqDCoMKgwqDCoCBVc2UgdGhlIC9kZXYvcmFuZG9tIHBvb2wgaW5zdGVhZCBvZiAvZGV2L3VyYW5k
b20KPiAgwqAqLwo+ICPCoCBkZWZpbmUgR1JORF9OT05CTE9DSyAweDAwMDEKPiAjwqAgZGVmaW5l
IEdSTkRfUkFORE9NwqDCoCAweDAwMDIKPiAjIGVuZGlmCj4gLyogRklYTUU6IGFyZW4ndCB0aGVy
ZSBhIGNvdXBsZSBvZiBfX3Jlc3RyaWN0IGFuZCBjb25zdCBtaXNzaW5nID8gKi8KPiBleHRlcm4g
aW50IGdldHJhbmRvbSh2b2lkICpfX2J1Ziwgc2l6ZV90IGNvdW50LCB1bnNpZ25lZCBpbnQgZmxh
Z3MpCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fbm9ubnVsbCAoKDEpKSBfX3d1cjsKPiAjZW5k
aWYKPiAKPiBUaGlzIGZpeGVzIHRoZSBwcm9ibGVtOgo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2tleGVjL2tleGVjLm1rIGIvcGFja2FnZS9rZXhlYy9rZXhlYy5tawo+IGluZGV4IDU2MmIwOTAx
MmI2My4uZTRlYzRlY2UxMzMyIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uva2V4ZWMva2V4ZWMubWsK
PiArKysgYi9wYWNrYWdlL2tleGVjL2tleGVjLm1rCj4gQEAgLTEzLDYgKzEzLDkgQEAgS0VYRUNf
Q1BFX0lEX1BST0RVQ1QgPSBrZXhlYy10b29scwo+ICDCoEtFWEVDX0NQRV9JRF9WRU5ET1IgPSBr
ZXhlYy10b29sc19wcm9qZWN0Cj4gIMKgS0VYRUNfU0VMSU5VWF9NT0RVTEVTID0ga2R1bXAKPiAK
PiArIyBfR05VX1NPVVJDRSBpcyBuZWVkZWQgdG8gaGF2ZSBkZWZpbml0aW9uIG9mIGdldHJhbmRv
bSgpIHdpdGggdWNsaWJjCj4gK0tFWEVDX0NPTkZfRU5WICs9IENGTEFHUz0iJChUQVJHRVRfQ0ZM
QUdTKSAtRF9HTlVfU09VUkNFIgoKICBBcyBzdWNoIHRoaXMgcGF0Y2ggbG9va3MgT0ssIGJ1dCBp
dCdzIHN1cnByaXNpbmcgdGhhdCB0aGUgc2FtZSBwcm9ibGVtIGRvZXNuJ3QgCm9jY3VyIHdpdGgg
dGhlIGRvemVucyBvZiBvdGhlciBwYWNrYWdlcyB0aGF0IHVzZSBnZXRyYW5kb20oKS4uLiBJIGNh
bid0IGltYWdlIAp0aGF0IGFsbCBvZiB0aGUgZGVmaW5lIF9HTlVfU09VUkNFLi4uCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0Cgo+ICsKPiAgwqAjIE1ha2VmaWxlIGV4cGVjdHMgJFNUUklQIC1vIHRvIHdv
cmssIHNvIG5lZWRlZCBmb3IgIUJSMl9TVFJJUF9zdHJpcAo+ICDCoEtFWEVDX01BS0VfT1BUUyA9
IFNUUklQPSIkKFRBUkdFVF9DUk9TUylzdHJpcCIKPiAKPiBUaGFua3MsCj4gTGF1cmVudAo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
