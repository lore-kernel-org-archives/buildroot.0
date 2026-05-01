Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16675FF885A
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E29FF85512;
	Fri,  1 May 2026 06:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jDOVx_oTglGm; Fri,  1 May 2026 06:27:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1210085518
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616831;
	bh=HTh7AyqOzXcNRTnAZU9F6hAoRrkX/cCcqA5EFkfcMpU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hCQTbazGdw1irWWUgTDOFZJ+MyPak0/x9ejDfZNhqzm6DyK9ffXGwad5EF1VWzcG3
	 rrtdN6gLfbRXd10zfoScv98AB2E+EgD/VfFKG6+9l/eUDij5FKHPf6tDMnfLe8MJwP
	 dS34BZg8m52oHsovf8kYakPF9Z7PNKi/w6PdqiSxvZJcJ8Da6YDGeAsUG/WJTI9F97
	 jnEW1QOn+DCsNS6U1eV0STj3YlHm5rHt4dR3SSpmCsZZFZ5d/sG3gWtAh06NvO3i98
	 l69Po99kd2+gmXULDl6/qrIDqIp59h0y3PDcNLtpfQEhlUQRwNdoZ83ofPpj1zvgde
	 RNrpRBQ6zOlDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1210085518;
	Fri,  1 May 2026 06:27:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 95D11204
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C7074114E
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-7ofhJ_5cA9 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:27:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 75BBD41041
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75BBD41041
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75BBD41041
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:27:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 98E37A4C2CFC;
 Fri,  1 May 2026 08:23:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHU-000000007tD-19Zp;
 Fri, 01 May 2026 06:23:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:23:12 +0200
Message-ID: <20260501062316.1942112-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616609;
 bh=4twEeZDmt786fSG77MfE3Zp+TLRdEimw/c8/YQYP5Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=G9qZvkXKqQGvjyagQ26dBIq5aabZf4YwByxgE9EW/t7sYGhb1fYJnFQ0iseHMMQmY
 UepLoHL0JditclC7QnqzeHT+7ctoU3ckNiMGJS8sTLG7gUY4b3E3cZS6a41mh9iT7p
 cBQjcA9QodWnzQnI+S4rtX4AEuEUUn/1S6+x+36NPm+1rbEv+/BEKiJ50WgK/ac3Q3
 53pzrr+tIkx8IHnxkEQX/TVV0X/swJZ8qpRYn8+121lcV9OXVlbFa0xVXa+/QmF2S+
 K0zKTZuKtbsHpG4/c9QbncwhRme/x9SseXKQoIo+b+Rx1B8XLhe3m/JDTpTNZNEOWC
 O0cYuz5Ry8UDQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=G9qZvkXK
Subject: [Buildroot] [PATCH v3 19/21] package/gcc: switch to GCC 15.x as the
 default
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that GCC 16.x support has been added, follow our usual strategy of
making GCC 15.x the default GCC version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b9dd37471f..e218b13bd2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
-	default BR2_GCC_VERSION_14_X
+	default BR2_GCC_VERSION_15_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
