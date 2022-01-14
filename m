Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851ADC433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E8C184B82;
	Fri, 14 Jan 2022 16:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeHOC0p26_Sb; Fri, 14 Jan 2022 16:19:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96678831D6;
	Fri, 14 Jan 2022 16:19:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC2CC1BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89C37831D6
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ly0KV03FHvLO for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:18:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DB28984BA1
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B5EFC83487; Fri, 14 Jan 2022 16:11:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:04:50 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: a0fd2911938ff2a56df3214491b96c0d8fece89c
X-Git-Newrev: 816b35a37ec96639dd61f54ab1017d1cefd72809
X-Patchwork-Hint: ignore
Message-Id: <20220114161146.B5EFC83487@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=816b35a37ec96639dd61f54ab1017d1cefd72809
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
