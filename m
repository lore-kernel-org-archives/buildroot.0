Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B964CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFC284226;
	Fri, 15 May 2026 17:06:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8aSQ5JLYtLVp; Fri, 15 May 2026 17:06:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45BAC8447D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778864799;
	bh=zIaKSKbpYTsGsDKU9fFsyOEWCP0EXNtFW2ZXeoYobwQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jvjeFBg2CiFq1PIUiJHuRqEWDPxFT6JGWJ61jFi6KZ/V1Eop+ERs9xHfgQdAeNRY6
	 tZg0RGgBWiLWmvGYvensGWehxhyjqcCIPz4kRx3R5Gjxn7bZpdtw+EsGi63gjP2g9h
	 T/h4mattuRTI7J2WUxpo1cFZz63h0hhcg75kOTA/FSE8nfA92VTWpMiraQ3sO8foEJ
	 cP4GyRX3Chc2ZDM2kCQr7f0BZSIAOU7pxJSTJx7Dd3KSCqav0w1vO4mNxbNWPU/PCQ
	 o73j8T0OXu/aMcvv6oheN321RiQmKs1LKYL4VFyzSJjP+TAdsHg9tk4USVEHc1hUkK
	 im2p+faEZu+bA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45BAC8447D;
	Fri, 15 May 2026 17:06:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AF16282
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1FB278447D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dNWZMSK3z0DN for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:06:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D841784226
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D841784226
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D841784226
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:06:36 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48e56c1bf5dso178885e9.3
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778864795; x=1779469595;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6eiaGUZjNEa7uOXsQ97JGoobz3RcaGQD4Mx1m9Wg4q8=;
 b=p0te06QR1C2Zv50rUN+Wjt3U5kBfjZOw2IwpBV5usz/Haxl1O412kohlrJW6Y7d4eJ
 JfMKh0a9RRHL0B0FcCxEjLvlMaGUB2i8lr/G/IVb20uxRbj3/rp0KfNI7HgAFvaRFPSg
 5wkIjT/X4VVIwQ/x7sqVjJXX7By2j45rOlNyZOxr1ptHOW3fYg/Os2Q6NFe9A5teODiV
 nxjvB04nGjFbrI+isE/iwY89G2lNGY+py6fc1gi1RZ4oODjfDc4LeL1xn+W+lhK+a7+S
 AI/Cy9yYWXo7GO4HuXfQErDOI/8tETUOFhFeKN/ATthhBjeQ0gxum8vP4HdJ7eAYVTs/
 PxYA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9xxoXbdpBj4PjuhU5zglXzUBSsbooI6qR5DEmm5BZIyZ5iMHoAhAE5hjrTQZB+eUiVOhxrmKNKcjc=@buildroot.org
X-Gm-Message-State: AOJu0Yxy9PmnyAFPo3YjvgeXDFgosTLsDCeGvgwZ+mLlWZODHuXG4PaM
 vbSJ2S7TlhPCWrSZo/CZolqOV+OUVpL+bmDpwa5uQ9KEhS8NZUHLJ9jQlt0SsBnas3wNAbbxrwO
 SHlN1Eoc=
X-Gm-Gg: Acq92OEDD4s1as/A6R0pcQOyGYQqXkTXTKAsQ57f0SWttkRsl4alG4xdqYDcG7WRrv/
 WTl7n0W+ENhrVGHKN/khS7H01dj8tk2veXdm/WiSLk50aWHgBZGiVzVsF+Ull36eNVEscQRPBzq
 uWmLARgaxhHpqrIQrlT5cwS2e2nhmCwWIQSIYukmpp0cAYtqZmy6SSNrDtc94elcobKeiKBgbrQ
 PYJn4U/pSULSRncPVLhYn7uB1c2GHnXjoY9aMxGEUMpbJ3yxmHWzzAx9QDvwufYJ4rqjr6hBJGg
 KDzScJhvgAEBH7/E9RV3c/gXVZdFNSNLBBExuSi4MkW3srW4ViEiyO3XCwNA35LISWbyQpb2rSc
 UzH3CYtj6pI8pH6mX5VAQQssInNXnm8JVGke5T9IQH3Y5qBWCi9ciQA50YalvuYgIHBxtg8PhDH
 rKsBttePh0AwLGQ53JX/yTjJ+4q10lxyllQl/L3mFI0HEp9cWyu0o3OEi+xkaZYYMPgs7JsytF1
 gFg7K1a5p8Cxtr+A/Z4Rz9pLXMiKPOiXeaiKh5H5iQidUps5rMGRksP9PraciRKCQ==
