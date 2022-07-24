Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65567C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1F7684BEF;
	Sun, 24 Jul 2022 10:35:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1F7684BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V_OezpQ7nSbS; Sun, 24 Jul 2022 10:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B804B84BE7;
	Sun, 24 Jul 2022 10:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B804B84BE7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44F191BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D3CF41655
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D3CF41655
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTRiMRX6aorz for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:35:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A833241625
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A833241625
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:35:37 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 8-20020a05600c024800b003a2fe343db1so4766723wmj.1
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 03:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p6/mJjPTjOQCTSje98N0UOCdIPYDZETf7OsiAWO5of8=;
 b=6sn6WYylC5MByzRa15Zrg/K9KVONqDvsVyLSdmfsi2HQBbnuijGFnomBqqliPqo64N
 MGuuP8PRJ09I66UgWMFDN2LVaQP14WPglD0S5QPw+yjOFhV/2Cu8gHr4kqotiJY5aQtT
 cyZQrm1OrpbnA7DDI70tAXo7MzPNMbhDzV++OP1NbxKSMx6R7hhbN9wRJn4qWH4pSMUn
 uO8xWujIjv3M+vHYFmdW8Q5OCY136P3xj1bh6Csgdhk5yU4+WBVzn4AnCn9jUTfN8wqT
 s2rzL4EQb0OzlLi/zAftJwuUozzkvKgJV435bJKN6eM+vvVlMpTR+58A7eO6yDC+VU0j
 /kAw==
X-Gm-Message-State: AJIora+qiKeN4QllC/XGMaUlgyX6CEgnw6Vv29z4vyb+zQhWgqZhOWdP
 /z0NKeAKkOUlEILv3qX4Kr4CKw==
X-Google-Smtp-Source: AGRyM1tTsG2ygv4TONoFJh2yZs183PeG6WLo09E8z/ouFPdflzvx44jy+02hYLrChTPC2+bZK+UfcA==
X-Received: by 2002:a05:600c:35ce:b0:3a3:1b7f:bbd8 with SMTP id
 r14-20020a05600c35ce00b003a31b7fbbd8mr5080976wmq.22.1658658935532; 
 Sun, 24 Jul 2022 03:35:35 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 r67-20020a1c2b46000000b003a308e9a192sm14607674wmr.30.2022.07.24.03.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 03:35:35 -0700 (PDT)
Message-ID: <88156858-4385-2b3d-7278-39be05b9457d@mind.be>
Date: Sun, 24 Jul 2022 12:35:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Romain Naour <romain.naour@smile.fr>, Norbert Lange
 <nolange79@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210415144226.2354048-1-jpcartal@free.fr>
 <20210419232810.4ceef826@windsurf.home>
 <CADYdroPo=C9766obODNYLTfGy6+=2zgBFFOcgGH2s0DAuS58rg@mail.gmail.com>
 <3e52a7cc-8858-dfb6-a761-021404a5ce5e@smile.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <3e52a7cc-8858-dfb6-a761-021404a5ce5e@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p6/mJjPTjOQCTSje98N0UOCdIPYDZETf7OsiAWO5of8=;
 b=Y+qvgG+XWXym0+BYl+WBpHvvIRSpoTOTiLQsqhDWeVj9qHHE7KH3mu+Ke9Zwq1FXfC
 q0EZ9kt1r6KeujZe3CRKFLTMS7qq0TDF9mc8SHbvgIbk2pkT+8dC9qL5P8C3/UbgYPC3
 Ww1/xOulECEQ6otUqKtqX4RRWzSsC24iwRMevuWobOO6eOd7dy0VFjWfXWbBagrtJeKN
 woXTKATCYrfezK90R2oeK66LUZiHwHroQaNAxfGrOrchtilGBhAkTeZ35cKNt+Oq7kRM
 aCjMaRYAWVH/FZ6SykcLXt56Phb1VEP5rKGeaGoyZMWSdDe/2V/mTVbhBhgB0NxMS0wY
 mxww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y+qvgG+X
