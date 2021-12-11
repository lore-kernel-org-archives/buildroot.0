Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22127C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 20:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BAD8684F8A;
	Sat, 11 Dec 2021 20:54:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id by1FWGWU5Jze; Sat, 11 Dec 2021 20:54:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F03884F7F;
	Sat, 11 Dec 2021 20:54:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 215B41BF963
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8F64403CB
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Wn1V5d6JDGl for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 467D34040E
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 20:53:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 166B382965; Sat, 11 Dec 2021 20:48:15 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 21:46:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1fd67fcfc816d43352d911642f91c51be0c64547
X-Git-Newrev: 7b2da3caaf87e44b0e3a8d72d43135b123e38bb6
X-Patchwork-Hint: ignore
Message-Id: <20211211204815.166B382965@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libv4l: fix typeof related compile
 failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b2da3caaf87e44b0e3a8d72d43135b123e38bb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case Qt support is enabled use '-std=gnu++11' instead of '-std=c++11' to
enable c++11 support and gain support of the typeof GNU extension.

Fixes:

  - http://autobuild.buildroot.net/results/2d58906a1eefdf921b42f6c0d9fd680ef2ad6e27

  In file included from v4l2-ctl-streaming.cpp:14:
  ../../utils/common/v4l2-tpg.h: In function 'void tpg_s_hue(tpg_data*, s16)':
  ../../utils/common/v4l2-tpg.h:49:2: error: 'typeof' was not declared in this scope
     49 |  typeof(val) __val = (val);  \
        |  ^~~~~~

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libv4l/libv4l.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index b11c8975d1..4dc0f15f94 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -71,8 +71,8 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_MOC=$(HOST_DIR)/bin/moc \
 	ac_cv_prog_RCC=$(HOST_DIR)/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/bin/uic
-# qt5 needs c++11 (since qt-5.7)
-LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
+# qt5 needs c++11 (since qt-5.7)/use gnu++11 for typeof support
+LIBV4L_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -std=gnu++11"
 else
 LIBV4L_CONF_OPTS += --disable-qv4l2
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
