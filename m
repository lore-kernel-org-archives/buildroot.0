Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13346C433EF
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 22:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9224560D94;
	Fri, 18 Mar 2022 22:40:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WAdJCWLFvfk0; Fri, 18 Mar 2022 22:40:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D2A960D69;
	Fri, 18 Mar 2022 22:40:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87F991BF853
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 76A7F8431C
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 22:40:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0FdQjMxCmq-X for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 22:40:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8A6882919
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 22:40:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 059C983944; Fri, 18 Mar 2022 22:31:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 18 Mar 2022 23:21:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7520b7ea1d4276fa762fa3be971155fcf2b2d01
X-Git-Newrev: efa7712b092950c92f994e2ee30c120a64e5451b
X-Patchwork-Hint: ignore
Message-Id: <20220318223159.059C983944@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-generic: host variant inherits
 target download settings
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
Content-Type: multipart/mixed; boundary="===============8608392110016223343=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8608392110016223343==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=efa7712b092950c92f994e2ee30c120a64e5451b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It seems reasonable to expect that the download of the host and target
variants should usually be exactly the same and thus reuse the target
package values for the host package. This commits add support to
inherit host _DL_SUBDIR, _DOWNLOAD_DEPENDENCIES, _DL_ENV and
_DOwNLOAD_POST_PROCESS variables from target ones. These variables can
still be overriden if necessary for the host package.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b3a7e1d60e..79fcf603d3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -540,6 +540,30 @@ ifndef $(2)_SUBDIR
  endif
 endif
 
+ifndef $(2)_DL_SUBDIR
+ ifdef $(3)_DL_SUBDIR
+  $(2)_DL_SUBDIR = $$($(3)_DL_SUBDIR)
+ endif
+endif
+
+ifndef $(2)_DOWNLOAD_DEPENDENCIES
+ ifdef $(3)_DOWNLOAD_DEPENDENCIES
+  $(2)_DOWNLOAD_DEPENDENCIES = $$(filter-out $(1),$$($(3)_DOWNLOAD_DEPENDENCIES))
+ endif
+endif
+
+ifndef $(2)_DL_ENV
+ ifdef $(3)_DL_ENV
+  $(2)_DL_ENV = $$($(3)_DL_ENV)
+ endif
+endif
+
+ifndef $(2)_DOWNLOAD_POST_PROCESS
+ ifdef $(3)_DOWNLOAD_POST_PROCESS
+  $(2)_DOWNLOAD_POST_PROCESS = $$($(3)_DOWNLOAD_POST_PROCESS)
+ endif
+endif
+
 ifndef $(2)_STRIP_COMPONENTS
  ifdef $(3)_STRIP_COMPONENTS
   $(2)_STRIP_COMPONENTS = $$($(3)_STRIP_COMPONENTS)

--===============8608392110016223343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8608392110016223343==--
