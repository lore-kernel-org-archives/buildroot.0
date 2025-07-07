Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608D9C83F0C
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 13:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C195A613FE;
	Mon,  7 Jul 2025 13:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X_a6LQXhFnKF; Mon,  7 Jul 2025 13:02:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D512160B52
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D512160B52;
	Mon,  7 Jul 2025 13:02:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5679B1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B8F60B52
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeKpP44lfCjd for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 13:02:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2C91560A52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C91560A52
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C91560A52
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 13:02:55 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60c01f70092so4905437a12.3
 for <buildroot@buildroot.org>; Mon, 07 Jul 2025 06:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751893372; x=1752498172;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iDYVAmdmvCgnDcf71b5aDXMgxbRIsYnrtf57Znf9MRI=;
 b=BXizaE+qqPW0qI/7P7pK+gL2hWemKhmQc+jaN4Wev3Hy0606NzdUi8EQpsCGGFmiJb
 pHh7n/UkAkg4pXA+Cng7xheVYa4DX5khr3tHesjVogXM9R3RdWhj8tDg/bdUwG5l5y+u
 jKeCLqH4kPgWzBDEb0PEpbNGEA9UMDIVWutdzde9I193JGpTC8j/BMrp71nKnWTvUYK5
 1gu/CjXuCCD5Fy8spQgh7WiLWxq+R2Bw2gDZXoOJ/7QLHVY2RThpH7B1j48PnvD1lTNN
 KDOPZ8qUelbBaY1W9O+wUFRxnX6jRyI7ju+5w0NdV28lLY/hRVy4MCK3B6ojcQfAqrVm
 pE5g==
X-Gm-Message-State: AOJu0YzOw67kwAzdyRoy5Z23jUNBf76EtgMWHZW1Dr2DxNY2a4JbUyEi
 NsPyJ12o/ZevgZtuQ0iCUVmUQsVzLWfoOgX0zksAmzHJ5ZSP1b5P5/etvltwyw==
X-Gm-Gg: ASbGncu3/qIWyYz+brGLcTa7OajLjQEUEVRWKx+nWeqwqm1w20Y1HQLjBZMn5ZR3Acd
 Uy8JQxAscNkpwJSZaiO1KP/cweBlNxNT5QXAwh91W1vBe1NbwtK1G/yMcBBNtW1ISs6KgTS5dWb
 H/1/bGkQKPSHoehU3Opx320ByD8wCkOZOIMO+rT967DI1J1NJ7FjkqKB+4ewrClvBpPaGO2f4bI
 ltwWeR/uNvR2W9kua9A8df5LPZRYMClG837Kwn97sLOvd5h78Lp44w8tX57bZ41Pjro/CD1pT5R
 3Uc+cHufNJW9joM87OShUQ31TXDVImlfP2MzIml5UF+dSKnlS4dcqSACCHWU5Favwcwb3bu599f
 poxKRU1zLHVUhRVC87PERlgUiCryWGrFRBXNYtakR9Ec=
X-Google-Smtp-Source: AGHT+IF2e4alwo+2Thu1P2hpE0R5bta18IZn7+y15JwIvr4xHLjIV7o34GNA3CzVeP1D2hKGSEb/bQ==
X-Received: by 2002:a17:907:3d92:b0:ae3:bd96:78cd with SMTP id
 a640c23a62f3a-ae41079de60mr919297566b.7.1751893371927; 
 Mon, 07 Jul 2025 06:02:51 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae3f6b05292sm694802766b.122.2025.07.07.06.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 06:02:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  7 Jul 2025 15:02:43 +0200
Message-Id: <20250707130243.4179971-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1751893372; x=1752498172; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iDYVAmdmvCgnDcf71b5aDXMgxbRIsYnrtf57Znf9MRI=;
 b=GvHwaTUHGoTwn01gMvKV30Kf18VjMExiMwsM177MECu+K/JruTKdUrf+ZI1XPnS1qC
 h4ezVqaVHj8NZIrx13ys7wubhApxhlYoRggQWdJQEDVRYGcCzA2Z8EwUJMyBoLwFhqQ/
 CR4qBBnf7Ety7S1kw5bRMtw48yyO1kmFS5t5xU/dOZnxSsQgRbpLugeEV9OsMRPZHAYu
 O/QBQW5sZhjPUanOWdnn9peAn6AAR6urJ4M0fKNCHRjmhUUzS7u2hEDKH7ApjHtRupzP
 aAOQisEtibWGfV4w/g80fxivpoOwGeRRCAo1uiO6UDKyU9vJbg28tHpto1ivIf90Mp6I
 HZxw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GvHwaTUH
