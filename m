Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A26EB7EB8
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 11:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39FC8607C2;
	Wed,  4 Mar 2026 11:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mVoYkA6OHpOB; Wed,  4 Mar 2026 11:17:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 05A38607C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772623042;
	bh=nUB412Z7YwS60ERSKifjt/vu6iRrXZaW3b1cBZXvTfM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=IshbI1tLmLQJMgrEiu354lJInVsHlS61tjf3ur49OP/yFanpeXbf1RJvK5qnoKELJ
	 ISEfMbez5PUefBirJJtHDCtJra9w3ssFdYjWH+86GXIUAf1uqOFHtfIqXpLtp+UG+Z
	 tphzddb331xlJHOYSEcgZV4QveBtIn+MlSB8zTKpAylF4SeRwSuQkf0Rxe9+vs3dW/
	 HsEH8snhgCuiTU7n9F8raaF+h6nofWCOvqXkyrglz2a43krmiVJNQRHvWolvMfrzeZ
	 j2U9507T7PfexY9vcssu7tIk9TfMNEyax7RuIZlPXCZn4DvI+Fb9LjDkkklDKFSyz/
	 cJbiZgVhXrTOg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05A38607C4;
	Wed,  4 Mar 2026 11:17:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 077C71EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 11:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED943607C2
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 11:17:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EczuWcmblhqd for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 11:17:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0827760799
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0827760799
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0827760799
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 11:17:18 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82742aa5a3eso3346518b3a.1
 for <buildroot@buildroot.org>; Wed, 04 Mar 2026 03:17:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772623038; x=1773227838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ESnl5sfsT+prkUqQpDNJqkYgrokGN7mrTUez/ZxYu6Y=;
 b=AIQfN4hMsYaq2m59abZTTcvRLhwCFu9phC6JohsjmFLORh/r5iNuC61ceOUQwyImtZ
 RWIm350ZaNjZR5rhxXZe7hmvH9NS4kvQBMT0OITPtuZGvJapI5nk39+faVIqODHqcXAJ
 s3Mx23RnpD0NUj5O/sgKiWAxJGHY1ukgZHgwGUXwU9wZQGxIcdBZoSUTh8EpK6skf4b+
 R2dnwl8fXkDazkVcAhzz8SuUArRgH56tIztEUhFeoNpXyHkk/pXknmMSiS2pb/EUcUeh
 V/nXkYmugMvQrLmtP6IAuQqHxWb2JH7nZJ5sQmMbwmpucIbNoVhMX1o8xj/sglMmM5Vn
 /tNQ==
X-Gm-Message-State: AOJu0Yyyi3ZzICcFoS7QwWkUCtCIf5QSoy9HrnGI9OyQM4AeG5YXJIH8
 6m+UqLMUaHz28IVMHExa+4i/likZBTyVTQD4FDHRctDeCYWyTbegoFsV/SGm/S/B
X-Gm-Gg: ATEYQzzJZ12F2coMq/h5uHCafdZBg4YjjFiDZcJxddb4DDD+SB1XOWXv+Z2exywY0bM
 AZTLGt7otYBKnkwmiSOkXXlEV4nX/apmEa9Im/z1nJTcGPCueVnG9mG6riZm2E+Rk9UkrtrU9K7
 TH2434+0ebx4tHCFlRCLZslbXOReZmRbNzUsGCNE1qxqZZOm6Qz0DpO92iiWyu7nTZW/NWAhiFs
 XJ91VwSfnTLeFvFvvRq8TDRq3CeIUcVqWkCKK+GI51VIrZLb2kh1zr997EVPnbjNx50HiIKAvi0
 kWH9Xy06xGyJk7wU0sb03TPmzlIfG6IPhB4futGpZ3uP35ZkkrRgsloikKMnIb1JzWjelFRs8Uq
 X8YXjbcBd0ukTImXAeop8GthHcm9lkDyS4cTaW6JR8Os7h/ijVJ0fjZeJ05sBuKRymhyT0Hqs+7
 m5+MdIcy517KK9OUQSPTGD+MMtj4LFbxsTWw==
X-Received: by 2002:a05:6a20:3d02:b0:366:19c9:b6b6 with SMTP id
 adf61e73a8af0-3982dd5f59fmr1609224637.11.1772623037586; 
 Wed, 04 Mar 2026 03:17:17 -0800 (PST)
