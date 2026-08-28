Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80181C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 16:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4962B60609;
	Fri, 28 Aug 2026 16:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GNdzjWpZfvER; Fri, 28 Aug 2026 16:47:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787935645;
	bh=FTmqf+CI8caMUqrZ4QJk9T/drs9UoerSXyql3min1v4=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XtwjJ7u/ev+cG4cBLD0/vlsneuuMKBegqM69T/C83ZAavRN9ILqQwmmArfnwjTAIW
	 d14JBkJlrLIPKHtu2+EwXiDptON33xdyZyLPmKpO/TEyjQ/9L0fL8XU06hb/ULnJRA
	 yMct35urOlhdK6GCWxMak1HiCqiJnaIMnnCAWDU+PdWIZndHplN4KReWUO49rU6gxZ
	 P0TrypeuHtz/BDVzgFIF2n/st3hkbK7Tn7/clulbaNvm6yyZhCpInr7XDs3WT/5jli
	 C4K0wPfcbW19ZUDkU65hPnjlf3vrXu2jezWf5suGj3bs6WH/KSC947Cy6M/1e+yYlf
	 z9hdvTgeXGB4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BC4F60843;
	Fri, 28 Aug 2026 16:47:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D13ED127
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B745140562
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfM1VNzcitLS for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 16:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=theo.lebrun@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B7ED404FF
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id A4D8E1A18AC;
 Fri, 28 Aug 2026 16:47:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 747F260537;
 Fri, 28 Aug 2026 16:47:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1AB111C7843A; 
 Fri, 28 Aug 2026 18:47:13 +0200 (CEST)
