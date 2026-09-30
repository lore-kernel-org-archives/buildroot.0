Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F0ACA5FB1
	for <buildroot@archiver.kernel.org>; Wed, 30 Sep 2026 12:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE1AB608A5;
	Wed, 30 Sep 2026 12:01:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9uZggBBnVp7r; Wed, 30 Sep 2026 12:01:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BE9D460B0B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790769672;
	b=Sq/6ohGto1nLFHCx9UcRPSvQrtOJwQd6vGrJXVtnsCtGZVVKw65eSbOFtvAADFd8EUhL
	 EGRmvdgxBaGauKDLCh2D0fMAAW4npipLu4B3gS758AaTi8/ZJkw8mRtcaj4/1E+JmvJKN
	 lpfxUSWkjJ+fX3vMuoHoypyottjgHBDklA827zUNRB/VXue01tQANjNfnKq5bfuS9tEWp
	 XU8CGp/6rgJKUbX6pVhDANAGAgICzEOp+wMNYFLbzFo3S7fVOoa8NCLR2k3swub5Yy/jh
	 0r6n36dyahY9qG08WCwXJTY2+/O+UMUfZhg+Pucnw9Q8J4ptCXbULU95IFr/m+7pNPg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790769672;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ejDeE87U6LRFWfYQYIPZRSRNKmBeyiWdz/nZbqFXUoM=;
	b=lbEUZIx2diieZBBYag83Lh9EUQkbtSo4edpkAC+iKX+0YKTdgdZSU/WY2ntlcHT135S7
	 /gJdjKcMXYUhPgaQziyMoPMF4AcafSQH2CPKWn1BvfeXLrfa0pylEhR3GYwopfYjdN/pB
	 /LbRgIVhM+JlFvs0AepfY5Y0gLJXZbZGvWMwdoZv82+FLEhZh78HLBQ0GVDdMlxWe4YNi
	 oTR894OCnrgPdHcWXwaHvHVUZbyUeaOhe33u19moNZVSWXENezZIke7OCO4LXCoOP7CfG
	 162EalJsc0I04BOQmYyHDY7XUxLbxVqHXfuycFEAKm/gDVKtr6WrhhKnaSy/QhubdwA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790769672;
	bh=ejDeE87U6LRFWfYQYIPZRSRNKmBeyiWdz/nZbqFXUoM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=kNGahBnjLE03nnO3qlsvBs9cHFEYjDTUjLhmd7+VuBSdynzjnkdRrCTs3oOF7O3XA
	 e2h1EzVTT30HjFx3spPPCtkfDAx5VBaLXnw+R7VnFiv8j5vN33YfRTQcvWstPuiUKh
	 uX59THxqYw3fKDyn/T+f8vAav65LThy1M1deeUe/HjNzocYP2pF2nJ/2r6xxjMep9L
	 v7cEL76BtWi7RmbA3j1L+6ViTRJuDQ4Q8Cl871GS5zUTgmeuqbgHNP9uCeQKFSYJ+f
	 WGj+WoUZbNbtwm7T01MseObaWvTWBIdkHruuUkDIm3y/GOTlRD9fLvUiy3mxh0Reyp
	 kDpuBKQJdBIlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE9D460B0B;
	Wed, 30 Sep 2026 12:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 266EE24E
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 12:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17DCB608A5
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 12:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BC1IM2LtOT1D for <buildroot@buildroot.org>;
 Wed, 30 Sep 2026 12:01:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AF00560B0B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790769670;
 b=P1/W+CbAq0eOuh7T3q2OHSyX2zwWFm8f7mSrsiKan73Q65qcK+kvpxQ6hDr5XxbfP7yi
 ngMBepEAtXgOuAbpCGN0TYQrv0WUKxMaTew0zxtpGMOzyE+1tz76fvCM+pPMv7hpaii6P
 PZbUNHyb3MEEDp49f3ow3JrJLoQglsmb3CuMK5HPCJ/dW8nqJqRFs/d4dBywfIq318lMV
 Er5lFPdvywVTaoiei3orLpanUhniJAZiMwshEc92MZUezAtTVtiOrkNPFoKDWFkXwxR3L
 V1arIkSywczQH0CDSPt6CoSbRary5Rs5N3wd1ekUJlTueQi/AnN7wegM0sqsf5PsQdg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790769670;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=rh4owSvq6A3k3lGKWJ2qvBJ0QnCZTEfizJLWAi02lDs=;
 b=bN2BJtPbolw/EDAqqAJHEcDYMDEJFwMN682nIpRAua5YwvtpKG3RfOd57gUNkbH+xnjA
 NPgN37I4l/DfWcK3npa/p15p4C4Z3dDLp42XyNR23nZcjDulX/yFl/a1wc4uiHt7ruY/K
 dpq7a3ioS8VnE2xuZWh0M0k8qH/iMIjzp6PSm85r7Lqnl+QF8Ox7ZBfbvh5zOlUvYMgsV
 22d7CPV/h8DU9Qon3/7J1sMAWHAn6zc9eIcrpFi1cmtctExsrkSZ9AfKG/eJ8sCf0kd6n
 3cghp2mrFqehZ7/9i31Q+MUBj3+5lJ00aKM5e9tldPQL5UZDkC9FB1eduMHKH1cO+Ig==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="Jax/BTLq"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AF00560B0B
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 12:01:08 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49ffed768deso11409195e9.1
 for <buildroot@buildroot.org>; Wed, 30 Sep 2026 05:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790769667; x=1791374467;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=rh4owSvq6A3k3lGKWJ2qvBJ0QnCZTEfizJLWAi02lDs=;
 b=1rTvFgF5JQqPCMaAsuY/acVUhcnc34aY/MiZfUXixntC/peblePOkKeCLu8+wGnxpH
 SME9wyXvB4oy+fpBgd+qdCMTUA/wqzy4qgjjY7zUxxstaeOZmRPmmlAvlD558EPzMq3c
 Q/6x0V0NaXvXiwaMGuAyLjoxWadEuafzHDtv+tUc46PE4wfRx3zfQh9j1BgpTkAXhnME
 BmLa86gh/PM4g51Hl6DT4Ww42v9OiQX5zTlTL0IHzVVbJq6pF4cfKEczEiKx9NqsochY
 seAKQE8WEsY7ViyGneXspivXH5G/nYeKqq/68fDOOFiSaI2EuJhq9unlazEAReUyshlP
 gFEw==
