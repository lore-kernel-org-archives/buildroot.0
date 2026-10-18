Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C452DCCF2C9
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82CA560714;
	Sun, 18 Oct 2026 20:57:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRybMhhSVvYp; Sun, 18 Oct 2026 20:57:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 09B2560622
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792357052;
	b=eFIr7Ux1mKJi5sliN+QWytMgbT8cWFoD9J7EH2ieEKT/YDw16GwOdnuZsdERX8kuZgHo
	 DiwDgX2l+U8mt3R12H0pmZnF1Ub58f1zx1zQ/YvU1GlKAEa+0JOxYN27yTwrVWpcpJa1L
	 UfGESJrEA0qJ55KQgAMDwP7f6pPtMkzffUB5Pb2OmFHg3ewiM5tOFXlclMk6T1HNGvUYk
	 vnvwfcGVttwCyYkuVpJGTvrWkuj+ImtdMzKB6HkOYGABLM0joY/Nrqmubp2wJHlkHJfSs
	 LXEaMjFERFzcnBkuMdEdefyug+Jc5gSz34zDphM2vXWQiqt3GAcNMdiAfeyCqae7T0w==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792357052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=Ub/gzTshNCCCts5oTr43Lpulv7t+w1XP1sUnBcbs0H8=;
	b=ot681wqVKLYsAhZJhvNXE3HIN4eIapGug/fWae2KsVlGuYx8dF53ZiDw1vFa9fRjgcpp
	 pORmCY/oZpRlfkoNqwhBgmMGO8q9iCl2VyhUKeaKq8M8FcSWT5PXp3ROFmkDoJyhuOprs
	 J4MwkrBXPleLkHjH5F6h8zH8QST/7BHRSLE2MGf33fcAD9x5vdL5fxgdKGI9JJnln8/da
	 C0jFtqxcEXc2f/AFiZjBi5iBvIfRHlsQ7w9GuLepOlR8lNQm2PM677jaq8xsGVJbggmBb
	 D1JF3vMpZvuEanu2fkE2BqICOwfBHCfEkNuGEwxjBOrFaJoTQK71UUK5TxJFXwchaIA==
