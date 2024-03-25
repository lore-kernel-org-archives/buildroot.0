Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58ADC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 19:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29B2D4012D;
	Mon, 25 Mar 2024 19:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pmyOt_lRhllV; Mon, 25 Mar 2024 19:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C85440137
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C85440137;
	Mon, 25 Mar 2024 19:33:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC9611BF3DE
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 19:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C62B481448
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 19:33:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sZHevleO-jff for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 19:33:13 +0000 (UTC)
Received-SPF: Pass (sender SPF authorized) identity=helo;
 client-ip=85.215.255.23; helo=mo4-p00-ob.smtp.rzone.de;
 envelope-from=nerv@dawncrow.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8812480BD0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8812480BD0
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8812480BD0
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 19:33:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1711394827; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=si3NcZQMydh4Qpb6JJKkegAqynJtXk3/VBbXbGbQ6rNbzdlcXOSO0kLp0K19/8ej8M
 ChjDeSHFSG69aR2H3XPirReqayT0tsKlnZIx/OH8Zl6GadcpMdq3QT2Cbdmo4OlZRZnM
 LYJvEpzJYcpNiLuarQT9dRyol9JD6I7sKZewmtifDhsOhQ9zjaA4ufLdG38yDIgMuXkq
 QWRzHkqJXdWqy0rrurGIZkMpTMKuxaJWxIZnSvOPSBXUk8cMbWHI68q9VllrYTX5ScZG
 YFJJ8JTV3YP5x436nwRfUxI5KCpqTyjngta3qdRxZT/6zA0CF30Xm+oAEgrcH9/pbsdZ
 OBiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1711394827;
 s=strato-dkim-0002; d=strato.com;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=vZK9c0HZJFXzoeuBYgPPS0kuyVuqj9FkAKS8SxoYzGU=;
 b=PzwHfYvhkWGelHoVB9RLYYSt1b6/7TUvmMvxaEMCMUenBl4hnzHTsXPj/ISJC66myz
 rG2H5UrgZdSbtYLBPhPmmtgcWADtJht4JVZjBP/zE0V7H1zcawmPJx0xkM+8Pvg+nClE
 GEya8Wtw8VsmF/seQFDUFd8kavrv4I3zCZOrBzLEQDP1JjI4J6wOXv5hhNhijLf19UJS
 Die+rAcS/Yp3HOxKgk4LFDEWliTyY+CiJOelrDgjk0a65mNulr2fewq5yk+JVUHVlsew
 kpkDcrKO9JlmGPIdqta3ceFe8E0+RBhVObzAX8JNPCsoSwPMmcfozx+ZfY+WAsWFqLBS
 liAQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
X-RZG-AUTH: ":ImkWY2CseuihIZy6ZWWciR6unPhpN+aXzZGGjY6ptdusOK7nWzzuvt/yikxm+CmU"
Received: from tesla.fritz.box by smtp.strato.de (RZmta 50.3.2 DYNA|AUTH)
 with ESMTPSA id j8711202PJR7C1N
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <buildroot@buildroot.org>;
 Mon, 25 Mar 2024 20:27:07 +0100 (CET)
From: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 20:27:04 +0100
Message-Id: <20240325192704.1597001-1-nerv@dawncrow.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1711394827; 
 s=strato-dkim-0002; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=vZK9c0HZJFXzoeuBYgPPS0kuyVuqj9FkAKS8SxoYzGU=;
 b=cQfTk8CwCxbvKRD0wL7uxOiMvw4zGhjJtTiEYTKjqI4KeF35Y4vRTnQef309y+cDAL
 E6b2geHW4xGtJUciQ9OXufhYCo9E/JW986gPmrlPHt3CKTPDkhGCgx2/wMXMOs1G6uEy
 +dkvlVbpcGaRxuNQ7QTFyf8FTZKxFB9aaGjJAAwxTiWS4TfrUmiSJbn+k0vGR2mWh/R6
 vzrI2u0DZayN2F2XCDPqP5xLWcLE/aOnjW9+ZbwxI9OXR4TdVszlisA3YYFW6+T5Kd7N
 MWjRJ1vg0XjYjcMDC1NE8J8gXDerz/n5ud5LT6EP77UISCR07YMJHx4k9D0lg/j76RCl
 WPbg==
