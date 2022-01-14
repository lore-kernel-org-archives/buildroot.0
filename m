Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432A2C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E65C6404C0;
	Fri, 14 Jan 2022 16:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oTGdsFF-pRNt; Fri, 14 Jan 2022 16:20:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A28D240500;
	Fri, 14 Jan 2022 16:20:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C6B651BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21DDA60806
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTJmhYU22dx2 for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:18:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65BD660709
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:18:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 41D87835A7; Fri, 14 Jan 2022 16:11:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:04:59 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 3472ab96734a7f7e43d07117f947cade9cad0f5e
X-Git-Newrev: 56e7d20666934352074ddf5db48acf8627829278
X-Patchwork-Hint: ignore
Message-Id: <20220114161151.41D87835A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 utils/checkpackagelib/lib_mk.py: fix check for overridden variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=56e7d20666934352074ddf5db48acf8627829278
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Currently this .mk snippet results in unexpected behavior from
check-package:
|VAR_1 = VALUE1
|ifeq (condition)
|VAR_1 := $(VAR_1), VALUE2
|endif

Fix commit "163f160a8e utils/{check-package, checkpackagelib}:
consistently use raw strings for re.compile" that ended up doing this:
-    CONCATENATING = re.compile("^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
+    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")

But raw strings do not expect escaping when referencing \1 and the
pattern ends up searching for a raw '\\1' instead of an occurrence of
the first pattern inside parenthesis.

|$ python3
|Python 3.8.10 (default, Sep 28 2021, 16:10:42)
|[GCC 9.3.0] on linux
|Type "help", "copyright", "credits" or "license" for more information.
|>>> import re
|>>> p1 = re.compile('(foo)bar\\1')
|>>> p2 = re.compile(r'(foo)bar\\1')
|>>> p3 = re.compile(r'(foo)bar\1')
|>>> s1 = 'foobarfoo'
|>>> s2 = 'foobar\\1'
|>>> print(p1.search(s1))
|<re.Match object; span=(0, 9), match='foobarfoo'>
|>>> print(p2.search(s1))
|None
|>>> print(p3.search(s1))
|<re.Match object; span=(0, 9), match='foobarfoo'>
|>>> print(p1.search(s2))
|None
|>>> print(p2.search(s2))
|<re.Match object; span=(0, 8), match='foobar\\1'>
|>>> print(p3.search(s2))
|None
|>>>

So use '\1' instead of '\\1' in the raw string.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5bbedea9c2317bfb04d1efd5fb157e725e86c2fb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/checkpackagelib/lib_mk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index 0278354434..572fe75990 100644
--- a/utils/checkpackagelib/lib_mk.py
+++ b/utils/checkpackagelib/lib_mk.py
@@ -77,7 +77,7 @@ class Indent(_CheckFunction):
 
 
 class OverriddenVariable(_CheckFunction):
-    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\\1\)")
+    CONCATENATING = re.compile(r"^([A-Z0-9_]+)\s*(\+|:|)=\s*\$\(\1\)")
     END_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(end_conditional)))
     OVERRIDING_ASSIGNMENTS = [':=', "="]
     START_CONDITIONAL = re.compile(r"^\s*({})".format("|".join(start_conditional)))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
