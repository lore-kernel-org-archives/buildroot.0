Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84316C3ABAD
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 22:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21ACF81091;
	Sun, 15 Sep 2024 22:10:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ayND71F91Fma; Sun, 15 Sep 2024 22:10:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10C7F810B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10C7F810B3;
	Sun, 15 Sep 2024 22:10:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1D85E1BF301
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B1E0405E6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 22:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQ_ue_xnRDPU for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 22:10:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 507C840493
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 507C840493
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 507C840493
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 22:10:22 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-82aac438539so81075339f.1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 15:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726438221; x=1727043021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6KBhf/3rOzaHLsTnQgYFrv/S2Gq6htH/zM1IEcquD+E=;
 b=IM5azJAEpn8dkpNaY8zaSHnF5FmEAbUl5dGJL5YaJLMTg8NMgO0yL/VNr3pSARovWW
 AUuCKAwqf3RN2y3SMa2HDIBQFpA7Pc6Pcq0bBNRlATWgDf+G9TtETU/QNDWeOskJX8yN
 pTcX25iPgmu6j85ZkWU/r4hDw7lSMwhEIV13QyG2KrH/BoAnfw2lrE3j7GH8o1yYv6ZG
 P2frBMbFdmwub4vclclxWzCxaMl4pyXnWqtYPDqX6bv/asARCCEelzbLheyg9oVxcxOh
 rNsqUIgS5fSOzSDkaRSS8UFB2oSzmgrq20eO86TdiArPRnAE+pjisdYv8GbsWVw4JQvc
 OwIA==
X-Gm-Message-State: AOJu0Yzfx4M2V2gXnzZ4XSsQ/ZIlG+J4Pwvj/a5LjRCc1Oqrd5IZMhZQ
 U3OcPBQsDT95TpO6ZyIq5DzOHJZ5BmKtJ5/p0G0z73YlQHhuPmoFaZHTcQ==
X-Google-Smtp-Source: AGHT+IH55Vcn6jIDLNzzwyZ8iCfZ3hfiZGQE17u5zAzq4kBvQai0jw+KWq95RYCSBpQX5sPXN4Cv3Q==
X-Received: by 2002:a05:6602:3fd5:b0:82d:370b:ec0c with SMTP id
 ca18e2360f4ac-82d37843cd1mr781605039f.14.1726438220861; 
 Sun, 15 Sep 2024 15:10:20 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec2068asm1137023173.60.2024.09.15.15.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 15:10:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 16:10:16 -0600
Message-Id: <20240915221018.1655380-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726438221; x=1727043021; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6KBhf/3rOzaHLsTnQgYFrv/S2Gq6htH/zM1IEcquD+E=;
 b=LkjGoC+qEkrrmHW9+onhXh4T6OODCJD8cGMhlvzyaf6fuvL34Oyty28wkcPkgM38bn
 kIdPCskvkPZcHFRYhQBh17NLeYZMz4nw100P7BQqckothn72b1DP4NnPp+GLUMv3sVFI
 1i5zchFw2xShYsO84hIF91bZ0G/dyV4Mjqs1qdSAqqLI3ZVowVxwp6iuQa7y9LzdwJcx
 yaXfNpZd7idyG3oTB96guTckFINYfXE5UJwvxKQFUEU58D7kjeA6qnoq5i8b/xilrzQP
 NMKE3apPfDinMgulKC6+6pf+BqpbbrL2pJatNT/zUS7/TRtq9JNGyjRRhwLn8MGjA3dl
 547Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LkjGoC+q
Subject: [Buildroot] [PATCH 1/3] package/python-iterable-io: new package
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                                  |  1 +
 package/python-iterable-io/Config.in               |  7 +++++++
 package/python-iterable-io/python-iterable-io.hash |  5 +++++
 package/python-iterable-io/python-iterable-io.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)
 create mode 100644 package/python-iterable-io/Config.in
 create mode 100644 package/python-iterable-io/python-iterable-io.hash
 create mode 100644 package/python-iterable-io/python-iterable-io.mk

diff --git a/package/Config.in b/package/Config.in
index c0f4d9ece5..a0d2f329b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1167,6 +1167,7 @@ menu "External python modules"
 	source "package/python-ipython/Config.in"
 	source "package/python-ipython-genutils/Config.in"
 	source "package/python-iso8601/Config.in"
+	source "package/python-iterable-io/Config.in"
 	source "package/python-itsdangerous/Config.in"
 	source "package/python-iwlib/Config.in"
 	source "package/python-janus/Config.in"
diff --git a/package/python-iterable-io/Config.in b/package/python-iterable-io/Config.in
new file mode 100644
index 0000000000..e85159eb2f
--- /dev/null
+++ b/package/python-iterable-io/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_ITERABLE_IO
+	bool "python-iterable-io"
+	help
+	  Adapt generators and other iterables to a file-like
+	  interface.
+
+	  https://github.com/pR0Ps/iterable-io
diff --git a/package/python-iterable-io/python-iterable-io.hash b/package/python-iterable-io/python-iterable-io.hash
new file mode 100644
index 0000000000..aae6ad547e
--- /dev/null
+++ b/package/python-iterable-io/python-iterable-io.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/iterable-io/json
+md5  d6027af37f8e15edd346bdff6d5c5e3c  iterable-io-1.0.0.tar.gz
+sha256  fb9e1b739587a9ba0d5c60a3e1eb71246761583bc9f18b3c35bb112b44b18c3c  iterable-io-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  5de72116ec3738168bbaea5bd3405d161246ac542456470dc074f23d336252c0  README.md
diff --git a/package/python-iterable-io/python-iterable-io.mk b/package/python-iterable-io/python-iterable-io.mk
new file mode 100644
index 0000000000..e59c7d6455
--- /dev/null
+++ b/package/python-iterable-io/python-iterable-io.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-iterable-io
+#
+################################################################################
+
+PYTHON_ITERABLE_IO_VERSION = 1.0.0
+PYTHON_ITERABLE_IO_SOURCE = iterable-io-$(PYTHON_ITERABLE_IO_VERSION).tar.gz
+PYTHON_ITERABLE_IO_SITE = https://files.pythonhosted.org/packages/40/be/27d59b5c1d74ecbd26c1142f84b61d6cb04f0d0337697149645f34406b2d
+PYTHON_ITERABLE_IO_SETUP_TYPE = setuptools
+PYTHON_ITERABLE_IO_LICENSE = LGPL-3.0
+PYTHON_ITERABLE_IO_LICENSE_FILES = README.md
+
+$(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
