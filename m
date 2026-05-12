Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FED2CD4F25
	for <buildroot@archiver.kernel.org>; Tue, 12 May 2026 16:47:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26DCB40F77;
	Tue, 12 May 2026 16:47:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ITQ43smba9gg; Tue, 12 May 2026 16:47:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7810E40F6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778604453;
	bh=nz1/VCWNmSbILaX3W43n9vsbQNrrLhdc1FSGVnqqr1E=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=JOOtQLeSQTpIY0IDpK89zQ3zoYIle6N8rXJ9QK+6AJ8twj8Qm5X6/1AaM+7qLWqD+
	 rJrnhZBWjYyY+7ZwISSSKc9hArxuHfpiTOUAtkAgAgLtpRAR/rZWuMLtdQGYA6Nwgl
	 yAn09zankqQYa5ASEOrSzcSbToPTSF+Qg+p2Td1f0+FB6vQ6c6XaxBQngIhawQN5j1
	 S6LBqUwT7dUfMOmjxGBTUHEoPeExNwxDAouzdALa0O8Z4+AWz8Ea8wqZsTGbpZJIql
	 yWL4+42a+vnmNVpMTXPRsS4mbisgkEGWNYoO+9sI2yeNTeiEcjI2pZGn818Qa5kT/v
	 5u2p4tqP2NLGg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7810E40F6A;
	Tue, 12 May 2026 16:47:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E4210223
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4DDC40673
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NK2JjyNJpJtL for <buildroot@buildroot.org>;
 Tue, 12 May 2026 16:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B16874066F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B16874066F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B16874066F
 for <buildroot@buildroot.org>; Tue, 12 May 2026 16:47:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b10b.dip0.t-ipconnect.de [84.161.177.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CCA6AA4C0939;
 Tue, 12 May 2026 18:47:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:37532)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wMqGN-000000007ep-07sx;
 Tue, 12 May 2026 16:47:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 18:47:18 +0200
Message-ID: <20260512164718.3852205-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778604448;
 bh=4vSh1ZyXHHkhQxj+wEucrrarUhX52nmAxSeioAU3ZK8=;
 h=From:To:Cc:Subject:Date:From;
 b=ilDgLz1AhlLU5kLNuaLNjti2+qffDA8yIqKOLHHgerTbAdcGp7bsfe1Mjhuh/dFHC
 8dgQwpwFxPg7Q239vSR0qQ1GISxR4Tgn3jpLsw1ztAXSfSkfs/2dOYYCn9JyDxbCgj
 uoOloG//Myd+aZbooo63VgULvzbuRO1TJ5k68VZoOaMB/s0yqgxY1D22Ryy8NeHx//
 jn4qVGtTRCovtuQqaaj7xtaCANhha7S1UU3UjDmi4liSSevTSKRhnQ8OkKxRStCX+d
 MprbyEFylsuGLT/8y6ja6+8of6AloBBeihPTI3WK9JUtdq6dN2u9xkc20vz04zZ6oL
 yJ77Y91Fst91A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ilDgLz1A
Subject: [Buildroot] [PATCH/next 1/1] package/libmbim: bump version to 1.34.0
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
Cc: Aleksander Morgado <aleksander@aleksander.es>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/blob/1.34.0/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libmbim/libmbim.hash | 2 +-
 package/libmbim/libmbim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmbim/libmbim.hash b/package/libmbim/libmbim.hash
index d487b5156d..8e3ed5a8c4 100644
--- a/package/libmbim/libmbim.hash
+++ b/package/libmbim/libmbim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  7eca9f5af2eecfdb5e3a2a865a7f29d0ac9532ab187a9c6adce4d85f897eb385  libmbim-1.32.0.tar.gz
+sha256  55bb88df358f8a36b6e01e63877500d7c6420f5907d2d3101812b4912eabe08f  libmbim-1.34.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-or-later.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 190f3547ec..e2ae0d83d0 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMBIM_VERSION = 1.32.0
+LIBMBIM_VERSION = 1.34.0
 LIBMBIM_SITE = https://gitlab.freedesktop.org/mobile-broadband/libmbim/-/archive/$(LIBMBIM_VERSION)
 LIBMBIM_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
