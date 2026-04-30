Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741ADFF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 05:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0788456C;
	Thu, 30 Apr 2026 05:15:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3lcbfxxtomhU; Thu, 30 Apr 2026 05:15:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 514088456D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777526143;
	bh=5FoFAvzJgDCd4ABSSAyFmmLKq1fq9jolcHc5LKbTWl4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hR+N8pv8GYOfzyAPmbJn4dM6i/0Y71YE2vwnAuQOy+Qa2vBggF/Wp+fCjfmLqArox
	 FCMgggQjYvSuIKHmZZNyS1CLxlAXmAWQD+WH1OOguwxRTnzVl+0btIwWHoDhm/idbE
	 eXFzwTa8KrWGtlWBS56s72sfQ9CnTWSR+NQwNgkPJw3Wmzte8kHzhaDzywhNhYyHdF
	 jICaB9TiO3YFSUcAeN+8AMT+P+EN0H0HOa2t9mlVm+pnqCgyw4Vlfq2KZXJGPMLS+I
	 QG7AyZZQm6uoztVVWrv7OREhLwjahb5gEbiMZiekbubYDEZcshTlOGTc9uHQyZEa4A
	 j71IiHYkhKDKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 514088456D;
	Thu, 30 Apr 2026 05:15:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5BD718E
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9B50940484
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sm5EKW8Qm2oH for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 05:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A666E40072
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A666E40072
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A666E40072
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:15:41 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb47.dip0.t-ipconnect.de [84.161.187.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE485A4C00D7
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 07:15:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52414)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIJkR-000000004X1-0RwY
 for buildroot@buildroot.org; Thu, 30 Apr 2026 05:15:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 07:15:39 +0200
Message-ID: <20260430051539.2272625-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777526139;
 bh=BXCQEvIsJ1f/0OksBgKA6C8Bs9OhGZ9uprPCJnkvlwk=;
 h=From:To:Subject:Date:From;
 b=agkfQl97+1xcNmSR5tN4PNXVNUIe6E8oSpBG3mRJ3kPmvTRiyMFDGrrQEqEIs8j+Q
 TCXtR+hc07HnJJWOoGb1EX+1vKbeZ/CU30+z7VS898JiTNnZ/YhleatZ7k13XmiaZW
 Es0Nu36p4YIZgIVn6A4Yd5uXoIXk8azG1Y8jW55RdZQxXD/TEe/vfnK8kQHMrmGER2
 qB/TODrp8Hvkqimz2LWufz++UvaFkPfdEf0tcCjRdH4qkO7CbSumEdY0KlIvSnVkpI
 DLZYn3UqmFCOZLOwpdiBKS+zwhOy39NfIr4h+ZQ4pycmuZlQm4zJwgAQyyhqjonkko
 eAJnFIDzOYmUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=agkfQl97
Subject: [Buildroot] [PATCH 1/1] package/ethtool: bump version to 7.0
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

https://git.kernel.org/pub/scm/network/ethtool/ethtool.git/tree/NEWS?h=v7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ethtool/ethtool.hash | 2 +-
 package/ethtool/ethtool.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index ca28e43ba4..2e02f7b256 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  1c2114ab6e0c0d2aa67d699960eb11df4f341e2403139cdf28ae9da858a6025f  ethtool-6.19.tar.xz
+sha256  660bf9725a7871343a0d232068a7634fbcfb69b6c2f8eff455827faefb0cd162  ethtool-7.0.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 9fe63f31e7..b518c971c4 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 6.19
+ETHTOOL_VERSION = 7.0
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
