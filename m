Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E3ACA5FFE
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CB59608A3;
	Tue,  6 Oct 2026 16:39:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bYdWuZIDZvHu; Tue,  6 Oct 2026 16:39:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2B7966085F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304762;
	b=LYlSqx7aJVuIZf5ZPuVHKR8iNFfXLBmxG6jKXvkho5gS+HEPkXhNQWGXCtS29LFGXR4X
	 R8cgQgmGZS+Wr5zruHJT463tsbsFiULqpRSw0tY60aXGRcgSyqDAXz6ILlOmRU6GOpKHI
	 pI+WqwExkb94xR0wqz4khYlk5s9a37hFbKDVg35Ny+SDP/k/7YyRxcGiqSPYpN2kge1ia
	 3CuV+I6epOHJC14YaWsimppHYLqbPsHN4IsflqQVYl8oEGbkbp7pQm6bwJILqV2lp4j2B
	 VDZs+gTiWbG6EH9CnEIQDyPz8ZkXRgpdVC4/taI9zVRI54llFZu1Au80TS0yiFK5jng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304762;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=nCY3xplOoZIV11KF3hc/PcEaecilnqta473ShnVR3xA=;
	b=qJH0MB6vEmAA/MCakY1O5gLwE7tMieMOJ/HH3gia1u1HEO/x1zyUT25kW4XVUKUVuo2N
	 YX3FKHAei8784ubJ+FZ044zQexUwDDEJAL5Z1S6x7riKkUCNQEvQZOQErBkn/yo43xy7U
	 U9BG02slkEWbbFRZ5DPIrrt5Jg8RFWsGyrQI717XLkjauHw+pP/SwYbhe2tKBHUjyo7EF
	 QTqMnDH11LWhFBhMIGcGYoDi4VK4SNPhIqxZGtS+zk0QnY6xnamejLNe7H2x6ZBZ2TY9I
	 XKec7SV3Q4au3zWkpoqgnePd2eDjEH3kccOkvakkhS0K7cXXYI4xDhjc473oytbEv9Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=SlYauSHy;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304762;
	bh=nCY3xplOoZIV11KF3hc/PcEaecilnqta473ShnVR3xA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gz9EQ5i/wjWZvC2EAmsQQbw2ALDay6csuXnkkhysfE/YUabDsoVUrub4cjPTvOtVU
	 Cy2hNKiD2s138MsiQHswpJzUyc8R57dGZrt8gatv4/jw5SoRSbYUs+tnM+ubqU6q9o
	 b6bT+XDDgBpIhg7r8vCt+g/Ab/CPjH4yV36o15rIJQlmJHWmELwhdXIY37G8X9Z3gz
	 iewZrzgQ36zk/OppArPzDoJ6cFKq1s9Mu+g18uRDjTodvvSahaCKZBxZjNBTaWOVIx
	 pBQDPPu+yQFhAcddmRKmisunOP0nZqDzjuecNEO3N9Y+aymyfghde98FX7DBHN9F/g
	 WpOJH955BujBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B7966085F;
	Tue,  6 Oct 2026 16:39:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B8E134E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0207C608A3
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qmy_ktzhJ9UB for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:35:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 00AA160809
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304515;
 b=XPbMP++2xfesct9lPoLUe/Zc0VJTKNsAQWYL2+cqx/oblIHo7V5cQIYsKKo3vkv3QbBo
 4pTtanUvF6sD/6eMnUzi+ZyK58U/FnPt9oqUw7siuk1J0JMmFqstLxrOkDUrcDEb1sa0/
 oljQIhngiUApoRNy3rBrUitTKUsLZesmw8h4/GExQrc3P7fXAMWE2TnTLFc0I/jH9loBs
 fWm5xr5SYNvkiUdEG0GnrRmVzE8e8sdlW88YMmm0XEl+h/lnA+sbyjx1bzUK2tH1gmR3N
 4Lu/eAAtlR9dBDGumBbPqng/6BGYFYOwih15bqrZ8pHwdN/Quv4xu673O3RDeM+DN4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304515;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=yVQ+onS4gj9l2uv3FKdYCIH3khQZGY2Ct8LBO1mQUbg=;
 b=TXuWu/4PMfyzJLPmB2XlpExxk0gJSYIQ5kx81mG8ljIdBMfdLLBQCyKfyat8Gm3q9/AJ
 tsPyzPSuLh13zAQo6WL95q5td7iq7q6ecFsFjIQXiVMMTt3rgH/RtuBAVNGU6H8yXSu25
 0op2PmKiVQmzENTvO2LBT/gLSPm7hnXg5dnwtBTkjCPxNP5Igjc99SnmCBetPRYf9jQDv
 hhJwpAQmAohIjRMmDrQaJk5nAtD/I8BzYC2Qsa9G3qGGFhNnC/wGtRUBV4cMKz/cSMSJn
 eKTDriSecL08WP8CiaLn6sQpv3pnrJM/44a2PNjTML5simedSkg3vfWJxnc9g3/kIAQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=SlYauSHy; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=SlYauSHy
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00AA160809
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303711;
 bh=yVQ+onS4gj9l2uv3FKdYCIH3khQZGY2Ct8LBO1mQUbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SlYauSHyCVTNeJDOMQG2E9V2UeiBdhnGW+zb2MpQqodQfsTnCcMBOV4fluoRkvEY1
 sD8ZWiWRweIQkitb20VjCIT/QhtkCYi+0gTmdCLCPjwEr6ig2To1lfdxhj06/uSj21
 VjfG+rMl5k7OdzdDdD7nZY2NxDzPY5gVOZzxJZ+WIBpgPBedbKYFp3Ad0VskrgEvwL
 NKtogIKmzjB6alYGZRdAiqYhbx7YnmFAsj2BCyRHh7Nr6xXjds1/uPexSlxPw4kTYM
 KhhSTlXEFUuaIw8erN8Qw+fZkcfPc20GlELxU07T0ZWxZrBJ8IdpNgIUiey/5MvPYR
 /fvEL+9LSLDuQ==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 a++pt7G4ffwSH365GEcUvVYU35kQjFBo424XMBInd4ivGa4nhWd1PlrJZrDOWGvinl9Ou1qw62x
 ZWN96ZO7CfBu6ZwVOQRvCrqZNg9aLCl1rAcI6I9RB68EXLtGEs6u6MHqL4C5/nHV/E1cfD7WjiN
 0U8FKMpKZ8xN+4M4EbYvHMCF15Oab/Qemi4wSeDa7sOV13XglJd42GuAxWvA3PpO5EHMbKRTnnE
 +JyxK62ko692EJNp+EDbxis15tx8bfvasifq62sKDj2M8ulp1krg4JhRe0pogbzrVC0PnmQD2lQ
 R62mjCdyaSzL/qiUlijCBe3lHIKkS24YP8Mli2qr7Z/2navxKRz39L2Bmo9hbpQGzEXiMJaJSiM
 U4ys8Axh18sL2G2EO3fJnq4YYKGrEimxifDLwyJieKWYQmpWhpCQGqT/gAzMVC9iIcA31Bc5qzw
 V9XGt33PU20VGF032Q9G+rQle+yCUsX46B1niRSXOwP7QnvnaGtghsDtMxTsM6GoK1eOhraX+fM
 yOii45+V4cjcKLAQj8VcU42/rqShqvsZYVjk1QXusiaN+K34c3x3Z8jFMN/7M5Abb9hwnKKL5yu
 6gK8w5PoURRagdlMVBSAREgDSntrTRlC1g==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D3EEAA4C554C;
 Tue,  6 Oct 2026 18:21:51 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7um-000000000ir-2F2K;
 Tue, 06 Oct 2026 16:21:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andrey Yurovsky <yurovsky@gmail.com>, Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue,  6 Oct 2026 18:20:25 +0200
