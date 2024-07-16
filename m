Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7521DC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 06:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 231AD81320;
	Tue, 16 Jul 2024 06:16:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gwMN8XkqTbtX; Tue, 16 Jul 2024 06:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24D9B81325
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24D9B81325;
	Tue, 16 Jul 2024 06:16:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 44F551BF20D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 06:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 332E6608C6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 06:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id twNnhG1en7A1 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 06:16:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112b; helo=mail-yw1-x112b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26F7A607C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26F7A607C9
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26F7A607C9
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 06:16:24 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-65fc94099a6so24789017b3.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 23:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721110584; x=1721715384;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FImkPt38Yuw8R347ge3Kq21hp/Wu6ICRZcx5tVlWrQU=;
 b=fO/f9dFOSD/L0HI8++s1T3GechzXMptIvo3aIrf5w/QYildJvMDfIN76/VwxDTPeVr
 X4OwGCAnsyyHfS12fL+0VzY2BMXoYdJOc69quS5xReIICpZM8AsSj2RZ2sTTHB1XPo5V
 qS4PrWan6o7jAkQvUwphf/8Y7BzvQAYNTVKtT4/9d2WNilZEliMek5B3RHzrWu2VdPXC
 5RW56jQnyIGMt2j8qYX+rDl4WSYKQfhT8RwCUqIgnUdr9klci4LiinK9VNJs6mBXDbO1
 seYSdN9fzVxdNLZSNZVYs0dvnsHGHXfN0IUWHsK9zIS01w9RltM239BHXHqxtyqZFYcs
 TWqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIWl0GEgd/AGgWaO2gkL38gQ9ZiZTCI2/w+oAopyNTyKomDdTMUgbLWxgdUZDRnkwphLpQkJq/EK9ncN3LE7FH8QaM9UN28A==
X-Gm-Message-State: AOJu0YzjJpzGFzHsT9tK2JPMZEdkHgFxsMnbawrBJ48J5xR38cvKRfZX
 9iqPrnjilHF2jjtMVDRa1yiPoS7MWttXi04tWeM+F8Hi2EY57Hq4VID24xFHREc3YwwDW/snL/V
 7KOmka+f/y7mbraJlS29WWovSgTpJE4f7kb+vzw==
X-Google-Smtp-Source: AGHT+IEzpFmEBNFQcikvsBXdGUjDcZRd43RCRTWvGWNjhYCg7XvanROgFQJef9FMs/izZigycXxvIRWoTKO5cLCrenc=
X-Received: by 2002:a81:920d:0:b0:61b:e645:3e94 with SMTP id
 00721157ae682-6637efd50e4mr14299077b3.5.1721110583944; Mon, 15 Jul 2024
 23:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240421095353.208034-1-dario.binacchi@amarulasolutions.com>
 <20240421095353.208034-2-dario.binacchi@amarulasolutions.com>
 <20240715160555.6e88961e@windsurf>
 <be4a74a6-981c-49c3-9d4e-e5f413cac1b7@mind.be>
 <20240715162748.2bc8260c@windsurf>
In-Reply-To: <20240715162748.2bc8260c@windsurf>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 16 Jul 2024 08:16:13 +0200
Message-ID: <CABGWkvp3XzrjPRWk5K2+WPO4Jj30h=i4Cyb82Tmt3FA8gcWfdQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1721110584; x=1721715384;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FImkPt38Yuw8R347ge3Kq21hp/Wu6ICRZcx5tVlWrQU=;
 b=kfrBJVPUMLE2AVHJhtxn2cG6N3lv15rpEZ7HViehiUKy+schIMT8U2smmxUtNTbdNn
 tAlsWsmsHFUz0WgGpSnV1rNaBvL0NfSBGP6eZXq27meNvK8txIo7A6AmEPydKkG16BzQ
 u2mGT7LuoBvnuEoeQHZB6l7nwVrwXvEfOAfBs=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=kfrBJVPU
Subject: Re: [Buildroot] [RFC PATCH 1/2] support/scripts/genimage.sh:
 support creating a bmap image
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
Cc: linux-amarula@amarulasolutions.com, Xuanhao Shi <X15000177@gmail.com>,
 buildroot@buildroot.org, michael@amarulasolutions.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzIGFuZCBBcm5vdW50LAoKVGhhbmsgeW91IGZvciBhcHBseWluZyB0aGUgcGF0
