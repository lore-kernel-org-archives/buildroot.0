Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8956C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:00:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5553E40101;
	Tue, 26 Jul 2022 19:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5553E40101
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDPGyEwcIAIb; Tue, 26 Jul 2022 19:00:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C959400B9;
	Tue, 26 Jul 2022 19:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C959400B9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D32391BF9B5
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ACEA560591
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACEA560591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uYECVlshA1e6 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:00:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C44576006A
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C44576006A
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:00:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id h9so21430798wrm.0
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 12:00:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MnEQnhy6g0wOth59Rb0fXZiozF00DtEw7LM7CdHLusc=;
 b=5hNKHNWkDiccpNVKByQkun1YIwacGrCu5iYsZOxvO4JzM1aBrsOpxamFI6SVy4AdkV
 E9jNt11ohe4fFg1qzhctt3CUtJgcXYz7vcQdzUoBFpmiGObxe4UUDGz7uUXk3rxgV0v1
 uOT92dvlRhySQX6LF32/7nqJppXhd5XfThLycj0Pf9HfoAdubHHvNSR0+j9rmKVCIQwU
 d/8Y+vNBRI3275aEPPZBvR/WrR5l666aT5dRzn1OLaIHGagKDNtEV9eZ7wQ0N9DIIoQ0
 T5sYbOt3NuCgfc8dmSHOw3X1R0XayMnwwFYJpPX6oGC6hPReON3NZH7/MLqvbjVudI+P
 XEUQ==
X-Gm-Message-State: AJIora8xtjeziYzzvNB5wF5GThKgXXuoK0XpbDBGfcUpyDY6xc1HIaY1
 L/V53LY3KNDOhi9Uv+hwVnUJei02JBlOPw==
X-Google-Smtp-Source: AGRyM1tzTu6JXLbGH/OoWcnf3y8TDLdWOXtWakpAzDnwdZVIbEhEIRYt5361RDxJL1NrHwhvU7eRKw==
X-Received: by 2002:adf:ecc5:0:b0:21e:b73f:e33d with SMTP id
 s5-20020adfecc5000000b0021eb73fe33dmr1644074wro.223.1658862006782; 
 Tue, 26 Jul 2022 12:00:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003a33227e49bsm18993813wms.4.2022.07.26.12.00.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 12:00:06 -0700 (PDT)
Message-ID: <8a66a4e3-a555-80ed-6ac0-48cbee5a93fe@smile.fr>
Date: Tue, 26 Jul 2022 21:00:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220725153601.25254-1-romain.naour@smile.fr>
 <CADvTj4oNN67-EOvYdTzCA9UnxVbpNL6Q7LGA8X4ea1RnghXZzg@mail.gmail.com>
 <55f7a566-a92a-3423-0a20-f62708fd4a25@smile.fr>
 <CADvTj4qwaa4=jG9KAANst-BdaKKqWvq1b3S_x_+X+AHhMC5x1A@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CADvTj4qwaa4=jG9KAANst-BdaKKqWvq1b3S_x_+X+AHhMC5x1A@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=MnEQnhy6g0wOth59Rb0fXZiozF00DtEw7LM7CdHLusc=;
 b=FmO86kPzT7fM7AcLX+e5bFNu5GuO7lh0P9HnNS2nNuaCTrc2GBQuVlFPMRpNhRRVyU
 +ahs5P3d0+NlJbePIAWI4RYeCUhHr9zpdtrif8ElbLGNuQMs1KNX5yx/Y1GSYEIQBvRE
 U4EF7OSzwjLEF1WSY5s7xEI9ZQNmU+ZKsUns5GmjhCxZy7YbLQGezR4JXO6L3XkIVpHT
 e9tRBuWULVIOgG1z/gT1xHKWLFXviSPL+uOugZPlfwAX6W+WiK/OShgQA6nav3g9XIqM
 1Q1UboO/xAgGa63Cg7g1Jr5yoNVxUIphDFESqmcXjq0Ysu85WyptzYNWFdEROVMYF8Sw
 EXSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=FmO86kPz
