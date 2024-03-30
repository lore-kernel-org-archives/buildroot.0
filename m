Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB965CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 21:39:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77A7B81D02;
	Sat, 30 Mar 2024 21:39:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpfrnFuivm3Q; Sat, 30 Mar 2024 21:39:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5444981D19
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5444981D19;
	Sat, 30 Mar 2024 21:39:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14DAA1BF283
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 21:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A12E81D02
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 21:39:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IcnAvG4RMiCS for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 21:39:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22d; helo=mail-oi1-x22d.google.com;
 envelope-from=aladyshev22@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9B5881CE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9B5881CE7
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9B5881CE7
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 21:39:15 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id
 5614622812f47-3c36ecdb8cdso1432634b6e.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 14:39:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711834754; x=1712439554;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NeNlXjEPfC5/ThBKQDWJSNBi+zgV6occ/Ium3zYtqWc=;
 b=LSAMg0lM+uTLfCxt64GBFCvp5en+ndtKOxCKNVziPFL/5DVjunge+aUXRL/FuqShaL
 Po9zMOQjSfNKwmetmbJ48RzKLDER7y9uVI9Lkp90OU7Bo2+BD0/H/+VXwV8C18F47QV8
 Gme++ljQZGtUtMxylyXzZXqC8gAz4Qk+8PlguhgRP7p+mWaG8e1pyqVH+18oaR4rgLEP
 rCzoIgij7GM5wHmH1iWcjK/iFDT3GUAfB4BDcV8oFfRvllCVFMtWAXKAAyf5Pj/71AIo
 DHV6Li3za6OJkdO+Vfu3iML1M/BXOBCeEFgoAPwm8qkD/116TtP76BZCB8wDhBtDJpqq
 1ckg==
X-Gm-Message-State: AOJu0Yzwb4ISlOunJEHKEpK5znUOcBt5mzx+7xuEnChWdVY0Qiduy4ip
 RF2rYrxRVr+1fYx1NjJEzX/5SrxWQ1Ve20oTz1d5BnKEue+I8zp5D89ahhSwaeYxDysi951yEhP
 cQHuMSb6s7w740fSqD1yZOjAYVL0mTrJkiYM=
X-Google-Smtp-Source: AGHT+IEMY/NB76w1WoZDCyXqFZ1cToM/5yg8ur1kFr1SIAWDhMX1h+AV7JZ9Jau4+gX1Ly4kr5m3u+aauW95d89G2fQ=
X-Received: by 2002:a05:6808:2e43:b0:3c3:c090:5b6f with SMTP id
 gp3-20020a0568082e4300b003c3c0905b6fmr8248472oib.0.1711834754590; Sat, 30 Mar
 2024 14:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240311193526.32797-1-aladyshev22@gmail.com>
 <0ddef86d-1b89-4bf3-9fe7-6c7edfcc2975@inbox.ru>
In-Reply-To: <0ddef86d-1b89-4bf3-9fe7-6c7edfcc2975@inbox.ru>
From: Konstantin Aladyshev <aladyshev22@gmail.com>
Date: Sun, 31 Mar 2024 00:39:04 +0300
Message-ID: <CACSj6VVEo05T7su=VhGxTgraU3YRx-bNRa-APr630stg=0Ew2A@mail.gmail.com>
To: Maxim Kochetkov <fido_max@inbox.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711834754; x=1712439554; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NeNlXjEPfC5/ThBKQDWJSNBi+zgV6occ/Ium3zYtqWc=;
 b=Ygjs1YWccI1+WfJociYmsQ8U9spvbIhaYseMYU9tFl0GV3VYh0XliVufqGw8geQgGJ
 tcScG+94wfofffoMJrdeHvzD2fLgGvuAaqN4vytOrrn6n2bWtnuzd4vgwVb/k7IcdzNN
 IDTi3dx9fK7KECNwt6Zai1a7NOuBIK2VJOBBTggxTpjw++QRzqjnKDwDRC4Cz6fqeOuE
 BEYIyCEZgETbehptjXz0fzsdVSgA5xxKfv1NQ1O9oBIoxf2o1PE6KXuj9ObWqkFngljJ
 tTxtCJfo1+K/o9Q5vPOG/frgYeES3MVkXq5CrPJpaoLQ55cCejWClDEnZJR8vV/0zG0e
 NGsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Ygjs1YWc
Subject: Re: [Buildroot] [PATCH] configs/pc_x86_64_{bios,
 efi}_defconfig: add CRDA package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmtzIGZvciB0aGUgaGludCEKClNvcnJ5LCB0aGF0IGl0IHRvb2sgbWUgc28gbG9uZyB0byB0
