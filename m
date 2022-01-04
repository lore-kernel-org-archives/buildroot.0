Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF4C2C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C845607F0;
	Tue,  4 Jan 2022 17:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JIqppfIymzjs; Tue,  4 Jan 2022 17:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B898160B91;
	Tue,  4 Jan 2022 17:32:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF5931BF2EF
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:32:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB93441507
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:32:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pvFPPmW7vXC6 for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:32:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4A76410C4
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:32:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id j21so151182569edt.9
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=rqiVZfiZmJ/PLJ4fNrhTbaGHTMfWgiXn1pTH7kQ0O3Y=;
 b=HR/iUlPzkHHgbAMi+oSN2fVKcA6Rb0pSTE5+jiNFmGTIuv7ib0qIWZM6aZacODQvCz
 C2UI34jlojd7UWcRJDtI4AuNkRD0pAeqZxfIeOEDpjRgdmelgnwEYQzWLnvrM1l26wQx
 sYXuMxY3T4hFZi+WeQTQiAkxO08Uca1Oov7kZJbF3FsKvDgtMKD41e8Igk7mF/Y4LmfX
 0BCisAD1fbv3oq0c3J9WnUdXfU3G8+EW3h+vtAE1E8ni0/Z1SCH1BYVP3nNC6Xn6pV+/
 +DFjbTvkRbS1yd3fPzHMiemxMlX//A62LKEYYN4JNEM1OgkCL5zkiiV7PTB9mhSrqKva
 kr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:organization:in-reply-to
 :content-transfer-encoding;
 bh=rqiVZfiZmJ/PLJ4fNrhTbaGHTMfWgiXn1pTH7kQ0O3Y=;
 b=H86xptF50v3/c+91cA2qvlccyRAsKnlmWFHQ1tI7mkQDJ1qY7NpcQBuuzywZmwK6a6
 cXHJUlaAUNLc3dGtF3qtefh1fTbHsoSdkn3NEiS+AQKf6sjSqCD4L7niaD54eeuF2S5W
 Xo637b3taCS99KGe3GQ/7v+FTgdgv7SUQqPSEDMTuBzqxoZ3uS6ZO4eq/goFjMfv512X
 9zXVHN34SsK/IB/lDySQIRMyn3DRxTrESElW3quDSB3vYwD9GMdBl7h5W1HbEJF7BiW5
 y62pOfDge8QDS+jCQhTG1lsQ6GCjJ5qgI2XfmTfnwHTnFfrBbtw2MiSTWc7OTRYEZDp0
 IwvQ==
X-Gm-Message-State: AOAM5333c4/ojxhnARCY5Yet0Yx/kBbWQEQwVpbZUgo4XlJCIaVKZCfu
 o/hbmMwMlLK7G4VV/fmalk8Pn609ufYcmQ==
X-Google-Smtp-Source: ABdhPJwv7HYzbbpWQu2m/TDpyrWewzj4PfDGwfdhINDf+MF+N698WSq4hk4oZz4S3xknmn/W2dkrZg==
X-Received: by 2002:a17:907:8a1b:: with SMTP id
 sc27mr38785436ejc.699.1641317559795; 
 Tue, 04 Jan 2022 09:32:39 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id v19sm15150836edx.75.2022.01.04.09.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:32:22 -0800 (PST)
Message-ID: <067a8d97-e71c-4036-a1b2-4fcb7d062947@mind.be>
Date: Tue, 4 Jan 2022 18:32:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
From: Arnout Vandecappelle <arnout@mind.be>
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220101213948.265173-1-ju.o@free.fr>
 <ca0f9046-093a-194e-ad8f-01de07f0d3a1@mind.be>
