Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B54CA0EEB
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 09:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8001161711;
	Sun, 24 Aug 2025 09:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hp2xy8_GfBi0; Sun, 24 Aug 2025 09:52:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 038786133F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 038786133F;
	Sun, 24 Aug 2025 09:52:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 581D819C
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48E6683CD0
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6sEgBtGklPxp for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 09:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A48D83C55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A48D83C55
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A48D83C55
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 09:52:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-45b4a25ccceso19092055e9.3
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 02:52:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756029144; x=1756633944;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NrseESVDqRqw/LJT5++4QyY9z8v+38KxTiLhzA0cdQY=;
 b=FUt/CxhaHXUbmwK0xeYDZRlNoUbYBTgyah/4IAhItrLZhpgvUsxdS/Wkjosskm/93p
 PL3BbyNSuJLqIczBOcBS66LcMyf2C/fTYWlG6G7cZTP9DHgKIGmKIioij4FLexj+fxU/
 S5hCPVpmH+hC+smCr0lzsNfYsD83kot+6yVtOcmLHTYF3RL9GYbk9t6EIT9/tLUAMwc+
 vYkRLqXCXE6shai8lajsnUrrFw25AdJ6sPxsoy9XAHoez3yFHcs+hgKg5CBU71cEScNB
 mpc/9/ggkqSgGgFA4CO7eIkkTWYgq5LaLXSgwqizZ/dG3EmpCrR/b0z5UUGqmwnEIO/k
 v8Nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMVO1R290mTWu7heVuS7ppwhnDnXUffRUaxJO7bckr/2LYhQQE4JO/DekEYrmWnracU0DSIKNq9IY=@buildroot.org
X-Gm-Message-State: AOJu0YzU+noyhcjaNbRkvAy2hTSbdxeiZtKRqHYUikpjqg5rwIFZSLfg
 1oAtYKMZen6eGB/k72jvanre37bT4uVZvplXCbNeyGyCuTmAtF5GiVN/KzEmnb0OMnG8Vv1V0cS
 FB1c4
X-Gm-Gg: ASbGnctcm6PfDYk6zdW1xXeDoW6Or8/2R8YnmlYpyS3aCWi3cuTDz/UJzw5InL3v8+O
 RhjPlBnrxc9KmyifHYC0mrf1WJEc4/kGc0Ge7pFX/OpHICmN4ljljSQzOTSTe0era4VcCfOyVIO
 se5QZWqnt5uCnb/tgVBqz0+BrCgkSBL3X0Px71zW2BV1kEpXLNWUzYDho6oMDyahibbcJ8PLOz8
 PQLeTKPjxY08GpHbbckP9LQIjvwTUMH+Vjt15VJmW2a1eoyIcIKe/Oa8Z10ea1IiMlpUeh9jO2A
 MKrNVtAj8+qifytb5FYbvKMPl+0EVFUc+N2HdrSMoAO/96pACsY+wmc56e9dycbssFo77j0cRDa
 4bWOciGNWVSXLa/MksJCjs2s7rmLCK3Y1IcXFi8Q5T3sAg2BEYEyf+LCrS/2kkXtqS3k7YloB9Q
 Htk19qD400TPl8ryr25Ug8qgykvnA6DqSovihMulPMMj/NXol+zIhvzpolKfZxEG83Xwp6Kc8=
X-Google-Smtp-Source: AGHT+IFc13yxTJs48OQd2FxVi1cRUzA8UyrQuM7DcrbraSb/edwdiDTS1gD01qqO5ka6UlYnxjLeKw==
X-Received: by 2002:a05:600c:1546:b0:458:c094:8ba5 with SMTP id
 5b1f17b1804b1-45b517a0664mr71873805e9.12.1756029144210; 
 Sun, 24 Aug 2025 02:52:24 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c711212924sm6906280f8f.33.2025.08.24.02.52.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 02:52:23 -0700 (PDT)
Message-ID: <92ab9a52-d18f-4fbe-ac61-6565adc39cd0@smile.fr>
Date: Sun, 24 Aug 2025 11:52:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20250824090244.281771-1-thomas.petazzoni@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20250824090244.281771-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756029144; x=1756633944; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=NrseESVDqRqw/LJT5++4QyY9z8v+38KxTiLhzA0cdQY=;
 b=eMM/r8WUL21SND6cx8/lnuUImKIx2iB54PMu7dAkX1ruQUwf0hfnCA/5QnEHOyzt3T
 U0XSEkoUgA0p42cHBMitcUYPgcGpjdlvuY2Pdq5dd6xg704YhTKja9GL6vgKcmTwTJEH
 vHpjuTi3erw5JrH6/TD4bNPl6IwtYyxvjaoTc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=eMM/r8WU
