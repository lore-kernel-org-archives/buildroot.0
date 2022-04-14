Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2211CC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:05:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A00CA81A92;
	Thu, 14 Apr 2022 19:05:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iOt82hw4iJMm; Thu, 14 Apr 2022 19:05:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA32481A39;
	Thu, 14 Apr 2022 19:05:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA32E1BF319
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C29A34033D
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:05:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZMQB7uRZHdu for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:05:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3336402C6
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:05:09 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id l7so11841938ejn.2
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=37bNBOygvrsc2WPI4L7pjs1HuktTichlQr3WTHp2Jt4=;
 b=efVw2+aOiQ8TTnQaBtFJr4HJYE8diWo5Z9Jktj0CZRBFvKhmx2MunBPPe8KoIGp0bW
 +hDEfwoy1Ioq7shXXltIPIPQYC5PV/i6LbxAHiCAEcMWGBM/W4FVXTkme6U7wib4vANP
 trquJrq4TPCxPePX/+fUsS/iuW+qRoRFV39kLahTWbbTmfqe0o+HGCiaIsWEwnVSmu/v
 7sWcTKWSXnv7Dm2gyspYQKdIb5oxGkh0thxWelBX9xSsOUL9TNMsjhvcDu5XVu8xIbMs
 ukRyHDNTlG1almZNqLUapVmMjh8agIPxdxQGt6GSJ60fwN2jYI6rPNhGdTFQ8rtiOPgc
 um6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=37bNBOygvrsc2WPI4L7pjs1HuktTichlQr3WTHp2Jt4=;
 b=TEG5z/HJv8Lhim4nlEbsS1QEcb2qSN7J7X+4mtRRFd9F408BgK3VS+nNiME7jWqwRA
 VUcbdMEmbA92R6LyeTU+EhTVTry5CoY/lcN4daxAH+WXT1iAD5d+79vcwqLz78CXFU01
 JElYy0KFwgOipcqCP7jRyfVCKi2gbySoM279Efm5h5l5lZiliqDlpJu4n3dhsqQQUqfh
 D9OJUTcJA3cz1O2eb3gOVVWEglSQ5vBnzRkzWqqBIk8uDUaZhk34iEAuIBz5iPn7rs1f
 yEehnSkmYZyNp4drOjk2sMGYonlOCMFb1Em7B+CmdiamY0kU6wtLtrZbmD7E+1lrw7jY
 l0/Q==
X-Gm-Message-State: AOAM530Gozi/uC3zEAB5PufAD+KIAYY02lFfaa1Dfs36XEcrUXetbwZV
 hL+hmbZkxnMRkKMifioL7dK3Qw==
X-Google-Smtp-Source: ABdhPJxWuRE4ATGHh70WRHd/RMy+IaDA8MXmJuj9q+jMUuWkkSrQmwC6fOSMy54fdSzLKBstQqFnRg==
X-Received: by 2002:a17:907:2d0a:b0:6e8:6188:6fc4 with SMTP id
 gs10-20020a1709072d0a00b006e861886fc4mr3479989ejc.694.1649963107851; 
 Thu, 14 Apr 2022 12:05:07 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906059100b006cee1bceddasm915934ejn.130.2022.04.14.12.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:05:07 -0700 (PDT)
Message-ID: <b2544177-df85-95a4-9b28-699545c69e4a@mind.be>
Date: Thu, 14 Apr 2022 21:05:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20220414174358.38059-1-flaniel@linux.microsoft.com>
 <20220414174358.38059-4-flaniel@linux.microsoft.com>
 <7fa2e422-fbb5-6627-efb6-1eb7d599cae3@mind.be>