X-Gm-Message-State: AFuF++lVPKS6WEXYxOKTwR0u+VJaVXMlmBZkBilOfnMft8nJVV/nKD2c
 h58SB02F9KRlNMmKfOg4V6niQMiXfbu+6J0PHxHwPhhDtl/uqEuaxWJYDh4UQjuD9Z/3IF3wlM3
 A05NDisW56A==
X-Gm-Gg: AYBFou3JMmmRvhRsS7VNONwL0SqOaxsN1IsaFNyjLFWVQPEU9oHX0fkFXQHv7Ld6xSD
 crNCvfYKw0jMT851tkZMhMPxj6ZNhBVYbK10+yM7TbLkCRTzbL7n+bpPP1qTou6EAJq+JAuHqSm
 P4kPwAwxfY4ASbkkvkH/8InBWSEY3BbdaEKEahPxuNkUDwYIEQh53i/Y2nuqr7HKz6vslO4hD5n
 pK1DcELrEaK6qB/0eGtgrkVeeqOn34FIFzzIw02+6TkWczU2lKtJcQdkj9vfd6f6MCyvosJrNrJ
 qJyQnedopM63wAEGoBfjR/71MzSp4xFX1o7iYiFvcEWKEipgEcJZEQ2xhVjRpcBcC/1pWaiyh2R
 BwMPfnoZtWp+DQ7iMUh0YPaB/d+DPVVXz8ovXDYQfUYuvnbiNNjaqZ6//8DdgSHIGowYBvFx56a
 UKkf82HozaYG7QEjnF0IjKobocCLMB+8J9hBhWKcD7lNSGxVFvZn4vlTUD8+At0X4kzDTQPEzip
 0BpwG1SUKxHEg==