Subject: Re: [Buildroot] [PATCH] package/rustc: needs C++
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmFtZXMKCkxlIDI2LzA3LzIwMjIgw6AgMjA6MTcsIEphbWVzIEhpbGxpYXJkIGEgw6lj
cml0wqA6Cj4gT24gVHVlLCBKdWwgMjYsIDIwMjIgYXQgMzo1MSBBTSBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBzbWlsZS5mcj4gd3JvdGU6Cj4+Cj4+IEhlbGxvIEphbWVzLAo+Pgo+PiBMZSAy
NS8wNy8yMDIyIMOgIDIwOjQxLCBKYW1lcyBIaWxsaWFyZCBhIMOpY3JpdCA6Cj4+PiBPbiBNb24s
IEp1bCAyNSwgMjAyMiBhdCA5OjM2IEFNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxl
LmZyPiB3cm90ZToKPj4+Pgo+Pj4+IFdoaWxlIGJ1aWxkaW5nIGhvc3QtcnVzdCB3aXRoIGEgbXVz
bCBiYXNlZCB0b29sY2hhaW4gd2l0aG91dCBDKysgY29tcGlsZXIsCj4+Pj4gdGhlIGJ1aWxkIGZh
aWwgc2luY2UgbGlidW53aW5kIGJ1bmRsZWQgaW4gcnVzdCBzb3VyY2VzIG5lZWRzIGEgQysrIGNv
bXBpbGVyLgo+Pj4+Cj4+Pj4gY2FyZ286d2FybmluZz1pNjg2LWJ1aWxkcm9vdC1saW51eC1tdXNs
LWdjYy5icl9yZWFsOiBlcnJvcjogWy4uLl0vaG9zdC1ydXN0LTEuNjIuMC9zcmMvbGx2bS1wcm9q
ZWN0L2xpYnVud2luZC9zcmMvVW53aW5kLUVIQUJJLmNwcDogQysrIGNvbXBpbGVyIG5vdCBpbnN0
YWxsZWQgb24gdGhpcyBzeXN0ZW0KPj4+Pgo+Pj4+IE5vdGU6IHRoZSBpc3N1ZXMgY2FuJ3QgYmUg
cmVwcm9kdWNlZCB3aXRoIGEgZ2xpYmMgYmFzZWQgdG9vbGNoYWluIHdpdGhvdXQKPj4+PiBDKysg
cHJvYmFseSBkdWUgdG8gZXh0cmEgc3RlcHMgcmVxdWlyZWQgdG8gc3VwcG9ydCBtdXNsIGxpYmMu
Cj4+Pgo+Pj4gSXMgdGhpcyBiZWNhdXNlIGdsaWJjIHByb3ZpZGVzIGxpYnVud2luZCBzbyBpdCdz
IG5vdCByZXF1aXJlZCB0aGVyZT8KPj4+Cj4+Pj4KPj4+PiBBY3R1YWxseSwgcnVzdCBjb21waWxl
ciBpcyBiYXNlZCBvbiBMTFZNIHNvIGl0IGxpa2VseSBkZXBlbmRzIG9uIHRoZSBzYW1lCj4+Pj4g
ZGVwZW5kZW5jaWVzIGFzIGhvc3QtbGx2bSBwYWNrYWdlLgo+Pj4KPj4+IFRoaXMgZG9lc24ndCBy
ZWFsbHkgbG9vayBjb3JyZWN0LCBJIG1lYW4gd2UgYWx3YXlzIGFzc3VtZSB0aGUgYnVpbGQgaG9z
dCBoYXMKPj4+IEMrKyBzdXBwb3J0IHJpZ2h0PyBUaGlzIHBhdGNoIGFkZHMgYSB0YXJnZXQgQysr
IGRlcGVuZGVuY3kgbm90IGEgaG9zdCBDKysKPj4+IGJ1aWxkIGRlcGVuZGVuY3kuCj4+Cj4+IEFj
dHVhbGx5IEJSMl9JTlNUQUxMX0xJQlNURENQUCBpcyBwcm9iYWJseSBvbmUgb2YgdGhlIG9sZGVz
dCBCdWlsZHJvb3Qgb3B0aW9uCj4+IChhZGRlZCBieSBbMV0pIHRoYXQgbWVhbnMgIkJ1aWxkL2lu
c3RhbGwgYysrIGNvbXBpbGVyIGFuZCBsaWJzdGRjKysiLgo+Pgo+PiBTbyB5b3UncmUgcmlnaHQg
d2hlbiB5b3Ugc2F5IGl0IGFkZCBhIHRhcmdldCBDKysgZGVwZW5kZW5jeSBidXQgdGhlIG9wdGlv
biBhbHNvCj4+IG1lYW5zIGhhdmluZyBhIEMrKyBjb21waWxlciBvbiB0aGUgaG9zdC4KPiAKPiBB
cmVuJ3Qgd2UgYWx3YXlzIGd1YXJhbnRlZWQgdG8gaGF2ZSBhIEMrKyBjb21waWxlciBvbiB0aGUg
aG9zdD86Cj4gaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvYmxvYi8yMDIy
LjA1LjEvc3VwcG9ydC9kZXBlbmRlbmNpZXMvZGVwZW5kZW5jaWVzLnNoI0wxNDgKPiAKClllcyBp
bmRlZWQsIGJ1dCBmb3IgQlIyX0lOU1RBTExfTElCU1REQ1BQICJCdWlsZC9pbnN0YWxsIGMrKyBj
b21waWxlciBhbmQKbGlic3RkYysrIiBtZWFucyBhIEMrKyBjcm9zcyBjb21waWxlciBmb3IgdGhl
IHRhcmdldCBpbnN0YWxsZWQgaW4gSE9TVF9ESVI6CgphYXJjaDY0LWxpbnV4LWdudS1nKysKCm5v
dCBnKysgZm9yIHlvdXIgYnVpbGQgbWFjaGluZS4KClNvcnJ5LCBJIHdhc24ndCB2ZXJ5IGNsZWFy
IHdpdGggImhhdmluZyBhIEMrKyBjb21waWxlciBvbiB0aGUgaG9zdCIuLi4KSSBtZWFudCAiaGF2
aW5nIGEgQysrIGNyb3NzIGNvbXBpbGVyIGZvciB0aGUgdGFyZ2V0IGluc3RhbGxlZCBpbiBIT1NU
X0RJUiIuCgpUbyByZXN1bWUsIGhvc3QtcnVzdCBuZWVkcyBhIEMrKyBjcm9zcyBjb21waWxlciBm
b3IgdGhlIHRhcmdldCBvbmx5IGZvciBtdXNsCmJhc2VkIHRvb2xjaGFpbnMgd2hpbGUgYnVpbGRp
bmcgbGx2bSBidW5kbGVkIGluIGl0cyBzb3VyY2Ugd2hlbiBpdCBidWlsZApsaWJ1bndpbmQgZm9y
IHRoZSB0YXJnZXQuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
