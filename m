Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F69C3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 21:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CD6F409FA;
	Tue, 16 Jul 2024 21:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2q2VKVXJv2P; Tue, 16 Jul 2024 21:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F93440BCA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F93440BCA;
	Tue, 16 Jul 2024 21:28:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D13881BF37B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF12080FF7
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wSVx5w3vOp9t for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 21:28:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 099BD80FF2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 099BD80FF2
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 21:28:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7A3986A35; Tue, 16 Jul 2024 21:28:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 23:28:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 531fc0a60e3bef6b04c61a21c1f258825e169d23
X-Git-Newrev: ec531a271b4973a5b622525f10b7451c5fbacea1
X-Patchwork-Hint: ignore
Message-Id: <20240716212854.B7A3986A35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: use depth first search
 for directory removal
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
Content-Type: multipart/mixed; boundary="===============4302039606446776264=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4302039606446776264==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ec531a271b4973a5b622525f10b7451c5fbacea1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously, Python builds could intermittently fail when removing files
if `find` removed a directory before searching within it [0].

An arbitrary example:

  /tmp/tmp.h9KMUse5zO $ find . -type d -name __pycache__ -exec rm -rvf {} \; ; echo -e "RETURN CODE: $?"
  removed directory './a/b/c/d/e/__pycache__'
  find: ‘./a/b/c/d/e/__pycache__’: No such file or directory
  removed directory './a/b/c/d/e/f/__pycache__'
  find: ‘./a/b/c/d/e/f/__pycache__’: No such file or directory
  removed directory './a/b/c/d/e/f/g/__pycache__'
  RETURN CODE: 1

Now, pass the `-depth` argument to `find` so a depth-first search is
performed to avoid trying to search within an already deleted folder.

Fixes: 54d48c8cad4e ("package/python3: miscellaneous fixups")
Fixes: http://autobuild.buildroot.net/results/ba1d4213ae9912d53412ded6d8e257b67a4f7c0e/
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python3/python3.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index a82bc47a57..f85dcfad30 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -205,8 +205,8 @@ define PYTHON3_REMOVE_USELESS_FILES
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON3_VERSION_MAJOR)-config
 	rm -f $(TARGET_DIR)/usr/bin/python3-config
 	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/config-$(PYTHON3_VERSION_MAJOR)*/ \
-		-type f -not -name Makefile -exec rm -rf {} \;
-	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/ -type d \
+		-depth -type f -not -name Makefile -exec rm -rf {} \;
+	find $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/ -depth -type d \
 		-name __pycache__ -exec rm -rf {} \;
 endef
 

--===============4302039606446776264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4302039606446776264==--
