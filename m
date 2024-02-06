Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93F0C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 19:30:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DE6C819F3;
	Tue,  6 Feb 2024 19:30:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ghzaQfEh8ckV; Tue,  6 Feb 2024 19:30:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D45981990
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D45981990;
	Tue,  6 Feb 2024 19:30:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BA651BF2FB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:30:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95EAB60EFB
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 19:30:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g0fwIZbioPP2 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 19:30:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com;
 envelope-from=indrek.kruusa@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 72E8160B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72E8160B9A
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72E8160B9A
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 19:30:14 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-56025fcaebaso3902848a12.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 11:30:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707247812; x=1707852612;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbZvC+zzMGZ7Zf1EO5/RYVZne8YH/R939Bv21ErlY4s=;
 b=fVHQzPuDnC03vi7n/mpN/3TlQ2dmOlTi5pFdeduRakJBYkO8PT2y9XlTv/S+JPSoXg
 2zMLezBuPNT+PgCC9J3mTfAjyWZKBBZ9e6nQYILBat5cVvMknYSrxFFN9FXgeYKu3Ff2
 z5HkSWdcnd71uhZqQ6cFylNm/JSwJUUCqzcDQ/SYIh/f9S+/ICXMyr2Y/iP9V0KJnbo+
 LRf5voBsk7fagCQhnyLAGHgh/+SEBzZEdBxJfK6xAtaDQcnpiHpEFQ6G7S4q1B+Eu3lc
 jiO0qwlfw1odxtJodWYmZhUXgaU+ZEuGGUAowDvzKlw6xJNtPQPW/Ai01cJN0Zj69ON1
 IKjg==
X-Gm-Message-State: AOJu0YwIQRVEVc2Y6wmkNOR+ZgW+RIGmTPVMhJxTyE3ZHPCLDnLJ66sv
 6keJ8xHrXPGnfRNqedECvrDI5pSHDtPcKIvAWwEc+rQI2b7QlsHnCtjDbP6IgDywFQ2PyCf7PUN
 +7gGFz4qIFlSdj8r0s8LjBmUC4QwgplVhkwI=
X-Google-Smtp-Source: AGHT+IFjWd+aPjiavgwSaJGxVcj1LHIAP+uxVe1A6Hr8Pg0L+h0YfRLOz29AxE5RFCHPuQYlZoCsY+kiJ3dPHlFfjiU=
X-Received: by 2002:a05:6402:149a:b0:55f:c3c1:34e with SMTP id
 e26-20020a056402149a00b0055fc3c1034emr2183274edv.15.1707247812247; Tue, 06
 Feb 2024 11:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20230907200013.11620-1-indrek.kruusa@gmail.com>
 <57cacd5b-aa2c-4199-b1d0-1de38b5ffd27@benettiengineering.com>