Y2guIE1vcmUgdGhhbiBvbmNlLCBkdXJpbmcgdGhlIHBhdGNoCnRlc3RzLCBJIHRob3VnaHQgdG8g
bXlzZWxmOgpJZiBvbmx5IEkgY291bGQgc3BlZWQgdXAgdGhlIGZsYXNoaW5nIG9mIHRoZSBib2Fy
ZCB1c2luZyBibWFwdG9vbC4KQW5kIGZpbmFsbHksIGl0IGlzIHBvc3NpYmxlLgoKQW5kIHRoYW5r
cyBhbHNvIGZvciB0aGUgc3VnZ2VzdGlvbnMgb24gZnVydGhlciBkZXZlbG9wbWVudHMgdGhhdCBj
b3VsZApiZSBjYXJyaWVkIG91dC4KClRoYW5rcyBhbmQgcmVnYXJkcywKRGFyaW8KCk9uIE1vbiwg
SnVsIDE1LCAyMDI0IGF0IDQ6MjfigK9QTSBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMucGV0YXp6
b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgMTUgSnVsIDIwMjQgMTY6MjM6NTMg
KzAyMDAKPiBBcm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmU+IHdyb3RlOgo+Cj4g
PiA+ICgxKSBXZSBkb24ndCBhZGQgYW4gb3B0aW9uIHRvIHNjcmlwdCwgYnV0IHJhdGhlciB3ZSBs
b29rIGluIHRoZQo+ID4gPiBCdWlsZHJvb3QgLmNvbmZpZyBmaWxlIGlzIGhvc3QtYm1hcC10b29s
cyBoYXMgYmVlbiBlbmFibGVkLiBJZiBpdCBpcwo+ID4gPiBlbmFibGVkLCB3ZSBhc3N1bWUgdGhl
IHVzZXIgd2FudHMgYm1hcCBpbWFnZXMKPiA+Cj4gPiAgIEluc3RlYWQgb2YgbG9va2luZyBpbiB0
aGUgY29uZmlnLCB3ZSBjb3VsZCBhbHNvIGxvb2sgZm9yIGl0IGluIFBBVEggKHdpdGggImlmCj4g
PiB3aGljaCBibWFwdG9vbCA+L2Rldi9udWxsIDI+JjEiKS4KPgo+IFllcywgdGhhdCB3YXMgYW5v
dGhlciBvcHRpb24sIGJ1dCB0aGVuIGZvciB0aGUgc2FtZSBCdWlsZHJvb3QKPiBjb25maWd1cmF0
aW9uIGFuZCB2ZXJzaW9uLCB0aGUgYnVpbGQgcmVzdWx0cyB3b3VsZCBiZSBkaWZmZXJlbnQgZnJv
bQo+IG1hY2hpbmUgQSAod2hpY2ggaGFzIGJtYXAtdG9vbHMgaW5zdGFsbGVkIHN5c3RlbS13aWRl
KSBhbmQgbWFjaGluZSBCCj4gKHdoaWNoIGRvZXNuJ3QgaGF2ZSBibWFwLXRvb2xzIGluc3RhbGxl
ZCBzeXN0ZW0td2lkZSkuIEZyb20gbXkKPiBwZXJzcGVjdGl2ZSwgdGhpcyBicmVha3MgdGhlIHBy
aW5jaXBsZSBvZiBsZWFzdCBzdXJwcmlzZS4KPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6
em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKCgotLSAK
CkRhcmlvIEJpbmFjY2hpCgpTZW5pb3IgRW1iZWRkZWQgTGludXggRGV2ZWxvcGVyCgpkYXJpby5i
aW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwoKCkFtYXJ1bGEgU29sdXRpb25zIFNSTAoKVmlhIExlIENhbmV2YXJlIDMwLCAzMTEw
MCBUcmV2aXNvLCBWZW5ldG8sIElUCgpULiArMzkgMDQyIDI0MyA1MzEwCmluZm9AYW1hcnVsYXNv
bHV0aW9ucy5jb20KCnd3dy5hbWFydWxhc29sdXRpb25zLmNvbQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
