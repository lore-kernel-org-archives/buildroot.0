Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA5BFC9EE0
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 09:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FE6841D4;
	Sat,  7 Mar 2026 09:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lb4hE1KWA-e8; Sat,  7 Mar 2026 09:20:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 911A7841D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772875210;
	bh=TiJiqLGenHbHWtlP9L4wtE8MJahl0K1FBmdZyCkHwoA=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gzfDLwQXO1SL/40KpAqq/In7iPnt/ZGmdE8bd7Nq1nnMGZGurKpKvQOSEnqtrjWBS
	 tIMZYcukfv4BGa/8lSQ2kovmrlf+oHKeS6vjM7OF8HkaZW9AWC0LkMznxLz+QSHWzU
	 AMamxN7MwZTEExkUwK8qvn2bzmWEdeKVHoWNaJ0Un3jmK9LvmgfHNQPlodJ62kljN8
	 bGbgNZQVl9IILsnI8eiR0XyHEBfN/tYJ/4/7TISQBl635soJ2CyE03P8rkgUHvGrDm
	 NDjI/ayOxbue0g60xV9JFX+daTqpbjCkMJ/NJ2jHcIKmsBfst3aV5CiQIHt6fCicJL
	 qXQ6xZwnYQjjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 911A7841D3;
	Sat,  7 Mar 2026 09:20:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 79364169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F084614D7
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PvNKMCxjP_jI for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 09:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=81.169.146.220;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4EC5B614D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EC5B614D3
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4EC5B614D3
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 09:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1772875203; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Owjvl5+j1ucOgJEX3ZHlh/lMqy2r8rwHb/W8yuB4/XJJQWd0TGdScimfDoHUzkzu6C
 pnTvG8esAQ4wikPWCYu5lg1QBkQAUJpWBiOByr0nI9ZUEXLstHCnVaeoKeA+Sh63P681
 a+9oOzbNstSsG5nuLFHTXzWBYUz7cNKTthDGSNVP3ZoUGUUBN3xwhI0Gl88m/SB+VtBD
 WZ/ifORkLUInyVGpg8LoasPE1t0fxVpPV+bDJj6T4anWhfOpwWesTpNt+cdTq5M5jiNp
 UdxWV/0Tpfe+W6isDE+jXZF0Fv7oVYbtewZ02FAMcbg4dyLqJO19/HzEH2/uOk3slLPJ
 4XNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1772875203;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:From:Cc:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=0CRmIXN8Wac9O5EcWSCti79QDEVxQptbGLKykNARThY=;
 b=KRFTuenMHoaBC4tA6izujQHuowyG2j9Hrco1d03+sSkCFWABkmqwhB7+GS6bfkztA+
 e9E9S1Ohbz6YaYTL58hVqtX+Otr/kdcZEAeKAZSLpOPPbQwUvDp4O0gcRshZZn0V1vcW
 B5TACs2PQcDq0gH1icUSIXVBcKV+Ks6U/vqhZ/+VaVKpoTpfqWF3IuGaxJnVc7wrvk/5
 /R5zCOMKqWvemBEfuRpxznxgQP6RfZgFHLpkZKR25OnCQPcrSHZFT8qh204/zcofer72
 nTukctWEspzq9dInSshu1hv0aNkkRI0puO++OGkdTVooWJ420gryISkkeaY/rljlQMLh
 XLpA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBFXdk5Zv9blcw/Guou9tnmlcuyclnQ6pHMsZWvPcEvWLWs3baZcP/M="
Received: from [IPV6:2a02:8429:5895:8b01:fdf3:94db:3207:8189]
 by smtp.strato.de (RZmta 55.0.1 AUTH) with ESMTPSA id J78e912279K2Vgt
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 7 Mar 2026 10:20:02 +0100 (CET)
Message-ID: <ba40a668-59a4-42bc-ba22-de44ea9ace53@outer-limits.org>
Date: Sat, 7 Mar 2026 10:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: bernd@kuhls.net
References: <20260122161116.885373-1-julian@outer-limits.org>
 <85c4070c-551a-4586-80b1-0f43b454ec69@outer-limits.org>
