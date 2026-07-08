Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F605C43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 20:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43FDD40D89;
	Wed,  8 Jul 2026 20:01:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3W6pF_68ECG; Wed,  8 Jul 2026 20:01:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CB940D7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783540889;
	bh=5w5xSlXA8PjDEWv0lkIrt9QI2uHzAcd5aLELDBhaXWI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LvXHHoKPQ1S4W3yRQw54LWxFJibeA7LvFUKoFcdP+Jd8fPnOKOrOWo2iRYj4iv6Nz
	 d/ybA0OQQB3jWsjYkMr3U0PTvN6HfKzYSkpP4NdmAIqLb0mC+0U3Rc965hVVbXvFkd
	 L76ArwXhmjxhL8ouhbm626+zmFYKLj9bnfdPf/cTkjlNIsHrB1rO/zzO7X2cFCsQ1D
	 gz81XfFSDQG07o4ojfC3CDKIBesnkzSqtmpXyNQdN0Q4js4O+KQE6EtREbk7+y3+K7
	 /CKicsvnfY8AKNOJ9+C4FBx0Fzhb3yfW7gG2DPLczHsyjzsH4jibtPDHK7gMp/NUpH
	 FvU6pw4plrSaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CB940D7D;
	Wed,  8 Jul 2026 20:01:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9A5C92D1
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C067816E9
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 20:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85AtsO1p-QgO for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 20:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 980C3816E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980C3816E2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 980C3816E2
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 20:01:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a01.dip0.t-ipconnect.de [91.58.10.1])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6C55A4C1434;
 Wed,  8 Jul 2026 22:01:24 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51592)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1whYSS-000000000yF-1OgH;
 Wed, 08 Jul 2026 20:01:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Francis Laniel <flaniel@linux.microsoft.com>
Date: Wed,  8 Jul 2026 22:01:24 +0200
Message-ID: <20260708200124.1689961-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783540884;
 bh=vLTWW1MnmJCD7Nud+xjqYrG3dRwV/iXrOrMGIt43uME=;
 h=From:To:Cc:Subject:Date:From;
 b=RS5kkzlHWtT+hWwpS8XY0kR+CakAUCKGyhxQaYf0x1FdYODnVulSpBb15PgGf89Bi
 0OWG1xMBpQVyqc3pkgCFW3DtTD9bGJMSoQWb/6qKt9JiylJ/yyDJGQPfMHWu7xAvdo
 Vz8V3EnE5BPwT0dMcgiTOmkzyDPEwCrI1x18fKrS7FFuX7ws+KD0hms86PLwukBhf6
 WI3JfxIOhlsbTuD2IjvXmd3RLdMyu1APo6HPuqScvwwKZdUo3auGfE5nH/y3YRvsL1
 bwDihbrRFDKDhb9QRMwDqVPZqXKoxQhJdprCBLmkMGrSBuq8kiSeNF0gBkzOjMNpW3
 zTG3RJX1HmrxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RS5kkzlH
Subject: [Buildroot] [PATCH 1/1] package/pahole: bump version to 1.31
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

https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.29?h=v1.31
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.30?h=v1.31
https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/changes-v1.31?h=v1.31

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/e8f43d956d7c805f353a11e8477704ebc668e6f8

 package/pahole/pahole.hash | 2 +-
 package/pahole/pahole.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index efa1218468..f70ab020d7 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  9a319c214b38554be8430a672043d85735564e8e1e78db5a41cba7a03d038056  pahole-1.28.tar.gz
+sha256  a0b9d79bdb8d3028a87afd402a61d0ff5b05c982b15f6bab1be08ca1662cd0e9  pahole-1.31.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index 150373fd7e..cf5bd584ef 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = 1.28
+PAHOLE_VERSION = 1.31
 PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
 HOST_PAHOLE_DEPENDENCIES = \
 	host-elfutils \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
