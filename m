Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E242CEFCE4
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 17:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD1E860BAB;
	Tue,  6 Jan 2026 17:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BM7d3lSV5s3v; Tue,  6 Jan 2026 17:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 965E060B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767721675;
	bh=V2QoibNMeDBBSDLsPF1skxqPlAx7fnfbrNGwkURmWOQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cb42p5G8wR/EMvZDsJP9KCJqpAAOiZs+NFyHmL661wnNTgW0QnY5pAQoKMRYMFRLp
	 fYWY+7Pxuy0n7sfYhEfFlpuH3ZpH6bsj+YCcm3aAmuF6n1rX65bUmNmPP2rUUaZN6a
	 dz2BGuyn0nUMe9Vs/k4NCkLGEA7lmU+Z5Ww/QtJiiKSXeG7Hn6/BimfIoV9GMxG4jH
	 mcu4hPI6BE6tgMPBn5hmsd/MBmq7B84DCuVBAqHVbdlms3PA4dhHhnVnsMCrhhHSNf
	 wQoKRTWyvYoRW3N7A5qNR9ppk1grS2a1BiS6G2ESDbXYguW3nLn0B5MTF5sKjWy+Kw
	 rArzn4K95d1Rg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 965E060B53;
	Tue,  6 Jan 2026 17:47:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34238E7
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 17:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2508560B53
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 17:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6ohJzcukHT2 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 17:47:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2d; helo=mail-vk1-xa2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2513D60A60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2513D60A60
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2513D60A60
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 17:47:50 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id
 71dfb90a1353d-55982d04792so820712e0c.1
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 09:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767721670; x=1768326470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RSDaxqlKDfrYZHb//+5Lb0TyfwkUlsxSgYOPP+5Kfuw=;
 b=b1LNBs82nHW5U5qBJckNKAOnClHYRF1ObuklqUyQnPqt/5WhCoPIyjpVbTRSu22ka/
 a25CKkOUreegDpjDcfG94ZJ6eNPbKWLdZkRCkVHxnzng7+u+KG1rtRME1/JRDRFFDipb
 Pkb8akvarLuRRwpQCn2oZSqwTyTrINRjUPLZUI32ARs0VvfB0wsh7q6WyzNxJsKQHUDm
 m+lrxY8jkHx0shlIgiSHvR5bn3+DqvzBxWrN62dy22tjTjZbagMPHat4y95gwYi2yaL+
 Poaoj5LAdtGI06zLMeK2l9GTBTpqUbDdwq3pg3Vl8LVp70QMoRcKOtZTlDwUriLGmk1n
 4RPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMzG01Gndz4v0mXlWEnuDmubZJUJNLGsHScxoOWw9+qmQLdlBzNPNu7wVZotwcSqKHdZQs4pyiQ8w=@buildroot.org
X-Gm-Message-State: AOJu0YxZ8f5Ttn6zvzUCwH5LlsCKz0tnDrnsb1UUEyuzFq5AJLUoHyLa
 wr8QvO/8PPShepN6uCMfDkMGJi3aNDIchzkt7CGfPa4dfPIZ4PZbCl26akoZBzUL1F65B9mpmIo
 +eH9yW1+sgnTRJ/PM+VHcsgDLjoGAkbA=
X-Gm-Gg: AY/fxX7MVoB5pd7Xnp7ddZ764Hv0DVExKJszYVWgyQEM+zw8Il8lGAU8fke3c3lGcPK
 qEXhGEwCmg66Hg9qImgqaYU5RhQmTqU/4REYIzNBsh5b6o7UqNRK9au877/yDiWHWQwjvXz8W5r
 YBTFcrCYaUbTUs4IpRs6pT9nXDJjXmM0FGpP80eTbNlK/wX8ZQpcXlM4G9+4qsdo9oE199jUYip
 ja0qf138bxgLY9Pn7mVxYLqfWWmg1BituG/OA/6SvMvZh/1r4RLWrKqycF1iRHEEDSSfnwfCXwY
 U43zqe1p8Fkcqhhh1J8C8zc220iEj2/e3SZ172wP6Danz/klj1qegdvnUw==
X-Google-Smtp-Source: AGHT+IGqskJcJgrSQY5SUxFqntt3YFnk+NBqv97+gp9FFiLl3iYaAhJZVY+g9wQpbSA74VMPVLLUe5GPSzfjNYydm5c=
X-Received: by 2002:a05:6102:cc7:b0:5dd:8992:e38d with SMTP id
 ada2fe7eead31-5ec742f1768mr1250073137.7.1767721668187; Tue, 06 Jan 2026
 09:47:48 -0800 (PST)
