Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEA4C433F5
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 00:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8445D41D6B;
	Thu, 26 May 2022 00:38:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNbD8AMkIzlq; Thu, 26 May 2022 00:38:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4362541D58;
	Thu, 26 May 2022 00:38:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 270FE1BF9AD
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 00:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 151EB844BE
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 00:38:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=iki.fi
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7cMEyF7Uay-u for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 00:38:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C355B844A4
 for <buildroot@buildroot.org>; Thu, 26 May 2022 00:38:53 +0000 (UTC)
Received: from localhost (91-154-92-55.elisa-laajakaista.fi [91.154.92.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: sakkinen)
 by meesny.iki.fi (Postfix) with ESMTPSA id 5B123200E5;
 Thu, 26 May 2022 03:38:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
 t=1653525525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJdzEdKofNUrxaS4sMclJKOisIikGSzUpSuTKfkGiYg=;
 b=E1J/QUYPhibUkykg2DJKCiV3EdEIn7v0lJiaKN9zSf9fhtLy6XswkKSA2e47hk8dandtWy
 rw804V7oPeeqMT92NXRNlkgJGo+Tas+gekqL4s7ClSRU5s8Q2sWUZz2knMpdb3QJxaxt3R
 DfxwviVgh6LZtB2cD36JblR08ZwZ35I=
Message-ID: <2c42570b01b2b51cc33d6623b25a736e4f20c601.camel@iki.fi>
From: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Thu, 26 May 2022 03:37:04 +0300
In-Reply-To: <20220525070737.GB301044@scaer>
References: <20220524170541.93208-1-jarkko.sakkinen@iki.fi>
 <20220525070737.GB301044@scaer>
User-Agent: Evolution 3.44.1 
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
 s=meesny; t=1653525525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJdzEdKofNUrxaS4sMclJKOisIikGSzUpSuTKfkGiYg=;
 b=S8ORWWjGWWT8YCmJmeDeXzvFG56QV1TThNWTv+3jxV3GaWilwuG1bmCdl/MK0k7bEtsvke
 gLVgqHa33HAzpuBhIitGH3j/ej1SyBAu+xYcxjvGSyVmBCkIZ3fcNIFvrtkcRFr03UrlVs
 ff3L/mSSvC1lC9bC1kHe1TWHfGau+44=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1653525525; a=rsa-sha256; cv=none;
 b=EeRWpcB7LvME3nJaG5aNWdRX1RCGT98aCxTyCVtQK0SeuQQQUE0j/vuI6cV0DKbNlFq1b9
 ij6BW8GWOEk6EMlXlypcEWbm4iEimDS63EziEaPUXr/fC0pJiZHPl3LPbnuy1P2yNtDF+F
 CBE7y/CbqJkWLVW1QrILtjAn0hzTAzs=
Subject: Re: [Buildroot] [PATCH v2] package/linux-tools: openssl dependency
 for x86_64 selftests
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
Cc: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAyMDIyLTA1LTI1IGF0IDA5OjA3ICswMjAwLCBZYW5uIEUuIE1PUklOIHdyb3RlOgo+
IEphcmtrbywgQWxsLAo+IAo+IE9uIDIwMjItMDUtMjQgMjA6MDUgKzAzMDAsIEphcmtrbyBTYWtr
aW5lbiBzcGFrZSB0aHVzbHk6Cj4gPiBPbiB4ODZfNjQsIGxpYnNzbCBpcyBhIGRlcGVuZGVuY3kg
Zm9yIGtzZWxmdGVzdHMuIHNlbGZ0ZXN0cy9zZ3ggZGVwZW5kcyBvbgo+ID4gaXQuwqAgVGh1cywg
c2VsZWN0IGl0IGluICJDb25maWcuaW4iLCBhbmQgYWRkIGl0IGFzIGEgYnVpbGQgZGVwZW5kZW5j
eSBpbgo+ID4gImxpbnV4LXRvb2wtc2VsZnRlc3RzLm1rLmluIi4KPiA+IAo+ID4gTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzIwMjIwNTE3MjI0ODA5LjIxZjc3OTQ5QGdt
eC5uZXQvCj4gPiBTdWdnZXN0ZWQtYnk6IFBldGVyIFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5l
dD4KPiA+IFNpZ25lZC1vZmYtYnk6IEphcmtrbyBTYWtraW5lbiA8amFya2tvLnNha2tpbmVuQGlr
aS5maT4KPiA+IC0tLQo+ID4gdjI6Cj4gPiBDb25maWcuaW46IEJSMl9QQUNLQUdFX0xJQk9QRU5T
U0wgPT4gQlIyX1BBQ0tBR0VfT1BFTlNTTAo+ID4gLS0tCj4gPiDCoHBhY2thZ2UvbGludXgtdG9v
bHMvQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDEgKwo+ID4g
wqBwYWNrYWdlL2xpbnV4LXRvb2xzL2xpbnV4LXRvb2wtc2VsZnRlc3RzLm1rLmluIHwgMyArKysK
PiA+IMKgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbGludXgtdG9vbHMvQ29uZmlnLmluIGIvcGFja2FnZS9saW51eC10b29scy9D
b25maWcuaW4KPiA+IGluZGV4IDc5MWYyYzA4NWMuLjYyMTdmY2ZiN2EgMTAwNjQ0Cj4gPiAtLS0g
YS9wYWNrYWdlL2xpbnV4LXRvb2xzL0NvbmZpZy5pbgo+ID4gKysrIGIvcGFja2FnZS9saW51eC10
b29scy9Db25maWcuaW4KPiA+IEBAIC05OCw2ICs5OCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9M
SU5VWF9UT09MU19TRUxGVEVTVFMKPiA+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgQlIyX1BBQ0tB
R0VfTElCQ0FQX05HCj4gPiDCoMKgwqDCoMKgwqDCoMKgc2VsZWN0IEJSMl9QQUNLQUdFX1VUSUxf
TElOVVgKPiA+IMKgwqDCoMKgwqDCoMKgwqBzZWxlY3QgQlIyX1BBQ0tBR0VfVVRJTF9MSU5VWF9T
Q0hFRFVUSUxTICMgcnVudGltZSAodGFza3NldCkKPiA+ICvCoMKgwqDCoMKgwqDCoHNlbGVjdCBC
UjJfUEFDS0FHRV9PUEVOU1NMIGlmIEJSMl94ODZfNjQKPiA+IMKgwqDCoMKgwqDCoMKgwqBoZWxw
Cj4gPiDCoMKgwqDCoMKgwqDCoMKgwqAgQnVpbGQgYW5kIGluc3RhbGwgKHRvIC91c3IvbGliL2tz
ZWxmdGVzdHMpIGtlcm5lbCBzZWxmdGVzdHMuCj4gPiDCoAo+ID4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGludXgtdG9vbHMvbGludXgtdG9vbC1zZWxmdGVzdHMubWsuaW4gYi9wYWNrYWdlL2xpbnV4
LXRvb2xzL2xpbnV4LXRvb2wtc2VsZnRlc3RzLm1rLmluCj4gPiBpbmRleCBiODI0YzExYmQ2Li4w
NjE1OGU2MTQ3IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29s
LXNlbGZ0ZXN0cy5tay5pbgo+ID4gKysrIGIvcGFja2FnZS9saW51eC10b29scy9saW51eC10b29s
LXNlbGZ0ZXN0cy5tay5pbgo+ID4gQEAgLTE3LDYgKzE3LDkgQEAgZW5kaWYKPiA+IMKgZW5kaWYK
PiA+IMKgCj4gPiDCoFNFTEZURVNUU19ERVBFTkRFTkNJRVMgPSBsaWJjYXAtbmcgcG9wdAo+ID4g
K2lmZXEgKCQoTk9STUFMSVpFRF9BUkNIKSx4ODZfNjQpCj4gPiArU0VMRlRFU1RTX0RFUEVOREVO
Q0lFUyArPSBvcGVuc3NsCj4gPiArZW5kaWYKPiAKPiBJJ3ZlIGNoYW5nZWQgdGhzIGNvZGl0aW9u
IHRvIGJlIGluIHRoZSBwYWNrYWdlIGJlaW5nIGFjdHVhbGx5IGVuYWJsZWQsCj4gc28gdGhhdCB0
aGUgcmVhbCBjb25mZGl0aW9uIHRvIHJlcXVpcmUgb3BlbnNzbCBpcyBvbmx5IGhhbmRsZWQgaW4K
PiBDb25maWcuaW4gKG9yIHdlJ2QgaGF2ZSB0byBzeW5jIHRoZSB0d28gZXZlcnl0aW1lIGEgbmV3
IGFyY2ggbmVlZHMKPiBvcGVuc3NsLi4uKQo+IAo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3Mu
CgpUaGFuayB5b3UsIGFwcHJlY2lhdGUgaXQhCgpKdXN0IGZvciB0aGUgcmVjb3JkLCB0aGVyZSdz
IGFsc28gYSBidWcgaW4gdGhlIHNlbGZ0ZXN0IGl0c2VsZgpwcmV2ZW50aW5nIHBhY2thZ2luZyBp
dDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXNneC8yMDIyMDUyMzE4MTEyMC41NDU0
Ny0xLWphcmtrb0BrZXJuZWwub3JnL1QvI3UKCkJSLCBKYXJra28KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
