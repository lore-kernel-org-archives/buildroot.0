Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376AFCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 17:34:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4F8081A5F;
	Fri, 29 Aug 2025 17:34:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQSv5LpQ8zeB; Fri, 29 Aug 2025 17:34:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D710A80F6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D710A80F6A;
	Fri, 29 Aug 2025 17:34:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BB8B7D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADCAC616CF
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hMs5o5t0XwKL for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 17:34:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF88D616CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF88D616CE
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF88D616CE
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 17:34:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C6490B9784C7; Fri, 29 Aug 2025 19:34:20 +0200 (CEST)
Message-ID: <14bc8a4d-9867-48b8-bd83-480abcb1dfdb@rnout.be>
Date: Fri, 29 Aug 2025 19:34:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aLA14x2bTEN_ALy7@waldemar-brodkorb.de>
 <670efbf2-f387-4da2-837e-a5d323eef55a@rnout.be>
Content-Language: en-GB, fr-BE
In-Reply-To: <670efbf2-f387-4da2-837e-a5d323eef55a@rnout.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756488860; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=morGy1OtueoRhM0gEIPaVpJ++h780HuQVRGffIn+HpM=;
 b=L7jaQ2nAU+z5RZ8g8Br0XYXjbnK8xZVF36wOWKRYg/1qM931uXOHOtJlCGgoGXPXBsyZW9
 lvo2waxi/4DHRkUVVZEGcFa73kdDWLTenJ7hZHff11saPzVPX77BpaOXRlLG+pJAZWmGdu
 eIJK0jHADgsjz0Ii+WqAt7TRMdPrSrdEJZSLw1Z2/nIEsVi+CZsrbhpUN7lOlz6UsSCBUh
 QApEpQD+pOQrRPSy+42Sz1yzEKnWpPmi6x2nrUopChttHvUKQWASKKpntNG4WU48JlF5Fl
 96L5wWfP42EOB/IwMXzJHNvybsoaVXGUr4EVB83tJo10dUxsbvmq3xEACJp+ZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=L7jaQ2nA
Subject: Re: [Buildroot] [PATCH] evilwm: fix compilation with external
 toolchains
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

CgpPbiAyOS8wOC8yMDI1IDE5OjMzLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPiAKPiAK
PiBPbiAyOC8wOC8yMDI1IDEyOjU2LCBXYWxkZW1hciBCcm9ka29yYiB3cm90ZToKPj4gU3dpdGNo
IHRvIGdlbmVyaWMtcGFja2FnZSwgYXMgdGhlIGNvbmZpZ3VyZSBzY3JpcHQgaXNuJ3QgcmVhbGx5
IGEKPj4gYXV0b3Rvb2wgZ2VuZXJhdGVkIHNjcmlwdC4gVGhpcyBmaXhlcyBidWlsZGluZyBldmls
d20gd2l0aCBhbgo+PiBleHRlcm5hbCB0b29sY2hhaW4uCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFdh
bGRlbWFyIEJyb2Rrb3JiIDx3YnhAb3BlbmFkay5vcmc+CgogIEFsc28gcGxlYXNlIGluY2x1ZGUg
YSBGaXhlczogbGluZSwgZS5nLgpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3Vs
dHMvMjUwLzI1MDQwY2U3ZTk0YWNmOGY5MmMyNGRiODk1ZDdkZWEwODFkZTFkN2EKCgogIFJlZ2Fy
ZHMsCiAgQXJub3V0Cgo+PiAtLS0KPj4gwqAgcGFja2FnZS9ldmlsd20vZXZpbHdtLm1rIHwgMjQg
KysrKysrKysrKysrKysrKysrKysrKystCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2V2aWx3bS9l
dmlsd20ubWsgYi9wYWNrYWdlL2V2aWx3bS9ldmlsd20ubWsKPj4gaW5kZXggNzhiNTMxMDk1Yi4u
MjIxMTZiNzcxNCAxMDA2NDQKPj4gLS0tIGEvcGFja2FnZS9ldmlsd20vZXZpbHdtLm1rCj4+ICsr
KyBiL3BhY2thZ2UvZXZpbHdtL2V2aWx3bS5tawo+PiBAQCAtMTgsNCArMTgsMjYgQEAgZW5kZWYK
Pj4gwqAgRVZJTFdNX1BPU1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gRVZJTFdNX0lOU1RBTExf
WFNFU1NJT05fRklMRQo+PiAtJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQo+PiAraWZlcSAo
JChCUjJfVE9PTENIQUlOX0VYVEVSTkFMKSx5KQo+PiArRVZJTFdNX0NPTkZfT1BUUyArPSAtLWhv
c3Q9JChUT09MQ0hBSU5fRVhURVJOQUxfUFJFRklYKQo+PiArZWxzZQo+PiArRVZJTFdNX0NPTkZf
T1BUUyArPSAtLWhvc3Q9JChHTlVfVEFSR0VUX05BTUUpCj4gCj4gIMKgQ291bGQgd2UgdXNlIFRB
UkdFVF9DUk9TUyBoZXJlICh3aGljaCBpbmNsdWRlcyB0aGUgZnVsbCBwYXRoIGFzIHdlbGwpIGlu
c3RlYWQgCj4gb2Ygb3Blbi1jb2RpbmcgdGhlIGNvbmRpdGlvbj8KPiAKPj4gK2VuZGlmCj4+ICsK
Pj4gKyMgdGhlIGNvbmZpZ3VyZSBzY3JpcHQgaXMgbm90IGdlbmVyYXRlZCBieSBhdXRvY29uZgo+
PiArZGVmaW5lIEVWSUxXTV9DT05GSUdVUkVfQ01EUwo+PiArwqDCoMKgIChjZCAkKEBEKTsgJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpIC4vY29uZmlndXJlIFwKPj4gK8KgwqDCoMKgwqDCoMKgIC0t
cHJlZml4PS91c3IgXAo+IAo+ICDCoExvb2tpbmcgYXQgdGhlIGNvbmZpZ3VyZSBzY3JpcHQsIEkg
dGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIHBhc3MgYWxsIAo+IHBvc3NpYmxlIG9wdGlvbnM6
IGhvc3QsIHByZWZpeCwgbWFuZGlyLCBDRkxBR1MgYW5kIExERkxBR1MuCj4gCj4gIMKgUmVnYXJk
cywKPiAgwqBBcm5vdXQKPiAKPj4gK8KgwqDCoMKgwqDCoMKgICQoRVZJTFdNX0NPTkZfT1BUUykg
XAo+PiArwqDCoMKgICkKPj4gK2VuZGVmCj4+ICsKPj4gK2RlZmluZSBFVklMV01fQlVJTERfQ01E
Uwo+PiArwqDCoMKgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpIC1DICQoQEQpCj4+ICtlbmRl
Zgo+PiArCj4+ICtkZWZpbmUgRVZJTFdNX0lOU1RBTExfVEFSR0VUX0NNRFMKPj4gK8KgwqDCoCAk
KFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSBERVNURElSPSIkKFRBUkdFVF9ESVIpIiAtQyAkKEBE
KSBpbnN0YWxsCj4+ICtlbmRlZgo+PiArCj4+ICskKGV2YWwgJChnZW5lcmljLXBhY2thZ2UpKQo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
