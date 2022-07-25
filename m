Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CD8C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 12:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4C8A61B40;
	Mon, 25 Jul 2022 12:27:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4C8A61B40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R8Y3xYoBS0M1; Mon, 25 Jul 2022 12:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAB0A61B86;
	Mon, 25 Jul 2022 12:27:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAB0A61B86
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6063C1BF215
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48CC982F98
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 12:27:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48CC982F98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yYSNKxdf0iKP for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 12:27:40 +0000 (UTC)
X-Greylist: delayed 00:17:08 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80F582E4C
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by smtp1.osuosl.org (Postfix) with ESMTP id D80F582E4C
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 12:27:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [123.185.16.214])
 by smtp7 (Coremail) with SMTP id C8CowAAXVEssiN5iHWJRPw--.59913S2;
 Mon, 25 Jul 2022 20:10:21 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Mon, 25 Jul 2022 05:09:27 -0700
Message-Id: <20220725120927.348160-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220517103608.3455749-1-christian@paral.in>
References: <20220517103608.3455749-1-christian@paral.in>
MIME-Version: 1.0
X-CM-TRANSID: C8CowAAXVEssiN5iHWJRPw--.59913S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4kKFW8AryxXFyDtFy7Jrb_yoW8ur1Upr
 n3X3yFyF1vy34Fg3y7Cr97Kr90qrWDGry7Jw17Xw1UJ3WrCw4jy3y8t3yYgF47uws7X3yx
 XFs5Xr1avr4UAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUjhF7UUUUU=
X-Originating-IP: [123.185.16.214]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiGhRJjVaECnIdbwAAsS
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=7J5/m
 VQHAjYp4Fi5EC6IbKMpnne4xwjbI8xghCgE2GA=; b=DO+alT+bHdkmHoiraOhmV
 qX4qZbrpbbcC3QcmuCYlsx6cXvighVv+ZlSYD+aCNC0VIDsU6tR1sc5LIv4eIi+D
 7yl0O559joIWMWj7SZi7c805H41COTO4+7gtxOlhe74NEgzRKZrHN5z/Dv/+Vkhj
 32VQhDRA6epYODY4dcf3SE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=DO+alT+b
Subject: [Buildroot] [PATCH] package/pkg-utils: prevent KCONFIG_ENABLE_OPT
 from changing =m to =y
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The KCONFIG_ENABLE_OPT is intended to enable a required kernel configuration
option when a package requires it.

However, this will often override an existing enabled module with `=m` with `=y`
which overrides the module to be built-in instead of separate.

This is undesirable behavior; we often want these as `=m` and not `=y` to reduce
the size of the kernel image.

This patch changes KCONFIG_MUNGE_DOT_CONFIG to prevent changing `=m` to `=y`.

Signed-off-by: Christian Stewart <christian@paral.in>
Co-authored-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---

v1 -> v2:
 - fix indentation spacing: use tab instead of spaces
 - simplify by using $(1) instead of two separate variables
v2 -> v3:
 - refine KCONFIG_MUNGE_DOT_CONFIG
 - refactor KCONFIG_ENABLE_OPT
---
 package/pkg-utils.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 7d1aea7710..2edd542ba9 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -22,12 +22,17 @@ KCONFIG_DOT_CONFIG = $(strip \
 
 # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
 define KCONFIG_MUNGE_DOT_CONFIG
-	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3))
+	$(SED) '/^\(# \)\?$(strip $(1))\>/d' $(call KCONFIG_DOT_CONFIG,$(3)) && \
 	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
 endef
 
 # KCONFIG_ENABLE_OPT (option [, file])
-KCONFIG_ENABLE_OPT  = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2))
+# If the option is already set to =m or =y, ignore.
+define KCONFIG_ENABLE_OPT
+	$(Q)if ! grep -q '^$(strip $(1))=[my]' $(call KCONFIG_DOT_CONFIG,$(2)); then \
+		$(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=y, $(2)) || exit 1; \
+	fi
+endef
 # KCONFIG_SET_OPT (option, value [, file])
 KCONFIG_SET_OPT     = $(call KCONFIG_MUNGE_DOT_CONFIG, $(1), $(1)=$(2), $(3))
 # KCONFIG_DISABLE_OPT  (option [, file])
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