Subject: Re: [Buildroot] [PATCH 1/2] package/linux-headers: do not allow old
 kernel headers on Loongarch
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyNC8wOC8yMDI1IMOgIDExOjAyLCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBMb29uZ2FyY2ggc3VwcG9ydCB3YXMgYWRk
ZWQgdG8gdGhlIHVwc3RyZWFtIExpbnV4IGtlcm5lbCBpbiB2ZXJzaW9uCj4gNS4xOSwgc28gd2hl
biB2ZXJzaW9ucyA1LjQsIDUuMTAgb3IgNS4xNSBhcmUgc2VsZWN0ZWQsIHRoZSAiYnVpbGQiIG9m
Cj4gdGhlIGtlcm5lbCBoZWFkZXJzIGZhaWxzOgo+IAo+IE1ha2VmaWxlOjcxNzogYXJjaC9sb29u
Z2FyY2gvTWFrZWZpbGU6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiBtYWtlWzFdOiAqKiog
Tm8gcnVsZSB0byBtYWtlIHRhcmdldCAnYXJjaC9sb29uZ2FyY2gvTWFrZWZpbGUnLiAgU3RvcC4K
Ck1laCwgSSBtaXNzZWQgdGhhdCB3aGlsZSByZXZpZXdpbmcuCgpTZXJpZXMgYXBwbGllZCB0byBt
YXN0ZXIsIHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBGaXhlczoKPiAKPiAg
IGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9iMjdmYzI5OWQxNGI3YmM1
OWRhYjVkYWU2ZGViOWNjOGJkNDAwYTNkLyAoNS4xNSkKPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1
aWxkcm9vdC5uZXQvcmVzdWx0cy8xNjIxZTlkZTExNzBhY2M1MjI5Zjk5NTY4YjM1MTU1YjZjNjY4
YjA1LyAoNS4xMCkKPiAgIGh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy8y
YTI4ZTM3ZWU4NTAwZDE2NTEzN2MxNDk0NTAwMDc3MDM0NmU5NTQxLyAoNS40KQo+IAo+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+
Cj4gLS0tCj4gIHBhY2thZ2UvbGludXgtaGVhZGVycy9Db25maWcuaW4uaG9zdCB8IDYgKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS9saW51eC1oZWFkZXJzL0NvbmZpZy5pbi5ob3N0IGIvcGFja2FnZS9saW51eC1oZWFkZXJz
L0NvbmZpZy5pbi5ob3N0Cj4gaW5kZXggYjQ5ZWViMWU5NC4uNjZhOTY3MGRlNSAxMDA2NDQKPiAt
LS0gYS9wYWNrYWdlL2xpbnV4LWhlYWRlcnMvQ29uZmlnLmluLmhvc3QKPiArKysgYi9wYWNrYWdl
L2xpbnV4LWhlYWRlcnMvQ29uZmlnLmluLmhvc3QKPiBAQCAtMjYsMTQgKzI2LDIwIEBAIGNvbmZp
ZyBCUjJfS0VSTkVMX0hFQURFUlNfQVNfS0VSTkVMCj4gIAo+ICBjb25maWcgQlIyX0tFUk5FTF9I
RUFERVJTXzVfNAo+ICAJYm9vbCAiTGludXggNS40Lngga2VybmVsIGhlYWRlcnMiCj4gKwkjIFN1
cHBvcnQgd2FzIGludHJvZHVjZWQgaW4gTGludXggNS4xOQo+ICsJZGVwZW5kcyBvbiAhQlIyX2xv
b25nYXJjaDY0Cj4gIAlzZWxlY3QgQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfNAo+
ICAKPiAgY29uZmlnIEJSMl9LRVJORUxfSEVBREVSU181XzEwCj4gIAlib29sICJMaW51eCA1LjEw
Lngga2VybmVsIGhlYWRlcnMiCj4gKwkjIFN1cHBvcnQgd2FzIGludHJvZHVjZWQgaW4gTGludXgg
NS4xOQo+ICsJZGVwZW5kcyBvbiAhQlIyX2xvb25nYXJjaDY0Cj4gIAlzZWxlY3QgQlIyX1RPT0xD
SEFJTl9IRUFERVJTX0FUX0xFQVNUXzVfMTAKPiAgCj4gIGNvbmZpZyBCUjJfS0VSTkVMX0hFQURF
UlNfNV8xNQo+ICAJYm9vbCAiTGludXggNS4xNS54IGtlcm5lbCBoZWFkZXJzIgo+ICsJIyBTdXBw
b3J0IHdhcyBpbnRyb2R1Y2VkIGluIExpbnV4IDUuMTkKPiArCWRlcGVuZHMgb24gIUJSMl9sb29u
Z2FyY2g2NAo+ICAJc2VsZWN0IEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF81XzE1Cj4g
IAo+ICBjb25maWcgQlIyX0tFUk5FTF9IRUFERVJTXzZfMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
