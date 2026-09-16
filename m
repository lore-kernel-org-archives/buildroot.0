Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08052C982E0
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A42CF60D8A;
	Fri, 18 Sep 2026 13:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iHRQdWxotc9X; Fri, 18 Sep 2026 13:06:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 364D360D90
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736766;
	b=T72LEJVO84Q90aHMa54XbSOVwYVK1EZFL2aVcC9wNy6zIQcrlWPogOERTQg7w736z5g3
	 umEY7Tv2huczbgpK1DTOR5y1Y5gQEOBhimc+JEAzFEVLz+nxFv4WMmLF4DhlgrdWYU74A
	 kt3jwjWfUxfii81wqs82Vb3P3A5gfihYemynzqeiChKFgFH1XE5VF0smKRhnNtVjEq/Qv
	 Whxa7SpN8HGnaUTLmd1TgDesKkHOi/ax+WPzF4IemaxRyBj7ROwru3t0KIesM34ni/Xoi
	 E2h3Q5KPkkKuNp191rPasAOWx1ubyuMJ9PesCuhi+sg+0Yy+ItQpOnAdG231wVBPDGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736766;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=c5U/VKErubq52ORZNIbc4UghfmvgWxV1u9vzjeTZUIg=;
	b=LQ030HkOV/lmegbPDA/bbef4aDD0XANos04jzpYq0ULxtC9t9+XKjzffYO/K0kwPUj2n
	 Oe0I55LQSGoj1+Pbsk38rmnLVtkRK0uzqmPRtXNf5xenpj/1XAw3ObCN81vBdv6l2vnh8
	 IM+JPlK4CclvRaSwDzUJQ2Q/fjqruNPIzXij2OA5dWZVB7lMzbZv77ZiaJ9Uy9vXuh5ao
	 UfuZt2joMRtsRDHdBUkVcKAP+Cijcxn8q6dTdEsGKuRrpsrRdSPboOuwWd3oMOJp7WN+G
	 Bkr54BA7w8zQqDOnzolleDMnvbnVp3BP2MvLtECfN7VFBdJ/2XEhVbFyqQmIPPBwFSA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736766;
	bh=c5U/VKErubq52ORZNIbc4UghfmvgWxV1u9vzjeTZUIg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GtqwceFeZZyrprfN2TFvSrkMmt6JuryBvltZ6+RDe5+BeIKuzkBmnABoqLyLB8IUC
	 7JISsD3Um74k4BFV8Lx8vqpxyaZf31gx/m/48kEJ8DdLqRkOarsthIKzLCAIRXlMzc
	 Ys7tJp+dA0kDzluw+8Senxr8PmgjrLhKk3hB7wb/UdLbn5OQ2fIXwJudw/ZCbpAWzX
	 kU6IyBkOQUv6zpJ5jQAKLc0N0PaoZQZIaHCHufwyIj67ovWUPZI2FN0CYrQJO2FT++
	 U4eu+tZbrNnVjLLF+ZsB2rsy5A73WtdO4Y8rbUk4AXeTB6CoBtxXnyTwKjkpuNCJMn
	 cgveThP6xg+JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 364D360D90;
	Fri, 18 Sep 2026 13:06:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 86884224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 808A060B7D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z48IGx2QXihz for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 64CD060D67
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=DHUy3wF8lW3PAnyoRJj7fcuxORy5ZJMwjX8/MttNhyniNQ53vkrYgraJK++c67YDFa9o
 HmOJfuUNwhBDHgf0tXEo5o/xTUjCowrAl7xCMKbb6WfXWyOjSAeHy8vnxFKUuiABZq0Yu
 y1jWO/52AT0h9P1MZZufZ7Z9o8oNdBWgwj4VkiW80n4bQOB57/rTYoTI1bmwWvpofcPB1
 tXZM68I4LC0JT2FNIwxebKXYc+3WGEECPvzKW+EQJh5338afdfBwZkQI6ugufjtzZo8hk
 kKA3aXYEMraqQRmvy8JCsxbpN7rX9961fXHWPl3Wj4I793NyipsBflRAx5JWzfpQ2og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=52QEv5IqApmE73l1WfAX4qWmsYI5HDmbuPs0E9ruyvw=;
 b=ai7E8dRDMh7dezIEyiUep1Krdy6XtHqnd2nEqE0VzMhgVoYU44NSRZHGSNP46JiY3n8l
 yxcftLLa5PM4IJ2oGzR2PgOOB/D8yb9+J3e5s5LZ7YRnSQ5M5kV+S9evzEKslVw3cktay
 HScfP9rVGpCvrzqtdtBViF+ROELAih9pgHMueEckRNzpZMd8NsumbL33HLreoo/V+JU3W
 sAz1u1E0a4y+RJaJC39QV8/4ymcfcFNrZ+nrYhIS19Ajo5Y711iiXkfDlYIl9F/r1Qwb8
 T7rfcunBBItiYkxgUf6ZliR0XCQunknpbQPGLAF2eMQm/rGSvuUJ14XdIStnPGaZPpg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64CD060D67
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DA2D9718A; Fri, 18 Sep 2026 13:04:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:45:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 029c492e87de6fd667c725f32ddd2525a9b4682c
X-Git-Newrev: 110d3ecb810b4a30d8b77ab3936c6de8affa49fe
X-Patchwork-Hint: ignore
Message-Id: <20260918130440.1DA2D9718A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/bubblewrap:
 security bump to version 0.12.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/110d3ecb810b4a30d8b77ab3936c6de8affa49fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit 4cb6193d2eca39b1bd79ff4867c842f507f692b8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
