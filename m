Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720E9CDB465
	for <buildroot@archiver.kernel.org>; Mon, 16 Oct 2023 18:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8B8417CA;
	Mon, 16 Oct 2023 18:48:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC8B8417CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oLpcqw9fHCDO; Mon, 16 Oct 2023 18:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB159417B9;
	Mon, 16 Oct 2023 18:48:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB159417B9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9ECD41BF28E
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 18:48:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8534281EF7
 for <buildroot@lists.busybox.net>; Mon, 16 Oct 2023 18:48:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8534281EF7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K6oqxLj0Z0QA for <buildroot@lists.busybox.net>;
 Mon, 16 Oct 2023 18:48:36 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C19781EF3
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 18:48:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C19781EF3
Received: from fli4l.lan.fli4l (p4fd6ced1.dip0.t-ipconnect.de [79.214.206.209])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C26F5A4C09A6
 for <buildroot@buildroot.org>; Mon, 16 Oct 2023 20:48:33 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34720)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1qsSdl-0007KH-1m
 for buildroot@buildroot.org; Mon, 16 Oct 2023 20:48:33 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 16 Oct 2023 20:48:33 +0200
Message-Id: <20231016184833.733590-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1697482113;
 bh=JnT9gOPiMGa2SRDCCZOKycDla02qRPsUsn4zyI+WzHM=;
 h=From:To:Subject:Date:From;
 b=fvSbBiBmMf0sD1qIJR9vsElGu6yN1PJ+vULoNpXEjrDJQzS2KFL0HyZhfQjtcQSdf
 jJjrYYw9jp6tNOZ6nWHvCBCLilg2F2UKtrEinYTxrhvosK1W1uniiySpZjm9yBqJ76
 eIS5F7G1iQR4vugf5kfCTHs8SAe0uk5WBJTYlTZy1DVMDey1PpOWL/DB7pmblaqxfS
 6oHnelCJldgrnB5CEh6Rjt22mi8P6Or6N/KWAnYoQfeTzczI0OJKoZAzJ4hofNSLDS
 yvh1bc76s+bJLg+UcsCfRQi3xBnrTikZUI3GD80OZ1mSAU6VKwkPr2GToxMjoQXwdY
 AxXGo1KurJ7nA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=fvSbBiBm
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit a8ff60cff9402dcd04fffb67af15dfe2caab0995 bumped samba4
to version 4.19.1 which caused a build error due to a missing entry in
samba4-cache.txt.

For a similar fix see
https://github.com/LibreELEC/LibreELEC.tv/commit/37b7c3a61cd070c8067fada5a167267ca10421cb

Fixes:
http://autobuild.buildroot.net/results/c1f/c1fbfdab11c0521b8199f6a661987eb6076c84d2/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/samba4/samba4-cache.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index d95776a03e..ad9c5d2880 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -45,3 +45,4 @@ Checking value of GNUTLS_MAC_AES_CMAC_128: 203
 Checking whether fcntl supports flags to send direct I/O availability signals: OK
 Checking for gnutls fips mode support: NO
 Checking for readlink breakage: NO
+Checking whether fcntl supports setting/getting hints: OK
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
