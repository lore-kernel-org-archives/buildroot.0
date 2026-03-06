Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91466F51416
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 22:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B4141EE9;
	Fri,  6 Mar 2026 22:09:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Glx_eHEw99BS; Fri,  6 Mar 2026 22:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AC4B41EDE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772834940;
	bh=9DqZcGrWmf9lXq+6Sp7V+yN6Qp4dTTE6WY/RVvZ7LvM=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=W2C+VCgC6MrVoWHu8JnTeqIsBAubCPcK8yDaUnwh7wpGSMNBKbpXQvN50fGUhJHH3
	 j6Y/QsAzhHP9PxHu4HqIFqCfp0cNly3Rw4XjxupjVyI+LjqGTdWjgjX/YeukCJRKWg
	 Q7HrosgoSEVHel7nc2xmk4oXUNO+Su+RCVhxFn858dJ8450ddRNzCVuRggEGSv3ly3
	 m/TXSDbyoYeY4haLMRVoNT6D7DxQbOEWCN+/QV+90qwghCZRRjEx0/eVZT24lfVl3W
	 QMGv21RYNJmiGHeKhijCrWjT3OgbhgAlVZ4mJGz8cTMbsADnE6jrgzqZ7Ar6GUX9Tz
	 38Zve/bCso+9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AC4B41EDE;
	Fri,  6 Mar 2026 22:09:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D64E4169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C77C461014
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tIGoZH0D5Lz for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 22:08:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B940B60E0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B940B60E0E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B940B60E0E
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 22:08:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc67.dip0.t-ipconnect.de [84.161.188.103])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4A744A4C2335
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 23:08:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57924)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vydLq-000000006wX-464X
 for buildroot@buildroot.org; Fri, 06 Mar 2026 22:08:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 23:08:54 +0100
Message-ID: <20260306220854.3912618-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772834935;
 bh=6s7lOiff/+94DY6YZovHgkvGZnO0CxQJMcMzXTAXdVU=;
 h=From:To:Subject:Date:From;
 b=HSw99nvVXqdfIjdyduKlyLPoHlGyCy/jtfHYPbA5FX3N2yYkGYNDCKcALuHMKbtXj
 SC4pWAGiB3ES/xRbcnQQr8cc0C54TFlbQ6AkG95mS5hYgfgmnv5acK3Lb76+vf1A+m
 1tptz3oULJPDsT6dTnxe+LeRZLALF0X8JO2h+zpoFgoE+eNS63tTnJD1zmYBfgg992
 pwwh7UmCFTR8ISCVZTHt+gQf/RaqUkU7j3HWD/gO+1YUK3/Tr2iud7reQ8e+VDp8vG
 C2JiKWaB1fg2GxbdtOzGwFmbIG9cnlqSFe4szyoozXOFV1M5ELes5Z1Ejpy6xh70ES
 cKZO3HUuy/+vg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=HSw99nvV
Subject: [Buildroot] [PATCH 1/1] package/libnfs: fix build without libkrb5
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

Buildroot commit a035a0f99fa3bbeca776d741bbdeb6c04b3b35c8 bumped the
package to 6.0.2 which includes upstream commit
https://github.com/sahlberg/libnfs/commit/e806051f400d6f98dac08c04cff7c2219e9abf63
that adds optional support for libkrb5, enabled by default.

When building without libkrb5 we need to disable its support to avoid
a configure error:

  configure: Build with gssapi_krb5 support
  checking for gssapi/gssapi.h... no
  configure: error: You need gssapi development files to compile libsmb2.

Fixes:
https://autobuild.buildroot.net/results/166/166fb283ef8830930ce191b4418d01e6c82176f5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libnfs/libnfs.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libnfs/libnfs.mk b/package/libnfs/libnfs.mk
index 4ba6690951..12afb7c697 100644
--- a/package/libnfs/libnfs.mk
+++ b/package/libnfs/libnfs.mk
@@ -16,6 +16,13 @@ ifeq ($(BR2_PACKAGE_GNUTLS),y)
 LIBNFS_DEPENDENCIES += gnutls
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+LIBNFS_CONF_OPTS += --with-libkrb5
+LIBNFS_DEPENDENCIES += libkrb5
+else
+LIBNFS_CONF_OPTS += --without-libkrb5
+endif
+
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LIBNFS_DEPENDENCIES += libtirpc
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
