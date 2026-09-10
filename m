Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6C1C79FBF
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 19:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D89738115C;
	Thu, 10 Sep 2026 19:59:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id edk5CvoobbNV; Thu, 10 Sep 2026 19:59:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E51D28111C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789070365;
	b=f6vPY9NQb6ukHqC5avbbpYoS55CoqbVpy+cTfBdseF99VMKvT7nIeDd9dFlw5/MJnkJM
	 sZMDgMMtwI+xy2RcJQxctzzcZglgDM86UqzljIgLrlGiX3UQBjsd8I6kxPq1Caol1dWRM
	 xnxCXi3JfcXYbBDxZbIrNivGE6t6/uH7MX/bytljvXXmB47pvtfOapK9in5aKvmSk8qzC
	 fu6BO2ewYniOTfjYUtfGC7pkU6VzWwvX7B3KDFfk+Z3b1SQMJMK0CnlLjfIweRtQcGTRc
	 fYoAh1s1fcQXOAichJvcuvo+PbA8Y9Uw/4SW4h+Enfm2I7HxQgRK+ljT111UAOTPMrA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789070365;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=yOnHlWh98dpuGh2OTU/kTBVEbEsLKF4CEgG+c4cn7GM=;
	b=P++VrsZzW/L+dje0RbAazppLWwiE5heMW7BoXT+3B2xxWE4cyAH9XGapZz9o7EIY6J4S
	 /8/Y/BnYAfBDrKPQN5tnrVZuZeEe7z7NprzJSN0fYqKpfzmJ8xy14dvx45kXnrv7vGTQB
	 NtO6wAo7FzfBkoQar6Yw0pBVsRfIcECcbgyGo2eZXFE3oIf4/jB+Vua9UcO5i8LltGKHp
	 8OiaOQpQJb2EF5wXL8FTls13IiFiZ1YfFOVDV5HpL7T5UjTvXmYrGhZeXgBiToUIMyzNr
	 4/i0GHqFCQJ5mnFaPVHzQDGMSDPr6R6Yr/pET2+IAviucXotuZXValjEnHxJpj7TZhw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789070365;
	bh=yOnHlWh98dpuGh2OTU/kTBVEbEsLKF4CEgG+c4cn7GM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JC0P7o/exlGgAH19XOcKn3nSvQuhbfoqxn1oUxj0G43ma1eWcr3szc4XFueCDEvhR
	 3tLQt6aHQPL+aJFeWcsDrZLR+AOMqsMH9eU6oJ2QulVmROo67xx/ZrqplJ7CqSxkAl
	 7/HKX5sBH6t7VkIutg2krqaubZ2bR9cvtOvQr0gBTEhPzovrezwOunoi+HxxJWOi9p
	 9l6Kv07EE/LBTbEaRwohhyQz8XY7G5ZkxWAZ102CM4ABKFzfcdbvZjXDGaBj2LL06+
	 yZzmQjEXxWEe3DbBgtK1/7f2S+gKikiWExBtn+3tLIQX9ZazQnpSeEJ8vg4GgPPqjY
	 g5S8CsrazB2cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E51D28111C;
	Thu, 10 Sep 2026 19:59:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99280362
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:59:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FB83401EE
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-ouidoCGfam for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 19:59:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8559B400AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789070361;
 b=aDs5hQU0l7Q2lE3C2PVlDg4H+nLXjGJJ05sWPboihOKrWEp0xBiQgUHqyvnZlNw/7OGK
 41q7t38ztxO6Yg7rigyN/J8AtuVjM7VJCIOcZtmrhPM1gs2CF99y32E4lfN/NI/bP3QBs
 dXLYeLRwv1vXlPrBSNDOBxpxBTx3zeoMbmA6I6pbAzwoqn4gYG8FSWmwzl0o8nuyaCKBU
 4irN+W/Eomlye9khCVj13nwskIvpeJZ1EX5JVtndZficufw5oneQZrkzUxmIUXB4ZwXmq
 3NiIJ8xqbCqG9w1BF+GFZwK/NbaxBM5+ztjQYiyvqH4/MAXuTb8Mqb3d184IBRTtVig==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789070361;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=noSQxKn2s+wR4KPmhY6egPmfaqiPJJW9+Y0krSvKGqI=;
 b=DnVe5mmNBMdbO+YejGDpzfAh5uqQXQNfEC8NgwtvFWLbb5EA4cjx/9qVqjFsOih1kJgL
 GyjA4trJnGXP2b4fiSL/4mRCC96GNb8R+Sb8MXD5oEraVCa/fdu1O2LETWBugQk9eSiea
 GmVe/FChhy2BgkIELQZsPoiZtBsiOksmhdNBsWv3AuEiPLTWy+UhFRXJuS5Xh1mIWV337
 iygpYXSqcu94sMRFVtPqikwW4Q4MJsgfygX4xWtrPsVqXs9923CCmX0aGJF9j8V+pu9nW
 lcwIPZ0yD65cdR3s5Od12HdTVls3osKEoygEdDbIeMwdz8ZeDSuA77rLxevcNxX1YBg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8559B400AE
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 19:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E1F0795555; Thu, 10 Sep 2026 19:58:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Sep 2026 21:58:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8067813e99e4bbdbaceae44459cc3074c8258abf
X-Git-Newrev: 4cb6193d2eca39b1bd79ff4867c842f507f692b8
X-Patchwork-Hint: ignore
Message-Id: <20260910195817.E1F0795555@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: security bump to
 version 0.12.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cb6193d2eca39b1bd79ff4867c842f507f692b8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes a sandbox escape through symlink traversal tracked in
