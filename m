Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BA2CCA464
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 12:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5338813EE;
	Fri, 16 Oct 2026 12:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EXpuY0gnP1wL; Fri, 16 Oct 2026 12:33:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C9811814C2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792154012;
	b=lnHuuNTfef8xS1WE3lMWYhdXY7mVG+KKlROx8myVqPwIKRUzLYQyHW2AZtlc0Je4vHxv
	 fx/AmhD434Y39vZlF8Eu52ZPj8TCNdf/VdN/hfv51qDmfo2LzQ8MMj86yr9t1BUuTESdx
	 l7/N0tnx7LdDChDkgEMt+2OGtNlb4rkYWdE0R/fOzmWf+oaA6KaJnRN76ckjtvcPA2rZK
	 jgkhhLaADDp+WK6UgooRZUhiDllhimSHWHUXCFgQKzUCuKqBruPr8o+4q3basXOmm3sVF
	 1syTN+Xx2Rif/6s1tYhNry7pIDDptTTkfqB8+xPuIloK8mQbMq+K05ajn69qTFpQWGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792154012;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=TpnUFhhnixPjq4G3khT+uBHjqNKhE/DKCbWDicxV5gM=;
	b=fhkAYAxZZ6eME1eRhn6E6sondD5C4O0/zUqgb6nMbvZR7k2yYN7pUfTH9JgF2Km5ZIEf
	 AqQLdWtbROl9oBf1VqX9q2pLDe2VnF5OMyeYCLQRQopAVEO1iqpnEWxSoqoTFBVMfBlP9
	 ijBl2wUzlMpCjq4bPzVJzPdHE5oHz7/HcaIknI5RSycKzu2ps2N7f/dRPOzvnk0MmyGzL
	 XPb7WHMHRYxnB79Xm3cASF8nzmDXf4JzafWjWxyzU5WDXOxQeeHGsmWERj2ofGWAFNWw1
	 CCi6kvxVJUrnaFaoY4CU6l4UPEwXBIKbuynkLZypHNEumB40Tq1mSHzHGHeY2lReq2Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792154012;
	bh=TpnUFhhnixPjq4G3khT+uBHjqNKhE/DKCbWDicxV5gM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NyFlugfm4cpDkkoIjvhVN7QUaftG8owTNR3Fjtwz1FlVcP/wCj4kJtMvO17nGnXrw
	 2X7mS3G7OeCHSgQQ6J05WeZkJzzZV0sOOAhDydRJAJSJJSWgzrNa1BAnRd9wasBQgY
	 vWWwraTt33zyoNM126m9AFu93jGN9TbrOS4MaKHCBOGzrcadXTf8F+ewZtIHzbVvX0
	 hTVOh0ornFm4gvvi1eHuSV6I2EJ9r9wDzXeo6cKO9xfJwSWdNGNP9Ek1XbqBKh2C5U
	 L/YIEdlRuqdtm9WYosA8iibIZUOI62EExxNpGT11FI7nBu9dz2fMQD3Dmnn3fikE4+
	 iT2PEgx2WqwxQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9811814C2;
	Fri, 16 Oct 2026 12:33:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0BD4769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6B8C4016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:33:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMUOA5NvMM4b for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 12:33:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7DE9F4016B
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792154010;
 b=f89BEHNwLdAoQCydRRKjSAW3wbc9RsfXr4mMn8Kxj++sh4BFC5Kke0eo8MLJxuo0apUB
 3PMqKP91YQIxVR9ciUqDo3s4pc+ludVsdMd2zcMVEbZ0uZAVeHrmXOpMPa3zI/5jyMI5x
 UvzwNJraPrk5c9oZkxOcZE1CusYsMlA3ph5d98qSKklcutYopUkT008uHew7FBbrEz1Nk
 mrBhSCEqFk1OXV8lLxvfuOaZX1boWKQAuwYh2UJVV/tocfKhzot44PeuYtIltv+QeSiRX
 y0Ni2/SXzgiRCtlGN6n6ql2YGKXojCJU6k4sYpIOsHdL9ltmTzCba1Bu8vuoiIWW13w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792154010;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=YmsTYz+dXFPa0rs1RkkXfgo9x95sNPHDU30hniTqqGA=;
 b=UxDnBQaQKGye0/ic2hsxaUBUBEA0oHzxUp7ku0KTsQfzNehkuH2hMqg5enA+wmJUqCyT
 DPals/6UpbqX90SVZSTboLNNAz3irYReYY0EaST2DghhVVefkcn5M69cFF/ZYMszx36Tr
 ji7k4kIW8zzWTgMSs6yhUgX9HE+ivkH9g2ka6m8xnRKQIaQabLVLDBurJ+oNnY5ZV9YTg
 2aJ4DcSVcy+WH/IA/sbgtehY3WTisQJTSBa0oC7vseuM002/UW8WBILhptV01MkAMvJVo
 pCqNIPFe7/qzkhx7xytd+uq26RlPDOdWk5rdcFQ0aQ1Y+YaL9KNSeYDY+sELcTSu4Yw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lVODZype; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=lVODZype
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DE9F4016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:33:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a1d293b293so2253115e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 05:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792154008; x=1792758808; darn=buildroot.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=YmsTYz+dXFPa0rs1RkkXfgo9x95sNPHDU30hniTqqGA=;
 b=lVODZypeD7IoXYNUYy/nU1oEFsLJ2D+U9IomFs/DX+pTENE1vRy/sF3b4p0sZIhJaL
 6LolPf4oI/BxoA0VDMirss4mkY6bT0rb3uHx4jGKhb3cb2qKm7xJc7KL6smr8/fwUJ41
 47Q17P2HsyuMVVMAuye60bVmaFwYb2YG/kAJJuEwp609MVaP0orR9sQdOIL+yifubC7d
 vftxBU9rf5ZHplmO8whCr941dvRwTqCjOE6T0PCz15DMeMTN76nX3/Qd3sTBxJo/3fi5
 qzJYvZbtpuaWw7xfTz60DFu416bT3wqwQdI1P/n3uByM1yy4QHH0CjrwYQf7E5bQpMki
 JyPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792154008; x=1792758808;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=YmsTYz+dXFPa0rs1RkkXfgo9x95sNPHDU30hniTqqGA=;
 b=tkC6ZF2TARqGnBau/LkBWOh2EZAX7qyiH/FybrZpPXW/cJX3t8xpknObxpTDzNiQUz
 d0H0T9Dt75/GxTUe3PRFITPQ3JrDgOEDLozPQPNxZcVcJruO2XtRDFvB3dDQFg2sh5D4
 CgCQh+OFSENcn6DvemN65/cmO6mNIWLwyEWQ6KPzkiH46GSKVRqyS5V/XviDbP4T5jzF
 D0xZXKhMulZ/XYD4A7OVo/R4ZYAZSuCnfWPMFi1HH0/RMO+4UMmVuTAiQ6Mvdnffmhrn
 svWcYlOOkEJIfiIletY7K5MTzjk6yddqw3aDWv0wM2o1kITNMzFjZQJQsd/5lGQC383T
 PjGg==
