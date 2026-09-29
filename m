Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB82CA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:44:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3F6A81118;
	Tue, 29 Sep 2026 18:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xn77NXptrzn7; Tue, 29 Sep 2026 18:44:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C0F2881111
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707494;
	b=O0+Tdnu6R9IvGEoqBUU3gEvQJV+xE2YqNtDjYRudQmfTLWo/3z85moG2uXM2FcpSPKiY
	 SmLHSFsPKrjSEnSXZPGJRuPmqZJnbGNGKWq5bEE7AnqZwBQRq/5UjdHzCBXFI9QlRcqFu
	 CDUjlY0YxkRgkLbviIGA0c2QAs8MZagUudIKmG30Y737qsMKf20fIHkPJJCkFQpvthGxM
	 kMrix0gxPcNQy35NYGYd5ZBCBDwSxyGUrhxBcW+x2pH8ErNSdbTgj8/gsljV9HvHQVgHJ
	 iWCkdwJlC1O/irJ6e2psqvocWmQXtwF7CAks2hd4ap5DPQVUVI6bR0WLCPQiymJmStA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707494;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NG/B0AJR9B70duiQkEa3didcdQSnKipLRHeiNKQfRLw=;
	b=ZDcggWUa/rTGsJhVoTYZY0VTDIek/LxrF+TUCDs/887zRe+uvPu+r6PxKUgwkLSgeoRt
	 4TzO7AkzkHGF6Jd6N5mRkKDgvp9uBzuYLfo5+ohAZOdC9bIs6LWTC+eBT00mSDeBT6rjW
	 E2eb+7xYQaWzNXkcn0wV4oD4x7Gl+ev617oYe6rSLBGfbgjpbl3kVESpadmz7u4TMLeyF
	 j2ublRNUypVmhVWhEpTxSVMXvlbYw1nC9IGmn+//tD5xff8MsiYz01A51XZzNczOG80Qi
	 55IzPkZnmAIkTw2CChH1uOngNsnztMUAah+ToyuwftPJieH2/zmMKtsSOevIM5h9AgA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707494;
	bh=NG/B0AJR9B70duiQkEa3didcdQSnKipLRHeiNKQfRLw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PD9rZs9rn5Xn9GI16lbCRk6nUjknD3d57Km/LUbpthj7ZwkEZnGcjHamrgGCFkUUd
	 1qNzLqQRyhm5BkB9SYlAhvOvXKnY24L1JmV3W7fkdTxZ7HDPOPYtJ/EMl4awSA4OKW
	 AnDa9rdPqwcF3mLghWLUuWgJG8xhrEycWbUDPw60k1o13d27m1T0hZIaL3uzfDPsqb
	 KV5LJ6R/nkVhcAXasBZkLZ18ZrXTVg98oKUAKrltgh8ov/ssaNk61tH2DsJrqVC58V
	 xcH7ppBcBrlZirXUsL3HKaxlcOLs9lXTPXn6mRn4on2P6s9vTDj1rvkFLs3e93BKSO
	 zkrpLyI/ea8uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0F2881111;
	Tue, 29 Sep 2026 18:44:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AB9E14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 509694032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gx0GF6mk2Hn2 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:44:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 59F78400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707492;
 b=NctzlxouhcZh09LZpHUh5e4MDaRQUhNUKavzWE9nTqwxqR394+5RxUkIFJVcccDs89sI
 PJ1iP4oaPTqTR2mqEBSToRGNxdKp4l666DXBDTzqwJyOWGcODtChOdwHPG1tCMpzUSbAg
 /ATE/UCfZzxCcq8LlBqw+aDXkMj6r+LrK0auG0V4GGK1oxHiHcthNc/nNCqW0uVbIIa4A
 odzMPkywWAleXtcrXX5elfpM/nDYxy3PL1F2aiJWFbuN1RWFFgzcA4lwuvEsmnHGHYDCZ
 jm6sTR/YRk7jBJ+oweISo3Mf0N77Q5i8PyWpN961DM8Mr+BOqjzNG7+JmSjYZu/ghBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707492;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=sDEcBuDGDWRJYKVA0uP78tt1MUzoXPok2DgJ/vVS7ZQ=;
 b=XVz9qVHOg7gMi07gCfU75G3AhjSfF6Gof36c+7/hbrWLfKM3T+RS959KLQqBRZUSeNgh
 wXd15+mnscZsNUeTCCMzjEfmB3XQmq7/bX83wQigy6OS+6xDEqM0uYU33+OJimrIgp1z3
 yHaDeL/NcbuxiLUJ6DiF+R3420zKTFYiHZpj/D3m1YAsZYca2XXKTzhSLd8QfylvtMigQ
 2l02qu+vHLt7RFQrXkp81XjOnvMsLVKmALobpzUnvI1i76/VdDVX2saMvovMSoEQOm/Cc
 /r138XraZrAOKEyhKqSX3yR+UekHgS8kh0JKYKvNpe8E9Pu66IbdtOtbCl3gVUWVBCA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JBEzVWnA; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JBEzVWnA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59F78400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707029;
 bh=sDEcBuDGDWRJYKVA0uP78tt1MUzoXPok2DgJ/vVS7ZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JBEzVWnAN3LqfdPFTI6KhhFY0ap1AnkYZzK8qo4nhwKZQ67wZ3Xxi+TJX8+JUHZKx
 rEOcU/Wach/0wcc3nSMwhQ8yR4PwLxUQW6nOvQP+xV3XUReGvoLDaRsJbud2K3ZA9z
 cSdv+ltCrbtcrIwgiQcPj/2xFjnH2PSV4J5/BhmwQvESNgvu4fObZPEbOzWyfNDohI
 ZPcYO5atYYa1bQOc3C41xuJ7GhQGrd1UOX5PlGjrTyLTsF0oIw3vqJz5/mxfx8643P
 AgQcrkQcKG3C1JbGNitHv+4uoLqLzY68sIT8S1Hf3ErFkR0dPmWRNMLUNh7ahWY9zZ
 D1pm//u/yhlpQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 +Dzpev7NgLecEVpxFs7HNbspa79KliixfXbFDAJ//hZsGrGN09kzenKFEKxtHGq7H+gP8qurdh2
 ZReDNFBhIbbc10LeAYU2TOnDafKprFLE8Js8oNBAum6aLCrY+RyF07mTo9lWevcLcO8Uq80Zeju
 M0dyiJXWPqmlrEswv3Em27z6JxywffbZn6C5M+yZS/wCcIEEV7MTQ3ZlEp1NVjslSk3LTDtnHPE
 9cJGsUgFLzOAv0qC208+8uh4jNt2ZhSL+tz1p40ovr5fJf2YsvR3YazpGK7JozJrrSBPGPaLIwH
 +rW6XptgqLTDCkACgrjpGWKW+0ZLg4N1PK4kbNWtjpx8iWEmiqPCekQOKB/2qfZgL31xvvju+jy
 Q8iGDrRRTSqqMjRNL6uu+C89gY2a23jkksROz9HUsudhteIpaFDyU0EOfrpNwgJNTmTpQQ82P8T
 xSEcnEajZ6XKOnxYDAW6LSU6AiAW40tQiUT9H7koywlDYsMqOyf1jSKPdN7GT+rXvilBKSDf9H5
 KYo8SmpxN/cYZGpZg1PNb0uBSEc547GnCOKMoklf2J99AqhSu2OBfBhMlY3f96uTLQjwmy3d3RF
 aWyqH7qqGECaCTIql/LZ093I9AKM6DR9j5gwJGBk1phPiRFdJkeIeZ47Lk0CDg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0E3FBA4C51DF;
 Tue, 29 Sep 2026 20:37:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-0wjW;
 Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 29 Sep 2026 20:35:32 +0200