Subject: [Buildroot] [PATCH] package/socketcand: bump to version
 0.4.2-122-g6dd5d33d4645ab221e8cd265c08607366e21ddf1
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, ju.o@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Switch to meson build system.

Remove an upstreamed patch.

The license files are now gathered in the LICENSES folder.

Add support for the libsocketcan library.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .checkpackageignore                           |   1 -
 .../0001-Fix-GCC10-build-failure.patch        | 113 ------------------
 package/socketcand/socketcand.hash            |   5 +-
 package/socketcand/socketcand.mk              |  17 ++-
 4 files changed, 15 insertions(+), 121 deletions(-)
 delete mode 100644 package/socketcand/0001-Fix-GCC10-build-failure.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 06fca7f364..687814076e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1083,7 +1083,6 @@ package/snort/0005-fix-sparc.patch lib_patch.Upstream
 package/snort/0006-Fix-compile-error-when-building-against-uclibc-or-mu.patch lib_patch.Upstream
 package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch lib_patch.Upstream
 package/snort/0008-Fix-NO-OPTIMIZE.patch lib_patch.Upstream
-package/socketcand/0001-Fix-GCC10-build-failure.patch lib_patch.Upstream
 package/softether/0001-Create-autotools-plumbing-for-SoftEther.patch lib_patch.Upstream
 package/softether/0002-Create-libsoftether.so-and-dynamically-link.patch lib_patch.Upstream
 package/softether/0003-use-fhs-install-directories.patch lib_patch.Upstream