Organization: Essensium/Mind
In-Reply-To: <7fa2e422-fbb5-6627-efb6-1eb7d599cae3@mind.be>
Subject: Re: [Buildroot] [PATCH 3/3] package/sysdig: bump to 0.29.1
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE0LzA0LzIwMjIgMjA6NTQsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAxNC8wNC8yMDIyIDE5OjQzLCBGcmFuY2lzIExhbmllbCB3cm90ZToKW3NuaXBdCj4+ICsjIHN5
c2RpZyBuZWVkcyBmYWxjb3NlY3VyaXR5LWxpYnMgc291cmNlcywgc28gd2Ugc2V0IHRoZSBzb3Vj
ZSBkaXJlY3RvcnkgaGVyZS4KPj4gKyMgSXQgd2lsbCBzYWRseSBjb21waWxlIGFnYWluIGZhbGNv
c2VjdXJpdHktbGlicywgc28gd2UgYWxzbyBuZWVkIHRvIHNldCBhZ2Fpbgo+PiArIyBncnBjX2Nw
cF9wbHVnaW4uCj4+ICtTWVNESUdfQ09ORl9PUFRTICs9IAo+PiAtREZBTENPU0VDVVJJVFlfTElC
U19TT1VSQ0VfRElSPSQoQlVJTERfRElSKS9mYWxjb3NlY3VyaXR5LWxpYnMtZTVjNTNkNjQ4ZjNj
NDY5NDM4NWJiZTQ4OGU3ZDQ3ZWFhMzZjMjI5YSAKPj4gLURHUlBDX0NQUF9QTFVHSU49JChIT1NU
X0RJUikvYmluL2dycGNfY3BwX3BsdWdpbiBcCj4KPiDCoFRoaXMgaXMgbm90IG5pY2UgKGFzIHlv
dSB3cm90ZSBpbiB0aGUgY292ZXIgbGV0dGVyKS4gSWYgdGhlcmUncyByZWFsbHkgbm8gd2F5IAo+
IHRvIHRlbGwgc3lzZGlnIHRvIHVzZSB0aGUgbGlicyBpbnN0YWxsZWQgaW4gU1RBR0lOR19ESVIs
IHRoZW4gdGhlIHNvbHV0aW9uIGlzIAo+IHRvIHJlbW92ZSBmYWxjb25zZWN1cml0eS1saWJzIGFu
ZCBpbnN0ZWFkIGRvd25sb2FkIGl0IGFzIHBhcnQgb2YgdGhlIHN5c2RpZyAKPiBwYWNrYWdlLiBU
aGVyZSBhcmUgKGZvcnR1bmF0ZWx5KSBub3QgbWFueSBleGFtcGxlcyBvZiB0aGF0IGluIEJ1aWxk
cm9vdCwgYnV0IAo+IHRoZXJlJ3Mgc29tZXRoaW5nIGEgYml0IHNpbWlsYXIgaW4gYW5kcm9pZC10
b29scy4KCiDCoEp1c3QgdG8gYmUgY2xlYXI6IHRoZSAqcHJlZmVycmVkKiBzb2x1dGlvbiBpcyB0
byBwYXRjaCAKY21ha2UvbW9kdWxlcy9mYWxjb3NlY3VyaXR5LWxpYnMuY21ha2Ugc28gaXQgc3Vw
cG9ydHMgYSBzeXN0ZW0taW5zdGFsbGVkIApmYWxjb3NlY3VyaXR5LWxpYnMuIChBbmQgdGhlbiBz
ZW5kIHRoYXQgcGF0Y2ggdXBzdHJlYW0gdG8gc3lzZGlnLCBvZiBjb3Vyc2UpLgoKCiDCoFJlZ2Fy
ZHMsCiDCoEFybm91dAoKCj4KPiAjIFRha2UgdGhpcyB2ZXJzaW9uIGZyb20gY21ha2UvbW9kdWxl
cy9mYWxjb3NlY3VyaXR5LWxpYnMuY21ha2UKPiBTWVNESUdfRkFMQ09TRUNVUklUWV9MSUJTX1ZF
UlNJT04gPSBlNWM1M2Q2NDhmM2M0Njk0Mzg1YmJlNDg4ZTdkNDdlYWEzNmMyMjlhCj4gU1lTRElH
X0VYVFJBX0RPV05MT0FEUyA9ICQoY2FsbCAKPiBnaXRodWIsZmFsY29zZWN1cml0eSxsaWJzLCQo
U1lTRElHX0ZBTENPU0VDVVJJVFlfTElCU19WRVJTSU9OKSkvZmFsY29zZWN1cml0eS1saWJzLSQo
U1lTRElHX0ZBTENPU0VDVVJJVFlfTElCU19WRVJTSU9OKS50YXIuZ3oKPiBkZWZpbmUgU1lTRElH
X0VYVFJBQ1RfRkFMQ09TRUNVUklUWV9MSUJTCj4gwqDCoMKgwqDCoMKgwqAgJChjYWxsIHN1aXRh
YmxlLWV4dHJhY3RvciwkKG5vdGRpciAkKFNZU0RJR19FWFRSQV9ET1dOTE9BRFMpKSkgXAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAkKFNZU0RJR19ETF9ESVIpLyQobm90ZGlyICQo
U1lTRElHX0VYVFJBX0RPV05MT0FEUykpIHwgXAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAkKFRBUikgLUMgJChARCkvZmFsY29zZWN1cml0eS1saWJzIC0tc3RyaXAtY29tcG9uZW50
cz0xIFwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICQoVEFSX09QVElPTlMpIC0KPiBlbmRlZgo+
IFNZU0RJR19QT1NUX0VYVFJBQ1RfSE9PS1MgKz0gU1lTRElHX0VYVFJBQ1RfRkFMQ09TRUNVUklU
WV9MSUJTCj4KPiAoeW91J2xsIG5lZWQgdG8gYWRhcHQgdGhlIGFib3ZlIHRvIG1ha2Ugc3VyZSBp
dCdzIGV4dHJhY3RlZCBpbiB0aGUgcmlnaHQgcGxhY2UuKQo+Cj4KPiDCoFNpbmNlIHRoZSBkcml2
ZXIgZXRjLiBhcmUgdGhlbiBwYXJ0IG9mIHRoZSBzeXNkaWcgcGFja2FnZSBhZ2Fpbiwgbm90IGFz
IG11Y2ggCj4gd2lsbCBjaGFuZ2UuIEp1c3Qgc29tZSBkaXJlY3RvcnkgbmFtZXMuCj4KPiDCoEJU
VywgcGxlYXNlIGFsc28gbWVudGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UgdGhhdCB0aGUgaXNz
dWUgd2l0aCB0aGUgZHJpdmVyIAo+IGlzIGZpeGVkIGluIHJlY2VudCBmYWxjb3NlY3VyaXR5L2xp
YnMKPgo+IMKgUmVnYXJkcywKPiDCoEFybm91dAo+Cj4+ICsgLURWQUxJSlNPTl9JTkNMVURFPSQo
QlVJTERfRElSKS92YWxpanNvbi0wLjYvaW5jbHVkZS92YWxpanNvbgo+PiDCoCDCoCBTWVNESUdf
TU9EVUxFX1NVQkRJUlMgPSBkcml2ZXIKPj4gwqAgU1lTRElHX01PRFVMRV9NQUtFX09QVFMgPSBL
RVJORUxESVI9JChMSU5VWF9ESVIpCj4+IMKgIC0kKGV2YWwgJChrZXJuZWwtbW9kdWxlKSkKPj4g
wqAgJChldmFsICQoY21ha2UtcGFja2FnZSkpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
