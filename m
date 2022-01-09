Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC92C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:06:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 003EC82410;
	Sun,  9 Jan 2022 22:06:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RbKEzQX_Xjqu; Sun,  9 Jan 2022 22:06:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50A5A81A27;
	Sun,  9 Jan 2022 22:05:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8C8F1BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C16D140368
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:05:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9sfAzXK7We7 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:05:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66A7F4010E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:05:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 06D9F80250; Sun,  9 Jan 2022 21:59:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 9 Jan 2022 23:01:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f81242ae4fb64ab85af5d38e70246222276552ae
X-Git-Newrev: f35a4b4ae22046fb04edc165edbb27ee5439aa4b
X-Patchwork-Hint: ignore
Message-Id: <20220109215941.06D9F80250@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/check-package: add a check for the
 new spacing convention
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

commit: https://git.buildroot.net/buildroot/commit/?id=f35a4b4ae22046fb04edc165edbb27ee5439aa4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The seperation of the fields in the hash file should be 2 spaces for
consistency.

Since a large number of hash files still violate this rule, exclude it
from "make check-package" (and thus from CI).

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Arnout:
 - Move it to a separate class, so it can be excluded.
 - Exclude it from "make check-package"
]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                          |  2 +-
 utils/checkpackagelib/lib_hash.py | 16 ++++++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3099d35158..5fc7137e5a 100644
--- a/Makefile
+++ b/Makefile
@@ -1258,7 +1258,7 @@ check-flake8:
 
 check-package:
 	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
-		-exec ./utils/check-package --exclude=Sob {} +
+		-exec ./utils/check-package --exclude=Sob --exclude=HashSpaces {} +
 
 include docs/manual/manual.mk
 -include $(foreach dir,$(BR2_EXTERNAL_DIRS),$(sort $(wildcard $(dir)/docs/*/*.mk)))
diff --git a/utils/checkpackagelib/lib_hash.py b/utils/checkpackagelib/lib_hash.py
index 3e381119a5..698d24fd6b 100644
--- a/utils/checkpackagelib/lib_hash.py
+++ b/utils/checkpackagelib/lib_hash.py
@@ -53,3 +53,19 @@ class HashType(_CheckFunction):
                     .format(self.filename, lineno, self.url_to_manual),
                     text,
                     "expected {} hex digits".format(self.len_of_hash[htype])]
+
+
+class HashSpaces(_CheckFunction):
+    def check_line(self, lineno, text):
+        if _empty_line_or_comment(text):
+            return
+
+        fields = text.split()
+        if len(fields) != 3:
+            # Handled by HashNumberOfFields
+            return
+
+        if not re.match(re.escape("{}  {}  {}".format(*fields)), text):
+            return ["{}:{}: separation does not match expectation "
+                    "({}#adding-packages-hash)"
+                    .format(self.filename, lineno, self.url_to_manual), text]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
