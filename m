Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2410C44506
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 896FB40941;
	Sun, 12 Jul 2026 15:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7iwurbTN52d; Sun, 12 Jul 2026 15:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A2FB40818
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783869506;
	bh=86qE1lSOyNsbXBAgDWFok0vMlDLNjnrdPIeQKIwoXE8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gAZCAxCEeXqNeoFsE8WoJLu4rHj0ZWwqjWaIeelWzhffkt72lk6oBumwVde+dD5iP
	 tos71uO8S5NCY0h+Q2Vbd+UmdHO/7kMa3appb7KM40VCIVo/nX8hUo+rfD51Bo0MU/
	 8VOg/XhhX+r/pEWs+d15NOxcjuTcoEktvUd4rj9fbpSLpEvlyiMirnshJmkMVFotnM
	 Vu+Nut0xCEauvcLajkUnjXq5jZzKX3C09mHmYmLjgIOUgNDv4XUGlwlS4fIxgXEZ0m
	 XixRRrz/wI1VYSmFw1tFviuhWOT3iEgGHzipHs4vT1z/NPqzYalHnq5YjhD1RnwPqP
	 t0BbBMijkfEEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A2FB40818;
	Sun, 12 Jul 2026 15:18:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0ECF359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2CE340108
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b7Tevc7QStxm for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 15:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4CA63401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CA63401D8
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CA63401D8
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 15:18:21 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Md6Mt-1xHAlc1b87-00hyVW; Sun, 12
 Jul 2026 17:18:19 +0200
To: buildroot@buildroot.org
Date: Sun, 12 Jul 2026 17:17:55 +0200
Message-ID: <20260712151755.599427-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260712151755.599427-1-fiona.klute@gmx.de>
References: <20260712151755.599427-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:pGMqKtbUvzgK+tFcoWjTRZYpjpmlJ7l8Ra4oivoxCrFFgz8qsuV
 KSkI0dU3ongtmO9LV5QWJHtbtAcWPFvUIrlwWFqlSDYhiey+Tmh5Uo+d1CU2eLYb3TU61O1
 vru37k6kxEU7ovlGx3jwNQbQkhFfioCfyAId12lLQ7U5/XHgr3C0OXGQhTzKVRUXXflltby
 XgYxzeNUxNcUgQepsbJcQ==
UI-OutboundReport: notjunk:1;M01:P0:Kjz/XCCy8Q4=;wnT5wETas33+Nov88IJ4Hq9g73D
 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
 5BHLTywKI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1783869499; x=1784474299; i=fiona.klute@gmx.de;
 bh=7NXQa0F7vClNiyD3ZKmgRzx1rMfgmhJ/ZLj1PXiKEZc=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QCy98GeU9CM8KERteLdDgg0caWp0fAdjL+EIgFAlq9XyKxTZGmBkfx0uV461uaQJ
 SQx8z1ymcecM7FKdhg4MxSjnZOJHoNkv5VZWOPl/D2u9OpBoncbnVUaN8q4OfwV5N
 3P3l7pM3p0gzV/eOKA6syuXtCB6EjqUGAdhwkQsbuX3jh4PurZifRto9bxNhwVE0g
 uhhHkQR/PJtv214uAZdqCKMhRbBDyeniWY74FxgqvVXnWYyKwR1t10JkPrnDyKQ/b
 PBIGOIB6TZqZ9mQ2idcNS4Mf0kIDQuEVGzmrtHrp9gbASXW2AAs6xpTyf7jnyQz0h
 fqwriGd8Fj4meTOWqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=QCy98GeU
Subject: [Buildroot] [PATCH v2 2/2] package/btrfs-progs: bump to version 7.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changelog:
https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git/tree/CHANGES?h=v7.0

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/btrfs-progs/btrfs-progs.hash | 2 +-
 package/btrfs-progs/btrfs-progs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/btrfs-progs/btrfs-progs.hash b/package/btrfs-progs/btrfs-progs.hash
index f12c76c2ee..cf3a8d381d 100644
--- a/package/btrfs-progs/btrfs-progs.hash
+++ b/package/btrfs-progs/btrfs-progs.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/kernel/people/kdave/btrfs-progs/sha256sums.asc
-sha256  3382a84e3fcfe1ffdea07a61ab3f4e86665d38fa35f1f34548d5df867423e0df  btrfs-progs-v6.10.tar.xz
+sha256  c286d6876cbcd72327a0b417e4cfd280353ec23e37b549fdbcd7800a832d9a99  btrfs-progs-v7.0.tar.xz
 # Locally computed
 sha256  0d5bf346df9e635a29dcdddf832dc5b002ca6cdc1c5c9c6c567d2a61bb0c5c15  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  libbtrfsutil/COPYING
diff --git a/package/btrfs-progs/btrfs-progs.mk b/package/btrfs-progs/btrfs-progs.mk
index 8691a5710e..d9a3a8a858 100644
--- a/package/btrfs-progs/btrfs-progs.mk
+++ b/package/btrfs-progs/btrfs-progs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BTRFS_PROGS_VERSION = 6.10
+BTRFS_PROGS_VERSION = 7.0
 BTRFS_PROGS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/people/kdave/btrfs-progs
 BTRFS_PROGS_SOURCE = btrfs-progs-v$(BTRFS_PROGS_VERSION).tar.xz
 BTRFS_PROGS_DEPENDENCIES = host-pkgconf lzo util-linux zlib
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
