Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F432CD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 17:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65134148C;
	Thu, 30 Apr 2026 17:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yt3M8oennIRV; Thu, 30 Apr 2026 17:46:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16B9841489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777571194;
	bh=hc4BHO6Nr0OyRsIzq+UeHcf/io7luR7+FayNSlmzDeA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KhXGLrhMVJGThHfM1hIGHFmgGaPYpKLbRRT7jusEKBwlPXgFAItw2AqP8W6I/ac25
	 rDEm+74VQt/g+beGFOSVEIGBIUtXw2ZJb4R4rxLWywnJ6PdrnelU44mf9WlwNNmlUd
	 bsAFavIYdYWgapk420Ffdwv+V4iNZYsN6DIkKRRXCmyd+wCqI8k8TM8jyoqU17jb4r
	 WWnPy1HFFq6J2EiOOEkCGgqi02Cs/S+qp2pBKEYf+modhih2h/3MOiEt4fPXyy6mKH
	 h1xsiTM/dWGenvzibz12BSmRTSo7WoHVyx3ieoN/gtaYS1krh6r2HU8/aYPIaB+NWH
	 xhfv0G1DdoyEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16B9841489;
	Thu, 30 Apr 2026 17:46:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D99118F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 17:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4320940566
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 17:46:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3PxgWp6X8XJZ for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 17:46:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 388E140537
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 388E140537
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 388E140537
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 17:46:30 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488d2079582so12937815e9.2
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 10:46:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777571189; x=1778175989;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eCsca1cnZaoIEKVVjt1NuRAAKVn+L2iZgHLCmrdVPK4=;
 b=BAyEF3AQkFDt75ek8D00xlWGZYzP+RzBSI0FRgtTwACRk2O6xxB6j1oJUl/vsrCl/l
 7wUuDCT0B1N21PWu4Ah2qpgJHEzboQHt7wVdTguzAn/tG5pRFunj/zGdqU+L309eWzgT
 A4tV719RN52gBj/blNdQwnO9D6BE8WwshSuHxMdmm3LlljW+Kx2ggGjLkihGyKJeWr1p
 XNhMDmbgkzvQRHD8Tm7F8+lfAzfh6HXmrCWoBeFBe7fFN3qYmvqNjoROXSrWdLWDcNW+
 6gRzfDahQ0eaXs3gVy0MaXvCNbZFz56xReFcNmitqy3qRCRw7lsi8nAIArPSDCik/D6Q
 Ef9A==
X-Gm-Message-State: AOJu0Yxadsn9i2MmPcoA93TDNhfwuFfRSMrmluYF9wzlsSkksBB+L/6I
 9pH0Tcl9/YCIzZZ2fHQbRw2LkPZWN9x4Ud6cY9+lFsLZTSArhXkpswyZbPWVcOYCeCnykpBSpUz
 zqPHT
X-Gm-Gg: AeBDiesRLspUwudwPfzj92ETw8K7YO63U6YhTohuvVaLODtfMspY4yfADuAZn/t0ef4
 W9uQ9JTTGOitqu+DGFKr5ENYCAqqAKI8DbCHHx7iuWT92l81/mcIT21EMRLJN1jmEJr9mLLWeC1
 Ba54qsST+I+x08eJRVrLvlN+Dhl3uwn9QyzWkeecGBvMypNGlLFScFyXNk7BChTFuo9KDaIFwq8
 x56GVbIeBJ6JeE/Dw43XHyOXYQX0zEMVLGD9kgX2pUxSwGL6Y3b5m8xaLm7KbQJGU/6kBfE45Rq
 JhEn3b5aoxEwBu/ot5f6Kci6UBvnTLeYOMusWz1IXZ++ndjPiA3IUbtBBAIAV4xc5gAIXpHV2aU
 ak1ZIEupg9Xnn0/8hufCUGCgfzeGhswtaSGn8jxnCI/oxKFLiUE88Eqy6ttkY0Gb98UR6C5nrJY
 wl5zC/s5VrX4kObNkpHDkqtLZHHPb7/uZMDpQATFlea3T80Y70p6h+TTbIf7eD8kHMjIXQ+k1xv
 emyMmGVsoQvVmahXDUCZ1j8tRgKV4oLDHSy4ScoAGFAWV9HRgh6oLRlGiTYTno/BgvEWYwyp1m/
 0z+yKb8VVKgtD8o3/tITAQeQ6ubDuBxzDzU=
