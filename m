Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA53E7719D
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 22:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6244E80FC1;
	Wed,  8 Jan 2025 22:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ybqH3rl2uuBh; Wed,  8 Jan 2025 22:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E9B281025
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E9B281025;
	Wed,  8 Jan 2025 22:43:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4087E1FF9
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2DA0D60596
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1elDfWg2ZQZ for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 22:43:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C142E605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C142E605C3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C142E605C3
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 22:43:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id C13F21BF206;
 Wed,  8 Jan 2025 22:43:22 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed,  8 Jan 2025 23:43:15 +0100
Message-ID: <20250108224320.2241826-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108224320.2241826-1-thomas.petazzoni@bootlin.com>
References: <20250108224320.2241826-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736376203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cNZrjs15ymCb2Srj7m4bEl5X0GQk/pT+lEP/AFqqbWo=;
 b=kcor00wb71ga0DtHJE2SAHIPkgJcZXVoM1XjweRRmKY2vH1Rc7r/4KTaqOsTCvdckNqCn5
 3MqZ+efG0RE+I2+byswnSJqIWFPtHbBMg3onEAxw1c74/HYtDvAva+9TrxswnFLKYtJold
 uMwIkzhwhX9vN4FMiCoguMpbOXafRmDOyNBRMOBkZctskzKyG5sQalEuyKGQDpJ0LUy0Y7
 67cql9o2LcBamhmo32V7WADe8SPAVZytIwA86bhttxidj28JPCE13fb/CmRRDZk2DQAaMK
 JQngARX9ZbnGjvByL1p1tZ5Em26328CODbzNkLnCC3XLxdtVagZWJU9SMXi9dQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kcor00wb
Subject: [Buildroot] [PATCH 2/4] package/dracut: use host-cross-ldd instead
 of host-prelink-cross
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
Cc: Thierry Bultel <tbultel@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit reworks the dracut package to use the cross-ldd installed
by host-cross-ldd instead of prelink-rtld installed by
host-prelink-cross.

Indeed, prelink-cross is not maintained upstream, and its dependency
on host-libiberty causes problems in Buildroot with other packages.

The only change needed is that the dracut_wrapper script needs to be
generated, as we now need to know the prefix of the cross-compilation
tool (TARGET_CROSS).

Tested by running the dracut tests of the test suite.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dracut/dracut.mk                             | 8 +++++---
 package/dracut/{dracut_wrapper => dracut_wrapper.in} | 2 +-
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename package/dracut/{dracut_wrapper => dracut_wrapper.in} (94%)

diff --git a/package/dracut/dracut.mk b/package/dracut/dracut.mk
index 8573e64055..cb6044415e 100644
--- a/package/dracut/dracut.mk
+++ b/package/dracut/dracut.mk
@@ -10,12 +10,14 @@ DRACUT_LICENSE = GPL-2.0
 DRACUT_LICENSE_FILES = COPYING
 DRACUT_CPE_ID_VALID = YES
 
-HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-prelink-cross
+HOST_DRACUT_DEPENDENCIES = host-pkgconf host-kmod host-cross-ldd
 
 define HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 	mv $(HOST_DIR)/bin/dracut $(HOST_DIR)/bin/dracut.real
-	install -D -m 0755 $(HOST_DRACUT_PKGDIR)/dracut_wrapper \
-		$(HOST_DIR)/bin/dracut
+	sed -e "s%@@TARGET_CROSS@@%$(TARGET_CROSS)%" \
+		$(HOST_DRACUT_PKGDIR)/dracut_wrapper.in > \
+		$(@D)/dracut_wrapper
+	install -D -m 0755 $(@D)/dracut_wrapper $(HOST_DIR)/bin/dracut
 endef
 HOST_DRACUT_POST_INSTALL_HOOKS += HOST_DRACUT_POST_INSTALL_WRAPPER_SCRIPT
 
diff --git a/package/dracut/dracut_wrapper b/package/dracut/dracut_wrapper.in
similarity index 94%
rename from package/dracut/dracut_wrapper
rename to package/dracut/dracut_wrapper.in
index 968d65cbeb..33012853d5 100644
--- a/package/dracut/dracut_wrapper
+++ b/package/dracut/dracut_wrapper.in
@@ -34,7 +34,7 @@ topdir="$(dirname "$(realpath "$(dirname "${0}")")")"
 DRACUT_LDD="$(mktemp /tmp/dracut-ldd.XXXXXX)"
 cat >"${DRACUT_LDD}" <<EOL
 #!/bin/bash
-${topdir}/sbin/prelink-rtld --root='${sysroot}' \${1}
+@@TARGET_CROSS@@xldd --root='${sysroot}' \${1}
 EOL
 chmod +x "${DRACUT_LDD}"
 export DRACUT_LDD
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
