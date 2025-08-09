Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F2EC87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:21:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E03F481DF5;
	Sat,  9 Aug 2025 21:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3WmDCu129lZN; Sat,  9 Aug 2025 21:21:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DC4881DF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DC4881DF8;
	Sat,  9 Aug 2025 21:21:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A77731
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:21:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0CC24065F
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1N_DdMG1VjBB for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:21:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E92EC4064E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E92EC4064E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E92EC4064E
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:21:22 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so1985281f8f.2
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 14:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754774481; x=1755379281;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HDGggXqhlJ12k+SW7PE0ge4Pn0s7k/sYkoI2nKzygSU=;
 b=K1lCq4yB/0YiTAvyKwszuQIyaD5pjW4OX4Q635As1TIAY1knCbmHOebrJlv4gckWdw
 1U0sHowoGDF3GVBPbD3yALXNp8G1Uc+taI8bKK4nBbRcNWIdM8XAmtvwRKEsCHJcT/4c
 DW2rw+KwoaoQWOq6lhe8XoZ9JwHb/nGRLF2BkmOClVLZha3SLCJqVqVdyWbZj6YweExU
 /sb8wBmxPKUjoqXj7/ixs4dj5ksdOb4LFCwCGRIk/fCwHa/qOqKue2LF8lkJdYlsIgeY
 cPR29nCcEJ4VijXwu7faag3jLrIRBG/1dSu9m3SPM5LIayNlD4l6hHX3JRurSUHq3aHo
 kpyw==
X-Gm-Message-State: AOJu0Yy4ZomSjboecdtyyzRw8fdWcpnvu2oXLg/xZUk0vpmP9oJSc5vi
 t+cq245j4CUTLvp6e/L8+ctfFFchzmcBoVZy3zkhah2aFZ5+Ixfj7TSVKc198VHomKg=
X-Gm-Gg: ASbGncu9kDEw6f6B8wOcqRnHa63pbJC05YJnRFCgNbtvHILxwVq0f2mimYJfRLQr2KI
 3R/npif+5wrqAD4qJmqD+VukfZZh6xXPl3dW7NY3QJ18S8zqZeInMSnGVfSEIQ2kL9bt+OIzNkc
 YYkDVHvhqQnTwCSpfFYCoJ8FezpKtVk9IyCUce18vtKgzJIKR3Q+CXY5m5XkJjiOXml0Rdbh1wQ
 NUEFBZkGQ2GZOIfsyVnqsTvSKLZlreiEt+rUsJsnxnFqxKY+zYATy+0uSAlAgBlWQ+k1OndcSsu
 kJ8W1YWFPNfZ6q1u+WMEa5QxPcOLNPIJWpDIcK/QPSW7hK8BNZX7JVfK6lKsy0vtOdffxH9i48F
 O32V7TSQgzMafWpA1oxozxoIbwrimls0/rb0w26W55TVcPJN2+f5MXP3Q2SQxPj+WRBItTmZRmW
 rTbo1TKXCqxs0dY/zhcQgXP7XStCLHBJki/CM/RciMMPLSzPXrHXfViYT6NGK4
X-Google-Smtp-Source: AGHT+IGmUBL2rO0tVcmyl2hPQiybtTeHnzjI6RTKvee98I9SFmhWiAteZoZC+1nNSa41bKN5VZVCCA==
X-Received: by 2002:a05:6000:144f:b0:3a4:f663:acb9 with SMTP id
 ffacd0b85a97d-3b90093e6d2mr6074687f8f.9.1754774480817; 
 Sat, 09 Aug 2025 14:21:20 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459db13fc9fsm263753875e9.7.2025.08.09.14.21.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 14:21:20 -0700 (PDT)
Message-ID: <726dd93d-3312-434d-ae76-5317f69e74fe@smile.fr>
Date: Sat, 9 Aug 2025 23:21:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
References: <20250803133400.2759380-1-thomas.perale@mind.be>
 <aJHWOTj4_yggJ4nM@probook>
