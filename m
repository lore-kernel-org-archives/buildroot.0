Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0796CA1015
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 647B260782;
	Thu,  4 Sep 2025 16:34:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCiG2goF0F72; Thu,  4 Sep 2025 16:34:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C68C460766
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C68C460766;
	Thu,  4 Sep 2025 16:34:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C7B9106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71D6B60635
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id czd-W5Bay_EH for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA33A60638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA33A60638
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A841F87F4B; Thu,  4 Sep 2025 16:33:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:11:19 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 3fc2f3d0e274b6fe4030d87a9ffe4d8ec77668b6
X-Git-Newrev: 6feab5ce60ec2424a35b67ad7553a255cbfd95f2
X-Patchwork-Hint: ignore
Message-Id: <20250904163335.A841F87F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 support/misc/gitlab-ci.yml.in: check legal-info in run_make
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6feab5ce60ec2424a35b67ad7553a255cbfd95f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The script "utils/test-pkg" is systematically checking legal-info.
See [1]. This is useful to check all license hashes are up to date.

The Buildroot Gitlab CI integration has an identical testing
capability. It is faster because it can run all supported toolchain
test builds in parallel. See [2].

It was observed in [3] that the Gitlab CI test-pkg variant does not
check legal-info.

This commit align the Gitlab CI test-pkg behavior to the
"utils/test-pkg" script by adding legal-info in the run_make command
targets. Doing so checks legal-info in test-pkg cases, but also in
defconfigs (this was suggested by Arnout in [4]).

[1] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/utils/test-pkg#L195
[2] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.05/support/misc/gitlab-ci.yml.in#L129
[3] https://lore.kernel.org/buildroot/75e688887d95948c57a11416de3047b5@free.fr/
[4] https://lore.kernel.org/buildroot/614bec7e-0723-4bbd-8c3a-c801e91c29c3@rnout.be/T/#mcc803eeb38d09c1cc02b1333720845c54af86534

Cc: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit c84762675c760c471f09244cca87067ef43e545f)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 support/misc/gitlab-ci.yml.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index db206432aa..ada36d0d60 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -45,7 +45,7 @@ before_script:
 
 .run_make: &run_make
     |
-      make O=${OUTPUT_DIR} > >(tee build.log |grep '>>>') 2>&1 || {
+      make O=${OUTPUT_DIR} world legal-info > >(tee build.log |grep '>>>') 2>&1 || {
           echo 'Failed build last output'
           tail -200 build.log
           exit 1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
