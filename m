Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0146FC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 13:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0ED782106;
	Sat, 13 Jul 2024 13:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cL7M0nK9TOOq; Sat, 13 Jul 2024 13:01:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC3F283F62
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC3F283F62;
	Sat, 13 Jul 2024 13:01:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6425B1BF5AE
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F00183F62
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 13:01:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6r57av4P3NlB for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 13:01:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 812F082106
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 812F082106
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 13:01:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B9E98643F; Sat, 13 Jul 2024 13:01:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 15:00:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 080f2d94b7ac6e8ed5aef99000ec35a001186ed9
X-Git-Newrev: 42eae73ef1182587236c1f19ead59a7030cd9005
X-Patchwork-Hint: ignore
Message-Id: <20240713130149.6B9E98643F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cracklib: python needs autoreconf
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=42eae73ef1182587236c1f19ead59a7030cd9005
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set CRACKLIB_AUTORECONF when building python to regenerate py-compile
and avoid the following build failure with python 3.12 (which removed
imp module) raised since commit
36e635d2d5c0166476858aa239ccbe78e8f2af14:

Traceback (most recent call last):
  File "<string>", line 2, in <module>
ModuleNotFoundError: No module named 'imp'
make[3]: *** [Makefile:485: install-pythonPYTHON] Error 1

Indeed, after autoreconf, py-compile will contain:

if test "$python_major" -le 2; then
  import_lib=imp
  import_test="hasattr(imp, 'get_tag')"
  import_call=imp.cache_from_source
  import_arg2=', False' # needed in one call and not the other
else
  import_lib=importlib
  import_test="hasattr(sys.implementation, 'cache_tag')"
  import_call=importlib.util.cache_from_source
  import_arg2=
fi

$PYTHON -c "
import sys, os, py_compile, $import_lib

instead of:

import sys, os, py_compile, imp

Fixes: 36e635d2d5c0166476858aa239ccbe78e8f2af14
 - http://autobuild.buildroot.org/results/aec4c19fdf8087c76c1d5f472e855e0f84fcf7fd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cracklib/cracklib.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cracklib/cracklib.mk b/package/cracklib/cracklib.mk
index c5226b3326..9f5f32c87a 100644
--- a/package/cracklib/cracklib.mk
+++ b/package/cracklib/cracklib.mk
@@ -22,6 +22,8 @@ CRACKLIB_CONF_OPTS += --without-zlib
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
+# py-compile must be rebuilt because python 3.12 removed imp module
+CRACKLIB_AUTORECONF = YES
 CRACKLIB_CONF_OPTS += --with-python
 CRACKLIB_CONF_ENV += \
 	ac_cv_path_PYTHON=$(HOST_DIR)/bin/python3 \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
