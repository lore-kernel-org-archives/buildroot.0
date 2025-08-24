Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7084BCA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 11:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EC83844E6;
	Sun, 24 Aug 2025 11:03:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vofnezRxKbsN; Sun, 24 Aug 2025 11:03:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C30A844EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C30A844EA;
	Sun, 24 Aug 2025 11:03:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 452B91D9
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 11:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2AED4844EF
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 11:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2Ym_dWb69ex for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 11:03:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29959844EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29959844EE
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29959844EE
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 11:03:41 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so603875f8f.2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 04:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756033419; x=1756638219;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JSxJO2dtZdw8elGO+feCTNdn6sJAeW6ACzuMLMeUXs8=;
 b=fvTZlgZinwaRhqzGDMwk2vcYNqolgkS4ueQkqn3/QPd/QN437oxYoS0lAU6uFl4sme
 ps5YPY51JQxJES+uru7Ia2CNvkQ+kP5du9pcq7aLId/D/eurYckC4+iectd16mT4jNNW
 SZtJ1P074BD2ti5VxtQeq/WD+f8TihwbZBepnSZ2lll03lhvkaOJtREk/qRek0oeDnrj
 mJ/Tvkfj9mT0TwO8Vw1W4oqkUOTVlt401250CwVEiNs4VM/eTVqpwBsz6VvOJH6HHKds
 6QXaay630uUyVrnadmVzpZW+zOwfupqFqjTVsGKM2KhywRl5b2w1Bjp/4P4uycNP3RFU
 whww==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwp1xOHXU3r3Yn0qDTBn/CSeF3tuPm/fkcDcBZPexeFas459R7P1/vLqPXVVONUKGR1ha/okABqBQ=@buildroot.org
X-Gm-Message-State: AOJu0YxvuySBwJDHb7sxzHIcQaScnfSn3ylaYa8Lg2rc33WPRuuQZwDq
 XxXLPqPDTTrPhdh/XKE9IR0TYSQECu+3XzrZ2+rEdqDyETpsfZvHrACexxAbXucqIiQyZ589Wmt
 oECYZ
X-Gm-Gg: ASbGncsZEPFcwtrkBOFs/07Wi05i+54fQzc8AS/poMB1RifsyDmuz8H/cH4o9u+/FjH
 /uHm2BB4rl+XdkRdPm0UMFevOaIyIywBzGjZrMEw1UcVS+JVAWzRDXVjdT+gqsGX0gn19lSEv1A
 IIwwErxUa1p453LsPA0+S5KT41Q7xtpaXnY6he3gw8CTKI1r/pt72RIpSZqKVpSZC64/YyK6wSO
 1zrF49dxjKmcJ9/NTOfAUH0hAZpNB327DD+KgfssZqc9vkzbZ3fsMjatkZhh/IgVbv5JAhaj9Rx
 G5KcmhBYiEIBAG/hM4QyM3AQLTlmNm1DPhxRp/EcTMalfa6QlCOudFtOD+HHouHyRWNZKwyHzKc
 zD7S57E+xzrmiIC4PA+1bf9FW6mnt0FX0bTH+MUtryMh+AayOSW7q4z2ZmI1HTgoIwMTwMWB0ER
 7nvx0SG5Ju6YYHofrF+CgD0BWXyjvjfcvfoOJzxLSH4eZ9BUMAZmBe6CKR7sZM
X-Google-Smtp-Source: AGHT+IFm3f7sLB3bMmxdnUwEAcyTAiLA5EoxT4h7IX+QxMVOAbuYZMi9XqGQ61LFIKzgq9V00+Bcuw==
X-Received: by 2002:a05:6000:2408:b0:3a4:fbaf:749e with SMTP id
 ffacd0b85a97d-3c5dcc0e4dfmr5833049f8f.49.1756033418933; 
 Sun, 24 Aug 2025 04:03:38 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e2ca03bsm75391945e9.3.2025.08.24.04.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 04:03:38 -0700 (PDT)
Message-ID: <db015602-6d63-4e28-9ace-60108fe8c7e0@smile.fr>
Date: Sun, 24 Aug 2025 13:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
References: <20250823204455.258595-1-thomas.petazzoni@bootlin.com>
Content-Language: fr
In-Reply-To: <20250823204455.258595-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756033419; x=1756638219; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JSxJO2dtZdw8elGO+feCTNdn6sJAeW6ACzuMLMeUXs8=;
 b=cYIkusHHwmVSHBOMWwwRkPZPJ1ysCOw5+x7sV3t7QF+oL25evU9WL1+fxXEEJztlD6
 /XyLMkTWNDhhip9NzT99GgcQEh1Bv7M7brXB8YBeQpdepwL4uDym7x3ZrtSeutH6kB+E
 C/xCzRT/8VwjIphSAFTst/3L/lhPKTET0oT1k=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cYIkusHH
