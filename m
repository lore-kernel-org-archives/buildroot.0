Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD98EC369DC
	for <buildroot@archiver.kernel.org>; Sun,  4 May 2025 17:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D1618133F;
	Sun,  4 May 2025 17:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W1dkQIp-VRRH; Sun,  4 May 2025 17:42:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C99481349
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C99481349;
	Sun,  4 May 2025 17:42:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ABB9183
 for <buildroot@buildroot.org>; Sun,  4 May 2025 17:42:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10CD760755
 for <buildroot@buildroot.org>; Sun,  4 May 2025 17:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nV9Hbz6YY2b3 for <buildroot@buildroot.org>;
 Sun,  4 May 2025 17:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A0C960746
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A0C960746
 for <buildroot@buildroot.org>; Sun,  4 May 2025 17:42:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 184F2863D7; Sun,  4 May 2025 17:42:47 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 4 May 2025 19:36:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 875f5670aa93a2a8559666985299aee6019bd902
X-Git-Newrev: 7a07a9d155b8f601d68f07ee0ed1dc8d48907644
X-Patchwork-Hint: ignore
Message-Id: <20250504174247.184F2863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/m4: fix build failure with
 host-gcc 15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7a07a9d155b8f601d68f07ee0ed1dc8d48907644
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When compiling host-m4 1.4.19 with a host gcc 15 (which is the version
included in Fedora 42, released on 2025-04-15), compilation fails with
error:

    In file included from gl_avltree_oset.h:21,
                     from gl_avltree_oset.c:21:
    gl_oset.h:275:1: warning: 'nodiscard' attribute ignored [-Wattributes]
      275 | GL_OSET_INLINE _GL_ATTRIBUTE_NODISCARD int
          | ^~~~~~~~~~~~~~
    gl_oset.h:275:40: error: expected identifier or '(' before 'int'
      275 | GL_OSET_INLINE _GL_ATTRIBUTE_NODISCARD int
          |                                        ^~~

This error is due to the gnulib copy included in m4 1.4.19, which does
not detect properly the default C language standard of gcc 15 which
has been changed from "gnu17" to "gnu23". See [1]. Note that m4 1.4.19
is the latest version available at the time of this commit, and was
released in May 2021. The issue is tracked upstream in [2].

Upcoming m4 release is expected to fix this issue, by updating its
gnulib copy. See [3], which states: "Update to comply with newer C
standards, and inherit portability improvements from gnulib".

Until this new m4 version is released, this commit fixes the issue by
forcing the C langage standard to "-std=gnu17" (the previous gcc
default) when host-gcc 15 is detected.

Note that the "-std=gnu17" option was introduced in gcc 8. See [4].
This is the reason why this patch adds this option only when the
problematic gcc 15 version is detected.

See also the discussions around this patch at [5].

Fixes:
https://autobuild.buildroot.org/results/1c33ef0a710cfae13e496485787b351c8f951217/
(and many, many others)

[1] https://gcc.gnu.org/gcc-15/changes.html#c
[2] https://savannah.gnu.org/support/?111150
[3] https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89
[4] https://gcc.gnu.org/gcc-8/changes.html#c
[5] https://lore.kernel.org/buildroot/CAPWx8vsoJUt8YMJG1aUqFRK1=yizNbgjVjGL1Q1+9ygjJGnZLA@mail.gmail.com/

Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Julien:
 - change mail url to lore.kernel.org for stable link
 - reword, reflow and add extra info in the commit log
 - force -std=gnu17 only when host gcc-15 is detected
 - add a comment in .mk to remove the workaround at next bump
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/m4/m4.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 39ad898b10..f5e1e27ad8 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -10,4 +10,14 @@ M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
 
+# gcc-15 defaults to -std=gnu23 which is incorrectly detected and
+# generates build failures in the gnulib copy included in
+# m4-1.4.19. We workaround this by forcing the previous gcc default
+# standard, which is -std=gnu17 only when host gcc is >= 15. This
+# workaround can be removed when m4 will be updated to a version
+# including a fix for gcc-15.
+ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
+HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
+endif
+
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
