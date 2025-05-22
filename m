Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C80C54E65
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 17:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBB8741ABB;
	Thu, 22 May 2025 17:00:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSeRtYkKU28s; Thu, 22 May 2025 17:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F77541A4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F77541A4C;
	Thu, 22 May 2025 17:00:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 633FD106
 for <buildroot@buildroot.org>; Thu, 22 May 2025 17:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A58641EDF
 for <buildroot@buildroot.org>; Thu, 22 May 2025 17:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cebGOcLzGqyB for <buildroot@buildroot.org>;
 Thu, 22 May 2025 17:00:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4B9A0410A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B9A0410A7
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B9A0410A7
 for <buildroot@buildroot.org>; Thu, 22 May 2025 17:00:34 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:7efa:1d85:ad42:8017] (unknown
 [IPv6:2a01:e0a:12:eba0:7efa:1d85:ad42:8017])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 524B4C0256;
 Thu, 22 May 2025 18:50:45 +0200 (CEST)
Message-ID: <114f7365-da97-4ce0-8cad-bde4e9264efc@grenoble.cnrs.fr>
Date: Thu, 22 May 2025 18:50:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
Cc: Buildroot development <buildroot@buildroot.org>,
 Petr Vorel <petr.vorel@gmail.com>
References: <4a4473d3-56d6-4576-9a8f-5b708a1569df@grenoble.cnrs.fr>
 <1f3bc78a69a8ae087f6edebeba0b7017@free.fr>
Content-Language: en-US, fr
In-Reply-To: <1f3bc78a69a8ae087f6edebeba0b7017@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1747932645;
 bh=hjQeBYgQ9w3so+1WWril+kFIaqtFg/KFRUSYT3SAL2w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FwN6I5ecuGOkuDw0wI4szjhsO2qsIVUqDU1QY7OmR9IO+MdogUQgIjMEKvn6Aik6g
 P6NZJ/motQLzVla2RuWj6S+0MgcBJ6xIVBy9ofCk+rmqnbGVfxcT3XjKgqZBbWmUD1
 CpcMm4l62fDPza31j6aPFT/Dhh2IUSn7JCeeVzu4RE64XsJ35u+0s9lH6IAVjRgiFO
 1RG+kcZ0HrLVgH9Zz5Zdwunj9RP8Fl2h3T5UAZn761GPsmni6xjSAo1E+xnayeIVPe
 DfOZn5+2zwN32rjRIhpHKmBIQEfz8eBMccGXTW/2pROQJ2YYSTksG1eKrVPeNxhsbo
 2Ch1L1RBkTHKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=FwN6I5ec
