Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C2DCF64B1
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 12:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B18EE821C9;
	Sat, 22 Nov 2025 12:41:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BvN4QjnymD4s; Sat, 22 Nov 2025 12:41:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDB0B821CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDB0B821CA;
	Sat, 22 Nov 2025 12:41:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F202A158
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7EF540416
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6MFNCTvFSJ2d for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 12:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DBCC94031C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCC94031C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBCC94031C
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 12:41:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b63c.dip0.t-ipconnect.de [84.161.182.60])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 02BFAA4C748D;
 Sat, 22 Nov 2025 13:41:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51100)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vMmw3-000000006Ep-1mfa;
 Sat, 22 Nov 2025 12:41:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 22 Nov 2025 13:41:51 +0100
Message-ID: <20251122124151.2224145-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1763815312;
 bh=FI8h6SEfxXNXpJt0sJk5OKMmO/EYZjy1avXI2k3fCck=;
 h=From:To:Cc:Subject:Date:From;
 b=VB9Q+jySp6UEsB8G6/8SPjQh+hPV1Fujp6j54fwF4DXJvOxWW1VPH0lwbCEjhQXWE
 KlCtU79S6lDoFbu8J5HWILiOFh2VImW8OeR+f7YaR58EztatRO0hcCp49/FTTLBx8S
 Vs7v0HsKIipJVQKpZSrin4SIBWoiOYOWbC3vzRpSy0bv3CQnytpcp8Rq2PAJJJn3Iu
 BphZdHT/mDQNYQKhwSKSo6ctplM8c3QApkqwiTXUqmt3DV7E3sQI7nAaZ7MQDDpGdg
 ezv2tTYPackPzYy/o6ed5Fqryux3jAvI04u/RY8cqQ7vC3Be8YIQWIWJJtHQEEJ3ux
 wofbbWuN4liGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=VB9Q+jyS
Subject: [Buildroot] [PATCH 1/1] package/fio: link with -latomic if needed
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

Upstream commit http://git.kernel.dk/cgit/fio/commit/?h=fio-3.41&id=a9ba7cef70a7fc99d406addbdc6479f633d01ec7
which was first included in version 3.41 and bumped in buildroot with
commit 215133c0fc2819f059fbb35071ab2e0987f5107d added use of atomic
functions causing build errors which are fixed by linking to libatomic.

Fixes:
https://autobuild.buildroot.net/results/c74/c74529b5a3800af269b6819af3cc742ba348d5fe/
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/fio/fio.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index cb456587b0..38e7aa7967 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -11,6 +11,11 @@ FIO_LICENSE_FILES = COPYING MORAL-LICENSE
 
 FIO_OPTS = --disable-native --cc="$(TARGET_CC)" --extra-cflags="$(TARGET_CFLAGS)"
 
+# Uses __atomic_load_8
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+FIO_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBAIO),y)
 FIO_DEPENDENCIES += libaio
 endif
@@ -36,7 +41,7 @@ FIO_DEPENDENCIES += zlib
 endif
 
 define FIO_CONFIGURE_CMDS
-	(cd $(@D); $(TARGET_MAKE_ENV) ./configure $(FIO_OPTS))
+	(cd $(@D); $(TARGET_MAKE_ENV) $(FIO_CONF_ENV) ./configure $(FIO_OPTS))
 endef
 
 define FIO_BUILD_CMDS
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
