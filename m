Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE7C6C43334
	for <buildroot@archiver.kernel.org>; Mon, 27 Jun 2022 21:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89CC86077D;
	Mon, 27 Jun 2022 21:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89CC86077D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6-1ZGD1CSp-m; Mon, 27 Jun 2022 21:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF61600C9;
	Mon, 27 Jun 2022 21:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF61600C9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 001ED1BF34B
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE974019F
 for <buildroot@lists.busybox.net>; Mon, 27 Jun 2022 21:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CDE974019F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7p-1vKpt9zha for <buildroot@lists.busybox.net>;
 Mon, 27 Jun 2022 21:39:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95D1A400D8
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95D1A400D8
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 21:39:10 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id 189so5739191wmz.2
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 14:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHd74nj+7msODAruY0D3B7Z+ufo23sOoauCI09FipIg=;
 b=uktJKcL48AJLWOPKRdR6T5RPH+AS0E4tFWsLhy447vUlt5G+CN8D9xnlrLe3AMpQMA
 05l7XaX81vtz0x2VsalM6/VDxGKx5ihDff6+541HuPgHkKkEsjD+BgeOrPe/CPSJmslR
 DeWAQ8m3jnuNdNO7Bc9AqMUxprWSAIXgxiLgvic9eQtVOTYNc47j5Lv2uURGK3clv7o5
 eLmzWIP+7rIcm0z5jgrHd4Q5VbDnW0mFlZwSCzS1kzOHR8/P3brUwbee3kIRfc2nLiNG
 QoJapwd+giLziybZ6C1ovhTpclP5AJQExc62sH54TDODN2MMTxRK7rQLMn6MUtyMDkIM
 d3KQ==
X-Gm-Message-State: AJIora90zkMXVFkhCal5kIXEyu3fQj0vtqI598yACbccAyEOLj/EOHd9
 tSe2UHtAu8TcwB+d6QqpLC6cE3SBlJk=
X-Google-Smtp-Source: AGRyM1tlRP3U3oGx1iCSI8eLm4tXDbxIWKolI8vJfHrXS2KVqUXXDENUW01pkiYKiBDzKrkjHxCIKw==
X-Received: by 2002:a05:600c:1d25:b0:3a0:4cc8:f644 with SMTP id
 l37-20020a05600c1d2500b003a04cc8f644mr5426557wms.121.1656365948524; 
 Mon, 27 Jun 2022 14:39:08 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 11-20020a05600c268b00b003a03a8475bfsm14283662wmt.16.2022.06.27.14.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 14:39:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Jun 2022 23:36:12 +0200
Message-Id: <20220627213612.2104825-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHd74nj+7msODAruY0D3B7Z+ufo23sOoauCI09FipIg=;
 b=H564c1vIUTJ9vRyDgsY0PDTMgMu6oMBr2d7kj7raDRc9wd+57ysDrGEdEIbVl7R3fp
 CVHAii8YT70yEpzdfOLEmbPJs8pPO/E3jf+BZZjvBO/VR1yekX4hWaPgycKsWCAtdGAi
 zXjKv3qgbSFF04HiSzEhiMrOVPtZxKTDHhxizttHNer7sfN/p86pX4Qmu803+llqYqve
 LM6LtTBfdJaSDpxl66hMf4C2bT3r9V+xv8g8dqr/fMVEGEl+4opVCWC7WoLHBgex8BX1
 IGZguc3ShFu3Rs11DDjcu2vqXynoTiee9RnNySFVdeSPIsUBf+bdLJnl25qPLZ+XIFTf
 mZZw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=H564c1vI
