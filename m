Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53366C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC941810B4;
	Sat, 19 Sep 2026 16:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOde0pbwUBe3; Sat, 19 Sep 2026 16:36:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1474681094
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789835799;
	b=nNetk3T3+ZmQvJGHe5o7ZChNg5m8irzkHiF1W6qkYIQhjx4OxP0GxDctCjbKsOXE86M0
	 QXs0s/c+qzI2Qa6EU8h+8GgsM6hiDjnexmFp9xEB/Kv1+8prv/T4JfaiQOcvme+4G81/e
	 Z707vPmh6telxtK/gLvK4GSPDMcl83ubk5qLCd/1J7+HFwPZaXQsRpnbnV2Lygcwevz4Q
	 7ME8lfRImEi/P9X2zWbGEvoZ9n7KIB1/FK4ffylcZHwFD1aU+Y2fjm+7EfbViV/rCgtDA
	 SHs2ApVKfE+3cQDlm7fKk7HYa5YIx7iZMd707VIaJ+FMrhfw05hdwVbbRMxRAXjREhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789835799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=X33iFxsLYWLTGUjrhxg/nKBWSvJM+W+NcFG9xd3Hb54=;
	b=c9Optz7k4v7SXwVPbXimLNPLugEQW1Y3QZhXQOnwu7GLtB8lLSL14MfIOgC3EWeON7RB
	 ya7QdUw2a8YUzc9j1qPoMn0MuJ9RjfV4/Lr2nrHR17HE/9y130dld28LD5HxywrHVFS0f
	 pKoiGfhpX85D4XNNvKGeHrHZuBV4pdTibM0AZoXWPAFGuVcr09Qz/9gKHiAzSrXNpJigX
	 SOwYI26hnRP2/JaVontXi4OISMutakpxNDQkV7CyqmP8MZlHsZ6dLC9mRejQOADVHjRMp
	 dIEH+raJKMcFLym3YnBtr93pasrAE8Ze0oOpRfDe4M/w2WngM3Q60wkgL4xyZBu1QAA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789835799;
	bh=X33iFxsLYWLTGUjrhxg/nKBWSvJM+W+NcFG9xd3Hb54=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hPcVPFV0z8lyCYUwEYSIYPcfC5JXaK20kTPdvgrpkcuDLd0A6XVaXT2S/p2KmD63K
	 XQdVnx0QKY1/oZrWLBFDHHkX0tBgNuhS96UAL/GVrCqY+k19wqc0c6Oo1SmmMesmk7
	 zZ8fO4MVN7W1NuSwMokb2Fn5tmvjMM2hr9XmqAL9meerPT11b8PisQxL4N/85r7dFz
	 g0L0P+mgydADK8hPjyQlL+X8YciPkvS41Z4VHNv6BGYRSa+ZHjWj96zjNbzFDwhDFN
	 TVmlGQvGXzx8B6FU0anKLHIjdNlouditaUMHTFwW/ei7HWpXuMf3f/VmiUseMsgs3g
	 4JRqZfwig3x5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1474681094;
	Sat, 19 Sep 2026 16:36:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17176362
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0860D40A92
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcVrSPeM54Sj for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:36:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CC05D40A90
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::1d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789835796;
 b=o6BJED4PIXI6cbbjGbaIND/DOzNeLZTM71NPRvSVzFzc0aQgypTIk3htjrWrvSJXHHCC
 yb26ORlXD+IT4u4bEMNJVRFtQ/xwZ4v6ztcB8EDpvXuC98wrKe7mHKtXm893rcVugZubm
 Ln2bORyPOnqMymHJxcRxca8JKQ1Q6u4ohD+0gaTgm72+GzhMEqcuX//FHAAC68o16T/vK
 pSnerApH0Jv1M9HCIvWFj5wAZJIrNEJd9umMcKVOjT4skfJ/DDoo5j3UR4enx3zpdH9vM
 0uWTb4KdFGy/IopAJe9GJqZ9UyF/TOSlHHw9cFj+WnKMuDr2RG8FVAE6SxYpm9p8lSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789835796;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=pJ28cHowv2HLnpOJRj1oQbuL618/VrEMiwXGJwvRFsk=;
 b=GXljMAz7ZBmD7jgtoEwxSojjpmY5jEGMSezoh4mn/2OdntDD3tAGQeKTvjGj3yNuVGfa
 +3FtXNfGNn/xvuxTBApTNOcjXUP5DisKCwKD6y3QYZJjxw0L7s+K8j5V58dYArxEu+2lf
 Miq3J4uPCQX7MSMkqAK5I06ZmEp2v7+SaO64r0MiCC0KgaesEEQwjIFbk2dqDE0kIo9it
 lJKozr91S5/oI2l3dHz+c1N+yZrQFtKpgDt2IEMkNzHd3bj0hCS8Uf2Urn5saadg38r2/
 Wg4ccN81Y8mohe20aL5aSt9wPE7xWNYbTBcjOeMTN4i/6+EKeibdPeOCKkhJ7rZn9RA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VQNpaZW4; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::1d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::1d; helo=mail-wr2-x1d.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=VQNpaZW4