X-Received: by 2002:a05:600c:8b6e:b0:48a:6fd4:d3d3 with SMTP id
 5b1f17b1804b1-48fe61ed21amr76127265e9.20.1778864794537; 
 Fri, 15 May 2026 10:06:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:94a2:a200:2ad9:827a:59cb:148a?
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c8344asm121206325e9.1.2026.05.15.10.06.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 May 2026 10:06:34 -0700 (PDT)
Message-ID: <ca026b12-71d0-4e33-a56b-c167cc723c0a@smile.fr>
Date: Fri, 15 May 2026 19:06:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20260419090115.1129567-1-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20260419090115.1129567-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1778864795; x=1779469595; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6eiaGUZjNEa7uOXsQ97JGoobz3RcaGQD4Mx1m9Wg4q8=;
 b=PoaZfs/VdtHFNu7ZzouDAbs6JscQhI0QGqT2Znf8TGcnatFTCisRlUbZS4XAUFpY7z
 V49y8Axf9+0qWj07YU+KjADQzOcKRgBuhvbZkYTyFwby5K4udt7/d7zXJ1JLizUb40dN
 VYT5uVk0IWr0RlMPklfU+eS3JW5SIyAIZmc4s=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=PoaZfs/V
Subject: Re: [Buildroot] [PATCH 1/1] package/zeek: add various fixes for gcc
 >= 15.x
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

