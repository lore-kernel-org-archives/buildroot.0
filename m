Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F86C433EF
	for <buildroot@archiver.kernel.org>; Fri, 14 Jan 2022 16:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 770B6606D3;
	Fri, 14 Jan 2022 16:49:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dqoMUCm7gimH; Fri, 14 Jan 2022 16:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC8BA60B66;
	Fri, 14 Jan 2022 16:49:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCF981C115D
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C94494015E
 for <buildroot@lists.busybox.net>; Fri, 14 Jan 2022 16:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FhTXl4OM4K9g for <buildroot@lists.busybox.net>;
 Fri, 14 Jan 2022 16:49:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F077A40130
 for <buildroot@buildroot.org>; Fri, 14 Jan 2022 16:49:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C0A94835C0; Fri, 14 Jan 2022 16:42:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 17:40:36 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: a86d297ba09061051d54cf859b194054afd26ba8
X-Git-Newrev: 3b950f813282b65de014ea3042c569500eee3687
X-Patchwork-Hint: ignore
Message-Id: <20220114164245.C0A94835C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x]
 support/scripts/pkg-stats: Don't print directory in 'make' call
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b950f813282b65de014ea3042c569500eee3687
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

It is possible that some users of buildroot have put it in a repository
and call into it from another Makefile such as:
.DEFAULT:
	$(MAKE) O=$(abspath $(O)) -C buildroot $(@)

This technique works well except that Make tells us that it changes into
the buildroot directory:
make[1]: Entering directory 'buildroot'

Because this line doesn't have an equals within it, python raises a
ValueError exception within pkg-stats.

This patch has python tell the invoked make not to print directories

Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit c988867fd2c72fe5abeb63c4abe92f10eea6499d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/pkg-stats | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index 3992c8312a..a435abff3d 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -375,7 +375,8 @@ def get_config_packages():
 
 def package_init_make_info():
     # Fetch all variables at once
-    variables = subprocess.check_output(["make", "BR2_HAVE_DOT_CONFIG=y", "-s", "printvars",
+    variables = subprocess.check_output(["make", "--no-print-directory", "-s",
+                                         "BR2_HAVE_DOT_CONFIG=y", "printvars",
                                          "VARS=%_LICENSE %_LICENSE_FILES %_VERSION %_IGNORE_CVES %_CPE_ID"])
     variable_list = variables.decode().splitlines()
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
