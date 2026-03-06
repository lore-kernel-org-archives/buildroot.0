Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FB4FCC07D
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 22:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C932F613CE;
	Fri,  6 Mar 2026 22:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXGxESED72Ig; Fri,  6 Mar 2026 22:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28EE560A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772836415;
	bh=MzU921ifF/tPpR6HIkccXAao/QGXf9ATrRMhYJAenlY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gt1m7QYQClRYGJApnq3sintpXm3DNRUVd+pR9udu492bS/52HLLsBwC4UkG/+v8Zx
	 MmjcIuToMwbfko14ofwc7aVIe5zLiHArDN6Xks/7qQeoHABRygsogFfBeOZ+1vNaCY
	 M588iXiFNSgBgiNijhl9RnV0lznOw9w73hUDtmwI8av8/+iduqMeL3fpyUfYvpFG7r
	 iiMcjeStO3Dub1TLDTx/boQm87CrfgqWFCv/nf7l3nuX6FfV8/TfQv5mRwQe8zkJ2c
	 F56UY21gFcfO4NY3+KuBYwv7X9EuIwP/5XyMNFLFOZxW6woUAbcUrsqpGRwt2+x1N7
	 aCeDbPzVqj8ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28EE560A61;
	Fri,  6 Mar 2026 22:33:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6B025B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F15840165
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYJ1dpHHDYGq for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 22:33:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D409340164
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D409340164
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D409340164
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:33:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F053A4C2335
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 23:33:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39898)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vydjd-000000002ny-0CNW
 for buildroot@buildroot.org; Fri, 06 Mar 2026 22:33:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 23:33:28 +0100
Message-ID: <20260306223329.119094-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772836409;
 bh=L0w3R0/NUs5Dz9iqdMjgnJKTjId9LoqPMIay2Onxh4Y=;
 h=From:To:Subject:Date:From;
 b=ggnqDTAH/3/xBpRuzsNqSuvVObIwRzKsRhyEhTcEOk8CTBtEPZh+ZjyDuFpnzwK3x
 M+Ooy4XiPnJKmExd50BTETH0f9zm7vFSvBJcg5eScYxmEXayFTWJHPGxmdTKPbkhjG
 RDIFUT6M18RjHIv3vOA9BxbULqx2tpPR8f89gQlH9ahhgjJWIPXo34W6IDR2/+FlpG
 azByEnWSyDAZLLaFzgS2dKR2v5wy386x+LADJNjZPyHi4LXSY7ZY5qrA2YpbMOjCL9
 uOI3tuo0W32cAOOvVFiHw6kwvo54oBBy6VedOejTSGBI2sGywu2gQg0x77gKhIHWwp
 vIISs/O5jC9LQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=ggnqDTAH
Subject: [Buildroot] [PATCH 1/1] package/libid3tag: needs host-gperf
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

Buildroot commit 0ed1707ba559103f0aa298d40b5017b6bad0394c bumped the
package to 0.16.4 which re-added the dependency to host-gperf:
https://codeberg.org/tenacityteam/libid3tag/commit/2d7e73eb9f580b2258e434e0a8d63c69687ff5ef

Fixes:
https://autobuild.buildroot.net/results/133/133adafe89bc2b7df28dcb10eb30c19272100670/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libid3tag/libid3tag.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libid3tag/libid3tag.mk b/package/libid3tag/libid3tag.mk
index e310f50b7d..be6f629c86 100644
--- a/package/libid3tag/libid3tag.mk
+++ b/package/libid3tag/libid3tag.mk
@@ -10,6 +10,6 @@ LIBID3TAG_SITE = https://codeberg.org/tenacityteam/libid3tag/releases/download/$
 LIBID3TAG_LICENSE = GPL-2.0+
 LIBID3TAG_LICENSE_FILES = COPYING COPYRIGHT
 LIBID3TAG_INSTALL_STAGING = YES
-LIBID3TAG_DEPENDENCIES = zlib
+LIBID3TAG_DEPENDENCIES = host-gperf zlib
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
