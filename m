Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43B30C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 10:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE5104029F;
	Mon,  7 Mar 2022 10:43:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id glOvfOAm-x3O; Mon,  7 Mar 2022 10:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7AD040209;
	Mon,  7 Mar 2022 10:43:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0BEF81BF3A8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 10:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E94AE60E2E
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 10:42:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hlOxSjs8xWmD for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 10:42:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F63360BD5
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 10:42:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4A66981586; Mon,  7 Mar 2022 10:33:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 7 Mar 2022 11:37:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b78caa449844fa12b5dbc89bde28786999a3b238
X-Git-Newrev: 512b329882bfb773badb6b5e5df31a38dfabd2e0
X-Patchwork-Hint: ignore
Message-Id: <20220307103351.4A66981586@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-qxl: fix
 build error
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
Content-Type: multipart/mixed; boundary="===============7151208403465872879=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7151208403465872879==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=512b329882bfb773badb6b5e5df31a38dfabd2e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add upstream commit to fix build with xorg-server 21.1 which was bumped
with commit d9185c6ba38430a017ed996c4180e141881ba570.

No autobuild errors found yet.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-a-build-error-with-Xorg-master.patch  | 106 +++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-qxl/0001-Fix-a-build-error-with-Xorg-master.patch b/package/x11r7/xdriver_xf86-video-qxl/0001-Fix-a-build-error-with-Xorg-master.patch
new file mode 100644
index 0000000000..d3257fba20
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-video-qxl/0001-Fix-a-build-error-with-Xorg-master.patch
@@ -0,0 +1,106 @@
+From 4e1963a812f2c1777ba5d56ea9e939a3e40a0496 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?=
+ <zboszor@gmail.com>
+Date: Sat, 28 Aug 2021 15:38:40 +0200
+Subject: [PATCH] Fix a build  error with Xorg master
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use xf86ReturnOptValBool() in get_bool_option() instead of
+options[option_index].value.bool to fix a compiler error with
+current Xorg xserver master branch.
+
+Also use xf86GetOptValInteger() in get_int_option() and
+xf86GetOptValString() in get_str_option() for consistency.
+
+The change causes a slight performance drop during option parsing
+because the passed-in index_value is no longer used as an index
+into the options array.
+
+Instead, it's used as a token now for the standard option getter
+functions which works since the index_value to the get_*_option()
+functions are identical to the value of options[n].token in the
+passed-in OptionInfoRec array.
+
+Also rename "int option_index" to "int token" for clarity in all
+three functions.
+
+Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
+
+Downloaded from upstream commit
+https://gitlab.freedesktop.org/xorg/driver/xf86-video-qxl/-/commit/4e1963a812f2c1777ba5d56ea9e939a3e40a0496
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/qxl_option_helpers.c | 13 +++++++------
+ src/qxl_option_helpers.h |  6 +++---
+ 2 files changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/src/qxl_option_helpers.c b/src/qxl_option_helpers.c
+index 2aba677..7707b7c 100644
+--- a/src/qxl_option_helpers.c
++++ b/src/qxl_option_helpers.c
+@@ -10,31 +10,32 @@
+ 
+ #include "qxl_option_helpers.h"
+ 
+-int get_int_option(OptionInfoPtr options, int option_index,
++int get_int_option(OptionInfoPtr options, int token,
+                    const char *env_name)
+ {
++    int value;
+     if (env_name && getenv(env_name)) {
+         return atoi(getenv(env_name));
+     }
+-    return options[option_index].value.num;
++    return xf86GetOptValInteger(options, token, &value) ? value : 0;
+ }
+ 
+-const char *get_str_option(OptionInfoPtr options, int option_index,
++const char *get_str_option(OptionInfoPtr options, int token,
+                            const char *env_name)
+ {
+     if (getenv(env_name)) {
+         return getenv(env_name);
+     }
+-    return options[option_index].value.str;
++    return xf86GetOptValString(options, token);
+ }
+ 
+-int get_bool_option(OptionInfoPtr options, int option_index,
++int get_bool_option(OptionInfoPtr options, int token,
+                      const char *env_name)
+ {
+     const char* value = getenv(env_name);
+ 
+     if (!value) {
+-        return options[option_index].value.bool;
++        return xf86ReturnOptValBool(options, token, FALSE);
+     }
+     if (strcmp(value, "0") == 0 ||
+         strcasecmp(value, "off") == 0 ||
+diff --git a/src/qxl_option_helpers.h b/src/qxl_option_helpers.h
+index 7c54c72..66d0a17 100644
+--- a/src/qxl_option_helpers.h
++++ b/src/qxl_option_helpers.h
+@@ -4,13 +4,13 @@
+ #include <xf86Crtc.h>
+ #include <xf86Opt.h>
+ 
+-int get_int_option(OptionInfoPtr options, int option_index,
++int get_int_option(OptionInfoPtr options, int token,
+                    const char *env_name);
+ 
+-const char *get_str_option(OptionInfoPtr options, int option_index,
++const char *get_str_option(OptionInfoPtr options, int token,
+                            const char *env_name);
+ 
+-int get_bool_option(OptionInfoPtr options, int option_index,
++int get_bool_option(OptionInfoPtr options, int token,
+                      const char *env_name);
+ 
+ #endif // OPTION_HELPERS_H
+-- 
+GitLab
+

--===============7151208403465872879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7151208403465872879==--
