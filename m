Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D49C02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 09:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1325560B66;
	Wed,  5 Feb 2025 09:42:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MRUr5a0AKXus; Wed,  5 Feb 2025 09:42:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA2F660C2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA2F660C2C;
	Wed,  5 Feb 2025 09:42:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C5D93CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9C8F60BA2
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wzld2w7uTBI1 for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 09:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F58C60B66
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F58C60B66
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F58C60B66
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 09:42:26 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso66084045e9.2
 for <buildroot@buildroot.org>; Wed, 05 Feb 2025 01:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738748545; x=1739353345;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tOu7qW5mJ11h/T44IKZDRON4MKlUB2XgDWvWIgTqFLc=;
 b=qIPTPn2oCTyqByNzedOFsBP3pWE2/2huYCt2TNK8fdMLl+ZUOX1KyPJQKa852SKaUI
 1xHgNAryGBAMU8HvWQw+QHR6TdvkkksVz4Ub1gg6kyzfNZkDnL6k4EYhazqKray1gwxw
 oAkfwEA2YedV+pdwoSrZwZhFBcxMi5pCQ1kxPNjtlf6O2Cr49yIKkW//4ZHrGjHoYSCM
 bqV/CQgx6PMvxGWiLRZT0ckYKWhLYxSEL+K9Nn8siGomhiu51hyWorZ6K5xiUkequEde
 iJJ7FGmeQ7Cu5qN5e7s8kJQrBLY/GP14wwIxnZHDtEGi+0+Z08Th6WtdY0ThOHDTsNK2
 JA9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXLOhh4t42Eh2N8TBJsZR0mFCmtGXV3KSILxQ60RShkrgkyf+S80J1DZgskwGRht4lpHmCsQz8B1Y=@buildroot.org
X-Gm-Message-State: AOJu0Yw9TJHxAlgj5vUnfMhtdLLA5NcDuFJ/yQBSVm7pVG78qd8YfuMJ
 C5A/ERPoBzTioPHXn5bWhgG5XhXmbTtV5Cuwr12RbXcS55QVg+yCR1u7WTYJnYk=
X-Gm-Gg: ASbGncuJyK0UW+4JbrrCyBVvGP/sg7Jg7ZhguAVd9/h7GIV4zNCRmw99JbpdYQIw6K6
 HE9FEwz2jeeu5JLFuvYiz04B650Dq8yeCMz6nWoReGz8D9FGw3e3tnRUUo1Tx/8/GqgHCef3Z/4
 LBoKgZZiomlK1nmeX6SVGk8OXzGq1884XdFx6GB3fAzMTxhPnflCvhs+Gvs8ic1Hn3iC/UWUOYh
 zqgiHQ4vz5YWs/pzL8FN1YMzedNP+75lc87SW5qFsVXkNyrZjqRgeD7hsE79rQfXms+p4e7go+m
 Yoo5ntwUzcfaOIMdgtwTlUs3gl4raiGLV1NckZ8h10+4p3Q=
X-Google-Smtp-Source: AGHT+IE1TmAWQB6Y28DP6LiLY5w6603L6f9X3Ps/TwiUnessXUjVyFVRfAYuPUz0+GbtnVZS9GQt7A==
X-Received: by 2002:a05:600c:5252:b0:431:12a8:7f1a with SMTP id
 5b1f17b1804b1-4390d43dd1dmr17462275e9.16.1738748544692; 
 Wed, 05 Feb 2025 01:42:24 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390d933789sm15573505e9.4.2025.02.05.01.42.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2025 01:42:24 -0800 (PST)
