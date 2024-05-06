Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEF0C4345F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 07:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5D5640BC7;
	Mon,  6 May 2024 07:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw0Pj87fS_7r; Mon,  6 May 2024 07:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E199140BDB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E199140BDB;
	Mon,  6 May 2024 07:01:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3345D1BF32E
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 07:01:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F352820F7
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 07:01:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gr4sZYYlPBUK for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 07:01:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E8A1782041
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A1782041
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8A1782041
 for <buildroot@buildroot.org>; Mon,  6 May 2024 07:01:18 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51f174e316eso1619800e87.0
 for <buildroot@buildroot.org>; Mon, 06 May 2024 00:01:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714978877; x=1715583677;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lFjCl19pn6VmoVTHZAZnmicFINnsu3pi0PhYS+2W8Q8=;
 b=NDzS/mGIUmhQWkgHbaCdVyTWpZFwntNyYW3CD9gNJT/nT4wqWrXLVbGV9nR+TB9CuQ
 4j/KoLTPrWiwOcgYfMZ5fO8Jpj0JJLY91PTn9z1zO7QyEahA/eVayAfiFrHy62bSpvLd
 JM/EQrlW2JgHXI2EFc9+IYV+PGEeSwheRbs/0Gw191LasOgS0OtIsX3yxKZldxPD2Vpw
 zAeNnnr5IstM4kcxleU2PQmMq7KpSGnH+GLL80wT50jdnDgCwzxi03jNfARl8iBA0BJp
 qN0HnlznBNHt7y1sclnzCQ9wrT6EfWBjOSr/5OzKuG3M4WPXgMnN6rsLqKNZvPHoOsdg
 tG6w==
X-Gm-Message-State: AOJu0YwLu+ADk3w2ob7f+DhQAFk0LLFmX8yWT35ertBVLJ5hsWUC2ivK
 reXck7OHzMCPJQIwO+TJje41hHREgYNdzS0GyqVDekXiNcjQnFYml26RxIqiM5K3fZHhkw5Mj7J
 r
X-Google-Smtp-Source: AGHT+IG8l+s3E6wPxpbm6HYirq7CGl6kNCqKIchPo4GETU4uzSDOGuZkmD3dP4EEsHEz4uxaxGgsqg==
X-Received: by 2002:ac2:4dad:0:b0:51d:c46d:8844 with SMTP id
 h13-20020ac24dad000000b0051dc46d8844mr5219567lfe.27.1714978876432; 
 Mon, 06 May 2024 00:01:16 -0700 (PDT)
Received: from [10.1.0.155] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b0041be4065adasm15061320wmq.22.2024.05.06.00.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 00:01:16 -0700 (PDT)
Message-ID: <c572d16c-4d9b-44db-808d-1aa1e0c61866@mind.be>
Date: Mon, 6 May 2024 09:01:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dylan <november@dismail.de>
References: <XWZ0DS.CUMWYFFCDVCQ2@dismail.de>
 <c9627c7b-f371-4c6a-8815-5ee3a3c1c190@mind.be>
 <JSA1DS.7U0E3BNQ9NS62@dismail.de>
Content-Language: en-GB
In-Reply-To: <JSA1DS.7U0E3BNQ9NS62@dismail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714978877; x=1715583677; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lFjCl19pn6VmoVTHZAZnmicFINnsu3pi0PhYS+2W8Q8=;
 b=dE8t1mozMw5LYnDmdSAoVdEbW9qPVfpNyV6SSkQ8ZuQdwgG4IzyHW8lUCe4UrFOMnH
 OM2FX4B5vzP9GlFhs/J2TkFcAKaHQ0MLFlgMTuo9FKaoZloNxc8FAcIzX6+AEZmdyFqG
 cZWhLTS9PPS0wi0W036NRTzQN+8/I0nZP6d0bGNDRqvRn/bHTGjKtSGmdaQFjEcccQ0G
 WhpYYmJA3ZevXiCqmBgsqOd9hpSBu0oQ29+MAL/GoAuco4ESDFtwa1FfwcHHa9fVJhVt
 sRpyKsJJ4ywY64tLq/DfjR0kaDTzsY75omNbU6K5nvgbHWRun83FnJuUJtxPMWP4QtNh
 fy4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dE8t1moz
