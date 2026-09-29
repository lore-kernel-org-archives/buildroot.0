Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF87CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D324B60835;
	Tue, 29 Sep 2026 18:43:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0j9MVg55p8DN; Tue, 29 Sep 2026 18:43:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D37F66083C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707396;
	b=ZQi31MKcmDpi4zaShATTrXEUsyPzoA39m1x3Aq6lB0R9XqswM7OEo/f3PQCYfWZ8UcOP
	 +k8uyNubvTI1IDPcgfzLhNT/zh5NR0euVvI7giSHYrWYgSMgIeqwXk77U4vfmhP2ikKCZ
	 84fpcc711+E1z+PzaGhcE3hSKxWCzBpAyj1NreI+p/NWD7SYJaVqa+0Y7/4o/W07LLOBM
	 n0QO8WO+S4u/djQnwuURx8xKFbE6lvE+BzK5O6xlmKcSUQbVWyXHLB6PsP+1HfCsR4BkH
	 ZnuIcg3Q3z0WtqIEKzopJnFYeRDCeCwdKcDpLJhPGXkzlvBwOBupfVreKxEey4AuMmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707396;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AVNTxmrdFKoreplm5WRe3Wu57IlF/aq69UenLp5Bqn8=;
	b=XxJe+tv2rz6mx7AjZB1yyOUMYtunP6EyrsCNJvYaz03MBNguJwiLZiu0ku+qGdMCeQLU
	 EkwwPdnZ7J7vPtX5XBqmJSUoRnEIpcL32DVflpN75xpI7z+weilnDMJu1UH+K/Rkzty64
	 jpBjlhOaQYCUwpY/mANimx/d/HubtFuyrhz6RfdIXo81P25N4WJSuxZDaC27KFsH5Z1oQ
	 Oit0RMnZdxQ7y4mASAMl2DassK6crGjcRm8lwv8f+ajixrzwek1rUqO7lp9xGDK2z5A/5
	 yi3RtfQ+SwlL7cxhR+5jStd3JLemGmkkHPvDBvJ3WtVqoUNFKu07/yaZSItsaTb72oQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=n84+E1fZ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707395;
	bh=AVNTxmrdFKoreplm5WRe3Wu57IlF/aq69UenLp5Bqn8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TxVpqGB8cKN74IGBn2ySbg4xxwZvuwEKBMq8yqtswacDwtZM73hEQ93A/jXzaMVfY
	 P9iZMqgQTDG49HBvfJ875k+og8cXGDnMSG3wAYn/DNboEMgYal8076wzDphR7J946Q
	 dU4xlmlEp/UHmJ768p+eO3nZ1XI1qZLusO2VkrjJtep56erPrcinol96KaTxXsRUQ2
	 IOs0KnHxAVGKpcSpxmt9CB8ofPeTOS60KYzKfHMysAr4pA1AEApezO0xasg0jT9dEP
	 fqJzEkZyvy5oIQNEzEvlNq3C9h7pJ7lc8WnRJBcAEx96Mv2KtMpRP0RgosASGICy5R
	 9PeSH72/o9eTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D37F66083C;
	Tue, 29 Sep 2026 18:43:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AB3114C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10F516083C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAoW_zzR-b0q for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:43:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 18AEE60840
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707393;
 b=M5PSTEd22v7DYKSZicbmmlyRl8zDRG03R0sCBbWb/oA/oXDr02YUD5eeU95GQ+DQ6iCk
 4BBoia7AcFOggTJPNOZuf3yfB8SO+tnlbXiGhAoHIbCiWdoTJKZFPdtoHeRtibWdcKcm9
 TYNmOGr3lKDmW1f+aB9pbQYHGZY9eCW1E/X6fWMde9qcxMRDetkFPGQLTrXicGMUowMBa
 WxLw8D0+39UYFbecEkjWhRyTMDB3sSwNbHYuM7n/CdsfO0qdiwHe6cL5EvFFveG8L/efP
 pVCBLunGlDG6JpUHPGHt3OWShAYk02KlSOvmsTZQAsiwdvEUWLJbI6/WJHssvzjHv8A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707393;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=hAD3nJAJTVRpLisaiI41+v00WBkP0ztl4P0MKjkI04M=;
 b=oB/APMBbAZsKtKmiO5dwXlLFcFzkiE/g2mX08ejL7ddDPJqH+dPcLoJhs/iuKxnx5D4c
 Q/Vxyg+/LNOgit42cm+xWcLSceVo1tTxmkEzdP0v1IOKZ1H2rJMnX+5ibJLrJzWNhxVDN
 5rHGvQo6qiPyPwEs6DfAU7d/v2+CuuFcFBFjEpyTmcy04af7o33cqAeOY5dZPeLJmY7kF
 8OLWQnookL0UE0YwtMLOgXummt163co83YQHaFAOaSzgmf6isNJDlZ6NgdrA1Gx/L+hoO
 6qPSulUGZFazDhRQwo49LNAXW2s/NFmsgQoIP9EPkga48IBwH5frIQqU7WmJX0YGRLQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n84+E1fZ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=n84+E1fZ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18AEE60840
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707027;
 bh=hAD3nJAJTVRpLisaiI41+v00WBkP0ztl4P0MKjkI04M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n84+E1fZZ+N/LR1ncDHTkq1UE8nSwYbfCb6DLtHadXsA98D73/l8lBqXmHquaISAr
 Ue2TZMndMLo7EUWgZxbURLYqtTCVo8a3SEIb+nrnw6xrtwNNOrfJLXGXFswb7wQDVt
 /TlRg3JaQG2lNnMcCN3O/YbEZMSbA6E/swkAfj7bQvcvw1cVsZ/IHTTIa+v6Ncgy2a
 yK/IxCrIH40JAGpyhnHgzV+Zr7edzCtHnc+bN1m6d/vpcnteIZmywd9Yj1/3Skn8iu
 03SIPYSDK47E+/bSyigoIsG7ry+XcPO2qtVn/KFAtrYjK9qr6yc6vnQC5y+kgIsEeh
 4gNxXaVbAe12w==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 d59tJpYrHahjiZhlwvdwb5l5UDDgZkBGtub6jC/Ub8pWDVlKhXZvw5A26I+Udvc+LA419eB1V3/
 XZENlRabpGlLLvhBS2UMyEc1GpKPLuRcPRFM8cjQMxRoFRldMEQ5CBOePulXz6ibjOShA41Qvyw
 ED5D5pULh4nZb31oCCMic2/ZgAwwm4siTXImqEnql8ys2X4lJlzFVjz3EcwMBXZApmnHGA566Jj
 UombUkbmXeuepFXnsXvpkKO2VrtHa5/bKQqABcyhC9ZSGTfEMykYhDZ1IMz6bFudeBv3lnyXKTx
 Kyu/NgUyoMu1+ja5jnOfLAtUmRcQXu6IY+eTWOVgaYA4vjA7BFAazrv4xCXhUvhCo5dVY4TCKLX
 f6vNO9TmvgWfAnv1aaPHW6HzsaEp1lhAyJIgZgyDUgYQnT4rrJ7gvI+OU8d6h4Eo4cHrbe0BPo6
 MEBM5cwZIX+MG49QClBORS7M4MzPZ57JWXIkvb3l+CVPSXT+5mCvN+y1JnR8a1Kva8p3jRD91BX
 5mwJGMF1o6Tt2doYwohJGyoIkkrBWMfBhhaYLTycS+uYxclpoXAtW8Ln/GfbI8WkG8KQP61kR9U
 Bb4Uh9eSwTv0oJKjgJ2BCPzNb+zPSFUM3qnnD1Fcjoqx3Q==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98E14A4C51D9;
 Tue, 29 Sep 2026 20:37:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgh-000000006Jn-0VeA;
 Tue, 29 Sep 2026 18:36:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:24 +0200
Message-ID: <20260929183607.1849293-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 25/66] package/poco: bump version to 1.15.3
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

https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 6979a9a1e4..4c132f9742 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
+sha256  4f112fea59e0c65f0fffe30a4957f8d66cf41528c21dd9903e6d7550022c794e  poco-1.15.3.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 63279d530e..7e2a9014bd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.14.2
+POCO_VERSION = 1.15.3
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
