Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B15C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 937B841C41;
	Wed,  3 Aug 2022 16:36:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 937B841C41
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e1KnzXfPwBFz; Wed,  3 Aug 2022 16:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4239E40354;
	Wed,  3 Aug 2022 16:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4239E40354
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F06D1BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38FCD608B7
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38FCD608B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8p1gZSzBxdV1 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:36:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 763B160A6D
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:36:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 763B160A6D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 01A7D86D7B; Wed,  3 Aug 2022 16:22:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Aug 2022 18:35:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: af8a75fa0d65923b70c5fbcea4f00fb72c4860a6
X-Git-Newrev: 08c78cf315d3770a1df30be58b9c246dfc67252a
X-Patchwork-Hint: ignore
Message-Id: <20220803162232.01A7D86D7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing/tests/test_python_scipy:
 add scipy::io module testing
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

commit: https://git.buildroot.net/buildroot/commit/?id=08c78cf315d3770a1df30be58b9c246dfc67252a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Test the scipy::io module, to demonstrate that runtime dependencies
are correct.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/sample_python_scipy.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/sample_python_scipy.py b/support/testing/tests/package/sample_python_scipy.py
index df0c7ce5fe..d36f2273e7 100644
--- a/support/testing/tests/package/sample_python_scipy.py
+++ b/support/testing/tests/package/sample_python_scipy.py
@@ -1,4 +1,5 @@
 import numpy
+import scipy.io
 import scipy.special
 import scipy.integrate
 
@@ -10,3 +11,6 @@ assert(com == 15.0)
 
 t = scipy.integrate.trapezoid([5,8,10])
 assert(t == 15.5)
+
+mdic = {"t": t, "label": "example"}
+scipy.io.savemat("example.mat", mdic)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