MIME-Version: 1.0
References: <20251119154819.3416176-1-nolange79@gmail.com>
 <20260101230904.6d78e9f5@windsurf>
 <CADvTj4r8prXxRJT1h6Mf-XjbDzq0YmUeYZL++gxGG0dHwSdeKA@mail.gmail.com>
 <20260106103957.4e655da2@windsurf>
In-Reply-To: <20260106103957.4e655da2@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 6 Jan 2026 10:47:36 -0700
X-Gm-Features: AQt7F2o7CF4ZDQ7ZiN-ULWnKnyPdKQ-u0C_aRz8exqC4BFfjBbaAa-IE_j9Qapw
Message-ID: <CADvTj4q8a_pGPc3RSV3=9TESdq3xB5fkBA8Du4NE+rEf7HU4Ug@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org, 
 Sen Hastings <sen@hastings.org>, Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767721670; x=1768326470; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RSDaxqlKDfrYZHb//+5Lb0TyfwkUlsxSgYOPP+5Kfuw=;
 b=KHLSZm7rKGtIivfmr+gNyYLVqmf93mxOg5jSl2u54t4kM/+CJJuWJ+HkHKsF0ORXX/
 6a1xdMfmJTgWc++hH7MFhGVPP4uBPrxkSpJ0Mh1wraIoGi+HPRyILYhiNGinE1B1StzQ
 YHV9z7EagXbW3mzQidCisVP+ggqS3kW08h0LZzLLBtLJIJ0hkK7HfLcQX2YZI4OIJ+jV
 hvQvPmI1+82wCeEofC/COFEhdkZHL2GDJzHtJZv2ZmvEfRMOqEX3CyZOQxwxwlLxE8Xu
 izDxKMbuyA9IMLrSrVim+FVA7nxvxRMF4oktKokp7D1WypnaUriOx0gM8NGdwmtSEvCD
 kWMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KHLSZm7r
Subject: Re: [Buildroot] [PATCH] package/systemd: remove several Kernel
 config options
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