ARC-Authentication-Results: i=3; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792357052;
	bh=Ub/gzTshNCCCts5oTr43Lpulv7t+w1XP1sUnBcbs0H8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b400LgIEQTRlww/7mFI5YTdpBQRrmfQbOdCsqVYBKo5TLgE+xklRyH5xhPU0klJib
	 egiMW0F/pNmIErcTxyOixUHrb5zs6ibmPQSuIVkdhiPHV0NrunQRWnnVN+KsV4XsSQ
	 jHdWij189EzXqopp+OW5HteI+sF5Bi2yZUhAlVQF4m1MWheoQZV3siFRmTd1P4qXyg
	 qQrfWif18o27iPzGQ3rxTyTapXGnu+4uLnIhyIfE951xK3H/l1/v//8DflFuhESmbD
	 cZAjsrODPfwTg0SxGtPzg1iHlIwwdFgRvt8wWtR1UTVM7CUrVPjiSfPsosSmsov7I3
	 VRhD0usWjFqHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09B2560622;
	Sun, 18 Oct 2026 20:57:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 636221AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60C5D403EB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:57:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KoQH-c1QInml for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:57:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 53C8F40381
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::1336"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792357049;
 b=lJ0sCHjV97q+rxyRZm0QilwEdKTAgHOXrq5ESIxaHjEEnYUF2vaUI+bTm/4oEd1H+KQz
 UscpRukRmNxCyfFPsP6viipsniQAa7O3azGrjirsPHWl2T5XCrx9LkQtQimFwADcf16AN
 tfm2CWEqCv09hwikdYuq/1LmhAx5xrLt2CjL4kaHlNyf+6PrJYz3eO0wvYs/z+fIFaKJo
 Y32fx2YU+zph3qyN9mQF095kZvl6jpGUB/6Rhc1z0JonNyhs2rblpytod0uY6rzYXv9oj
 oRTAa+XBSXUxIqDT0d2uSImJA6HZugek+w7iMz47nzBZUG5RzYl6oNQi1dwz4kVRJ5A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792357049;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=abfjCbJqlvml3SbZ28yN/7G5JTY1yUDZgnvPGRAd75o=;
 b=W3CtIoE5wtWmoZshhIIX/0CRtfdNNZslIJeFRQVXFqiU5BVv46SAjCaBMf3OQQhQt+if
 /K65bCNWNxJNCQM7lkwDuKeUaMspSrktAd4JffGQO26VJVBN1/yx04IOhdbDoGTojPVnc
 wIIlTKDe4qJI3PkPA0YkzJ2s9ANfn9Dx30ZGGgxnwtxriuQ+VrLuLngpbiN8p8DTuj119
 +/lwMFz0ZRPVcxXWTeCBbRQZJBaSRQ1WVB11hJw4EGuH6aF7w9XOaivSm5poC/FaqASR7
 QtVWBwzrfOHK62BuNvpUsAzJDuO+yczu+IeTe56JOYS18P9XOgEg/HUg/25Vk2xkaMw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=none header.from=j-ernberg.se;
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=QsenHym8; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::1336"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1336; helo=mail-dy1-x1336.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=QsenHym8
Received: from mail-dy1-x1336.google.com (mail-dy1-x1336.google.com
 [IPv6:2607:f8b0:4864:20::1336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 53C8F40381
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:57:27 +0000 (UTC)
Received: by mail-dy1-x1336.google.com with SMTP id
 5a478bee46e88-35c76e9614aso2775203eec.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 13:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792357047; cv=none;
 d=google.com; s=arc-20260327;
 b=DkjERO7SL33LCXJnyozCYcSc5iScQK66GTbteX7EJlIl6k3liSC4GlVBoiM7f7q5sb
 bYhwDjS1U0Onw767ZAeZxIGJHDV4kPQ4zM+6H5LMS54PTpUoP1YF9JCq9Y2NwGq3JCzs
 mwZ6ncqJIx/+gafRNVMzpbuUchigBjevWV1k3SNd80ckCW0+rzyrQpXFlkg0bY9bwkLv
 rYZs45OlZsl6BSqzaclyaA8PVRR63r/9B0F0VM5dg7Kgbj2b1dmX+YE86ze8GjueMF7z
 TldIKSO13F1sL8hOd8qi9O9QOxlB7SdfFiPAnJcFjwVmhYrtivG9QHM3f1ZsHIKOT11q
 BPcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=abfjCbJqlvml3SbZ28yN/7G5JTY1yUDZgnvPGRAd75o=;
 fh=jaqQty8leHZQax8xILePR2yIMzQ9JJDT3p9KlhjTg84=;
 b=RSg2S10naHGyr2upoh+qhia/+wpdQ9mMWHTsaVhkTtpJuv+e80FyIXaRq8OFfvKi4X
 zvwGiA5NVWYkmZmEUSnV/ixy6usGzgtmxC0AMXZo/9mEixSk8RGN9ywMedM8Qckxeczf
 k4hs9co+lPckk80O6crGdkIp0NXD7NMadVKCWftEZ2/sI2mztRGB2D7KxIVKOjXuOZuk
 JE91LEh1qeGKZNuVWb64xqfGdDkKYUJiVm+XwF0YbkEw0b634ZDjHO8KpXC/Kapnlpdl
 nWonyQjDCWP06QgD2a2Cb7xGQrbmoFdrevnpvAe1A2fSB7XraPr6NuUsMo0PSq5m5ueF
 JdFw==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1792357047; x=1792961847;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=abfjCbJqlvml3SbZ28yN/7G5JTY1yUDZgnvPGRAd75o=;
 b=QsenHym8ZyTxox+XdKWNlDPBOlPsVzxrUMrDgzOkyBAT7iFyZ5qtGHk9V6pqLmvShD
 5v2d0TnfvoIwUsW1L+DX5RRmJCVABaODHf2IW4GmK8LbjtmNohUntMT9W8yU5bA3T1rC
 /wCpad4+WWKKIkZW1AaCZsOXUBSyPVp5venAUdCxUEwoe5d/T4DxrY9VRwL/QCRkOuY7
 z9Zh1sNRIFvQ06Ols/P8OyQyb85cOeVglqyUZi2G7UnyNflHtxUoNg6A7LfkFwKYNbva
 znRT477cJ99n4soIp+qKBsbe2cvsxJTz6V7c6NRgMp1tuDAfy/fUPwXQmda+gXA5Ncuo
 A+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792357047; x=1792961847;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=abfjCbJqlvml3SbZ28yN/7G5JTY1yUDZgnvPGRAd75o=;
 b=f6nueM2i8Mh2tTuU7sBeLzmxsj1vPSZaEyDDDxq3sLdMuZpcgQZIFoYAfT28JJEuq8
 oclp106qRsNqMbXWl11BC3uV3ionxqv/jK+rXtfyGwPTAx8fuNEbPybzqfEaRCrZ46qm
 aIABGHBypAtevFkPrbF4tX212VqGmHj8hGtS/JGhuuLxnu6PqVmA96Dq2lhrxf5I+jsV
 dB887r2MEe2zytmJWWYG7ndVvnutyNIAOBvQad20ybG80pjI0mVS96xtFR0+YKkM3dfX
 tCWUWr9OTH5vcWO88G1iRqYSWoMU+KruI0bp5IsqFFqrcj9ANkm/g7V0i+32E9jMMhre
 HhdQ==
X-Gm-Message-State: AFq9FYJiruCFDodBDcBr4vIqg9oE+G9uFZim0StiS62+BOmCpnlXXt0d
 zrCuXXK8PCnEx7EDx7y3XeiI4L/GQERM3y7h+vnR5kNadNaOeemUi3CxqpE6BkD43YKI9KsiWxz
 8d6hZIKXADT7z9cMr0z3Vd3UlmzEPWDXap1Nep71DmQ==
X-Gm-Gg: AYBFou0IOL9AnaCWnrsmtbMWrGLG1gP1st0JJHRJ6sY9FSAlEGxkmo1tJxfnLm0nhnQ
 6EYm38RxJpePtVEMsS4Iv92NZxzpWawVVQ/Lv4OoYdWu+p92JJmKckAnIDaB2BMD2E8XcbdlGKx
 gj2L4gtU5jvGBKq2uznt8SCBsv3cAxJHqk6xRhBOODUSyUUpnFHeGaku7gsbre6kYBeET/ZPeI/
 yu4FeN3Z+6POr+hexY5auMoqNhQQPZq5ssLBVBMCNMBpNnLHHN0+TYcMM6pOWo97aSg5EXlLpG6
 FCfyXBqI6AfZeui48hl8fxkiDB1vkqqudH8jkgY17ERg6bjmAxo6Q/v7AiP0dlKJHzUSwV+UO5Q
 ZfBgWtNkhG0FA5T7MDQkGFOy13d/3gti7PP2J67NX/00A1pIYuLY=
X-Received: by 2002:a05:701b:2047:b0:143:72b1:9004 with SMTP id
 a92af1059eb24-18514633f89mr7432641c88.45.1792357046761; Sun, 18 Oct 2026
 13:57:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf>
In-Reply-To: <atUtmzafWnVtVm-t@windsurf>
From: John Ernberg <j@j-ernberg.se>
Date: Sun, 18 Oct 2026 22:57:15 +0200
X-Gm-Features: AclHuK8TaYOF-9gAaQJ_gRcd6YIZ6Z5_OpCjLdeTdU0epzAZkjoPwBHHeCh0ocU
Message-ID: <CAAHg4Zgrrsjech9bC9zdkZREEnaB_sV675doMibN+9qw4ypy1A@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adam Ford <aford173@gmail.com>, 
 Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
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

SGkgVGhvbWFzLAoKT24gU3VuLCBPY3QgMTgsIDIwMjYgYXQgMTA6NDHigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhlbGxvIEpv
aG4sCj4KPiBbK1lhbm4gc2luY2UgaGUgYWRkZWQgbGliZ2x2bmQgaW5pdGlhbGx5Ll0KPgo+IE9u
IFN1biwgT2N0IDE4LCAyMDI2IGF0IDA2OjA2OjUxUE0gKzAyMDAsIEpvaG4gRXJuYmVyZyB3cm90
ZToKPgo+ID4geHdheWxhbmQgd2lsbCBmYWlsIHdpdGggYSBzaW1pbGFyIGVycm9yLCBub3QgZmlu
ZGluZyBkcmkuCj4gPgo+ID4gVGhpcyBpcyBiZWNhdXNlIGRyaS5wYyBpcyBpbiB0aGlzIGNvbmZp
Z3VyYXRpb24gaXMgcHJvdmlkZWQgYnkgbWVzYTNkLAo+ID4gYnV0IGxpYmdsIGlzIHByb3ZpZGVk
IGJ5IGxpYmdsdm5kLCB3aGljaCBkb2VzIG5vdCBkZXBlbmQgb24gbWVzYTNkCj4gPiAoYmVjYXVz
ZSBtZXNhM2QgZGVwZW5kcyBvbiBsaWJnbHZuZCB0byBidWlsZCB0aGUgaW50ZXJmYWNlIHVzZWQg
YnkKPiA+IGxpYmdsdm5kKS4KPiA+Cj4gPiBJZiBsaWJnbHZuZCBpcyBleHRlbmRlZCB0byBjb3Zl
ciB0aGUgbnZpZGlhLWRyaXZlciwgZHJpLnBjIHdvdWxkIGJlCj4gPiBwcm92aWRlZCBieSBtZXNh
M2QtaGVhZGVycy4KPiA+Cj4gPiBJdCBzZWVtcyB0aGF0IG9ubHkgbGliZ2wgdXN1YWxseSBuZWVk
cyB0aGlzIGV4dHJhIGJpdCwgc28gRUdMIGFuZCBHTEVTCj4gPiBhcmUgbGVmdCB1bnRvdWNoZWQu
Cj4KPiBUaGFua3MgZm9yIHRoaXMgbmV3IGl0ZXJhdGlvbi4gSXQgaXMgcmVhbGx5IGFubm95aW5n
IHRoYXQgbWVzYTNkIG5lZWRzCj4gbGliZ2x2bmQsIGFzIGl0IHByZXZlbnRzIGZyb20gZG9pbmcg
dGhlIG5hdHVyYWwgdGhpbmc6Cj4KPiAgICAgICAgIGxpYmdsIC0+IGxpYmdsdm5kIC0+IHJlYWwg
T3BlbkdMIHByb3ZpZGVyIC0+IG1lc2EzZAo+Cj4gSW4gdGhlIGVuZCB0aGlzIGluZGVlZCBtZWFu
cyB0aGF0IHRoZSBvbmx5IG9wdGlvbiBpcyB0byBkbyBzb21ldGhpbmcKPiBsaWtlIHRoaXM6Cj4K
PiAgICAgICAgIGxpYmdsIC0+IGxpYmdsdm5kCj4gICAgICAgICAgICAgICAtPiByZWFsIE9wZW5H
TCBwcm92aWRlcgo+Cj4gTm93LCB0aGUgcXVlc3Rpb25zIHRoYXQgY29tZSB1cCBhcmU6Cj4KPiAt
IFdoeSBkbyB5b3UgbmVlZCBsaWJnbHZuZCBpbiB0aGUgZmlyc3QgcGxhY2U/IFdoeSBkb24ndCB5
b3UganVzdAo+ICAgZW5hYmxlIG1lc2EzZD8KCkknbSBqdXN0IHJ1bm5pbmcgbWFzcyBidWlsZHMg
d29ya2luZyBvbiBmaW5kaW5nIGNvbmZsaWN0aW5nIHBhY2thZ2VzLAp0byBob3BlZnVsbHkgaW4g
dGhlIGVuZCBzb2x2ZSB0aGUgcGVyLXBhY2thZ2UgcmVidWlsZHMgYXMgaW5pdGlhbGx5CmRpc2N1
c3NlZCB3aXRoIEFybm91dCBoZXJlOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3Qv
MjAyNDEyMjcxNjA2MjIuMTY1NDgyMi0xLWpvaG4uZXJuYmVyZ0BhY3RpYS5zZS9ULyN1CgpJIHJ1
biBpbnRvIHF1aXRlIGEgYnVuY2ggb2YgYnVpbGQgZmFpbHVyZXMgaW4gdGhlIHByb2Nlc3MuCgpQ
ZXJzb25hbGx5IEkgaGF2ZSBubyBpbnRlcmVzdCBpbiBsaWJnbHZuZCBvdGhlciB0aGFuIGJlaW5n
IGFibGUgdG8KYnVpbGQgImFsbHllc2NvbmZpZyItbGlrZSBjb25maWd1cmF0aW9ucyB0byBmaW5k
IGNvbmZsaWN0cy4KCkknbSBhbHNvIG9wZW4gdG8gcmlwcGluZyBsaWJnbHZuZCBvdXQgaWYgdGhl
cmUgaXMgbm8gdXNlIGZvciBpdC4KCkJlc3QgcmVnYXJkcyAvLyBKb2huIEVybmJlcmcKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
