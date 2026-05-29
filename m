Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2842CD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 19:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 610BB83AB9;
	Fri, 29 May 2026 19:07:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N60hGoBFrxgE; Fri, 29 May 2026 19:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B458C846F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780081634;
	bh=eClMKByVLzW0n+4s0/EHAXnaS08Dwi2rVxRzcxyq9sI=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=XEpcqdgH/mxuSlnknEadlZWDkDNoVrSkm3mFamDqn24fzmA7y65i2m7gdy4qkPopo
	 zjuu7cOQUwTJ87SDdv0qj7qWOcpM2zHxHG8wzJipbsLHvPP9vCy7Iib52zJHZPphPP
	 jbydAfiKtwBb5bY0Ix4o2Utws35yPlG8GKYJJwUXczhG3Z00u4AK9QAFHi9ITCx2Rd
	 wwT3OURby3QLU+uEK5lGXw4n72VBk+XTWbNtgjhRthuvBSz88vMkLdaaGygeT4WYc3
	 cWaTz8CL30DLrv0ARTdRAOhuRy77t8LPkywWuAaYgJi0A0I+l9laq0ywPN0B8b6HTa
	 rBkqyJQEAlR2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B458C846F4;
	Fri, 29 May 2026 19:07:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11548288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3F7E42259
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:07:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uk0_3slWidRN for <buildroot@buildroot.org>;
 Fri, 29 May 2026 19:07:12 +0000 (UTC)
X-Greylist: delayed 7215 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 29 May 2026 19:07:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9BAAA40449
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BAAA40449
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.103;
 helo=smtp-outgoing-1802.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
Received: from smtp-outgoing-1802.laposte.net (smtp-outgoing-1802.laposte.net
 [160.92.124.103])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9BAAA40449
 for <buildroot@buildroot.org>; Fri, 29 May 2026 19:07:10 +0000 (UTC)
X-mail-filterd: {"version":"1.9.5","queueID":"4gRqXB0hDbz14K0D","contextId":
 "05cdf57c-2bcd-4b84-b9f9-05917fea81b6"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0109.laposte.net (SMTP Server) with ESMTP id 4gRqXB0hDbz14K0D;
 Fri, 29 May 2026 19:06:50 +0200 (CEST)
X-mail-filterd: {"version":"1.9.5","queueID":"4gRqX95sSXz14K0b","contextId":
 "fda3b3b5-4a80-4bac-9b28-7c3c7e9ac49a"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-160-203-96.subs.proxad.net [88.160.203.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mlpnf0109.laposte.net (SMTP Server) with ESMTPSA id 4gRqX95sSXz14K0b;
 Fri, 29 May 2026 19:06:49 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 836627038AE7;
 Fri, 29 May 2026 19:04:45 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.99.1)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1wT0fT-000000001JL-3hDX; Fri, 29 May 2026 19:06:43 +0200
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Date: Fri, 29 May 2026 19:06:41 +0200
Message-ID: <20260529170641.4981-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1780081628;
 bh=HrnbuI/yGya6dOHp32/OU4xoPMJQrmODhKFdAIZciM4=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=DdyxZduaoYjQdgxxYr81vkK4M2uQBs9gV8PkRzGg1c28pCt6dDaEuTmMz+9urCBttr21/8ORBPtrlloe/BRWjuca6WQkQ44IDQn54RaBSHEULqMk5+252z1nfMpQAIVkcpl2wO86NA4Hh4zIXkMmF53Nygaw+z4JFNBwP6MHwuZguC4RMdlIR1lYcTz/Mzvr8XmHcMI+W4g/kfNiMxA+KTOKRq7VXMWmKFFONy5O/ZsVMV8OvVYd0hoglShDNifhRmfV5yg5EjaaJxxhuVA5y79XpSW3v7LYMbRoBH0T9yBv3aLONBRVKXy9u6RB0varqmXgZRMSOkkOF/Vo5r38Xw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=DdyxZdua
Subject: [Buildroot] [PATCH next] boot/palo: bump to 2.29
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nOgoqIHBzY19taXNjOiBBZGQgZnVuY3Rpb24gdG8gZ2V0IFBEQyBmaXJtd2FyZSB2
ZXJzaW9uCiogaXBsOiBGaXggbWZnIG1vZGUgb24gQzgwMDAsIHJwMzR4MCBhbmQgcnA0NHgwCgpU
aGlzIGhhcyBiZWVuIHRlc3RlZCBvbiBocCA3MTIsIGJvb3RpbmcgZnJvbSBuZXR3b3JrIGFuZCBm
cm9tIGRpc2suCgpTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxl
QGxhcG9zdGUubmV0PgotLS0KIGJvb3QvcGFsby9wYWxvLmhhc2ggfCAyICstCiBib290L3BhbG8v
cGFsby5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYm9vdC9wYWxvL3BhbG8uaGFzaCBiL2Jvb3QvcGFsby9w
YWxvLmhhc2gKaW5kZXggMmE3ZTJlZjg5YS4uOTAxOWQwMGYwNCAxMDA2NDQKLS0tIGEvYm9vdC9w
YWxvL3BhbG8uaGFzaAorKysgYi9ib290L3BhbG8vcGFsby5oYXNoCkBAIC0xLDMgKzEsMyBAQAog
IyBMb2NhbGx5IGNhbGN1bGF0ZWQKLXNoYTI1NiAgNzNkYjlmNjBkNDM5YzRhZTlkMzFiMDQ5Njcx
MjgzZTAxZDk1YWUzNjRmYzc4YjRkYjM3ZWVkNTUyMzIxOGQ2YyAgcGFsby0yLjI4LnRhci5negor
c2hhMjU2ICBiY2EwOTYxMTZkNDAzYjdkMzcwNzk0ZDg0ODUzYzRmNGE0NzAzZDYwNGMwMWE2NDVk
MWZiZDFjNWJlNDJhN2UwICBwYWxvLTIuMjkudGFyLmd6CiBzaGEyNTYgIGZhNWZjMWQxZWVjMzk1
MzJlYTUxNzUxOGVlZWZkN2I2ZTNjMTQzNDFhNTVlNTg4MGEwZTJhNDllZWU0N2E1YjcgIENPUFlJ
TkcKZGlmZiAtLWdpdCBhL2Jvb3QvcGFsby9wYWxvLm1rIGIvYm9vdC9wYWxvL3BhbG8ubWsKaW5k
ZXggZGFkYjBjZGU5Mi4uZDI3NjEwNDJmNSAxMDA2NDQKLS0tIGEvYm9vdC9wYWxvL3BhbG8ubWsK
KysrIGIvYm9vdC9wYWxvL3BhbG8ubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwogCi1QQUxPX1ZFUlNJT04gPSAyLjI4CitQQUxPX1ZFUlNJT04gPSAyLjI5CiBQ
QUxPX1NJVEUgPSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC9kZWxsZXIvcGFsby5naXQvc25hcHNob3QKIFBBTE9fTElDRU5TRSA9IEdQTC0yLjAKIFBBTE9f
TElDRU5TRV9GSUxFUyA9IENPUFlJTkcKLS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
