Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A27D9CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 18:05:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 608AA814BA;
	Sat,  3 Oct 2026 18:05:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiTNTcBcVlUc; Sat,  3 Oct 2026 18:05:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1CEFA814BB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791050719;
	b=nvJgC48zr2d3YGXpVueYX4I+HB/SpZNvjVl+yDqz8BTYiuORZiRX8VixPWfhjbAQ31a0
	 x/vI9qKVW7F1EDYFeNpsB7g3VzJdYh/ggNipNDGBkN7x6XnwcBNgy6qMVVrhOTPET9B5t
	 dUyRW0kwuX6QbSix6x5vUeiSFzdMrVM/F4r68EJDJ1+m67Z8Qpmt2zassnmZBFbAWTjnP
	 PeaNHSaq6WQrDQJvNo9KCDPRgb33D7dSZtFUGqG78I/KBuiHfe+E9aDAxxXWhvChJ+Yyg
	 wFyobf4CGgxItUdyNiHI7kXVvMXeUgkozGqppzU0v1snnMkWphAGRG/X+26pqK79Fjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791050719;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=iwTY9hVOs0XljN+GTa3vJb1hwA0r1qu8SKST/+Uw7ao=;
	b=hN07FQVksrsTlhjqfDgUEmZHh+jQovn1cX6NjthNXf9KYoIcF1nX0QmhvsFFT/VE+8pq
	 rVZpyrwThHYmd4C7voMunThqLMu4Fvmic0zZRWsmvUHtm2eOxDe9XOej9457XTZB8PQYw
	 8pAKZ3tcwzG24xO08yQK/+Y5Bi0EYjP/n+F6Q/6s6sgY7xEgrVshoaG8DWLVh/viJ8w9w
	 moBuHhzzb+uTyndSf5/QgcdnPbJ1YDOXMmm2Uay2zrP1v7V1W288fvFkCj60+nsZfp265
	 GieVLb87J4x84P+PAzrnzr+xkj6arQw7IWKx271F/T/P6v4eug89Ll/4yZiesScVxyQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791050719;
	bh=iwTY9hVOs0XljN+GTa3vJb1hwA0r1qu8SKST/+Uw7ao=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nHKOohYpYFPBHd7y/92xfEVD+yWL2XXQE7umnpdLPJhKQVSw0/DTjV36mud4EGl9N
	 rGAmTK/p+1oeP3/2kGZdLN1G95quHAA0MuceB1jrPOQCx/CSK5IlCB8C8OQCwm2SZ+
	 0JLP0DRCb10/KqkwQFtJ6PAq8Q5Odl/U/VuuyvkXid7Fq8LNuJ27ZcO6GPDZmkPMu6
	 7TnP6TzF+fg5VTN6/liSNwwE4BDNXl3oWoKGaIZ22JTuQ6r+qhhlzuYGr7nL/VzRto
	 hhDNt8PdJCQVAZJ1jklCWHzthdhXaNi7U/suQavf5wQAp9vQ1ANMRbnJ53xmTQpXeI
	 EayjDfpSG/I8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CEFA814BB;
	Sat,  3 Oct 2026 18:05:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56F7F435
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C2F740E2A
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:05:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oK3JW_BI9Ke6 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 18:05:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 54B0640E0C
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791050716;
 b=OAXd+lGGT3AOjpYmG/CzNzj/RmEeorqDFgw/UkhApYCJw9yp+qic2sAqrWZiZI2Oro8U
 IVhBfPP2UFE31w/CGpXFrcDXWcNB7op01YpLCvXOY8xVTyHRY6uNQvVOBhq1TjpNiqPaw
 MKNmybMe1y4/z7zPNG0zP+pjMnHy7epk5EclEeZplK+is5oYEf9efLJCHEfrXKdGc6uBv
 mqxTCNM6O6XgRUth154IX+fqJkq+cLiF1ee4QQB89EzHqfstlB6pvKAsD2uM7U+kwcUwB
 x2v/JxEhKHNxnzBeTag56lVNJX99K1mPlHGJ0x7xYO/L9I5CcRUk3+G4YwiUkcJG+6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791050716;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=zCzbpKLvd4hTFTpU8yQTZW6rh3ejekV/sY4sp7f5YVA=;
 b=SF+noMebmvQCuZ4b6b58uOaUWNmTy1p5IzWanqcRpCMl6wEwVktS6H0sI16F9u0azZ0H
 kjjlf/qrwRusc9dAyZFJglsWxMhkrTj4WA3543NV4O8ftoueZnEEcQeYQ/XsV9b8EYywp
 8A5KeOo5EVNWxD+zR6kL5enU/1tKIlId+efCI/dxDC9aWf5NEif06myHj2t823L2nC9t7
 HzWK4NL7PLljMSVylMWaoqDBx2vw02ok6ZE1EWNBmkLHDK819KJncyzxDIFukw5Jl4pLk
 dhSwqljd5quLOuHyH3WNlYq2I9d5adzVpXD7i1ifTIPa1fqWy/1QXFmg7hHfpM0rQCw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=bearware.dk; 
 dkim=pass header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=P49HVM5f; 
 arc=none smtp.remote-ip=94.231.106.210
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=94.231.106.210;
 helo=smtp-out3.simply.com; envelope-from=contact@bearware.dk;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=bearware.dk
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=bearware.dk header.i=@bearware.dk header.a=rsa-sha256
 header.s=simplycom2 header.b=P49HVM5f
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 54B0640E0C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 18:05:14 +0000 (UTC)
Received: from macmini (85.191.81.201.dynamic.dhcp.aura-net.dk [85.191.81.201])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by smtp.simply.com (Simply.com) with ESMTPSA id 4hxtps64dWz1DHpS;
 Sat,  3 Oct 2026 20:05:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bearware.dk;
 s=simplycom2; t=1791050712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zCzbpKLvd4hTFTpU8yQTZW6rh3ejekV/sY4sp7f5YVA=;
 b=P49HVM5fDAzDuEH0nLTtq4ce4OdFOJ8lNJ4hCYRkT1DA6Jkis6BrvUG61ffsI+FNvLKJDB
 rtz0BwzxivDikF3K4eSzROISiUepFkfhiBcNVne5PsonKusSOKGFqXd44xlvHlX+uLuLMw
 W38iGn0WI/kub5rTbnwcMcaw8OBbKwnB1Ukp7uoHsK8y+ia4TjrrNQ+8vp0pUak5XPS5wK
 mBDnzF0jNJE7IIcEvRnxc4S1DNtBEAO92ap5zSw9EadgWuuDeGvN5y1Ojy8FXaCaH9MISn
 yoMno2zQSxD2ANfqA7gBNuYi34oB3UR2KqmvyZ9LED6n2ZyNImeg7XucbBtClA==