diff --git a/package/socketcand/0001-Fix-GCC10-build-failure.patch b/package/socketcand/0001-Fix-GCC10-build-failure.patch
deleted file mode 100644
index 057cd40657..0000000000
--- a/package/socketcand/0001-Fix-GCC10-build-failure.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From ae0af080058a576d62c72ffc011d644d0b4dcb98 Mon Sep 17 00:00:00 2001
-From: Yegor Yefremov <yegorslists@googlemail.com>
-Date: Tue, 7 Jul 2020 19:39:41 +0200
-Subject: [PATCH] Fix GCC10 build failure (#17)
-
-GCC10 breaks on multiple definitions:
-
-ld: /tmp/ccFiGYO7.o:(.bss+0x114): multiple definition of `tv'; /tmp/cc7f6J5h.o:(.bss+0x80): first defined here
-
-Change the scope of the related variables.
-
-Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
-
-[Retrieved from:
-https://github.com/linux-can/socketcand/commit/ae0af080058a576d62c72ffc011d644d0b4dcb98]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- socketcand.c  | 3 ++-
- state_bcm.c   | 4 ++--
- state_isotp.c | 2 +-
- state_raw.c   | 2 +-
- 4 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/socketcand.c b/socketcand.c
-index 8d84754..6125be9 100644
---- a/socketcand.c
-+++ b/socketcand.c
-@@ -102,7 +102,6 @@ socklen_t unaddrlen;
- struct sockaddr_un remote_unaddr;
- socklen_t remote_unaddrlen;
- char* interface_string;
--struct ifreq ifr, ifr_brd;
- 
- int state_changed(char *buf, int current_state)
- {
-@@ -666,6 +665,8 @@ int receive_command(int socket, char *buffer) {
- }
- 
- void determine_adress() {
-+	struct ifreq ifr, ifr_brd;
-+
- 	int probe_socket = socket(AF_INET, SOCK_DGRAM, 0);
- 
- 	if(probe_socket < 0) {
-diff --git a/state_bcm.c b/state_bcm.c
-index cfaa8ed..05a5f7c 100644
---- a/state_bcm.c
-+++ b/state_bcm.c
-@@ -28,8 +28,6 @@
- #define RXLEN 128
- 
- int sc = -1;
--fd_set readfds;
--struct timeval tv;
- 
- void state_bcm() {
- 	int i, j, ret;
-@@ -38,6 +36,7 @@ void state_bcm() {
- 	struct ifreq ifr;
- 	char rxmsg[RXLEN];
- 	char buf[MAXLEN];
-+	fd_set readfds;
- 
- 	struct {
- 		struct bcm_msg_head msg_head;
-@@ -91,6 +90,7 @@ void state_bcm() {
- 	}
- 
- 	if (FD_ISSET(sc, &readfds)) {
-+		struct timeval tv;
- 
- 		ret = recvfrom(sc, &msg, sizeof(msg), 0,
- 			       (struct sockaddr*)&caddr, &caddrlen);
-diff --git a/state_isotp.c b/state_isotp.c
-index 5c671f9..e1b944b 100644
---- a/state_isotp.c
-+++ b/state_isotp.c
-@@ -25,7 +25,6 @@
- #include <linux/sockios.h>
- 
- int si = -1;
--fd_set readfds;
- 
- void state_isotp() {
- 	int i, items, ret;
-@@ -39,6 +38,7 @@ void state_isotp() {
- 	char buf[MAXLEN]; /* inet commands to can */
- 	unsigned char isobuf[ISOTPLEN+1]; /* binary buffer for isotp socket */
- 	unsigned char tmp;
-+	fd_set readfds;
- 	
- 	while(previous_state != STATE_ISOTP) {
- 
-diff --git a/state_raw.c b/state_raw.c
-index e83e6ec..2c49975 100644
---- a/state_raw.c
-+++ b/state_raw.c
-@@ -25,7 +25,6 @@
- int raw_socket;
- struct ifreq ifr;
- struct sockaddr_can addr;
--fd_set readfds;
- struct msghdr msg;
- struct can_frame frame;
- struct iovec iov;
-@@ -36,6 +35,7 @@ struct cmsghdr *cmsg;
- void state_raw() {
- 	char buf[MAXLEN];
- 	int i, ret, items;
-+	fd_set readfds;
- 
- 	if(previous_state != STATE_RAW) {
- 
diff --git a/package/socketcand/socketcand.hash b/package/socketcand/socketcand.hash
index 713939897d..5879fcbce5 100644
--- a/package/socketcand/socketcand.hash
+++ b/package/socketcand/socketcand.hash
@@ -1,3 +1,4 @@
 # Locally computed
-sha256  3c5cc7af4ff707ac344e62d2e37a74b59aeccd14b88e837cc142c52b69d64a39  socketcand-69e2201222f015a1abe7a58ecf61325012cd91b1.tar.gz
-sha256  18bda0db4e3c56cefdb1b9b01b7eada7764c0746f6321378c30d78f5ee81cfee  socketcand.c
+sha256  f19e600e99e13202a4039158c1d7dce55645271f14028d60e231266337627ecd  socketcand-6dd5d33d4645ab221e8cd265c08607366e21ddf1.tar.gz
+sha256  c3dc748f5e725cf5ed89784fe78e4ff1b05d309bf1e7ade4c572e8fde1b8406c  LICENSES/BSD-3-Clause
+sha256  995a31f60a9ddb4c609214cc7d17ca94cc3cbc7f37e1e64dba81e7f8ea9d4f91  LICENSES/GPL-2.0-only.txt
diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 1755d3ae56..50d3c83ab5 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,16 +4,23 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = 69e2201222f015a1abe7a58ecf61325012cd91b1
+SOCKETCAND_VERSION = 6dd5d33d4645ab221e8cd265c08607366e21ddf1
 SOCKETCAND_SITE = $(call github,linux-can,socketcand,$(SOCKETCAND_VERSION))
-SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_LICENSE = BSD-3-Clause or GPL-2.0
-SOCKETCAND_LICENSE_FILES = socketcand.c
+SOCKETCAND_LICENSE_FILES = LICENSES/BSD-3-Clause LICENSES/GPL-2.0-only.txt
 
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SOCKETCAND_DEPENDENCIES += libconfig
+SOCKETCAND_CONF_OPTS += -Dlibconfig=true
 else
-SOCKETCAND_CONF_OPTS += --without-config
+SOCKETCAND_CONF_OPTS += -Dlibconfig=false
 endif
 
-$(eval $(autotools-package))
+ifeq ($(BR2_PACKAGE_LIBSOCKETCAN),y)
+SOCKETCAND_DEPENDENCIES += libsocketcan
+SOCKETCAND_CONF_OPTS += -Dlibsocketcan=true
+else
+SOCKETCAND_CONF_OPTS += -Dlibsocketcan=false
+endif
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
