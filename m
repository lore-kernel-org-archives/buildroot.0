Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9034AECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 19:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EABF40C61;
	Wed, 14 Sep 2022 19:04:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EABF40C61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9i3kR9R5qAAA; Wed, 14 Sep 2022 19:04:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61CAD403E2;
	Wed, 14 Sep 2022 19:04:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61CAD403E2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ABED1BF283
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 19:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7577C41794
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 19:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7577C41794
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9FhHMGgfG9kx for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 19:04:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75F234177A
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 19:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75F234177A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6112F83949; Wed, 14 Sep 2022 19:04:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 14 Sep 2022 21:03:03 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 292e363a29e4590d4d11df4801a592bd49036165
X-Git-Newrev: 98690b10d483728a27fd5b6c0089147075dcb379
X-Patchwork-Hint: ignore
Message-Id: <20220914190428.6112F83949@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/lshw: also uses
 hwdata's PNP IDs
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

commit: https://git.buildroot.net/buildroot/commit/?id=98690b10d483728a27fd5b6c0089147075dcb379
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Commit 29bccabdebff (lshw: use data files provided by hwdata) removed
the hardware info DBs installed by lshw, in favour of those provided by
hwdata, as the former are way out-dated while the latter are more
up-to-date.

However, it forgot to also select the PNP ID database, to replace the
one lshw would install.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c6241bc2ca335a405f1ccf387d5d77ad141277a2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lshw/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 5e0e47b6e2..fb557aacff 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_HWDATA # runtime
 	select BR2_PACKAGE_HWDATA_PCI_IDS
+	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_HWDATA_USB_IDS
 	help
 	  lshw (Hardware Lister) is a small tool to provide
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
