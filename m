Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED010C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 14:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C62A41686;
	Fri, 14 Jan 2022 14:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XoI8dQEd4gQe; Fri, 14 Jan 2022 14:54:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1F87416B1;
	Fri, 14 Jan 2022 14:54:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 906F71BF3E5
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 14:54:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7ED984165E
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 14:54:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s0vcdlsw1O4W for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 14:54:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8D9C41580
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 14:54:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D03FF83566; Fri, 14 Jan 2022 14:47:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 15:35:16 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 095ba6763a9516158924d969276c131736148518
X-Git-Newrev: de4e10e8d16c2eebb302954ba44609c6ff4ee279
X-Patchwork-Hint: ignore
Message-Id: <20220114144745.D03FF83566@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] utils/scanpypi: fix
 buildutils check in python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=de4e10e8d16c2eebb302954ba44609c6ff4ee279
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The message attribute does not exist in python3, see PEP-0352:
https://www.python.org/dev/peps/pep-0352/

Fixes:
Traceback (most recent call last):
  File "utils/scanpypi", line 743, in <module>
    main()
  File "utils/scanpypi", line 693, in main
    if 'buildutils' in err.message:
AttributeError: 'ImportError' object has no attribute 'message'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c3029878c5efa28eff793405095fe64327c15ad5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 1f3326cf4d..17d8a0017a 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -690,7 +690,7 @@ def main():
             try:
                 package.load_setup()
             except ImportError as err:
-                if 'buildutils' in err.message:
+                if 'buildutils' in str(err):
                     print('This package needs buildutils')
                 else:
                     raise
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