Subject: Re: [Buildroot] [PATCH 1/1] support/kconfig: fix another compiler
 warning
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuISBIZWxsbyBhbGwhCgpPbiAyMS8wNS8yMDI1IDIyOjIyLCBKdWxpZW4gT2xp
dmFpbiB3cm90ZToKPiBIaSBFZGdhciwKPiAKPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KPiAK
PiBPbiAxOS8wNS8yMDI1IDExOjE1LCBFZGdhciBCb25ldCB2aWEgYnVpbGRyb290IHdyb3RlOgo+
PiBDb21waWxpbmcgd2l0aCBHQ0MgMTMuMyBnZW5lcmF0ZXMgdGhpczoKPj4KPj4gLi91dGlsLmM6
IEluIGZ1bmN0aW9uIOKAmGZpbGVfd3JpdGVfZGVw4oCZOgo+PiAuL3V0aWwuYzo4NjoyNjogd2Fy
bmluZzog4oCYJXPigJkgZGlyZWN0aXZlIHdyaXRpbmcgMTAgb3IgbW9yZSBieXRlcyBpbnRvIGEg
cmVnaW9uIG9mIHNpemUgYmV0d2VlbiAxIGFuZCA0MDk3IFstV2Zvcm1hdC1vdmVyZmxvdz1dCj4+
IMKgwqAgODYgfMKgwqDCoMKgwqDCoMKgwqAgc3ByaW50ZihidWYyLCAiJXMlcyIsIGRpciwgbmFt
ZSk7Cj4+IMKgwqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF5+Cj4+IC4vdXRpbC5jOjg2Ojk6IG5vdGU6IOKAmHNwcmludGbigJkgb3V0
cHV0IDExIG9yIG1vcmUgYnl0ZXMgKGFzc3VtaW5nIDQxMDcpIGludG8gYSBkZXN0aW5hdGlvbiBv
ZiBzaXplIDQwOTcKPj4gwqDCoCA4NiB8wqDCoMKgwqDCoMKgwqDCoCBzcHJpbnRmKGJ1ZjIsICIl
cyVzIiwgZGlyLCBuYW1lKTsKPj4gwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKgwqDCoCBefn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+Pgo+PiBUaGlzIGlzIHNpbWlsYXIgdG8gdGhlIHdh
cm5pbmdzIGdlbmVyYXRlZCBieSBHQ0MgOS40IGFuZCBmaXhlZCBpbgo+PiAzMjQ2MTJkNjhlICgi
c3VwcG9ydC9rY29uZmlnOiBmaXggY29tcGlsZXIgd2FybmluZ3MiKS4KPj4KPj4gQXZvaWQgdGhl
IHdhcm5pbmcgYnkgZW5sYXJnaW5nIHRoZSBkZXN0aW5hdGlvbiBidWZmZXIgb2YgZnByaW50Zigp
Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25ycy5m
cj4KPj4gLS0tCj4+IMKgc3VwcG9ydC9rY29uZmlnL3V0aWwuYyB8IDIgKy0KPj4gwqAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBh
L3N1cHBvcnQva2NvbmZpZy91dGlsLmMgYi9zdXBwb3J0L2tjb25maWcvdXRpbC5jCj4+IGluZGV4
IDg2NjVmNWJiODkuLjg2Y2U5OTQzNjcgMTAwNjQ0Cj4+IC0tLSBhL3N1cHBvcnQva2NvbmZpZy91
dGlsLmMKPj4gKysrIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwuYwo+PiBAQCAtMzUsNyArMzUsNyBA
QCBzdHJ1Y3QgZmlsZSAqZmlsZV9sb29rdXAoY29uc3QgY2hhciAqbmFtZSkKPj4gwqBpbnQgZmls
ZV93cml0ZV9kZXAoY29uc3QgY2hhciAqbmFtZSkKPj4gwqB7Cj4+IMKgwqDCoMKgIGNoYXIgKnN0
cjsKPj4gLcKgwqDCoCBjaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9NQVgrMV0sIGRp
cltQQVRIX01BWCsxXTsKPj4gK8KgwqDCoCBjaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFU
SF9NQVgrMTFdLCBkaXJbUEFUSF9NQVgrMV07Cj4gCj4gQnVpbGRyb290IGlzIGN1cnJlbnRseSB1
c2luZyBhIChyYXRoZXIgb2xkKSB2ZXJzaW9uIG9mIEtjb25maWcKPiBmcm9tIEtlcm5lbCA0LjE3
LXJjMi4gU2VlIFsxXS4gQnVpbGRyb290IG1haW50YWlucyBhIGxpc3Qgb2YKPiBwYXRjaGVzIGFw
cGxpZWQgb24gaXQsIGluIFsyXS4KCkluZGVlZCwgQXJub3V0IFZhbmRlY2FwcGVsbGUgZXhwbGFp
bmVkIG1lIHRoYXQgd2hpbGUgcmV2aWV3aW5nIGEKdmVyeSBzaW1pbGFyIHBhdGNoIG9mIG1pbmUu
IEhvd2V2ZXIsIGhlIGNvbmNsdWRlZDpbMV0KCiAgICBIb3dldmVyLCBpbiB0aGlzIGNhc2UsIHVw
c3RyZWFtIGhhcyBhbHJlYWR5IGhlYXZpbHkgbW9kaWZpZWQgdGhvc2UKICAgIGZpbGVzLCBhbmQg
Zml4ZWQgdGhlIGlzc3Vlcy4gU28gd2UgdGhlcmUncyBubyBuZWVkIHRvIGtlZXAgaXQgYXMKICAg
IHBhdGNoZXMuCgpBbmQgaGUgYXBwbGllZCB0aGUgcGF0Y2gsIHdpdGggdGhpcyBub3RlIG9uIHRo
ZSBjb21taXQgbWVzc2FnZTpbMl0KCiAgICBOb3JtYWxseSwgd2Ugd2FudCBjaGFuZ2VzIHRvIGtj
b25maWcgdG8gYmUgcmVmbGVjdGVkIGJ5IHBhdGNoZXMgaW4KICAgIHN1cHBvcnQva2NvbmZpZy9w
YXRjaGVzLiBUaGlzIG1ha2VzIGl0IGVhc2llciB0byByZXN5bmMgd2l0aAogICAgdXBzdHJlYW0g
a2NvbmZpZy4gSG93ZXZlciwgaW4gdGhpcyBjYXNlLCBldmVyeXRoaW5nIHRoYXQgaXMgY2hhbmdl
ZAogICAgaGVyZSBpcyBhbHJlYWR5IGNoYW5nZWQgY29tcGxldGVseSAoYW5kIGRpZmZlcmVudGx5
KSB1cHN0cmVhbSwgc28KICAgIHRoZXJlIGlzIG5vIGFkZGVkIHZhbHVlIGluIGtlZXBpbmcgdGhl
IHBhdGNoLgoKSSBkb24ndCBrbm93IHdoZXRoZXIgdGhpcyByYXRpb25hbGUgZm9yIG5vdCBrZWVw
aW5nIHRoZSBwYXRjaCBpcyBzdGlsbAp2YWxpZCB0b2RheS4gV2hhdCBkbyB5b3UgdGhpbms/IFNo
b3VsZCBJIHVwZGF0ZQoxNC1zdXBwb3J0LW91dC1vZi10cmVlLWNvbmZpZy5wYXRjaCBhbnl3YXk/
CgpSZWdhcmRzLAoKRWRnYXIuCgpbMV0gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVy
bWFpbC9idWlsZHJvb3QvMjAyMS1PY3RvYmVyLzMxMDU1OS5odG1sClsyXSBodHRwczovL2dpdGxh
Yi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvMzI0NjEyZDY4ZTA5Cgo+IFNl
ZSBmb3IgZXhhbXBsZSwgYW5vdGhlciBjb21taXQgYWRkaW5nIGEgcGF0Y2ggZm9yIEtjb25maWcg
WzNdLgo+IE5vdGUgdGhlIGNvbW1pdCBpcyBtb2RpZnlpbmcgdGhlIHNvdXJjZSBvZiBrY29uZmln
IGFuZCBpcyBhbHNvCj4gYWRkaW5nIGEgcGF0Y2ggaXMgdGhlIGRpcmVjdG9yeS4KPiAKPiBTaW5j
ZSB0aGUgd2FybmluZyB5b3Ugd2FudCB0byBmaXggaXMgaW50cm9kdWNlZCBieSBvbmUgb2YgdGhl
IEJ1aWxkcm9vdAo+IHBhdGNoIHRvIGJlIGFwcGxpZWQgb24gS2NvbmZpZyBpbiBbNF0sIHlvdXIg
cGF0Y2ggc2hvdWxkIGFsc28KPiBtb2RpZnkgWzRdIHRvIG1ha2Ugc3VyZSB5b3VyIGNoYW5nZSB3
aWxsIGJlIHJlYmFzZWQgb24gZnV0dXJlIGtjb25maWcKPiB1cGRhdGVzLgo+IAo+IENvdWxkIHlv
dSBzZW5kIGFuIHVwZGF0ZWQgdmVyc2lvbiBvZiB0aGlzIHBhdGNoIGFsc28gdXBkYXRpbmcgdGhl
Cj4ga2NvbmZpZyBwYXRjaCBbM10gcGxlYXNlPwo+IAo+PiDCoMKgwqDCoCBzdHJ1Y3Qgc3ltYm9s
ICpzeW0sICplbnZfc3ltOwo+PiDCoMKgwqDCoCBzdHJ1Y3QgZXhwciAqZTsKPj4gwqDCoMKgwqAg
c3RydWN0IGZpbGUgKmZpbGU7Cj4+IC0tIAo+PiAyLjQzLjAKPiAKPiBCZXN0IHJlZ2FyZHMsCj4g
Cj4gSnVsaWVuLgo+IAo+IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9ibG9iLzIwMjUuMDUtcmMxL3N1cHBvcnQva2NvbmZpZy9SRUFETUUuYnVpbGRyb290
Cj4gWzJdIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL3RyZWUv
MjAyNS4wNS1yYzEvc3VwcG9ydC9rY29uZmlnL3BhdGNoZXM/cmVmX3R5cGU9dGFncwo+IFszXSBo
dHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQvZDY1YzEw
YzIwYWRkNThmMTdjZjFkN2I2ZGU4ZTc5MDNiMGFhOWRkYwo+IFs0XSBodHRwczovL2dpdGxhYi5j
b20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9ibG9iLzIwMjUuMDUtcmMxL3N1cHBvcnQva2Nv
bmZpZy9wYXRjaGVzLzE0LXN1cHBvcnQtb3V0LW9mLXRyZWUtY29uZmlnLnBhdGNoI0wxNzYKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
