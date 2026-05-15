Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280F9CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E6B8846BF;
	Fri, 15 May 2026 17:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id afaCpTGn5ygC; Fri, 15 May 2026 17:47:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC37784562
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867222;
	bh=FuM4HGxHQU84TL8OZfFV7QQq+mGNfBbrkQaJHnPgnZY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dr/t9+cQCew3wMRlYCVYbd1kuQF/02gyYpmwZi+tjtPpe82R1gmkDhENYCPP3/tVA
	 wcDdmzfRVQ9CGPLO5KWk4cXeoOtRKoovp0jad/6wYr9oQFPOGBk8uGFJ+lLcSWkxqz
	 ryeA3u2IyAThcGjkD0Mn2xNtjpDR56SACGiCIwV94gxvT/t5UIbb/c45g8FznkYHiI
	 lOjodV/BgJEpAVdgSpQuEWJ7L1b0Fqfl6u7l99txue5wWUx8MXjV8VNVRzLc7vovD1
	 mGAfo/+DLLI6EH49B981v8TC0a4DsBWiQO5QTOQzNjYljNMKgVrNj1UE7ClZ5Ubaos
	 v/33yDUNy+LiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC37784562;
	Fri, 15 May 2026 17:47:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2FA041295
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 15BF961698
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d1aXsAewTtqr for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0C64961623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C64961623
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0C64961623
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-43d734223e4so17663f8f.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778867204; x=1779472004;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZpkvTAJtBmnmcsO6ob4OeY07WsP9tpXmld2U378YG8s=;
 b=pGNWAd9Hy74+dwHI2ev8/sItEdxBiPr7s6G16Ejjch6w2a1ik5dlqCdPnfGSS+g7ET
 s89XQYXgXZIb8xGibRWPUhBiwuUulpwcGQnrRdo8qUYm3icLzDQuPGJx6XHjAZm0SYUQ
 WUoXnGlapmz2SNY6F9HdKagIMlTVaRwjD025qdt103L7Z3T4PFV/fm8OiOz5zUrTsqRB
 gBcZmVsqtev3y3HpHMjNVuqktTO7uPyelurQooXCpem3QktejZ2iCwC/4oQcL6qUL5TU
 1W/SMiLYziNsYl6Ktwkt+Zo79bq5mp8EKXL+E7W3L9xjs8qVHfBBpF0I4pzWwGmVJMJZ
 emgQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ9HIlUmnwgLVyN7qkuym2yrB8vuFsxzDtt8+mCb9I34ujKeSXuTSN86bABpYSdvTjMHLoC5JzZ01II=@buildroot.org
X-Gm-Message-State: AOJu0YyfPKgSJygDJ0TNCSSHhmaDp/bn4S+kTL8FEUFhQKtW++6d3rze
 bU3ollkgMk/npRGt2xVQUolkiJV5zvxHO7CE/Z1Uh1u8dIO8P07mHdKpa8hG39QAbsg3D2Gv2dv
 CkdrV
X-Gm-Gg: Acq92OFYeDIh8sdNrpRmFVnNl3lKo9VrwWUSlpFostcapmfvnM4aOmH1B1iUil4rxWc
 IUzCdGjEenDK2RKOd+lpY/XfCutf4apSIa3vlc9HLmqcEYL3V29bk2CdaGQ2itdiOfQ02TjFPzF
 EHEcjVphWYApMexI2ieOIlXZ5L/+pTZpDpNePAvbUbuPDsqPQlHOhPTwPhor+inpIbJ6yJoVxW8
 3XyQfJh9aUrPDKXCjchYTH6wwENwyzq7Mu065daLnYvbw5Dx00ucP5CrNFyAuYbBaYSLBdM5NXc
 2HCAdNJj4Rtya0TeQJyLYGYWMxveTmJGKb6J7DZx/VDbiJoZlgTx6kHUTmS3HWO09uLXp5yup8H
 p9niAruCvqHz9Bb74ZUNhLuYHsWEoZqOAKUnpZfDVl87o5alC85wT6WXYb+FmcRavtrN3dwG4rv
 t+jlJ38m/uOwxO065X81jCRdvTuL9oEi+ZDzD0FqCAjC1K
X-Received: by 2002:a05:6000:3108:b0:43e:b0f8:e019 with SMTP id
 ffacd0b85a97d-45e5b747c2fmr7408493f8f.7.1778867204072; 
 Fri, 15 May 2026 10:46:44 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da15a562dsm16571574f8f.33.2026.05.15.10.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 10:46:43 -0700 (PDT)
To: =?UTF-8?q?Martin=20Kepplinger-Novakovi=C4=87?= <martink@posteo.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 19:46:42 +0200
Message-ID: <20260515174643.530525-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505124607.327055-1-martink@posteo.de>
References: <20260505124607.327055-1-martink@posteo.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778867204; x=1779472004; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZpkvTAJtBmnmcsO6ob4OeY07WsP9tpXmld2U378YG8s=;
 b=VSnDTBtEuK0YJFzAukTtVA3S7vhwYQ/6X+MWSbNnxKhpmQqyZLgAJs62hmhGJUymaZ
 OpssehBZ9YluGSMFQ0uW0RdJvd9yXLWTiBta6tkf/QWrUCHtlRMc2QLr37gPt9/Mn1IV
 ym8UC5zCbcQRS7pDIIrHhFNIlVax4tgOTczC3ft+L/wgxFxx/AZE1xdCZM5JmbI+YYys
 S6hVuAHd3BFQzyXQyPzkoGErJnK7UCIrfPSWJBehtTY2FiInSuKSr1yvv5X8SeCNzTkr
 0f85jMyJ+CJMnE0mLSP6w0DBCu15Q1hK81INvjLDPcWAta8dcGpvfLQYx0ySqGjXVZRs
 rg+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VSnDTBtE
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Martin from x11vnc
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gSSBkb24ndCB1c2UgbWFpbnRhaW4geDExdm5jIGluIGJ1aWxkcm9vdCBh
bnltb3JlIGFuZCBjYW4ndCBlYXNpbHkgdGVzdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4g
S2VwcGxpbmdlci1Ob3Zha292acSHIDxtYXJ0aW5rQHBvc3Rlby5kZT4KCkFwcGxpZWQgdG8gMjAy
NS4wMi54ICYgMjAyNi4wMi54LiBUaGFua3MKCj4gLS0tCj4gIERFVkVMT1BFUlMgfCAxIC0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvREVWRUxPUEVS
UyBiL0RFVkVMT1BFUlMKPiBpbmRleCAxNzljZGY1MGY2Li5kODQ5ZmE4MjhhIDEwMDY0NAo+IC0t
LSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTIzNTMsNyArMjM1Myw2IEBA
IEY6CXBhY2thZ2UvcHl0aG9uLXdlYmFyZ3MvCj4gIE46CU1hcnRpbiBLZXBwbGluZ2VyIDxtYXJ0
aW5rQHBvc3Rlby5kZT4KPiAgRjoJcGFja2FnZS90c2xpYi8KPiAgRjoJcGFja2FnZS94MTFyNy94
ZHJpdmVyX3hmODYtaW5wdXQtdHNsaWIvCj4gLUY6CXBhY2thZ2UveDExdm5jLwo+ICAKPiAgTjoJ
TWFydGluIFBvdmnFoWVyIDxwb3ZpaytsaW5AY3V0ZWJpdC5vcmc+Cj4gIEY6CXBhY2thZ2UvcHl0
aG9uLWNvbnN0cnVjdC8KPiAtLSAKPiAyLjQ3LjMKPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