Content-Language: fr
In-Reply-To: <aJHWOTj4_yggJ4nM@probook>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754774481; x=1755379281; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HDGggXqhlJ12k+SW7PE0ge4Pn0s7k/sYkoI2nKzygSU=;
 b=TQSKW5x8C8N5Xzgnyu7YkiYqC0VxWNylyKOnWBS3hJ+2xHddUPB1/pGLYq5WIfk6tY
 oKio5yhP1TacC/ciyXQrdRICvuj7yvk1DEw2bMcpLNNZORTsXPMduQaLgHnGX3QLW6gQ
 qNacxbP8T1ujd1u568P7WDwQ5XHFuhgh41ONE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=TQSKW5x8
Subject: Re: [Buildroot] [PATCH] package/snooze: fix build w/ uclibc
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwNS8wOC8yMDI1IMOgIDEyOjAwLCBKLiBOZXVzY2jDpGZl
ciB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gT24gU3VuLCBBdWcgMDMsIDIwMjUgYXQgMDM6
MzQ6MDBQTSArMDIwMCwgVGhvbWFzIFBlcmFsZSB3cm90ZToKPj4gVGhlIGZvbGxvd2luZyBlcnJv
ciBvY2N1ciBvbiB0aGUgYXV0b2J1aWxkZXIgZm9yIHN0YXRpYyBidWlsZCB1c2luZwo+PiBidWls
ZHJvb3QgdG9vbGNoYWluIGFuZCB1Y2xpYmM6Cj4+Cj4+IGBgYAo+PiAvdXNyL2Jpbi9tYWtlIC1q
MTcgLUMgL2hvbWUvYnVpbGRyb290L2luc3RhbmNlLTAvb3V0cHV0LTEvYnVpbGQvc25vb3plLTAu
NS8gUFJFRklYPS91c3IgQ0M9L2hvbWUvYnVpbGRyb290L2luc3RhbmNlLTAvb3V0cHV0LTEvaG9z
dC9iaW4vYXJjLWJ1aWxkcm9vdC1saW51eC11Y2xpYmMtZ2NjIENGTEFHUz0iLURfTEFSR0VGSUxF
X1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAgLU9z
IC1nMCAgLXN0YXRpYyAgLXN0YXRpYyIKPj4gbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5ICcv
aG9tZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9idWlsZC9zbm9vemUtMC41Jwo+PiAv
aG9tZS9idWlsZHJvb3QvaW5zdGFuY2UtMC9vdXRwdXQtMS9ob3N0L2Jpbi9hcmMtYnVpbGRyb290
LWxpbnV4LXVjbGliYy1nY2MgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VS
Q0UgLURfRklMRV9PRkZTRVRfQklUUz02NCAgLU9zIC1nMCAgLXN0YXRpYyAgLXN0YXRpYyAgICBz
bm9vemUuYyAgIC1vIHNub296ZQo+PiBzbm9vemUuYzoyMjoxMDogZmF0YWwgZXJyb3I6IHN5cy9h
dXh2Lmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPj4gICAgMjIgfCAjaW5jbHVkZSA8c3lz
L2F1eHYuaD4KPj4gICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+fn4KPj4gY29tcGlsYXRpb24g
dGVybWluYXRlZC4KPj4gbWFrZVsxXTogKioqIFs8YnVpbHRpbj46IHNub296ZV0gRXJyb3IgMQo+
PiBgYGAKPj4KPj4gVGhpcyBlcnJvciBjYW4gYmUgcmVwcm9kdWNlZCB3aXRoOgo+Pgo+PiBgYGAK
Pj4gY2F0ID4uY29uZmlnIDw8RU9GCj4+IEJSMl9hcm09eQo+PiBCUjJfY29ydGV4X2E3PXkKPj4g
QlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfVUNMSUJDPXkKPj4gQlIyX1NUQVRJQ19MSUJTPXkKPj4g
QlIyX1BBQ0tBR0VfU05PT1pFPXkKPj4gRU9GCj4+IG1ha2Ugb2xkZGVmY29uZmlnCj4+IG1ha2Ug
c25vb3plCj4+IGBgYAo+Pgo+PiBUaGUgZXJyb3IgZG9lc24ndCBvY2N1ciBvbiBleHRlcm5hbCB0
b29sY2hhaW5zLgo+Pgo+PiBUaGUgYCNpbmNsdWRlIDxzeXMvYXV4di5oPmAgd2FzIG9yaW5hbGx5
IGluY2x1ZGVkIGluIHRoZSBpbml0aWFsIGNvbW1pdAo+PiAoc2VlIFsxXSkgdG8gdXNlIHRoZSBg
Z2V0YXV4dmFsYCBmdW5jdGlvbiBkZWNsYXJhdGlvbi4gVGhpcyBmdW5jdGlvbgo+PiB1c2FnZSBo
YXMgc2luY2UgYmVlbiByZW1vdmVkIGluIGNvbW1pdCBbMl0uCj4+Cj4+IFRoaXMgcGF0Y2ggcmVt
b3ZlcyB0aGUgaW5jbHVkZSB0aGF0IGlzIG5vIGxvbmdlciBuZWVkZWQuCj4+Cj4+IFsxXSBodHRw
czovL2dpdGh1Yi5jb20vbGVhaG5ldWtpcmNoZW4vc25vb3plL2NvbW1pdC81NjQ4MDg4MTk3OGE0
Y2I1ODEzNzQ2MjMyZGU5OTUwZDQ2Y2IzMzY5Cj4+IFsyXSBodHRwczovL2dpdGh1Yi5jb20vbGVh
aG5ldWtpcmNoZW4vc25vb3plL2NvbW1pdC82MTBlNmIzNWVjNjE0NzY0NzcwZDQ3YjU5NzRiMzBm
ZDkwZGNlNmZlCj4+Cj4+IEZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jl
c3VsdHMvYWVjL2FlYzQ2M2Y4NzA5NGE0N2VlMDU5MTEzZjA4ZThlZTM2MDRkY2VhOWIKPj4gU2ln
bmVkLW9mZi1ieTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgo+IAo+IFRo
YW5rcyEKPiAKPiBSZXZpZXdlZC1ieTogSi4gTmV1c2Now6RmZXIgPGoubmVAcG9zdGVvLm5ldD4K
PiAKPj4gLS0tCj4+IEhpLAo+Pgo+PiBOb3Qgc3VyZSB3aHkgdGhlIGVycm9yIG9ubHkgaGFwcGVu
cyBvbiB0aGUgc3BlY2lmaWMgY29tYmluYXRpb24gb2YKPj4gYnVpbGRyb290IHRvb2xjaGFpbiBh
bmQgc3RhdGljIGJ1aWxkLiBUaGUgYF9fbGludXhfX2AgZGVmaW5pdGlvbiBpcwo+PiBwcmVzZW50
IG9uIG90aGVyIHRvb2xjaGFpbiBhcyB3ZWxsIHNvIGl0IHNob3VsZCBmYWlsIGluIG90aGVyCj4+
IHNjZW5hcmlvLgoKVGhlIHBhdGNoIGlzIG5vdyBtZXJnZWQgdXBzdHJlYW0uCgpBcHBsaWVkIHRv
IG1hc3RlciwgdGhhbmtzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+Pgo+PiBSZWdhcmRzLAo+
PiBUaG9tYXMKPj4gLS0tCj4+ICAuLi4vMDAwMi1zbm9vemUtcmVtb3ZlLXVudXNlZC1pbmNsdWRl
LnBhdGNoICAgfCAzNiArKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMzYg
aW5zZXJ0aW9ucygrKQo+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvc25vb3plLzAwMDIt
c25vb3plLXJlbW92ZS11bnVzZWQtaW5jbHVkZS5wYXRjaAo+Pgo+PiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9zbm9vemUvMDAwMi1zbm9vemUtcmVtb3ZlLXVudXNlZC1pbmNsdWRlLnBhdGNoIGIvcGFj
a2FnZS9zbm9vemUvMDAwMi1zbm9vemUtcmVtb3ZlLXVudXNlZC1pbmNsdWRlLnBhdGNoCj4+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGluZGV4IDAwMDAwMDAwMDAuLmZiYTkyY2Q2YjUKPj4gLS0t
IC9kZXYvbnVsbAo+PiArKysgYi9wYWNrYWdlL3Nub296ZS8wMDAyLXNub296ZS1yZW1vdmUtdW51
c2VkLWluY2x1ZGUucGF0Y2gKPj4gQEAgLTAsMCArMSwzNiBAQAo+PiArRnJvbSAyZWViZDMzYzEw
ZDVhMGYxYTk4MzFlM2U0OTIxNTg1N2FiNDFlYzAzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+
PiArRnJvbTogVGhvbWFzIFBlcmFsZSA8cGVyYWxlLnRob21hc0BnbWFpbC5jb20+Cj4+ICtEYXRl
OiBTYXQsIDIgQXVnIDIwMjUgMjM6MDk6MzEgKzAyMDAKPj4gK1N1YmplY3Q6IFtQQVRDSF0gc25v
b3plOiByZW1vdmUgdW51c2VkIGluY2x1ZGUKPj4gKwo+PiArVGhlIGAjaW5jbHVkZSA8c3lzL2F1
eHYuaD5gIHdhcyBvcmluYWxseSBpbmNsdWRlZCBpbiB0aGUgaW5pdGlhbCBjb21taXQKPj4gKyhz
ZWUgWzFdKSB0byB1c2UgdGhlIGBnZXRhdXh2YWxgIGZ1bmN0aW9uIGRlY2xhcmF0aW9uLgo+PiAr
Cj4+ICtUaGlzIGZ1bmN0aW9uIHVzYWdlIGhhcyBzaW5jZSBiZWVuIHJlbW92ZWQgaW4gY29tbWl0
IFsyXS4KPj4gKwo+PiArVGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgaW5jbHVkZSB0aGF0IGlzIG5v
IGxvbmdlciBuZWVkZWQuCj4+ICsKPj4gK1sxXSBodHRwczovL2dpdGh1Yi5jb20vbGVhaG5ldWtp
cmNoZW4vc25vb3plL2NvbW1pdC81NjQ4MDg4MTk3OGE0Y2I1ODEzNzQ2MjMyZGU5OTUwZDQ2Y2Iz
MzY5Cj4+ICtbMl0gaHR0cHM6Ly9naXRodWIuY29tL2xlYWhuZXVraXJjaGVuL3Nub296ZS9jb21t
aXQvNjEwZTZiMzVlYzYxNDc2NDc3MGQ0N2I1OTc0YjMwZmQ5MGRjZTZmZQo+PiArCj4+ICtVcHN0
cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2xlYWhuZXVraXJjaGVuL3Nub296ZS9wdWxsLzI0Cj4+
ICtTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGVyYWxlIDx0aG9tYXMucGVyYWxlQG1pbmQuYmU+Cj4+
ICstLS0KPj4gKyBzbm9vemUuYyB8IDQgLS0tLQo+PiArIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0
aW9ucygtKQo+PiArCj4+ICtkaWZmIC0tZ2l0IGEvc25vb3plLmMgYi9zbm9vemUuYwo+PiAraW5k
ZXggZTQ3YWQxMS4uMTE5MjVjYSAxMDA2NDQKPj4gKy0tLSBhL3Nub296ZS5jCj4+ICsrKysgYi9z
bm9vemUuYwo+PiArQEAgLTE4LDEwICsxOCw2IEBACj4+ICsgI2luY2x1ZGUgPHRpbWUuaD4KPj4g
KyAjaW5jbHVkZSA8dW5pc3RkLmg+Cj4+ICsgCj4+ICstI2lmZGVmIF9fbGludXhfXwo+PiArLSNp
bmNsdWRlIDxzeXMvYXV4di5oPgo+PiArLSNlbmRpZgo+PiArLQo+PiArIHN0YXRpYyBsb25nIHNs
YWNrID0gNjA7Cj4+ICsgI2RlZmluZSBTTEVFUF9QSEFTRSAzMDAKPj4gKyBzdGF0aWMgaW50IG5m
bGFnLCB2ZmxhZzsKPj4gLS0gCj4+IDIuNTAuMQo+Pgo+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