T24gVHVlLCBKYW4gNiwgMjAyNiBhdCAyOjQw4oCvQU0gVGhvbWFzIFBldGF6em9uaQo8dGhvbWFz
LnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBKYW1lcywKPgo+IE9uIFRo
dSwgMSBKYW4gMjAyNiAxNTozMDowMSAtMDcwMAo+IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxs
aWFyZDFAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gSU1PIHdlIHNob3VsZCBnZW5lcmFsbHkgZGVm
YXVsdCB0byBlbmFibGluZyB0aGUgcmVjb21tZW5kZWQgb3B0aW9ucwo+ID4gYXMgdGhlcmUgYXJl
IG9mdGVuIGdvb2QgcmVhc29ucyBmb3IgaGF2aW5nIHRob3NlIGVuYWJsZWQuCj4KPiBJJ20gYWZy
YWlkIHRoaXMgaXMgbm90IEJ1aWxkcm9vdCdzIHBvbGljeS4gQnVpbGRyb290J3MgcG9saWN5IGlz
IG1vcmUKPiBhYm91dCBtaW5pbWFsaXNtLiBXZSB3YW50IHRvIGVuYWJsZSB0aGUgcmVhc29uYWJs
eSBtaW5pbXVtIHNldCBvZgo+IHRoaW5ncyBuZWVkZWQgZm9yIHRoaW5ncyB0byB3b3JrLCBidXQg
bm90IGVuYWJsZSBldmVyeXRoaW5nIGZvciBldmVyeQo+IHBvc3NpYmxlIHVzZS1jYXNlLiBUaGlz
IGlzIHdoeSBhbGwgcGFja2FnZXMgYXJlIGJ1aWx0IHdpdGggYWxsIG9wdGlvbmFsCj4gZmVhdHVy
ZXMgZGlzYWJsZWQgYnkgZGVmYXVsdC4KCkluIHByYWN0aWNlIHRoYXQgaXNuJ3QgYWx3YXlzIHRo
ZSBjYXNlIGFzIHdlIG9mdGVuIGJ1aWxkIHBhY2thZ2VzIHdpdGgKYWxsIGZlYXR1cmVzIGVuYWJs
ZWQgYnkgZGVmYXVsdCB0byByZWR1Y2UgdGhlIGFtb3VudCBvZiBzdXBwb3J0ZWQKZmVhdHVyZSBj
b21iaW5hdGlvbnMva2NvbmZpZyBvcHRpb25zLiBXZSBhbHNvIGVuYWJsZSBhIGxvdCBvZiBmZWF0
dXJlcwphdXRvbWF0aWNhbGx5IGJhc2VkIG9uIGRlcGVuZGVuY3kgYXZhaWxhYmlsaXR5IGFzIHdl
bGwgZm9yIHNpbWlsYXIKcmVhc29ucy4KCj4gPiBJbiBnZW5lcmFsIEkgdGhpbmsgd2UgdGVuZCB0
byBkZWZhdWx0IHRvIGVuYWJsaW5nIHJlY29tbWVuZGVkIG9wdGlvbnMKPiA+IGZyb20gcGFja2Fn
ZXMgdW5sZXNzIHRoZXJlIGlzIGEgZ29vZCByZWFzb24gbm90IHRvIGluIG1vc3QgY2FzZXMKPiA+
IGFscmVhZHkuCj4KPiBOb3BlLCB0aGlzIGlzIG5vdCB3aGF0IHdlIHNob3VsZCB0ZW5kIHRvLiBU
aGlzIHN0YXRlbWVudCBnb2VzCj4gY29tcGxldGVseSBiYWNrd2FyZHMgd2l0aCB0aGUgMjArIHll
YXJzIG9mIEJ1aWxkcm9vdCdzIGhpc3RvcnkgYW5kCj4gInBoaWxvc29waHkiLgoKSSBtZWFuLCB3
ZSBoYXZlIGEgaHVnZSBhbW91bnQgb2YgcGFja2FnZXMgdGhhdCBhcmd1YWJseSBkb24ndAphY3R1
YWxseSBmb2xsb3cgdGhpcyBwaGlsb3NvcGh5IGFsbCB0aGF0IHN0cmljdGx5LgoKTXkgdW5kZXJz
dGFuZGluZyB3YXMgdGhhdCBidWlsZHJvb3QgYWxzbyB0cmllcyB0byBmb2xsb3cgdXBzdHJlYW0K
cHJvamVjdCBkZWZhdWx0IHBhY2thZ2luZy9jb25maWd1cmF0aW9uIHJlY29tbWVuZGF0aW9ucyBp
biBnZW5lcmFsCnVubGVzcyB0aGVyZSBpcyBhIGdvb2QgcmVhc29uIHRvIGRpdmVyZ2UuCgo+ID4g
QWxzbyBtYW55IHBhY2thZ2VzIGluY2x1ZGUgc3lzdGVtZCB1bml0IGZpbGVzIGFuZCBpdCB3b3Vs
ZCBvZnRlbgo+ID4gYmUgZGlmZmljdWx0IHRvIHRyYWNrIHdoaWNoIGtlcm5lbCBmZWF0dXJlcyB0
aG9zZSB1bml0IGZpbGVzIGRlcGVuZAo+ID4gb24gYXMgbW9zdCBwYWNrYWdlcyBhcmUgbGlrZWx5
IHRvIGFzc3VtZSB0aGUgc3lzdGVtIGhhcyBhbnkKPiA+IHJlY29tbWVuZGVkIGtlcm5lbCBvcHRp
b25zIGVuYWJsZWQuCj4KPiBCdXQgd2l0aCB0aGF0IHJlYXNvbmluZywgeW91IGNvdWxkIGFsc28g
YmUgImJ1dCBRdCBhcHBsaWNhdGlvbnMgY2FuIHVzZQo+IGV2ZXJ5IHBvc3NpYmxlIGZlYXR1cmUg
aW4gUXQsIHNvIHdoZW4gd2UgYnVpbGQgUXQsIHdlIHNob3VsZCBidWlsZAo+IGV2ZXJ5IHNpbmds
ZSBRdCBtb2R1bGUgdGhhdCBleGlzdHMgb24gZWFydGgiLgoKVGhpcyBpcyBtb3JlIG9mIGEgcHJh
Y3RpY2FsaXR5IGFyZ3VtZW50LCBhIFFUIGFwcGxpY2F0aW9uIG1pc3NpbmcgYQpmZWF0dXJlIHBy
ZXN1bWFibHkgd291bGQgZmFpbCBhdCBidWlsZCB0aW1lIHNvIG1pc3NpbmcgZmVhdHVyZXMgd291
bGQKYmUgbXVjaCBtb3JlIG9idmlvdXMsIHdoaWxlIHN5c3RlbWQgc2VydmljZSBmaWxlcyBtaXNz
aW5nIGZlYXR1cmVzCndpbGwgbGlrZWx5IGJlIG11Y2ggdHJpY2tpZXIgdG8gaWRlbnRpZnkgYW5k
IGNvdWxkIGxlYWQgdG8gdHJpY2t5IHRvIGlkZW50aWZ5CnJ1bnRpbWUgaXNzdWVzLiBUaGVyZSdz
IGFsc28gbGlrZWx5IGEgaHVnZSBkaWZmZXJlbmNlIGluIGRpc2sgc3BhY2UgdXNlZApieSBRVCBh
cHBsaWNhdGlvbiBmZWF0dXJlcyBjb21wYXJlZCB3aXRoIGtlcm5lbCBmZWF0dXJlcy4KCj4gU28g
bm8sIHdlJ3JlIG5vdCBnb2luZyB0byBnbyBkb3duIHRoaXMgcm91dGUuIE91ciB1c2VycyBsaWtl
IEJ1aWxkcm9vdAo+IG1pbmltYWxpc20sIGFuZCB3ZSB3YW50IHRvIGtlZXAgaXQgdGhhdCB3YXku
IE9mIGNvdXJzZSwgdGhlcmUncyBhCj4gYmFsYW5jZSB0byBmaW5kLCBhcyB3ZSB3YW50IGZpbmQg
dG8gcmVhc29uYWJseSB3b3JrIGZpbmUgb3V0IG91dCB0aGUKPiBib3gsIGJ1dCB0aGUgcmlnaHQg
YmFsYW5jZSBpcyBub3QgImVuYWJsaW5nIGV2ZXJ5dGhpbmcgdGhhdCBtaWdodAo+IHBvdGVudGlh
bGx5IGJlIG5lZWRlZCIuCgpJJ20gbm90IGRpc2FncmVlaW5nIHRoYXQgd2Ugc2hvdWxkIGhhdmUg
YSB3YXkgdG8gZGlzYWJsZSB0aGUKZW5hYmxpbmcgb2YgcmVjb21tZW5kZWQgYnV0IG5vdCByZXF1
aXJlZCBrZXJuZWwgZmVhdHVyZXMsIEknbQpqdXN0IHNheWluZyB3ZSBzaG91bGQgc3BsaXQgdGhl
c2UgcmVjb21tZW5kZWQga2NvbmZpZyBvcHRpb25zCnVuZGVyIGEgYnVpbGRyb290IGtjb25maWcg
b3B0aW9uIHRoYXQgd2lsbCBlbmFibGUgdGhlbSB3aGVuIHNlbGVjdGVkLgoKU29tZXRoaW5nIGxp
a2UgYSAiZW5hYmxlIHJlY29tbWVuZGVkIGtlcm5lbCBmZWF0dXJlcyIgaW5zaWRlIHRoZQpzeXN0
ZW1kIENvbmZpZy5pbiB0aGF0IHdvdWxkIGVuYWJsZSBvcHRpb25zIGluIHRoZSBzYW1lIHdheSBh
cwp3ZSBjb25kaXRpb25hbGx5IGVuYWJsZSBrZXJuZWwgZmVhdHVyZXMgZm9yClNZU1RFTURfT09N
RF9MSU5VWF9DT05GSUdfRklYVVBTIGFscmVhZHk6Cmh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJv
b3QvYnVpbGRyb290L2Jsb2IvMjAyNS4xMS9wYWNrYWdlL3N5c3RlbWQvc3lzdGVtZC5tayNMNTM3
LUw1NDAKaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvYmxvYi8yMDI1LjEx
L3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rI0w5MDEKCkkgd291bGQgdGhpbmsgaXQgd291bGQg
bWFrZSBzZW5zZSB0byBlbmFibGUgdGhlIHJlY29tbWVuZGVkCmtlcm5lbCBmZWF0dXJlcyB1c2lu
ZyAiZGVmYXVsdCB5IiBpbiBhIGJ1aWxkcm9vdCBDb25maWcuaW4gYXMgd2VsbApsaWtlIHdlIGRv
IGFscmVhZHkgZm9yIG1hbnkgb3RoZXIgc3lzdGVtZCBmZWF0dXJlcy4KCkkgc2hvdWxkIG5vdGUg
dGhhdCB0aGVyZSBhcmUgYWxyZWFkeSBtYW55IHJlY29tbWVuZGVkIGJ1dCBub3QKcmVxdWlyZWQg
c3lzdGVtZCBmZWF0dXJlcyB3ZSBlbmFibGUgYnkgZGVmYXVsdCBhbHJlYWR5IGZvcgpzaW1pbGFy
IHJlYXNvbnMsIEkgd291bGQgdGhpbmsgZm9sbG93aW5nIHRoaXMgc2FtZSBwYXR0ZXJuIG1ha2Vz
CnNlbnNlIGhlcmUgYXMgd2VsbCBmb3IgdGhlIHJlY29tbWVuZGVkIGtlcm5lbCBmZWF0dXJlczoK
aHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvYmxvYi8yMDI1LjExL3BhY2th
Z2Uvc3lzdGVtZC9Db25maWcuaW4jTDIxOApodHRwczovL2dpdGh1Yi5jb20vYnVpbGRyb290L2J1
aWxkcm9vdC9ibG9iLzIwMjUuMTEvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbiNMMjY4Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290L2Jsb2IvMjAyNS4xMS9wYWNrYWdlL3N5
c3RlbWQvQ29uZmlnLmluI0wyNzcKaHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJv
b3QvYmxvYi8yMDI1LjExL3BhY2thZ2Uvc3lzdGVtZC9Db25maWcuaW4jTDM1MApodHRwczovL2dp
dGh1Yi5jb20vYnVpbGRyb290L2J1aWxkcm9vdC9ibG9iLzIwMjUuMTEvcGFja2FnZS9zeXN0ZW1k
L0NvbmZpZy5pbiNMMzYxCmh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290L2Js
b2IvMjAyNS4xMS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmluI0w0NTgKaHR0cHM6Ly9naXRodWIu
Y29tL2J1aWxkcm9vdC9idWlsZHJvb3QvYmxvYi8yMDI1LjExL3BhY2thZ2Uvc3lzdGVtZC9Db25m
aWcuaW4jTDU0MgpodHRwczovL2dpdGh1Yi5jb20vYnVpbGRyb290L2J1aWxkcm9vdC9ibG9iLzIw
MjUuMTEvcGFja2FnZS9zeXN0ZW1kL0NvbmZpZy5pbiNMNTUyCmh0dHBzOi8vZ2l0aHViLmNvbS9i
dWlsZHJvb3QvYnVpbGRyb290L2Jsb2IvMjAyNS4xMS9wYWNrYWdlL3N5c3RlbWQvQ29uZmlnLmlu
I0w1OTcKCj4gTm9yYmVydDogYXMgSSd2ZSBzdGF0ZWQgaW4gYSBwcmV2aW91cyBlLW1haWwsIEkn
bSBmaW5lIHdpdGggbWVyZ2luZyBhCj4gcGF0Y2ggcmVkdWNpbmcgdGhlIG51bWJlciBvZiBrZXJu
ZWwgb3B0aW9ucyBmb3JjZWZ1bGx5IGVuYWJsZWQgYnkKPiBzeXN0ZW1kLm1rLiBIb3dldmVyLCBJ
J2QgbGlrZToKPgo+IDEuIE91ciBzeXN0ZW1kIHVuaXQgdGVzdHMgdG8gc3RpbGwgd29yayB3aXRo
IHRoaXMgbW9yZSBtaW5pbWFsIHNldCBvZgo+ICAgIG9wdGlvbnMKPgo+IDIuIFRoaXMgbW9yZSBt
aW5pbWFsIHNldCBvZiBvcHRpb25zIHRvIGJlIGJhc2VkIG9uIGdvb2QgcmVhc29uaW5nLCBhbmQK
PiAgICB0aGF0IHJlYXNvbmluZyBzaG91bGQgYmUgZG9jdW1lbnRlZCBpbiBzeXN0ZW1kLm1rLgo+
Cj4gQ291bGQgeW91IGNvb2sgYSBwYXRjaCBpbiB0aGF0IGRpcmVjdGlvbj8gUGxlYXNlIG1ha2Ug
c3VyZSB0byBDYyBtZSBvbgo+IHRoZSBwYXRjaC4KPgo+IFRoYW5rcyBhIGxvdCEKPgo+IFRob21h
cwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVt
YmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6
Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
