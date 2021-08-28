Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0452C433FE
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:32:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C4360F56
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95C4360F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 698BD42530;
	Sat,  4 Sep 2021 18:32:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSGUiewWyAyq; Sat,  4 Sep 2021 18:32:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B156F4044E;
	Sat,  4 Sep 2021 18:32:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 762661BF95F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE13C82A87
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S0jTXEyZBr7n for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 284BF81B60
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E53918834C; Sat,  4 Sep 2021 18:23:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 15:56:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc5e056508fba8b7561dcbe2a76cdacef8619a2a
X-Git-Newrev: 0fe536b797cc0ae11bd54ed7046cd39b73780c18
X-Patchwork-Hint: ignore
Message-Id: <20210904182355.E53918834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fakedate: avoid recursion if not
 first in the PATH
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0fe536b797cc0ae11bd54ed7046cd39b73780c18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With BR2_REPRODUCIBLE, our 'fakedate' wrapper script will end up in
host/bin/date. Currently, it iterates over all the 'date' found in PATH,
until it finds one that is not the script itself, in an attempt to avoid
infinite recursion by calling itself again and again.

This heuristic works OK in Buildroot, because host/bin/ is first in the
PATH, and so that means the first entry in the PATH is skipped.

However, this is going to fail as soon as our wrapper is not the first
in the PATH. Indeed, in that situation, the current heuristic will stop
on the first 'date' in the PATH, as it is not the script itself, and
since our script was executed, that probably means the first 'date' was
itself a wrapper that ended up calling us. So, calling it again will
eventually trickle to calling us again, and thus creating the loop our
heuristic was made to avoid.

This situation currently does not occur in Buildroot, because host/bin/
is first, *and* we have no package that provide their own 'date' wrapper
during their build steps.

But when we generate an SDK with BR2_REPRODUCIBLE, then our wrapper
script will be in sdk/bin/, and there is no longer any guarantee this
comes first in the PATH, thus opening the possibility that another
buildsystem based on our SDK, but which has its own 'date' wrapper, will
trigger this infinite recursion.

We fix that by iterating, in reverse order, over all the 'date' we can
find in PATH, and when we find ourselves, then we know the one we found
in the iteration just before is the one that we should call.

'which -a' is old enough that we can expect it to be always available;
it has been present at least since Debian Squeeze, released 2011.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/fakedate/fakedate | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
index a64d9b9cdf..9bef113357 100755
--- a/package/fakedate/fakedate
+++ b/package/fakedate/fakedate
@@ -19,15 +19,13 @@
 #
 
 DATE_BIN=false
-# Do not call `date' directly since it will produce an infinite recursion.
-# Instead, find path of true `date' binary.
-for P in `echo $PATH | tr ':' ' '`; do
-    if [ -x "$P/date" ]; then
-        if ! [ "$P/date" -ef "$0" ]; then
-            DATE_BIN="$P/date"
-            break;
-        fi
+# Do not call any 'date' before us in the PATH, or that would create
+# an infinite recursion.
+for date in $(which -a date |tac); do
+    if [ "${date}" -ef "$0" ]; then
+        break
     fi
+    DATE_BIN="${date}"
 done
 
 if [ -n "$SOURCE_DATE_EPOCH" ]; then
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
