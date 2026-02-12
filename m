Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D90EEEA84C
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 19:27:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 361EB4094B;
	Thu, 12 Feb 2026 19:27:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nZzUCBaQj-S2; Thu, 12 Feb 2026 19:27:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29DC840B3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770924468;
	bh=F1/VSf6ni3gzih0xRcC1DpC3NFLQ3fxZwrOrd6J2F74=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jome5sDo+t42Z+JncWFJlQxmQl1WDFbJjr0rZanNstkNqbv+js1R4cuiT1PY3d2dq
	 tJ/CKirSzc4oAFvIU9vAfQyH+YLSIc6FTT23bqWCH4qC5cEf7m2+NFMpS0DGeBPAcN
	 Z0k4ol65+XL8rMMc958JfBg235OS6f6ZMqtwIUq/ofaQhZzeMw5KcdZfLZHQ+qmS4G
	 0HCXGyFRkh7ApTTYMsjgZWAvEtVochKDTLDVwgfmUBBxjvL4PLkhcns8BUGTT1a21I
	 ym2YczqJCLYHnPiAbA8HO6TylT0e93fm4TFgLyXg9wILlpPGns/S5/B5T6loVoS0OF
	 3rW3LRVeY1xLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29DC840B3E;
	Thu, 12 Feb 2026 19:27:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EDEFEC
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6F5A40B15
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:27:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9l2DDTuWJfx for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 19:27:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3B5CF4094B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B5CF4094B
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B5CF4094B
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 19:27:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c3ec.dip0.t-ipconnect.de [79.214.195.236])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D9A4BA4C0D40
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 20:27:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53320)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vqcLk-000000000BX-0zCM
 for buildroot@buildroot.org; Thu, 12 Feb 2026 19:27:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 20:27:40 +0100
Message-ID: <20260212192740.1895472-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770924460;
 bh=k+aQmeDm5K2R1PnoCrp/ZBOC2IO7hGojXqrGQGaB1FY=;
 h=From:To:Subject:Date:From;
 b=K/I7NuKuBlRjTXIZ3XmH/oOEpiRUrU5xcBigAh62TtCCxBKv0+uEeyLcqihW3VrjS
 3jMIONWyi5tZBl21ZsUT132XyPHNIpqlzsDBZjD9S6rqmnl04/sMEcT5ipUTaP8TLg
 QNEka2eyJoEFvU/IQmaKbUUQhB03BEVOXJg/rso9DO9pMD+xtSD2cl5Q+2M1w2NCzT
 Q7rdpUVS46RuzN3OFiX9tiafvtyYDUS5o1Skccf2iRiP8Emd5/qRVK1UHldm7uMYeE
 E1HBOo3b5S+dVwM76Z1WKZ0Q0ML+G6skX5PwviqQMWSC1g7cZmKW4+4BbTNiI5vskT
 HY19+PypOWWSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=K/I7NuKu
Subject: [Buildroot] [PATCH 1/1] package/tor: bump version to 0.4.9.5
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

https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.5/ReleaseNotes

Updated license hash due to upstream commit:
https://gitlab.torproject.org/tpo/core/tor/-/commit/2b0be077600beb95066ffa5f06094eeca906851a

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/tor/tor.hash | 6 +++---
 package/tor/tor.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index eeafd49058..a4b0af12b5 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.8.22.tar.gz.sha256sum
-sha256  c88620d9278a279e3d227ff60975b84aa41359211f8ecff686019923b9929332  tor-0.4.8.22.tar.gz
+# From https://dist.torproject.org/tor-0.4.9.5.tar.gz.sha256sum
+sha256  c949c2f86b348e64891976f6b1e49c177655b23df97193049bf1b8cd3099e179  tor-0.4.9.5.tar.gz
 # Locally computed
-sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
+sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index c0785ef2b1..36be7967bf 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.8.22
+TOR_VERSION = 0.4.9.5
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