Received: from fedora ([47.30.255.168]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82739d4d826sm18509508b3a.10.2026.03.04.03.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 03:17:17 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 16:46:59 +0530
Message-ID: <20260304111659.944878-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772623038; x=1773227838; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ESnl5sfsT+prkUqQpDNJqkYgrokGN7mrTUez/ZxYu6Y=;
 b=f5FjwQzYghp7UKEtZwxUaAge1fQ0dIyDela55s7VZbCB9BhLBBADM8ftOop/DypvXo
 c/B/8cCcTmgDU0Gxl1y143Y/8g8rADowMjJylwZsW6QfgMCRFwTyVn937v/cAYwNGJo+
 ZOLVVTjAZ4B7Qwswy2NVFntIDS7eHHEfrzkir/iHqfvfUmeBtsCAzJzyXS0ke49CohKD
 6I/va6miflfp1vNbm65mjARNnUWvRO5LtMS4DNPxta+yiXe6mZ0W+1JystJOxhkaPFGH
 Nf6131jrDXyqf2OIOAV65URDh9ZTi7M03dkrN5XpgsLSUH9YmRdoCsUalCCfv0qs8sVS
 PIxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f5FjwQzY
Subject: [Buildroot] [PATCH v1 1/1] package/alfred: bump to version 2026.0
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
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This version bump also includes a patch to rename the __unused macro
to ALFRED_UNUSED to avoid conflicts with the __unused member in
uClibc's stdio.h, which was causing build failures.

Also add Shubham Chakraborty to the DEVELOPERS file for this package.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS                                    |   3 +
 ...001-rename-__unused-to-ALFRED_UNUSED.patch | 108 ++++++++++++++++++
 package/alfred/alfred.hash                    |   6 +-
 package/alfred/alfred.mk                      |   2 +-
 4 files changed, 115 insertions(+), 4 deletions(-)
 create mode 100644 package/alfred/0001-rename-__unused-to-ALFRED_UNUSED.patch

diff --git a/DEVELOPERS b/DEVELOPERS
index 9e983ae113..60578ff361 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3055,6 +3055,9 @@ F:	package/tunctl/
 F:	package/ubus/
 F:	package/wolfssl/
 
+N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+F:	package/alfred/
+
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
 F:	package/cppzmq/
diff --git a/package/alfred/0001-rename-__unused-to-ALFRED_UNUSED.patch b/package/alfred/0001-rename-__unused-to-ALFRED_UNUSED.patch
new file mode 100644
index 0000000000..0362907fb5
--- /dev/null
+++ b/package/alfred/0001-rename-__unused-to-ALFRED_UNUSED.patch
@@ -0,0 +1,108 @@
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Wed, 4 Mar 2026 16:10:00 +0530
+Subject: [PATCH] alfred: rename __unused to ALFRED_UNUSED
+
+The __unused macro conflicts with the __unused member in uClibc's
+stdio.h, leading to build failures. Renaming it to ALFRED_UNUSED
+avoids this namespace conflict.
+
+Upstream: Pending
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+diff -urN alfred-2026.0-orig/alfred.h alfred-2026.0/alfred.h
+--- alfred-2026.0-orig/alfred.h	2026-03-04 16:08:06.379797866 +0530
++++ alfred-2026.0/alfred.h	2026-03-04 16:08:06.392873923 +0530
+@@ -31,8 +31,8 @@
+ #define ALFRED_SOCK_PATH_DEFAULT	"/var/run/alfred.sock"
+ #define NO_FILTER			-1
+ 
+-#ifndef __unused
+-#define __unused __attribute__((unused))
++#ifndef ALFRED_UNUSED
++#define ALFRED_UNUSED __attribute__((unused))
+ #endif
+ 
+ #define FIXED_TLV_LEN(__tlv_type) \
+diff -urN alfred-2026.0-orig/batadv_querynl.c alfred-2026.0/batadv_querynl.c
+--- alfred-2026.0-orig/batadv_querynl.c	2026-03-04 16:08:06.379962346 +0530
++++ alfred-2026.0/batadv_querynl.c	2026-03-04 16:08:06.392652506 +0530
+@@ -173,7 +173,7 @@
+ 	return 0;
+ }
+ 
+-static int check_nlcmd_cb(struct nl_msg *msg __unused, void *arg __unused)
++static int check_nlcmd_cb(struct nl_msg *msg ALFRED_UNUSED, void *arg ALFRED_UNUSED)
+ {
+ 	return NL_STOP;
+ }
+diff -urN alfred-2026.0-orig/netlink.c alfred-2026.0/netlink.c
+--- alfred-2026.0-orig/netlink.c	2026-03-04 16:08:06.380598235 +0530
++++ alfred-2026.0/netlink.c	2026-03-04 16:08:06.391422908 +0530
+@@ -22,8 +22,8 @@
+ 
+ #include "batman_adv.h"
+ 
+-#ifndef __unused
+-#define __unused __attribute__((unused))
++#ifndef ALFRED_UNUSED
++#define ALFRED_UNUSED __attribute__((unused))
+ #endif
+ 
+ struct nla_policy batadv_netlink_policy[NUM_BATADV_ATTR] = {
+@@ -121,7 +121,7 @@
+ 	return 0;
+ }
+ 
+-static int nlquery_error_cb(struct sockaddr_nl *nla __unused,
++static int nlquery_error_cb(struct sockaddr_nl *nla ALFRED_UNUSED,
+ 			    struct nlmsgerr *nlerr, void *arg)
+ {
+ 	struct nlquery_opts *query_opts = arg;
+diff -urN alfred-2026.0-orig/server.c alfred-2026.0/server.c
+--- alfred-2026.0-orig/server.c	2026-03-04 16:08:06.380811587 +0530
++++ alfred-2026.0/server.c	2026-03-04 16:08:06.390909701 +0530
+@@ -393,8 +393,8 @@
+ }
+ 
+ static void sync_period_timer(struct globals *globals,
+-			      struct epoll_handle *handle __unused,
+-			      struct epoll_event *ev __unused)
++			      struct epoll_handle *handle ALFRED_UNUSED,
++			      struct epoll_event *ev ALFRED_UNUSED)
+ {
+ 	struct timespec now;
+ 	uint64_t timer_exp;
+diff -urN alfred-2026.0-orig/unix_sock.c alfred-2026.0/unix_sock.c
+--- alfred-2026.0-orig/unix_sock.c	2026-03-04 16:08:06.380857253 +0530
++++ alfred-2026.0/unix_sock.c	2026-03-04 16:08:06.390759277 +0530
+@@ -25,8 +25,8 @@
+ #include "packet.h"
+ 
+ static void unix_sock_read(struct globals *globals,
+-			   struct epoll_handle *handle __unused,
+-			   struct epoll_event *ev __unused);
++			   struct epoll_handle *handle ALFRED_UNUSED,
++			   struct epoll_event *ev ALFRED_UNUSED);
+ static int unix_sock_register_listener(struct globals *globals,
+ 				       int client_sock);
+ 
+@@ -511,8 +511,8 @@
+ }
+ 
+ static void unix_sock_read(struct globals *globals,
+-			   struct epoll_handle *handle __unused,
+-			   struct epoll_event *ev __unused)
++			   struct epoll_handle *handle ALFRED_UNUSED,
++			   struct epoll_event *ev ALFRED_UNUSED)
+ {
+ 	int client_sock;
+ 	struct sockaddr_un sun_addr;
+@@ -604,7 +604,7 @@
+ 	free(listener);
+ }
+ 
+-static void unix_sock_event_listener_handle(struct globals *globals __unused,
++static void unix_sock_event_listener_handle(struct globals *globals ALFRED_UNUSED,
+ 					    struct epoll_handle *handle,
+ 					    struct epoll_event *ev)
+ {
diff --git a/package/alfred/alfred.hash b/package/alfred/alfred.hash
index 2153d17e90..96faf79ad0 100644
--- a/package/alfred/alfred.hash
+++ b/package/alfred/alfred.hash
@@ -1,5 +1,5 @@
-# From https://downloads.open-mesh.org/batman/stable/sources/alfred/alfred-2022.1.tar.gz.sha1
-sha1  14e916bda706ccff510f2ea00bb3143c582c9ff2  alfred-2022.1.tar.gz
+# From https://downloads.open-mesh.org/batman/stable/sources/alfred/alfred-2026.0.tar.gz.sha1
+sha1  72c6e507d2ffb92f4bd866b10d7470baf998a37f  alfred-2026.0.tar.gz
 # Locally computed
-sha256  3a0ac2bb26e0cb3f2732d4873669a0a22e9825e8f9a8e7abac986363f275097f  alfred-2022.1.tar.gz
+sha256  df91152fe31fb6377a24ce93130445973510469af9377e4cc9c5f5d25e38e751  alfred-2026.0.tar.gz
 sha256  cecbf53d1148e13256ac29f8b900655b7fc8dc12d59939a95bc2323ea1747025  LICENSES/preferred/GPL-2.0
diff --git a/package/alfred/alfred.mk b/package/alfred/alfred.mk
index 9af11931c1..530c43e4a9 100644
--- a/package/alfred/alfred.mk
+++ b/package/alfred/alfred.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ALFRED_VERSION = 2022.1
+ALFRED_VERSION = 2026.0
 ALFRED_SITE = https://downloads.open-mesh.org/batman/stable/sources/alfred
 ALFRED_LICENSE = GPL-2.0
 ALFRED_LICENSE_FILES = LICENSES/preferred/GPL-2.0

base-commit: 346d6667febdbec9a3c57e47009ab21e121b5b1d
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
