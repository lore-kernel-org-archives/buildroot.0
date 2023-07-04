Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A32EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EA5040A04;
	Tue,  4 Jul 2023 20:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EA5040A04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xslyIK6oFbxW; Tue,  4 Jul 2023 20:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E67F40CA7;
	Tue,  4 Jul 2023 20:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E67F40CA7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E1BB1BF42E
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74D7A60F3D
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D7A60F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MwXc8VSHEawn for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5146960BC4
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5146960BC4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D7F786620; Tue,  4 Jul 2023 20:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Jul 2023 22:38:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5673ea3ce4d4dd721bb17fc8d5b1283f5c1080b4
X-Git-Newrev: 21f6859647a9ebab2fc09824403514cbaea523a4
X-Patchwork-Hint: ignore
Message-Id: <20230704205218.3D7F786620@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: fix install
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=21f6859647a9ebab2fc09824403514cbaea523a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

buildroot commit 4c8ab13b960edcd290ea5ca7a7e739cb993fb863 added a link
of /usr/sbin/pb-udhcpc in
$(TARGET_DIR)/usr/share/udhcpc/default.script.d/ without creating that
directory first.

Fixes:
http://autobuild.buildroot.net/results/778/77802098355dd99a9e7e6d9178f900a9a8fe72a3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/petitboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 4d56b73938..8b4c14207e 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -55,6 +55,7 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
 	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