Subject: Re: [Buildroot] Issue Building New Package cmus
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNS8yMDI0IDAwOjM2LCBEeWxhbiB3cm90ZToKPiBIZWxsbyBBcm5vdXQsCj4gCj4g
VGhhbmsgeW91IGZvciB0aGUgcHJvbXB0IHJlcGx5LiBJIG1vdmVkIHRoZSAkKFRBUkdFVF9DT05G
SUdVUkVfT1BUUykgdmFyaWFibGUgCj4gYmVoaW5kIHRoZSAuL2NvbmZpZ3VyZSBhbmQgTUFLRSBp
bnZvY2F0aW9ucyBhbmQgaXQgaGFzIHNvbHZlZCB0aGF0IGlzc3VlIChwYXN0ZWQgCj4gYmVsb3cp
Lgo+IAo+IGRlZmluZSBDTVVTX0NPTkZJR1VSRV9DTURTCj4gKGNkICQoQEQpOyBcCj4gJChUQVJH
RVRfQ09ORklHVVJFX09QVFMpIFwKPiAkKFRBUkdFVF9DT05GSUdVUkVfQVJHUykgXAo+IC4vY29u
ZmlndXJlICQoQ01VU19DT05GSUdVUkVfT1BUUykpCj4gZW5kZWYKPiAKPiBkZWZpbmUgQ01VU19C
VUlMRF9DTURTCj4gJChUQVJHRVRfTUFLRV9FTlYpIFwKPiAkKFRBUkdFVF9DT05GSUdVUkVfT1BU
UykgXAo+ICQoVEFSR0VUX0NPTkZJR1VSRV9BUkdTKSBcCj4gJChNQUtFKSAtQyAkKEBEKSBhbGwK
PiBlbmRlZgo+IAo+IGRlZmluZSBDTVVTX0lOU1RBTExfVEFSR0VUX0NNRFMKPiAkKFRBUkdFVF9N
QUtFX0VOVikgXAo+ICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSBcCj4gJChUQVJHRVRfQ09ORklH
VVJFX0FSR1MpIFwKPiAkKE1BS0UpIC1DICQoQEQpIGluc3RhbGwgXAo+IERFU1RESVI9IiQoVEFS
R0VUX0RJUikvdXNyL2JpbiIKPiBlbmRlZgo+IAo+IAo+IEknbSBub3cgcmVjZWl2aW5nIGVycm9y
cyByZWxhdGVkIHRvICJ1bmRlZmluZWQgcmVmZXJlbmNlcyIsIHdoaWNoIGJ5IHRoZWlyIAo+IG5h
bWVzLCBzZWVtIHJhdGhlciBlc3NlbnRpYWw6Cj4gCj4gbWFpbi5jOigudGV4dCsweDQpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBfX3N0YWNrX2Noa19ndWFyZCcKPiBidWlsZHJvb3Qvb3V0cHV0
L2hvc3QvYmluL2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS1sZDogbWFpbi5jOigudGV4dCsw
eDE0KTogCj4gdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19zdGFja19jaGtfZ3VhcmQnCj4gYnVp
bGRyb290L291dHB1dC9ob3N0L2Jpbi9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUtbGQ6IG1h
aW4uYzooLnRleHQrMHg0Yyk6IAo+IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYHJlYWQnCj4gYnVp
bGRyb290L291dHB1dC9ob3N0L2Jpbi9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUtbGQ6IG1h
aW4uYzooLnRleHQrMHg2NCk6IAo+IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fc3RhY2tfY2hr
X2d1YXJkJwo+IGJ1aWxkcm9vdC9vdXRwdXQvaG9zdC9iaW4vYWFyY2g2NC1idWlsZHJvb3QtbGlu
dXgtZ251LWxkOiBtYWluLmM6KC50ZXh0KzB4NjgpOiAKPiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBfX3N0YWNrX2Noa19ndWFyZCcKPiBidWlsZHJvb3Qvb3V0cHV0L2hvc3QvYmluL2FhcmNoNjQt
YnVpbGRyb290LWxpbnV4LWdudS1sZDogbWFpbi5jOigudGV4dCsweDgwKTogCj4gdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgX19zdGFja19jaGtfZmFpbCcKCiAgU291bmRzIGxpa2UgdGhlIE1ha2Vm
aWxlIHVuY29uZGl0aW9uYWxseSBlbmFibGVzIHN0YWNrIHNtYXNoaW5nIHByb3RlY3Rpb24sIApi
dXQgaXQncyBkaXNhYmxlZCBpbiB5b3VyIEJ1aWxkcm9vdCBjb25maWd1cmF0aW9uLiBDaGVjayBp
biB0aGUgTWFrZWZpbGUgaG93IAppdCdzIGRvbmUgYW5kIHRoZW4gZWl0aGVyIHBhdGNoIGl0IG91
dCwgb3IgZ2l2ZSB3aGF0ZXZlciBjb25maWcgb3B0aW9uIGlzIG5lZWRlZCAKdG8gZGlzYWJsZSBp
dC4gSWYgeW91IGRpc2FibGUgaXQsIGl0IHdpbGwgc3RpbGwgYmUgZW5hYmxlZCBieSBCdWlsZHJv
b3Qgd2hlbiAKaXQncyBlbmFibGVkIGluIHRoZSBCdWlsZHJvb3QgY29uZmlndXJhdGlvbiAodGhy
b3VnaCB0aGUgQ0ZMQUdTIHRoYXQgQnVpbGRyb290IApwYXNzZXMgaW4pLgoKPiBidWlsZHJvb3Qv
b3V0cHV0L2hvc3QvYmluL2FhcmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS1sZDogbWFpbi5vOiBp
biBmdW5jdGlvbiAKPiBgd3JpdGVfbGluZSc6Cj4gbWFpbi5jOigudGV4dCsweDEzOCk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYHN0cmxlbicKCiAgVGhpcyBpcyBtb3N0IGxpa2VseSBhIHNpbWls
YXIgc2l0dWF0aW9uIGJ1dCB3aXRoIEZPUlRJRlkuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+
IFNwZWNpZmljYWxseSwgcmlnaHQgYWZ0ZXIgdGhlIGxpbmUsCj4gIMKgwqDCoMKgTETCoMKgwqAg
Y211cy1yZW1vdGUKPiAKPiBEbyB5b3UgaGF2ZSBhbnkgc3VnZ2VzdGlvbnMgZm9yIHJlc291cmNl
cyBJIGNvdWxkIGRpdmUgZGVlcGVyIGludG8gdGhpcz8gSSd2ZSAKPiBiZWVuIGNvbWJpbmcgdGhy
b3VnaCB0aGUgYnVpbGRyb290IGFuZCBib290bGluIGRvY3MsIGJ1dCBpdCBzZWVtcyB0aGVyZSBh
cmUgc29tZSAKPiBzcGVjaWZpY3MgdGhhdCBJIGFtIG1pc3NpbmcuCj4gCj4gSSBoYXZlIHRoZSBm
dWxsIGJ1aWxkIGxvZyBoZXJlLCBpZiB5b3UncmUgc28gaW5jbGluZWQ6IGh0dHBzOi8vcGFzdGUu
YWNrLnRmL2Y4NmVhYgo+IAo+IFRoYW5rIHlvdSBmb3IgeW91ciBhc3Npc3RhbmNlIQo+IER5bGFu
Cj4gCj4gT24gU3VuLCBNYXkgNSAyMDI0IGF0IDA5OjMzOjIyIFBNICswMjAwLCBBcm5vdXQgVmFu
ZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IAo+IHdyb3RlOgo+Pgo+Pgo+PiBPbiAwNS8wNS8y
MDI0IDIwOjQxLCBEeWxhbiB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4gSGVsbG8sCj4+Pgo+Pj4g
SSBoYXZlIGFkZGVkIGEgbmV3IHBhY2thZ2UsIGNtdXMsIHRvIG15IGJ1aWxkcm9vdCBwYWNrYWdl
IGxpc3QsIGJ1dCB3aGVuIEkgCj4+PiB0cnkgf3RvIGNvbXBpbGUgaXQgZHVyaW5nIGEgZnVsbCBy
ZWJ1aWxkLCBpdCByZXR1cm5zIGFuIGVycm9yIG1lc3NhZ2UsCj4+Pgo+Pj4gaW5wdXQuYzogSW4g
ZnVuY3Rpb24gJ2RvX2h0dHBfZ2V0JzoKPj4+IGlucHV0LmM6MjIzOjU0OiBlcnJvcjogZXhwZWN0
ZWQgJyknIGJlZm9yZSAnVkVSU0lPTicKPj4+IENDIGxpYi5vCj4+PiBtYWtlWzJdOiAqKiogW3Nj
cmlwdHMvbGliLm1rOjY2OiBpbnB1dC5vXSBFcnJvciAxCj4+PiBtYWtlWzJdOiAqKiogV2FpdGlu
ZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+Pj4gbWFrZVsxXTogKioqIFtwYWNrYWdlL3BrZy1n
ZW5lcmljLm1rOjI4MzogCj4+PiB/YnVpbGRyb290L291dHB1dC9idWlsZC9jbXVzLTIuMTAuMC8u
c3RhbXBfYnVpbHRdIEVycm9yIDIKPj4+IG1ha2U6ICoqKiBbTWFrZWZpbGU6ODI6IF9hbGxdIEVy
cm9yIDIKPj4+Cj4+Pgo+Pj4gSSBjYW4gYnVpbGQgdGhlIGNtdXMgcGFja2FnZSBvdXRzaWRlIG9m
IGJ1aWxkcm9vdCwgc28gSSB0aGluayBpdCBtYXkgYmUgCj4+PiByZWxhdGVkIH90byBteSBjbXVz
Lm1rIGZpbGUsIGJ1dCBJIGFtIG5vdCBzdXJlIHdoYXQgaXMgd3Jvbmcgd2l0aCB0aGUgZmlsZS4K
Pj4+Cj4+PiBJJ3ZlIHVwbG9hZGVkIHRoZSBjb250ZW50cyBvZiB0aGUgY211cy5tayBmaWxlIGhl
cmU6Cj4+PiBodHRwczovL3Bhc3RlLmFjay50Zi84NDcxZGUKPj4KPj4gwqBZb3UgaGF2ZToKPj4K
Pj4gJChNQUtFKSAkKFRBUkdFVF9DT05GSUdVUkVfT1BUUykKPj4KPj4gwqBUaGlzIGZvcmNlcyBh
biBvdmVycmlkZSBvZiBhbGwgdmFyaWFibGVzIGRlZmluZWQgaW4gVEFSR0VUX0NPTkZJR1VSRV9P
UFRTLiAKPj4gT25lIG9mIHRob3NlIGlzIENGTEFHUywgYW5kIGluIHRoZSBNYWtlZmlsZSBpdHNl
bGYgdGhlIGRlZmluaXRpb24gb2YgVkVSU0lPTiAKPj4gaXMgYWRkZWQgdG8gQ0ZMQUdTLgo+Pgo+
PiDCoFRoZSBzb2x1dGlvbiBpcyB0eXBpY2FsbHkgdG8gdXNlCj4+Cj4+ICQoVEFSR0VUX0NPTkZJ
R1VSRV9PUFRTKSAkKE1BS0UpCj4+Cj4+IGkuZS4gcGFzcyBldmVyeXRoaW5nIGluIHRoZSBlbnZp
cm9ubWVudC4gQnV0IHRoZW4geW91IGhhdmUgdG8gbWFrZSBzdXJlIHRoYXQgCj4+IHRoZSBNYWtl
ZmlsZSBwcm9wZXJseSBoYW5kbGVzIHRoYXQgLSBlLmcuIHRoYXQgaXQgdXNlcyArPSBmb3IgQ0ZM
QUdTICh3aGljaCBpdCAKPj4gZG9lcykuCj4+Cj4+IMKgUmVnYXJkcywKPj4gwqBBcm5vdXQKPj4K
Pj4+Cj4+PiBJZiB0aGUgbWFpbGluZyBsaXN0IHN1cHBvcnRzIGl0LCBJIGhhdmUgdGhlIGhhc2gg
YW5kIGNvbmZpZyBmaWxlcyBhdHRhY2hlZCwgCj4+PiBhcyB/d2VsbC4KPj4+Cj4+Pgo+Pj4gSSdt
IHVzaW5nIGJ1aWxkcm9vdCB2ZXJzaW9uIDIwMjQuMDIgYW5kIGhhdmUgdHJpZWQgcnVubmluZyAi
bWFrZSBjbGVhbiBhbGwiLgo+Pj4gSXMgYW55b25lIGVsc2UgYWJsZSB0byByZXByb2R1Y2UgdGhl
IHNhbWUgZXJyb3IsIG9yIGNhbiB0ZWxsIG1lIHdoYXQgSSd2ZSAKPj4+IGRvbmUgf2luY29ycmVj
dGx5Pwo+Pj4KPj4+IFRoYW5rIHlvdSwKPj4+IER5bGFuCj4+Pgo+Pj4KPj4+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0Cj4+PiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCj4gCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
