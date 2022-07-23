Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A414C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B900F60FE0;
	Sat, 23 Jul 2022 12:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B900F60FE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nk_JV3vtdGrS; Sat, 23 Jul 2022 12:35:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E49E60FD9;
	Sat, 23 Jul 2022 12:35:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E49E60FD9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 35A4B1BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1154F8487C
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:35:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1154F8487C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_lQ6yOUH_Ws for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:35:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CA6E848B9
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CA6E848B9
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:35:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id b26so9809391wrc.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 05:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qZz8CwjuU/cvc0t+fLfwdaNu0iW36xenaoZdkVrsJds=;
 b=C0nsLGojDm3U9Pt+Bixql9H0MgqD5HenyK7TWSHKJxszOnYgt7FPcUyB/sJ5kcj+wK
 DhCFJlC+e3Kp2vt5REjVvzj2XscanaC3b5A+N0o7kqe3AZ2VBjlEB1GL+8yymd7CJxHO
 WU7g8zTttAo/CnngtqPSuwA2dYsRI7VvXaJkkkBQXX+dpRkLrcBoZIu+3yj+FOBFH+Xu
 SyZh2Y8IYP6q30kb65DkadXTtBvRvKnM9wKgIffrZ+iErVMZBi5ChQ1MgurG3nq8GfIZ
 KTzCqEa73D8mIRyfyTQZGCJRGEfzPRYAkqGKLL8PueT6dqFnX0QU6TFQ0VkxgKUTvhB2
 Uj6w==
X-Gm-Message-State: AJIora9mRmikuGf4irMpLgi7oQhWAyX70xER6ObKMUFfzHofe3xzhK9V
 fb9RPDh+1o82XWDR2QseP1NxrIEsb8nuTQ==
X-Google-Smtp-Source: AGRyM1uWl7OX0s8Xbo/ZBtbMlgXywZavIqeF+k+Vu5Xg8pCIVuBlGTH4nypmcW7iwhFFG1Fh0JhHYQ==
X-Received: by 2002:a5d:650e:0:b0:21e:660e:2665 with SMTP id
 x14-20020a5d650e000000b0021e660e2665mr2667791wru.185.1658579725046; 
 Sat, 23 Jul 2022 05:35:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 c185-20020a1c35c2000000b0039c5642e430sm8084412wma.20.2022.07.23.05.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 23 Jul 2022 05:35:24 -0700 (PDT)
Message-ID: <eac575df-c7d2-c356-d66d-45f3b4f2f37f@mind.be>
Date: Sat, 23 Jul 2022 14:35:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Paul Cercueil <paul@crapouillou.net>
References: <20220721183503.369200-1-paul@crapouillou.net>
 <a96703d8-83e8-fc44-0d89-0d5e7e0ba395@mind.be>
 <4Y2HFR.1A53UFE79W2J2@crapouillou.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <4Y2HFR.1A53UFE79W2J2@crapouillou.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qZz8CwjuU/cvc0t+fLfwdaNu0iW36xenaoZdkVrsJds=;
 b=Ii6nFWuM95k0KAORz7bLRV2Hx96adbH8BNdTdj2Z/F7i5RCzUSvUj8eADahbjq9sSX
 6Z+rQra0Aa+Pu9QgGI80Fvy1oCU2wfEW45DzugwBGBLKeTiS1Vl1ygOPOnY+5QAWI2cL
 aV/3ifl3OyYzjVc2JiAmTOZDA3A5e6/4xafImQ2YkRen4+bZ3AEmJirDpa0w4f+2TfQd
 F07jVs3xwsMup7+KsCGUDo+s4vJ5B5kzz4X2uMVXOicjYNd2ymfczrj3kbDVqJRlWziI
 lDFzyIRfGhP2KDt9KvI27YGgfRJcJ7KouRlcjoY3nPCH8lUsJOTkUccZXis3ykqEc4qc
 9CQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ii6nFWuM
