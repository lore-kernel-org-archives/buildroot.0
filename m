Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA24C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 20:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8628661096;
	Wed, 23 Mar 2022 20:29:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kdlQ-uf44dwa; Wed, 23 Mar 2022 20:29:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C67461364;
	Wed, 23 Mar 2022 20:29:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C4CB21BF48C
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5235740FD4
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 20:27:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Kaq8CS460Xm2 for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 20:27:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FB5B40FDD
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 20:27:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 73A01854C9; Wed, 23 Mar 2022 20:18:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 21:23:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3c7e03e2ad9908e91246260b90c2dba175c7e3c
X-Git-Newrev: 803bc68d59a46ea68540f437ced6334cf3335a7e
X-Patchwork-Hint: ignore
Message-Id: <20220323201808.73A01854C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ola: fix build with libexecinfo
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

commit: https://git.buildroot.net/buildroot/commit/?id=803bc68d59a46ea68540f437ced6334cf3335a7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised on uclibc and musl since the
reintroduction of the package in commit
16ff948444c3978d63f483344a3d92d994c64312:

/home/giuliobenetti/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arc-buildroot-linux-uclibc/10.2.0/../../../../arc-buildroot-linux-uclibc/bin/ld: common/.libs/libolacommon.so: undefined reference to `backtrace'

Fixes:
 - http://autobuild.buildroot.org/results/4362b20d786a0f44268ec32a689c23ac6d3b71c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/ola/ola.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/ola/ola.mk b/package/ola/ola.mk
index 557f454fe9..1b55ca440a 100644
--- a/package/ola/ola.mk
+++ b/package/ola/ola.mk
@@ -54,6 +54,11 @@ endef
 OLA_CONF_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 OLA_MAKE_ENV = PYTHONPATH=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
 
+ifeq ($(BR2_PACKAGE_LIBEXECINFO),y)
+OLA_DEPENDENCIES += libexecinfo
+OLA_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) -lexecinfo"
+endif
+
 ## OLA Bindings and Interface selections
 
 ifeq ($(BR2_PACKAGE_OLA_WEB),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
