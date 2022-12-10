Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2544DC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 19:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5A8160B3B;
	Sat, 10 Dec 2022 19:53:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A8160B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EvO9g88JzsqN; Sat, 10 Dec 2022 19:53:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E58F160AE7;
	Sat, 10 Dec 2022 19:53:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E58F160AE7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D46231BF59C
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFC68404A1
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 19:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AFC68404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNrs-9SJkvoK for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 19:53:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6AA040239
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6AA040239
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 19:53:39 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id v1so3825883ioe.4
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 11:53:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rdWixsJbqZJodDGOaC/gDy+pMrpk5BlERZoWNwwGgNc=;
 b=DTtql5t+kk5AVhK0+s8tqymCo7brQCj8qlnwfh0ec4GmbH1LcBDz5sEenhmNiSaclW
 c0t0hw0MZAAw0k9xquv4hAoZxWDXmek9qK4qjOb4am2DhqtZO9mem2ipMHbQ6koxBDoe
 2Vp6jJvUkdWU6CoQT0CYSzDMIe5HGCfiiXW48zt+hD31slsuAoTj0PLVfmirCFthKTPW
 yG3l+xwYpYDFCTLfBqA7ZyqNVrKFcb+HutIps47y+bALNFzBX+NbZOAwrY4LeuFy/90W
 VntyCh2AJ+KQGxUYsjXEONPf2jqud0disutEkQDv0ip+UIelpIwnq2I3Bf+L577/MCLa
 z9EQ==
X-Gm-Message-State: ANoB5pnXRUtwUkDqSXHwdB7e5RKUNPgTNAPV902SSLmAYViF2QbdP0cu
 Ul/3z5uTz6PDjoqcspN+XDHcpyrEN/rqmfIm
X-Google-Smtp-Source: AA0mqf5K81QWpC9OYzb72anbCQwt5jZKcL3EvAdiP0tNMXpEDVsvIFn8EUyKivjCjK2GCq7nT9HlIw==
X-Received: by 2002:a05:6602:2bc2:b0:6df:d2a0:383f with SMTP id
 s2-20020a0566022bc200b006dfd2a0383fmr5444800iov.11.1670702018738; 
 Sat, 10 Dec 2022 11:53:38 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 w25-20020a02b0d9000000b00389e1f5751asm1646205jah.65.2022.12.10.11.53.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 11:53:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 12:53:36 -0700
Message-Id: <20221210195336.3233806-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rdWixsJbqZJodDGOaC/gDy+pMrpk5BlERZoWNwwGgNc=;
 b=fhbeAdmwulWhDF0E7lfVkfUKaUcbYGVZQ5wEeTY0vXkWwFnVbViCGqYWnYcvCLTfZY
 iUW+rNr0VedsJbZ6R7nrUgOqI8+ppvPxVfJDopTOr8vODTXF7Lv7y23hTtq6SaZ8kd4D
 yQ3JJL+Rv+1qdiJPOT3WyXH3rblUMokRzwUSwIYfEy5yiRLFC1YXD5AW8iSr81nQp+Pw
 jHxxC/8lWonFcr3lh0Vs3sfb820/garEeaCcoMIBTlBTj7NQ0JICee5u9L1HZ7KNJkIl
 bbcmOxLlUXvQ0LhFdJ5ZIVk+31ih9bdzHY0mcuptaSSOIMfMFq8Ne2pbAFzOTj2/glce
 pAsg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fhbeAdmw
Subject: [Buildroot] [PATCH 1/1] package/python-pymodbus: bump to version
 3.0.2
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
Cc: Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index b5243567b7..d9337ffe84 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  25a8724539d0eac1b09d9b41812d86f9  pymodbus-3.0.0.tar.gz
-sha256  37c9b6f3e5c82f39ee42047ca48cbc9fd0c49a6731126789500191e9deea6cbc  pymodbus-3.0.0.tar.gz
+md5  89da6585b27b8c4b3887eb9f7d1e950b  pymodbus-3.0.2.tar.gz
+sha256  704cb7fb90631c45f9c3a70b89d0c990fe0e208ac56f14a5c449e21bebd1e201  pymodbus-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  796a47993313691ea404d8af7e4c0f9daf1d2760e3900938985b59c9008eee2f  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 2ed7e94afe..54879d38e9 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.0.0
+PYTHON_PYMODBUS_VERSION = 3.0.2
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/0f/5a/50e9492f98ef911af18c2b603bc003fef726e84d22bac2ce6e651643b29c
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/94/f7/6149a1b107fa54378a7adec83db7cd3679bf02216a6f5c83b37f55335897
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