Message-ID: <20260929183607.1849293-34-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 33/66] package/boinc: Fix build with OpenSSL
 4.0.0
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...fix-a-build-failure-with-openssl-4.0.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch

diff --git a/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
new file mode 100644
index 0000000000..22e2ef65a7
--- /dev/null
+++ b/package/boinc/0001-Adapt-code-to-fix-a-build-failure-with-openssl-4.0.patch
@@ -0,0 +1,26 @@
+From 9cdcef8261be4891b4814c6f728dcee65027e5da Mon Sep 17 00:00:00 2001
+From: Gianfranco Costamagna <locutusofborg@debian.org>
+Date: Wed, 26 Aug 2026 12:27:54 +0200
+Subject: [PATCH] Adapt code to fix a build failure with openssl-4.0
+
+Upstream: https://github.com/BOINC/boinc/commit/9cdcef8261be4891b4814c6f728dcee65027e5da
+
+[Bernd: backported to 8.2.15]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/crypt.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/crypt.cpp b/lib/crypt.cpp
+index 17a9b57b3eb..b54e2f050ad 100644
+--- a/lib/crypt.cpp
++++ b/lib/crypt.cpp
+@@ -774,7 +774,7 @@
+     DATA_BLOCK sig_db;
+     BIO *bio;
+     X509 *cert;
+-    X509_NAME *subj;
++    const X509_NAME *subj;
+ 
+     if (signatures->signatures.size() == 0) {
+         printf("No signatures available for file ('%s').\n", origFile);
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