X-Received: by 2002:a05:600c:859a:b0:48a:72ab:f88c with SMTP id
 5b1f17b1804b1-48a84445945mr47928065e9.17.1777571188215; 
 Thu, 30 Apr 2026 10:46:28 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-82-56-22-134.retail.telecomitalia.it. [82.56.22.134])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a822c85a0sm76282415e9.12.2026.04.30.10.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2026 10:46:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Date: Thu, 30 Apr 2026 19:46:19 +0200
Message-ID: <20260430174619.868510-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1777571189; x=1778175989;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eCsca1cnZaoIEKVVjt1NuRAAKVn+L2iZgHLCmrdVPK4=;
 b=e6aiuDbJvs5KtZSz9a4b5I7w+cBMan6d0tiDuhUsJQXzcMRrlT3mfreU4Qf6y9sOZG
 cDxygttQHaLN6540IgEuCAxEG7zNo+PDLw88BbaLdXaRNND6zFKuQ26Ro6VPjAqkfklz
 Vnqs+Z1YwIAg120muh/E+kg6IJPB5wzLcmmUI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=e6aiuDbJ
Subject: [Buildroot] [PATCH 1/1] package/libfwumdata: new package
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

This library provides an interface to parse, validate (CRC32), and
manipulate FWU metadata. It provides a minimal API to allow any
userspace applications, such as SWUpdate or RAUC, to modify the boot
bank selection.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/libfwumdata/Config.in        |  9 +++++++++
 package/libfwumdata/libfwumdata.hash |  5 +++++
 package/libfwumdata/libfwumdata.mk   | 16 ++++++++++++++++
 5 files changed, 32 insertions(+)
 create mode 100644 package/libfwumdata/Config.in
 create mode 100644 package/libfwumdata/libfwumdata.hash
 create mode 100644 package/libfwumdata/libfwumdata.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1270365ef0e1..41aa63b6d790 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -814,6 +814,7 @@ F:	package/empty/
 F:	package/iana-assignments/
 F:	package/inih/
 F:	package/less/
+F:	package/libfwumdata/
 F:	package/libgphoto2/
 F:	package/pocketpy/
 F:	package/sscep/
diff --git a/package/Config.in b/package/Config.in
index 9cae377fb51c..22cc7df617fa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -527,6 +527,7 @@ endmenu
 	source "package/kbd/Config.in"
 	source "package/lcdproc/Config.in"
 	source "package/ledmon/Config.in"
+	source "package/libfwumdata/Config.in"
 	source "package/libiec61850/Config.in"
 	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
diff --git a/package/libfwumdata/Config.in b/package/libfwumdata/Config.in
new file mode 100644
index 000000000000..a61cfe8f4d70
--- /dev/null
+++ b/package/libfwumdata/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LIBFWUMDATA
+	bool "libfwumdata"
+	select BR2_PACKAGE_ZLIB
+	help
+	  Library to access Firmware Update (FWU) metadata.
+	  Provides a minimal API to allow any userspace applications,
+	  such as SWUpdate or RAUC, to modify the boot bank selection.
+
+	  https://github.com/passgat/libfwumdata
diff --git a/package/libfwumdata/libfwumdata.hash b/package/libfwumdata/libfwumdata.hash
new file mode 100644
index 000000000000..b53b9d288c47
--- /dev/null
+++ b/package/libfwumdata/libfwumdata.hash
@@ -0,0 +1,5 @@
+# Locally calculated:
+sha256  39f7fa826650cd7f68b0fd63da99d9baffffa27d3b366c496b39526e1f62b511  libfwumdata-0.1.0.tar.gz
+# License files, locally calculated:
+sha256  0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192  LICENSES/CC0-1.0.txt
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSES/LGPL-2.1-or-later.txt
diff --git a/package/libfwumdata/libfwumdata.mk b/package/libfwumdata/libfwumdata.mk
new file mode 100644
index 000000000000..37882b824b0f
--- /dev/null
+++ b/package/libfwumdata/libfwumdata.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libfwumdata
+#
+################################################################################
+
+LIBFWUMDATA_VERSION = 0.1.0
+LIBFWUMDATA_SITE = $(call github,passgat,libfwumdata,v$(LIBFWUMDATA_VERSION))
+LIBFWUMDATA_LICENSE = LGPL-2.1+, CC0-1.0
+LIBFWUMDATA_LICENSE_FILES = LICENSES/CC0-1.0.txt \
+	LICENSES/LGPL-2.1-or-later.txt
+
+LIBFWUMDATA_INSTALL_STAGING = YES
+LIBFWUMDATA_DEPENDENCIES = zlib
+
+$(eval $(cmake-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