CVE-2026-87766, which affects all previous versions.

Using the bwrap binary with the setuid bit set is no longer supported
and user namespaces are now always required, so a kernel config fixup
is applied.

A new build option allows indicating the minimum kernel version that
will be used, which removes code used for backwards compatibility with
kernels older than 5.6.0 when a newer version is specified. Passing
$(LINUX_VERSION_PROBED) seems reasonable here.

This version also changed the license from LGPL-2.0+ to LGPL-2.1+,
hence the updated hash.

Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.12.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
[Julien: fix _LINUX_CONFIG_FIXUPS by adding the missing "_LINUX"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bubblewrap/bubblewrap.hash |  6 +++---
 package/bubblewrap/bubblewrap.mk   | 17 +++++++----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index e87d3c81cb..e150e1495d 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,5 @@
-# From https://github.com/containers/bubblewrap/releases/download/v0.11.2/bubblewrap-0.11.2.tar.xz.sha256sum
-sha256  69abc30005d2186baf7737feacd8da35633b93cf5af38838ecff17c5f8e924f6  bubblewrap-0.11.2.tar.xz
+# From https://github.com/containers/bubblewrap/releases/download/v0.12.0/bubblewrap-0.12.0.tar.xz.sha256sum
+sha256  9760d007363e3abba7c747489910f9f82d9fca53ba3bd3282e396fa3c97a3314  bubblewrap-0.12.0.tar.xz
 
 # Hash for license files:
-sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 7838ab90b3..cb31406c8f 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,21 +4,24 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.11.2
+BUBBLEWRAP_VERSION = 0.12.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
 
-BUBBLEWRAP_LICENSE = LGPL-2.0+
+BUBBLEWRAP_LICENSE = LGPL-2.1+
 BUBBLEWRAP_LICENSE_FILES = COPYING
 BUBBLEWRAP_CPE_ID_VENDOR = projectatomic
 
+define BUBBLEWRAP_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USER_NS)
+endef
+
 BUBBLEWRAP_CONF_OPTS = \
+	-Dassume_kernel=$(LINUX_VERSION_PROBED) \
 	-Dzsh_completion=disabled \
 	-Dman=disabled \
 	-Dpython=$(HOST_DIR)/bin/python \
-	-Drequire_userns=false \
-	-Dsupport_setuid=true \
 	-Dtests=false
 
 ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
@@ -36,10 +39,4 @@ else
 BUBBLEWRAP_CONF_OPTS += -Dselinux=disabled
 endif
 
-# We need to mark bwrap as setuid, in case the kernel
-# has user namespaces disabled for non-root users.
-define BUBBLEWRAP_PERMISSIONS
-	/usr/bin/bwrap f 1755 0 0 - - - - -
-endef
-
 $(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