Content-Language: en-US
Cc: buildroot@buildroot.org
In-Reply-To: <85c4070c-551a-4586-80b1-0f43b454ec69@outer-limits.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1772875203; 
 s=strato-dkim-0002; d=outer-limits.org;
 h=In-Reply-To:From:Cc:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=0CRmIXN8Wac9O5EcWSCti79QDEVxQptbGLKykNARThY=;
 b=RgijMjpJoY0puHfv/zt8HMqfZ+C+B15Cv+PcQQRZvezlGJyff6K90Rly/mEhKeEiDj
 P4+6Ec1fWVZ36FMg/CiOSruxUKlHmRVj+OTNUKh7xKNrHcJrDpnSRPjj1FbSAuCToxHn
 p2YKQHzpwi4P5lYFwPKnhWOKrG/OCHBX16IeZhpW8H1SWueoFPT/d6jSY998+ccmoSVK
 Ow5v4whTVhLbROIwUDlgQiKL7/3FyhImHsAzPBWqjVez0mz+BP/xJV/wxdVauGAbQD9+
 teBAY+TnxfXC/ps+uJnfk7NECr4JFIRmv8TI1ktINMf9aOESHzv8nn+OFEo8zg41X/P1
 LSgA==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1772875203; 
 s=strato-dkim-0003; d=outer-limits.org;
 h=In-Reply-To:From:Cc:References:To:Subject:Date:Message-ID:Cc:Date:
 From:Subject:Sender;
 bh=0CRmIXN8Wac9O5EcWSCti79QDEVxQptbGLKykNARThY=;
 b=mC2y3vDmZaO60JJLbPxuA777jkMOJiclHP/Jjp0oPxrobfKHsGMVvCySfyjtpMOH8s
 dNGU8D/TlKMUbVKUEsCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=outer-limits.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=outer-limits.org
 header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002
 header.b=RgijMjpJ; 
 dkim=pass header.d=outer-limits.org header.i=@outer-limits.org
 header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=mC2y3vDm
Subject: Re: [Buildroot] [PATCH] package/php: Add parth to ca-cert
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
From: Julian Vetter via buildroot <buildroot@buildroot.org>
Reply-To: Julian Vetter <julian@outer-limits.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2VudGxlIHBpbmcuIElzIHRoaXMgcGF0Y2ggb2YgaW50ZXJlc3Q/CgpPbiAyLzE2LzI2IDEwOjI5
LCBKdWxpYW4gVmV0dGVyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gCj4gCj4gT24gMS8yMi8yNiA1
OjExIFBNLCBKdWxpYW4gVmV0dGVyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4+IElmIEJSMl9QQUNL
QUdFX0NBX0NFUlRJRklDQVRFUyBpcyBwcmVzZW50LCBhZGQgdGhlIGNhLWNlcnRpZmljYXRlcy5j
cnQKPj4gdG8gdGhlIHBocC5pbmksIHRvIG5vdCBnZXQgU1NMIGVycm9ycyB3aGVuIHVzaW5nIFBI
UC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVsaWFuIFZldHRlciA8anVsaWFuQG91dGVyLWxpbWl0
cy5vcmc+Cj4+IC0tLQo+PiDCoCBwYWNrYWdlL3BocC9waHAubWsgfCA4ICsrKysrKysrCj4+IMKg
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcGhwL3BocC5tayBiL3BhY2thZ2UvcGhwL3BocC5tawo+PiBpbmRleCAyYzkxZWY3YjYzLi4z
Yzc5YWU0NTg5IDEwMDY0NAo+PiAtLS0gYS9wYWNrYWdlL3BocC9waHAubWsKPj4gKysrIGIvcGFj
a2FnZS9waHAvcGhwLm1rCj4+IEBAIC0zNjIsNiArMzYyLDE0IEBAIGVuZGVmCj4+IMKgIFBIUF9Q
T1NUX0lOU1RBTExfVEFSR0VUX0hPT0tTICs9IFBIUF9JTlNUQUxMX0ZJWFVQCj4+ICtpZmVxICgk
KEJSMl9QQUNLQUdFX0NBX0NFUlRJRklDQVRFUykseSkKPj4gK2RlZmluZSBQSFBfQ0VSVElGSUNB
VEVTX0ZJWFVQCj4+ICskKFNFRCkgJ3MlO29wZW5zc2wuY2FmaWxlPSVvcGVuc3NsLmNhZmlsZT0v
ZXRjL3NzbC9jZXJ0cy9jYS0gCj4+IGNlcnRpZmljYXRlcy5jcnQlJyBcCj4+ICvCoMKgwqDCoMKg
wqDCoCAkKFRBUkdFVF9ESVIpL2V0Yy9waHAuaW5pCj4+ICtlbmRlZgo+PiArUEhQX1BPU1RfSU5T
VEFMTF9UQVJHRVRfSE9PS1MgKz0gUEhQX0NFUlRJRklDQVRFU19GSVhVUAo+PiArZW5kaWYKPj4g
Kwo+PiDCoCBQSFBfQ09ORl9FTlYgKz0gQ0ZMQUdTPSIkKFBIUF9DRkxBR1MpIiBDWFhGTEFHUz0i
JChQSFBfQ1hYRkxBR1MpIgo+PiDCoCBIT1NUX1BIUF9DT05GX09QVFMgPSBcCj4gCj4gSGVsbG8s
Cj4gSSBtaWdodCBoYXZlIGZvcmdvdHRlbiB0byBhZGQgeW91IEJlcm5kLiBJIHRoaW5rIEkgaGF2
ZSBqdXN0IHNlbnQgaXQgdG8gCj4gdGhlIG1haWxpbmdsaXN0Lgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
