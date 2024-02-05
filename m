Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78278C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 21:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25B4940A8A;
	Mon,  5 Feb 2024 21:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25B4940A8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7fpxS8t4nP4F; Mon,  5 Feb 2024 21:39:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4855E40AFF;
	Mon,  5 Feb 2024 21:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4855E40AFF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 10E641BF341
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEF4E60ECE
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 21:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEF4E60ECE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4AAJDyMJ6FE for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 21:39:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A6F660741
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 21:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A6F660741
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1615286E1B; Mon,  5 Feb 2024 21:39:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 22:38:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1dd39dcf12d97637c4b343d49fcddae2ba29774b
X-Git-Newrev: 5647d5c1900bde13cedd36efd09404ea5763c0fb
X-Patchwork-Hint: ignore
Message-Id: <20240205213900.1615286E1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-utils: add missing licensing
 data to show-info
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

commit: https://git.buildroot.net/buildroot/commit/?id=5647d5c1900bde13cedd36efd09404ea5763c0fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the list of licenses is present in the show-info output, the list
of license files and the redistributable status were missing. Add them.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 059e86ae0a..723bbe4e24 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -157,6 +157,10 @@ endef
 define _json-info-pkg-details
 	"version": $(call mk-json-str,$($(1)_DL_VERSION)),
 	"licenses": $(call mk-json-str,$($(1)_LICENSE)),
+	"license_files": [
+		$(foreach f, $($(1)_LICENSE_FILES),$(call mk-json-str,$(f))$(comma))
+	],
+	"redistributable": $(if $(filter NO,$($(1)_REDISTRIBUTE)),false,true),
 	"dl_dir": $(call mk-json-str,$($(1)_DL_SUBDIR)),
 	"downloads": [
 	$(foreach dl,$(sort $($(1)_ALL_DOWNLOADS)),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
