Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306C7C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C520584BB3;
	Sat, 23 Jul 2022 16:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C520584BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zikMA3-seNtc; Sat, 23 Jul 2022 16:55:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4E0F84BA7;
	Sat, 23 Jul 2022 16:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4E0F84BA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 124851BF31A
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E128860FE0
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E128860FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHzCGqLfCs7V for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:55:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B884E60BD8
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B884E60BD8
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:55:04 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k11so9891128wrx.5
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 09:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y6MAr0mPsK0z/z3ea9YUyu2msW3a8hyUKYVobkO0oYc=;
 b=S+dgMiiiiu0oXsu7LwJ+cScrZXeXJLEWGUwNO3OZjjVBYygBV95L7r3EhZfTmtZ5iD
 L2cHKPrthqMHss2vlfP57TbgbGGH0E0kPTHk+XlB5focCmIfepsVAE+6kiLzaJF14dZN
 7ODrnce+fngf2OgxQdrHQbiFFhibkg/Nm5eEGQJVHm0qc1MjAzCIbChimQqiClx5/Xbj
 JSiY063W1wLcyTnGLv5mpM9l556lgZDwreS5hgf8U2xs3pJbLwgsiJHS04HER/eVfr7C
 hLrHkSQUCgOaOnCRDKFpUVuuWNDPlvn2PD1boK7Miu9pZK1JQUn2bS+flYxgoGrUE3/S
 UvTw==
X-Gm-Message-State: AJIora/vry6MaNOcitocd4qd8R/w0jm6RYVjCsitFiM7FnB7oxz6tmsD
 3Y4pkPF4wzDNf1Hu2Xtafq2mqhFlz1UgDQ==
X-Google-Smtp-Source: AGRyM1tDgjLo5hZHtsJiphofXscq9UGXhXfhxnaFqB/9O8+ZsWhmevApX2Z/mxKW80ib/Qpi3GNIZw==
X-Received: by 2002:adf:f108:0:b0:21e:8132:a3d3 with SMTP id
 r8-20020adff108000000b0021e8132a3d3mr745981wro.337.1658595302916; 
 Sat, 23 Jul 2022 09:55:02 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a5d5256000000b0021d6a520ce9sm7698343wrc.47.2022.07.23.09.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 09:55:02 -0700 (PDT)
Message-ID: <fee96fdc-5837-8f5d-b252-0c3d97a9a855@mind.be>
Date: Sat, 23 Jul 2022 18:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: =?UTF-8?Q?Andr=c3=a9_Zwing?= <nerv@dawncrow.de>, buildroot@buildroot.org
References: <20220607142205.248102-1-nerv@dawncrow.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220607142205.248102-1-nerv@dawncrow.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Y6MAr0mPsK0z/z3ea9YUyu2msW3a8hyUKYVobkO0oYc=;
 b=A/wdxZKs9vYpTEp7AEzex3ljTWyMt9eP4xpUMjsyWYAk+MTTcRDcmRXsImER4L0BAH
 UVnjQ8ge1DQFT9btJPlHbCA/9xGSd3rQIHc2xcbrg9oVSWobd8PVI0BY285MpN8onimE
 pm1eBZDp8LvWhUakqoy+PPmR1wY565KXE/UMgHoLDsqCnhmJiDal2UUiFitMI/s/wtNr
 Bidsh6zD3yILO42L+s8OCEK/oFip+XIm+Gkj8PnZnZ605EwLihnDGh2pJu7wWW+NFSv7
 K9QQ90uNCGo75yMPn+bprr7U0mMNQVU6sUBsNZKu9GY869RHXeA2+ru3fwU0vk8edzNG
 NG6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A/wdxZKs
