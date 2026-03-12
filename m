Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF01106ACD0
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 16:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B1CA80314;
	Thu, 12 Mar 2026 16:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CLkSefttwUfM; Thu, 12 Mar 2026 16:55:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B6E802FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773334549;
	bh=EgZdnEjfPquxVvN/cbHe44fYDTVyNJstNFt7HvnbziQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MASzqGhfyi7iOzsMLjQh1U8fmXBuGm/Xz5y02bOCEXwPCYhAYTgiCllXZczhLAX27
	 j83sVLUbgdyt1etoDT8uao79shVJYAzcycKlLU64TdJmlYKk34EH/DqXYKj2uH+r9v
	 6gWspbSBn58AomuuCFKbC6PtdVgJMVN8F8uaX9yGQ13T5DqPxz1KFqWatwNqMuUlFm
	 W62FBlybp3zWZgNjUSVBOFvdpvlMvPzuLv0ZgNgFDk0eGwV3asnuaUvYE9ZuEvQmn6
	 fGk8n/4NBbNvxLheTEjjjTDo4ma5d9Zb3P/qT3K26w3YpREonIst0DMpZZMx6/YPZ4
	 Le+coNyxsnnFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92B6E802FF;
	Thu, 12 Mar 2026 16:55:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BBACF282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADB93802FF
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czX0w6J5Iyyo for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 16:55:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 54967802EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54967802EC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54967802EC
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 16:55:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E83FA4C0ED9;
 Thu, 12 Mar 2026 17:55:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60208)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0jJf-0000000068u-0voU;
 Thu, 12 Mar 2026 16:55:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Mar 2026 17:55:17 +0100
Message-ID: <20260312165518.3312453-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312165518.3312453-1-bernd@kuhls.net>
References: <20260312165518.3312453-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773334519;
 bh=S++wmU2+QsFMBaiXGeH4NdAnuGJcH71585pnfDytUx8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=aUKP/43BCKwAOMKdYBEF/17c4mUA0z7we2b/F3gKtKYP3nGi9b6GsR4kLurr3vsGk
 FIDxwQjGieajV4cuEaqDRBoBQ1E9/XCUEfcJ6kIpuuIXkaBTkna+1bgkh4az3P/hMb
 oLU6RFGcndhCBZQpsKC2qVpfsIfI1QCzQelqQeipo7mLhN96NokI82p5FUup5JssXi
 uCgn2jSsFb5S/Ol8Ui8K1Wou1NwA8gxeVrRTZtwJP2V5qYMDkNoluZvCH8jdvhye0Y
 MA2ZQ2fazia32RFIjaUa3/EXUo1N2OUIoybiWzZXGIiB+BoRPLGlx8+erfkBwiTiMj
 drgvlrm26HatA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=aUKP/43B
Subject: [Buildroot] [PATCH v2 3/4] package/wireplumber: bump version to
 0.5.13
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

https://gitlab.freedesktop.org/pipewire/wireplumber/-/blob/0.5.13/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/wireplumber/wireplumber.hash | 2 +-
 package/wireplumber/wireplumber.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
index a254b68cca..eb22ae6a7b 100644
--- a/package/wireplumber/wireplumber.hash
+++ b/package/wireplumber/wireplumber.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c89fa29694e89939c0e57cade5c9a7da8e5da21c19071862978ef5f3a346f1e7  wireplumber-0.5.10.tar.bz2
+sha256  056033cd4fa551b947eebd697bbf78fa9e6baf8f7f12cb5395656aa619de4946  wireplumber-0.5.13.tar.bz2
 sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 8818662059..0c5760d2a9 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREPLUMBER_VERSION = 0.5.10
+WIREPLUMBER_VERSION = 0.5.13
 WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
