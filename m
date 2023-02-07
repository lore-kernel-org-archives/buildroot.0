Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E10C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FBF361060;
	Tue,  7 Feb 2023 22:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FBF361060
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hAOuwipouz8r; Tue,  7 Feb 2023 22:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95EE661065;
	Tue,  7 Feb 2023 22:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95EE661065
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32F381BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CD6B40B48
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:04:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CD6B40B48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wUnJfWRTQCKE for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:03:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96C5C40B46
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:03:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C5C40B46
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83F32843E7; Tue,  7 Feb 2023 22:03:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 7 Feb 2023 23:03:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8c8ee42bbe6ebb7f20978b06a581c42733197ae2
X-Git-Newrev: f229564c36ec64c1f1292b7281ae0bd33840d7a4
X-Patchwork-Hint: ignore
Message-Id: <20230207220358.83F32843E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/dependencies/dependencies.sh:
 ensure git is >= 2.0.0 for vendoring
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f229564c36ec64c1f1292b7281ae0bd33840d7a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
---
 support/dependencies/dependencies.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 0aa5e59274..cf6635bff6 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -174,6 +174,16 @@ for prog in perl tar wget cpio unzip rsync bc cmp find xargs ${DL_TOOLS} ; do
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
