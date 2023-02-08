Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF17CC636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 00:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0584F537;
	Tue, 21 Feb 2023 00:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A0584F537
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lATmJ0L15XA8; Tue, 21 Feb 2023 00:42:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D89F4F527;
	Tue, 21 Feb 2023 00:42:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D89F4F527
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8E8E31BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 230B441803
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 230B441803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rk0Umlvj7kSz for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49485417E3
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49485417E3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37E7A86495; Mon, 20 Feb 2023 20:52:56 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 8 Feb 2023 15:28:31 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7150edc790cda61270eb0ec1af7ab78255c90003
X-Git-Newrev: 2c3466bbeeedad1cfc8fda5120d452fd786d68e4
X-Patchwork-Hint: ignore
Message-Id: <20230220205256.37E7A86495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] utils/docker-run: fix
 shellcheck errors
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

commit: https://git.buildroot.net/buildroot/commit/?id=2c3466bbeeedad1cfc8fda5120d452fd786d68e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In utils/docker-run line 10:
    --user $(id -u):$(id -g) \
           ^------^ SC2046: Quote this to prevent word splitting.
                    ^------^ SC2046: Quote this to prevent word splitting.

The suggestions from shellcheck can be applied.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 utils/docker-run | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/docker-run b/utils/docker-run
index 5653764254..164e11c0e6 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -7,7 +7,7 @@ IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
 
 exec docker run -it --rm \
-    --user $(id -u):$(id -g) \
+    --user "$(id -u):$(id -g)" \
     --mount "type=bind,src=${MAIN_DIR},dst=${MAIN_DIR}" \
     --workdir "${MAIN_DIR}" \
     "${IMAGE}" "${@}"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
