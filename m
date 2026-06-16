Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5A9CD98DE
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 00:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D298840866;
	Tue, 16 Jun 2026 00:19:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gbf2-dklP9Je; Tue, 16 Jun 2026 00:19:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AC164073C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781569147;
	bh=zMBruzgkfj62yfWhj44JaO/W2mEX41jlXCQaBvPqUJo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DBRYKOIv5dBzoyBX+TD05+NNo03DV2+rBEK9Va+aEUjOzohfoXumd4+Eu6mtqhkxF
	 pSlxFV/ehj3kLDL/pjjMwJ9mtLfqKosa0WFAbsM+Nldrs2d24gpmkulsAZuap7mjob
	 n60VDufXlvAdS2ZzApw5Dj6etvrmDwG1ra7ecTTAprbLqxORK8AIDVyw8wdNPY3T1j
	 tYjlZAjqxc3dr5v4aOd031IxBLGLjqGJF1iGFhp66yuBn6Q6orULo5TG1a3/FbHCp/
	 WT0bKbNVCY5euAJEsDDIC9j53rO8f//vJJYK5wpKhy3lVu0PeAX3GurvthgRNVK4WQ
	 51pS34tyZkhlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AC164073C;
	Tue, 16 Jun 2026 00:19:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A4452B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 00:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BD5B4073B
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 00:19:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sXilD-vaB16r for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 00:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10B2A40641
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B2A40641
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com
 [IPv6:2607:f8b0:4864:20::92c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10B2A40641
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 00:19:04 +0000 (UTC)
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-9638f7e9896so2776962241.1
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 17:19:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781569144; cv=none;
 d=google.com; s=arc-20240605;
 b=lZVGJkh9Ws7eCuLqRt60goLMkpC+bNUkt+UUiAgTrMVMKKmjGx8UXxGDFPpGia/Zn2
 42Ns+/9UT6WUGXbWW32AW9GCuhcjvC9jzoQhktg4T6avd0ofUvWVXh7yKreig7mkiY8l
 eqVNiCH4ef8ivuZs34A0f0Tn+XZ+m9SyG/ZMlI5UzE0XMPztMQQhzMNk0i1VYLw6i/ir
 ncac0sFqqyh7uf26fPjM8UtStY65REcM9agkuGiCR3dc1udCvHCyOJWLy5jDTHYd7MrU
 /YmQmu8X/rXwX44FiTrStRZK62nzPX9IOvZT68M1AKX1FOeLJLM18813TKI7W1psEHZ8
 D1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=QER6244uC03AzFLfpE7vLvSUGCtoPwkSPrEyzNbTghU=;
 fh=+f3U4CSVE/IxKOJklstpZrq+i19ILBslJ/jGhl6HbT4=;
 b=HPdkUfXlBqceIQaefUyjJfHHA003aExjDSpT8TUZxunAYQ/WQkcvM9w6OoqOvvmHoJ
 KwLsTt2k/DKHLQhZGVxELPjDvuZkUkO/vgRiNGQP3mqKEIjw4ZM+5Qnc4nK81P44eDuL
 j5aS2Vy2Ca0kS3EgjQFsTiYZVa3LkD9/xiLXEqJh6MvG70XNowKq1/HJIshcCnxjeP1u
 LfQcJ7BHBKGBT2RD0Vn14DieC3LBvXszpmAyvC5tATkycPv1TDhdEelEk8puXzU+B9IH
 rQsf8HIFCluYYLyUHwFo8AtnYbtJp72sPeSOG5UBgvvVH45eLD+5EVb5a8Q5ySzJcAvs
 fV3A==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781569144; x=1782173944;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=QER6244uC03AzFLfpE7vLvSUGCtoPwkSPrEyzNbTghU=;
 b=j5lqOM0kugVep3gsBHil24rz/21WG5vcQyekN0v+6dd7Xo6a5lF7AMZXEdJOLXircU
 4CCYDf5L37fj5B5mrvtayPenwzBvJyXGylNDzZM74w1NF+PObmTqTOJxVk0cRCsGidW7
 25rQReaNS9ktpmn/EvcJWz4JPIzFiTYRezfVbW6bkV8cZNTrWfIexePcRpncGsh7RLxu
 X4mjysv7v2Ppl1Ncelvayqpf7l6p9IeqYT1M4y0LN0eAgZuvMfV8QgrLjmwFbmIB/gzJ
 2pLDpppqDZup0nf8jQu5EsNewcGyHFPQS3LmnxBViy0+nniM9HqpNtc+XuhRMEsr8WVQ
 fxkg==
X-Gm-Message-State: AOJu0Yyk0EYpr8tHWgoJhIrX05kei0n0S+wukdWQYDmB6kR1o4GLqviN
 TbgFFP3RQp7akIVYDTBdP7JxiTVjWNbn2G7mM7uHVblcLrYQ/Mp4ZxlSyiwdIECFjnLJdVqdyt8
 Xj44X+evFv17fGzh4w1rts+2BBGDnVTQ8MM01HJ8=
X-Gm-Gg: Acq92OGu/VWtwFPMgTEG5VArSEN+W5I/Eg5+yLa/zqplKdyzjZSoSqdyKoZrTu6rYO6
 6/tDcm7Ix8ptbi/SiQ5KZ4Ukz+REoRr52ccac8WcbME8IIxF0Z3qEjGzAK5TeSMbqtZg/UwHB58
 zbYpbqi5dyZg+GR+h9yJfsSHuCUUNQMYRwqGvbf6u8FDF5PdYv/eCbSGu9/m3GLDHqI+gjsvt6D
 Y1Z1hpM3xN9JvYlkFf8TEZ4BUnxUY4p/KVhaYtg7UEz5vfOzDdDOYMUPxOzWtj/vorL7ltN4Lmo
 kHwNwmsdr8GlHprXq6WyC3LE/gJjzZDe2OP7+plT+trAGIFlTE8cOESx4rVxhGo1olG2hJrXgXZ
 NLlQr1Z5p4XRv+6w/NIdR0i0m
X-Received: by 2002:a05:6102:dd1:b0:650:94b2:b214 with SMTP id
 ada2fe7eead31-722cb7f336emr735647137.12.1781569143429; Mon, 15 Jun 2026
 17:19:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260529213651.548156-1-buildroot@bubu1.eu>
 <CADvTj4rJmsU8Q235UNjQT0Pu8sm4T7AomFJa7tqHbHuxqWs4aA@mail.gmail.com>
 <fb186248-7df4-4f73-94a2-c9b2ebefa843@bubu1.eu>
In-Reply-To: <fb186248-7df4-4f73-94a2-c9b2ebefa843@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 15 Jun 2026 18:18:51 -0600
X-Gm-Features: AVVi8CeS0FTEVJ0p7YySFf9zxSFMyExpgc5_uCSSAZgxLykTIF9grb4OLr-FlIU
Message-ID: <CADvTj4qxtFd_KOf86id=94-2378qcSLC6Lo9_KuJScnjLh9kRw@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781569144; x=1782173944; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QER6244uC03AzFLfpE7vLvSUGCtoPwkSPrEyzNbTghU=;
 b=P38Knu/Yi5mKn99tRKA9GNIFedI0Bq8PlvX1AsVP55L6elCPNFvmecl+EZN/kTxN2q
 Z38B8rvHnBSmRHNEns7djMSA6En4ET45OAwmyRUAqQGl+gTMgqyheKsjNozApRu393gu
 YztbB+YRJJRNSe/U97G5Xu4mKG8Tpk3Kp2JcvZwezlRlaf6FGOyrhE3bnBkz6rwaEHDO
 WeVq8vmi8Y0K/4/LQGDf6blMOW2cXTv38rpno4wH2e5qK/yRpxVKUqlTI7Fzb0djK9Q/
 Pf34Sh3YgPJ0TlduZr9R6tkXwqaXjLjodqDbdja8G9wlk/5rjR9NmpDBUJ59aP89M6MD
 fNKw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=P38Knu/Y
Subject: Re: [Buildroot] [next 1/2] package/pkg-download: add pypi helper
 for downloading packages from pypi.org
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

T24gTW9uLCBKdW4gMTUsIDIwMjYgYXQgMjoyNuKAr1BNIE1hcmN1cyBIb2ZmbWFubiA8YnVpbGRy
b290QGJ1YnUxLmV1PiB3cm90ZToKPgo+IEhpIEphbWVzLAo+Cj4gT24gNS8zMS8yNiAyMzoyNywg
SmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4gPiBPbiBGcmksIE1heSAyOSwgMjAyNiBhdCAzOjM34oCv
UE0gTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3QKPiA+IDxidWlsZHJvb3RAYnVpbGRyb290
Lm9yZz4gd3JvdGU6Cj4gPj4KPiA+PiBQeXBpIHByb3ZpZGVzIHBhY2thZ2VzIHVuZGVyIGEgc3Rh
YmxlIHVybCAoaW5zdGVhZCBvZiB0aGUgaGFzaCBiYXNlZCBvbmUKPiA+PiB0aGF0IGNoYW5nZXMg
ZXZlcnkgdmVyc2lvbikgYnV0IHdlIGRvbid0IGN1cnJlbnRseSBtYWtlIHVzZSBvZiB0aGF0IGEg
bG90Lgo+ID4KPiA+IE9mZmljaWFsIGd1aWRhbmNlIGFwcGVhcnMgdG8gcmVjb21tZW5kIHVzaW5n
IHRoZSBoYXNoIGJhc2VkIHVybCdzCj4gPiByZXR1cm5lZCBieSB0aGUgQVBJJ3M6IGh0dHBzOi8v
ZG9jcy5weXBpLm9yZy9hcGkvI29mZmljaWFsLWd1aWRhbmNlCj4gPgo+ID4gIEZyb20gbXkgcmVh
ZGluZyBwcmVkaWN0YWJsZSB1cmxzIGFyZSBtb3JlIG9mIGEgZmFsbGJhY2sgb3B0aW9uIGJ1dCBh
cmUKPiA+IG9ubHkgcmVjb21tZW5kZWQgaWYgdXNpbmcgdGhlIGhhc2ggYmFzZWQgdXJscyBpcyBu
b3QgcHJhY3RpY2FsL3Bvc3NpYmxlOgo+ID4gaHR0cHM6Ly9kb2NzLnB5cGkub3JnL2FwaS8jcHJl
ZGljdGFibGUtdXJscwo+Cj4gWWVzLCB1bmRlcnN0b29kLiBJJ2QgYXJndWUgdGhhdCBub3QgdXNp
bmcgdGhlIGhhc2ggYmFzZWQgdXJsIGlzIGluZGVlZAo+IHF1aXRlIGEgYml0IG1vcmUgcHJhY3Rp
Y2FsIGZvciB1cy4gOikKPiBCdXQgdGhlcmUgaXMgYW5vdGhlciBvcHRpb24gcG9zc2libHksIHNl
ZSBiZWxvdy4KPgo+ID4KPiA+ICBGcm9tIG15IHVuZGVyc3RhbmRpbmcgdXNpbmcgcHJlZGljdGFi
bGUgdXJscyBpbnRyb2R1Y2VzIGEgZGVwZW5kZW5jeQo+ID4gb24gdGhlIGNvbnZleW9yIHNlcnZp
Y2UgYW5kIGludHJvZHVjZXMgYW4gYWRkaXRpb25hbCByZXF1ZXN0IGR1ZSB0bwo+ID4gaGF2aW5n
IHRvIGZvbGxvdyBhIDMwMiByZWRpcmVjdCBzaW5jZSB0aGUgc3RhYmxlIHVybCBpcyBub3QgdGhl
IHJlYWwgQ0ROIHVybC4KPgo+IFllcywgdGhhdCdzIG5laXRoZXIgIm5pY2UiIG5vdCAiaWRlYWwi
IGJ1dCBhbHNvIG5vdCB0aGF0IG11Y2ggb2YgYQo+IHByb2JsZW0gaW4gcHJhY3RpY2UgSU1PLgo+
Cj4gPgo+ID4+IEludHJvZHVjZSBhIHB5cGkgaGVscGVyIGZ1bmN0aW9uIGFuYWxvdWdvdXMgdG8g
dGhlIGdpdGh1YiBhbmQgZ2l0bGFiCj4gPj4gaGVscGVycyB0byBtYWtlIGl0IGVhc2llciB0byBk
b3dubG9hZCBwYWNrYWdlcyBmcm9tIHB5cGkgdXNpbmcgdGhpcyB1cmwKPiA+PiBzY2hlbWUuCj4g
Pgo+ID4gVGhlcmUgYXJlIG90aGVyIGRvd25zaWRlcyB0byB0aGUgY29udmV5b3Igc2VydmljZSBz
dWNoIGFzIGxlc3Mgc3RhYmlsaXR5Cj4gPiBndWFyYW50ZWVzIGZvciBkb3dubG9hZCBhdmFpbGFi
aWxpdHkgZHVlIHRvIGl0IGVzc2VudGlhbGx5IGJlaW5nIGEgcHlwaSBBUEkKPiA+IGRlcGVuZGVu
dCBzZXJ2aWNlIGZyb20gbXkgdW5kZXJzdGFuZGluZy4KPiA+Cj4gPiBGb3IgZXhhbXBsZSBmb3Ig
cHltYXpkYS0wLjMuMTEudGFyLmd6IHRoZSBub3JtYWwgaGFzaCBiYXNlZCBDRE4gdXJsCj4gPiB3
b3JrczoKPiA+IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9jOC85OC82
ZGE3NWVhOTI2ZTRiMzU2NjgyM2ZjZjE2NDExNGI5MzJkOWM0ZGU5MTVlMTQxMmYxZTBmYTAxNmFi
NTgvcHltYXpkYS0wLjMuMTEudGFyLmd6Cj4gPgo+ID4gVGhlIGVxdWl2YWxlbnQgcHJlZGljdGFi
bGUgdXJsIGdpdmVzIGEgNDA0IGR1ZSB0byB0aGUgcGFja2FnZSBiZWluZwo+ID4gdW5hdmFpbGFi
bGUgZnJvbSB0aGUgY29udmV5b3Igc2VydmljZSBkdWUgdG8gdGhlIHBhY2thZ2UgYXV0aG9yIGRl
bGV0aW5nCj4gPiB0aGUgcGFja2FnZSBhdCBzb21lIHBvaW50KHdoaWNoIG1ha2VzIGl0IHVuc2Vh
cmNoYWJsZSBidXQga2VlcHMgdGhlCj4gPiBzb3VyY2VzIGl0c2VsZiBhdmFpbGFibGUgaW4gdGhl
IENETik6Cj4KPiA+IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9zb3Vy
Y2UvcC9weW1hemRhL3B5bWF6ZGEtMC4zLjExLnRhci5nego+Cj4gSW50ZXJlc3RpbmcsIEkgZGlk
bid0IGtub3cgcHlwaSBiZWhhdmVkIGxpa2UgdGhhdC4gSSBzdXBwb3NlIHRoYXQgbWlnaHQKPiBi
ZSBhIHNvbWV3aGF0IHN0cm9uZyByZWFzb24gdG8ga2VlcCBwcmVmZXJyaW5nIHRoZSBoYXNoIGJh
c2VkIHVybHMuCj4gVGhvdWdoIHdlJ2xsIGFsc28gc3RpbGwgaGF2ZSBzb3VyY2VzLmJ1aWxkcm9v
dC5vcmcsIHdoaWNoIEkgZ3Vlc3MgaW4KPiB0aGlzIGNhc2UgYWN0cyBpbiBhIHNpbWlsYXIgbWFu
bmVyIHRvIGtlZXAgdGhlIHNvdXJjZXMgYXZhaWxhYmxlIGV2ZW4gaWYKPiB1cHN0cmVhbSBkZWxl
dGVkIHRoZSBwcm9qZWN0Lgo+Cj4gPgo+ID4gRm9yIGJ1aWxkcm9vdCBJIHRoaW5rIGl0IG1ha2Vz
IHNlbnNlIHRvIHVzZSB0aGUgbW9yZSBzdGFibGUgaGFzaCBiYXNlZAo+ID4gQ0ROIHVybCdzIGFz
IHRob3NlIHNob3VsZCBiZSB1bmFmZmVjdGVkIGJ5IHByb2plY3QvcHlwaSBwYWNrYWdlIGRlbGV0
aW9uCj4gPiBhbmQgYXZvaWQgYW4gdW5uZWNlc3NhcnkgcmVkaXJlY3QgYXMgd2VsbCBhcyBiZWlu
ZyB0aGUgcmVjb21tZW5kZWQgdXJsCj4gPiB0byB1c2UgYnkgcHlwaS4KPgo+IFRoZSByZWFzb24g
Zm9yIHdvcmtpbmcgb24gdGhpcyBpcyB0aGF0ICpub3QqIGhhdmluZyB0aGlzIGV2ZXIgY2hhbmdp
bmcKPiBoYXNoIGJhc2VkIHBhY2thZ2UgdXJsIGluIHRoZSAubWsgZmlsZSBzaWduaWZpY2FudGx5
IGxlc3NlbnMgdGhlCj4gYW5ub3lhbmNlIG9mIHVwZGF0aW5nIChhbmQgYmFja3BvcnRpbmcgdXBk
YXRlcyEpIHB5dGhvbiBwYWNrYWdlcywgc28gSQo+IHRoaW5rIHdlIHNob3VsZCBzdGlsbCBzdHJp
dmUgZm9yIHRoYXQuCgpXZSBkbyBoYXZlIHV0aWxzL3NjYW5weXBpIGF0IGxlYXN0IHRvIG1ha2Ug
dGhhdCBzaW1wbGVyLiBJIGhhdmUgc29tZSBwYXRjaGVzCmltcHJvdmluZyB0aGF0IHNjcmlwdCB0
aGF0IGFyZSBzdGlsbCBwZW5kaW5nLgoKPiBOb3cgaWYgd2UgaW50cm9kdWNlIHRoZSBibGFjazJi
LTI1NiBoYXNoIG1ldGhvZCB0byBidWlsZHJvb3QsIHdlIGNhbgo+IG1vdmUgdGhlIChleGlzdGlu
ZyBhbmQgbmV3KSBoYXNoZXMgdG8gdGhlIC5oYXNoIGZpbGUgYW5kIGluc3RydWN0IHRoZQo+IHB5
cGkgZG93bmxvYWQgaGVscGVyIHRvIHVzZSB0aGlzIGhhc2ggZm9yIGNvbnN0cnVjdGluZyB0aGUg
ZG93bmxvYWQgVVJMLgo+IEFuZCBhcyBvdGhlcnMgaGF2ZSBhbHJlYWR5IG5vdGVkIGluIHRoZSBj
b21tZW50cyBoZXJlLCB0aGlzIGRvd25sb2FkCj4gaGVscGVyIGNhbiBiZSB0aGUgZGVmYXVsdCBm
b3IgcHl0aG9uIGJhc2VkIHBhY2thZ2VzIGlmIHlvdSBkb24ndCBzcGVjaWZ5Cj4gYW55dGhpbmcg
ZWxzZS4gVGhvdWdodHM/CgpIbW0sIHllYWgsIHRoYXQgY291bGQgd29yayBwb3RlbnRpYWxseSwg
cHlwaSBqc29uIGRvZXMgbm93IHNlZW0gdG8KaW5jbHVkZSBhIGJsYWtlMmJfMjU2IGhhc2ggYXMg
d2VsbC4gTGV0IG1lIHNlZSBpZiBJIGNhbiBtYWtlIHRoYXQgd29yay4KCj4KPiA+Wy4uLl0KPgo+
IEJlc3QsCj4gTWFyY3VzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