Subject: [Buildroot] [PATCH 1/1] package/multipath-tools: bump to version
 0.9.0
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
Cc: Alexander Egorenkov <egorenar-dev@posteo.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Renumber patch
- Update hash of README.md (changes not related to license)
- FPIN support is fixed by setting LINUX_HEADERS_INCDIR and
  https://github.com/opensvc/multipath-tools/commit/63aa47d0327de2beacf86f6a8e2fd7575d62dadf
  FPIN support is (wrongly) enabled if ELS_DTAG_LNK_INTEGRITY is defined
  in /usr/include/scsi/fc/fc_els.h since bump to version 0.8.9 in commit
  b790ff27d5461df4de22732611a1eb4beee68f91 and
  https://github.com/opensvc/multipath-tools/commit/cfff03efbca753ef485ad717087464dced9c721a
  resulting in the following build failure:

  In file included from /nvmedata/autobuild/instance-7/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/include/scsi/scsi_netlink_fc.h:25,
                   from fpin_handlers.c:6:
  /nvmedata/autobuild/instance-7/output-1/host/nios2-buildroot-linux-gnu/sysroot/usr/include/scsi/scsi_netlink.h:44:2: error: unknown type name 'uint8_t'
     44 |  uint8_t version;
        |  ^~~~~~~

https://github.com/opensvc/multipath-tools/compare/0.8.9...0.9.0

Fixes:
 - http://autobuild.buildroot.org/results/32f4ada6c49261924ca78f62dee43241bda379a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...akefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch} | 0
 package/multipath-tools/multipath-tools.hash                  | 4 ++--
 package/multipath-tools/multipath-tools.mk                    | 3 ++-
 3 files changed, 4 insertions(+), 3 deletions(-)
 rename package/multipath-tools/{0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch => 0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch} (100%)

diff --git a/package/multipath-tools/0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch b/package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
similarity index 100%
rename from package/multipath-tools/0002-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
rename to package/multipath-tools/0001-Makefile.inc-Enable-systemd-if-ENABLE_SYSTEMD-is-def.patch
diff --git a/package/multipath-tools/multipath-tools.hash b/package/multipath-tools/multipath-tools.hash
index 58d8de369c..df0d24fb74 100644
--- a/package/multipath-tools/multipath-tools.hash
+++ b/package/multipath-tools/multipath-tools.hash
@@ -1,7 +1,7 @@
 # Locally computed:
-sha256  27a426facea0474e6dc48e026a94f7c86890d3f27b439b07ec26b0b9887b0cc4  multipath-tools-0.8.9.tar.gz
+sha256  d6d1d819a53d076a91828ede42d9786451a471c4b71ca3fd25d04ad5413e3f95  multipath-tools-0.9.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSES/GPL-3.0
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  LICENSES/LGPL-2.0
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1
-sha256  a3777a6b4433a23246eed8a88ca8466e3d21a2f758c03d060201fe2c44ff5484  README.md
+sha256  fb0a5d2008c609fec129d2ffd01dd7f65f0e3868bcf465b6fda76e25ff896ce9  README.md
diff --git a/package/multipath-tools/multipath-tools.mk b/package/multipath-tools/multipath-tools.mk
index c0b7c5721e..f3ce3ca8b8 100644
--- a/package/multipath-tools/multipath-tools.mk
+++ b/package/multipath-tools/multipath-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MULTIPATH_TOOLS_VERSION = 0.8.9
+MULTIPATH_TOOLS_VERSION = 0.9.0
 MULTIPATH_TOOLS_SITE = $(call github,opensvc,multipath-tools,$(MULTIPATH_TOOLS_VERSION))
 
 MULTIPATH_TOOLS_LICENSE = \
@@ -21,6 +21,7 @@ MULTIPATH_TOOLS_LICENSE_FILES = \
 
 MULTIPATH_TOOLS_DEPENDENCIES = lvm2 json-c readline udev liburcu libaio host-pkgconf
 MULTIPATH_TOOLS_MAKE_OPTS = \
+	LINUX_HEADERS_INCDIR=$(STAGING_DIR)/usr/include \
 	LIB="lib" \
 	RUN="run" \
 	OPTFLAGS="" \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
