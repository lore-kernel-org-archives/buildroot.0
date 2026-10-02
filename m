Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FDBCA5FE6
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 21:47:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43F1A600C4;
	Fri,  2 Oct 2026 21:47:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bVSlcF8lNot1; Fri,  2 Oct 2026 21:47:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 354DD605D1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790977640;
	b=Aw15plPufSH0hQzNd2Y+bv0N54CQItWf+ctud1TrTv8Wyxwb1MQrvnD3pHRzD7FHmmmU
	 SIIc2m5/nU4yC5dgTO+k7HFtoWYDYdYNsx0P/GpOyRTqpZwR7IPzTCGPyy5bEBuNHuJnR
	 kU/31t2WMR+oDYac8cs60XRtbzX2G/IVy0daojRVxJUsrLoc953viMSAXrms4Ztt8DPid
	 tJFryv62WGHuJpN+g3GYy+sGnavcNKq9DkgILUK/0PjHpN5Rg1jXvjlgD6P8iBIJHXtaD
	 zt7F6fe2k/S75uWadTh2rcRUPS/hX9sUk+lu/fa/T6LuCv6znJM7FK4qmspNSWSfBVQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790977640;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cevmfcjj7zuqvhv2APYjx27EXX7P1ILVBVWJEZtD81E=;
	b=qISh8ZVq4XOqi7V8WRdquSJjyv53Y3sooXvrQ+sHX5RSULC9EOtC+aCnBroxzfZdDpV9
	 sGFqopmSuJkzr7N5O5ccjxO7wPGp+kSblMuOXqvDGKuVwaNkjTWTCdgOrzekl5LM5yaaE
	 eWLeDyo7HL+Oe2anx18xK9QPTlqwrsEXcuhV3P6oiiOa2MhtUaAMnHAy17RCYu5NP3d73
	 +kXSB5XtY4UDKrfzjAI+3mi3UB74eM0nw3xa9ScpOQ0V7hZO6eG+zKUCz4Ce4HtnpxLoH
	 E4vIGSphHAEw/reDjh2Z1keWi85lfdqlAfzKiniQ/yVWQDk254i2wpa9/j0OYgzzSJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=d6PIuclt;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790977640;
	bh=cevmfcjj7zuqvhv2APYjx27EXX7P1ILVBVWJEZtD81E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sFLrQ8x1LO9IROig0PWPzEbAjzRmMTfDr3fDS91Q+Gv3hujV4vHXLP5G4hp87ln9P
	 lM2IhigH6RcamZHdnFKi3Cce/3VeVrlDEOq4n5cqGzOK59WTqUjtZGVwqCbpn07dEN
	 64PgJB4WRGjskwCul5z5gv9icLUcKk4v/BPo8TvZScx3h2IHm23j9WeV1YLXTWaT0+
	 DNacNH62DNMxu8G1PXSOobxvnpmfSbyaMOcAi9yju+mWJ+zamJpvvdbCl04G+qyJ0e
	 Yk8Z2n4ByE7PhMLHC8hkJVWSP+1X1Kv//OK9ar7YIhSYVo34FB57RuQBDoeOCy0dTc
	 as3glXEztaJXA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 354DD605D1;
	Fri,  2 Oct 2026 21:47:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2663E34E
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 096D4600C4
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:47:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hVKBH3MgGOFa for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 21:47:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8FB3B60D92
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790977638;
 b=e5GHbC0GiH7nc3ygmDt6lOd1oLzyncXQoAQLdpmTDpKUSqvFxV0pzm2nNTeSJdxX0+CX
 nn2ih9Nday3yGKDnxye7swoYzTXulPT2zAl1y9wKa2Z+hvdfkreksHMjuiK/+biEdWa54
 vcg2JT6d1YBnqJGS0Af6BAsZ1cfAmASXZ4wHOZ6OqbwpPNBTX3klHds6iAfiW/FbLs3us
 zTNQOCUWL9pUN9fHpeganx36isDPJ5hgSuR9+VHBJ9W17X5B/74XeQbb3cuWeFOyFpxBq
 kjt0foi3/h9MfNSeY7SW4BQ8b14FOHAEwK6suf4lpSSdwIEGBDeGepqzXqfnGXi56WA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790977638;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=9JW1TiYZ7j4ZC+leI8UMak9yeR0N5dhn8gDyawTBNPw=;
 b=dwKGIIjuGRuj9v/29aYb6wD2/1/YYiTgekKsfbl995Ob6UPpuHqkGLf1cB1KJt449MUS
 sqpC3DR2aF5+QJJThhgpphq4lUK24fTS+zYB7Y7UPkMGHtXT9WI5kn75I+1M3TpWfXTmT
 Xs2P14d86SuIebxe05T69od6C7KtLMAktsrO41vDN+lwfSHDFCs8wrqWfb/77oGWMeCCF
 vovyUMdXqqywfEg8WQgibvrWm3XI8xtLibgtky3t8n0j7asTRdIYjtmXiZfy4xWL28IrO
 IQVta0CMfe2oz7P+DXDV0ZgLDTooEg3zb31k5++XPtkMPbcrzzLq7mKg8/y6PqNvoJA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=d6PIuclt; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=d6PIuclt
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8FB3B60D92
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 21:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790977632;
 bh=9JW1TiYZ7j4ZC+leI8UMak9yeR0N5dhn8gDyawTBNPw=;
 h=From:To:Subject:Date:From;
 b=d6PIucltfVMpHIgtGpuSD19T7ab2SSdfYQpf2n361jY0nAqsayM7qLezS7BtPsHYB
 /EcR1vvqGS/SjTVx1URxrLQvWpDVuJP/r5E1ZqG44ibaFKhwWE3qrzCX8i3bgJdC+N
 NOc2YWDJpqlN/6DBpw/DI7z9V4FrAj+Ms0x8j9tL+MLL2kYGLTvVIVdPHZI47NgzSp
 IsGBfIHhvrEAE2fPqEcMF43ZxRo7eUjEvePAGlKb16TlTN/Ck6kTJajoofRxjiIPx3
 iu848aFkuCENENlymAkhNDldsW1hl5MeMHGmIWhplM950LpA/LUK0pKCnZH9XnoqwM
 3rCpOgKA2fTKQ==
