Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0263C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 07:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9D6B42ACF;
	Sat, 28 May 2022 07:10:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m8Fl2e6kqOzX; Sat, 28 May 2022 07:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B36842AD2;
	Sat, 28 May 2022 07:10:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9274D1BF2C4
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42AC5429F1
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 07:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhFmiNiV2_87 for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61A8F42A03
 for <buildroot@buildroot.org>; Sat, 28 May 2022 07:08:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 56C1583C8F; Sat, 28 May 2022 06:57:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 08:49:50 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: de6c8e584f623fc4bbda89d819fab5bb0b2a57a8
X-Git-Newrev: b59bd92a5cedb5832cbcf69be338ed814b2ceb84
X-Patchwork-Hint: ignore
Message-Id: <20220528065730.56C1583C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/python-aenum: fix
 pyc compilation error
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

commit: https://git.buildroot.net/buildroot/commit/?id=b59bd92a5cedb5832cbcf69be338ed814b2ceb84
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

_py2.py uses syntax not compatible with Python3. Remove _py2.py
to avoid the following compilation error:

error:   File "/usr/lib/python3.10/site-packages/aenum/_py2.py", line 5
    raise exc, None, tb
             ^
SyntaxError: invalid syntax

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit d7db5af34f25cf9f3e8577c75ff290495c5724c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
