Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D5BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 22 Nov 2021 20:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2276061C;
	Mon, 22 Nov 2021 20:44:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TiQHtabCTnad; Mon, 22 Nov 2021 20:44:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FC0C60636;
	Mon, 22 Nov 2021 20:44:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9DB1BF5AD
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ADD380DFA
 for <buildroot@lists.busybox.net>; Mon, 22 Nov 2021 20:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WqO51xz3GOH6 for <buildroot@lists.busybox.net>;
 Mon, 22 Nov 2021 20:43:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6391E80DF9
 for <buildroot@buildroot.org>; Mon, 22 Nov 2021 20:43:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EFC6B8ED88; Mon, 22 Nov 2021 20:39:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 22 Nov 2021 21:43:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8f3e2a6678e173782748e3981a4bcfb06fb7f980
X-Git-Newrev: 136c9b2a1e080ff0c285c3ec028f23083f4a9e94
X-Patchwork-Hint: ignore
Message-Id: <20211122203932.EFC6B8ED88@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lighttpd: run autoreconf
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

commit: https://git.buildroot.net/buildroot/commit/?id=136c9b2a1e080ff0c285c3ec028f23083f4a9e94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since upstream commit bb1d35dc1767 [1] (which is part of the bump to
version 1.4.60), configure.ac no longer checks for a specific C
standard. It will therefore use the "default" standard. With autoconf
2.69 (which is what is used to generate the configure script in the
tarball), the default standard is C89, which requires no option to be
passed to the compiler. However, that means that older compilers, e.g.
GCC 4.8, will indeed use C89 and not C99. This leads to the following
error.

array.c:140:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (uint32_t i = 0; i < sz; ++i) {
  ^

In autoconf 2.71 (which is used by Buildroot), the default standard has
changed: it is now C11 if available, C99 failing that, and finally fall
back to C89. Since GCC 4.8 (and later) support C11, that's what will be
selected, so C99 is allowed as well. Thus, running autoreconf fixes the
build.

The issue was reported upstream [2].

Fixes:
 - http://autobuild.buildroot.org/results/0349d8fed35b0766796dd9ba3b8de6ff8bd68fe7

[1] https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/bb1d35dc17671bc308e25651b4f5fa0c3008cc69
[2] https://redmine.lighttpd.net/issues/3116

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/lighttpd/lighttpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 9c18a6038e..c39a5db20f 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -12,6 +12,8 @@ LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf
+# Issue in configure script provided in tarball
+LIGHTTPD_AUTORECONF = YES
 LIGHTTPD_CONF_OPTS = \
 	--without-wolfssl \
 	--libdir=/usr/lib/lighttpd \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
