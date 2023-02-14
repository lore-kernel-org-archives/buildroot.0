Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32FC2C61DA4
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 20:25:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F7960FA3;
	Tue, 14 Feb 2023 20:25:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89F7960FA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RC0UesG10OBv; Tue, 14 Feb 2023 20:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7DE760FB5;
	Tue, 14 Feb 2023 20:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7DE760FB5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C5231BF299
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 20:25:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA39240315
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 20:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA39240315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pp9A2RIVqDoW for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 20:25:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84B8F402CE
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84B8F402CE
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 20:25:44 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id y69so3007699iof.11
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 12:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TDWgq/ZcPZbUZvt1TAItFljBqE8zxP1/FFhsnDRlQg4=;
 b=cvqK4EX6aJ4hSSnVDftkJuUItyujRFvd838BOV3dyA35uVIetC9P27gOBL7X0khfoC
 fRBGTpNvp6VZ3RDWkncDxJqH4wnGpRGSJer29dCMuhfAXcdynOSE9xBmQOB3/E6ExBCc
 aVIeJU3UV+qBCAL1Mb9KjATI/tJvOC9BDwIqnLOY7DrXS6oRFut3MYQWRSThmr8KdeCd
 wjap0WRUe/iZQiS/1emXPczSvv4LlPGYJ3SG774Nfe2ND+sQVxB6hx9YbUxd79ajDxXm
 TpbV5ir2gOD8ZDvaWsVNbgK2J1vIsrrDD3r4Bqe3qnHJzIrE+CECPScTJOx8XStSRQxf
 Bqtg==
X-Gm-Message-State: AO0yUKWoWGkcvQdcCgctI/I9qF57xzderz/OUWFANKAf5/i8gwJU0RmQ
 nZiyXlUH6e54Q7htlT/ZA1z6K96Ebok=
X-Google-Smtp-Source: AK7set9jxebTWdD/yh9C1wp9yXtj3bzNgozMtBI4dWRNYGf9C7QwWIgc19XBUstsq6WrG0ubIpoRyg==
X-Received: by 2002:a6b:5b08:0:b0:740:4263:f312 with SMTP id
 v8-20020a6b5b08000000b007404263f312mr105521ioh.11.1676406343315; 
 Tue, 14 Feb 2023 12:25:43 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q22-20020a02a316000000b003c4840bfd6fsm4926519jai.75.2023.02.14.12.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 12:25:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 13:25:41 -0700
Message-Id: <20230214202541.2485669-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TDWgq/ZcPZbUZvt1TAItFljBqE8zxP1/FFhsnDRlQg4=;
 b=kmpfEnd5zW0TZZV9hz9yMSmYKWvFolJbbZAd/SUP8yYLccCrq5Q4I6K02jcuzawa7v
 3SC/CTNV6RiRJH4jmpk5purZ7QqUtpK0LK4KQPKytrZDNpYLdvCCfflgf4WKOE1dn/kD
 d8nx3RMwSrRQYJOkRpMQuvU6F+UJPolu3WDq6MZBtqfgDxRsVVjcZjX1vM6ZOMjsuccY
 hr+0QMz9Z3vMs+lG8YXTCa1QYpObo91Ah2Jc7dksmGanF12dPD9EZcsdPHOEEEyIUeul
 CBRiNTgXPIymbP7QpepVRL06U1KYY1WZ+2r0Gznnul73iwd+YXsheLw/HP/zE25h+zG/
 fJxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kmpfEnd5
Subject: [Buildroot] [PATCH 1/1] package/python-maturin: bump to version
 0.14.13
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index b104b1fbbe..d1344f2744 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  59157a06c0a482aec750d64746f2b23e556ce3ec62d9cdce74fcb7b4658b722b  maturin-0.14.9.tar.gz
+sha256  7ed1234824ef2b0c919c6d24550540bf044fe992612b322a6abda1253f5bb500  maturin-0.14.13.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index 3484e09d22..7781a1070b 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 0.14.9
+PYTHON_MATURIN_VERSION = 0.14.13
 PYTHON_MATURIN_SOURCE = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/90/f9/f4242c0e8bc5def9a7135c12574449dbb411ecc595cf72202ca97a79c2ad
+PYTHON_MATURIN_SITE = https://files.pythonhosted.org/packages/a9/a9/bcff9592d7ad68052432e6369bd310606e2ddeb9bcc0b52d5f69e4140290
 PYTHON_MATURIN_SETUP_TYPE = setuptools
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
 PYTHON_MATURIN_LICENSE_FILES = license-apache license-mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
