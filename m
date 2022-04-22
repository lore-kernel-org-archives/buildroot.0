Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6B9C433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Apr 2022 18:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3BB941CAD;
	Fri, 22 Apr 2022 18:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q83FiI4_nRf3; Fri, 22 Apr 2022 18:17:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AAEA41CA6;
	Fri, 22 Apr 2022 18:16:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F38A1BF330
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:16:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D71F61034
 for <buildroot@lists.busybox.net>; Fri, 22 Apr 2022 18:16:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tEXWZSzIr-OD for <buildroot@lists.busybox.net>;
 Fri, 22 Apr 2022 18:16:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp3.osuosl.org (Postfix) with ESMTP id C872861033
 for <buildroot@buildroot.org>; Fri, 22 Apr 2022 18:16:34 +0000 (UTC)
Received: from pwmachine.home (unknown [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id 0311920E7048;
 Fri, 22 Apr 2022 11:16:32 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0311920E7048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1650651394;
 bh=FsZMZvZXLw5Teet2fao+SzIwj4wwc+OMBiOGX6TFR7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TZHMRO3v35R1DTEicXZgFD39leQ236Hqty0JOSAuv/e7oOEq2QVWsMLCk+hK8riSw
 +madGWwWJ8tX/jbB5YqxZJTVroKG7sqTMEqNjCO7eDM+dThvoZPk17UQeNjI2RWIcp
 tVia51CqumwehNirw0FcWnGwVqmqsaYzg441/D5g=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Fri, 22 Apr 2022 19:16:12 +0100
Message-Id: <20220422181612.51246-3-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422181612.51246-1-flaniel@linux.microsoft.com>
References: <20220422181612.51246-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [RFC PATCH v1 2/2] package/pahole: use commit
 73383b3a39af
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This modification uses buildroot host-libbpf instead of pahole libbpf git
submodule.
Also, it nows uses commit:
73383b3a39af ("libbpf: Update libbpf to the latest git HEAD")
To avoid compile errors due to use of depecrated APIs (like btf__get_nr_types).

A build pre hook was also added to Linux to avoid conflicts regarding bpf.h
which added to HOST_DIR by host-libbpf.

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/pahole/pahole.hash |  2 +-
 package/pahole/pahole.mk   | 14 +++++++-------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pahole/pahole.hash b/package/pahole/pahole.hash
index 420db15e75..8e5560b5e7 100644
--- a/package/pahole/pahole.hash
+++ b/package/pahole/pahole.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cde85af68b368f50a913be387f94f6b43612a04af6c92387b4dcabb712a668fe  pahole-v1.23-br1.tar.gz
+sha256  3531396c0568793ef8ca1a2fbb44ef2e1e81bdd55496a4487b83ba4d95df9d99  pahole-73383b3a39afe86b22e098773e47b8546c48a649.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/pahole/pahole.mk b/package/pahole/pahole.mk
index da6d67e6a2..199fa8cc11 100644
--- a/package/pahole/pahole.mk
+++ b/package/pahole/pahole.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PAHOLE_VERSION = v1.23
-PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git
-PAHOLE_SITE_METHOD = git
-# pahole contains git submodule and relies on them to be built.
-PAHOLE_GIT_SUBMODULES = YES
-HOST_PAHOLE_DEPENDENCIES = host-elfutils
+PAHOLE_VERSION = 73383b3a39afe86b22e098773e47b8546c48a649
+PAHOLE_SITE = https://git.kernel.org/pub/scm/devel/pahole/pahole.git/snapshot
+HOST_PAHOLE_DEPENDENCIES = \
+	host-elfutils \
+	host-libbpf
 # Defining __LIB is needed to build pahole.
-HOST_PAHOLE_CONF_OPTS = -D__LIB=lib
+# Set LIBBPF_EMBEDDED to OFF to use host-libbpf.
+HOST_PAHOLE_CONF_OPTS = -D__LIB=lib -DLIBBPF_EMBEDDED=OFF
 PAHOLE_LICENSE = GPL-2.0
 PAHOLE_LICENSE_FILES = COPYING
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