Organization: Essensium/Mind
In-Reply-To: <ca0f9046-093a-194e-ad8f-01de07f0d3a1@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] support/config-fragments/autobuild: fix
 riscv64 toolchain configs
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDA0LzAxLzIwMjIgMTg6MTYsIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3RlOgo+Cj4KPiBP
biAwMS8wMS8yMDIyIDIyOjM5LCBKdWxpZW4gT2xpdmFpbiB3cm90ZToKPj4gY29tbWl0IGIzYzY2
NDgxZTFmMTUwM2ZjYmYxOTNkMGM3ODAyNzFlODgwYWQ1MDAgcmVwbGFjZWQgUklTQy1WIExQNjQK
Pj4gdG9vbGNoYWlucyBieSBSSVNDLVYgTFA2NEQuIFRoZSBjb25maWcgc3ltYm9scwo+PiBCUjJf
VE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fUklTQ1Y2NF9HTElCQ19CTEVFRElOR19FREdFIGFu
ZAo+PiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fUklTQ1Y2NF9HTElCQ19TVEFCTEUg
d2VyZSBtYXJrZWQgYXMgbGVnYWN5Lgo+PiBUaG9zZSBjaGFuZ2VzIHdlcmUgbm90IHJlZmxlY3Rl
ZCBpbiB0aGUgYXV0b2J1aWxkIHRvb2xjaGFpbiBjb25maWdzIGluCj4+IHN1cHBvcnQvY29uZmln
LWZyYWdtZW50cy9hdXRvYnVpbGQvYm9vdGxpbi1yaXNjdjY0LXtnbGliYyxtdXNsfS5jb25maWcK
Pj4KPj4gV2hlbiB0ZXN0aW5nIGEgcGFja2FnZSB3aXRoIHRoZSBjb21tYW5kOgo+Pgo+PiDCoMKg
wqDCoCAuL3V0aWxzL3Rlc3QtcGtnIC0tYWxsIC0tcGFja2FnZSBzb21lcGFja2FnZQo+Pgo+PiBi
b290bGluLXJpc2N2NjQte2dsaWJjLG11c2x9IHRvb2xjaGFpbiBhcmUgYWx3YXlzIHNraXBwZWQu
IFRoZSBidWlsZAo+PiBsb2dmaWxlIGNvbnRhaW5zOgo+Pgo+PiDCoMKgwqDCoCBbLi4uXQo+PiDC
oMKgwqDCoCBWYWx1ZSByZXF1ZXN0ZWQgZm9yIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJ
TiBub3QgaW4gZmluYWwgLmNvbmZpZwo+PiDCoMKgwqDCoCBSZXF1ZXN0ZWQgdmFsdWU6wqAgQlIy
X1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPj4gwqDCoMKgwqAgQWN0dWFsIHZhbHVlOgo+
Pgo+PiDCoMKgwqDCoCBWYWx1ZSByZXF1ZXN0ZWQgZm9yIAo+PiBCUjJfVE9PTENIQUlOX0VYVEVS
TkFMX0JPT1RMSU5fUklTQ1Y2NF9HTElCQ19CTEVFRElOR19FREdFIG5vdCBpbiBmaW5hbCAuY29u
ZmlnCj4+IMKgwqDCoMKgIFJlcXVlc3RlZCB2YWx1ZTogCj4+IEJSMl9UT09MQ0hBSU5fRVhURVJO
QUxfQk9PVExJTl9SSVNDVjY0X0dMSUJDX0JMRUVESU5HX0VER0U9eQo+PiDCoMKgwqDCoCBBY3R1
YWwgdmFsdWU6wqDCoMKgwqAgIyAKPj4gQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX1JJ
U0NWNjRfR0xJQkNfQkxFRURJTkdfRURHRSBpcyBub3Qgc2V0Cj4+Cj4+IFRoaXMgY29tbWl0IHVw
ZGF0ZSB0aGUgYXV0b2J1aWxkIGNvbmZpZyBmcmFnbWVudHMgZm9yIFJJU0MtViA2NGJpdAo+PiB0
b29sY2hhaW5zIHNvIHRoZXkgY2FuIGJlIHVzZWQgYnkgdGVzdC1wa2cuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4KPiDCoEFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCj4KPiDCoFdoaWxlIHJldmlld2luZyB0aGlzLCBJIG5vdGljZWQgdGhhdCAK
PiBCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fUklTQ1Y2NF9HTElCQ19TVEFCTEUgaW4g
ZmFjdCBuZXZlciBleGlzdGVkLCBzbyAKPiBJIHNlbnQgYSBwYXRjaCB0byBmaXggdGhhdCBhcyB3
ZWxsIFsxXS4gVW5mb3J0dW5hdGVseSwgSSBmb3Jnb3QgdG8gQ2MgVGhvbWFzIAo+IG9uIHRoYXQs
IHNvIFRob21hcyBjb25zaWRlciB5b3Vyc2VsZiBDQ2VkIG5vdyA6LSkKPgpbMV0gCmh0dHBzOi8v
cGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyMjAxMDQxNzEx
MjguOTU2Mzk3LTEtYXJub3V0QG1pbmQuYmUvCgoKIMKgUmVnYXJkcywKIMKgQXJub3V0CgoKPiDC
oFJlZ2FyZHMsCj4gwqBBcm5vdXQKPgo+Cj4+IC0tLQo+PiDCoCAuLi4vY29uZmlnLWZyYWdtZW50
cy9hdXRvYnVpbGQvYm9vdGxpbi1yaXNjdjY0LWdsaWJjLmNvbmZpZyB8IDQgKystLQo+PiDCoCAu
Li4vY29uZmlnLWZyYWdtZW50cy9hdXRvYnVpbGQvYm9vdGxpbi1yaXNjdjY0LW11c2wuY29uZmln
IHwgNCArKy0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9jb25maWctZnJhZ21lbnRzL2F1dG9i
dWlsZC9ib290bGluLXJpc2N2NjQtZ2xpYmMuY29uZmlnIAo+PiBiL3N1cHBvcnQvY29uZmlnLWZy
YWdtZW50cy9hdXRvYnVpbGQvYm9vdGxpbi1yaXNjdjY0LWdsaWJjLmNvbmZpZwo+PiBpbmRleCBm
NmM2ZmNhYTM2Li40MzNhNmU4OWY3IDEwMDY0NAo+PiAtLS0gYS9zdXBwb3J0L2NvbmZpZy1mcmFn
bWVudHMvYXV0b2J1aWxkL2Jvb3RsaW4tcmlzY3Y2NC1nbGliYy5jb25maWcKPj4gKysrIGIvc3Vw
cG9ydC9jb25maWctZnJhZ21lbnRzL2F1dG9idWlsZC9ib290bGluLXJpc2N2NjQtZ2xpYmMuY29u
ZmlnCj4+IEBAIC0xLDUgKzEsNSBAQAo+PiDCoCBCUjJfcmlzY3Y9eQo+PiAtQlIyX1JJU0NWX0FC
SV9MUDY0PXkKPj4gK0JSMl9SSVNDVl9BQklfTFA2NEQ9eQo+PiDCoCBCUjJfVE9PTENIQUlOX0VY
VEVSTkFMPXkKPj4gwqAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPj4gLUJSMl9U
T09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9SSVNDVjY0X0dMSUJDX0JMRUVESU5HX0VER0U9eQo+
PiArQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX1JJU0NWNjRfTFA2NERfR0xJQkNfQkxF
RURJTkdfRURHRT15Cj4+IGRpZmYgLS1naXQgYS9zdXBwb3J0L2NvbmZpZy1mcmFnbWVudHMvYXV0
b2J1aWxkL2Jvb3RsaW4tcmlzY3Y2NC1tdXNsLmNvbmZpZyAKPj4gYi9zdXBwb3J0L2NvbmZpZy1m
cmFnbWVudHMvYXV0b2J1aWxkL2Jvb3RsaW4tcmlzY3Y2NC1tdXNsLmNvbmZpZwo+PiBpbmRleCAy
YjZhNmU1NmRhLi5mZWUxZjI5ZjRhIDEwMDY0NAo+PiAtLS0gYS9zdXBwb3J0L2NvbmZpZy1mcmFn
bWVudHMvYXV0b2J1aWxkL2Jvb3RsaW4tcmlzY3Y2NC1tdXNsLmNvbmZpZwo+PiArKysgYi9zdXBw
b3J0L2NvbmZpZy1mcmFnbWVudHMvYXV0b2J1aWxkL2Jvb3RsaW4tcmlzY3Y2NC1tdXNsLmNvbmZp
Zwo+PiBAQCAtMSw0ICsxLDQgQEAKPj4gwqAgQlIyX3Jpc2N2PXkKPj4gLUJSMl9SSVNDVl9BQklf
TFA2ND15Cj4+ICtCUjJfUklTQ1ZfQUJJX0xQNjREPXkKPj4gwqAgQlIyX1RPT0xDSEFJTl9FWFRF
Uk5BTD15Cj4+IC1CUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU5fUklTQ1Y2NF9NVVNMX0JM
RUVESU5HX0VER0U9eQo+PiArQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX1JJU0NWNjRf
TFA2NERfTVVTTF9TVEFCTEU9eQo+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
