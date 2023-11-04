Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BBC3C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 17:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11EFE4029F;
	Sat,  4 Nov 2023 17:44:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11EFE4029F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W25U9od61gzU; Sat,  4 Nov 2023 17:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6CCD40116;
	Sat,  4 Nov 2023 17:44:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6CCD40116
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46A391BF21A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:44:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DBC58216C
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 17:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBC58216C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lu8Wk_5w8aFC for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 17:44:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 25BDD821AE
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 17:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25BDD821AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13BCC866BC; Sat,  4 Nov 2023 17:44:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 18:42:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 893bd5697488c45809eeebebaff699c7c242c02f
X-Git-Newrev: 8f6024153032d4f7a3406f43aaebe6c2c6be5cf6
X-Patchwork-Hint: ignore
Message-Id: <20231104174402.13BCC866BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: propagate user's proxy
 settings
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
Content-Type: multipart/mixed; boundary="===============4085665910729056276=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4085665910729056276==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8f6024153032d4f7a3406f43aaebe6c2c6be5cf6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When dealing with enterprise-grade networks, it is more often than not
the case that the wider internet is unreachable but through proxies.

There is a usual set of variables that users can set in the
environment to point various tools (curl, git...) to use those
proxies.

Propagate those variables inside the container.

Note that there are a few tools (e.g. cvs, svn) that may not recognise
those variables; instead, they require custom setup that is too
complex to handle, so is left as an exercise to interested parties.

Similarly, there are other types of proxy, socks4 or socks5, that also
require custom setup that is not trivial to replicate in a container,
so is also left out as an exercise for interested parties.

In the large majority of cases, those few variables are enough to Make
Things Work™.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/docker-run | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 464cbf691f..79694474c1 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -29,6 +29,26 @@ declare -a mountpoints=(
     "$(pwd)"
 )
 
+# curl lists (and recognises and uses) other types of *_proxy variables,
+# but only those make sense for Buildroot:
+for env in all_proxy http_proxy https_proxy ftp_proxy no_proxy; do
+    if [ "${!env}" ]; then
+        docker_opts+=( --env "${env}" )
+        # The lower-case variant takes precedence on the upper-case one
+        # (dixit curl)
+        continue
+    fi
+    # http_proxy is only lower-case (dixit curl)
+    if [ "${env}" = http_proxy ]; then
+        continue
+    fi
+    # All the others also exist in the upper-case variant
+    env="${env^^}"
+    if [ "${!env}" ]; then
+        docker_opts+=( --env "${env}" )
+    fi
+done
+
 # Empty GIT_DIR means that we are not in a workdir, *and* git is too old
 # to know about worktrees, so we're not in a worktree either. So it means
 # we're in the main git working copy, and thus we don't need to mount the

--===============4085665910729056276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4085665910729056276==--
