Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FC9D66B9D
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 00:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE1760904;
	Wed, 27 Nov 2024 00:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkopbriO24qB; Wed, 27 Nov 2024 00:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0FB9160908
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FB9160908;
	Wed, 27 Nov 2024 00:36:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E7A5F1DA8
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 00:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C926F60A7E
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 00:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4a5norHDNOOO for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 00:35:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=fancp2007@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE1F360908
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE1F360908
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE1F360908
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 00:35:56 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53de92be287so2610872e87.1
 for <buildroot@buildroot.org>; Tue, 26 Nov 2024 16:35:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732667754; x=1733272554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A6fnqq0py6wWtDI43bWdC8GLskgk/bD0xjauEXDynt8=;
 b=dsewtYqV/1OvvebZCXDOM51g0OMzFIsOeEP2kVHnbaWkZVsSy7IjaGrV5I86Tvb5Dj
 Au1otzbRtQzFgpQPkPN53VTj6Z5y6doXVMvuw5kI1MjHRXkUIS1qKKU6WaTVcscS1mUA
 xV4iS+/3OzJu9oalgUFGiJRHFfezuZNWgFBl6VIe8t2avD9A0WLBXzbWzERmSETJ90+9
 sijcg676UGyvlMiyoLG3yJ/Grzw11+n/14Pp1pL0y/6A6aD8hxRLw6NVMNaTaY1JgTS5
 NN/VkwQe8Xt3UlXiXmugcGR5VBJas1vI1CLk8UwFJU/VTXVAOR7U1mp8QrCetmrr8Mgm
 TZaA==
X-Gm-Message-State: AOJu0YzqFxqd3rt344d1CGYgVjSiNs3gNS+53mKtQgRV7w3kEO6NzEfh
 T8RyFaNKhqSShJeWk3P2JGoE6W7vXW7kQGxK87QijBR3IlBNTUhAAaZByDGU74X7Nl6K1Q6YKib
 DQdLJNKhgY2WXveMz4zBIrFajIwA=
X-Gm-Gg: ASbGncvc8HUxbymLF6kv5/EMtsHVzw/8W0ktY4fkeTP4qUq1HLicM31c3IJuLQZ4S9n
 7tlO7ChPdxnuV/xBdMjBw8sIlxISQ5UA8
X-Google-Smtp-Source: AGHT+IGjvC2AYZFDbdiJ+g+FV0ebQ3K35g1VhAhoIhbF4mOG/DpsnkBQmyGdbwRWXPXZC8+3TOT1zYW3zBTL1iT9u7g=
X-Received: by 2002:a05:6512:2216:b0:53d:ee0e:b466 with SMTP id
 2adb3069b0e04-53df010b19emr780926e87.38.1732667753959; Tue, 26 Nov 2024
 16:35:53 -0800 (PST)
MIME-Version: 1.0
References: <20241030002020.73963-1-fancp2007@gmail.com>
 <20241031191844.60ba9a59@windsurf>
 <CAFkzVZbczGknp7uz78yCHo+8aW3RbjQG0ns4fGPv=Gakb02fWw@mail.gmail.com>
 <20241124172908.2b4db731@windsurf>
 <CAFkzVZbeK3a-5ze3g9hWod5uhHqq1tbL+eMZ+Bz8nA9noMherA@mail.gmail.com>
 <20241126145738.0b2e25cf@windsurf>
In-Reply-To: <20241126145738.0b2e25cf@windsurf>
From: Scott Fan <fancp2007@gmail.com>
Date: Wed, 27 Nov 2024 08:35:42 +0800
Message-ID: <CAFkzVZbXtKAezUsDyDtYxhwg5CQ0A5tBnrmA9JPmi2OwGOXtXA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732667754; x=1733272554; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A6fnqq0py6wWtDI43bWdC8GLskgk/bD0xjauEXDynt8=;
 b=UiMEQBgjmSeeTGEAbHqagEu26lVGyjSHjxD5eUs92nZZwRtSkte3jOCffbn7vrpqUj
 nA19heIfewDjmQyqZ0cl+a5Gt0YP8DDfnqpAbekiO/EravTS3a/0BRMYl1EUsJvic2SS
 9OstK6nv87vOD+1AKjTgpd8OCrXSykhHfoLAv7Y629mwjnRpKUtBmFvmPzV+IkpSHpzB
 QTuStmz9Mlo6fxEW9PtVtrnXBFx+Aa+EFKvuYKAjhSHILMEaZeoUdiFoITe16cjLlrV8
 vdRJMSrOt2Sge625biust32RTjWPbYA3l9gScS0kAq2jIHzQ9SBZ1oCCq/ZACHcwF92Y
 uMYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UiMEQBgj
Subject: Re: [Buildroot] [PATCH] package/procps-ng: fix pidfd_open checking
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

T24gVHVlLCBOb3YgMjYsIDIwMjQgYXQgOTo1N+KAr1BNIFRob21hcyBQZXRhenpvbmkKPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCAyNiBOb3YgMjAyNCAw
OTo1MDoxMiArMDgwMAo+IFNjb3R0IEZhbiA8ZmFuY3AyMDA3QGdtYWlsLmNvbT4gd3JvdGU6Cj4K
PiA+IE1heWJlIGl0IHNob3VsZCBiZSBhcyBmb2xsb3dzOgo+ID4KPiA+IGlmZXEgKCQoQlIyX1RP
T0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfMykseSkKPiA+IFBST0NQU19OR19DT05GX09QVFMg
Kz0gLS1kaXNhYmxlLXBpZHdhaXQKPiA+IGVuZGlmCj4KPiBJZiB5b3Ugd3JpdGUgaXQgdGhpcyB3
YXksIGl0IHdpbGwgZGlzYWJsZSBwaWR3YWl0IG9uIGFsbCBjb25maWd1cmF0aW9ucwo+IHdpdGgg
aGVhZGVycyA+PSA1LjMuIERvbid0IHlvdSB3YW50IHRvIGRvIGV4YWN0bHkgdGhlIG9wcG9zaXRl
Pwo+CgpTb3JyeSwgSSBtYWRlIGEgbWlzdGFrZSwgaXQgc2hvdWxkIGJlOgoKaWZlcSAoJChCUjJf
VE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNV8zKSwpClBST0NQU19OR19DT05GX09QVFMgKz0g
LS1kaXNhYmxlLXBpZHdhaXQKZW5kaWYKCkJ1dCBhbm90aGVyIHByb2JsZW0gaXMgdGhhdCB0aGUg
LS1kaXNhYmxlLXBpZHdhaXQgb3B0aW9uIGRvZXMgbm90CmV4aXN0IGluIHRoZSB2NC4wLjQgdmVy
c2lvbiB1bmxlc3MgdGhlIGZvbGxvd2luZyBwYXRjaCBpcyBhcHBsaWVkLgpodHRwczovL2dpdGxh
Yi5jb20vcHJvY3BzLW5nL3Byb2Nwcy8tL2NvbW1pdC8yNTA3YmM0NzU3ODJmZjVlMDU0MWQzN2M3
ODBkZmYxZTI5M2M5NTUzCgpTY290dCBGYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
