Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF91FC5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 20:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BED8A605B5;
	Sun, 16 Aug 2026 20:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rW1E2585ccun; Sun, 16 Aug 2026 20:32:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8E06605CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786912356;
	bh=dLahwr5+94QwTOZ1NpVlsv52ICSepMNJzvPnOQppTCg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qbEVdi7tB+we92wSsHRZEZMILCc9mVx9SkTQ/vfzkU9zSjJ753i3nFvldxfwPk/Uk
	 E8m/wPamiV3B5GD/KOzYfVFClRKBy/8eoobHHXR/Jv0DQzhaXUf8U+UdNJzHQrexlr
	 dsQNJftnQ/nlrAzzvLisQ2daMxUU2tU/q1fMKNSWqYBGUTgk2uy+eSgutFYqVGD0Al
	 51AYU/eNtkRPLcw/tlk2P+6a4n59H6jtuMwlBPauTT/mzKfSXXusvQ+6kHpLRPYaLl
	 uZ2/BORloPxRtJGY2VMXps7snsOjwgm6yAAmM23+2atSCCSYKa4Kh9Fx3HRS9Z8M0k
	 gcizDr0W3W0Vg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8E06605CE;
	Sun, 16 Aug 2026 20:32:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A391C23F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95A0E400B5
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3k_KAIukK8R for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 20:32:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36AB340086
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36AB340086
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bRYGJKJ9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36AB340086
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 20:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1786912327;
 bh=El3TzC+PWlgQ5lKpl4USLBL5sazksfoyJ9QFPcl3BUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bRYGJKJ92i/QaDMNLWC0/Blt2i+xWdj0UYQjALK748aSsp4/vh95vkGxgGnZ6G5FW
 itq41hEb99Eut0BtAzUDsbpKZC4OFz2FcmSDYeMTxZfMa8AImvswSA5YfrqG3ByKnq
 b0SXhXrkN3+1Fre2v0DPZa9AUu2wQJhOouRZ4dRjybcvNNtY0qltNi57F4UWP1N3cw
 kxqjb+0z3L0cy3qCifbiNp0jL9ItKX4nZp/oYKH9IR/3gaWdXva+w2sn64WRohLh7G
 NCQeXwTpV23JiX0t+0hq/jiBFil1vJ2XkJMyBZmEAShk9GgzvgGHgGWkmq+cruzRyt
 RDgvwO1uBc/pw==
Received: from fli4l.lan.fli4l (p4fd6cf91.dip0.t-ipconnect.de [79.214.207.145])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E13D0A4C4DC0;
 Sun, 16 Aug 2026 22:32:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53480)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.5)
 (envelope-from <bernd@kuhls.net>) id 1wvhWZ-000000002MC-2f98;
 Sun, 16 Aug 2026 20:32:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 16 Aug 2026 22:32:05 +0200
Message-ID: <20260816203207.3980846-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816203207.3980846-1-bernd@kuhls.net>
References: <20260816203207.3980846-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 3/5] package/docker-compose: bump to version
 2.40.3
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
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release notes since version 2.38.2, see:
https://github.com/docker/compose/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/99b74ab8c322d7aacf9b9bee370fc273a0dc7fa5

 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index a2ffadd31c..fd715c3591 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c0453729b7a37badcf530fc140b1b8b907cbdcecfdb6be6413f410c86665c70  docker-compose-2.38.2-go2.tar.gz
+sha256  cdf70334f2c6afe8fcf1c5d6b4065cd9e8d26dc6317811ce5aabe0f8a0e95951  docker-compose-2.40.3-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index f70cf725df..17390e6577 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.38.2
+DOCKER_COMPOSE_VERSION = 2.40.3
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
