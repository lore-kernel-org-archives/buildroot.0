Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6476CCD1A2
	for <buildroot@archiver.kernel.org>; Mon, 20 Oct 2025 20:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B587D616BB;
	Mon, 20 Oct 2025 20:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xe-ySEfAvQrc; Mon, 20 Oct 2025 20:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F3A7616C8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F3A7616C8;
	Mon, 20 Oct 2025 20:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ED74370A
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DEDB384174
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etPzou893VOw for <buildroot@buildroot.org>;
 Mon, 20 Oct 2025 20:35:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CB04284357
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB04284357
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB04284357
 for <buildroot@buildroot.org>; Mon, 20 Oct 2025 20:35:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a021f.dip0.t-ipconnect.de [91.58.2.31])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0D7FA4C2098;
 Mon, 20 Oct 2025 22:34:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38910)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vAwaK-000000006LE-3cnw;
 Mon, 20 Oct 2025 20:34:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 20 Oct 2025 22:34:28 +0200
Message-ID: <20251020203428.2751864-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020203428.2751864-1-bernd@kuhls.net>
References: <20251020203428.2751864-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760992468;
 bh=786rN79hnEdVb8jJrW993JdarpYb0AnweVubOk2tZcI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ue0Abi+gQPc43X5vb7YRSS0lJ2Sk/+Np0uNLVcZSrYl0XuG/L8vBQ/4VzNOMIKC+K
 dF/noGoS98+zEsYcLeF53Si9eazm2axjuAzmNbMjUJ78Lp/Z4i/854KpG0fJmkOG/F
 vnKuaoKA20OVfS83IWQOc+PlY1KW6KLOf9c0JUn947kVUBnhmPMkNh/6oVzzc72BR6
 cu/J7UT9YEh6OTor4fl1Yw5OdwQe4m1SCMW1TP7NkNEPOhD1ctmWCJts5BTaK2rj48
 GsyLy077IDdkJapkcJOMozUUzmwin6xqCqwWMiDcDkIuEFZyH6qKLoGPIKB93fvOAh
 wlZ4zV9SArw6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=ue0Abi+g
Subject: [Buildroot] [PATCH 4/4] package/libminiupnpc: bump version to 2.3.3
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

Update license hash due to copyright year bump:
https://github.com/miniupnp/miniupnp/commit/5ebfc34f9601f0fddfcfdd1521ea63d9bb97b339

Changelog:
https://github.com/miniupnp/miniupnp/blob/miniupnpc_2_3_3/miniupnpc/Changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libminiupnpc/libminiupnpc.hash | 4 ++--
 package/libminiupnpc/libminiupnpc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libminiupnpc/libminiupnpc.hash b/package/libminiupnpc/libminiupnpc.hash
index 4f7e7c7aa1..de252310fc 100644
--- a/package/libminiupnpc/libminiupnpc.hash
+++ b/package/libminiupnpc/libminiupnpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b0c3a27056840fd0ec9328a5a9bac3dc5e0ec6d2e8733349cf577b0aa1e70ac1  miniupnpc-2.2.7.tar.gz
-sha256  7480ae23b082c05ad9823896163d78f3a96f1beadce51f29c96cf898545c27e5  LICENSE
+sha256  d52a0afa614ad6c088cc9ddff1ae7d29c8c595ac5fdd321170a05f41e634bd1a  miniupnpc-2.3.3.tar.gz
+sha256  52bdad87d7aefe3eab35cb02426aa748510f9398a1e2d520d93bcbb18f10dd11  LICENSE
diff --git a/package/libminiupnpc/libminiupnpc.mk b/package/libminiupnpc/libminiupnpc.mk
index 3bd4ee6a9f..7eea4318c6 100644
--- a/package/libminiupnpc/libminiupnpc.mk
+++ b/package/libminiupnpc/libminiupnpc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMINIUPNPC_VERSION = 2.2.7
+LIBMINIUPNPC_VERSION = 2.3.3
 LIBMINIUPNPC_SOURCE = miniupnpc-$(LIBMINIUPNPC_VERSION).tar.gz
 LIBMINIUPNPC_SITE = http://miniupnp.free.fr/files
 LIBMINIUPNPC_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
