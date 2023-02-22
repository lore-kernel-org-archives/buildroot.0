Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB28C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 17:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2DC741755;
	Wed, 22 Feb 2023 17:11:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2DC741755
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ko7KunHXMC6o; Wed, 22 Feb 2023 17:11:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CA6241756;
	Wed, 22 Feb 2023 17:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA6241756
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B49B31BF364
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C9A560B4D
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 17:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C9A560B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpegrdbRAwhx for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79F7D61159
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79F7D61159
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69B09867CA; Wed, 22 Feb 2023 17:08:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:37:09 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 2759b8a3081e806c10b3c2ff7f04efcdef8a8212
X-Git-Newrev: feebcb90a245e9293b1eb50f3aed64e9d1574134
X-Patchwork-Hint: ignore
Message-Id: <20230222170818.69B09867CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 support/scripts/generate-gitlab-ci-yml: improve test-pkg support
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

commit: https://git.buildroot.net/buildroot/commit/?id=feebcb90a245e9293b1eb50f3aed64e9d1574134
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Following the example of test-pkg config described in commit
"12c7a05da1 utils/test-pkg: add gitlab-ci support" to test a defconfig
fragment that contains a disabled option is currently possible, but
it do requires one to change the git config core.commentChart so the
lines starting with "#" are not discarded by git when creating/editing
the commit message.

For instance, without the indentation the 3rd line below would be
excluded from the commit message when the editor is closed:
    test-pkg config:
    SOME_OPTION=y
    # OTHER_OPTION is not set
    SOME_VARIABLE="some value"

Requiring to change git configs is not very nice.
So make the developer's life easier by changing the sed expression to
remove indentation with spaces from a defconfig fragment found on a
commit message.
For instance these lines become valid and generate a defconfig fragment
without the indentation of one space to be tested in GitLab CI:
test-pkg config:
 SOME_OPTION=y
 # OTHER_OPTION is not set
 SOME_VARIABLE="some value"

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 0ad3ae14c52ed0aac872875ca7f87cdcf6942128)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/generate-gitlab-ci-yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/generate-gitlab-ci-yml b/support/scripts/generate-gitlab-ci-yml
index aa43aac019..27f586f1b6 100755
--- a/support/scripts/generate-gitlab-ci-yml
+++ b/support/scripts/generate-gitlab-ci-yml
@@ -91,7 +91,7 @@ gen_tests() {
 
     # Retrieve defconfig for test-pkg from the git commit message (if any)
     if grep -q -E '^test-pkg config:$' <<<"${CI_COMMIT_DESCRIPTION}"; then
-        sed -r -n -e '/^test-pkg config:$/{:a;n;p;ba;}' \
+        sed -r -n -e '/^test-pkg config:$/{:a;n;s/^ +//;p;ba;}' \
             <<<"${CI_COMMIT_DESCRIPTION}" \
             >defconfig.frag
         if [ ! -s defconfig.frag ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
