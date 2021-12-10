Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F816C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Dec 2021 19:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CA3DE412D2;
	Fri, 10 Dec 2021 19:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Flf3iyphm7XP; Fri, 10 Dec 2021 19:13:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D18FE412D3;
	Fri, 10 Dec 2021 19:13:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C14F1BF3D4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8DF7426E4
 for <buildroot@lists.busybox.net>; Fri, 10 Dec 2021 19:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BwpBfGy-hS3l for <buildroot@lists.busybox.net>;
 Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 236F7426E8
 for <buildroot@buildroot.org>; Fri, 10 Dec 2021 19:12:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6393F8251C; Fri, 10 Dec 2021 19:07:13 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Fri, 10 Dec 2021 20:01:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c06bed7296faaf856895dad4b6b20d0fb66fae39
X-Git-Newrev: 5bbedea9c2317bfb04d1efd5fb157e725e86c2fb
X-Patchwork-Hint: ignore
Message-Id: <20211210190713.6393F8251C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/checkpackagelib/lib_mk.py: fix check
 for overridden variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bbedea9c2317bfb04d1efd5fb157e725e86c2fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 utils/checkpackagelib/lib_mk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/checkpackagelib/lib_mk.py b/utils/checkpackagelib/lib_mk.py
index a304f71fd5..88e4b15c7c 100644
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
