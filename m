Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15835C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 12:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A751940953;
	Mon,  2 Jun 2025 12:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvl652rsAhqV; Mon,  2 Jun 2025 12:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4715406FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4715406FA;
	Mon,  2 Jun 2025 12:44:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F8F127
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CF7E406FA
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADqBfy8VN29U for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 12:44:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 064F0406D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 064F0406D5
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 064F0406D5
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 12:44:47 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ad93ff9f714so807424266b.2
 for <buildroot@buildroot.org>; Mon, 02 Jun 2025 05:44:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748868285; x=1749473085;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vWDA2Bme0QLmY2Xtg1MP7uBqvzShYnIDuLWTQPlThjM=;
 b=tlV3NL9ORq9DoErWwo0x+7AuoWn/oxjdDuzdBrkJuk3D6vKmtStvq0ZV4iU/qGFgag
 fOqMxFewFVGQp3OV+VwX777vXSEdXjDXJNaS6JKfezJ6lr72V5DJSEZHhZqVhb5wqi6m
 FJ6STgaEK3TL30SQJ4yqkRoW63aXLolwuGDrmtWUdMkJvMpENL5zjhhffFKRj5EcwCAf
 E6V7i9PcEX3fY69gQoZ/lipIyqPNLC6Fake3VeIkJazm1/UNldvtE2xRuy8q4MrYPOwJ
 aL3Qiyu548p5vDNyj00OWSqqhyRVeJdTuweoD2x1hvGKbl3gFxBk5Ftgn7iuGRLN7scr
 WpAg==
X-Gm-Message-State: AOJu0YxQlt4eNBn/bu3uJXsVz2Kg0udoDda5B9vodBvd3rR0+UTuFRcC
 nn23C2buH6LoVC6Mis4+306rHjS/dTiseEPwJMBo/D+ssOvqmTTrniXnraEXfeCQkyceGKdNhPm
 6/vwqDRE=
X-Gm-Gg: ASbGncu0Wr0Pb48wyaDkPpEQ9NFVsjCPU7rihIcQJCUVVQYweUGMkt2Ml8y6U+qewe6
 mgVR4CO+3y6+TwlBX94f3Vpb+zBRf8SGAyJFBNUsKsML8YU/4YEYnN0KKpB+0rvohvjvjp3fqpx
 fbeWF2mRATUWbj1XUerN+L95GjbdaG5KGpgHluoFnTw0XkZz1nSJkrCVqypjXwwgJgoGjKUsB7s
 l7e9g8GA/I8hsvJctAMHTZMngfQnb8qRGOOqUffN89YTiQdC7IIPZ45THNSIvAKRlM2yC6BghpN
 ym0GLXgIVavnMaLzn2YQfnksK8Cy0YykZGbYokMbG6AaQHQOB8ErI37ZcKlMg8I=
X-Google-Smtp-Source: AGHT+IEuSs10GkwcZOK4rEITCLJpsAAsPASlgEew1Ov3jQyJaV2IUsFXLg9IVmoakHnPWl0TXZGcnA==
X-Received: by 2002:a17:906:730f:b0:ad5:8412:1c9 with SMTP id
 a640c23a62f3a-adb36c07b59mr1182602466b.59.1748868285554; 
 Mon, 02 Jun 2025 05:44:45 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5d82de76sm799335066b.65.2025.06.02.05.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Jun 2025 05:44:44 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 1B6725F83A;
 Mon, 02 Jun 2025 13:44:44 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org,  Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <6695cdd8cafdf2352d931b4c054f8250@free.fr> (Julien Olivain's
 message of "Sat, 31 May 2025 23:31:40 +0200")
References: <20250303161557.571619-1-alex.bennee@linaro.org>
 <20250303161557.571619-6-alex.bennee@linaro.org>
 <6695cdd8cafdf2352d931b4c054f8250@free.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Mon, 02 Jun 2025 13:44:44 +0100
Message-ID: <87seki48jn.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748868285; x=1749473085; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vWDA2Bme0QLmY2Xtg1MP7uBqvzShYnIDuLWTQPlThjM=;
 b=PYze9cc5ZVIiqBYvwkesmox0IVQx2ugLm8ov7ETmeec0NwFNZ29gqXe0zdbQleH7im
 NUfKyDzLGGvC1QEs3Dh9l+3QTulFVrttkFmrnkdaae/TTOW8o6WJib+T1yGEuV9Z/n1r
 OYzeSV5gVkc8QFKF8lGWNCQqR8c9WtJcs4tanZ4+iHMezY2BFcxqZjf94a14iZp91wtM
 rjFdX/F8xUU+XcQAqWaACLI7DTgtmVM+U3E75oON5d/RlsJzqhCQy7Vrebv+f2eibNxR
 y54Gcz39LF/H19nJz7qwE7iNdf59lBLiOdDi5GTP/BjbNqrDRPlua2WNzX7jsC2bYFah
 rnlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=PYze9cc5
Subject: Re: [Buildroot] [PATCH v4 5/6] package/vkmark: add vkmark
 benchmarking tool
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

SnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4gd3JpdGVzOgoKPiBIaSBBbGV4LAo+Cj4gVGhh
bmtzIGZvciB0aGUgcGF0Y2guCj4KPiBPbiAwMy8wMy8yMDI1IDE3OjE1LCBBbGV4IEJlbm7DqWUg
d3JvdGU6Cj4+IFdlIGJ1aWxkIGZyb20gdGhlIHJlY2VudCAyMDI1LjEgcmVsZWFzZSBhbHRob3Vn
aCB3ZSBuZWVkIG9uZSBjb21taXQKPj4gZnJvbSBtYXN0ZXIgdG8gYmV0dGVyIGhhbmRsZSB0aGUg
bWlzc2luZyBLSFJfZGlzcGxheSBleHRlbnNpb24uCj4+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVu
bsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPj4gLS0tCj4+IHY0Cj4+ICAgLSBmaXggdGFi
IHZzIHNwYWNlIGRhbWFnZQo+PiAgIC0gZG9uJ3QgaWYgQlIyX1BBQ0tBR0VfVktNQVJLX0ZMQVZP
Ul9BTlkKPj4gICAtIG1ha2UgY29tbWVudHMgcHJvcGVybHkgZGVwZW5kCj4+ICAgLSB1c2UgdGhl
IG5ldyAyMDI1LjAxIHJlbGVhc2UKPj4gICAtIGFkZCBzaGEyNTZzdW0gb2YgQ09QWUlORy1MR1BM
Mi4xCj4+ICAgLSBhbHBoYWJldGljIHNvcnQgb2YgaW5pdGlhbCBWS01BUktfREVQRU5ERU5DSUVT
Cj4+ICAgLSBhZGQgdnVsa2FuIGVycm9yIHByb2JpbmcgcGF0Y2gKPHNuaXA+Cj4+IGRpZmYgLS1n
aXQKPj4gYS9wYWNrYWdlL3ZrbWFyay8wMDAxLWRpc3BsYXktUHJvcGVybHktaGFuZGxlLVZ1bGth
bi1lcnJvcnMtZHVyaW5nLXByb2JpbmcucGF0Y2gKPj4gYi9wYWNrYWdlL3ZrbWFyay8wMDAxLWRp
c3BsYXktUHJvcGVybHktaGFuZGxlLVZ1bGthbi1lcnJvcnMtZHVyaW5nLXByb2JpbmcucGF0Y2gK
Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMC4uN2UyZTQzYTk0Ngo+
PiAtLS0gL2Rldi9udWxsCj4+ICsrKwo+PiBiL3BhY2thZ2UvdmttYXJrLzAwMDEtZGlzcGxheS1Q
cm9wZXJseS1oYW5kbGUtVnVsa2FuLWVycm9ycy1kdXJpbmctcHJvYmluZy5wYXRjaAo+PiBAQCAt
MCwwICsxLDc3IEBACj4+ICtGcm9tIGFkZjFhYTM0NmQ5OWQyOWFkMmM1Yzk0NWMzZTRkZTVlMGUz
ZTEyY2IgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4+ICtGcm9tOiBBbGV4YW5kcm9zIEZyYW50
emlzIDxhbGV4YW5kcm9zLmZyYW50emlzQGNvbGxhYm9yYS5jb20+Cj4+ICtEYXRlOiBUaHUsIDI3
IEZlYiAyMDI1IDE0OjMzOjQ5ICswMjAwCj4+ICtTdWJqZWN0OiBbUEFUQ0hdIGRpc3BsYXk6IFBy
b3Blcmx5IGhhbmRsZSBWdWxrYW4gZXJyb3JzIGR1cmluZyBwcm9iaW5nCj4+ICsKPj4gK1RoZSB2
azo6Y3JlYXRlSW5zdGFuY2UoKSBmdW5jdGlvbiB0aHJvd3MgYW4gZXhjZXB0aW9uIG9uIGVycm9y
LAo+PiArc28gaGFuZGxlIGl0IGluc3RlYWQgb2YgY2hlY2tpbmcgZm9yIGEgbnVsbCByZXR1cm4g
dmFsdWUuCj4+ICsKPj4gK1NpZ25lZC1vZi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBs
aW5hcm8ub3JnPgo+Cj4gVGhlcmUgaXMgYSBzbWFsbCB0eXBvIGhlcmUuIEl0IHNob3VsZCBiZToK
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4K
PiBUaGlzIGlzIHJlcG9ydGVkIGJ5ICJ1dGlscy9kb2NrZXItcnVuIG1ha2UgY2hlY2stcGFja2Fn
ZSIuCj4KPiAgICAgcGFja2FnZS92a21hcmsvMDAwMS1kaXNwbGF5LVByb3Blcmx5LWhhbmRsZS1W
dWxrYW4tZXJyb3JzLWR1cmluZy1wcm9iaW5nLnBhdGNoOjA6Cj4gICAgIG1pc3NpbmcgU2lnbmVk
LW9mZi1ieSBpbiB0aGUgaGVhZGVyCj4gICAgIChodHRwczovL25pZ2h0bHkuYnVpbGRyb290Lm9y
Zy8jX2Zvcm1hdF9hbmRfbGljZW5zaW5nX29mX3RoZV9wYWNrYWdlX3BhdGNoZXMpCj4KPiBDb3Vs
ZCB5b3Ugc2VuZCBhbiB1cGRhdGVkIHZlcnNpb24gb2YgdGhpcyBwYXRjaCwgcGxlYXNlPwoKSSB0
aGluayB0aGlzIGlzIG5vdyBoYW5kbGVkIHVwc3RyZWFtIGJ5OgoKICBodHRwczovL2dpdGh1Yi5j
b20vdmttYXJrL3ZrbWFyay9wdWxsLzcyCgpTbyBJIGNhbiBzd2l0Y2ggdG8gYnVpbGRpbmcgZnJv
bSBjdXJyZW50IEhFQUQgb3IgYXNrIHRoZSB2a21hcmsgcGVvcGxlCnRvIGN1dCBhIG5ldyByZWxl
YXNlLgoKLS0gCkFsZXggQmVubsOpZQpWaXJ0dWFsaXNhdGlvbiBUZWNoIExlYWQgQCBMaW5hcm8K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
