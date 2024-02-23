Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF61C54798
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 17:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1052D4072A;
	Fri, 23 Feb 2024 17:35:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8wIWTCvXTAd; Fri, 23 Feb 2024 17:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A7BC40753
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A7BC40753;
	Fri, 23 Feb 2024 17:35:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A75F51BF2BC
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:35:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94E96606B3
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:35:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GTyqacJCPqpv for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 17:35:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6D4D7605AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D4D7605AE
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6D4D7605AE
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 17:35:25 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7bf7e37dc60so51603239f.3
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 09:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708709724; x=1709314524;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GIz8OQ332K6NvSQvKhKTZsi1BQ8hVonO8MHAwJc71LM=;
 b=XDNQcns8mDkJI0FZgFAYN4O7C0mFI+JO6DZ0cNki3ZbrRnEKH5po8V8Be1a8+6QtSQ
 NqE8EVBeLPxcAkdE26+C87O1qVVWE0pT/KghGVaXy1oMv19e/oD1vsWMvMURnkYKZcXO
 Nh2xfkRSP0a0OCZsiXdICltd1/mhUHtknXxVm9UiHA+wNZG7Cn59jeOV5cWojlKe588p
 MN7NXTopxDdUfNscKjuJtdwWiIP4mPoWsXDuZXUE8JaAVOUhdp1NTE9EGkrfj6SfzdQd
 XfaFXrQHqLTiCtYz14hnZu5Yek8ogDeww00CmfSrehlbOvQaQTs6NtQwPSYnl3jU2Nkm
 Ozug==
X-Gm-Message-State: AOJu0YyzUqZiB4QkuyUBTUucRFnKQXRI7vnYarX0n4jUwBuiIwkhHea7
 0S7vRa3GpaLVtlIlRpi9TA+bB66cNdA3lYWn2HxmuDq+IekGE4yAawrr/ikTsRE=
X-Google-Smtp-Source: AGHT+IFhmRuXYl8tCLNAp5noazRXzDeD29m2wGvGsNaSgZ2UygevU0g/SHxFAFbORbkr4Vd0aUmcGg==
X-Received: by 2002:a6b:f106:0:b0:7c7:5587:57ee with SMTP id
 e6-20020a6bf106000000b007c7558757eemr373204iog.20.1708709723239; 
 Fri, 23 Feb 2024 09:35:23 -0800 (PST)
Received: from james-x399.localdomain (71-218-244-120.hlrn.qwest.net.
 [71.218.244.120]) by smtp.gmail.com with ESMTPSA id
 em17-20020a0566384db100b004746fab2afdsm6167jab.40.2024.02.23.09.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 09:35:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 10:35:19 -0700
Message-Id: <20240223173519.2958847-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223173519.2958847-1-james.hilliard1@gmail.com>
References: <20240223173519.2958847-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708709724; x=1709314524; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GIz8OQ332K6NvSQvKhKTZsi1BQ8hVonO8MHAwJc71LM=;
 b=f0/nbitTO92OR9Ag1YVWPI/TeVkcY6ZxxVmcZcMKH7FRHiLAm3IZB+D+glCKwKlIyf
 7j7rZgtwWlm10xwMcZHCsWGGt077oQewrXPxdmOOn3S/IkxhO8gq4jc8OlaLqrMlfItE
 uUOeugCFzU4kTD9ssMC0Tkri9PflgLK+q3tnezNP2bLuGXrzS8ASwOWGd1O3JrQHBSAo
 N378Ujb+AJK0/dvWAqNJd80+u/i3FKYLzPOY970Wj/wOsjiGnQEcMZDINcf0UBST0TH5
 LCSsA8Os5RGu6Q5SXIrxTc4/TBHCE1yW7MNRL6OBDKCas2Uf7yM2iCy9lRfXDE+dK2zi
 W4yA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f0/nbitT
Subject: [Buildroot] [PATCH v2 2/2] package/python-betterproto: new package
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
 package/Config.in                                  |  1 +
 package/python-betterproto/Config.in               |  7 +++++++
 package/python-betterproto/python-betterproto.hash |  5 +++++
 package/python-betterproto/python-betterproto.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-betterproto/Config.in
 create mode 100644 package/python-betterproto/python-betterproto.hash
 create mode 100644 package/python-betterproto/python-betterproto.mk

diff --git a/package/Config.in b/package/Config.in
index 2ddaadae69..f49c3543b2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1006,6 +1006,7 @@ menu "External python modules"
 	source "package/python-backcall/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
+	source "package/python-betterproto/Config.in"
 	source "package/python-bidict/Config.in"
 	source "package/python-bitarray/Config.in"
 	source "package/python-bitstring/Config.in"
diff --git a/package/python-betterproto/Config.in b/package/python-betterproto/Config.in
new file mode 100644
index 0000000000..9ed72dd39b
--- /dev/null
+++ b/package/python-betterproto/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_BETTERPROTO
+	bool "python-betterproto"
+	select BR2_PACKAGE_PYTHON_GRPCLIB # runtime
+	help
+	  A better Protobuf / gRPC generator & library.
+
+	  http://github.com/danielgtaylor/python-betterproto
diff --git a/package/python-betterproto/python-betterproto.hash b/package/python-betterproto/python-betterproto.hash
new file mode 100644
index 0000000000..8d23d2ae56
--- /dev/null
+++ b/package/python-betterproto/python-betterproto.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/betterproto/json
+md5  bd4192c2997959100097479c34ff87e6  betterproto-2.0.0b6.tar.gz
+sha256  720ae92697000f6fcf049c69267d957f0871654c8b0d7458906607685daee784  betterproto-2.0.0b6.tar.gz
+# Locally computed sha256 checksums
+sha256  a5b8df75467e4b57a308a94cce5fdae84808a83ee6cd5af7e175c6b9784a753f  LICENSE.md
diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
new file mode 100644
index 0000000000..95caf0945a
--- /dev/null
+++ b/package/python-betterproto/python-betterproto.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-betterproto
+#
+################################################################################
+
+PYTHON_BETTERPROTO_VERSION = 2.0.0b6
+PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
+PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/45/43/4c44efd75f2ef48a16b458c2fe2cff7aa74bab8fcadf2653bb5110a87f97
+PYTHON_BETTERPROTO_SETUP_TYPE = setuptools
+PYTHON_BETTERPROTO_LICENSE = MIT
+PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
