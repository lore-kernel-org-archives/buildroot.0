Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D928CCAC5AA
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 21:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82A3181DF7;
	Tue, 17 Sep 2024 21:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xPu4e9OaiqG; Tue, 17 Sep 2024 21:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886D781E06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886D781E06;
	Tue, 17 Sep 2024 21:49:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B93C91BF5E6
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B25F34026F
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 21:49:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sI-ELBFc8dyI for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 21:49:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::135; helo=mail-il1-x135.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B28E40118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B28E40118
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B28E40118
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 21:49:42 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3a09c93db34so16027555ab.1
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 14:49:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726609782; x=1727214582;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LOLqjiNMNNL+uK2iwyfGNdFCjgmO9OqVlza25vC7mrA=;
 b=PjmqWWrcaUlZGG9S7Rrk7Zq3ANbg2sDyVKwjaTBFD43SXKG7uG3G1NkSPisCdPlHWc
 vPxWsLJf953giy8p6wtDTfYmj62v78ieAmxpOCT4TyYv8REcsEttWOIEImKAxj7p44GS
 Ez6mPmSpTRG9zEHerz4pxoPKNJbs7DMtycDyqKNNS6sqTY1nKPBVo0fnvqnRh6oxOYOw
 vxyeCPmYT3nft+gsqYGpjgflKoPRinPtLEp82M+HCII0WQscr3ojjRMAWRbUc19mTwtj
 bbblMZdmbnbl533ql61Re+w7ZeVRUUx/Od/rC5h95jSsyt+9rRGIKjtilxG5fim6cW2W
 E7dQ==
X-Gm-Message-State: AOJu0Yz5KoPqIWm6M/iuLjGd4pA1Up90q4twpNNBJiUw3Xlgn9iW4OEz
 +aNfGco8Y4lzwghPWI1xlsPnyqYDbxGyxkcKHRy1EuJbYyoLAUjPluJ+uQ==
X-Google-Smtp-Source: AGHT+IEg/xWeG7SokCkSNQ9nyTWS6g6kC/Xeojq6CLJRqp5i31IzbrSVfErIS0jeT+/LmmeVdUxBSQ==
X-Received: by 2002:a05:6e02:522:b0:3a0:9c68:408d with SMTP id
 e9e14a558f8ab-3a09c684274mr67352765ab.14.1726609781703; 
 Tue, 17 Sep 2024 14:49:41 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4677sm2158154173.31.2024.09.17.14.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 14:49:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 15:49:39 -0600
Message-Id: <20240917214939.80237-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726609782; x=1727214582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LOLqjiNMNNL+uK2iwyfGNdFCjgmO9OqVlza25vC7mrA=;
 b=FE5spqVmcC6RxV6N7APuFsjKqBtmLuXlq35Gu/oupBUa8UdwHm4CaGN5EMQnKUPHKl
 ujmZmhkypFMyobfCp9mccWCx55QeR8bgPobsEFDTvSlnASjKDO13tm9VpjVGGV7Ig+8K
 YsGB6nByakfOek9L6N9DOi9nrNvNPLvlSVcdbQaBlKaYgCmzCSjC4iNI0e2tXU+xUJnN
 dSmSJ1rISojaEF2EetBg3fHE7JJ3LTTddmDSCR+WT9vnfqWw+cplAzSjBajMZuhau3ko
 gUv27qriVroWPZxFiH2pWYaL+LXZauC/bloGhu90WnWnPdyiWCLoTQtnQmUeQp41gdTU
 G3cw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FE5spqVm
Subject: [Buildroot] [PATCH 1/1] package/python-pyftpdlib: bump to version
 2.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-pyasyncore and python-pyasynchat runtime dependencies.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyftpdlib/Config.in             | 2 ++
 package/python-pyftpdlib/python-pyftpdlib.hash | 4 ++--
 package/python-pyftpdlib/python-pyftpdlib.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-pyftpdlib/Config.in b/package/python-pyftpdlib/Config.in
index e25c34e5a3..6567385ecf 100644
--- a/package/python-pyftpdlib/Config.in
+++ b/package/python-pyftpdlib/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_PYFTPDLIB
 	bool "python-pyftpdlib"
+	select BR2_PACKAGE_PYTHON_PYASYNCHAT # runtime
+	select BR2_PACKAGE_PYTHON_PYASYNCORE # runtime
 	help
 	  Extremely fast and scalable Python FTP server library.
 
diff --git a/package/python-pyftpdlib/python-pyftpdlib.hash b/package/python-pyftpdlib/python-pyftpdlib.hash
index 7b5dabdfdc..32f662ff91 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.hash
+++ b/package/python-pyftpdlib/python-pyftpdlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyftpdlib/json
-md5  cb32bca52ba0d4850a92513154c253e1  pyftpdlib-1.5.9.tar.gz
-sha256  323d4c42f1406aedb4df18faf680f64f32c080ff66f6c26090ba592f5bfc4a0f  pyftpdlib-1.5.9.tar.gz
+md5  36d7328c7dde493816bc3677b3c71287  pyftpdlib-2.0.0.tar.gz
+sha256  1aded131fc7d41b0fa734c7879a96a6251366b141e8886782bcb1de616ffc791  pyftpdlib-2.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  67a832551570a5ac5f7901eaa5ece4b9491fda7f2d8c93957c3bbc68a5a76d88  LICENSE
diff --git a/package/python-pyftpdlib/python-pyftpdlib.mk b/package/python-pyftpdlib/python-pyftpdlib.mk
index da101083b6..55de21f8f6 100644
--- a/package/python-pyftpdlib/python-pyftpdlib.mk
+++ b/package/python-pyftpdlib/python-pyftpdlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYFTPDLIB_VERSION = 1.5.9
+PYTHON_PYFTPDLIB_VERSION = 2.0.0
 PYTHON_PYFTPDLIB_SOURCE = pyftpdlib-$(PYTHON_PYFTPDLIB_VERSION).tar.gz
-PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/47/9f/5dc055ab2db58db561f72b1b2f18b1dafc025f2ac5dd842c40259c17195e
+PYTHON_PYFTPDLIB_SITE = https://files.pythonhosted.org/packages/f1/69/a524dcb5a9be722273a74d71c509f3d875238c54fd7426fab6fd05ca8521
 PYTHON_PYFTPDLIB_SETUP_TYPE = setuptools
 PYTHON_PYFTPDLIB_LICENSE = MIT
 PYTHON_PYFTPDLIB_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