Subject: Re: [Buildroot] [PATCH] package/rpi-userland: fix build with GCC
 15.x
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyMy8wOC8yMDI1IMOgIDIyOjQ0LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBUaGUgZm9sbG93aW5nIGRlZmNvbmZpZzoK
PiAKPiAgQlIyX2FybT15Cj4gIEJSMl9jb3J0ZXhfYTk9eQo+ICBCUjJfQVJNX0VOQUJMRV9WRlA9
eQo+ICBCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXkKPiAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9C
T09UTElOPXkKPiAgQlIyX0lOSVRfTk9ORT15Cj4gIEJSMl9TWVNURU1fQklOX1NIX05PTkU9eQo+
ICAjIEJSMl9QQUNLQUdFX0JVU1lCT1ggaXMgbm90IHNldAo+ICBCUjJfUEFDS0FHRV9SUElfVVNF
UkxBTkQ9eQo+ICAjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0Cj4gCj4gd2lsbCBm
YWlsIHRvIGJ1aWxkIGR1ZSB0byB0d28gaXNzdWVzIGluIHZhcmlvdXMgcGFydCBvZiBycGktdXNl
cmxhbmQKPiBtYWtpbmcgR0NDIDE1LnggdW5oYXBweS4KPiAKPiBQYXRjaCAwMDA4LUZpeC1jb25m
bGljdGluZy10eXBlcy1idWlsZC1lcnJvci5wYXRjaCBpcyB0YWtlbiBmcm9tIGEKPiBwdWxsIHJl
cXVlc3QgYWxyZWFkeSBzdWJtaXR0ZWQgYnkgYSBjb250cmlidXRvciB0byB0aGUgdXBzdHJlYW0K
PiBwcm9qZWN0Lgo+IAo+IFBhdGNoIDAwMDktRml4LXJhc3BpY29tbW9uc2V0dGluZ3NfcGFyc2Vf
Y21kbGluZS5wYXRjaCBpcyBiYWNrcG9ydGVkCj4gZnJvbSB1cHN0cmVhbSwgYW5kIGNhbiBiZSBk
cm9wcGVkIG5leHQgdGltZSB3ZSBidW1wIHJwaS11c2VybGFuZC4KPiAKPiBOb3RlIHRoYXQgdGhl
cmUgYXJlIG5vIGF1dG9idWlsZGVyIGZhaWx1cmVzIGZvciB0aGlzIGlzc3VlLgoKQXBwbGllZCB0
byBtYXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgo+IC0t
LQo+ICAuLi4wOC1GaXgtY29uZmxpY3RpbmctdHlwZXMtYnVpbGQtZXJyb3IucGF0Y2ggfCA0MSAr
KysrKysrKysrKysrKysrKysrCj4gIC4uLml4LXJhc3BpY29tbW9uc2V0dGluZ3NfcGFyc2VfY21k
bGluZS5wYXRjaCB8IDI4ICsrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA2OSBpbnNl
cnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3JwaS11c2VybGFuZC8wMDA4
LUZpeC1jb25mbGljdGluZy10eXBlcy1idWlsZC1lcnJvci5wYXRjaAo+ICBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9ycGktdXNlcmxhbmQvMDAwOS1GaXgtcmFzcGljb21tb25zZXR0aW5nc19w
YXJzZV9jbWRsaW5lLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLXVzZXJsYW5k
LzAwMDgtRml4LWNvbmZsaWN0aW5nLXR5cGVzLWJ1aWxkLWVycm9yLnBhdGNoIGIvcGFja2FnZS9y
cGktdXNlcmxhbmQvMDAwOC1GaXgtY29uZmxpY3RpbmctdHlwZXMtYnVpbGQtZXJyb3IucGF0Y2gK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjM0OWVmMjAyN2UKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9ycGktdXNlcmxhbmQvMDAwOC1GaXgtY29uZmxp
Y3RpbmctdHlwZXMtYnVpbGQtZXJyb3IucGF0Y2gKPiBAQCAtMCwwICsxLDQxIEBACj4gK0Zyb20g
YzIzMzdjODNjNjI3ZGQ5NGY5YjY3MzM2MWRjYTZmZmFmY2E3ZjU5YiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiArRnJvbTogSm9uYXMgS3ZpbmdlIDxqb25hc0Bqa3ZpbmdlLm5ldD4KPiArRGF0
ZTogU3VuLCA2IEp1bCAyMDI1IDIwOjIxOjAwICswMjAwCj4gK1N1YmplY3Q6IFtQQVRDSF0gRml4
IGNvbmZsaWN0aW5nIHR5cGVzIGJ1aWxkIGVycm9yCj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9n
aXRodWIuY29tL3Jhc3BiZXJyeXBpL3VzZXJsYW5kL3B1bGwvNzQ0Cj4gK1NpZ25lZC1vZmYtYnk6
IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gKy0tLQo+
ICsgaW50ZXJmYWNlL3ZjaGlxX2FybS92Y2hpcV9saWIuYyAgICAgICB8IDIgKy0KPiArIGludGVy
ZmFjZS92bWNzX2hvc3QvdmNfdmNoaV9ncHVzZXJ2LmggfCAyICstCj4gKyAyIGZpbGVzIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiArCj4gK2RpZmYgLS1naXQgYS9p
bnRlcmZhY2UvdmNoaXFfYXJtL3ZjaGlxX2xpYi5jIGIvaW50ZXJmYWNlL3ZjaGlxX2FybS92Y2hp
cV9saWIuYwo+ICtpbmRleCAxMzNkNWNhLi43YTJkYWU1IDEwMDc1NQo+ICstLS0gYS9pbnRlcmZh
Y2UvdmNoaXFfYXJtL3ZjaGlxX2xpYi5jCj4gKysrKyBiL2ludGVyZmFjZS92Y2hpcV9hcm0vdmNo
aXFfbGliLmMKPiArQEAgLTUzNyw3ICs1MzcsNyBAQCB2Y2hpcV9idWxrX3JlY2VpdmVfaGFuZGxl
KFZDSElRX1NFUlZJQ0VfSEFORExFX1QgaGFuZGxlLAo+ICsgICAgaW50IHNpemUsCj4gKyAgICB2
b2lkICp1c2VyZGF0YSwKPiArICAgIFZDSElRX0JVTEtfTU9ERV9UIG1vZGUsCj4gKy0gICBpbnQg
KCpjb3B5X3BhZ2VsaXN0KSgpKQo+ICsrICAgaW50ICgqY29weV9wYWdlbGlzdCkoY2hhciAqdmNw
dHIsIGNvbnN0IHN0cnVjdCBwYWdlbGlzdF9zdHJ1Y3QgKnBhZ2VsaXN0KSkKPiArIHsKPiArICAg
IFZDSElRX1NFUlZJQ0VfVCAqc2VydmljZSA9IGZpbmRfc2VydmljZV9ieV9oYW5kbGUoaGFuZGxl
KTsKPiArICAgIFZDSElRX1FVRVVFX0JVTEtfVFJBTlNGRVJfVCBhcmdzOwo+ICtkaWZmIC0tZ2l0
IGEvaW50ZXJmYWNlL3ZtY3NfaG9zdC92Y192Y2hpX2dwdXNlcnYuaCBiL2ludGVyZmFjZS92bWNz
X2hvc3QvdmNfdmNoaV9ncHVzZXJ2LmgKPiAraW5kZXggZmMwYmZlZS4uY2U2Y2I1OCAxMDA3NTUK
PiArLS0tIGEvaW50ZXJmYWNlL3ZtY3NfaG9zdC92Y192Y2hpX2dwdXNlcnYuaAo+ICsrKysgYi9p
bnRlcmZhY2Uvdm1jc19ob3N0L3ZjX3ZjaGlfZ3B1c2Vydi5oCj4gK0BAIC01OCw3ICs1OCw3IEBA
IHN0cnVjdCBzeW5jX2pvYl9zIHsKPiArIAo+ICsgc3RydWN0IGdwdV9jYWxsYmFja19zIHsKPiAr
ICAgLy8gY2FsbGJhY2sgdG8gY2FsbCB3aGVuIGNvbXBsZXRlIChjYW4gYmUgTlVMTCkKPiArLSAg
dm9pZCAoKmZ1bmMpKCk7Cj4gKysgIHZvaWQgKCpmdW5jKSh2b2lkKik7Cj4gKyAgIHZvaWQgKmNv
b2tpZTsKPiArIH07Cj4gKyAKPiArLS0gCj4gKzIuNTAuMQo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9ycGktdXNlcmxhbmQvMDAwOS1GaXgtcmFzcGljb21tb25zZXR0aW5nc19wYXJzZV9jbWRs
aW5lLnBhdGNoIGIvcGFja2FnZS9ycGktdXNlcmxhbmQvMDAwOS1GaXgtcmFzcGljb21tb25zZXR0
aW5nc19wYXJzZV9jbWRsaW5lLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi5kZjExZDU5MWZjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvcnBp
LXVzZXJsYW5kLzAwMDktRml4LXJhc3BpY29tbW9uc2V0dGluZ3NfcGFyc2VfY21kbGluZS5wYXRj
aAo+IEBAIC0wLDAgKzEsMjggQEAKPiArRnJvbSBjZjZkMGFjMGQzMWZjYzJlNjRjODNiODEwNWIw
NzhlNzkyZjJkNDQxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBLcmF3bG93IDxt
Z2xhcmVjZXJjYUBnbWFpbC5jb20+Cj4gK0RhdGU6IFdlZCwgMjMgTWFyIDIwMjIgMTY6NDY6MTgg
KzAxMDAKPiArU3ViamVjdDogW1BBVENIXSBGaXggcmFzcGljb21tb25zZXR0aW5nc19wYXJzZV9j
bWRsaW5lCj4gKwo+ICtGaXggcmFzcGljb21tb25zZXR0aW5nc19wYXJzZV9jbWRsaW5lJ3MgZGVm
aW5pdGlvbiB0byBtYXRjaCBkZWNsYXJhdGlvbgo+ICsKPiArVXBzdHJlYW06IGM0ZmQxYjg5ODZj
NmQ2ZDRhZTVjZDUxZTY1YThiYmViNDk1ZGZhNGUKPiArU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBl
dGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KPiArLS0tCj4gKyBob3N0X2Fw
cGxpY2F0aW9ucy9saW51eC9hcHBzL3Jhc3BpY2FtL1Jhc3BpQ29tbW9uU2V0dGluZ3MuaCB8IDIg
Ky0KPiArIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ICsK
PiArZGlmZiAtLWdpdCBhL2hvc3RfYXBwbGljYXRpb25zL2xpbnV4L2FwcHMvcmFzcGljYW0vUmFz
cGlDb21tb25TZXR0aW5ncy5oIGIvaG9zdF9hcHBsaWNhdGlvbnMvbGludXgvYXBwcy9yYXNwaWNh
bS9SYXNwaUNvbW1vblNldHRpbmdzLmgKPiAraW5kZXggNzViMjkzNy4uMmU5ZGU3ZCAxMDA2NDQK
PiArLS0tIGEvaG9zdF9hcHBsaWNhdGlvbnMvbGludXgvYXBwcy9yYXNwaWNhbS9SYXNwaUNvbW1v
blNldHRpbmdzLmgKPiArKysrIGIvaG9zdF9hcHBsaWNhdGlvbnMvbGludXgvYXBwcy9yYXNwaWNh
bS9SYXNwaUNvbW1vblNldHRpbmdzLmgKPiArQEAgLTU0LDYgKzU0LDYgQEAgdHlwZWRlZiBzdHJ1
Y3QKPiArIHZvaWQgcmFzcGljb21tb25zZXR0aW5nc19zZXRfZGVmYXVsdHMoUkFTUElDT01NT05T
RVRUSU5HU19QQVJBTUVURVJTICopOwo+ICsgdm9pZCByYXNwaWNvbW1vbnNldHRpbmdzX2R1bXBf
cGFyYW1ldGVycyhSQVNQSUNPTU1PTlNFVFRJTkdTX1BBUkFNRVRFUlMgKik7Cj4gKyB2b2lkIHJh
c3BpY29tbW9uc2V0dGluZ3NfZGlzcGxheV9oZWxwKCk7Cj4gKy1pbnQgcmFzcGljb21tb25zZXR0
aW5nc19wYXJzZV9jbWRsaW5lKFJBU1BJQ09NTU9OU0VUVElOR1NfUEFSQU1FVEVSUyAqc3RhdGUs
IGNvbnN0IGNoYXIgKmFyZzEsIGNvbnN0IGNoYXIgKmFyZzIsIHZvaWQgKCphcHBfaGVscCkoKSk7
Cj4gKytpbnQgcmFzcGljb21tb25zZXR0aW5nc19wYXJzZV9jbWRsaW5lKFJBU1BJQ09NTU9OU0VU
VElOR1NfUEFSQU1FVEVSUyAqc3RhdGUsIGNvbnN0IGNoYXIgKmFyZzEsIGNvbnN0IGNoYXIgKmFy
ZzIsIHZvaWQgKCphcHBfaGVscCkoY2hhciopKTsKPiArIAo+ICsgI2VuZGlmCj4gKy0tIAo+ICsy
LjUwLjEKPiArCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
