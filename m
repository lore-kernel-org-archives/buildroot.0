Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C5EC0219E
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 21:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F40A40651;
	Sat, 14 Sep 2024 21:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TB2McJ0a1JuC; Sat, 14 Sep 2024 21:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 170D140696
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 170D140696;
	Sat, 14 Sep 2024 21:46:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C50351BF470
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3FB4607C1
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 21:46:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BIPCXCRscK7X for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 21:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d34; helo=mail-io1-xd34.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BBBBC60645
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBBC60645
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBBBC60645
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 21:46:54 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id
 ca18e2360f4ac-82cdb0baf19so198106039f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 14:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726350413; x=1726955213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TILw+SSXD3WydurHfzSx0YQQYiCW7SSIk7EKzXlLv+c=;
 b=JqX6CUotqqyr9teK2qT2WWwjVMkI0336u1V0YIrZB0uA9ternDGs65Mf8t1/S3jr5o
 +BrprNt/WqcdvgzwMnonflBUU1jKzzhpDn9C7+L+gPVRC4OEVyXJ97+TStPHQUeEZCk8
 qsh/GMFF/QFYHXm96LIkZTsY8oUuPQN7JhBniFiIDQVsQ6zO89eebPNXwOYstvGTGA+O
 5eLfP/pdemCFytosIQrx0rV10dTCf4Ynt+enmf31Byl2rmj3vVwMzrqPvCho437zgw1J
 b49X4ZeZs+9Ms7AJTnMV+e5w7dEJlHGEkbk3OTWQMee3YdfdFpvtQxKZD4IWWxdVXKrn
 MMhg==
X-Gm-Message-State: AOJu0YyEJU7G3JY33ide4fhAjngCFFPS5wcG3N7DIkUffeQNPMckNdlu
 ktQQCG9uQhKvNirOxexJhGRP8k17E4eUB/Za8lNAG4RJ/4xJe452idDxiQ==
X-Google-Smtp-Source: AGHT+IHUj93J6PRtqr0J+paxW8+woB5tcLMm+blUwHrXdr1rS+ebDBdthD6g5G1hqbExqtyTVMYP/g==
X-Received: by 2002:a05:6e02:20e4:b0:3a0:8d97:2fd6 with SMTP id
 e9e14a558f8ab-3a08d9737dbmr55424845ab.19.1726350413258; 
 Sat, 14 Sep 2024 14:46:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed190c3sm592971173.120.2024.09.14.14.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 14:46:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 15:46:50 -0600
Message-Id: <20240914214650.1324058-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726350413; x=1726955213; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TILw+SSXD3WydurHfzSx0YQQYiCW7SSIk7EKzXlLv+c=;
 b=KHAFuYrhW5lNdCtC47JU4GFuFPImu2+iOvVU1SnZ0WeX5dVzcBWL4QQxkcifCiKpmk
 UCnsdPAIM/TP3o88/+yw9F8dWgaL97VJqKwpK+GrO2E405lWMlexQ1Z6YXCBr3nUvEC+
 Op1CIkLTGJRfOPg9PzzXm9MItkpCkB0vG6j102qvsrrVY/JFPwfV6CreE85O8/nGpleV
 vblOA2tcGkVaeCrpD64r8TWAqsylREKbYRXDrjaf2vVrRuh/I0npuyrsngFb6ms4Uj1M
 x7EgI+PYFOxnsHivwxixytnYS/9sFjO+vEpl8UAJDfUMkuoldPFmrf+h4tBPQ6G+SzxB
 WfKg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KHAFuYrh
Subject: [Buildroot] [PATCH 1/1] package/python-autobahn: bump to version
 24.4.2
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to adding contributors:
https://github.com/crossbario/autobahn-python/commit/75f3758127d1cf0ddb4450f80e30931353b3adca

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-autobahn/python-autobahn.hash | 6 +++---
 package/python-autobahn/python-autobahn.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-autobahn/python-autobahn.hash b/package/python-autobahn/python-autobahn.hash
index 11448fef3a..4b9e7c1be5 100644
--- a/package/python-autobahn/python-autobahn.hash
+++ b/package/python-autobahn/python-autobahn.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/autobahn/json
-md5  f29d3cebec06c81a87823a2776ffcc5c  autobahn-23.6.2.tar.gz
-sha256  ec9421c52a2103364d1ef0468036e6019ee84f71721e86b36fe19ad6966c1181  autobahn-23.6.2.tar.gz
+md5  cedc5252be771288b19c237cd54a63e9  autobahn-24.4.2.tar.gz
+sha256  a2d71ef1b0cf780b6d11f8b205fd2c7749765e65795f2ea7d823796642ee92c9  autobahn-24.4.2.tar.gz
 # Locally computed sha256 checksums
-sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
+sha256  49c90822821c78934079a4bfed0a880790a868bc6dba90ea8fe8274e0f985ada  LICENSE
diff --git a/package/python-autobahn/python-autobahn.mk b/package/python-autobahn/python-autobahn.mk
index 703f106515..458739f7f4 100644
--- a/package/python-autobahn/python-autobahn.mk
+++ b/package/python-autobahn/python-autobahn.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AUTOBAHN_VERSION = 23.6.2
+PYTHON_AUTOBAHN_VERSION = 24.4.2
 PYTHON_AUTOBAHN_SOURCE = autobahn-$(PYTHON_AUTOBAHN_VERSION).tar.gz
-PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/92/ee/c3320c326919394ff597592549ff5d29d2f7bf12be9ddaa9017caff1a170
+PYTHON_AUTOBAHN_SITE = https://files.pythonhosted.org/packages/38/f2/8dffb3b709383ba5b47628b0cc4e43e8d12d59eecbddb62cfccac2e7cf6a
 PYTHON_AUTOBAHN_LICENSE = MIT
 PYTHON_AUTOBAHN_LICENSE_FILES = LICENSE
 PYTHON_AUTOBAHN_CPE_ID_VENDOR = crossbar
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
