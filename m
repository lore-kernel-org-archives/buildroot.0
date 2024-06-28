Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33AF9C30658
	for <buildroot@archiver.kernel.org>; Fri, 28 Jun 2024 16:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F05EB4014C;
	Fri, 28 Jun 2024 16:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5FAakj4cB5n; Fri, 28 Jun 2024 16:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B9C40155
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B9C40155;
	Fri, 28 Jun 2024 16:48:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8DF1BF39D
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C837405A1
 for <buildroot@lists.busybox.net>; Fri, 28 Jun 2024 16:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eAj38RijZ34T for <buildroot@lists.busybox.net>;
 Fri, 28 Jun 2024 16:48:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 431D2401D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 431D2401D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 431D2401D8
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 16:48:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cda5.dip0.t-ipconnect.de [79.214.205.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F889A4C0CE6
 for <buildroot@buildroot.org>; Fri, 28 Jun 2024 18:48:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34592)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sNEls-000000000HR-3AIE
 for buildroot@buildroot.org; Fri, 28 Jun 2024 16:48:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 28 Jun 2024 18:48:23 +0200
Message-Id: <20240628164824.11246-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719593305;
 bh=cIziAS1vXIZQGuJgFUZHQ9jyoU2sHa9KVMcmaUG2yKk=;
 h=From:To:Subject:Date:From;
 b=QqXHQC82bh78lOK12T0W1b6w9jHtUlcaEY7acz/qN/pOuLN/Tpa9GEwGzxbkNbtbs
 +yCbVRjk4qESV61smxxUNgmf0iT3sGifYLM970LdWjrpwNYQ3ZHuzk5nw6JPnmEU+n
 EuDPBTFHhGTbZ2hGcCi1Jd7cXhZmO6H4OLpMU/udk/2f2OLfi857+lE6uDJW5hT+1P
 nTwLkJzf5RrUihhjW7cCuz8AidjYBouM9BCfpVLVTDcD0XvBrYpz5cvn0k7G766aWc
 YI7CJzxZyPmv9vxSHbhqElNw369K+XRUibz3x7O4tQxuHitA2Zp+qdmuceuEVYWMLd
 PaYpNzRmshUBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=QqXHQC82
Subject: [Buildroot] [PATCH 1/2] package/libva: bump version to 2.22.0
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

Release notes: https://github.com/intel/libva/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libva/libva.hash | 2 +-
 package/libva/libva.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libva/libva.hash b/package/libva/libva.hash
index 24825ddc1f..b1358b99a7 100644
--- a/package/libva/libva.hash
+++ b/package/libva/libva.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f7c3fffef3f04eb146e036dad2587d852bfb70e4926d014bf437244915ef7425  libva-2.21.0.tar.gz
+sha256  467c418c2640a178c6baad5be2e00d569842123763b80507721ab87eb7af8735  libva-2.22.0.tar.gz
 sha256  c86a782ee845b52472dae9b9d79fb915d333628ac0efe49cdce63644814931de  COPYING
diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index 79dbe577c8..46f42afba8 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVA_VERSION = 2.21.0
+LIBVA_VERSION = 2.22.0
 LIBVA_SITE = $(call github,intel,libva,$(LIBVA_VERSION))
 LIBVA_LICENSE = MIT
 LIBVA_LICENSE_FILES = COPYING
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
