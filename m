Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AA4C433F5
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6BC460AA9;
	Fri, 14 Jan 2022 16:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rst-8Y-VwXAz; Fri, 14 Jan 2022 16:49:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C46B960B5E;
	Fri, 14 Jan 2022 16:49:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D0E641BF362
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B925683EF6
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0yx2KljBNjTn for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:49:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E958383EF1
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:49:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B917883487; Fri, 14 Jan 2022 16:42:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:35:20 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: b05f64c4777c7233578eb06f8565ae432e3590f7
X-Git-Newrev: a86d297ba09061051d54cf859b194054afd26ba8
X-Patchwork-Hint: ignore
Message-Id: <20220114164245.B917883487@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] utils/getdeveloperlib.py:
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

commit: https://git.buildroot.net/buildroot/commit/?id=a86d297ba09061051d54cf859b194054afd26ba8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

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
index f2b36862e3..c05e1f888b 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -253,6 +253,8 @@ def parse_developers():
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
