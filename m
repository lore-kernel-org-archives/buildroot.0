Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7603C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:19:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58E3B60F58
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:19:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 58E3B60F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DFA560595;
	Wed,  4 Aug 2021 21:19:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wKn_taJpZDVy; Wed,  4 Aug 2021 21:19:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E71605FB;
	Wed,  4 Aug 2021 21:19:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9F85E1BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:18:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C299839BF
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:18:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FSj6FAkjs-Nj for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:18:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A76A83979
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:18:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1BA348B7C6; Wed,  4 Aug 2021 21:18:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:18:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1478126052566c5c5f2e360cb1d7b45c99c41dcb
X-Git-Newrev: 2b5dc4e32ed1d1f125b64c6cdaf81db4f320400f
X-Patchwork-Hint: ignore
Message-Id: <20210804211847.1BA348B7C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuwsc: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2b5dc4e32ed1d1f125b64c6cdaf81db4f320400f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 11:

/tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c: In function 'uwsc_lua_on':
/tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c:177:5: error: this 'else' clause does not guard... [-Werror=misleading-indentation]
  177 |     else
      |     ^~~~
/tmp/instance-1/output-1/build/libuwsc-3.3.5/src/lua/uwsc_lua.c:180:9: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'else'
  180 |         return 0;
      |         ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/1b031667e6d184493ea55ea6630272af4e475375

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libuwsc/0002-fix-bad-indentation.patch | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/package/libuwsc/0002-fix-bad-indentation.patch b/package/libuwsc/0002-fix-bad-indentation.patch
new file mode 100644
index 0000000000..f33f944d06
--- /dev/null
+++ b/package/libuwsc/0002-fix-bad-indentation.patch
@@ -0,0 +1,27 @@
+From 8cb416140741a596235b8acc46b2b119b13ebfab Mon Sep 17 00:00:00 2001
+From: Rosen Penev <rosenp@gmail.com>
+Date: Tue, 6 Jul 2021 21:01:52 -0700
+Subject: [PATCH] fix bad indentation
+
+Fixes error with GCC11.
+
+[Retrieved from:
+https://github.com/zhaojh329/libuwsc/commit/8cb416140741a596235b8acc46b2b119b13ebfab]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/lua/uwsc_lua.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lua/uwsc_lua.c b/src/lua/uwsc_lua.c
+index de6932e..84689fe 100644
+--- a/src/lua/uwsc_lua.c
++++ b/src/lua/uwsc_lua.c
+@@ -178,7 +178,7 @@ static int uwsc_lua_on(lua_State *L)
+     else
+         luaL_argcheck(L, false, 2, "available event name: open message error close");
+ 
+-	return 0;
++    return 0;
+ }
+ 
+ static int __uwsc_lua_send(lua_State *L, int op)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
