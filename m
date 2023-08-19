Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77209EE49A3
	for <buildroot@archiver.kernel.org>; Sat, 19 Aug 2023 14:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDDFF83B86;
	Sat, 19 Aug 2023 14:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDDFF83B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l7_iEADAdRL3; Sat, 19 Aug 2023 14:42:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1574A83BF6;
	Sat, 19 Aug 2023 14:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1574A83BF6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B83291BF310
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 14:42:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9205441E05
 for <buildroot@lists.busybox.net>; Sat, 19 Aug 2023 14:42:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9205441E05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KM_3qeI4IBjU for <buildroot@lists.busybox.net>;
 Sat, 19 Aug 2023 14:42:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45B2241DFD
 for <buildroot@buildroot.org>; Sat, 19 Aug 2023 14:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45B2241DFD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32DF185B5C; Sat, 19 Aug 2023 14:42:23 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 19 Aug 2023 16:34:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94edad7ed5952f82823e3cd9e01e4e7010af9f96
X-Git-Newrev: acfdf21f0b752e844a33c70a0fd2f82f4534a5a0
X-Patchwork-Hint: ignore
Message-Id: <20230819144223.32DF185B5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "package/meson: bump to version
 1.2.0"
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

commit: https://git.buildroot.net/buildroot/commit/?id=acfdf21f0b752e844a33c70a0fd2f82f4534a5a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bump to meson 1.2.0 triggers unexpected build failure of the host
packages, because meson changed the way it passes library search paths
when building natively:

    https://github.com/mesonbuild/meson/commit/59cfbf68e00aa774a9868101f423bd662938c15d
    http://lists.busybox.net/pipermail/buildroot/2023-August/672649.html

As a consequence, the libraries are searched for in the system paths
before being searched in our host-dir, leading to failures when
incompatible libraries are installed in both locations. For example, if
the system has an older version of libglib2 installed, this causes link
failures when one of the glib2 library (e.g. libgio) is linked by path,
but a dependent library (e.g. libgmodule) is linked by name:

    /path/to/host/lib/libgio-2.0.so -L /path/to/host/lib/ -lgmodule-2.0

The first is indeed the one we built and installed in host-dir, but the
second is found in the system path; when it is an older (or more
recent?) version than the one we use, the link fails;

    /path/to/host/lib/libgio-2.0.so: undefined reference to `g_module_open_full'

Since fixing the issue is not trivial, revert to the previous meson
version that did not exhibit the issue.

This reverts commit d06e610d582e3be4b20f9939e5cab6765b7fb69a.

Reported-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 02fa1535ef..cb36b674fa 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/1.2.0/meson-1.2.0.tar.gz.asc
-sha256  1c0b634fe6b6a7072e398647f1bf392048577068a5c92ae44d04085dab0ded6f  meson-1.2.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/1.1.1/meson-1.1.1.tar.gz.asc
+sha256  d04b541f97ca439fb82fab7d0d480988be4bd4e62563a5ca35fadb5400727b1c  meson-1.1.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index 8eabe108c4..503aca8c25 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.2.0
+MESON_VERSION = 1.1.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
