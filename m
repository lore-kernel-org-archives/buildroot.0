Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E57C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 16:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E98611BA;
	Tue, 28 Feb 2023 16:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E98611BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LMosoqQPEPIT; Tue, 28 Feb 2023 16:00:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4138F611BF;
	Tue, 28 Feb 2023 16:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4138F611BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0CD291BF20F
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7EB6418AD
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 15:59:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7EB6418AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytOCado5wQJE for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76095418CC
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76095418CC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C38D86D0D; Tue, 28 Feb 2023 15:59:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 16:52:38 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: ace092f8f372c6e68a05e93ca24831e0af73e8ba
X-Git-Newrev: ff9115673eb413e300aa7cb7e868413489d9024a
X-Patchwork-Hint: ignore
Message-Id: <20230228155909.5C38D86D0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 support/dependencies/dependencies.sh: ensure git is >= 2.0.0 for vendoring
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff9115673eb413e300aa7cb7e868413489d9024a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The go vendoring fails on CentOS 7 (which uses git 1.8.3.1) with errors
related to shallow clones:

make docker-compose-source
..
go: downloading github.com/matttproud/golang_protobuf_extensions v1.0.4
github.com/docker/compose/v2/pkg/mocks imports
        github.com/theupdateframework/notary/client imports
        github.com/docker/go/canonical/json: github.com/docker/go@v1.5.1-1.0.20160303222718-d30aec9fd63c: invalid pseudo-version: git fetch --unshallow -f origin in /home/jacmet/source/buildroot-mirror/output/host/share/go-path/pkg/mod/cache/vcs/48fbd2dfabec81f4c93170677bfc89087d4bec07a2d08f6ca5ce3d17962677ee: exit status 128:
        fatal: git fetch-pack: expected shallow list
make[1]: *** [/home/jacmet/source/buildroot-mirror/output/build/docker-compose-2.15.1/.stamp_downloaded] Error 1

It works with git 2.0.0 (released May 2014, included in Debian 8), so check
for >= 2.0.0 with logic similar to the GNU patch version check.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f229564c36ec64c1f1292b7281ae0bd33840d7a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/dependencies/dependencies.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 3822f0ca0e..89ed3c9df9 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -183,6 +183,16 @@ for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
 			echo "  xargs is usually part of the findutils package in your distribution"
 		fi
 	fi
+
+	# we need git >= 2.0.0 for shallow clones / vendoring
+	if test $prog = "git" ; then
+		GIT_VERSION="$(git --version | sed -n 's/^git version \(.*\)/\1/p')"
+		GIT_MAJOR="$(echo "${GIT_VERSION}" | cut -d . -f 1)"
+		if [ "${GIT_MAJOR}" -lt 2 ]; then
+			echo "You have git '${GIT_VERSION}' installed. Git >= 2.0.0 is required"
+			exit 1
+		fi
+	fi
 done
 
 if test "${missing_progs}" = "yes" ; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