X-KAS-Sym: v3:f51bdf72230551df:Z/zdfgl9C9WMvzVfruq5VjmKL8L4TeUZ0RGKAsE+OU1Tb
 LZBQYCc7/9Vi3CkNnxGiOvyog5uXJb0l5ln0VZ/FSmylP/iK8tX5UQKSnhNLB0/lT2jWX797wUZ
 nB5LL4sROxpEs9rhlKL1oQMbVZ6WdWlX1ZEfomzMiUGZQ3+2AFelC/5aG07B4Q6TbDHs5bwYTrv
 7GVBSq9NcVFklK8l/VmX2iI3f4IUSRq+Qxn1YANv2nvd2JloM12bF3rxrAqtZCUzKh4qgCBCQVd
 Z7Z43vq6CTtf/YYecIhqU+FI1VMpyOgeLoNk8OpL+8UoDL4RbGq9Iun/UdxvEAxAxVTUgxpQ==:
 1WBwDCs/WJVEzfdsCYQNwqYl+zD7Wpg+X7ETQYZyauhQIloD92/aTaMoZmx5ShncQgptgIpOHvz
 48CL1XOS9Ni7GKESy08yQ7TyBiThM4nQMjpzASQroPVe+82mJWU/3/6F1HMvGMylLRPTc0kjXnr
 cxt/UaL/T5RiWGKY+hBjnFYhUQlushPQ7BtLVadmAD3BI4qMYEgJQ6GfMKPb5MqrdBIgeGHOF52
 un0Yq9d1pgNATn6sWEGn/EJ8sl30tzSlVfASJW/uo7aI0R0UQXG907jFwlkpJE6gw/WIGoD8iLF
 7xNjk3BRaCAuGPInTOnLobjHMtva01oN8VYmksSdSLPngUBShi47h8OaOGCXzN6uxXFmF9xIhXv
 j1C/43LWHN3IBhe/b/VuEvBl5V6q0OrVeKFKeO+VnHn//FKuz0O+LjZ81zTZcx0tGYNrZ7EIDRj
 DQhZwHVX4w+sbCt01B61SNUu2UbCNd1QMp8AlT6UXmPRtIjshxbiiqw7d9JpC1vVGn8hIOr6gQV
 6lQIG1LqQSxuqTIh6GJ7Fp8ZJPqMNY1KraQ+azXb4qGHc2oJ5jQ9R5q7j+gWdx5R1uzSsM4VgGJ
 kJmjJttt0Dxg9SYsYewDxA1Hz8F4wEo3aZhlEQ==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A56DA4C4FB6
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 23:47:12 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43454)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCl5z-000000002d7-3uwS
 for buildroot@buildroot.org; Fri, 02 Oct 2026 21:47:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 23:47:10 +0200
Message-ID: <20261002214711.1164231-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/2] package/libpng: remove autoreconf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 08ad91052b69090b74220d89b13cfc29fb86ed72 removed
0001-riscv-Support-only-RVV-1.0.patch but forgot to remove its
associated autoreconf.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpng/libpng.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 96afc684db..1915941b82 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -11,8 +11,6 @@ LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SE
 LIBPNG_LICENSE = Libpng-2.0
 LIBPNG_LICENSE_FILES = LICENSE
 LIBPNG_CPE_ID_VENDOR = libpng
-# 0001-riscv-Support-only-RVV-1.0.patch
-LIBPNG_AUTORECONF = YES
 LIBPNG_INSTALL_STAGING = YES
 LIBPNG_DEPENDENCIES = host-pkgconf zlib
 HOST_LIBPNG_DEPENDENCIES = host-pkgconf host-zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
