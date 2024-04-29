Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AAAC4345F
	for <buildroot@archiver.kernel.org>; Mon, 29 Apr 2024 07:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00B8140524;
	Mon, 29 Apr 2024 07:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SCAFrtE6q0h; Mon, 29 Apr 2024 07:23:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB8B1401A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB8B1401A1;
	Mon, 29 Apr 2024 07:23:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 857241BF3E3
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 07:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7E177405F3
 for <buildroot@lists.busybox.net>; Mon, 29 Apr 2024 07:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDc0pBFkBGd9 for <buildroot@lists.busybox.net>;
 Mon, 29 Apr 2024 07:22:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E7573405E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7573405E7
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E7573405E7
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 07:22:57 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2df9af57b5eso28087211fa.2
 for <buildroot@buildroot.org>; Mon, 29 Apr 2024 00:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714375375; x=1714980175;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=spZE1Upv313Cuox6FlLFPAgfS9BDuZdOx/dviHDZrQw=;
 b=eHlCa2mEpjkmhMMwkERKHDw2qX+xFtyY63ScBlPmcxdOGxSWVcy9mbqgIXMP9N5E9J
 uMfpN7wLIJ/9CdwHtR9lvhrMTyIBZ46B77x7nwerPdw20DGqLfSnwQJv2EKDlnp1Q1Fn
 CsX+9Zbvpx9DdgyWR04Uf5HsobqE7TNrlQN+uhCUU2yOJBNm4jbY63y6k7DFjEDS/2Wj
 PAHt4M0Zavq1GHzYFhqbHTl5g1tsdrKB/yG19X/RjXZ1PZLlk/uvsYhAO5ENYoCu70B2
 9B0geGYUXcnKeS6L3OhIqFb1zRfaNOtgdhNWz2++eHmTZjPXad6M4TR8x7jjRicNs2M8
 cGyA==
X-Gm-Message-State: AOJu0Ywz9URvZ06CxU8kRnJyl+OtZkmskixqefqPtiH0/zqsVEGU7Ewt
 gFLF2f2l7Noj2l9sMzRAeSJKyn3ohH0/mU+RSbupqapGiONHxnW/DXcARVfqkfD/51J8glY49SX
 6Eoa0LC4xzHCm9TWE5BpnrZjSBa/gG9hiG5M=
X-Google-Smtp-Source: AGHT+IEclXsnSRQyldNufXUw9IvMZ+aO1dnql7kPt8gLJnWoRt9kQntwMfruqNGdxT0R+OGvR+RHTqP3iAz3ECgJLfs=
X-Received: by 2002:a05:651c:11c9:b0:2da:a73:4f29 with SMTP id
 z9-20020a05651c11c900b002da0a734f29mr7798270ljo.30.1714375374759; Mon, 29 Apr
 2024 00:22:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240324205324.491751-1-fontaine.fabrice@gmail.com>
 <87frv5eo0j.fsf@dell.be.48ers.dk>
In-Reply-To: <87frv5eo0j.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Apr 2024 09:22:42 +0200
Message-ID: <CAPi7W81qgQZGkgq7ZifoSrVqEGgUWncTU5wyc2uGRgaTczB55Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714375375; x=1714980175; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=spZE1Upv313Cuox6FlLFPAgfS9BDuZdOx/dviHDZrQw=;
 b=FYTE7o1gVO5+27lD1WzFDAxelkFurEQR5aYWyR5NK039XOk8ChApLaT42Bksv5e4Mz
 5qDZqEa4uye9rqA55s7rcBkWdnwQ9sNYN/8dyFYIsEw4hVFpdeCuMgWbj3wDwx7O2aGG
 VBtXraBuhl4ljh5ojMimtzreC0HbjcgH1SAUx/nkyhPUYKeBBkxb/FHUWnq0i2P8Pnz0
 IKnrZlKZ5cbkKi3qy/xIpOhJlpcCIY3TLnbBlaERuYv9Xa9sA4Gww1E9Fvk76ut4mkxz
 5owz+25r+zl420KFHC14V7FUFzdtOMEFNt9P+/i7fKLZrtWNYFgMc48p/yjWSwU+6JVY
 QYeg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=FYTE7o1g