In-Reply-To: <57cacd5b-aa2c-4199-b1d0-1de38b5ffd27@benettiengineering.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Tue, 6 Feb 2024 21:30:01 +0200
Message-ID: <CA+fTLhjcDwmaB039+zj3aPZ5aTL2BkaEZftea_OeD0e0FB_EBg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707247812; x=1707852612; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbZvC+zzMGZ7Zf1EO5/RYVZne8YH/R939Bv21ErlY4s=;
 b=Jgr0RdmcZ26voWON4Wft1YrkhxuJVH1xVn+VsCqK7p2S2FcV2bA9J1oF+556inAp94
 KWC9elVML6Zm/jXwMqsOJ90C8yPndNDxJzkWJcD35Rv0IHLzCStC7/pVII/z28RYWmi9
 uRP3k+sar6lUvp6d29ICjCee+lk/8TOEEaRtXwvjqrB5ZdAuLQXbGCsbWu+lYOYuJ7Ju
 4lfDUvJ+ra+7l1ShDSQxWu6ZNHIV70oEFPEglMogfvpNbBLXevLwuP/w/mXSjzVARWLQ
 pZOV6lkTuqWTMXK0fPFLllqXPjWoexPbDNcAkBxfigqGQ0Sk0VCj7qTKRO4Rj48v0UPr
 xpOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Jgr0Rdmc
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/mangopi_mangopi_mq_d1s: new
 defconfig
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S29udGFrdCBHaXVsaW8gQmVuZXR0aSAoPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmlu
Zy5jb20+KQpraXJqdXRhcyBrdXVww6RldmFsIEUsIDUuIHZlZWJydWFyIDIwMjQga2VsbCAxMjow
MDoKPgo+IEhpIEluZHJlaywKPgo+IHNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseSwKPgoKSGkgR2l1
bGlvLApubyBwcm9ibGVtISBUaGFua3MgZm9yIHRoZSByZXZpZXchCgo+IE9uIDA3LzA5LzIzIDIy
OjAwLCBJbmRyZWsgS3J1dXNhIHdyb3RlOgo+Cj4gSGVyZSB3ZSBuZWVkIGEgY29tbWl0IGxvZywg
c29tZXRoaW5nIGxpa2U6Cj4gIgo+IEFkZCBzdXBwb3J0IGZvciBNYW5nb1BpIE1RMVJXOgo+IGh0
dHBzOi8vbWFuZ29waS5vcmcvbXFyCj4KPiBBbiBBbGx3aW5uZXIgRDFTKDF4UklTQ1YgQzkwNiBS
MVMwICsgNjRNQiBERFIyLTEwNjYgZW1iZWRkZWQpIGJhc2VkIFNCQwo+IHdpdGg6Cj4gKiBVU0It
T1RHIFR5cGUtQyBzb2NrZXQKPiAqIFVTQi1IT1NUIFR5cGUtQyBzb2NrZXQKPiAqIDJ4IDE4IHBp
biBHUElPIGhlYWRlcnMKPiAqIFRGIGNhcmQgc2xvdAo+ICogUlRMODcyM0RTIFdpRmkgbW9kdWxl
IHdpdGggZXh0LiBhbnRlbm5hIGNvbm5lY3Rvcgo+ICogNDAgcGluIFJHQiBGUEMgY29ubmVjdG9y
Cj4gKiA2IHBpbiBDVFAgRlBDIGNvbm5lY3Rvcgo+ICogMjQgcGluIERWUCBGUEMgY29ubmVjdG9y
Cj4gKiBvbmJvYXJkIG1pYwo+ICogb25ib2FyZCBhdWRpbyBhbXBsaWZpZXIKPiAqIEZFTCxyZXNl
dCBidXR0b24KPiAiCj4KPiA+IFNpZ25lZC1vZmYtYnk6IEluZHJlayBLcnV1c2EgPGluZHJlay5r
cnV1c2FAZ21haWwuY29tPgo+ID4gLS0tCgpzbmlwCgo+Cj4gSSd2ZSBidWlsZCB0ZXN0ZWQgc3Vj
Y2Vzc2Z1bGx5IHdpdGggdGhlIGNoYW5nZSBhYm92ZSB1c2luZyB1dGlscy9kb2NrZXIKPiBydW4g
YW5kIHRoZSByZXN0IGxvb2tzIGdvb2QgdG8gbWUgc28gd2l0aCB0aGUgY29tbWl0IGxvZyByZXdv
cmRlZCBhbmQKPiB0aGUgbWlzc2luZyAiQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX09QRU5T
U0w9eSIgYWRkZWQ6Cj4gUmV2aWV3ZWQtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVuZXR0
aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+CgpBY3R1YWxseSBJJ3ZlIGJlZW4gdHJ5aW5nIHRv
IHByZXBhcmUgYW4gdXBkYXRlZCBwYXRjaCBmb3IgdGhpcyBib2FyZC4KQ3VycmVudGx5IGl0cyBw
b2ludGluZyB0byB0aGUgb2xkZXIgdS1ib290IGJ1dCBuZXdlciB2ZXJzaW9uIGlzCnByb3ZpZGVk
IGJ5IFNhbXVlbCBIb2xsYW5kLiBUaG91Z2gsIHRoZSBuZXdlciB2ZXJzaW9uIG5lZWRzIHNwZWNp
YWwKbWVtb3J5IGNvbmZpZ3VyYXRpb24gZm9yIEQxcyBTT0MgYW5kIEknbSBhIGJpdCBzdHVjayB3
aXRoIHRoYXQuIFdoZW4KcmVhZHkgSSB3aWxsIGFkZCBhIHByb3BlciBjb21taXQgbG9nIGFsc28u
CkJlc3QgcmVnYXJkcywKSW5kcmVrCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
