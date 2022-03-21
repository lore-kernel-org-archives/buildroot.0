Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA94C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 16:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E27181980;
	Mon, 21 Mar 2022 16:35:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrkGs2VoyIpG; Mon, 21 Mar 2022 16:35:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6899E80C03;
	Mon, 21 Mar 2022 16:35:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B51E1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 08C3E84150
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 16:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pH2ECz7MxAZf for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 16:34:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 571E784148
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 16:34:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6A05C84AB6; Mon, 21 Mar 2022 16:25:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 17:23:46 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6654e556c441eee5dc1ce759efc27613d9501f9d
X-Git-Newrev: d804e2ce8e57bb46f0a1bc1858e09c0c7bd4cbdd
X-Patchwork-Hint: ignore
Message-Id: <20220321162539.6A05C84AB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/pkg-generic: host
 variant inherits target download settings
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
Content-Type: multipart/mixed; boundary="===============8800497752947075551=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8800497752947075551==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d804e2ce8e57bb46f0a1bc1858e09c0c7bd4cbdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

It seems reasonable to expect that the download of the host and target
variants should usually be exactly the same and thus reuse the target
package values for the host package. This commits add support to
inherit host _DL_SUBDIR, _DOWNLOAD_DEPENDENCIES, _DL_ENV and
_DOwNLOAD_POST_PROCESS variables from target ones. These variables can
still be overriden if necessary for the host package.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Clément Léger <clement.leger@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit efa7712b092950c92f994e2ee30c120a64e5451b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

--===============8800497752947075551==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8800497752947075551==--