Subject: Re: [Buildroot] [PATCH 1/1] package/thermald: bump to version 2.5.6
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSBkaW0uIDI4IGF2ci4gMjAyNCDDoCAxMzoxNSwgUGV0ZXIgS29yc2dh
YXJkIDxwZXRlckBrb3JzZ2FhcmQuY29tPiBhIMOpY3JpdCA6Cj4KPiA+Pj4+PiAiRmFicmljZSIg
PT0gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyaXRlczoK
Pgo+ICA+IGh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC90aGVybWFsX2RhZW1vbi9ibG9iL3YyLjUu
Ni9SRUFETUUudHh0Cj4gID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFp
bmUuZmFicmljZUBnbWFpbC5jb20+Cj4KPiBUaGlzIG1lbnRpb25zIHRoYXQgaXQgbm93IHVzZXMg
R0RCdXMgaW5zdGVhZCBvZiBnbGliLWRidXMgYnkgZGVmYXVsdAo+IG5vdzoKPgo+IGh0dHBzOi8v
Z2l0aHViLmNvbS9pbnRlbC90aGVybWFsX2RhZW1vbi9jb21taXQvOTJhODQ1OTU4MmM4MjYzNDNi
YTIyZTNkYzhmYTVlNTYzYWUzZjlhYwo+Cj4gRG8gd2UgdGhlbiBzdGlsbCBuZWVkIHRoZSBkYnVz
LWdsaWIgZGVwZW5kZW5jeT8KClllcywgZGJ1cy1nbGliIGlzIHN0aWxsIG5lZWRlZDoKaHR0cHM6
Ly9naXRodWIuY29tL2ludGVsL3RoZXJtYWxfZGFlbW9uL2Jsb2IvZWE4Yjc3M2Y3NjY0MWE3YTQ5
ZDY1ODQ2NjllMTczNzFjMjJhZDAzZS9jb25maWd1cmUuYWMjTDcxCgo+Cj4gPiAtLS0KPiAgPiAg
cGFja2FnZS90aGVybWFsZC90aGVybWFsZC5oYXNoIHwgMiArLQo+ICA+ICBwYWNrYWdlL3RoZXJt
YWxkL3RoZXJtYWxkLm1rICAgfCAyICstCj4gID4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGhlcm1h
bGQvdGhlcm1hbGQuaGFzaCBiL3BhY2thZ2UvdGhlcm1hbGQvdGhlcm1hbGQuaGFzaAo+ICA+IGlu
ZGV4IDk2OTM4MTNjYTkuLmZmZjVhZTYyODQgMTAwNjQ0Cj4gID4gLS0tIGEvcGFja2FnZS90aGVy
bWFsZC90aGVybWFsZC5oYXNoCj4gID4gKysrIGIvcGFja2FnZS90aGVybWFsZC90aGVybWFsZC5o
YXNoCj4gID4gQEAgLTEsMyArMSwzIEBACj4gID4gICMgTG9jYWxseSBjb21wdXRlZDoKPiAgPiAt
c2hhMjU2ICA3NWMxNjVkZjQ1YjNkMDljOTA0ZDMxNGM4YzE5Nzg5MTU4ZTk1MzhmNDZlM2QyYjYw
NjQ1N2RjNjMxZWIzYWY1ICB0aGVybWFsZC0yLjUuMS50YXIuZ3oKPiAgPiArc2hhMjU2ICBlNWE0
NTI2MjRmMTMzZDcxZjRhZmYwYmQwYzhmODI1ODM5OWE1YWUxYTdkNWFlYTE3N2ZhNmE2ZTMzZGFk
MWZkICB0aGVybWFsZC0yLjUuNi50YXIuZ3oKPiAgPiAgc2hhMjU2ICBlOThiZThiYzQ4MmUwMzhh
MTRiZmJjMDFjYWY4MDBiYmQwMDI0ZmZmMjc1ZWYxNGNkOTk5ZGI2NTYwMjU0YThkICBDT1BZSU5H
Cj4gID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGhlcm1hbGQvdGhlcm1hbGQubWsgYi9wYWNrYWdl
L3RoZXJtYWxkL3RoZXJtYWxkLm1rCj4gID4gaW5kZXggZmQwMjQ2NzQ1Zi4uOWZhYTQ3NjgzYiAx
MDA2NDQKPiAgPiAtLS0gYS9wYWNrYWdlL3RoZXJtYWxkL3RoZXJtYWxkLm1rCj4gID4gKysrIGIv
cGFja2FnZS90aGVybWFsZC90aGVybWFsZC5tawo+ICA+IEBAIC00LDcgKzQsNyBAQAo+ICA+ICAj
Cj4gID4gICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4KPiAgPiAtVEhFUk1BTERfVkVSU0lPTiA9
IDIuNS4xCj4gID4gK1RIRVJNQUxEX1ZFUlNJT04gPSAyLjUuNgo+ICA+ICBUSEVSTUFMRF9TSVRF
ID0gJChjYWxsIGdpdGh1YixpbnRlbCx0aGVybWFsX2RhZW1vbix2JChUSEVSTUFMRF9WRVJTSU9O
KSkKPiAgPiAgIyBmZXRjaGVkIGZyb20gR2l0aHViLCB3aXRoIG5vIGNvbmZpZ3VyZSBzY3JpcHQK
PiAgPiAgVEhFUk1BTERfQVVUT1JFQ09ORiA9IFlFUwo+ICA+IC0tCj4KPiAgPiAyLjQzLjAKPgo+
ICA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gID4g
YnVpbGRyb290IG1haWxpbmcgbGlzdAo+ICA+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gID4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4K
Pgo+IC0tCj4gQnllLCBQZXRlciBLb3JzZ2FhcmQKCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
