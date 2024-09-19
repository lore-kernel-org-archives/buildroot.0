Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10B0CF395F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E77D606E7;
	Thu, 19 Sep 2024 21:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPM8t2ojeiVC; Thu, 19 Sep 2024 21:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DE91615FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DE91615FC;
	Thu, 19 Sep 2024 21:35:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6907F1BF37E
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 21:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57FA4414CA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 21:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VSpYMdQsE9RE for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 21:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E4ECA4013C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4ECA4013C
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E4ECA4013C
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 21:35:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5365c060f47so1738936e87.2
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 14:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726781723; x=1727386523;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fc2cJAHZ9B6JAE1ejP+CnL9AQ4Ux6ktkHXdP7iH4vPk=;
 b=Cg+C7xjq5taoaiymiZN1Q7k4qacnEuy2RJYOrGoTneYNRhCZGsek6Yoy5BJ2jXO49m
 bFJ+3i9sS8VZEJnsXJSXoaFyiM4wYiLPT72xL1FY8vQq6iAI8ygVbqXVOXIcgnvRZVtj
 lES0VPYtrqh3azo66D1GEgD3jrjukt3/HFabqHgMfUi1ChhOCWfqoN2QeNeBgus0ugih
 JWeYIp0Y78E98pPlHsnXRzMzO2y4fk8tGq8e1DQuYSrvya059ReEkbDkytnbgBSJNjLV
 MI1Enbiy42ILFN9vzon7bamxzWvnrJm+Yo8GPIDK0uyTfCM8g2hkWttEVas49MT9T5v8
 raxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW66hZuoL0jdvt6eKtthvEEH4e7zlbd+G5QIk1Mz2dkIUoiwbSOhEzQdsl9Xiu4MK/pTfUrqApwHN0=@buildroot.org
X-Gm-Message-State: AOJu0Yz9FwCJMot9ZoSFI+zaUCaILkTVNPCbUxRNj+kDJu6SA3zEgb2R
 pXsowYIOthYF0COnbqDUCRIgMBy0m3J9mXyoQQVS4M46uiuTr1yjyOMaCc63P7VC9/fPwD1IG+n
 MP4oHyTdTLwYif72ytamRkmrl175qMryX
X-Google-Smtp-Source: AGHT+IEjamYY65IzijwWV+TloH7IyZ+V0txs3k16pmQpoi+AcmQPdbsL7WvXC5SCT4bMdtuQ8GyL55xmGwLF+udhf/8=
X-Received: by 2002:a05:6512:238f:b0:52e:9b4f:dd8c with SMTP id
 2adb3069b0e04-536ac2f5d3dmr433331e87.35.1726781722235; Thu, 19 Sep 2024
 14:35:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5D3LL=gCQt-k5e3350tQ+XULrzhV233q1GZbGFDD5f3Cg@mail.gmail.com>
 <20240724221001.7ec77c1b@windsurf>
 <CAOMZO5DbYXhKjwpyoLUFhV97_VZ076ExChBWmAzU8Z5FN-M6kQ@mail.gmail.com>
 <18b7c354-da3a-47fd-a424-d0391eea9fac@mind.be>
 <CA+h8R2p8_nYHXnZAeTw2z-hz6x2Y1c=gD7WQOMqWcc6830Z2tQ@mail.gmail.com>
In-Reply-To: <CA+h8R2p8_nYHXnZAeTw2z-hz6x2Y1c=gD7WQOMqWcc6830Z2tQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 19 Sep 2024 18:35:10 -0300
Message-ID: <CAOMZO5AuuLEGV9Xs7rE8r75KRpkEJpayEQSoukD2qWEu34oU3w@mail.gmail.com>
To: Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726781723; x=1727386523; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fc2cJAHZ9B6JAE1ejP+CnL9AQ4Ux6ktkHXdP7iH4vPk=;
 b=WK2kbMkSLj8MhV9/emmke3+6zF6Yl2aVLFMeA8FX17wB1/zREP1BiwRG6j87ja4paO
 lEVp6SMSeyrvsGbDrLGA7pmmXCSqfQGZzaL505UCvG87/8IvxprwnNyqujT91Qu5ctlZ
 hI/kuvl6hr/GaQYg16/KJf5RFzQasBUypA2sb1Nto4+gJEOyoWQq+14shxdPJp6N1rrJ
 S8oG6jXRfiC0uE0LQMgbrDJQCeCFnPpPRI4IRGS51aoU2qeOQT2FdNNUv2V34aghIz8l
 /BxFfcS8+8znAnTomA2CBHKIsTROcl+B4tPtaJjpIIpS68a3AAGvrzYuL8fgCaMM3gge
 PWfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WK2kbMkS
Subject: Re: [Buildroot] crucible: Build failure on riscv64/mips64el
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQ2hyaXN0aWFuLAoKT24gVGh1LCBTZXAgMTksIDIwMjQgYXQgNjoxOeKAr1BNIENocmlzdGlh
biBTdGV3YXJ0IDxjaHJpc3RpYW5AYXBlcnR1cmUudXM+IHdyb3RlOgoKPj4gICBJZiB3ZSBkb24n
dCBmaW5kIGEgc29sdXRpb24gSSB0aGluayB3ZSBzaG91bGQgZGlzYWJsZSBHbyBlbnRpcmVseSBm
b3IgdGhlc2UKPj4gYXJjaGl0ZWN0dXJlcy4gVW50aWwgc29tZW9uZSBzaG93cyB1cCB3aG8gaXMg
d2lsbGluZyB0byBwdXQgaW4gdGhlIGVmZm9ydCB0bwo+PiBtYWtlIGl0IHdvcmsuCj4KPgo+IEdv
IGNhbiBjb21waWxlIGFuZCBydW4gZmluZSBvbiB0aGVzZSBhcmNoaXRlY3R1cmVzLCBqdXN0IHRo
aXMgc3BlY2lmaWMgcGFja2FnZSBoYXMgYW4gaW5jb21wYXRpYmlsaXR5LiBJIHdvdWxkIHN1Z2dl
c3QgaW5zdGVhZCBmaWxpbmcgYW4gaXNzdWUgb24gdGhlIHByb2plY3QgR2l0SHViIHBhZ2Ugd2l0
aCB0aGUgYnVpbGQgZXJyb3IgYW5kIGRpc2FibGluZyB0aGUgcGFja2FnZSBmb3IgdGhhdCBrbm93
biBpbmNvbXBhdGlibGUgYXJjaGl0ZWN0dXJlICsgR09BUk0uCgpUaGUgYnVpbGQgZXJyb3IgYmVs
b3cgaXMgc2VlbiBvbiBBUk06CgpodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3Vs
dHMvYjU2ZDkzNzZiZDc1ODA4MWUyN2JjMzQ5YzE5Mjc4M2VjZTIyYTRmYi8KCkNydWNpYmxlIGlz
IHRhcmdldGVkIHRvIHJ1biBvbiBpLk1YIGFybXY3IGFuZCBhcm12OCBjaGlwcy4KCkkgYW0gbm90
IGZhbWlsaWFyIHdpdGggdGhlIEdvIGRldGFpbHMgdG8gaGVscCBkZWJ1ZyB0aGlzLCBidXQgdG8g
bWUsCml0IHNlZW1zIGxpa2UgYSBCdWlsZHJvb3QgaW50ZWdyYXRpb24gcHJvYmxlbSBhcyB3ZSBk
b24ndCBzZWUgY3J1Y2libGUKYnVpbGQgZmFpbHVyZXMgaW4gT3BlbkVtYmVkZGVkLgoKVGhhbmtz
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