X-Received: by 2002:a05:600c:3151:b0:49f:d69a:1a04 with SMTP id
 5b1f17b1804b1-4a01b1c4795mr18141285e9.16.1790769666940; 
 Wed, 30 Sep 2026 05:01:06 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b029f5bcdsm2994612f8f.27.2026.09.30.05.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 05:01:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 14:00:57 +0200
Message-ID: <20260930120101.474560-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-pipcl: new host package
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cGlwY2wgdXNlZCB0byBiZSBidW5kbGVkIGluIHB5dGhvbi1weW11cGRmLCBidXQgaXMgbm93IGF2
YWlsYWJsZSBhcyBhCnNlcGFyYXRlIHBhY2thZ2UuCgpTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBN
w6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogREVWRUxPUEVSUyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvcHl0aG9uLXBpcGNsL0NvbmZpZy5pbiAgICAgICAg
IHwgIDcgKysrKysrKwogcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLmhhc2ggfCAg
NSArKysrKwogcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLm1rICAgfCAxNSArKysr
KysrKysrKysrKysKIDUgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvcHl0aG9uLXBpcGNsL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2UvcHl0aG9uLXBpcGNsL3B5dGhvbi1waXBjbC5oYXNoCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLm1rCgpkaWZmIC0tZ2l0IGEv
REVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggZDYyYmZhYWZiMy4uMjE3ZmNlMDNhOSAxMDA2
NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0yODQ5LDYgKzI4NDksNyBA
QCBGOglwYWNrYWdlL211cGRmLwogRjoJcGFja2FnZS9weXRob24tYm90bzMvCiBGOglwYWNrYWdl
L3B5dGhvbi1ib3RvY29yZS8KIEY6CXBhY2thZ2UvcHl0aG9uLWptZXNwYXRoLworRjoJcGFja2Fn
ZS9weXRob24tcGlwY2wvCiBGOglwYWNrYWdlL3B5dGhvbi1weW11cGRmLwogRjoJcGFja2FnZS9w
eXRob24tcnNhLwogRjoJcGFja2FnZS9weXRob24tczN0cmFuc2Zlci8KZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvQ29uZmlnLmluIGIvcGFja2FnZS9Db25maWcuaW4KaW5kZXggZGNjYTIxNDM4My4uY2Qx
ZjRlYjM2ZCAxMDA2NDQKLS0tIGEvcGFja2FnZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9Db25m
aWcuaW4KQEAgLTEyOTMsNiArMTI5Myw3IEBAIG1lbnUgIkV4dGVybmFsIHB5dGhvbiBtb2R1bGVz
IgogCXNvdXJjZSAicGFja2FnZS9weXRob24tcGlncGlvL0NvbmZpZy5pbiIKIAlzb3VyY2UgInBh
Y2thZ2UvcHl0aG9uLXBpbGxvdy9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhvbi1w
aXAvQ29uZmlnLmluIgorCXNvdXJjZSAicGFja2FnZS9weXRob24tcGlwY2wvQ29uZmlnLmluIgog
CXNvdXJjZSAicGFja2FnZS9weXRob24tcGxhdGZvcm1kaXJzL0NvbmZpZy5pbiIKIAlzb3VyY2Ug
InBhY2thZ2UvcHl0aG9uLXBsdWdneS9Db25maWcuaW4iCiAJc291cmNlICJwYWNrYWdlL3B5dGhv
bi1wbHkvQ29uZmlnLmluIgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tcGlwY2wvQ29uZmln
LmluIGIvcGFja2FnZS9weXRob24tcGlwY2wvQ29uZmlnLmluCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAwMDAuLjFjYWM4NTM1MmQKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdl
L3B5dGhvbi1waXBjbC9Db25maWcuaW4KQEAgLTAsMCArMSw3IEBACitjb25maWcgQlIyX1BBQ0tB
R0VfUFlUSE9OX1BJUENMCisJYm9vbCAicHl0aG9uLXBpcGNsIgorCWhlbHAKKwkgIFB5dGhvbiBw
YWNrYWdpbmcgb3BlcmF0aW9ucywgaW5jbHVkaW5nIFBFUC01MTcgc3VwcG9ydCwgZm9yCisJICB1
c2UgYnkgYSBzZXR1cC5weSBzY3JpcHQuCisKKwkgIGh0dHBzOi8vZ2l0aHViLmNvbS9BcnRpZmV4
U29mdHdhcmUvcGlwY2wKZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXBpcGNsL3B5dGhvbi1w
aXBjbC5oYXNoIGIvcGFja2FnZS9weXRob24tcGlwY2wvcHl0aG9uLXBpcGNsLmhhc2gKbmV3IGZp
bGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uZjAxYWYwY2NlZQotLS0gL2Rldi9udWxs
CisrKyBiL3BhY2thZ2UvcHl0aG9uLXBpcGNsL3B5dGhvbi1waXBjbC5oYXNoCkBAIC0wLDAgKzEs
NSBAQAorIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9waXBjbC9qc29u
CittZDUgIDc2ODgzMjQzNjEwMjc4Yjc3NzI1ZmViMTgxMzE0MWY4ICBwaXBjbC0xMi50YXIuZ3oK
K3NoYTI1NiAgYzc1NDU0ODBjZmE4MDg1MDBkOGI2MDZkYTczZGI3Zjg5YTg3MjI1OGJjZGIyOTM3
MTYxMjZlMmNjZmYxYTVjNiAgcGlwY2wtMTIudGFyLmd6CisjIExvY2FsbHkgY29tcHV0ZWQgc2hh
MjU2IGNoZWNrc3Vtcworc2hhMjU2ICA1N2M4ZmYzM2M5YzBjZmMzZWYwMGU2NTBhMWNjOTEwZDdl
ZTQ3OWE4YmM1MDlmNmM5MjA5YTdjMmExMTM5OWQ2ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3B5dGhvbi1waXBjbC9weXRob24tcGlwY2wubWsgYi9wYWNrYWdlL3B5dGhvbi1waXBjbC9w
eXRob24tcGlwY2wubWsKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uYzBl
OTdlZWViMwotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvcHl0aG9uLXBpcGNsL3B5dGhvbi1w
aXBjbC5tawpAQCAtMCwwICsxLDE1IEBACisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworIworIyBw
eXRob24tcGlwY2wKKyMKKyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCisKK1BZVEhPTl9QSVBDTF9W
RVJTSU9OID0gMTIKK1BZVEhPTl9QSVBDTF9TT1VSQ0UgPSBwaXBjbC0kKFBZVEhPTl9QSVBDTF9W
RVJTSU9OKS50YXIuZ3oKK1BZVEhPTl9QSVBDTF9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzLzY0LzFhLzlhYjJiMjcyZGVmOWRiOWM4MGJmMThmZTgyODIxMTlj
MmM0YzA3NGNjNTQyMDMwYTI4ZTQxMzZkZDEzYgorUFlUSE9OX1BJUENMX1NFVFVQX1RZUEUgPSBw
ZXA1MTcKK1BZVEhPTl9QSVBDTF9MSUNFTlNFID0gQUdQTC0zLjArCitQWVRIT05fUElQQ0xfTElD
RU5TRV9GSUxFUyA9IENPUFlJTkcKK0hPU1RfUFlUSE9OX1BJUENMX0RFUEVOREVOQ0lFUyA9IGhv
c3QtcHl0aG9uLXBhY2thZ2luZworCiskKGV2YWwgJChob3N0LXB5dGhvbi1wYWNrYWdlKSkKLS0g
CjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
