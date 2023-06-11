Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93830C77B7A
	for <buildroot@archiver.kernel.org>; Sun, 11 Jun 2023 23:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17651402F2;
	Sun, 11 Jun 2023 23:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17651402F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NITaoX5oX6CD; Sun, 11 Jun 2023 23:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14005408D5;
	Sun, 11 Jun 2023 23:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14005408D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C5141BF2F8
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 23:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52D7281FE7
 for <buildroot@lists.busybox.net>; Sun, 11 Jun 2023 23:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52D7281FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iKDjHjU_minu for <buildroot@lists.busybox.net>;
 Sun, 11 Jun 2023 23:36:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF3B781FD5
Received: from 13.mo584.mail-out.ovh.net (13.mo584.mail-out.ovh.net
 [178.33.251.8])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF3B781FD5
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 23:36:34 +0000 (UTC)
Received: from director3.ghost.mail-out.ovh.net (unknown [10.108.20.200])
 by mo584.mail-out.ovh.net (Postfix) with ESMTP id ADA01233B4
 for <buildroot@buildroot.org>; Sun, 11 Jun 2023 23:36:32 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-pl8sk (unknown [10.109.138.36])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id EB06A1FDAC;
 Sun, 11 Jun 2023 23:36:31 +0000 (UTC)
Received: from blach.pl ([37.59.142.107])
 by ghost-submission-6684bf9d7b-pl8sk with ESMTPSA
 id +Om3M39ahmSPFgAAc/dVnA
 (envelope-from <grzegorz@blach.pl>); Sun, 11 Jun 2023 23:36:31 +0000
X-OVh-ClientIp: 91.239.248.252
From: Grzegorz Blach <grzegorz@blach.pl>
To: buildroot@buildroot.org
Date: Mon, 12 Jun 2023 01:36:16 +0200
Message-Id: <20230611233619.128038-3-grzegorz@blach.pl>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230611233619.128038-1-grzegorz@blach.pl>
References: <20230611233619.128038-1-grzegorz@blach.pl>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 6521212264206516545
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrgedufedgvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepifhriigvghhorhiiuceulhgrtghhuceoghhriigvghhorhiisegslhgrtghhrdhplheqnecuggftrfgrthhtvghrnhepffejteehieevhfdtveffieethfevheekgfdvfeelheehhfelfeefjeeigefhtefgnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghuihhlughrohhothdrohhrghdpphihphhirdhorhhgpdhphihthhhonhhhohhsthgvugdrohhrghenucfkphepuddvjedrtddrtddruddpledurddvfeelrddvgeekrddvhedvpdefjedrheelrddugedvrddutdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeoghhriigvghhorhiisegslhgrtghhrdhplheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheekgedpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-107S0018bee299a-757e-4e70-9eea-98d2afe70087,
 8D931DDE0DEECB89AEA118D672F623587F6625E2) smtp.auth=grzegorz@blach.pl
Subject: [Buildroot] [PATCH 3/6] package/python-hiredis: bump to version
 2.2.3
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 ...0001-setup.py-fix-build-with-gcc-4.8.patch | 43 -------------------
 package/python-hiredis/python-hiredis.hash    |  4 +-
 package/python-hiredis/python-hiredis.mk      |  4 +-
 3 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch

diff --git a/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch b/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 93f9440a74..0000000000
--- a/package/python-hiredis/0001-setup.py-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 204898e28c7650089bf664eea8adfc16a22ba4f4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 6 Apr 2021 10:37:49 +0200
-Subject: [PATCH] setup.py: fix build with gcc 4.8
-
-Fix the following build failure on gcc 4.8 which is raised since version
-2.0.0 and
-https://github.com/redis/hiredis-py/commit/9084152f624e8e593b4e86ddf8bd13329fdfc043:
-
-vendor/hiredis/read.c: In function 'redisReaderFree':
-vendor/hiredis/read.c:646:9: error: 'for' loop initial declarations are only allowed in C99 mode
-         for (int i = 0; i < r->tasks; i++) {
-         ^
-vendor/hiredis/read.c:646:9: note: use option -std=c99 or -std=gnu99 to compile your code
-
-This build failure is raised because hiredis source code is built
-without C99:
-https://github.com/redis/hiredis/commit/13a35bdb64615e381c5e1151cdd4e78bba71a6db
-
-Fixes:
- - http://autobuild.buildroot.org/results/04cbcddf6d83ebad8c98400754f9445375e9e489
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/redis/hiredis-py/pull/110]
----
- setup.py | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/setup.py b/setup.py
-index d83153b..1f623c9 100755
---- a/setup.py
-+++ b/setup.py
-@@ -13,6 +13,7 @@ def version():
- ext = Extension("hiredis.hiredis",
-   sources=sorted(glob.glob("src/*.c") +
-                  ["vendor/hiredis/%s.c" % src for src in ("alloc", "read", "sds")]),
-+  extra_compile_args=["-std=c99"],
-   include_dirs=["vendor"])
- 
- setup(
--- 
-2.30.2
-
diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 2e73d2f37b..5eaeab6d2a 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  0ab76a8b29deb737c9bfc7f631969e38  hiredis-2.0.0.tar.gz
-sha256  81d6d8e39695f2c37954d1011c0480ef7cf444d4e3ae24bc5e89ee5de360139a  hiredis-2.0.0.tar.gz
+md5  670a932c2972cbd88f910c2b29f85c3c  hiredis-2.2.3.tar.gz
+sha256  e75163773a309e56a9b58165cf5a50e0f84b755f6ff863b2c01a38918fe92daa  hiredis-2.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  70edfa6d3e11f9d7497c2c2f298d06f33b11d10f37f76605102c5ab3b1f28262  COPYING
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 55f9a09f55..f99a2f7c65 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 2.0.0
+PYTHON_HIREDIS_VERSION = 2.2.3
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/0c/39/eae11344d69ba435ec13d6bcc1a9eea3d2278324506fcd0e52d1ed8958c8
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/b0/04/dab6792584fc548803ffa50b5bb2b99f01d3ab04d7c7f64e85f1a22fb847
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = COPYING vendor/hiredis/COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
