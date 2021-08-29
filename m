Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA677C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 10:41:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAFF060F35
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 10:41:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EAFF060F35
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2A1F80EC3;
	Sun, 29 Aug 2021 10:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZfCEO8Tl8bYK; Sun, 29 Aug 2021 10:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B685A80F3E;
	Sun, 29 Aug 2021 10:41:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 842471BF336
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 10:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F7F7400DA
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 10:41:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pT-4hqrpKIpM for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 10:41:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 804BC4017C
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 10:41:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id ED0D087307; Sun, 29 Aug 2021 10:40:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 11:37:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 040f75aa06829595ef8f3d9dea9382ba152ee34e
X-Git-Newrev: 1259d40b0ab2d436fad088f4b9288b9899ef19a4
X-Patchwork-Hint: ignore
Message-Id: <20210829104017.ED0D087307@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] support/testing/infra: add
 log_file_path() function
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

commit: https://git.buildroot.net/buildroot/commit/?id=1259d40b0ab2d436fad088f4b9288b9899ef19a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Some tests will need to grep through the build log to verify that some
features are working are expected. In order to allow them to open the
build log, we provide a new function called log_file_path(), which
returns the path to the log file if available.

We also use this function in open_log_file().

Note that open_log_file() cannot be used directly to grep through the
log file at the end of a build: because it opens in "a+" mode, it
greps starting from the end of the file.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/testing/infra/__init__.py | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/support/testing/infra/__init__.py b/support/testing/infra/__init__.py
index b10a7601a3..1f003f24c6 100644
--- a/support/testing/infra/__init__.py
+++ b/support/testing/infra/__init__.py
@@ -10,17 +10,18 @@ ARTIFACTS_URL = "http://autobuild.buildroot.net/artefacts/"
 BASE_DIR = os.path.realpath(os.path.join(os.path.dirname(__file__), "../../.."))
 
 
+def log_file_path(builddir, stage, logtofile=True):
+    """Return path to log file"""
+    return "{}-{}.log".format(builddir, stage) if logtofile else None
+
+
 def open_log_file(builddir, stage, logtofile=True):
     """
     Open a file for logging and return its handler.
     If logtofile is True, returns sys.stdout. Otherwise opens a file
     with a suitable name in the build directory.
     """
-    if logtofile:
-        fhandle = open("{}-{}.log".format(builddir, stage), 'a+')
-    else:
-        fhandle = sys.stdout
-    return fhandle
+    return open(log_file_path(builddir, stage, logtofile), 'a+') if logtofile else sys.stdout
 
 
 def basepath(relpath=""):
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
