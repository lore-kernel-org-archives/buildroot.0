Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4223DC43216
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B15466104F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:12:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B15466104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85D7B405EB;
	Tue,  3 Aug 2021 22:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aju9Y3x4yVhZ; Tue,  3 Aug 2021 22:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BF14061E;
	Tue,  3 Aug 2021 22:12:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15E3D1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DDAA4056C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqZTT0iUZUdP for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FE0F40518
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E7B608B441; Tue,  3 Aug 2021 21:09:40 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 18 May 2021 22:22:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3f0eb2782c66f5cd0d97eacb02b67109e2341b1e
X-Git-Newrev: d0ed2725e9816677ab395334fdb7ec2559bce878
X-Patchwork-Hint: ignore
Message-Id: <20210803210940.E7B608B441@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/environment-setup: Fix
 incorrect order of the `sed` expressions
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d0ed2725e9816677ab395334fdb7ec2559bce878
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Order of the `sed` expressions is important; when this was commited
to master, the order of the expressions from the original patch [1] was
changed, rendering the second expression to noop.

This made all the environment variables from the script to contain
absolute paths: long absolute paths makes verbose builds difficult
to read/follow.
We can take advantage of the fact that the PATH is updated and we
don't have to use absolute paths.

Fixed by reordering the `sed` expresions:
* first update the path of the binaries: e.g. 's%$(HOST_DIR)/bin/%%g'
* only then update remaining paths: e.g. 's%$(HOST_DIR)%\$$SDK_PATH%g'

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20201027140140.47982-1-matthew.weber@rockwellcollins.com/

Signed-off-by: Mircea GLIGA <mgliga@bitdefender.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/environment-setup/environment-setup.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index fcad013f0d..f4c52921f7 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -26,8 +26,8 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	printf "alias cmake=\"cmake \
 		-DCMAKE_TOOLCHAIN_FILE=$(HOST_DIR)/share/buildroot/toolchainfile.cmake \
 		-DCMAKE_INSTALL_PREFIX=/usr\"\n" >> $(ENVIRONMENT_SETUP_FILE)
-	$(SED) 's%$(HOST_DIR)%\$$SDK_PATH%g' \
-		-e 's%$(HOST_DIR)/bin/%%g' \
+	$(SED) 's%$(HOST_DIR)/bin/%%g' \
+		-e 's%$(HOST_DIR)%\$$SDK_PATH%g' \
 		-e '/^export "PATH=/c\' \
 		$(ENVIRONMENT_SETUP_FILE)
 	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
