Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D0AD715EE
	for <buildroot@archiver.kernel.org>; Sat, 24 Jan 2026 15:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DAF1382207;
	Sat, 24 Jan 2026 15:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_4e6_CLo_50; Sat, 24 Jan 2026 15:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24CF0821B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769267150;
	bh=4uuqNPwhvmbffAMlmmoDswlyjUpecoy7NhzzEvbUlDc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VHle56G5ytVkiA2u9lFmWLS6FE6yE502Zzg+CfdaGQS++u5/fX2UzDetCDssDfmt8
	 i5FGkLDgZq0X0EfNcyR76gpciYKjVacTRmR9zSd2cKYmOJPaddtRZ5sfN4i9tgqzp5
	 q8+Sz1bQ/XXoa2DLSJRR9PtoAtZm2P5bTp5Rn74LBZVzZSFh7oYf6NXFdvsLZbze9Z
	 j0vemxgSsxd9LqxnHRqRnjQ7VpqrShenepGzurE5N0l4crsp0dI1G6TsISPr6EKwNB
	 oyCwT5OIFvsR2VBZl5q4vGtOxNrudnmQ+DvuKQDIjtwhIfyq9PvX/K5ZJ9UAJRCnly
	 JBC5/7xImj9Hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24CF0821B9;
	Sat, 24 Jan 2026 15:05:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 83081358
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70E0760A6B
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6REFrLas8VK8 for <buildroot@buildroot.org>;
 Sat, 24 Jan 2026 15:05:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 82E6D60A60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82E6D60A60
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 82E6D60A60
 for <buildroot@buildroot.org>; Sat, 24 Jan 2026 15:05:46 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -777069069; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 24 Jan 2026 15:05:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peko@dell.be.48ers.dk>) id 1vjfCn-000000018Tt-2ed1;
 Sat, 24 Jan 2026 16:05:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 24 Jan 2026 16:05:39 +0100
Message-ID: <20260124150540.270915-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=t0x9c1svg0L0V9ZuB0FUEo1QJ2KiJyIpBpaSEgG1fvS9jAOpB6vhTuEWErXRXZ7Df/zt7xY6YAi9Qg9hHyiIvtx+Ghr5wAl2I9YDQF51xcWD9CaHXT0q2r+6tXX5YKVziCZ3nfhbhu3NQamnbYMus8fkB6BLgeymaT3tw1Tf7cQDzmIO8h6yhzM09ftUkzfbaJEFEENGQVMvbqlAFB4ugkuRsn+dS2dNZrgUN7FsK3aPcIcQRObldWpew5noopMMwvnE+ajIkvhW1r2nFvH40L5FZ7W0bZJR2BWfrwQMatlB3ZsZHbzDfzBfslVBdE/o1r5fKmeRIyFBjoS4QRnUSA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=Ksymy5jDOiJQ0kcPa2xIIWL1Z26N22bUH9gaY/KP4pc=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=t0x9c1sv
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/swig: add host-swig wrapper script
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

Swig has a compiled in absolute path to its data files, which can be
overridden using the SWIG_LIB environment variable:

https://github.com/swig/swig/blob/v4.1.1/Source/Modules/main.cxx#L931-L945

This unfortunately means that host-swig misbehaves when used in the SDK, as
this points to the ${HOST_DIR}/bin of the build, which may not be available
when the SDK is used.

The issue was reported upstream but rejected in
https://github.com/swig/swig/issues/253, so instead add a wrapper script
which calculates a sensible SWIG_LIB relative to the wrapper location unless
SWIG_LIB is set, similar to how we do it for E.G. gcc or pkgconf.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swig/swig-wrapper.in |  8 ++++++++
 package/swig/swig.mk         | 15 +++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 package/swig/swig-wrapper.in

diff --git a/package/swig/swig-wrapper.in b/package/swig/swig-wrapper.in
new file mode 100644
index 0000000000..68be44231f
--- /dev/null
+++ b/package/swig/swig-wrapper.in
@@ -0,0 +1,8 @@
+#!/bin/sh
+# wrapper to make swig relocatable
+
+if [ -z "${SWIG_LIB}" ]; then
+    export SWIG_LIB=${0%/*}/../share/swig/@SWIG_VERSION@
+fi
+
+exec "${0}.br_real" "$@"
diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index ad585c3f97..71e5e05f96 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -15,6 +15,21 @@ HOST_SWIG_CONF_OPTS = \
 SWIG_LICENSE = GPL-3.0+, BSD-2-Clause, BSD-3-Clause
 SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 
+# Swig has a compiled in absolute path to its data files, so it does
+# not work when copied somewhere else for the SDK. Issue was reported
+# upstream but rejected in https://github.com/swig/swig/issues/253 so
+# instead add a wrapper to work around this
+
+define HOST_SWIG_INSTALL_WRAPPER
+	mv -f $(HOST_DIR)/bin/swig $(HOST_DIR)/bin/swig.br_real
+	$(INSTALL) -m 0755 -D package/swig/swig-wrapper.in \
+		$(HOST_DIR)/bin/swig
+	$(SED) 's,@SWIG_VERSION@,$(SWIG_VERSION),g' \
+		$(HOST_DIR)/bin/swig
+endef
+
+HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
+
 # CMake looks first at swig3.0, then swig2.0 and then swig. However,
 # when doing the search, it will look into the PATH for swig2.0 first,
 # and then for swig.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