ZXN0IGl0IGFuZCByZXBseS4KUGxlYXNlIHNlZSB0aGUgbmV3IHBhdGNoc2V0Cmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjQtTWFyY2gvNjg4NjExLmh0
bWwKCkJUVywgd2h5IGFyZSB0aGVyZSBXaUZpIGRyaXZlcnMgaW4gdGhlIGZpcnN0IHBsYWNlPyBU
aGUgcmVhZG1lIGZvciB0aGUKYm9hcmQgcmVmZXJzIG9ubHkgdG8gdGhlICJuaWMsbW9kZWw9dmly
dGlvIgooaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvYmxvYi9tYXN0ZXIv
Ym9hcmQvcGMvcmVhZG1lLnR4dCkKU28gYWRkaW5nIGEgYnVuY2ggb2YgbmV0d29yayBmaXJtd2Fy
ZSBzZWVtcyBwcmV0dHkgYXJiaXRyYXJ5IHRvIG1lLiBJcwp0aGVyZSBhbnkgcGFydGljdWxhciBy
ZWFzb24gZm9yIHRoaXM/IE9yIG1heWJlIGFsbCB0aGlzIGNhbiBiZQpjb25zaWRlcmVkIGFzIGxl
Z2FjeSBhbmQgcmVtb3ZlZD8KCgpCZXN0IHJlZ2FyZHMsCktvbnN0YW50aW4gQWxhZHlzaGV2CgpP
biBUdWUsIE1hciAxMiwgMjAyNCBhdCA4OjQw4oCvQU0gTWF4aW0gS29jaGV0a292IDxmaWRvX21h
eEBpbmJveC5ydT4gd3JvdGU6Cj4KPiAxMS4wMy4yMDI0IDIyOjM1LCBLb25zdGFudGluIEFsYWR5
c2hldiB3cm90ZToKPiA+IENlbnRyYWwgUmVndWxhdG9yeSBEb21haW4gQWdlbnQgaXMgdXNlZCBi
eSB0aGUgTGludXgga2VybmVsIGNmODAyMTEKPiA+IHdpcmVsZXNzIHN1YnN5c3RlbS4gQ3VycmVu
dGx5IHRoaXMgcGFja2FnZSBpcyBub3QgZW5hYmxlZCBhbmQga2VybmVsCj4gPiBjb21wbGFpbnMg
d2l0aCB0aGUgZm9sbG93aW5nIG1lc3NhZ2Ugb24gZXZlcnkgYm9vdDoKPiA+ICIiIgo+ID4gcGxh
dGZvcm0gcmVndWxhdG9yeS4wOiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IgcmVndWxhdG9yeS5k
YiBmYWlsZWQKPiA+IHdpdGggZXJyb3IgLTIKPiA+IGNmZzgwMjExOiBmYWlsZWQgdG8gbG9hZCBy
ZWd1bGF0b3J5LmRiCj4KPiB3aXJlbGVzcy1yZWdkYiBpcyByZWd1bGF0b3J5IGRhdGFiYXNlIHVz
ZWQgYnkgTGludXguCj4KPiA+ICIiIgo+ID4gQWRkIENSREEgcGFja2FnZSB0byBmaXggdGhlIGlz
c3VlLgo+Cj4gQ1JEQSBpcyBhIHVkZXYgaGVscGVyIGZvciBjb21tdW5pY2F0aW9uIGJldHdlZW4g
dGhlIGtlcm5lbCBhbmQgLQo+IHVzZXJzcGFjZS4gQ1JEQSBpcyBubyBsb25nZXIgbmVlZGVkIGFz
IG9mIGtlcm5lbCB2NC4xNSBzaW5jZSBjb21taXQKPiAwMDdmNmM1ZTZlYjQ1ICjCq2NmZzgwMjEx
OiBzdXBwb3J0IGxvYWRpbmcgcmVndWxhdG9yeSBkYXRhYmFzZSBhcwo+IGZpcm13YXJlIGZpbGXC
uykgYWRkZWQgc3VwcG9ydCB0byB1c2UgdGhlIGtlcm5lbOKAmXMgZmlybXdhcmUgcmVxdWVzdCBB
UEkKPiB3aGljaCBsb29rcyBmb3IgdGhlIGZpcm13YXJlIG9uIC9saWIvZmlybXdhcmUuIEJlY2F1
c2Ugb2YgdGhpcyBDUkRBIGlzCj4gbGVnYWN5IHNvZnR3YXJlIGZvciBvbGRlciBrZXJuZWxzLgo+
Cj4gU28gaXQgbG9va3MgbGlrZSB5b3UgbmVlZCB0byBpbnN0YWxsIHBhY2thZ2Uvd2lyZWxlc3Mt
cmVnZGIgaW5zdGVhZCBvZiBDUkRBLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
