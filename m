Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99695D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E6460DA1;
	Sun, 14 Dec 2025 17:15:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tXHJyVH4hbtt; Sun, 14 Dec 2025 17:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BEA160D91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765732536;
	bh=xnyUv9MqTF3am9C9LXDVEewCut9cQHlZ3do0nhJshHc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K5YbZ4aEt2cB2TGMmhBqhDF2Onp6YENJvTTKf+57zg4850ZIPD4rI4JIKMSobluiM
	 hMOTzkBJNPvktRUXplwtpv7L6kcoQTpGW50mhZREnLHoj5cb+yUABrAyaKfLDDym3B
	 +xMVn6TntWB1RfV6ITKaVyL9CW/t1pN72fqNQubC9Cflkl0C4RDPyzch6cNon8z4F7
	 OXFyzzSgm07KR3HCdqxv+JBxzuFce0FzhMX1u9BfOBsls6BOzEkfMx9+W+3ss+6Mnr
	 lMW+22nRwRQ/FiHaUZQNQd7W3NzToPqYFO26go44L4CCkrzwWy3WXNuWH9j/7344Ox
	 pnFa8d6T9yWCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BEA160D91;
	Sun, 14 Dec 2025 17:15:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5CA52D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C74B160D91
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u7fn3Ga7-UnA for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:15:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D2910608BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2910608BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D2910608BA
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:15:33 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 778DFA4C3BBA;
 Sun, 14 Dec 2025 18:15:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUpgw-000000003EJ-3aoI;
 Sun, 14 Dec 2025 17:15:31 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Laurent Charpentier <laurent_pubs@yahoo.com>
Date: Sun, 14 Dec 2025 18:15:30 +0100
Message-ID: <20251214171531.1496512-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765732531;
 bh=FY6WYzXuVc2k8UdGobmhKr3T3UNGXKx4LGXUzxm/Fnc=;
 h=From:To:Cc:Subject:Date:From;
 b=rZTCob6ewbXwDIYx1oygVmrcUC/dh9gwD8k8pbpMD7UEgZkh33NnF8FZ8VGhY8Zgi
 bGpc8HadKkkLJUHk5xD7bZ2U24YIUG0xNnyzjFmxVfNfn5EctFICY93GxbskUQuN/6
 nTFF1PW1zVG5irWdZYWy1Db7XRO+jfHzgGZGT57JtthovKD53wOM9e/IOJCHzcY6iB
 a7hgcdVSsVh2oFDZG9XpBJt/Uf4yeBZPwQOmGQ/nfSYNrcZi9eciwDqofF5UcCDN9W
 tQHza9P5CBTt+WXrHGNCOUfN0kSJiPCOPF+etSC0YV+K29Yi/Wai18oTlKZ+T3qh3o
 LCPwEnBq3l0wA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rZTCob6e
Subject: [Buildroot] [PATCH 1/2] package/open-lldp: fix musl build with
 gcc-14.x
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

Fixes:
https://autobuild.buildroot.net/results/0f8/0f88cbe9152ab816b4ae17e1d84e8257f458eb4a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...string.h-for-mem-function-prototypes.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch

diff --git a/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch b/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch
new file mode 100644
index 0000000000..de67131c58
--- /dev/null
+++ b/package/open-lldp/0001-clif-Include-string.h-for-mem-function-prototypes.patch
@@ -0,0 +1,26 @@
+From f9d0099ac7d9041447cce4d3edd9577b4b52c09c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 22:37:14 -0700
+Subject: [PATCH] clif: Include string.h for mem* function prototypes
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/intel/openlldp/commit/f9d0099ac7d9041447cce4d3edd9577b4b52c09c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ clif.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/clif.c b/clif.c
+index cad6f75..0758a7e 100644
+--- a/clif.c
++++ b/clif.c
+@@ -32,6 +32,7 @@
+ 
+ #include <stdlib.h>
+ #include <stdio.h>
++#include <string.h>
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/socket.h>
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
