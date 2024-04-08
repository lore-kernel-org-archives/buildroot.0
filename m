Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095F6C67861
	for <buildroot@archiver.kernel.org>; Mon,  8 Apr 2024 07:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E91D40A48;
	Mon,  8 Apr 2024 07:52:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQsYDj0SbYjc; Mon,  8 Apr 2024 07:52:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BBBE4031E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BBBE4031E;
	Mon,  8 Apr 2024 07:52:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC061BF489
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 07:52:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A32281C11
 for <buildroot@lists.busybox.net>; Mon,  8 Apr 2024 07:52:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_-hbyZuMepo for <buildroot@lists.busybox.net>;
 Mon,  8 Apr 2024 07:52:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.130.47;
 helo=dd5108.kasserver.com; envelope-from=dev@andin.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6D3B681BB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D3B681BB2
Received: from dd5108.kasserver.com (dd5108.kasserver.com [85.13.130.47])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D3B681BB2
 for <buildroot@buildroot.org>; Mon,  8 Apr 2024 07:52:12 +0000 (UTC)
Received: from [192.168.178.79] (ipb21bd56e.dynamic.kabel-deutschland.de
 [178.27.213.110])
 by dd5108.kasserver.com (Postfix) with ESMTPSA id 020F75245228;
 Mon,  8 Apr 2024 09:52:08 +0200 (CEST)
Message-ID: <e092a516-7bbb-4331-b42f-ff2742cd1bdb@andin.de>
Date: Mon, 8 Apr 2024 09:52:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>,
 Andreas Naumann <anaumann@ultratronik.de>, buildroot@buildroot.org
References: <20240306111212.1331451-1-anaumann@ultratronik.de>
 <834828e5-042f-4588-9ed6-10fa5a5e2502@mind.be>
Content-Language: en-US
From: Andreas Naumann <dev@andin.de>
In-Reply-To: <834828e5-042f-4588-9ed6-10fa5a5e2502@mind.be>
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=andin.de; 
 s=kas202403131123; t=1712562729;
 bh=EmyN1RI4fU8Z/bsaRGd7f/OWQFU5GeTyGBcM11CMdJY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=S+yikItxSIbWwU7YVlgIMUIJyZWzXyUrqSY8aOFysGOHAZhsQ427LCGqDuH56VdNc
 S8HIOjwj4mIG7N6rx1EnZSr9j9maReiJHgC8AsONIjCLX5tZrQ7h4M0V8P1i8ZQ3rF
 Die39qIbLI04cuEmuaCS+JQVj2m3b2R7C37OMS+LYXXIctVaPGy8XKoVjS/NNwbJ9E
 WUx7pgxBgTGaOUmns94Zj68B0tXmNgUQZwR9pQEG4rFHiGHF1MOxS29k6cVCy7xt8p
 5FpMJkOjQxYN4eBfY3pDHqPcCZM9IXBfgSSVJ2mUa7CXZA+X75qMdVeUcwAEQR5p9s
 gtQovOs0nzP5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=andin.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=andin.de header.i=@andin.de header.a=rsa-sha256
 header.s=kas202403131123 header.b=S+yikItx