SGVsbG8gQmVybmQsIEFsbCwKCkxlIDE5LzA0LzIwMjYgw6AgMTE6MDEsIEJlcm5kIEt1aGxzIGEg
w6ljcml0wqA6Cj4gRml4ZXM6Cj4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1
bHRzLzAyMi8wMjI3Y2RjMzM3ZmU3Y2JiMTlkOWI4OGIyYzNkODkwYzZhM2VlMzQ3Lwo+IAo+IFBs
ZWFzZSBub3RlIHRoYXQgcGF0Y2ggMDAwNiBmaXhlcyBhIGZvbGxvdy11cCBlcnJvciBtYXNrZWQg
YnkgdGhlCj4gY29uZmlndXJlIGVycm9yIGZvdW5kIGJ5IHRoZSBhdXRvYnVpbGRlcnMuCj4gCj4g
QnVpbGRpbmcgemVlayB3aXRoIGdjYyAxNC54IHdvcmtzIHVucGF0Y2hlZCB3aXRoIHRoaXMgZGVm
Y29uZmlnOgo+IAo+IEJSMl94ODZfNjQ9eQo+IEJSMl9UT09MQ0hBSU5fRVhURVJOQUw9eQo+IEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9YODZfNjRfR0xJQkNfU1RBQkxFPXkKPiBCUjJf
UEFDS0FHRV9aRUVLPXkKPiAKPiBUaGUgY2F1c2Ugb2YgdGhlIGJ1aWxkIGVycm9ycyB3YXMgdGhl
IGJ1bXAgb2YgZ2NjIHRvIDE1LngsIHRoaXMKPiBkZWZjb25maWcgZmFpbHMgd2l0aG91dCB0aGVz
ZSBuZXcgcGF0Y2hlczoKPiAKPiBCUjJfeDg2XzY0PXkKPiBCUjJfVE9PTENIQUlOX0VYVEVSTkFM
PXkKPiBCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVM9eQo+IEJSMl9QQUNLQUdFX1pFRUs9eQo+
IAo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gLS0tCj4g
QEZhYnJpY2U6IEJ1aWxkaW5nIHdpdGggQlIyX1BBQ0tBR0VfWkVFS19aRUVLQ1RMPXkgaXMgc3Rp
bGwgYnJva2VuLgo+IE91ciB6ZWVrIHJlbGVhc2UgNC4xLjEgZGF0ZXMgYmFjayB0byAyMDIxIHdp
dGggPiA4MDAwIHBhdGNoZXMgYXBwbGllZAo+IHRvIHVwc3RyZWFtIHNpbmNlIHRoZW4sIGN1cnJl
bnQgdmVyc2lvbiBpcyA4LjEuMS4gQmFja3BvcnRpbmcgcHl0aG9uLQo+IHJlbGF0ZWQgcGF0Y2hl
cyB0byBmaXggdGhlIGJ1aWxkIG9mIHplZWtjdGwgbG9va3MgcmVhbGx5IGRpZmZpY3VsdCBkdWUK
PiB0byBtYW55IGNoYW5nZXMgaW4gdGhlIDNyZC1wYXJ0eSBsaWJyYXJpZXMvc3VibW9kdWxlcyB1
c2VkIGJ5IHplZWsuCj4gCj4gRG8geW91IGhhdmUgYW55IGludGVyZXN0IGluIGZ1cnRoZXIgbWFp
bnRhaW5pbmcgemVlayBvciBzaG91bGQgd2UKPiBjb25zaWRlciB0byByZW1vdmUgdGhlIHBhY2th
Z2UgYmVjYXVzZSBpdCByZWd1bGFybHkgY2F1c2VzIGJ1aWxkCj4gZXJyb3JzIGR1ZSB0byBpdHMg
aHVnZSBjb2RlYmFzZT8KClRoZSBsYXN0IGNvbnRyaWJ1dGlvbiBmcm9tIEZhYnJpY2Ugd2FzIGJh
Y2sgaW4gMjAyNC4gTWF5YmUgd2Ugc2hvdWxkIGNvbnNpZGVyCnJlbW92aW5nIHRoaXMgcGFja2Fn
ZSBpbmRlZWQuCgo+IAo+ICAuLi5mZWRvcmEtcmF3aGlkZS1kdWUtdG8tRmluZEJJTkQuY21ha2Uu
cGF0Y2ggfCAyOCArKysrKysrKysrCj4gIC4uLmRpbnQtdG8taGVhZGVyLWZpbGVzLWFuZC1zb3Vy
Y2UtZmlsZS5wYXRjaCB8IDU1ICsrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA4MyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3plZWsvMDAw
NS1GaXgtYnVpbGQtd2l0aC1mZWRvcmEtcmF3aGlkZS1kdWUtdG8tRmluZEJJTkQuY21ha2UucGF0
Y2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvemVlay8wMDA2LUFkZC1pbmNsdWRlLWNz
dGRpbnQtdG8taGVhZGVyLWZpbGVzLWFuZC1zb3VyY2UtZmlsZS5wYXRjaAo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3plZWsvMDAwNS1GaXgtYnVpbGQtd2l0aC1mZWRvcmEtcmF3aGlkZS1kdWUt
dG8tRmluZEJJTkQuY21ha2UucGF0Y2ggYi9wYWNrYWdlL3plZWsvMDAwNS1GaXgtYnVpbGQtd2l0
aC1mZWRvcmEtcmF3aGlkZS1kdWUtdG8tRmluZEJJTkQuY21ha2UucGF0Y2gKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjUzZjRkN2JjMWUKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvcGFja2FnZS96ZWVrLzAwMDUtRml4LWJ1aWxkLXdpdGgtZmVkb3JhLXJhd2hpZGUt
ZHVlLXRvLUZpbmRCSU5ELmNtYWtlLnBhdGNoCj4gQEAgLTAsMCArMSwyOCBAQAo+ICtGcm9tIGRk
NmIyMzc2OWQ2MjRiODhhYmI0NTJkNjU3ZTJhZWRlNGFmNmEyMTEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4gK0Zyb206IEpvaGFubmEgQW1hbm4gPGpvaGFubmFAY29yZWxpZ2h0LmNvbT4KPiAr
RGF0ZTogU3VuLCAxOSBBcHIgMjAyNiAwOTowMjoyMCArMDIwMAo+ICtTdWJqZWN0OiBbUEFUQ0hd
IEZpeCBidWlsZCB3aXRoIGZlZG9yYSByYXdoaWRlIGR1ZSB0byBGaW5kQklORC5jbWFrZQo+ICsK
PiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS96ZWVrL3plZWsvaXNzdWVzLzQzMjkKClVw
c3RyZWFtIGRyb3BlZCBmaW5kX3BhY2thZ2UoQklORCBSRVFVSVJFRCk6Cmh0dHBzOi8vZ2l0aHVi
LmNvbS96ZWVrL3plZWsvY29tbWl0LzU2MjQzNTlmMzA5YTg5Yzg3YmJmZDRhZDRjZGZhN2I5YTY1
Y2ExYzIKCldlIHNob3VsZCBhdm9pZCB1c2luZyB0aGUgc3VnZ2VzdGVkIGhhY2sgZnJvbSB0aGUg
aXNzdWUgcmVwb3J0ZXIuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiArCj4gK1NpZ25lZC1vZmYt
Ynk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gKy0tLQo+ICsgY21ha2UvRmluZEJJ
TkQuY21ha2UgfCAyICstCj4gKyAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiArCj4gK2RpZmYgLS1naXQgYS9jbWFrZS9GaW5kQklORC5jbWFrZSBiL2NtYWtl
L0ZpbmRCSU5ELmNtYWtlCj4gK2luZGV4IGE1ZTMyMDQuLmRhMTgyNDIgMTAwNjQ0Cj4gKy0tLSBh
L2NtYWtlL0ZpbmRCSU5ELmNtYWtlCj4gKysrKyBiL2NtYWtlL0ZpbmRCSU5ELmNtYWtlCj4gK0BA
IC02Niw3ICs2Niw3IEBAIGZvcmVhY2ggKGJpbmRsaWIgJHtiaW5kX2xpYnN9KQo+ICsgICAgICAg
ICAjaW5jbHVkZSA8YXJwYS9uYW1lc2VyLmg+Cj4gKyAgICAgICAgICNpbmNsdWRlIDxyZXNvbHYu
aD4KPiArICAgICAgICAgaW50IG1haW4oKSB7Cj4gKy0gICAgICAgICAgICBpbnQgKCpwKSgpID0g
cmVzX21rcXVlcnk7Cj4gKysgICAgICAgICAgICBpbnQgKCpwKSgpID0gKGludCAoKikoKSlyZXNf
bWtxdWVyeTsKPiArICAgICAgICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgICB9Cj4gKyAiIHJl
c19ta3F1ZXJ5X3dvcmtzXyR7YmluZGxpYn0pCj4gKy0tIAo+ICsyLjQ3LjMKPiArCj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvemVlay8wMDA2LUFkZC1pbmNsdWRlLWNzdGRpbnQtdG8taGVhZGVyLWZp
bGVzLWFuZC1zb3VyY2UtZmlsZS5wYXRjaCBiL3BhY2thZ2UvemVlay8wMDA2LUFkZC1pbmNsdWRl
LWNzdGRpbnQtdG8taGVhZGVyLWZpbGVzLWFuZC1zb3VyY2UtZmlsZS5wYXRjaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uYWFjZDg2ZTdiNQo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL3plZWsvMDAwNi1BZGQtaW5jbHVkZS1jc3RkaW50LXRvLWhlYWRl
ci1maWxlcy1hbmQtc291cmNlLWZpbGUucGF0Y2gKPiBAQCAtMCwwICsxLDU1IEBACj4gK0Zyb20g
NGM3ZjMwMmYwNTI2NzEzYWRhZTRhYWQ3YjMxNTNiZTUzMDM5YWNhMyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKPiArRnJvbTogaTJ6MSA8aTJ6MUB5YW5kZXgucnU+Cj4gK0RhdGU6IFR1ZSwgNiBN
YXkgMjAyNSAyMjowOToyNyArMDMwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEFkZCBgI2luY2x1ZGUg
PGNzdGRpbnQ+YCB0byBoZWFkZXIgZmlsZXMgYW5kIHNvdXJjZSBmaWxlCj4gKwo+ICtVcHN0cmVh
bTogaHR0cHM6Ly9naXRodWIuY29tL3plZWsvcGFyYWdsb2IvY29tbWl0LzRjN2YzMDJmMDUyNjcx
M2FkYWU0YWFkN2IzMTUzYmU1MzAzOWFjYTMKPiArCj4gK1NpZ25lZC1vZmYtYnk6IEJlcm5kIEt1
aGxzIDxiZXJuZEBrdWhscy5uZXQ+Cj4gKy0tLQo+ICsgYXV4aWwvcGFyYWdsb2IvaW5jbHVkZS9w
YXJhZ2xvYi9wYXJhZ2xvYi5oICAgfCAyICsrCj4gKyBhdXhpbC9wYXJhZ2xvYi9pbmNsdWRlL3Bh
cmFnbG9iL3NlcmlhbGl6ZXIuaCB8IDEgKwo+ICsgc3JjL3BhcmFnbG9iLmNwcCAgICAgICAgICAg
ICAgfCAyICsrCj4gKyAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+ICsKPiArZGlm
ZiAtLWdpdCBhL2F1eGlsL3BhcmFnbG9iL2luY2x1ZGUvcGFyYWdsb2IvcGFyYWdsb2IuaCBiL2F1
eGlsL3BhcmFnbG9iL2luY2x1ZGUvcGFyYWdsb2IvcGFyYWdsb2IuaAo+ICtpbmRleCBkMjk0ODhj
Li5mMDJiNGY2IDEwMDY0NAo+ICstLS0gYS9hdXhpbC9wYXJhZ2xvYi9pbmNsdWRlL3BhcmFnbG9i
L3BhcmFnbG9iLmgKPiArKysrIGIvYXV4aWwvcGFyYWdsb2IvaW5jbHVkZS9wYXJhZ2xvYi9wYXJh
Z2xvYi5oCj4gK0BAIC0xMyw2ICsxMyw4IEBACj4gKyAjaW5jbHVkZSA8dmVjdG9yPgo+ICsgI2lu
Y2x1ZGUgPG1lbW9yeT4gLy8gc3RkOjp1bmlxdWVfcHRyCj4gKyAKPiArKyNpbmNsdWRlIDxjc3Rk
aW50Pgo+ICsrCj4gKyBjbGFzcyBBaG9Db3Jhc2lja1BsdXM7Cj4gKyAKPiArIG5hbWVzcGFjZSBw
YXJhZ2xvYiB7Cj4gK2RpZmYgLS1naXQgYS9hdXhpbC9wYXJhZ2xvYi9pbmNsdWRlL3BhcmFnbG9i
L3NlcmlhbGl6ZXIuaCBiL2F1eGlsL3BhcmFnbG9iL2luY2x1ZGUvcGFyYWdsb2Ivc2VyaWFsaXpl
ci5oCj4gK2luZGV4IDM4YTM2NDYuLmZlOWJlMWEgMTAwNjQ0Cj4gKy0tLSBhL2F1eGlsL3BhcmFn
bG9iL2luY2x1ZGUvcGFyYWdsb2Ivc2VyaWFsaXplci5oCj4gKysrKyBiL2F1eGlsL3BhcmFnbG9i
L2luY2x1ZGUvcGFyYWdsb2Ivc2VyaWFsaXplci5oCj4gK0BAIC02LDYgKzYsNyBAQAo+ICsgCj4g
KyAjaW5jbHVkZSA8dmVjdG9yPgo+ICsgI2luY2x1ZGUgPG1lbW9yeT4gLy8gc3RkOjp1bmlxdWVf
cHRyCj4gKysjaW5jbHVkZSA8Y3N0ZGludD4KPiArIAo+ICsgI2luY2x1ZGUgInBhcmFnbG9iL3Bh
cmFnbG9iLmgiCj4gKyAjaW5jbHVkZSAicGFyYWdsb2IvZXhjZXB0aW9ucy5oIgo+ICtkaWZmIC0t
Z2l0IGEvYXV4aWwvcGFyYWdsb2Ivc3JjL3BhcmFnbG9iLmNwcCBiL2F1eGlsL3BhcmFnbG9iL3Ny
Yy9wYXJhZ2xvYi5jcHAKPiAraW5kZXggM2RkNDkwZi4uZmViODdjNiAxMDA2NDQKPiArLS0tIGEv
YXV4aWwvcGFyYWdsb2Ivc3JjL3BhcmFnbG9iLmNwcAo+ICsrKysgYi9hdXhpbC9wYXJhZ2xvYi9z
cmMvcGFyYWdsb2IuY3BwCj4gK0BAIC00LDYgKzQsOCBAQAo+ICsgCj4gKyAjaW5jbHVkZSAiYWhv
Y29yYXNpY2svQWhvQ29yYXNpY2tQbHVzLmgiCj4gKyAKPiArKyNpbmNsdWRlIDxjc3RkaW50Pgo+
ICsrCj4gKyBwYXJhZ2xvYjo6UGFyYWdsb2I6OlBhcmFnbG9iKCkKPiArICAgOiBteV9hYyhuZXcg
QWhvQ29yYXNpY2tQbHVzKSB7fQo+ICsgCj4gKy0tIAo+ICsyLjQ3LjMKPiArCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
