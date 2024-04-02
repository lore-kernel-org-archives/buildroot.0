Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC1F5C6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 05:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 349A4403B3;
	Tue,  2 Apr 2024 05:08:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQwGxdLXxrP0; Tue,  2 Apr 2024 05:08:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF0D64012D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF0D64012D;
	Tue,  2 Apr 2024 05:08:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFBEB1BF362
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 05:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96275606BB
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 05:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6fSHcF2vxhMz for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 05:08:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D5F6B60A47
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5F6B60A47
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D5F6B60A47
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 05:08:29 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-7d03a6a11a2so228040039f.2
 for <buildroot@buildroot.org>; Mon, 01 Apr 2024 22:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712034508; x=1712639308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GEkE3cRGsJl5xtEWryDPzQn/6Bz6FsPis2BRvJpPDsM=;
 b=Fi5XSCE7n678pFeRF0/QrjuR57UZuKpgnKiwlzkkfptl8cu7xuCycGGcrHwgCe2Hng
 xYiQmGKsjz6sdh2D/X55vKARts9MXXGrlLzpAOrKcxNwV46OneP2ybuN6Y/KSA+xzCHL
 BQdwWN5zP1302IFPAKu7AyoQp219k+VuJvfD+xmpVRI2GC5ABhdFWsSJ30wSd84EgHC3
 uqxv/K+doCXQgkrpBvhVUIwnSLkNSv1Mjjj5aQbdWqi63ULuKDIlYy4SbSCXGtBmsol4
 SHipn+GqGEHBnMh1XV89saotLJoC9WeM+jdZYSGeyhMJc3z1Z4wbDe6e1MPogL74sErE
 lbxg==
X-Gm-Message-State: AOJu0Yz00tq0eBmqxJnla3yEOHLy8VhsuPTPaex/Tse/UNxq6v7O2Drs
 TP1jvcBNEVfD43ylsMDeeNorEGw6gBXsDq1wDSYIPnDL/nhKvDUseiRPE9NGunt9fg==
X-Google-Smtp-Source: AGHT+IEUvPGAhjhZQPoWTxx4Tm8nJdGDV+B/9Tl84XGe5V7NSvUJVFkXMQcsoLsVb8lOpQkQ/YDWNg==
X-Received: by 2002:a05:6602:da:b0:7d0:2b19:ddc5 with SMTP id
 z26-20020a05660200da00b007d02b19ddc5mr11661713ioe.6.1712034508407; 
 Mon, 01 Apr 2024 22:08:28 -0700 (PDT)
Received: from james-x399.localdomain (71-218-245-145.hlrn.qwest.net.
 [71.218.245.145]) by smtp.gmail.com with ESMTPSA id
 i10-20020a0566022c8a00b007d0d2cab857sm665080iow.17.2024.04.01.22.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 22:08:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Apr 2024 23:08:25 -0600
Message-Id: <20240402050826.119180-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712034508; x=1712639308; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GEkE3cRGsJl5xtEWryDPzQn/6Bz6FsPis2BRvJpPDsM=;
 b=ZFtZUdtXdWcPQo4wogWOx/cQTqHbFuDXQyUySo8ijNZXPrIHGfCLE9CWFZEkWZea0k
 NeysKxaibWDWuxDtu1Tlvr/5wqw6mjt5t4cERN8j2LtQpEb2oedwIlx/lMpVTnLNVRj0
 GnZnIiWIFzKX5JVaUr/pM2CLSnQ/BvUohCAla2bKYhiw5gXKOipwg6reN/a9qNojHRRd
 eNFX7CMkjUVxWXCHONbY6WSmUa5VdoiNexyqGmHknYduGnE57KK7RfSLZjmYKw7KmKDE
 7BwXuuEaO98SVOTEeQThcWwDeEX5aWnht8swj1UvZCe6NZ1MMVesWgg9WbuZRMK6EjMA
 RrTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZFtZUdtX
Subject: [Buildroot] [PATCH v4 1/2] package/python-grpclib: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add missing h2/multidict runtime dependencies
---
 package/Config.in                          |  1 +
 package/python-grpclib/Config.in           |  8 ++++++++
 package/python-grpclib/python-grpclib.hash |  5 +++++
 package/python-grpclib/python-grpclib.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/python-grpclib/Config.in
 create mode 100644 package/python-grpclib/python-grpclib.hash
 create mode 100644 package/python-grpclib/python-grpclib.mk

diff --git a/package/Config.in b/package/Config.in
index 410fe0f493..1c8f6db14d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1115,6 +1115,7 @@ menu "External python modules"
 	source "package/python-grpc-requests/Config.in"
 	source "package/python-grpcio/Config.in"
 	source "package/python-grpcio-reflection/Config.in"
+	source "package/python-grpclib/Config.in"
 	source "package/python-gunicorn/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
diff --git a/package/python-grpclib/Config.in b/package/python-grpclib/Config.in
new file mode 100644
index 0000000000..42cc011097
--- /dev/null
+++ b/package/python-grpclib/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_GRPCLIB
+	bool "python-grpclib"
+	select BR2_PACKAGE_PYTHON_H2 # runtime
+	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	help
+	  Pure-Python gRPC implementation for asyncio.
+
+	  https://github.com/vmagamedov/grpclib
diff --git a/package/python-grpclib/python-grpclib.hash b/package/python-grpclib/python-grpclib.hash
new file mode 100644
index 0000000000..cc65209138
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/grpclib/json
+md5  60ce203e5b9f95de3d7e5721dbce2bd9  grpclib-0.4.7.tar.gz
+sha256  2988ef57c02b22b7a2e8e961792c41ccf97efc2ace91ae7a5b0de03c363823c3  grpclib-0.4.7.tar.gz
+# Locally computed sha256 checksums
+sha256  6c7fa8cf9b94ad5043a6b550a0ffb98356e66100b69dd1cb8e1f82606b436e8e  LICENSE.txt
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
new file mode 100644
index 0000000000..0bec0a1879
--- /dev/null
+++ b/package/python-grpclib/python-grpclib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-grpclib
+#
+################################################################################
+
+PYTHON_GRPCLIB_VERSION = 0.4.7
+PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
+PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/79/b9/55936e462a5925190d7427e880b3033601d1effd13809b483d13a926061a
+PYTHON_GRPCLIB_SETUP_TYPE = setuptools
+PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
+PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