From: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Bj=C3=B8rn=20Damstedt=20Rasmussen?= <contact@bearware.dk>
Date: Sat,  3 Oct 2026 20:04:59 +0200
Message-ID: <20261003180459.1243570-1-contact@bearware.dk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openjdk-bin: CPE ID for openjdk-bin
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

VGhlIENQRSBJRCBvbiBvcGVuamRrIHZlcnNpb24gMjEuMC4yIGluIE5WRDoKaHR0cHM6Ly9udmQu
bmlzdC5nb3YvcHJvZHVjdHMvY3BlL3NlYXJjaC9yZXN1bHRzP2tleXdvcmQ9Y3BlOjIuMzphOm9y
YWNsZTpvcGVuamRrOjIxLjAuMjoqOio6KjoqOio6KjoqCgpIT1NUX09QRU5KREtfQklOX0NQRV9J
RF9WRVJTSU9OIGhhcyBiZSBvdmVyd3JpdHRlbiB0byBtYXRjaCBOVkQncwp2ZXJzaW9uaW5nLgoK
U2lnbmVkLW9mZi1ieTogQmrDuHJuIERhbXN0ZWR0IFJhc211c3NlbiA8Y29udGFjdEBiZWFyd2Fy
ZS5kaz4KLS0tCiBwYWNrYWdlL29wZW5qZGstYmluL29wZW5qZGstYmluLm1rIHwgNSArKysrKwog
MSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3Bl
bmpkay1iaW4vb3Blbmpkay1iaW4ubWsgYi9wYWNrYWdlL29wZW5qZGstYmluL29wZW5qZGstYmlu
Lm1rCmluZGV4IDVmMTkyMmRlYTUuLjRhMjFjYmI0NjAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2Uvb3Bl
bmpkay1iaW4vb3Blbmpkay1iaW4ubWsKKysrIGIvcGFja2FnZS9vcGVuamRrLWJpbi9vcGVuamRr
LWJpbi5tawpAQCAtMjksNiArMjksMTEgQEAgSE9TVF9PUEVOSkRLX0JJTl9WRVJTSU9OID0gJChI
T1NUX09QRU5KREtfQklOX1ZFUlNJT05fTUFKT1IpLiQoSE9TVF9PUEVOSkRLX0JJTl8KIEhPU1Rf
T1BFTkpES19CSU5fU09VUkNFID0gT3BlbkpESyQoSE9TVF9PUEVOSkRLX0JJTl9WRVJTSU9OX01B
Sk9SKVUtamRrXyQoSE9TVF9PUEVOSkRLX0JJTl9ET1dOTE9BRF9BUkNIX05BTUUpX2xpbnV4X2hv
dHNwb3RfJChIT1NUX09QRU5KREtfQklOX1ZFUlNJT04pLnRhci5negogSE9TVF9PUEVOSkRLX0JJ
Tl9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2Fkb3B0aXVtL3RlbXVyaW4kKEhPU1RfT1BFTkpE
S19CSU5fVkVSU0lPTl9NQUpPUiktYmluYXJpZXMvcmVsZWFzZXMvZG93bmxvYWQvamRrLSQoc3Vi
c3QgXywlMkIsJChIT1NUX09QRU5KREtfQklOX1ZFUlNJT04pKQogCisjIE92ZXJyaWRlIGF1dG9t
YXRpYyBDUEUgSUQgYmVjYXVzZSAnXycgaW4gJChIT1NUX09QRU5KREtfQklOX1ZFUlNJT04pIGlz
IG5vdCB1c2VkIGJ5IE5WRAorSE9TVF9PUEVOSkRLX0JJTl9DUEVfSURfVkVORE9SID0gb3JhY2xl
CitIT1NUX09QRU5KREtfQklOX0NQRV9JRF9QUk9EVUNUID0gb3BlbmpkaworSE9TVF9PUEVOSkRL
X0JJTl9DUEVfSURfVkVSU0lPTiA9ICQoSE9TVF9PUEVOSkRLX0JJTl9WRVJTSU9OX01BSk9SKS4k
KEhPU1RfT1BFTkpES19CSU5fVkVSU0lPTl9NSU5PUikKKwogSE9TVF9PUEVOSkRLX0JJTl9MSUNF
TlNFID0gR1BMLTIuMCsgd2l0aCBleGNlcHRpb24KIEhPU1RfT1BFTkpES19CSU5fTElDRU5TRV9G
SUxFUyA9IGxlZ2FsL2phdmEucHJlZnMvTElDRU5TRSBsZWdhbC9qYXZhLnByZWZzL0FTU0VNQkxZ
X0VYQ0VQVElPTgogCi0tIAoyLjUzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
