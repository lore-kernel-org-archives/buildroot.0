Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C79DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 22:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 296D5830C5;
	Mon,  2 May 2022 22:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 485F_WWATCNz; Mon,  2 May 2022 22:03:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53AB581842;
	Mon,  2 May 2022 22:03:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79C021BF2BC
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0856660EB0
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 21:59:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIgc6wjnc0j8 for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 21:59:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A52260EDE
 for <buildroot@buildroot.org>; Mon,  2 May 2022 21:59:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 1303984F0E; Mon,  2 May 2022 21:48:51 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 2 May 2022 23:56:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd3dfd177225ad5dd25bb181e07b92075eb380a7
X-Git-Newrev: d7db5af34f25cf9f3e8577c75ff290495c5724c6
X-Patchwork-Hint: ignore
Message-Id: <20220502214851.1303984F0E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aenum: fix pyc compilation
 error
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

commit: https://git.buildroot.net/buildroot/commit/?id=d7db5af34f25cf9f3e8577c75ff290495c5724c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

_py2.py uses syntax not compatible with Python3. Remove _py2.py
to avoid the following compilation error:

error:   File "/usr/lib/python3.10/site-packages/aenum/_py2.py", line 5
    raise exc, None, tb
             ^
SyntaxError: invalid syntax

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-aenum/python-aenum.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 9a30211bb6..603fc66d0c 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -11,4 +11,12 @@ PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
 
+# _py2.py uses syntax not compatible with Python3.
+# Remove _py2.py to avoid compilation error.
+define PYTHON_AENUM_REMOVE_PY2_PY
+	rm $(@D)/aenum/_py2.py
+endef
+
+PYTHON_AENUM_POST_EXTRACT_HOOKS = PYTHON_AENUM_REMOVE_PY2_PY
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
