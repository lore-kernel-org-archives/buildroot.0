Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8C2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 18:26:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE23E60B1D;
	Sun, 13 Mar 2022 18:26:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IifJGNjxS_3e; Sun, 13 Mar 2022 18:26:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30DB4606CB;
	Sun, 13 Mar 2022 18:26:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5F571BF41C
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 18:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2E8481447
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 18:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tE5Ir_gQ2z2V for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 18:26:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5164B8140E
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 18:26:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3436682A35; Sun, 13 Mar 2022 18:17:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 19:24:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 280da9f2f46c736911b156dafdfb667951788edd
X-Git-Newrev: 2b09e05b5831541e19eb8a6cbaf216bfe08f6c8f
X-Patchwork-Hint: ignore
Message-Id: <20220313181742.3436682A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/scanpypi: support alternative
 Homepage format
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b09e05b5831541e19eb8a6cbaf216bfe08f6c8f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some packages only have a home page properly set inside project_urls.

Squelch flake8's E127, because a visual indent here is really nicer.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: simplify getting home_page fallbacks]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 utils/scanpypi | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 17d8a0017a..cc13701c0e 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -609,7 +609,8 @@ class BuildrootPackage():
 
         lines.append('\thelp\n')
 
-        help_lines = textwrap.wrap(self.metadata['info']['summary'], 62,
+        md_info = self.metadata['info']
+        help_lines = textwrap.wrap(md_info['summary'], 62,
                                    initial_indent='\t  ',
                                    subsequent_indent='\t  ')
 
@@ -617,11 +618,15 @@ class BuildrootPackage():
         if help_lines[-1][-1] != '.':
             help_lines[-1] += '.'
 
-        # \t + two spaces is 3 char long
-        help_lines.append('')
-        help_lines.append('\t  ' + self.metadata['info']['home_page'])
-        help_lines = [x + '\n' for x in help_lines]
-        lines += help_lines
+        home_page = md_info.get('home_page', None) or \
+                    md_info.get('project_urls', {}).get('Homepage', None)  # noqa: E127
+
+        if home_page:
+            # \t + two spaces is 3 char long
+            help_lines.append('')
+            help_lines.append('\t  ' + home_page)
+            help_lines = [x + '\n' for x in help_lines]
+            lines += help_lines
 
         with open(path_to_config, 'w') as config_file:
             config_file.writelines(lines)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