Received: from mail-wr2-x1d.google.com (mail-wr2-x1d.google.com
 [IPv6:2a00:1450:4864:30::1d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC05D40A90
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:36:35 +0000 (UTC)
Received: by mail-wr2-x1d.google.com with SMTP id
 ffacd0b85a97d-484366874b0so958121f8f.2
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 09:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789835793; x=1790440593; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=pJ28cHowv2HLnpOJRj1oQbuL618/VrEMiwXGJwvRFsk=;
 b=VQNpaZW40gYB+HjGIyR+yGpVaXO97VXzbD5HctBcjFNV+nOJW3Q/TurPDTztCbq19i
 2yoUsHNuUimhoHzYo9wquPgCjw6Jv05cCJXqAq+wwxY5vryJYdV7R2B01RleiTEp9GUB
 LcuFau8xg0OFnFf93pQK7MXpzdOFcOS6bq2uMmgzHTM4OBjonrcPJWNltQEHJNswShh6
 G0xYwirEqPvWkR6wv50CdPQ7gTItj8stAqzBta5YtXM81k4ot3rpuhoUqXU6LqdEKb4d
 LYND0XaCsDJETeW75pnhvY4CJX+l8zQPfSmnasbkudmxks0IZbDgp8OH6EkEd8WL79yg
 q2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789835793; x=1790440593;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=pJ28cHowv2HLnpOJRj1oQbuL618/VrEMiwXGJwvRFsk=;
 b=sSCg5OJ0ua9chFBGXB/37X8KS2xNCfGCvnPADOxVkwTbKyCefQeVeMyKi2HnE1U8Oc
 AHkwuX0zZ1ViY90Px+SdV3SUthi73mBBLEHr1nJXWCl+npNDj7WQoepp5jxnS0MfqRgl
 Xi/tyQIZMHYlybJehEHXn4w36QyEkqqxcw8imvtdfAVgyL0vmgL3HWJfwus/7hHNmC/r
 sJpkjCWNQUQZ5vI4wY5JRhL28Y+M4oyUjC/dSLQf6q2x//qUtjTGkTCwgBrKtYV5Yg95
 o1JiRoJpxUa/VKDtazX4A6hpWW5DToCtRTXjFHRLGKUnepEwuq8rVwQYvyIwOj5/yngI
 wAAA==
X-Gm-Message-State: AFuF++mRvQ79vLL4Ggh8m+NUXEmMs+P88y1n5LPj3HO+vp4E06UewWI4
 kKU1Xk8lRsosE1PpzqnXDVBP2l1Mo8Bl04BkjMFd0ZFBYKmnnpsw4OvYf2ou
X-Gm-Gg: AYBFou1MIu3ditOg1sU4EkC2BgSiddM5M1lvjq5jBeGomJNQ3D1dCpJO2PM3sUy+Lx2
 qLuEFLo8TQicmsYqREcZg2YiVx8JRSBNyx0SaK+kyFeRoUu4kzj1ORVMdRgcQFHYyZ7ahQ6ymLD
 VrDyQfFZ7A+/jH6D0gp07KffwgtfVlGWHKWc/TMxWd3ns9Z/VuG8+pGOr2bQj+h8v8HVdFl827l
 gNxqYQUpRyPHD/CGdegoHkWCC1CUEB+tmbGc1f3PEXLpwgwMqd4/8JgtAaTZ5rLbYYKPyfJVfwi
 EY8sOAYOHBnSSMSH9CvflzwtnsiWWHSX4rQUK/16t3MB4pzZNDvjo7ROWe2w91mfx0mZQU3wT9+
 EwRSbLN3ClYyFH8UjmxCHZWRWkSlmfkAnwaIAh3M+KPhqcP+60flRQm9HkTIA109zcxlMyK3rrI
 lvAAPV4hc8FlNo5BP8pOeqO8Qyt8HV5d51zE6GEhYLK/PxAtPi896XJ15ReFNi/M8uws5cmQTda
 g==
X-Received: by 2002:a05:600c:4e90:b0:49f:ce78:356f with SMTP id
 5b1f17b1804b1-49fce7836a5mr25841625e9.32.1789835793203; 
 Sat, 19 Sep 2026 09:36:33 -0700 (PDT)
Received: from devhost1 ([2a02:a319:a1e0:eb00:4f4b:8c9c:b29:87a9])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724595289sm8570129f8f.29.2026.09.19.09.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2026 09:36:32 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, Alexander Shirokov <shirokovalexs@gmail.com>
Date: Sat, 19 Sep 2026 18:35:56 +0200
Message-ID: <20260919163604.897135-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nnn: add BR2_TOOLCHAIN_HAS_THREADS
 dependency
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

bm5uIGxpbmtzIGFnYWluc3QgcHRocmVhZC4gU3BlY2lmeSB0aGUgZGVwZW5kZW5jeSB0byBhdm9p
ZAp1bmV4cGVjdGVkIGJ1aWxkIGZhaWx1cmVzIG9uIHRvb2xjaGFpbnMgbGFja2luZyB0aHJlYWQg
c3VwcG9ydCAoZS5nLgpici1hcm0tZnVsbC1ub3RocmVhZCkuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4
YW5kZXIgU2hpcm9rb3YgPHNoaXJva292YWxleHNAZ21haWwuY29tPgotLS0KIHBhY2thZ2Uvbm5u
L0NvbmZpZy5pbiB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ubm4vQ29uZmlnLmluIGIvcGFja2Fn
ZS9ubm4vQ29uZmlnLmluCmluZGV4IDY0Y2ZhOGUwYTUuLjU1NWFiODY0ZDkgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2Uvbm5uL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL25ubi9Db25maWcuaW4KQEAgLTEs
NiArMSw3IEBACiBjb25maWcgQlIyX1BBQ0tBR0VfTk5OCiAJYm9vbCAibm5uIgogCWRlcGVuZHMg
b24gQlIyX1VTRV9NTVUgIyBmb3JrCisJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJF
QURTCiAJIyBCdWlsZGluZyBubm4gd2l0aG91dCB3aWRlY2hhci9VVEYgc3VwcG9ydCBpcyB0aGVv
cmV0aWNhbGx5CiAJIyBwb3NzaWJsZSwgYnV0IGluIHByYWN0aWNlIGl0IGxlYWRzIHRvIHVuc3Rh
YmxlIGJ1aWxkcy4KIAkjIFRoYXTigJlzIHdoeSB0aGUgV0NIQVIgZGVwZW5kZW5jeSBpcyBoZXJl
LgpAQCAtMTUsNiArMTYsNiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfTk5OCiAKIAkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9qYXJ1bi9ubm4KIAotY29tbWVudCAibm5uIG5lZWRzIGEgdG9vbGNoYWluIHdp
dGggd2NoYXIiCitjb21tZW50ICJubm4gbmVlZHMgYSB0b29sY2hhaW4gd2l0aCB3Y2hhciwgdGhy
ZWFkcyIKIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1VICMgZm9yawotCWRlcGVuZHMgb24gIUJSMl9V
U0VfV0NIQVIKKwlkZXBlbmRzIG9uICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJfVE9PTENIQUlOX0hB
U19USFJFQURTCi0tIAoyLjU1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
