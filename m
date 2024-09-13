Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD4EFC6169
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 17:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E6B061245;
	Fri, 13 Sep 2024 17:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3VJWuo27oPz; Fri, 13 Sep 2024 17:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88DE261246
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88DE261246;
	Fri, 13 Sep 2024 17:06:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB441BF28A
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 17:06:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89AB280F3B
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 17:06:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8DqJ9TaafVob for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 17:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=markus.mayer@broadcom.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD43480E5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD43480E5C
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD43480E5C
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 17:06:56 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2053a0bd0a6so24907155ad.3
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 10:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726247216; x=1726852016;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mJ/pSNUQ7C0RH5m1QK60DhDNrn4agaOI0fIMwRbaZGA=;
 b=DirOq9seDG+uAG123ZttsaCJbEqU8jEa8HaIYxwbNa9dCebZ5YkQQ1XFLrEJGCgSSy
 EQiEtL4PoTj5LP7nP7djZJ8c5eVGY94XUjQrmacFZkv3orghyrVx3v2sfQRzrf7El59B
 lzNBTcUpUncuq71NI7JhBtvoyvZ2iizSi+k78tDoY4BuBb78yu2e+IsPllq866OIWvqi
 53BLmVef6tI2Lums/+BG1Y1t7/Bbj/CSw9vdIO2eAxBK16euvSXLadOp/iMnkCXX2DID
 sPIZn9vdFuhXUfZ9RGeIl2kKerJl4ymncDCGVsRXJoM7iPrWVCq94CbvYkVu7AQ8LxNG
 WwJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSFRCLSC3Xs2VHgaoq2YvKLXaiHZdadR1vIQbNpfWC64FApt36g4E2U5yASEI9Q5tDIDIQ/f1sDO8=@buildroot.org
X-Gm-Message-State: AOJu0Yxdvx8kFaCZ4m9569VK5mGZVMVIc8gbQWGGUCJdsu2Ath/K+TSo
 ePsfTZf/SeT7NXeeOnQY1AkZI4YeiTCcxNAMEfCNHlJfMOZWhSetY7/sJV8oYcLd04OrOeDrnCB
 w95MHi4sdIAWe1U0UwYT5t30NUFNKBxHykZWuhAlPHKiIoAH2b5Bo
X-Google-Smtp-Source: AGHT+IG9HWom2UQYn5VxD6G2eNm1BqhTdYm6NGcVC4oQQMpAwhDZAgxpTxaVZrR7hWexbCNqKTZq8I0mrNPvqJumur0=
X-Received: by 2002:a17:90a:7407:b0:2d8:8252:f675 with SMTP id
 98e67ed59e1d1-2dba007f0a6mr7746929a91.39.1726247215583; Fri, 13 Sep 2024
 10:06:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723543467.git.yann.morin@orange.com>
 <ZshsYmf4qZcXkEZX@probook>
In-Reply-To: <ZshsYmf4qZcXkEZX@probook>
Date: Fri, 13 Sep 2024 10:06:44 -0700
Message-ID: <CAGt4E5uswBziir9OtGYEeoxotmJwz8fHeQSr7_xsadk_hkxniw@mail.gmail.com>
To: yann.morin@orange.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1726247216; x=1726852016; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mJ/pSNUQ7C0RH5m1QK60DhDNrn4agaOI0fIMwRbaZGA=;
 b=WDGwspiyZEFRwi+GoP+HPKtOeYH1uA8lAmXvIkUbTDa8vZmQ+2ORCrd/3JbFft1jKu
 i1KPV3r03eMv/M51QZOIG7OEi4vRroj/b/S+aFitWcQNevgFk45z6DmtIivWV30hf4ZU
 B5JIGwVRBOeyjtP7NrrDMuP4e6rIoQf9CdbWQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=broadcom.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=WDGwspiy
Subject: Re: [Buildroot] [PATCH 0/3] toolchain/wrapper: move -ztext to the
 toolchain wrapper
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKT24gRnJpLCAyMyBBdWcgMjAyNCBhdCAwNDowMywgSi4gTmV1c2Now6RmZXIgdmlh
IGJ1aWxkcm9vdAo8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBB
dWcgMTMsIDIwMjQgYXQgMTI6MDQ6MjhQTSArMDIwMCwgeWFubi5tb3JpbkBvcmFuZ2UuY29tIHdy
b3RlOgo+ID4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9yYW5nZS5jb20+Cj4g
Pgo+ID4gSGVsbG8gQWxsIQo+ID4KPiA+IEZvbGxvd2luZyBhIGRpc2N1c3Npb24gd2l0aCBUaG9t
YXMgLCB3ZSB3ZXJlIGJvdGggbGVmdCB3b25kZXJpbmcgd2h5Cj4gPiAtenRleHQgd2FzIG5vdCBo
YW5kbGVkIGluIHRoZSB0b29sY2hhaW4gd3JhcHBlciwgbGlrZSB0aGUgb3RoZXIgc2ltaWxhcgo+
ID4gZmxhZ3MgYXJlLgoKSSBhbSBjdXJpb3VzIHdoYXQgdGhlIHBsYW4gaXMgd2l0aCB0aGlzIHNl
cmllcy4gT24gdGhlIG9uZSBoYW5kIGl0IGlzCmxvb2tpbmcgbGlrZSB0aGlzIG5ldyBhcHByb2Fj
aCBpcyB0aGUgYXBwcm9hY2ggdGhhdCBzaG91bGQgaGF2ZSBiZWVuCnRha2VuIGFsbCBhbG9uZyAo
aGFuZGxlICItenRleHQiIGluIHRoZSB3cmFwcGVyKS4gT24gdGhlIG90aGVyIGhhbmQsCml0IGRv
ZXNuJ3Qgc2VlbSB0byBoYXZlIGJlZW4gYXBwbGllZCBhbnl3aGVyZSB0aGF0IEkgY2FuIGZpbmQu
CgpXaWxsIGl0IGJlIGJyb3VnaHQgaW4gYXQgc29tZSBwb2ludD8KClRoYW5rcywKLU1hcmt1cwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