X-Gm-Message-State: AFq9FYJ9YnYHGbCp5Rr2dp1nd7Ij/+o72tknjeJiKOvwWa2MuA21FQKx
 Yr/nTr7fLdpsxhGVokj4c2zqKKke/WHUkXqe0nG5I2qFiMma3I2OxCaRYxeG+KsM
X-Gm-Gg: AYBFou3I68+gLxMnYvv9AYwchdwIYa6B0iO3a5PEwW1d/7ilqfkxBUSYtNuTertklyh
 rGRyV0RkF5eluxPkLcsaho5AcRTN4dZH/7FScEmcYnlspIDskDMTI7C9SvCc40KFNmRXSFfe/J+
 xxFBOqp401cmeQfXaV6sktZ1U1tG2dUzUM06WH4pQIJa/kqYLpXHYlWXM1B0NNbTKWXhCPUvsvI
 IWp2nzmXO7p51zXQD0/fnifQA0OU5C2mr4F1Wl87Igej6tIOesY5oNg9DmXTr866Vp5WBQKapPs
 Px/Cim9fqjEGlz+2b/9RHTvO3a9mkibmQ42nzg3Auf7oxfwIgPlxocesd2bgQ2pWpSA6RSd+hlZ
 ih9uZ2UFxbgttQv+ER+LBompyaN7FudOrtF4xVxQstaj4D0EKIbBvS1mQv4IrHzLsrKpzzrl0Ie
 6I9mXY7Ex2YWhFBd10gkd5pXGwmLnlHHpdavqpYFiB9bRIpnLZpanRVWjAG+Gl9ICkIX9+HY8z/
 7tkY7CIdMxi6T7UiAHNK4EiwOtzrDgYogMo5RZ+HzFumBJQryfD