Message-ID: <e0de913d-45c5-4c03-9c98-e6009e8c4c5c@mind.be>
Date: Wed, 5 Feb 2025 10:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christian Stewart <christian@aperture.us>, yann.morin@orange.com
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Buildroot Mailing List <buildroot@buildroot.org>,
 Thomas Perale <thomas.perale@mind.be>
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <CA+h8R2odWOyS=7=9LGGkBGHYENiLHtkj76_L2Zvq_PHOFYs9sA@mail.gmail.com>
 <527da78c-270f-4ec6-8a6e-1210456517a5@mind.be> <Z6MhhfrgmRrtMhrB@yd-6wlzhs3>
 <CA+h8R2qR95DDHn45tqUG57rSCRWpfWkVU2sd2GxpCDhkkzrr_w@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CA+h8R2qR95DDHn45tqUG57rSCRWpfWkVU2sd2GxpCDhkkzrr_w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738748545; x=1739353345; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tOu7qW5mJ11h/T44IKZDRON4MKlUB2XgDWvWIgTqFLc=;
 b=KLjZAAeRC3nX7YEYfZDg8aW/XmOAffaiEie3W8ot8iu0V/oy0bgcmWW/O+a8k5vC2S
 uzZ2yNdwxQv469gPyzFmdzo5mNHjubn9GjZ23ZUrv8BdsMtrzKIHa0II2NGl574HxwYn
 kfEanB3fiYbjTaL9w0RA9fd2kl2+6q26/qSWlCsaGp1b+BU6bwiBiLOYF5fQBO7OiJ00
 8tIswJUYoxmPBWsjZGCLnBhfsKJzHANU0WdOd4PCmrtIrwe5yDFHZs3CwU9C++IflKIR
 1n0TN/3+L+1x7xaatTP6VtOWKt08r9Wt1CtRzF/VaDC0Lh9ZI3jHS2wVGjKfhb+auv+d
 323Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KLjZAAeR
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8wMi8yMDI1IDEwOjIwLCBDaHJpc3RpYW4gU3Rld2FydCB3cm90ZToKPiBIaSBZYW5u
LAo+IAo+IE9uIFdlZCwgRmViIDUsIDIwMjUsIDEyOjI54oCvQU0gPHlhbm4ubW9yaW5Ab3Jhbmdl
LmNvbSAKPiA8bWFpbHRvOnlhbm4ubW9yaW5Ab3JhbmdlLmNvbT4+IHdyb3RlOgo+IAo+ICAgICAg
PsKgIFllcyBJIGFncmVlIC0gdGhpcyBwYXRjaCAoYW5kIFlhbm4ncyBpbmZyYXN0cnVjdHVyZSBw
YXRjaCB0aGF0IHRoaXMgcGF0Y2gKPiAgICAgID4gZGVwZW5kcyBvbikgc2hvdWxkIGJlIGluIHBr
Zy1nb2xhbmcgaW5zdGVhZCBvZiBhbiBpbmRpdmlkdWFsIHBhY2thZ2UuCj4gCj4gICAgIE5vdCBz
dXJlIEkgZW50aXJlbHkgZ3JvayB0aGF0LiBUaGUgY2hhbmdlIEkgc3VibWl0dGVkIGlzIGluIHBr
Zy1nb2xhbmcsCj4gICAgIGFzIGl0IGlzIGluZnJhLgoKICBZZXMsIHNvcnJ5LCBJIHdhcyB0YWxr
aW5nIGFib3V0IHRoZSBwYXJ0IGluIGZpbGViZWF0IChhbmQgSSBmb3Jnb3QgdGhhdCAKZmlsZWJl
YXQgd2FzIGEgbmV3IHBhY2thZ2UpLgoKCj4gICAgIFNvLCBJIGd1ZXNzIHlvdSBvbmx5IGFjdHVh
bGx5IHN1Z2dlc3RlZCBtb3Zpbmcgc2V0dGluZyAtZnVzZS1sZD1iZmQgYW5kCj4gICAgIC1XbCwt
LW5vLXBpZSBmbGFncyBpbnRvIHBrZy1nb2xhbmcsIHJpZ2h0Pwo+IAo+IAo+IE15IHRoaW5raW5n
IGlzIHRoYXQgd2UgYWx3YXlzIHdhbnQgR28gdG8gaGF2ZSBmdXNlLWxkIHNldCB0byB0aGUgY29y
cmVjdCAibGQiIHdlIAo+IGFyZSB1c2luZy4gU28gaXQgbWFrZXMgc2Vuc2UgdG8gc2V0IHRoaXMg
aW4gcGtnLWdvbGFuZy4KPiAKPiBUaGlzIHdheSBhbnkgbmV3IHBhY2thZ2VzIHRoYXQgaGF2ZSBk
eW5hbWljIGxpbmtpbmcgKGNnbykgd2lsbCBhbHNvIHBpY2sgdXAgdGhlIAo+IGZpeCBhcyBuZWVk
ZWQuCgogIEFGQUlVIGl0IHdvdWxkIGJlIG5lZWRlZCBmb3IgYW55IGNvbWJpbmF0aW9uIG9mCi0g
Q0dPIHBhY2thZ2U7Ci0gYXJjaCB3aGVyZSBHbyBkZWNpZGVzIGl0IG5lZWRzIGdvbGQ7Ci0gdG9v
bGNoYWluIHRoYXQgZG9lc24ndCBoYXZlIGdvbGQuCgpTbyB0aGUgb25seSBwYWNrYWdlLXNwZWNp
ZmljIGFzcGVjdCBpcyBpbmRlZWQgdGhhdCBpdCdzIENHTy4KCiAgV2UgZG9uJ3QgaGF2ZSBhIHdh
eSBhdCB0aGUgbW9tZW50IGZvciBhIHBhY2thZ2UgdG8gaW5kaWNhdGUgdGhhdCBpdCdzIHVzaW5n
IApDR08gKHRoZXJlJ3MganVzdCBhIENvbmZpZy5pbiBkZXBlbmRzIGxpbmUpLiBCdXQgSSB0aGlu
ayB0aGUgZXh0bGQgb3B0aW9uIG9ubHkgCmFwcGxpZXMgdG8gQ0dPIGJ1aWxkcyBhbnl3YXkuCgoK
PiAgICAgV2hlbiBJIGluaXRpYWxseSBuZWVkZWQgLWZ1c2UtbGQ9YmZkIGZvciBmaWxlYmVhdCwg
SSBkaWQgbm90IGZlZWwgdmVyeQo+ICAgICBjb25maWRlbnQgdGhhdCB3ZSBzaG91bGQgZG8gaXQg
dW5jb25kaXRpb25hbGx5LiBJbmRlZWQsIG5vbmUgb2YgdGhlCj4gICAgIHtob3N0LSx9Z29sYW5n
LXBhY2thZ2UgcGFja2FnZXMgd2UgaGFkIGF0IHRoYXQgdGltZSBuZWVkZWQgaXQgYXQgYWxsLiBT
bwo+ICAgICBJIGNvbmNsdWRlZCB0aGF0IGZpbGViZWF0IHdhcyBzcGVjaWFsIChpdCB3YXMgYWxy
ZWFkeSBzcGVjaWFsIGluIGEgZmV3Cj4gICAgIG90aGVyIHJlc3BlY3RzLCBzbyBtZWgpLgo+IAo+
IAo+IEl0IGlzIGp1c3QgYmVjYXVzZSBpdCB1c2VzIGNnbywgb3IgYW0gSSB3cm9uZz8KPiAKPiAg
ICAgQW5kIHNpbmNlIEkgYW0gZmFyIGZyb20gYSBnbyBleHBlcnQsIEkgaGF2ZSBubyBpZGVhIGhv
dyBpbXBhY3RmdWwgc3VjaCBhCj4gICAgIGNoYW5nZSB3b3VsZCBiZS4gU28gSSB3YXMgYSBiaXQg
c2tlcHRpY2FsIGF0IG1ha2luZyBpdCBwYXJ0IG9mIHRoZSBpbmZyYQo+ICAgICBzbyB0aGF0IGl0
IGFwcGxpZWQgdG8gYWxsIHBhY2thZ2VzLgo+IAo+IAo+IAo+ICAgICBTdGlsbCB0b2RheSwgb25s
eSBvbmUgcGFja2FnZSAoY29udGFpbmVyZCkgYWN0dWFsbHkgbmVlZHMgaXQ7IGl0IGlzCj4gICAg
IHN0aWxsIGFuIGV4Y2VwdGlvbi4gVGh1cyBfSV8gYW0gc3RpbGwgYSBsaXR0bGUgYml0IHNrZXB0
aWNhbCB0aGF0IHRoaXMKPiAgICAgc2hvdWxkIGJlIG1vdmVkIGludG8gdGhlIGluZnJhLgoKICBB
RkFJVSwgdGhlIHByb2JsZW0gKHRoYXQgR28gd2FudHMgdG8gdXNlIGdvbGQgZXZlbiBpZiBpdCBp
cyBub3QgYXZhaWxhYmxlKSAKcmVhbGx5IHNob3VsZCBleGlzdCBmb3IgYWxsIHBhY2thZ2VzLCB0
aGVyZSBpcyBub3RoaW5nIHBhY2thZ2Utc3BlY2lmaWMgYWJvdXQgaXQuCgogIFRoZXJlIGlzIGFs
c28gdGhlIHBvdGVudGlhbCBwcm9ibGVtIHRoYXQgbGQuYmZkIGRvZXNuJ3QgYWN0dWFsbHkgd29y
aywgYnV0IHdlIApkb24ndCBoYXZlIGEgc29sdXRpb24gZm9yIHRoYXQgYW5kIG5vIGVhc3kgd2F5
IHRvIGRldGVjdCBhdCBDb25maWcuaW4gbGV2ZWwgd2hlbiAKaXQgd291bGQgZXhpc3QuCgogIFRo
ZW4gdGhlcmUgaXMgdGhlIGFkZGl0aW9uYWwgUElFIGlzc3VlIHRoYXQgRmlvbmEgYWRkcmVzc2Vz
IHdpdGggdGhpcyBwYXRjaCAtIApJIGhhdmUgbm8gaWRlYSBpZiB0aGF0IG9uZSBpcyBwYWNrYWdl
LXNwZWNpZmljIG9yIG5vdC4gSSBfdGhpbmtfIHRoZSBhdXRvYnVpbGQgCmZhaWx1cmUgb24gY2xv
dWRmbGFyZWQgWzFdIGlzIHRoZSBzYW1lIGlzc3VlLCBidXQgSSdtIG5vdCBzdXJlLiBJdCBkb2Vz
IGZlZWwgCmxpa2UgdGhhdCBvbmUgaXMgcHJldHR5IG11Y2ggcGFja2FnZS1pbmRlcGVuZGVudCBh
cyB3ZWxsIHRob3VnaC4KCgo+IAo+ICAgICBCdXQgaWYgQ2hyaXN0aWFuLCBvdXIgZXJlc2lkZW50
IGdvIGV4cGVydCwgc2F5cyB3ZSBzaG91bGQgZ28gZm9yIGl0LAo+ICAgICB0aGVuIGxldCdzIGRv
IGl0Lgo+IAo+ICAgICBTdGlsbCwgSSBiZWxpZXZlIHRoZXJlIHNob3VsZCBiZSBhIHdheSBmb3Ig
cGFja2FnZXMgdG8gYmUgYWJsZSB0byBwYXNzCj4gICAgIGFyYml0cmFyeSBleHRsZGZsYWdzLCBh
bmQgdGh1cyB0aGUgdmFyaWFibGUgc2hvdWxkIGJlIGV4cG9zZWQuCj4gCj4gCj4gWWVzLCB0aGF0
IHZhcmlhYmxlIHNob3VsZCBiZSBleHBvc2VkLCBJIGFncmVlLiBJdCdzIHVzZWZ1bCB0byBiZSBh
YmxlIHRvIHBhc3MgCj4gZXh0cmEgbGQgZmxhZ3MgYXMgbmVlZGVkLgoKICBJIGFsc28gYWdyZWUg
dGhhdCB0aGUgdmFyaWFibGUgc2hvdWxkIGJlIGV4cG9zZWQuIEV2ZW4gdGhvdWdoIEkgZG9uJ3Qg
dGhpbmsgaXQgCnNob3VsZCBiZSB1c2VkIGJ5IGFueSBwYWNrYWdlIGZvciB0aGUgdGltZSBiZWlu
Zy4KCiAgQnV0IEkgdGhpbmsgdGhlIGV4dGxkIGFuZCBQSUUgb3B0aW9ucyBzaG91bGQgYmUgYXBw
ZW5kZWQgdG8gaXQgZnJvbSB0aGUgaW5mcmEuCgogIFJlZ2FyZHMsCiAgQXJub3V0CgoKWzFdIApo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy82OTQvNjk0MWY5ZWJiYWFmNGQy
OTRkNjZkMzJjMDZhNGNkNTIzN2I4YTRlOC9idWlsZC1lbmQubG9nCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
