Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20952C678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C153F6112F;
	Tue,  7 Mar 2023 21:11:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C153F6112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jac11pidELdo; Tue,  7 Mar 2023 21:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81A061101;
	Tue,  7 Mar 2023 21:11:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81A061101
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB0821BF33B
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A3DA881DCA
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3DA881DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUnXUksL29Wr for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:09:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8BFB81DFB
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 21:09:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8BFB81DFB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C762586A12; Tue,  7 Mar 2023 21:09:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Mar 2023 22:04:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a17fe68a3f9910b4dab2465bb0b06ed57704459
X-Git-Newrev: f255abdceabc3ebbff795c753f7a33d44e905369
X-Patchwork-Hint: ignore
Message-Id: <20230307210957.C762586A12@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gensio: add libglib2 optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=f255abdceabc3ebbff795c753f7a33d44e905369
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libglib2 is an optional dependency which is enabled by default since
version 2.3.0 and
https://github.com/cminyard/gensio/commit/866924d69dabe8b8a981e19bd745d5c84e529881

Handle it properly to avoid the following build failure since bump to
version 2.5.2 in commit 5bb747f0b783a0d3f1712350ca3277263045b299:

sparc64-buildroot-linux-gnu-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include/glib-2.0'

Fixes:
 - http://autobuild.buildroot.org/results/3602c5cc2aff668211fd8e6eeab778b3fe287246

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gensio/gensio.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 5538f97b19..dafc0bf5d5 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -14,6 +14,13 @@ GENSIO_CONF_OPTS = \
 	--without-swig \
 	--without-python
 
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+GENSIO_DEPENDENCIES += host-pkgconf libglib2
+GENSIO_CONF_OPTS += --with-glib
+else
+GENSIO_CONF_OPTS += --without-glib
+endif
+
 ifeq ($(BR2_PACKAGE_OPENIPMI),y)
 GENSIO_DEPENDENCIES += openipmi
 GENSIO_CONF_OPTS += --with-openipmi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