X-Received: by 2002:a05:600c:4688:b0:49f:f963:7093 with SMTP id
 5b1f17b1804b1-4a18e4ce84cmr473987825e9.23.1792154007578; 
 Fri, 16 Oct 2026 05:33:27 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([93.122.248.104])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ce325107sm38161785e9.3.2026.10.16.05.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 05:33:26 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:32:58 +0300
Message-ID: <20261016123321.7165-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 1/2] package/python-snappy: bump version to
 0.7.2
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>, Julien Olivain <ju.o@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RXZlbiBpZiB0aGVyZSBpcyBhIDAuNy4zIG9uIFB5cGksIHRoZXJlIGlzIG5vIDAuNy4zIHJlbGVh
c2Ugb24gdGhlIHByb2plY3QKaG9tZXBhZ2UsIGhlbmNlIHRoZSBidW1wIHRvIDAuNy4yLgpTaW5j
ZSBzdGFydGluZyAwLjcuMCBiaWJyYXJ5IGlzIHN3aXRjaGVkIGZyb20gc25hcHB5IHRvIGNyYW1q
YW0sIHVwZGF0ZQp0aGUgUFlUSE9OX1NOQVBQWV9ERVBFTkRFTkNJRVMuCkFkZCBhbHNvIFBZVEhP
Tl9TTkFQUFlfU09VUkNFIGZvciBjb3JyZWN0IHBhY2thZ2Ugb24gUHlwaS4KQWRkIGhvc3QtcHl0
aG9uLWNyYW1qYW0gdG8gc2F0aXNmeSBweXRob24tc25hcHB5J3Mgc2V0dXBfcmVxdWlyZXMgZGVw
ZW5kZW5jeQpvbiBjcmFtamFtPj0yLjYuMCwgd2hpY2ggaXMgY2hlY2tlZCBpbiB0aGUgaG9zdCBQ
eXRob24gZW52aXJvbm1lbnQgd2hlbiBidWlsZGluZwp0aGUgd2hlZWwuIFdpdGhvdXQgdGhlIGhv
c3QgZGVwZW5kZW5jaWUgdGhlIGJ1aWxkIHdpbGwgZmFpbC4KClNpZ25lZC1vZmYtYnk6IEZsYXZp
dSBOaXN0b3IgPGZsYXZpdS5uaXN0b3JAZ21haWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2NToKLSBS
ZW1vdmUgZGVwZW5kcyBvbiAhQlIyX0FSTV9DUFVfQVJNVjUgc2luY2UgaXQgaXMgbm90IG5lZWRl
ZAotIExpbmsgdG8gdjQ6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC84NzhxNDRoN2dkLmZz
ZkBkZWxsLmJlLjQ4ZXJzLmRrLwpDaGFuZ2VzIGluIHY0OgotIEFkZCBhbHNvIHRlc3RzIGZvciBw
eXRob24tc25hcHB5IGFzIGluZGljYXRlZCBieSBKdWxpZW4gT2xpdmFpbi4KLSBNb3JlIGNsZWFu
IHBhY2thZ2UgQ29uZmlnLmluCi0gTGluayB0byB2MzogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YWxsLzIwMjYwNzI0MDY1MDA0LjIxNzQxMS0xLWZsYXZpdS5uaXN0b3JAZ21haWwuY29tLwpDaGFu
Z2VzIGluIHYzOgotIEFkZCBuZXcgcGFja2FnZSBjcmFtamFtIGFuZCB0byBmaXggZXJyb3IgaW5k
aWNhdGVkIGJ5IEp1bGllbiBPbGl2YWluLgotIExpbmsgdG8gdjI6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI2MDcxNzA2MTk0My40NDkxLTEtZmxhdml1Lm5pc3RvckBnbWFpbC5jb20v
CkNoYW5nZXMgaW4gdjI6Ci0gRml4IGVycm9yIGluZGljYXRlZCBieSBKdWxpZW4gT2xpdmFpbiB3
aGVuIHJ1bm5pbmcgbWFrZSBweXRob24tc25hcHB5LWxlZ2FsLWluZm8uCi0gTGluayB0byB2MTog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjYwNDA5MTUyNTIwLjU4OTQtMS1mbGF2aXUu
bmlzdG9yQGdtYWlsLmNvbS8KCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgMSArCiBwYWNrYWdlL3B5dGhvbi1zbmFwcHkvQ29uZmlnLmluICAgICAgICAgIHwgNiAr
LS0tLS0KIHBhY2thZ2UvcHl0aG9uLXNuYXBweS9weXRob24tc25hcHB5Lmhhc2ggfCA0ICsrLS0K
IHBhY2thZ2UvcHl0aG9uLXNuYXBweS9weXRob24tc25hcHB5Lm1rICAgfCA3ICsrKystLS0KIDQg
ZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9ERVZFTE9QRVJTIGIvREVWRUxPUEVSUwppbmRleCAzNDlmYjFkMjZhLi4yNzczZjA3NzZh
IDEwMDY0NAotLS0gYS9ERVZFTE9QRVJTCisrKyBiL0RFVkVMT1BFUlMKQEAgLTExNDYsNiArMTE0
Niw3IEBAIEY6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3B5cm91
dGUyLnB5CiAKIE46CUZsYXZpdSBOaXN0b3IgPGZsYXZpdS5uaXN0b3JAZ21haWwuY29tPgogRjoJ
cGFja2FnZS9weXRob24tY3JhbWphbS8KK0Y6CXBhY2thZ2UvcHl0aG9uLXNuYXBweS8KIAogTjoJ
RmzDoXZpbyBUYXBhasOzcyA8ZmxhdmlvLnRhcGFqb3NAbmV3dGVzYy5jb20uYnI+CiBGOgljb25m
aWdzL2FzdXNfdGlua2VyLXNfcmszMjg4X2RlZmNvbmZpZwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9w
eXRob24tc25hcHB5L0NvbmZpZy5pbiBiL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9Db25maWcuaW4K
aW5kZXggZmQ3Zjg0MDUwZi4uM2FkZDE1YTNmOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9weXRob24t
c25hcHB5L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvQ29uZmlnLmluCkBA
IC0xLDEyICsxLDggQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9QWVRIT05fU05BUFBZCiAJYm9vbCAi
cHl0aG9uLXNuYXBweSIKLQlkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUCAjIHNuYXBw
eQotCXNlbGVjdCBCUjJfUEFDS0FHRV9TTkFQUFkKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfUFlUSE9O
X0NSQU1KQU0KIAloZWxwCiAJICBQeXRob24gbGlicmFyeSBmb3IgdGhlIHNuYXBweSBjb21wcmVz
c2lvbiBsaWJyYXJ5IGZyb20KIAkgIEdvb2dsZS4KIAogCSAgaHR0cDovL2dpdGh1Yi5jb20vYW5k
cml4L3B5dGhvbi1zbmFwcHkKLQotY29tbWVudCAicHl0aG9uLXNuYXBweSBuZWVkcyBhIHRvb2xj
aGFpbiB3LyBDKysiCi0JZGVwZW5kcyBvbiAhQlIyX0lOU1RBTExfTElCU1REQ1BQCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5oYXNoIGIvcGFja2FnZS9w
eXRob24tc25hcHB5L3B5dGhvbi1zbmFwcHkuaGFzaAppbmRleCBjNGRiYzcyMDc3Li4yZjQwYjZj
NTMxIDEwMDY0NAotLS0gYS9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNuYXBweS5oYXNo
CisrKyBiL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9weXRob24tc25hcHB5Lmhhc2gKQEAgLTEsNSAr
MSw1IEBACiAjIG1kNSwgc2hhMjU2IGZyb20gaHR0cHM6Ly9weXBpLm9yZy9weXBpL3B5dGhvbi1z
bmFwcHkvanNvbgotbWQ1ICBmYzg0Y2ZhMzUyNmZiYTA2ZDY2ZjBkMGIyZTc2NDMwMCAgcHl0aG9u
LXNuYXBweS0wLjYuMS50YXIuZ3oKLXNoYTI1NiAgYjZhMTA3YWIwNjIwNmFjYzUzNTlkNGM1NjMy
YmQ5YjIyZDQ0ODcwMmE3OWIzMTY5YjBjNjJlMGZiODA4YmIyYSAgcHl0aG9uLXNuYXBweS0wLjYu
MS50YXIuZ3oKK21kNSAgMDRhNGU1OGIwYTkzMjQwM2JiMjg1OTAwZTY3Yzc3OGQgIHB5dGhvbl9z
bmFwcHktMC43LjIudGFyLmd6CitzaGEyNTYgIDA0YmYxODJmOWQ5ZjY3YjdhODQ2ZGFlMmYxZGYz
NjE4MGNlZWVlOGQzMzgwZTRiNjc5OWRlZmY1MjcyYzQ5NzggIHB5dGhvbl9zbmFwcHktMC43LjIu
dGFyLmd6CiAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNoZWNrc3Vtcwogc2hhMjU2ICBkMDA3
Y2IwNWYxNDNkOTlkMTZkNWNkMGQxYmYyOTFkYWYwMzdhZGIzNjgwMDM0NGU0NDBlYzI2ZWRiOTM4
ZjlhICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1zbmFwcHkvcHl0aG9uLXNu
YXBweS5tayBiL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9weXRob24tc25hcHB5Lm1rCmluZGV4IGU4
MGFhODYxZGYuLjVkMzRiNmQ0OTMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9w
eXRob24tc25hcHB5Lm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNuYXBweS9weXRob24tc25hcHB5
Lm1rCkBAIC00LDExICs0LDEyIEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1QWVRI
T05fU05BUFBZX1ZFUlNJT04gPSAwLjYuMQotUFlUSE9OX1NOQVBQWV9TSVRFID0gaHR0cHM6Ly9m
aWxlcy5weXRob25ob3N0ZWQub3JnL3BhY2thZ2VzLzk4LzdhLzQ0YTI0YmFkOTgzMzViMmM3MmU0
Y2FkY2RlY2Y3OWY1MDE5N2QxYmFiOWYyMmY4NjNhMjc0ZjEwNGI5NgorUFlUSE9OX1NOQVBQWV9W
RVJTSU9OID0gMC43LjIKK1BZVEhPTl9TTkFQUFlfU09VUkNFID0gcHl0aG9uX3NuYXBweS0kKFBZ
VEhPTl9TTkFQUFlfVkVSU0lPTikudGFyLmd6CitQWVRIT05fU05BUFBZX1NJVEUgPSBodHRwczov
L2ZpbGVzLnB5dGhvbmhvc3RlZC5vcmcvcGFja2FnZXMvY2IvNTIvYWNkODc1ODMxNzVmYTkzMGU0
Mzg1ZjhhNjE2NGViNTkwOWFjZDY4M2MwZTYyZWUwMWQ0MWRlODE5NWEyCiBQWVRIT05fU05BUFBZ
X1NFVFVQX1RZUEUgPSBzZXR1cHRvb2xzCiBQWVRIT05fU05BUFBZX0xJQ0VOU0UgPSBCU0QtMy1D
bGF1c2UKIFBZVEhPTl9TTkFQUFlfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLVBZVEhPTl9TTkFQ
UFlfREVQRU5ERU5DSUVTID0gc25hcHB5CitQWVRIT05fU05BUFBZX0RFUEVOREVOQ0lFUyA9IGhv
c3QtcHl0aG9uLWNyYW1qYW0gcHl0aG9uLWNyYW1qYW0KIAogJChldmFsICQocHl0aG9uLXBhY2th
Z2UpKQotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