Subject: Re: [Buildroot] [PATCH] package/libkrb5: bump to 1.20
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNy8wNi8yMDIyIDE2OjIyLCBBbmRyw6kgWndpbmcgd3JvdGU6Cj4gU2lnbmVkLW9mZi1i
eTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgo+IC0tLQo+ICAgLi4uLWRlcmVmLW9u
LVRHUy1pbm5lci1ib2R5LW51bGwtc2VydmVyLnBhdGNoIHwgNDcgLS0tLS0tLS0tLS0tLS0tLS0t
LQo+ICAgcGFja2FnZS9saWJrcmI1L2xpYmtyYjUuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDQg
Ky0KPiAgIHBhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rICAgICAgICAgICAgICAgICAgICB8ICA4
ICstLS0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMo
LSkKPiAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYmtyYjUvMDAwMS1GaXgtS0RDLW51
bGwtZGVyZWYtb24tVEdTLWlubmVyLWJvZHktbnVsbC1zZXJ2ZXIucGF0Y2gKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJrcmI1LzAwMDEtRml4LUtEQy1udWxsLWRlcmVmLW9uLVRHUy1pbm5l
ci1ib2R5LW51bGwtc2VydmVyLnBhdGNoIGIvcGFja2FnZS9saWJrcmI1LzAwMDEtRml4LUtEQy1u
dWxsLWRlcmVmLW9uLVRHUy1pbm5lci1ib2R5LW51bGwtc2VydmVyLnBhdGNoCj4gZGVsZXRlZCBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggZWM2ZjYyMzM4MC4uMDAwMDAwMDAwMAo+IC0tLSBhL3Bh
Y2thZ2UvbGlia3JiNS8wMDAxLUZpeC1LREMtbnVsbC1kZXJlZi1vbi1UR1MtaW5uZXItYm9keS1u
dWxsLXNlcnZlci5wYXRjaAo+ICsrKyAvZGV2L251bGwKPiBAQCAtMSw0NyArMCwwIEBACj4gLUZy
b20gZDc3NWM5NWFmNzYwNmE1MWJmNzk1NDdhOTRmYTUyZGRkMWNiN2Y0OSBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKPiAtRnJvbTogR3JlZyBIdWRzb24gPGdodWRzb25AbWl0LmVkdT4KPiAtRGF0
ZTogVHVlLCAzIEF1ZyAyMDIxIDAxOjE1OjI3IC0wNDAwCj4gLVN1YmplY3Q6IFtQQVRDSF0gRml4
IEtEQyBudWxsIGRlcmVmIG9uIFRHUyBpbm5lciBib2R5IG51bGwgc2VydmVyCj4gLQo+IC1BZnRl
ciB0aGUgS0RDIGRlY29kZXMgYSBGQVNUIGlubmVyIGJvZHksIGl0IGRvZXMgbm90IGNoZWNrIGZv
ciBhIG51bGwKPiAtc2VydmVyLiAgUHJpb3IgdG8gY29tbWl0IDM5NTQ4YTViMTdiYmRhOWVlYjYz
NjI1YTIwMWNmZDE5YjlkZTFjNWIgdGhpcwo+IC13b3VsZCB0eXBpY2FsbHkgcmVzdWx0IGluIGFu
IGVycm9yIGZyb20ga3JiNV91bnBhcnNlX25hbWUoKSwgYnV0IHdpdGgKPiAtdGhlIGFkZGl0aW9u
IG9mIGdldF9sb2NhbF90Z3QoKSBpdCByZXN1bHRzIGluIGEgbnVsbCBkZXJlZmVyZW5jZS4gIEFk
ZAo+IC1hIG51bGwgY2hlY2suCj4gLQo+IC1SZXBvcnRlZCBieSBKb3NlcGggU3V0dG9uIG9mIENh
dGFseXN0Lgo+IC0KPiAtQ1ZFLTIwMjEtMzc3NTA6Cj4gLQo+IC1JbiBNSVQga3JiNSByZWxlYXNl
cyAxLjE0IGFuZCBsYXRlciwgYW4gYXV0aGVudGljYXRlZCBhdHRhY2tlciBjYW4KPiAtY2F1c2Ug
YSBudWxsIGRlcmVmZXJlbmNlIGluIHRoZSBLREMgYnkgc2VuZGluZyBhIEZBU1QgVEdTIHJlcXVl
c3Qgd2l0aAo+IC1ubyBzZXJ2ZXIgZmllbGQuCj4gLQo+IC10aWNrZXQ6IDkwMDggKG5ldykKPiAt
dGFnczogcHVsbHVwCj4gLXRhcmdldF92ZXJzaW9uOiAxLjE5LW5leHQKPiAtdGFyZ2V0X3ZlcnNp
b246IDEuMTgtbmV4dAo+IC0KPiAtW1JldHJpZXZlZCBmcm9tOgo+IC1odHRwczovL2dpdGh1Yi5j
b20va3JiNS9rcmI1L2NvbW1pdC9kNzc1Yzk1YWY3NjA2YTUxYmY3OTU0N2E5NGZhNTJkZGQxY2I3
ZjQ5XQo+IC1TaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNl
QGdtYWlsLmNvbT4KPiAtLS0tCj4gLSBzcmMva2RjL2RvX3Rnc19yZXEuYyB8IDUgKysrKysKPiAt
IDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPiAtCj4gLWRpZmYgLS1naXQgYS9zcmMv
a2RjL2RvX3Rnc19yZXEuYyBiL3NyYy9rZGMvZG9fdGdzX3JlcS5jCj4gLWluZGV4IDU4MmU0OTdj
YzkuLjMyZGM2NWZhOGUgMTAwNjQ0Cj4gLS0tLSBhL3NyYy9rZGMvZG9fdGdzX3JlcS5jCj4gLSsr
KyBiL3NyYy9rZGMvZG9fdGdzX3JlcS5jCj4gLUBAIC0yMDQsNiArMjA0LDExIEBAIHByb2Nlc3Nf
dGdzX3JlcShrcmI1X2tkY19yZXEgKnJlcXVlc3QsIGtyYjVfZGF0YSAqcGt0LAo+IC0gICAgICAg
ICBzdGF0dXMgPSAiRklORF9GQVNUIjsKPiAtICAgICAgICAgZ290byBjbGVhbnVwOwo+IC0gICAg
IH0KPiAtKyAgICBpZiAoc3ByaW5jID09IE5VTEwpIHsKPiAtKyAgICAgICAgc3RhdHVzID0gIk5V
TExfU0VSVkVSIjsKPiAtKyAgICAgICAgZXJyY29kZSA9IEtSQjVLRENfRVJSX1NfUFJJTkNJUEFM
X1VOS05PV047Cj4gLSsgICAgICAgIGdvdG8gY2xlYW51cDsKPiAtKyAgICB9Cj4gLQo+IC0gICAg
IGVycmNvZGUgPSBnZXRfbG9jYWxfdGd0KGtkY19jb250ZXh0LCAmc3ByaW5jLT5yZWFsbSwgaGVh
ZGVyX3NlcnZlciwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmbG9jYWxfdGd0LCAm
bG9jYWxfdGd0X3N0b3JhZ2UsICZsb2NhbF90Z3Rfa2V5KTsKPiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJrcmI1L2xpYmtyYjUuaGFzaCBiL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lmhhc2gKPiBp
bmRleCA4NjBmODI4NzkzLi4yZmNlMjRiNDViIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlia3Ji
NS9saWJrcmI1Lmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYmtyYjUvbGlia3JiNS5oYXNoCj4gQEAg
LTEsNSArMSw1IEBACj4gICAjIExvY2FsbHkgY2FsY3VsYXRlZCBhZnRlciBjaGVja2luZyBwZ3Ag
c2lnbmF0dXJlCj4gLXNoYTI1NiAgNjYwODVlMmY1OTQ3NTFlNzdlODJlMGRiZjdiYmMzNDQzMjBm
YjQ4YTlkZjJhNjMzY2ZkZDhmN2Q2ZGE5OWZjOCAga3JiNS0xLjE4LjQudGFyLmd6Cj4gK3NoYTI1
NiAgN2UwMjJiZGQzYzg1MTgzMDE3M2Y5ZmFhYTAwNmEyMzBhMGUwZmRhZDRjOTUzZTg1YmZmNGJm
MGRhMDM2ZTEyZiAga3JiNS0xLjIwLnRhci5nego+ICAgCj4gICAjIEhhc2ggZm9yIGxpY2Vuc2Ug
ZmlsZToKPiAtc2hhMjU2ICA3ZmJhOGIwNzZiZGMyY2ZlZjFkMDgxM2M1ZDQwNjdkNzZkNWJlNjBj
MzJkODRkZTIyZDVkMWNmNDUxNzQ0ZmViICBOT1RJQ0UKPiArc2hhMjU2ICBjZmFkY2Y3YjJlYWQy
ZjNhZjc5M2MyNWMwMDYzOGM5OTA4YWMwMDIzYjEwMTY5NWY0MGNiOWEwM2IxNjgxMWRjICBOT1RJ
Q0UKCiAgSW4gdGhpcyBjYXNlLCB0aGUgaGFzaCBjaGFuZ2VzIGJlY2F1c2Ugb25lIG9mIHRoZSBs
aWNlbnNlcyBoYXMgYWN0dWFsbHkgY2hhbmdlZCEKCiAgV2hpY2ggbGVhZCBtZSB0byBkaXNjb3Zl
ciB0aGF0IG91ciBMSUNFTlNFIHZhcmlhYmxlIGlzIGluIGZhY3QgaW5jb3JyZWN0LCAKc2luY2Ug
a3JiNSBjb250YWlucyBhIGxvdCBvZiBwaWVjZXMgd2l0aCBkaWZmZXJlbnQgbGljZW5zZXMgdGhh
biBNSVQuIFNvIEkgCnB1c2hlZCBhIHNlcGFyYXRlIGNvbW1pdCB0byBhZGQgc29tZSBvZiB0aGVt
LiBVbmZvcnR1bmF0ZWx5LCBtYW55IG9mIHRoZW0gYXJlIApub24tc3RhbmRhcmQgbGljZW5zZXMg
dGhhdCB2YWd1ZWx5IHJlc2VtYmxlIGVpdGhlciBNSVQgb3Igb25lIG9mIHRoZSBCU0QgCnZhcmlh
bnRzIC0gdGhlIGNoYW5nZWQgb25lIGlzIGluIGZhY3Qgb25lIG9mIHRob3NlLi4uCgogIEFueXdh
eSwgYXBwbGllZCB0byBtYXN0ZXIgd2l0aCBhIHNob3J0IHN1bW1hcnkgb2YgdGhlIGFib3ZlIGlu
IHRoZSBjb21taXQgCm1lc3NhZ2UsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rIGIvcGFja2FnZS9saWJrcmI1L2xp
YmtyYjUubWsKPiBpbmRleCBiZDc1MWQ5Yzc3Li5jMGQzMjY5OTYwIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvbGlia3JiNS9saWJrcmI1Lm1rCj4gKysrIGIvcGFja2FnZS9saWJrcmI1L2xpYmtyYjUu
bWsKPiBAQCAtNCw5ICs0LDggQEAKPiAgICMKPiAgICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4g
ICAKPiAtTElCS1JCNV9WRVJTSU9OX01BSk9SID0gMS4xOAo+IC1MSUJLUkI1X1ZFUlNJT04gPSAk
KExJQktSQjVfVkVSU0lPTl9NQUpPUikuNAo+IC1MSUJLUkI1X1NJVEUgPSBodHRwczovL3dlYi5t
aXQuZWR1L2tlcmJlcm9zL2Rpc3Qva3JiNS8kKExJQktSQjVfVkVSU0lPTl9NQUpPUikKPiArTElC
S1JCNV9WRVJTSU9OID0gMS4yMAo+ICtMSUJLUkI1X1NJVEUgPSBodHRwczovL3dlYi5taXQuZWR1
L2tlcmJlcm9zL2Rpc3Qva3JiNS8kKExJQktSQjVfVkVSU0lPTikKPiAgIExJQktSQjVfU09VUkNF
ID0ga3JiNS0kKExJQktSQjVfVkVSU0lPTikudGFyLmd6Cj4gICBMSUJLUkI1X1NVQkRJUiA9IHNy
Ywo+ICAgTElCS1JCNV9MSUNFTlNFID0gTUlUCj4gQEAgLTE2LDkgKzE1LDYgQEAgTElCS1JCNV9D
UEVfSURfUFJPRFVDVCA9IGtlcmJlcm9zXzUKPiAgIExJQktSQjVfREVQRU5ERU5DSUVTID0gaG9z
dC1iaXNvbiAkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQo+ICAgTElCS1JCNV9JTlNUQUxMX1NU
QUdJTkcgPSBZRVMKPiAgIAo+IC0jIDAwMDEtRml4LUtEQy1udWxsLWRlcmVmLW9uLVRHUy1pbm5l
ci1ib2R5LW51bGwtc2VydmVyLnBhdGNoCj4gLUxJQktSQjVfSUdOT1JFX0NWRVMgKz0gQ1ZFLTIw
MjEtMzc3NTAKPiAtCj4gICAjIFRoZSBjb25maWd1cmUgc2NyaXB0IHVzZXMgQUNfVFJZX1JVTiB0
ZXN0cyB0byBjaGVjayBmb3IgdGhvc2UgdmFsdWVzLAo+ICAgIyB3aGljaCBkb2Vzbid0IHdvcmsg
aW4gYSBjcm9zcy1jb21waWxhdGlvbiBzY2VuYXJpby4gVGhlcmVmb3JlLAo+ICAgIyB3ZSBmZWVk
IHRoZSBjb25maWd1cmUgc2NyaXB0IHdpdGggdGhlIGNvcnJlY3QgYW5zd2VyIGZvciB0aG9zZSB0
ZXN0cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
