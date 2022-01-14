Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1048C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3350F401C5;
	Fri, 14 Jan 2022 16:49:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mfx2syTs0aEb; Fri, 14 Jan 2022 16:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F41E4015E;
	Fri, 14 Jan 2022 16:49:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 93B811BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:49:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B5B8415AB
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:49:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUI2mFyUMA1p for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:49:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9164141588
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:49:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5E57E82B9A; Fri, 14 Jan 2022 16:42:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:36:47 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1f67a4dc06559f77b3c505f3e81168090b0aeb2b
X-Git-Newrev: c062ff23f231c8d8e14b9168841e532768a382ec
X-Patchwork-Hint: ignore
Message-Id: <20220114164237.5E57E82B9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] utils/getdeveloperlib.py:
 fix developer being reported for unrelated path
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

commit: https://git.buildroot.net/buildroot/commit/?id=c062ff23f231c8d8e14b9168841e532768a382ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Currently, by following the instructions in the manual and querying for
developers for a patch that changes path
package/foobar
the script reports both developers that have these entries in the
DEVELOPERS file:
F:	package/foo/
F:	package/foobar/

Starting from commit "afc112b0e4 utils/getdeveloperlib.py: fix issue
with hasfile()" get-developers script uses os.path.abspath() and
os.path.relpath().
The catch is that those functions return the absolute path and the
relative path without the trailing slash.

When the paths associated to a developer are then compared to the paths
a patch touches, using the string.startswith(), any substring returns
True, leading to developers for package/foo/ being wrongly reported
for package/foobar/ .

Fix this by re-adding the trailing slash after using relpath().

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Cc: James Knight <james.d.knight@live.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 29bb478a49712dfa8ec25262cac77b7c8ff1e51f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/getdeveloperlib.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index e686bc793f..2575c87a36 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -254,6 +254,8 @@ def parse_developers():
                 for f in dev_files:
                     dev_file = os.path.relpath(f, brpath)
                     dev_file = dev_file.replace(os.sep, '/')  # force unix sep
+                    if f[-1] == '/':  # relpath removes the trailing /
+                        dev_file = dev_file + '/'
                     files.append(dev_file)
             elif line == "":
                 if not name:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
