Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7438C636D6
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 17:00:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221BB4159C;
	Tue,  7 Feb 2023 17:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 221BB4159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R-6avE4luoPg; Tue,  7 Feb 2023 17:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE73C418BD;
	Tue,  7 Feb 2023 17:00:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE73C418BD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2499A1BF5F8
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F24B581E27
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 17:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F24B581E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NFwphFbcK-pQ for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 17:00:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C705081E19
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C705081E19
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 17:00:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5F97FC000F;
 Tue,  7 Feb 2023 17:00:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pPRKm-00EhMi-1R; Tue, 07 Feb 2023 18:00:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 18:00:40 +0100
Message-Id: <20230207170040.3503236-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230207170040.3503236-1-peter@korsgaard.com>
References: <20230207170040.3503236-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] support/dependencies/dependencies.sh:
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 support/dependencies/dependencies.sh | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 88eabe921d..9193b3ee12 100755
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
