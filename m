Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AF4E67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E9768199D;
	Sat, 20 Dec 2025 21:41:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxD8E5MZpZCi; Sat, 20 Dec 2025 21:41:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 72FCC81975
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266892;
	bh=/z1WJ8BEHeJBDxzjjdkV/SQJL/8e4n3A8vDB4VITEqo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IaK8tT2Rdmo9vQDLKdcEN5ZvKI68xdtTKKTBtva1vP7GFUl9nEHT2TdRtbSMpQkFX
	 fAk4PZF+n2LdVC/MEMQmJs2nk/+B9YZIg/4XkDd4wos6Wh3aLItVG63qyS8fwFwa/v
	 vsm960YnxPt9I0Yh+61uyYDkHVlMRckz+Ym9l4+QFdM2Zgpk0c/mHCapZ/7AGsSuFy
	 r0ToRxQTe5zUgkw6NjWPMyME9JkvEadEEf/kRnvKarRswn+lz8Ho8kL+XdShQ1/MRY
	 sSp2BITgcev3Ge2XQReUBaXr+Yk5yUfTGzJ6n2YQNWNEJN+Z/wXDzxhjCSONTYt56Z
	 GgWxSrPHBDiUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72FCC81975;
	Sat, 20 Dec 2025 21:41:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83AAD23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75A7560E22
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 14IxWsl4yl2s for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:41:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6EEB660E14
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EEB660E14
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EEB660E14
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:41:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5014EA4C4D7C;
 Sat, 20 Dec 2025 22:39:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fy-000000001mj-3mSC;
 Sat, 20 Dec 2025 21:39:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:35 +0100
Message-ID: <20251220213946.1088820-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266796;
 bh=78iKG62GHTDiQf4kavBq6/Jgy4YzGcFDIVkN2+ArHB0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pNZGyKHwqSp/u4oift+YlS78uBYLINi6CMhnSpS1a3ROjsHbx5YFKpYgaGVvPLeRS
 RT6sdttFF2aMr0kLihrmFSew84rZkHPoswz9+Zx2pk41e1HiYnn9LlRJDXjauudaD+
 PgV17bEflhYIxm3+USnw4ktLp7J02Aw+gQj6rmrXRuzl9XafGdhpztXX1WbdW8FQJE
 P1eQvZRd/XNXVkr2G7Mjd0arHWy5+2iktVY/mrho9RbpNhJ/jaAj2TfDQug409J+tH
 4yPN0q6BwMM8HAfoWmQIeBVZClMtw55y9wFU6te6szKfw26yVNWCfyRL/X8wNChk9t
 Fi7mF6EgNd3nA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pNZGyKHw
Subject: [Buildroot] [PATCH 04/15] package/python-crccheck: add md5 hash
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
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-crccheck/python-crccheck.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-crccheck/python-crccheck.hash b/package/python-crccheck/python-crccheck.hash
index 3fb58a7299..b8fb4e3312 100644
--- a/package/python-crccheck/python-crccheck.hash
+++ b/package/python-crccheck/python-crccheck.hash
@@ -1,4 +1,5 @@
-# From https://pypi.org/project/crccheck/#crccheck-1.3.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/crccheck/json
+md5  b70543709102d2edb9159a9b26366706  crccheck-1.3.1.tar.gz
 sha256  1544c0110bf0a697d875d4f29dc40d7079f9d4d402a9317383f55f90ca72563a  crccheck-1.3.1.tar.gz
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  1237ab8ea60caa782d77d9d2ac0cdccd765475e3848b0b91b5751d3f299e9d31  LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
