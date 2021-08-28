Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B153C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:00:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07CD6608FB
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07CD6608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C80CE4012B;
	Sat, 28 Aug 2021 14:00:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h4FyeJ8mhU2n; Sat, 28 Aug 2021 14:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF1034012E;
	Sat, 28 Aug 2021 14:00:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B4DEC1BF30D
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:00:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A34554276C
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:00:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8j6Ka0gh8JuH for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:00:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A44EE426D6
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:00:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2268382DB5; Sat, 28 Aug 2021 13:59:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 15:56:52 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc5e056508fba8b7561dcbe2a76cdacef8619a2a
X-Git-Newrev: 0fe536b797cc0ae11bd54ed7046cd39b73780c18
X-Patchwork-Hint: ignore
Message-Id: <20210828135901.2268382DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fakedate: avoid
 recursion if not first in the PATH
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fe536b797cc0ae11bd54ed7046cd39b73780c18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
