Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C82C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 14:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2DEB40448;
	Fri, 14 Jan 2022 14:54:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kh4tyaOzUPXh; Fri, 14 Jan 2022 14:54:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A1CD40503;
	Fri, 14 Jan 2022 14:54:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5059D1BF3E5
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 14:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D71D401B2
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 14:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVwhLkIG876R for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 14:54:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59E4B400E9
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 14:54:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5535983566; Fri, 14 Jan 2022 14:47:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 15:35:05 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: f0f648eb6bf3602d9e34691bea43cd6fae1eb40f
X-Git-Newrev: 0fa9874a4a82fc0e3ba655c2b3a1be5f6d6b8ee2
X-Patchwork-Hint: ignore
Message-Id: <20220114144752.5535983566@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] utils/scanpypi: fix
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

commit: https://git.buildroot.net/buildroot/commit/?id=0fa9874a4a82fc0e3ba655c2b3a1be5f6d6b8ee2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