Subject: Re: [Buildroot] [PATCH 1/1] package/libglib2: fix dbus system
 socket location
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
Cc: buildroot <buildroot@buildroot.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jean-pierre Cartal <jpcartal@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyNC8wNy8yMDIyIDExOjIwLCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
TGUgMjAvMDQvMjAyMSDDoCAxMDoxOSwgTm9yYmVydCBMYW5nZSBhIMOpY3JpdMKgOgo+PiBBbSBN
by4sIDE5LiBBcHIuIDIwMjEgdW0gMjM6MjggVWhyIHNjaHJpZWIgVGhvbWFzIFBldGF6em9uaQo+
PiA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT46Cj4+Pgo+Pj4gSGVsbG8gSmVhbi1QaWVy
cmUsCj4+Pgo+Pj4gK05vcmJlcnQgaW4gQ2MsIHNpbmNlIGhlIGNoYW5nZWQgdGhlIERCdXMgc29j
a2V0IGxvY2F0aW9uIGluIGNvbW1pdAo+Pj4gNmI5YTc1YTViZDFiMWE1NTliNzM1MjAwMzU4OGQx
NDYxZGU4YzRkMS4KPj4+Cj4+PiBPbiBUaHUsIDE1IEFwciAyMDIxIDE2OjQyOjI2ICswMjAwCj4+
PiBKZWFuLXBpZXJyZSBDYXJ0YWwgPGpwY2FydGFsQGZyZWUuZnI+IHdyb3RlOgo+Pj4KPj4+PiBG
aXggZGJ1cyBzeXN0ZW0gc29ja2V0IGxvY2F0aW9uIG1vdmVkIGZyb20KPj4+PiAvdmFyL3J1bi9k
YnVzL3N5c3RlbV9idXNfc29ja2V0IHRvIC9ydW4vZGJ1cy9zeXN0ZW1fYnVzX3NvY2tldAo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSmVhbi1waWVycmUgQ2FydGFsIDxqcGNhcnRhbEBmcmVlLmZy
Pgo+Pj4+IC0tLQo+Pj4+ICAgcGFja2FnZS9saWJnbGliMi8wMDA1LWRidXMtc3lzdGVtLXNvY2tl
dC1wYXRoLnBhdGNoIHwgMTEgKysrKysrKysrKysKPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBp
bnNlcnRpb25zKCspCj4+Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9saWJnbGliMi8w
MDA1LWRidXMtc3lzdGVtLXNvY2tldC1wYXRoLnBhdGNoCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9saWJnbGliMi8wMDA1LWRidXMtc3lzdGVtLXNvY2tldC1wYXRoLnBhdGNoIGIvcGFj
a2FnZS9saWJnbGliMi8wMDA1LWRidXMtc3lzdGVtLXNvY2tldC1wYXRoLnBhdGNoCj4+Pj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPj4+PiBpbmRleCAwMDAwMDAwMDAwLi5iYjJlYzMzZGM2Cj4+Pj4g
LS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL3BhY2thZ2UvbGliZ2xpYjIvMDAwNS1kYnVzLXN5c3Rl
bS1zb2NrZXQtcGF0aC5wYXRjaAo+Pj4+IEBAIC0wLDAgKzEsMTEgQEAKPj4+PiArZGlmZiAtTmF1
ciBsaWJnbGliMi0yLjY2Ljgub3JpZy9naW8vZ2RidXNhZGRyZXNzLmMgbGliZ2xpYjItMi42Ni44
L2dpby9nZGJ1c2FkZHJlc3MuYwo+Pj4+ICstLS0gbGliZ2xpYjItMi42Ni44Lm9yaWcvZ2lvL2dk
YnVzYWRkcmVzcy5jICAgICAyMDIxLTAzLTE4IDE0OjQ3OjQ4LjI1NjY5MzAwMCArMDEwMAo+Pj4+
ICsrKysgbGliZ2xpYjItMi42Ni44L2dpby9nZGJ1c2FkZHJlc3MuYyAgMjAyMS0wNC0xNSAxNjox
NDoyOC41MTkyOTY1ODQgKzAyMDAKPj4+PiArQEAgLTEzMzEsNyArMTMzMSw3IEBACj4+Pj4gKwo+
Pj4+ICsgICAgICAgaWYgKHJldCA9PSBOVUxMKQo+Pj4+ICsgICAgICAgICB7Cj4+Pj4gKy0gICAg
ICAgICAgcmV0ID0gZ19zdHJkdXAgKCJ1bml4OnBhdGg9L3Zhci9ydW4vZGJ1cy9zeXN0ZW1fYnVz
X3NvY2tldCIpOwo+Pj4+ICsrICAgICAgICAgIHJldCA9IGdfc3RyZHVwICgidW5peDpwYXRoPS9y
dW4vZGJ1cy9zeXN0ZW1fYnVzX3NvY2tldCIpOwo+Pj4+ICsgICAgICAgICB9Cj4+Pj4gKyAgICAg
ICBicmVhazsKPj4+Cj4+PiBPbiB0aGUgZm9ybSwgYWxsIHBhdGNoZXMgaW4gQnVpbGRyb290IG5l
ZWQgdG8gaGF2ZSBhIHByb3BlciBjb21taXQKPj4+IGRlc2NyaXB0aW9uIGFuZCBTaWduZWQtb2Zm
LWJ5IGxpbmUuCj4+Pgo+Pj4gQnV0IG9uIHRoZSBhY3R1YWwgY29udGVudCwgSSBhbSB3b25kZXJp
bmcgaWYgdGhpcyBpcyB0aGUgcmlnaHQKPj4+IGRpcmVjdGlvbiB0byB0YWtlLiBEbyB3ZSB3YW50
IHRvIGtlZXAgdGhpcyBub24tdXBzdHJlYW1hYmxlIHBhdGNoCj4+PiBhcm91bmQgZm9yZXZlciA/
Cj4+Cj4+IHdoeSBub24tdXBzdHJlYW1hYmxlPwo+PiBBbGwgdGhlIG1vZGVybiBidWlsZCBzeXN0
ZW1zIGxpa2UgQ01ha2UgWzFdIGFuZCBBdXRvdG9vbHMgWzJdIGhhdmUgYQo+PiAicnVuc3RhdGVk
aXIiLCB3b3VsZAo+PiBiZSBnb29kIHByYWN0aWNlIHRvIHVzZSBpdC4gRG9udCBzZWUgd2h5IHRo
aXMgc2hvdWxkbid0IGJlIGZpeGVkIHVwc3RyZWFtLgo+Pgo+PiAoTWlnaHQgYmUgYSBnb29kIGlk
ZWEgaWYgYnVpbGRyb290IGNvdWxkIHNldCB0aGUgcnVuc3RhdGVkaXIgZm9yIENNYWtlCj4+IGFu
ZCBBdXRvdG9vbHMsIGJ1dCBpdHMgYSBiaXQgb2YgYSBoYXNzbGUgdG8gY2hlY2sgaWYgdGhlIGxh
dGVyCj4+IHN1cHBvcnRzIHRoZSBhcmd1bWVudCkKPj4KPj4+IEFjY29yZGluZyB0byBjb21taXQg
NmI5YTc1YTViZDFiMWE1NTliNzM1MjAwMzU4OGQxNDYxZGU4YzRkMSwgL3Zhci9ydW4KPj4+IGlz
IHN1cHBvc2VkIHRvIGJlIGEgc3ltbGluayB0byAvcnVuLCBzbyB5b3VyIHBhdGNoIHNob3VsZCBi
ZSBhIG5vLW9wLgo+Pj4gQm90aCBvdXIgc3lzdGVtZCBhbmQgc3lzdiBza2VsZXRvbnMgZW5zdXJl
IHRoaXMgc3ltbGluayBleGlzdC4KPj4+Cj4+PiBDb3VsZCB5b3UgcHJvdmlkZSBtb3JlIGRldGFp
bHMgYWJvdXQgdGhlIGlzc3VlID8KPj4KPj4gVG8gcXVvdGUgRkhTIDMuMTU6Cj4+ICJUaGUgcHVy
cG9zZXMgb2YgdGhpcyBkaXJlY3Rvcnkgd2VyZSBvbmNlIHNlcnZlZCBieSAvdmFyL3J1bi4gSW4K
Pj4gZ2VuZXJhbCwgcHJvZ3JhbXMgbWF5IGNvbnRpbnVlIHRvIHVzZSAvdmFyL3J1biB0byBmdWxm
aWxsIHRoZQo+PiByZXF1aXJlbWVudHMgc2V0IG91dCBmb3IgL3J1biBmb3IgdGhlIHB1cnBvc2Vz
IG9mIGJhY2t3YXJkcwo+PiBjb21wYXRpYmlsaXR5LiBQcm9ncmFtcyB3aGljaCBoYXZlIG1pZ3Jh
dGVkIHRvIHVzZSAvcnVuIHNob3VsZCBjZWFzZQo+PiB0aGVpciB1c2FnZSBvZiAvdmFyL3J1biwg
ZXhjZXB0IGFzIG5vdGVkIGluIHRoZSBzZWN0aW9uIG9uIC92YXIvcnVuLiIKPj4KPj4gaWYgeW91
IHVzZSAvcnVuIHlvdSBzaG91bGQgZG8gc28gY29uc2lzdGVudGx5LCAvdmFyL3J1biBzeW1saW5r
IGlzIGEKPj4gYmFuZGFpZC4gaWYgeW91IHdhbnQgYSB0ZWNobmljYWwgcmVhc29uLCB0aGluayBv
ZiAvIGJlaW5nIGEgdG1wZnMgYW5kCj4+IC92YXIgYmVpbmcgYSBORlMgbW91bnQsCj4+IHlvdSBk
b24ndCB3YW50IHRvIHRyYXZlcnNlIC92YXIgaWYgeW91IGRvbnQgaGF2ZSB0by4KPiAKPiBJIGhh
dmUgbWFya2VkIHRoaXMgcGF0Y2ggYXMgIlJlamVjdGVkIiBpbiBwYXRjaHdvcmsuCj4gCj4gdXBz
dHJlYW0gbGliZ2xpYjIgc3RpbGwgdXNlIC92YXIvcnVuIHRvIGNvbm5lY3Qgd2l0aCB0aGUgZGJ1
cyBzeXN0ZW0gc29ja2V0LgoKICBJTU8gdGhpcyBwYXRjaCBpcyBzb21ldGhpbmcgdGhhdCBzaG91
bGQgYmUgZml4ZWQgdXBzdHJlYW0gZmlyc3QsIGFuZCB3ZSB0YWtlIAppdCBpbiBCdWlsZHJvb3Qg
d2hlbiB3ZSBidW1wIHRoZSBsaWJnbGliMiB2ZXJzaW9uLgoKICBSZWdhcmRzLAogIEFybm91dAoK
PiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4gCj4+Cj4+IE5vcmJlcnQKPj4KPj4gWzFd
IC0gaHR0cHM6Ly9jbWFrZS5vcmcvY21ha2UvaGVscC9sYXRlc3QvbW9kdWxlL0dOVUluc3RhbGxE
aXJzLmh0bWwKPj4gWzJdIC0gaHR0cHM6Ly93d3cuZ251Lm9yZy9wcmVwL3N0YW5kYXJkcy9odG1s
X25vZGUvRGlyZWN0b3J5LVZhcmlhYmxlcy5odG1sCj4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPj4gYnVp
bGRyb290QGJ1c3lib3gubmV0Cj4+IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