Message-ID: <20261006162106.3439373-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH v8 44/84] package/rauc: Fix build with OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KQ2M6IEFuZHJleSBZ
dXJvdnNreSA8eXVyb3Zza3lAZ21haWwuY29tPgpDYzogSGVpa28gVGhpZXJ5IDxoZWlrby50aGll
cnlAZ21haWwuY29tPgotLS0KIC4uLk4xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5H
Xy5wYXRjaCB8IDQ4ICsrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA0OCBpbnNl
cnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9yYXVjLzAwMDEtc2lnbmF0dXJl
LXVzZS1BU04xX1NUUklOR19nZXQwX2RhdGEtYW5kLUFTTjFfU1RSSU5HXy5wYXRjaAoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvcmF1Yy8wMDAxLXNpZ25hdHVyZS11c2UtQVNOMV9TVFJJTkdfZ2V0MF9k
YXRhLWFuZC1BU04xX1NUUklOR18ucGF0Y2ggYi9wYWNrYWdlL3JhdWMvMDAwMS1zaWduYXR1cmUt
dXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNoCm5ldyBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmJhODAzMmM2ZTcKLS0tIC9kZXYvbnVsbAor
KysgYi9wYWNrYWdlL3JhdWMvMDAwMS1zaWduYXR1cmUtdXNlLUFTTjFfU1RSSU5HX2dldDBfZGF0
YS1hbmQtQVNOMV9TVFJJTkdfLnBhdGNoCkBAIC0wLDAgKzEsNDggQEAKK0Zyb20gMTAxYWFjYWY4
MmQyNTBiZmI4ZTU4MWUwMDJiMmMzODA4NjkwODBlZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb206IEJydW5vIFRob21zZW4gPGJydW5vLnRob21zZW5AZ21haWwuY29tPgorRGF0ZTogU2F0
LCAxMSBBcHIgMjAyNiAxNzowNjoxMCArMDIwMAorU3ViamVjdDogW1BBVENIXSBzaWduYXR1cmU6
IHVzZSBBU04xX1NUUklOR19nZXQwX2RhdGEgYW5kIEFTTjFfU1RSSU5HX2xlbmd0aAorTUlNRS1W
ZXJzaW9uOiAxLjAKK0NvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29u
dGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAorCitVc2UgQVNOMV9TVFJJTkdfZ2V0MF9kYXRh
KCkgYW5kIEFTTjFfU1RSSU5HX2xlbmd0aCgpIGZ1bmN0aW9ucworYWxsb3cgYW4gQVNOMV9TVFJJ
Tkcgc3RydWN0dXJlIHRvIGJlIG1hbmlwdWxhdGVkLiBBdm9pZCBlcnJvcnMKK2xpa2UgdGhpcyB3
aGVuIGNvbXBpbGluZyBhZ2FpbnN0IE9wZW5TU0wgNC4wOgorCitlcnJvcjogaW52YWxpZCB1c2Ug
b2YgaW5jb21wbGV0ZSB0eXBlZGVmIOKAmEFTTjFfT0NURVRfU1RSSU5H4oCZIHtha2Eg4oCYc3Ry
dWN0IGFzbjFfc3RyaW5nX3N04oCZfQorCitTaWduZWQtb2ZmLWJ5OiBCcnVubyBUaG9tc2VuIDxi
cnVuby50aG9tc2VuQGdtYWlsLmNvbT4KKworVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNvbS9y
YXVjL3JhdWMvY29tbWl0LzEwMWFhY2FmODJkMjUwYmZiOGU1ODFlMDAyYjJjMzgwODY5MDgwZWYK
KworU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KKy0tLQorIHNy
Yy9zaWduYXR1cmUuYyB8IDQgKystLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCisKK2RpZmYgLS1naXQgYS9zcmMvc2lnbmF0dXJlLmMgYi9zcmMvc2ln
bmF0dXJlLmMKK2luZGV4IGQyYWNhYzZiLi45MWJlN2JiNyAxMDA2NDQKKy0tLSBhL3NyYy9zaWdu
YXR1cmUuYworKysrIGIvc3JjL3NpZ25hdHVyZS5jCitAQCAtMTM0NCw3ICsxMzQ0LDcgQEAgZ2Jv
b2xlYW4gY21zX2dldF91bnZlcmlmaWVkX21hbmlmZXN0KEdCeXRlcyAqc2lnLCBHQnl0ZXMgKipt
YW5pZmVzdCwgR0Vycm9yICoqZXIKKyAJCQkJIm1pc3NpbmcgbWFuaWZlc3QgaW4gaW5saW5lIHNp
Z25hdHVyZSIpOworIAkJZ290byBvdXQ7CisgCX0KKy0JaWYgKCEoKmNvbnRlbnQpLT5kYXRhIHx8
ICgoKmNvbnRlbnQpLT5sZW5ndGggPD0gMCkpIHsKKysJaWYgKChBU04xX1NUUklOR19nZXQwX2Rh
dGEoKmNvbnRlbnQpID09IE5VTEwpIHx8IChBU04xX1NUUklOR19sZW5ndGgoKmNvbnRlbnQpIDw9
IDApKSB7CisgCQlnX3NldF9lcnJvcigKKyAJCQkJZXJyb3IsCisgCQkJCVJfU0lHTkFUVVJFX0VS
Uk9SLAorQEAgLTEzNTMsNyArMTM1Myw3IEBAIGdib29sZWFuIGNtc19nZXRfdW52ZXJpZmllZF9t
YW5pZmVzdChHQnl0ZXMgKnNpZywgR0J5dGVzICoqbWFuaWZlc3QsIEdFcnJvciAqKmVyCisgCQln
b3RvIG91dDsKKyAJfQorIAorLQl0bXAgPSBnX2J5dGVzX25ldygoKmNvbnRlbnQpLT5kYXRhLCAo
KmNvbnRlbnQpLT5sZW5ndGgpOworKwl0bXAgPSBnX2J5dGVzX25ldyhBU04xX1NUUklOR19nZXQw
X2RhdGEoKmNvbnRlbnQpLCBBU04xX1NUUklOR19sZW5ndGgoKmNvbnRlbnQpKTsKKyAJaWYgKCF0
bXApIHsKKyAJCWdfc2V0X2Vycm9yX2xpdGVyYWwoCisgCQkJCWVycm9yLAorLS0gCisyLjQ3LjMK
KwotLSAKMi40Ny4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
