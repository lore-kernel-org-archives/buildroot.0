Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD3CC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 07:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F46460858;
	Fri, 10 Jul 2026 07:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0-OAaxVkNqG; Fri, 10 Jul 2026 07:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FC06607C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783668011;
	bh=81UT1B1Ncx+HRI+prxsey4l3quSc6GunCeWNa0h8IMM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pk1CuCktWUecJ7gDACddeHgXwAQVc9jNuwDxgG1ymB+Yk4GGZDkNk67YWkYTZZBNC
	 sGLzWs4Bnl8ISJyFpYgtVDOnW/6uhJR+Z4BpOPlh9e+h4dED9pzGdfjIYQ4hHQ7Ft3
	 TlFPsonxcy4fAF1B1kK6pf25R62C/XwGWmM6nETU1ExNeXeAtbM63UxmleLIYBuGWR
	 JfVxhA5xBYSUbotTTcPtSm/O2D5Ch4sfBMgPbZ+ypvWq32FAL5WU2N0NYJ3ZIrreqV
	 cDGBSOviahVXyJ4ReI3RGUT3B/lku1KpUCzRr7ezFKDKh/rLPq3GmHF8GWSn1y90sB
	 doc2lJIBaL7uQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FC06607C9;
	Fri, 10 Jul 2026 07:20:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF9E3320
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B60CB40100
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IN9O8K205Bf5 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 07:20:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0B726400A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B726400A1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B726400A1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 07:20:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c4f9.dip0.t-ipconnect.de [79.214.196.249])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 959B3A4C2F5F
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 09:20:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50068)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wi5Wl-000000008GF-2Vng
 for buildroot@buildroot.org; Fri, 10 Jul 2026 07:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 09:20:01 +0200
Message-ID: <20260710072003.160464-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260710072003.160464-1-bernd@kuhls.net>
References: <20260710072003.160464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1783668004;
 bh=tw/yt69D7Q6J54bkgK0HV/NbFtz7JXcqK6Qz5/FVIII=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jkHFyKnFUEXfI/fzrHb96p1wEYvN7we3KOt6JzndEsZwuZTmP0+Hi6NQeV7QRdr+d
 3u/sYj9xJN7TavmInkOmZ8SDK0f8O5bnamhVF6ngfH612qahiQvITVeFK3MfcMZLQV
 96ilm8HgVkHGqVW4FARf8JQVxdX68eXAanT2xGbBExDoo4iS31ePJT7csCH1JRa4Cl
 nWCbQiCp3SRnVzm+FvtOwA+XZLlKZmB/dyO403pW164MwoLv71F6Z/grZQ+PBs+Tzd
 OnnTsAp0BLh60LH9L9TyK8aj3hT9luCGwvwu/INVywMnocMdIblb0OrofUH3MqhmIR
 rok1OVVKjmf9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jkHFyKnF
Subject: [Buildroot] [PATCH 3/5] package/libvpl: bump version to 2.17.0
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

https://github.com/intel/libvpl/releases/tag/v2.17.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/668fc1fd6c25e7abbad7dbfe140e34c7187e1f75

 package/libvpl/libvpl.hash | 2 +-
 package/libvpl/libvpl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvpl/libvpl.hash b/package/libvpl/libvpl.hash
index 08b2de31fc..684de90837 100644
--- a/package/libvpl/libvpl.hash
+++ b/package/libvpl/libvpl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d60931937426130ddad9f1975c010543f0da99e67edb1c6070656b7947f633b6  libvpl-2.16.0.tar.gz
+sha256  4de3e2faf1e8307fb282e4a43f443191810f6a6b0a484fffa7995ba1c814c6ec  libvpl-2.17.0.tar.gz
 sha256  bf1cfac2e2792b6e1e995ce103d70796aecaf2ec7e4c5fe5474f7acec7b4a677  LICENSE
diff --git a/package/libvpl/libvpl.mk b/package/libvpl/libvpl.mk
index 4e3c4807cd..e5ab9ac8ee 100644
--- a/package/libvpl/libvpl.mk
+++ b/package/libvpl/libvpl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVPL_VERSION = 2.16.0
+LIBVPL_VERSION = 2.17.0
 LIBVPL_SITE = $(call github,intel,libvpl,v$(LIBVPL_VERSION))
 LIBVPL_LICENSE = MIT
 LIBVPL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