Date: Fri, 28 Aug 2026 18:46:49 +0200
MIME-Version: 1.0
Message-Id: <20260828-xdp-tools-tleb-v1-3-463c25b5a99b@bootlin.com>
References: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
In-Reply-To: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Daniel Lang <dalang@gmx.at>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 3/4] package/llvm: add option to build the BPF
 backend in host-llvm
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QSBwYWNrYWdlIHRoYXQgY3Jvc3MtY29tcGlsZXMgQlBGIHByb2dyYW1zIGF0IGJ1aWxkLXRpbWUg
bmVlZHMgYQpob3N0LWNsYW5nIHdpdGggQlBGIGJhY2tlbmQuIFRvZGF5LCBpdCBpcyBvbmx5IHBv
c3NpYmxlIHRocm91Z2ggYQpiZWhhdmlvciB0aGF0IGxvb2tzIGxpa2UgYSBidWc6IGlmIEJSMl9Q
QUNLQUdFX0xMVk1fQlBGPXkgdGhlbgpgTExWTV9UQVJHRVRTX1RPX0JVSUxEICs9IEJQRmAgYW5k
IEhPU1RfTExWTV9DT05GX09QVFMgaW5oZXJpdHMgdGhpcwppbXBsaWNpdGx5IGJlY2F1c2Ugb2Yg
dGhlIGRlZmVycmVkIGV4cGFuc2lvbiBvZiBMTFZNX1RBUkdFVFNfVE9fQlVJTEQuCgpDaGFuZ2Vz
OgooMSkgQlIyX1BBQ0tBR0VfTExWTV9CUEY9eSBkb2VzIG5vdCBpbXBseSBCUEYgYmFja2VuZCBp
biBob3N0LWxsdm0uCigyKSBDcmVhdGUgYSBuZXcgQlIyX1BBQ0tBR0VfSE9TVF9MTFZNX0JQRiBj
b25maWcgZW50cnkuCigzKSBTdXBwb3J0IGJ1aWxkaW5nIGhvc3QtbGx2bSB3aXRoIEJQRiBhcyBz
b2xlIGJhY2tlbmQuCgpBYm91dCAoMyk6IG1ha2Ugc3VyZSBOT1QgdG8gcGFzcyBhbiBlbXB0eSAt
RExMVk1fVEFSR0VUX0FSQ0g9IGVsc2UgbGx2bQpyZWZ1c2VzIGNvbXBpbGF0aW9uLiBUaGUgZmxh
ZyBtdXN0IG5vdCBiZSBwcmVzZW50IGZvciBMTFZNIHRvIGFjY2VwdApidWlsZGluZyB3aXRoIG9u
bHkgdGhlIEJQRiBiYWNrZW5kLgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxl
YnJ1bkBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwogcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9Db25maWcuaW4uaG9zdCB8
IDEwICsrKysrKysrKysKIHBhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayAgICAgICAg
fCAxMiArKysrKysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdl
L0NvbmZpZy5pbi5ob3N0CmluZGV4IDU5NWNhZjllN2YuLjQyNGQzZTBhYzIgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvQ29uZmlnLmluLmhvc3QKKysrIGIvcGFja2FnZS9Db25maWcuaW4uaG9zdApAQCAt
NjMsNiArNjMsNyBAQCBtZW51ICJIb3N0IHV0aWxpdGllcyIKIAlzb3VyY2UgInBhY2thZ2Uva21v
ZC9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2UvbGlicDExL0NvbmZpZy5pbi5ob3N0
IgogCXNvdXJjZSAicGFja2FnZS9sbHZtLXByb2plY3QvbGxkL0NvbmZpZy5pbi5ob3N0IgorCXNv
dXJjZSAicGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2Ug
InBhY2thZ2UvbHBjMzI1MGxvYWRlci9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2Uv
bHR0bmctYmFiZWx0cmFjZS9Db25maWcuaW4uaG9zdCIKIAlzb3VyY2UgInBhY2thZ2UvbHptYS1h
bG9uZS9Db25maWcuaW4uaG9zdCIKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xs
dm0vQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL0NvbmZpZy5pbi5o
b3N0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjdlNzI5NGIyYWQKLS0t
IC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL0NvbmZpZy5pbi5ob3N0
CkBAIC0wLDAgKzEsMTAgQEAKK2NvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0xMVk1fQlBGCisJYm9v
bCAiaG9zdCBsbHZtIEJQRiBiYWNrZW5kIgorCWhlbHAKKwkgIEJ1aWxkIHRoZSBCUEYgYmFja2Vu
ZCBpbiBob3N0LWxsdm0gc28gdGhhdCBob3N0LWNsYW5nIGNhbgorCSAgY29tcGlsZSBlQlBGIG9i
amVjdHMuIFRoaXMgaXMgc3VwcG9ydGVkIGV2ZW4gd2l0aCBCUEYgYXMKKwkgIHNvbGUgYmFja2Vu
ZC4KKworCSAgRW5hYmxpbmcgdGhpcyBvcHRpb24gZG9lcyBub3QgYnVpbGQgaG9zdCBMTFZNIGJ5
IGl0c2VsZjogYQorCSAgcGFja2FnZSBkZXBlbmRpbmcgb24gaG9zdC1jbGFuZyB0cmlnZ2VycyB0
aGUgaG9zdCBMTFZNL2NsYW5nCisJICBidWlsZC4KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGx2bS1w
cm9qZWN0L2xsdm0vbGx2bS5tayBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawpp
bmRleCBmYjU5YWE2NGU4Li5lMTgxNTkxNjZiIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xsdm0tcHJv
amVjdC9sbHZtL2xsdm0ubWsKKysrIGIvcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1r
CkBAIC01MywxNCArNTMsMTYgQEAgTExWTV9UQVJHRVRTX1RPX0JVSUxEID0gUklTQ1YKIGVsc2UK
IExMVk1fVEFSR0VUU19UT19CVUlMRCA9ICQoTExWTV9UQVJHRVRfQVJDSCkKIGVuZGlmCi1IT1NU
X0xMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9UQVJHRVRTX1RPX0JVSUxEPSIkKHN1YnN0ICQoc3Bh
Y2UpLDssJChMTFZNX1RBUkdFVFNfVE9fQlVJTEQpKSIKIExMVk1fQ09ORl9PUFRTICs9IC1ETExW
TV9UQVJHRVRTX1RPX0JVSUxEPSIkKHN1YnN0ICQoc3BhY2UpLDssJChMTFZNX1RBUkdFVFNfVE9f
QlVJTEQpKSIKIAogIyBMTFZNIHRhcmdldCB0byB1c2UgZm9yIG5hdGl2ZSBjb2RlIGdlbmVyYXRp
b24uIFRoaXMgaXMgcmVxdWlyZWQgZm9yIEpJVCBnZW5lcmF0aW9uLgogIyBJdCBtdXN0IGJlIHNl
dCB0byBMTFZNX1RBUkdFVF9BUkNIIGZvciBob3N0IGFuZCB0YXJnZXQsIG90aGVyd2lzZSB3ZSBn
ZXQKICMgIk5vIGF2YWlsYWJsZSB0YXJnZXRzIGFyZSBjb21wYXRpYmxlIGZvciB0aGlzIHRyaXBs
ZSIgd2l0aCBsbHZtcGlwZSB3aGVuIGhvc3QKICMgYW5kIHRhcmdldCBhcmNoaXRlY3R1cmVzIGFy
ZSBkaWZmZXJlbnQuCisjIGhvc3QtbGx2bSB3aXRoIExMVk1fVEFSR0VUX0FSQ0ggZW1wdHkgaXMg
c3VwcG9ydGVkIHRvIGdldCBvbmx5IHRoZSBCUEYgYmFja2VuZC4KK2lmbmVxICgkKExMVk1fVEFS
R0VUX0FSQ0gpLCkKIEhPU1RfTExWTV9DT05GX09QVFMgKz0gLURMTFZNX1RBUkdFVF9BUkNIPSQo
TExWTV9UQVJHRVRfQVJDSCkKK2VuZGlmCiBMTFZNX0NPTkZfT1BUUyArPSAtRExMVk1fVEFSR0VU
X0FSQ0g9JChMTFZNX1RBUkdFVF9BUkNIKQogCiAjIEJ1aWxkIEFNREdQVSBiYWNrZW5kCkBAIC03
Miw2ICs3NCwxNCBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX0xMVk1fQU1ER1BVKSx5KQogTExWTV9U
QVJHRVRTX1RPX0JVSUxEICs9IEFNREdQVQogZW5kaWYKIAorIyBIb3N0IExMVk0gdGFyZ2V0cy4g
U25hcHNob3QgdGhlIHRhcmdldCBsaXN0IGhlcmUgYW5kIGlnbm9yZQorIyB3aGF0J3MgY29taW5n
IGFmdGVyIChCUEYgaWYgQlIyX1BBQ0tBR0VfTExWTV9CUEYpLgorSE9TVF9MTFZNX1RBUkdFVFNf
VE9fQlVJTEQgOj0gJChMTFZNX1RBUkdFVFNfVE9fQlVJTEQpCitpZmVxICgkKEJSMl9QQUNLQUdF
X0hPU1RfTExWTV9CUEYpLHkpCitIT1NUX0xMVk1fVEFSR0VUU19UT19CVUlMRCArPSBCUEYKK2Vu
ZGlmCitIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1ETExWTV9UQVJHRVRTX1RPX0JVSUxEPSIkKHN1
YnN0ICQoc3BhY2UpLDssJChIT1NUX0xMVk1fVEFSR0VUU19UT19CVUlMRCkpIgorCiAjIEJ1aWxk
IEJQRiBiYWNrZW5kCiBpZmVxICgkKEJSMl9QQUNLQUdFX0xMVk1fQlBGKSx5KQogTExWTV9UQVJH
RVRTX1RPX0JVSUxEICs9IEJQRgoKLS0gCjIuNTUuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