X-Mailman-Original-DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 t=1711394827; 
 s=strato-dkim-0003; d=dawncrow.de;
 h=Message-Id:Date:Subject:To:From:Cc:Date:From:Subject:Sender;
 bh=vZK9c0HZJFXzoeuBYgPPS0kuyVuqj9FkAKS8SxoYzGU=;
 b=u8EkDOLGyzdQiD+/aUb4jj4R0JqH71+JYcp/7MDrbyeK95O8Hu5NPQSGX/aCBoogxR
 JhUr2kVu6MZtlHPqrwAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=dawncrow.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=dawncrow.de
 header.i=@dawncrow.de header.a=rsa-sha256 header.s=strato-dkim-0002
 header.b=cQfTk8Cw; 
 dkim=pass header.d=dawncrow.de header.i=@dawncrow.de header.a=ed25519-sha256
 header.s=strato-dkim-0003 header.b=u8EkDOLG
Subject: [Buildroot] [PATCH] package/p7zip: bump to version v17.05
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogQW5kcsOpIFp3aW5nIDxuZXJ2QGRhd25jcm93LmRlPgotLS0KIHBhY2th
Z2UvcDd6aXAvcDd6aXAuaGFzaCB8IDIgKy0KIHBhY2thZ2UvcDd6aXAvcDd6aXAubWsgICB8IDQg
KystLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9wN3ppcC9wN3ppcC5oYXNoIGIvcGFja2FnZS9wN3ppcC9wN3pp
cC5oYXNoCmluZGV4IDAwNDg3NzdkODkuLmYwYjljMjcxMTMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uv
cDd6aXAvcDd6aXAuaGFzaAorKysgYi9wYWNrYWdlL3A3emlwL3A3emlwLmhhc2gKQEAgLTEsMyAr
MSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBlYTAyOWEyZTIxZDJkNmFkMGEx
NTZmNjY3OWJkNjY4MzYyMDRhYTc4MTQ4YTRjNWU0OThmZTY4MmU3NzEyN2VmICBwN3ppcC0xNy4w
NC50YXIuZ3oKK3NoYTI1NiAgZDI3ODhmODkyNTcxMDU4YzA4ZDI3MDk1YzIyMTU0NTc5ZGZlZmI4
MDdlYmUzNTdkMTQ1YWIyZGRkZGVmYjFhNiAgcDd6aXAtMTcuMDUudGFyLmd6CiBzaGEyNTYgIDU1
NTgwNjY1N2RjZjBmMWU3MjBiNTgxYzUyNjQzYzE5NWVjODZhZTNmMDBiZDE4Y2M2NmQyZTBmODhm
ZmEyMTAgIERPQy9MaWNlbnNlLnR4dApkaWZmIC0tZ2l0IGEvcGFja2FnZS9wN3ppcC9wN3ppcC5t
ayBiL3BhY2thZ2UvcDd6aXAvcDd6aXAubWsKaW5kZXggYjZjNWFkYWUyNi4uODAzZmQzOGI3ZiAx
MDA2NDQKLS0tIGEvcGFja2FnZS9wN3ppcC9wN3ppcC5taworKysgYi9wYWNrYWdlL3A3emlwL3A3
emlwLm1rCkBAIC00LDggKzQsOCBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUDda
SVBfVkVSU0lPTiA9IDE3LjA0Ci1QN1pJUF9TSVRFID0gJChjYWxsIGdpdGh1YixqaW5mZWloYW41
NyxwN3ppcCx2JChQN1pJUF9WRVJTSU9OKSkKK1A3WklQX1ZFUlNJT04gPSAxNy4wNQorUDdaSVBf
U0lURSA9ICQoY2FsbCBnaXRodWIscDd6aXAtcHJvamVjdCxwN3ppcCx2JChQN1pJUF9WRVJTSU9O
KSkKIFA3WklQX0xJQ0VOU0UgPSBMR1BMLTIuMSsgd2l0aCB1blJBUiByZXN0cmljdGlvbgogUDda
SVBfTElDRU5TRV9GSUxFUyA9IERPQy9MaWNlbnNlLnR4dAogUDdaSVBfQ1BFX0lEX1ZFTkRPUiA9
IDctemlwCi0tIAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
