Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97EB2C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33D9260B12;
	Fri, 12 Jan 2024 16:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D9260B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khuUqSK6Mn6h; Fri, 12 Jan 2024 16:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89FD060BB2;
	Fri, 12 Jan 2024 16:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89FD060BB2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ACE081BF2F3
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8505E845CE
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8505E845CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3JKqj8yNMifs for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1015845CA
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1015845CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CB3585CBC; Fri, 12 Jan 2024 16:36:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 17:13:28 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 9d33bfe809c8a952a43a9d192e0e5f0323498e91
X-Git-Newrev: 0aab578d487aae9b4bf9e54a8fe322720ad47d92
X-Patchwork-Hint: ignore
Message-Id: <20240112163636.9CB3585CBC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] Revert "package/docker:
 enable selinux module"
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

commit: https://git.buildroot.net/buildroot/commit/?id=0aab578d487aae9b4bf9e54a8fe322720ad47d92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

This reverts commit 245b13a0778ec6ad061555b0b994e7649ef01006 as docker
selinux module is for docker-engine, not for "a system tray dock for X"

Moreover, it raises the following build failure:

Compiling targeted policy.33
env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/lib:/home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/usr/lib" /home/buildroot/autobuild/instance-0/output-1/per-package/refpolicy/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
policy.conf:1912:ERROR 'attribute container_engine_domain is not declared' at token ';' on line 1912:
type dockerd_t, container_engine_domain;
type dockerd_exec_t;

Fixes:
 - http://autobuild.buildroot.org/results/87d78b6f15875f0fa3e6fc85e352db14ab0383bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3e91de6428bf3dde303ed41b55b4cfe739b353f9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker/docker.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 39f7ee4580..4a8c6fcd8d 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -7,7 +7,7 @@
 DOCKER_VERSION = 1.5
 DOCKER_SITE = http://icculus.org/openbox/2/docker
 DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
-DOCKER_SELINUX_MODULES = docker
+
 DOCKER_LICENSE = GPL-2.0+
 # The 'or later' is specified at the end of the README, so include that one too.
 DOCKER_LICENSE_FILES = COPYING README
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