Subject: Re: [Buildroot] [PATCH 1/1] linux: allow modules install path to be
 overriden
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8wNy8yMDIyIDE0OjA2LCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+IAo+IAo+IExlIHNh
bS4sIGp1aWwuIDIzIDIwMjIgYXQgMTQ6MDE6MTIgKzAyMDAsIEFybm91dCBWYW5kZWNhcHBlbGxl
IDxhcm5vdXRAbWluZC5iZT4gCj4gYSDDqWNyaXQgOgo+Pgo+Pgo+PiBPbiAyMS8wNy8yMDIyIDIw
OjM1LCBQYXVsIENlcmN1ZWlsIHdyb3RlOgo+Pj4gT24gbXkgc3lzdGVtIHRoZSBtb2R1bGVzIGFy
ZSBub3QgaW5zdGFsbGVkIGluIHRoZSByb290IGZpbGVzeXN0ZW0KPj4+IGRpcmVjdGx5LCBidXQg
aW4gYSBzZXBhcmF0ZSBzcXVhc2hmcyBpbWFnZSB0aGF0IGlzIHRoZW4gc2hpcHBlZAo+Pj4gYWxv
bmdzaWRlIHRoZSBrZXJuZWwuCj4+Cj4+IMKgVGhhdCB1c2UgY2FzZSBpcyB3YXkgdG9vIHNwZWNp
ZmljIHRvIGFkZCBzdXBwb3J0IGZvciBpdC4uLgo+Pgo+Pj4gU3VwcG9ydCB0aGlzIHNldHVwIGJ5
IGFsbG93aW5nIGJvYXJkIGZpbGVzIHRvIG92ZXJyaWRlIHRoZSBpbnN0YWxsIHBhdGgKPj4+IGZv
ciB0aGUga2VybmVsIG1vZHVsZXMuCj4+Cj4+IMKgVGhpcyB3b3JrcyBmb3IgaW4tdHJlZSBtb2R1
bGVzLCBidXQgaXQgc3RvcHMgd29ya2luZyBpZiB5b3UgaGF2ZSBhbnkgCj4+IG91dC1vZi10cmVl
IG1vZHVsZXMuCj4gCj4gRmFpciBlbm91Z2guCj4gCj4+IMKgVGhlIHByb3BlciB3YXkgdG8gZG8g
dGhpcyB3b3VsZCBiZSB0byBhZGQgYSBwb3N0LWJ1aWxkIHNjcmlwdCB0aGF0IG1vdmVzIAo+PiBU
QVJHRVRfRElSL2xpYi9tb2R1bGVzIHRvIHdoZXJlIHlvdSB3YW50IGl0IC0gb3IgcHJvYmFibHkg
anVzdCBydW4gbWtzcXVhc2hmcyAKPj4gb24gaXQgYW5kIHJlbW92ZSBpdCBhZnRlcndhcmRzLgo+
IAo+IEJ1dCB0aGlzIHdvdWxkIG9ubHkgd29yayBvbmNlIGFuZCB0aGVuIGl0IHdvdWxkIGJlIGlt
cG9zc2libGUgdG8gcmVidWlsZC4KCiAgSWYgeW91IHdhbnQgdG8gc3VwcG9ydCByZWJ1aWxkLCB5
b3UgaGF2ZSB0byByc3luYyB0byBzb21lIG90aGVyIGRpciBhbmQga2VlcCAKdGhhdCBkaXIuCgog
IFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IC1QYXVsCj4gCj4+IMKgVGhlcmVmb3JlLCBJJ3ZlIG1h
cmtlZCB0aGlzIHBhdGNoIGFzIFJlamVjdGVkIGluIHBhdGNod29yay4KPj4KPj4gwqBSZWdhcmRz
LAo+PiDCoEFybm91dAo+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBj
cmFwb3VpbGxvdS5uZXQ+Cj4+PiAtLS0KPj4+IMKgIGxpbnV4L2xpbnV4Lm1rIHwgMTIgKysrKysr
Ky0tLS0tCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9saW51eC9saW51eC5tayBiL2xpbnV4L2xpbnV4Lm1r
Cj4+PiBpbmRleCAzMjJjY2FiYmQ5Li4zNjg5NmEzYjRkIDEwMDY0NAo+Pj4gLS0tIGEvbGludXgv
bGludXgubWsKPj4+ICsrKyBiL2xpbnV4L2xpbnV4Lm1rCj4+PiBAQCAtMTQ1LDYgKzE0NSw4IEBA
IExJTlVYX1BPU1RfRVhUUkFDVF9IT09LUyArPSBMSU5VWF9YVEVOU0FfT1ZFUkxBWV9FWFRSQUNU
Cj4+PiDCoCBMSU5VWF9FWFRSQV9ET1dOTE9BRFMgKz0gJChBUkNIX1hURU5TQV9PVkVSTEFZX1VS
TCkKPj4+IMKgIGVuZGlmCj4+PiDCoCB/K0lOU1RBTExfTU9EX1BBVEggPSAkKFRBUkdFVF9ESVIp
Cj4+PiArCj4+PiDCoCAjIFdlIGRvbid0IHdhbnQgdG8gcnVuIGRlcG1vZCBhZnRlciBpbnN0YWxs
aW5nIHRoZSBrZXJuZWwuIEl0J3MgZG9uZSBpbiBhCj4+PiDCoCAjIHRhcmdldC1maW5hbGl6ZSBo
b29rLCB0byBlbmNvbXBhc3MgbW9kdWxlcyBpbnN0YWxsZWQgYnkgcGFja2FnZXMuCj4+PiDCoCAj
IERpc2FibGUgYnVpbGRpbmcgaG9zdCB0b29scyB3aXRoIC1XZXJyb3I6IG5ld2VyIGdjYyB2ZXJz
aW9ucyBjYW4gYmUKPj4+IEBAIC0xNTIsNyArMTU0LDcgQEAgZW5kaWYKPj4+IMKgIExJTlVYX01B
S0VfRkxBR1MgPSBcCj4+PiDCoMKgwqDCoMKgIEhPU1RDQz0iJChIT1NUQ0MpICQoSE9TVF9DRkxB
R1MpICQoSE9TVF9MREZMQUdTKSIgXAo+Pj4gwqDCoMKgwqDCoCBBUkNIPSQoS0VSTkVMX0FSQ0gp
IFwKPj4+IC3CoMKgwqAgSU5TVEFMTF9NT0RfUEFUSD0kKFRBUkdFVF9ESVIpIFwKPj4+ICvCoMKg
wqAgSU5TVEFMTF9NT0RfUEFUSD0kKElOU1RBTExfTU9EX1BBVEgpIFwKPj4+IMKgwqDCoMKgwqAg
Q1JPU1NfQ09NUElMRT0iJChUQVJHRVRfQ1JPU1MpIiBcCj4+PiDCoMKgwqDCoMKgIFdFUlJPUj0w
IFwKPj4+IMKgwqDCoMKgwqAgREVQTU9EPSQoSE9TVF9ESVIpL3NiaW4vZGVwbW9kCj4+PiBAQCAt
NTE5LDggKzUyMSw4IEBAIGRlZmluZSBMSU5VWF9JTlNUQUxMX1RBUkdFVF9DTURTCj4+PiDCoMKg
wqDCoMKgICMgZGlyZWN0b3JpZXMsIG5vdCByZWxldmFudCBvbiB0aGUgdGFyZ2V0Cj4+PiDCoMKg
wqDCoMKgIEBpZiBncmVwIC1xICJDT05GSUdfTU9EVUxFUz15IiAkKEBEKS8uY29uZmlnOyB0aGVu
IFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAkKExJTlVYX01BS0VfRU5WKSAkKE1BS0UxKSAkKExJ
TlVYX01BS0VfRkxBR1MpIC1DICQoQEQpIAo+Pj4gbW9kdWxlc19pbnN0YWxsOyBcCj4+PiAtwqDC
oMKgwqDCoMKgwqAgcm0gLWYgJChUQVJHRVRfRElSKS9saWIvbW9kdWxlcy8kKExJTlVYX1ZFUlNJ
T05fUFJPQkVEKS9idWlsZCA7IFwKPj4+IC3CoMKgwqDCoMKgwqDCoCBybSAtZiAkKFRBUkdFVF9E
SVIpL2xpYi9tb2R1bGVzLyQoTElOVVhfVkVSU0lPTl9QUk9CRUQpL3NvdXJjZSA7IFwKPj4+ICvC
oMKgwqDCoMKgwqDCoCBybSAtZiAkKElOU1RBTExfTU9EX1BBVEgpL2xpYi9tb2R1bGVzLyQoTElO
VVhfVkVSU0lPTl9QUk9CRUQpL2J1aWxkIDsgXAo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJtIC1mICQo
SU5TVEFMTF9NT0RfUEFUSCkvbGliL21vZHVsZXMvJChMSU5VWF9WRVJTSU9OX1BST0JFRCkvc291
cmNlIAo+Pj4gOyBcCj4+PiDCoMKgwqDCoMKgIGZpCj4+PiDCoMKgwqDCoMKgICQoTElOVVhfSU5T
VEFMTF9IT1NUX1RPT0xTKQo+Pj4gwqAgZW5kZWYKPj4+IEBAIC01MjgsOSArNTMwLDkgQEAgZW5k
ZWYKPj4+IMKgICMgUnVuIGRlcG1vZCBpbiBhIHRhcmdldC1maW5hbGl6ZSBob29rLCB0byBlbmNv
bXBhc3MgbW9kdWxlcyBpbnN0YWxsZWQgYnkKPj4+IMKgICMgcGFja2FnZXMuCj4+PiDCoCBkZWZp
bmUgTElOVVhfUlVOX0RFUE1PRAo+Pj4gLcKgwqDCoCBpZiB0ZXN0IC1kICQoVEFSR0VUX0RJUikv
bGliL21vZHVsZXMvJChMSU5VWF9WRVJTSU9OX1BST0JFRCkgXAo+Pj4gK8KgwqDCoCBpZiB0ZXN0
IC1kICQoSU5TVEFMTF9NT0RfUEFUSCkvbGliL21vZHVsZXMvJChMSU5VWF9WRVJTSU9OX1BST0JF
RCkgXAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICYmIGdyZXAgLXEgIkNPTkZJR19NT0RVTEVTPXki
ICQoTElOVVhfRElSKS8uY29uZmlnOyB0aGVuIFwKPj4+IC3CoMKgwqDCoMKgwqDCoCAkKEhPU1Rf
RElSKS9zYmluL2RlcG1vZCAtYSAtYiAkKFRBUkdFVF9ESVIpICQoTElOVVhfVkVSU0lPTl9QUk9C
RUQpOyBcCj4+PiArwqDCoMKgwqDCoMKgwqAgJChIT1NUX0RJUikvc2Jpbi9kZXBtb2QgLWEgLWIg
JChJTlNUQUxMX01PRF9QQVRIKSAKPj4+ICQoTElOVVhfVkVSU0lPTl9QUk9CRUQpOyBcCj4+PiDC
oMKgwqDCoMKgIGZpCj4+PiDCoCBlbmRlZgo+Pj4gwqAgTElOVVhfVEFSR0VUX0ZJTkFMSVpFX0hP
T0tTICs9IExJTlVYX1JVTl9ERVBNT0QKPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