Subject: Re: [Buildroot] [PATCH 1/1] package/imx-gpu-viv: fix masking fb
 option
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LCBhbGwsCgpPbiAwNy4wNC4yNCAxODoxMSwgQXJub3V0IFZhbmRlY2FwcGVsbGUg
dmlhIGJ1aWxkcm9vdCB3cm90ZToKPiDCoEhpIEFuZHJlYXMsCj4gCj4gT24gMDYvMDMvMjAyNCAx
MjoxMiwgQW5kcmVhcyBOYXVtYW5uIHdyb3RlOgo+PiBPbmx5IHRoZSAzMmJpdCBBUk0gYmxvYiBw
cm92aWRlcyB0aGUgZnJhbWVidWZmZXIgYmFja2VuZC4gVGhpcyBpcwo+PiBhcHBhcmVudGx5IGlu
ZGVwZW5kZW50IG9mIHdoaWNoIGlteDggZGVyaXZhdGUgaXMgdXNlZCwgc28gY2hhbmdlZAo+PiB0
aGUgY29uZGl0aW9uIGZvciB0aGUgY29uZmlnIG9wdGlvbiBhY2NvcmRpbmdseS4KPiAKPiDCoFlv
dSBzaG91bGQgaGF2ZSBpbmNsdWRlZCBzb21lIHJlZmVyZW5jZXMgaGVyZSBzbyBvdGhlciBwZW9w
bGUgY2FuCj4gZG91YmxlLWNoZWNrIHRoaXMgaW5mb3JtYXRpb24uCgpJIGhhdmUgbm8gcmVmZXJl
bmNlIG90aGVyIHRoYW4gd2hhdHMgYXZhaWxhYmxlIGluIHRoZSBibG9icy4gVGhlcmUgYXJlCnR3
byBkaWZmZXJlbnQgYmxvYnMgZm9yIDMyIGFuZCA2NCBiaXQgYXJjaCBhbmQgb25seSB0aGUgMzJi
aXQgdmFyaWFudApwcm92aWRlcyB0aGUgZ3B1LWNvcmUvdXNyL2xpYi9mYi8gc3ViZm9sZGVyIHdp
dGggdGhlIHJlbGV2YW50IC5zbyBmaWxlcy4KCj4gCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
YXMgTmF1bWFubiA8YW5hdW1hbm5AdWx0cmF0cm9uaWsuZGU+Cj4+IC0tLQo+PiDCoCBwYWNrYWdl
L2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYvQ29uZmlnLmluIHwgNCArKy0tCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL2ZyZWVzY2FsZS1pbXgvaW14LWdwdS12aXYvQ29uZmlnLmluCj4+IGIvcGFj
a2FnZS9mcmVlc2NhbGUtaW14L2lteC1ncHUtdml2L0NvbmZpZy5pbgo+PiBpbmRleCAzZTA5NWI3
MzBjZi4uYjhkZmY4ZjlhYjYgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvZnJlZXNjYWxlLWlteC9p
bXgtZ3B1LXZpdi9Db25maWcuaW4KPj4gKysrIGIvcGFja2FnZS9mcmVlc2NhbGUtaW14L2lteC1n
cHUtdml2L0NvbmZpZy5pbgo+PiBAQCAtNDUsOCArNDUsOCBAQCBjaG9pY2UKPj4gwqAgwqAgY29u
ZmlnIEJSMl9QQUNLQUdFX0lNWF9HUFVfVklWX09VVFBVVF9GQgo+PiDCoMKgwqDCoMKgIGJvb2wg
IkZyYW1lYnVmZmVyIgo+PiAtwqDCoMKgICMgVGhlIGkuTVg4IGJsb2IgZG9lc24ndCBzdXBwb3J0
IEZCIG91dHB1dAo+PiAtwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX0ZSRUVTQ0FMRV9J
TVhfUExBVEZPUk1fSU1YOE0KPj4gK8KgwqDCoCAjIFRoZSBpLk1YOCBhYXJjaDY0IGJsb2IgZG9l
c24ndCBzdXBwb3J0IEZCIG91dHB1dAo+IAo+IMKgT3IgeW91IGNhbiBzdGlsbCBhZGQgdGhhdCBs
YXRlciBpbiBhIGNvbW1lbnQgaGVyZS4KPiAKPiDCoEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
Cgp0aGFua3MsCkFuZHJlYXMKCj4gCj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCj4+ICvCoMKg
wqAgZGVwZW5kcyBvbiBCUjJfYXJtCj4+IMKgIMKgIGNvbmZpZyBCUjJfUEFDS0FHRV9JTVhfR1BV
X1ZJVl9PVVRQVVRfV0wKPj4gwqDCoMKgwqDCoCBib29sICJXYXlsYW5kIgo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
