Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3D48ECAAD8
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 19:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A89E60ADF;
	Mon, 29 Aug 2022 19:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A89E60ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6gHA_pl6xB0v; Mon, 29 Aug 2022 19:14:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AB1260AC3;
	Mon, 29 Aug 2022 19:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AB1260AC3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 634D91BF379
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 19:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4BC0E401AE
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 19:14:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BC0E401AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tx-Znn5kmUXY for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 19:14:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCF5740198
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 19:14:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCF5740198
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1070D87F67; Mon, 29 Aug 2022 18:59:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Aug 2022 21:14:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed22879d309699156dff4126c51f25818cdf0621
X-Git-Newrev: 5894ab010771d8ee638ee2f7d84284200cdbbac3
X-Patchwork-Hint: ignore
Message-Id: <20220829185953.1070D87F67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: ensure pyc embed rooted
 paths
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

commit: https://git.buildroot.net/buildroot/commit/?id=5894ab010771d8ee638ee2f7d84284200cdbbac3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To report usable tracebacks, pyc files embed the path of the original py
files, so that users can more easily try and debug the reported issue.

We generate the pyc files by calling the python3-supplied compileall
script, to scan the directory where python modules are installed. Since
this is done on the build machine, we tell compileall.py to strip away
the TARGET_DIR prefix, as that has no meaning at runtime.

However, compileall.py forgets [0] to keep a leading / in the front of
the paths, thus generating non-rooted paths., e.g.:
     /path/buildroot.ouput/targt/usr/lib/python3.10/argparse.py
gets embedded as:
     usr/lib/python3.10/argparse.py

This is a bit confusing but, as far as we could see, should be mostly be
used for display purposes in tracebacks, and does not seem to impact
actual functionality.

We fix that by instructing compileall.py that the embedded paths should
be rooted to / which generates proper paths in tracebacks.

And alternate solution would be to swith gears, and tell compileall.py
exactly the resulting runtime "base" directory, which replaces the
stripping and prefixing; i.e. it's either:
    -s $(TARGET_DIR) -p /
or
    -d /usr/lib/python$(PYTHON3_MAJOR_VERSION)

We choose to keep the first solution, because that is semantically what
we really want to do: to strip the leading build-time path, rather than
to force anything.

Note: the python test-suite was executed with both solutions (in a
pyc-only setup), and the results were exactly the same; so in practice,
-d or -s+-p yield the same results.

Many thanks go to Vincent for reporting the issue and suggesting the
solutions.

[0] Not sure whether this is a bug or a feature...

Reported-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 9af384712a..a9821d9a33 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -255,6 +255,7 @@ define PYTHON3_CREATE_PYC_FILES
 		$(if $(VERBOSE),,-q) \
 		$(if $(BR2_PACKAGE_PYTHON3_PYC_ONLY),-b) \
 		-s $(TARGET_DIR) \
+		-p / \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
