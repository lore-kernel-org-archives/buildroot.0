Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BBFBC433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 21:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BD9183103;
	Wed, 16 Feb 2022 21:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eOIWZZd2b0iB; Wed, 16 Feb 2022 21:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FED830A8;
	Wed, 16 Feb 2022 21:29:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2A51BF5A9
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0918D41756
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 21:29:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TZMp4LNl7bZD for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 21:29:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F89D41750
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 21:29:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 72E8783731; Wed, 16 Feb 2022 21:21:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 22:27:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f0e2e567f7245705445a922b1529ea4f7b6b4a5
X-Git-Newrev: 7f2020f9040fe2378c2797bfa256f77d118be372
X-Patchwork-Hint: ignore
Message-Id: <20220216212132.72E8783731@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/docker-run: improve user experience
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f2020f9040fe2378c2797bfa256f77d118be372
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the docker-run script starts a container based on the
reference image, in which the user has UID:GID set to 1000:1000,
which may or may not be the same as local user uses, which may
prevent the commands in the container from creating files, which
foils the plan of using the container to run a build...

Additionally, the paths in the container differ from the paths
the user expects, as the current Buildroot tree is mounted over
the in-container user home directory. This is a bit confusing...

Finally, the container is left hanging around after the command
finishes, and thus there are as many lingering containers as the
user runs docker-run. This is not very nice...

We fix all of that (yeah, should be different patches, but meh):

  - we use --mount instead of -v, which allows us to bind-mount
    the Buildroot tree at the same place in the container, as
    Docker will create the destination if it does not exist, while
    -v seems to expect it to exist [0].

  - as a consequence, we can also set the working directory as the
    Buildroot top-directory;

  - use --user to force the same UID:GID in the container as the
    local user, so that files created in the container belong to
    the local user, and so that files from the local user are
    accessible from the container;

  - use --rm to remove the container once it terminates; starting
    a new container is very quick anyway, so it is as good as
    re-using a previous container.

[0] the documentation is not clear about that. It clearly states
that the host directory (i.e. the origin, the source) is created
if missing, but it says nothing of the destination:
    https://docs.docker.com/engine/reference/commandline/run/#mount-volume--v---read-only

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 utils/docker-run | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 2bca8d8e3a..bdbc979264 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -7,4 +7,8 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
 set -x
-exec docker run -v "${MAIN_DIR}:/home/br-user" -it "${IMAGE}" "$@"
+exec docker run -it --rm \
+    --user $(id -u):$(id -g) \
+    --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
+    --workdir "${MAIN_DIR}" \
+    "${IMAGE}" "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
