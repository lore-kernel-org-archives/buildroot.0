Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF02BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 14 May 2022 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A71D40562;
	Sat, 14 May 2022 21:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vtS_PRa2hBlL; Sat, 14 May 2022 21:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8422340488;
	Sat, 14 May 2022 21:55:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00E241BF616
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2C8360D5C
 for <buildroot@lists.busybox.net>; Sat, 14 May 2022 21:55:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 69_MtQPGdWK7 for <buildroot@lists.busybox.net>;
 Sat, 14 May 2022 21:55:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39CEC60806
 for <buildroot@buildroot.org>; Sat, 14 May 2022 21:55:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B504485E2C; Sat, 14 May 2022 21:44:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 May 2022 23:55:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c6b746e6fcb385eb3ea75250673c3cf6f3743538
X-Git-Newrev: 5527266559d9f6412f00f32299790605b4b76fc5
X-Patchwork-Hint: ignore
Message-Id: <20220514214429.B504485E2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-avro: don't refer to avro-c
 version variable
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5527266559d9f6412f00f32299790605b4b76fc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like for other packages sharing the same version number, we
can't rely on Make variable expansion. It's working by chance
since avro-c is sorted before python-avro by the Buildroot
main Makefile [1].

[1] https://git.buildroot.net/buildroot/tree/Makefile?h=2022.02.1#n533

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Titouan Christophe <titouanchristophe@gmail.com>
[yann.morin.1998@free.fr: duplicate comment]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/avro-c/avro-c.mk           | 1 +
 package/python-avro/python-avro.mk | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/avro-c/avro-c.mk b/package/avro-c/avro-c.mk
index 262a0fee5f..f55c579656 100644
--- a/package/avro-c/avro-c.mk
+++ b/package/avro-c/avro-c.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# When updating the version, please also update python-avro
 AVRO_C_VERSION = 1.11.0
 AVRO_C_SITE = https://www-eu.apache.org/dist/avro/avro-$(AVRO_C_VERSION)/c
 AVRO_C_LICENSE = Apache-2.0
diff --git a/package/python-avro/python-avro.mk b/package/python-avro/python-avro.mk
index 0c4c431777..29b8bc14d8 100644
--- a/package/python-avro/python-avro.mk
+++ b/package/python-avro/python-avro.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-PYTHON_AVRO_VERSION = $(AVRO_C_VERSION)
+# When updating the version, please also update python-avro
+PYTHON_AVRO_VERSION = 1.11.0
 PYTHON_AVRO_SITE = \
 	https://www-eu.apache.org/dist/avro/avro-$(PYTHON_AVRO_VERSION)/py
 PYTHON_AVRO_SOURCE = avro-$(PYTHON_AVRO_VERSION).tar.gz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
