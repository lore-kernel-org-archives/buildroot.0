Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 351F0E6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 18:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D63BA40229;
	Fri,  6 Sep 2024 18:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BBD8W07gWoQ6; Fri,  6 Sep 2024 18:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A8AE40249
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A8AE40249;
	Fri,  6 Sep 2024 18:48:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 930BB1BF980
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E9AA40229
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 18:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCQ7bzrybMpQ for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 18:48:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2AE6E40151
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AE6E40151
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2AE6E40151
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 18:48:02 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82a2a035b59so117446439f.0
 for <buildroot@buildroot.org>; Fri, 06 Sep 2024 11:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725648481; x=1726253281;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7yDsiwySLIl3PaWTFSQrGN5+5knmxbG/0i94BxP4ul4=;
 b=ZykllZ9avFXuaOTbSXA6Q+2NtMiJpacoTvqct7XV0/butk/UFJKms+HV2tPuWpRFJQ
 5vg0DsrYNbgtg3GfsWrX38EnRg6c5wg4H+YP2iWEFarvmyS6X5nTH2702PCrUguiVfB/
 nPsEUgzsdFT051hgq6Of+ezG9Rc5bikfG3BoPBa9docT0FlAiNzFalzxyOlajmi/n/hE
 Fb1+G1x7uY/UFw5g1GwK33KtA9fVoZbjg1d3a8TbUX6v8GqxrNsrfEb+CmLZRt8bcFzQ
 LRTfuONY6L3rgOYP30ZiQwZhGG2wpyS1dGbuMWZD7vFsOMHk6DiAIGtFfyXpD/qlMJTx
 diPg==
X-Gm-Message-State: AOJu0YwlLch8zhr1+yt63AH4azknwr7PjnWgU1q3MZ8iB5gv7gn2a45h
 bwb65N+v980MGvmDWrOm5Pd9eiDexlikb/jQH4CkG9FBCsQ2jM2JlRBI/Q==
X-Google-Smtp-Source: AGHT+IH6EAZnrd/8sFNIHK8fn+8wnqkQXurIZS8eqI4oVdRxKAP91Yae6EkLC5h4aGWgRbV2bnfdfQ==
X-Received: by 2002:a05:6602:341b:b0:825:1f11:5996 with SMTP id
 ca18e2360f4ac-82a9622213dmr417440939f.13.1725648480855; 
 Fri, 06 Sep 2024 11:48:00 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ced2dcdf66sm4176539173.33.2024.09.06.11.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 11:48:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Sep 2024 12:47:55 -0600
Message-Id: <20240906184756.1166732-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725648481; x=1726253281; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7yDsiwySLIl3PaWTFSQrGN5+5knmxbG/0i94BxP4ul4=;
 b=X61rQkjnGzHyiS938oesQTfppzFXmcLCRtAw8Q8EKIJwPrw2XrTiFtTwss+Fe9kcgS
 8+zFflkIhLB+HRNgiRPSt+l6otmXy+QreeLkbh0TfQieRQGo3EC+O/riDbeMEk7uVf20
 nPnibU/qux+MKstGTHf0gRTjrbdoAr0l/xuipWcz1rEH8yau/isk0AdCHBqQ+jngEVjl
 LYL4R6jF+kjzNEI8CRsd9+7X8UXMPgMKbx1R/5KV/G0Haffur+CM15eENd0mD0FSz5i0
 vZvEmrD728CxyOmMERyPvOflC1J9gdRbe+LtrXESrqoqloKar1eNsZeE1MfxW3zZEV+H
 bAlQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X61rQkjn
Subject: [Buildroot] [PATCH 1/2] package/python-tzdata: new package
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
 package/Config.in                        |  1 +
 package/python-tzdata/Config.in          |  6 ++++++
 package/python-tzdata/python-tzdata.hash |  5 +++++
 package/python-tzdata/python-tzdata.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/python-tzdata/Config.in
 create mode 100644 package/python-tzdata/python-tzdata.hash
 create mode 100644 package/python-tzdata/python-tzdata.mk

diff --git a/package/Config.in b/package/Config.in
index f33c4780f8..4109a23871 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ menu "External python modules"
 	source "package/python-types-python-dateutil/Config.in"
 	source "package/python-typing-extensions/Config.in"
 	source "package/python-typing-inspect/Config.in"
+	source "package/python-tzdata/Config.in"
 	source "package/python-u-msgpack/Config.in"
 	source "package/python-ubjson/Config.in"
 	source "package/python-uhid/Config.in"
diff --git a/package/python-tzdata/Config.in b/package/python-tzdata/Config.in
new file mode 100644
index 0000000000..fc06da356b
--- /dev/null
+++ b/package/python-tzdata/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TZDATA
+	bool "python-tzdata"
+	help
+	  Provider of IANA time zone data.
+
+	  https://github.com/python/tzdata
diff --git a/package/python-tzdata/python-tzdata.hash b/package/python-tzdata/python-tzdata.hash
new file mode 100644
index 0000000000..e82aed0e78
--- /dev/null
+++ b/package/python-tzdata/python-tzdata.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tzdata/json
+md5  6ffd87c74f67524f8e58ae32868c1a95  tzdata-2024.1.tar.gz
+sha256  2674120f8d891909751c38abcdfd386ac0a5a1127954fbc332af6b5ceae07efd  tzdata-2024.1.tar.gz
+# Locally computed sha256 checksums
+sha256  33e8e5002d3512d3fcc2282b995e6bad9d334781b9c5ac31843f404900e1f3b4  LICENSE
diff --git a/package/python-tzdata/python-tzdata.mk b/package/python-tzdata/python-tzdata.mk
new file mode 100644
index 0000000000..d8f2088d8a
--- /dev/null
+++ b/package/python-tzdata/python-tzdata.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tzdata
+#
+################################################################################
+
+PYTHON_TZDATA_VERSION = 2024.1
+PYTHON_TZDATA_SOURCE = tzdata-$(PYTHON_TZDATA_VERSION).tar.gz
+PYTHON_TZDATA_SITE = https://files.pythonhosted.org/packages/74/5b/e025d02cb3b66b7b76093404392d4b44343c69101cc85f4d180dd5784717
+PYTHON_TZDATA_SETUP_TYPE = setuptools
+PYTHON_TZDATA_LICENSE = Apache-2.0
+PYTHON_TZDATA_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
