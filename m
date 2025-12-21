Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F394DE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C870680252;
	Sun, 21 Dec 2025 22:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBKMq9ic_yc8; Sun, 21 Dec 2025 22:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED274805C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356547;
	bh=6EliC1fmFurEcGic+tBEAPp0YFBFksK7AvkRFFVuJzw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=SwsS6WU4TyscgMS0HCVaQCZo4d9ODO3qFUUEeGwTwU67KGzaK0r81nAik+/DPpxrw
	 VCv3q8Kf4qPtjSUgtdJYH7tWpDR44zUAbI5NxibKRa7UmWhkJf7bYJYS60DIVRtY69
	 ZjBcqrSPFRThT7YmMpu0EjT9nOoh8nD3Lpp8StHBo9aprL/8ZkMdptKFMGRNv4I1GD
	 23FSN/RIQMl/nAMVuN9mGaaKbrYiP1LgctePxT/4X9yFy5bBR1s1duonLPwkYhpUts
	 HuIi9zZ8SFfqC+KvjIYMwmHxi0Z66UuIxhA7u4UG9COoNfeLw2sYQMizT+oRv0bGTy
	 uJXgyBSVZZz5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED274805C8;
	Sun, 21 Dec 2025 22:35:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C7EF119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3357081589
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lKIujMfzYFfR for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:35:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 319D380DD3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 319D380DD3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 319D380DD3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 721CDA4C4468;
 Sun, 21 Dec 2025 23:35:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-3FPo;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:25 +0100
Message-ID: <20251221223441.185169-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356503;
 bh=5kSByQ/MGTIKsu6wpWzU4MtlWpS2VBpxRA5ZnqJTfoU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gOHs8qQlRn+mGr6brg5riVDJRN/2TJKOxPwZ2CJZPDUZMyD6PkzviEH9TGcrwBcSO
 GTqGa06S/Ga/b0REmqgpFSB3ndHyRZvK7N1IeWZ2tILS1vr/cvCOBlURw8ePoCGfP1
 JCyW6mK4yhkV5m2/wwOIHB9IPxR/ddI7aXV5rlqSFwzMXGmITBSYotrWBZpEV2XzA4
 f7ZRVhJnnuGJEUaqYQ420i0wjCcRLPcTMXUZUaewl9ET1mpTkEnQ3R4mwCsHEs6mCQ
 rEhuY33Z2mu2fzD9J0c/H86qW6zBJv/oll1hJ73qtO2J9pSaE9Z6iHMNDFTkUBn9k+
 AvqU/5PoSIYNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gOHs8qQl
Subject: [Buildroot] [PATCH v2 07/23] package/python-fs: add md5 hash
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fs/python-fs.hash | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-fs/python-fs.hash b/package/python-fs/python-fs.hash
index 5ebb49128d..a7c416af0d 100644
--- a/package/python-fs/python-fs.hash
+++ b/package/python-fs/python-fs.hash
@@ -1,5 +1,5 @@
-# From https://pypi.org/project/fs/#fs-2.4.16.tar.gz
+# md5, sha256 from https://pypi.org/pypi/fs/json
+md5  2c9dae3d52950407fe265c3576396c33  fs-2.4.16.tar.gz
 sha256  ae97c7d51213f4b70b6a958292530289090de3a7e15841e108fbe144f069d313  fs-2.4.16.tar.gz
-
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  bcc1fbae1da071a15d17fd7609519af1160a3d72c65622047b61e19ba63e780d  LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
