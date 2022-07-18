Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751CECCA481
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1928481B71;
	Mon, 18 Jul 2022 10:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1928481B71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1vmbc1Mwq6U4; Mon, 18 Jul 2022 10:20:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CF2E81A46;
	Mon, 18 Jul 2022 10:20:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CF2E81A46
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 453021BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F9DE415AD
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F9DE415AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kKkQfyKfIeZ for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:20:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41DB44157C
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41DB44157C
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0B59783C8F; Mon, 18 Jul 2022 10:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 12:19:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7d05e66e377d8e4ae23982d5f8d72909abd9e4d9
X-Git-Newrev: 09874785c06747470915fc12befd45307ccd2bbd
X-Patchwork-Hint: ignore
Message-Id: <20220718100639.0B59783C8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mstpd: fix install path of binaries
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

commit: https://git.buildroot.net/buildroot/commit/?id=09874785c06747470915fc12befd45307ccd2bbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported by Colin Foster at
https://lore.kernel.org/buildroot/YsiEyscz0S5b9zj9@colin-ia-desktop/,
the Linux kernel expects the bridge-stp binary to be installed as
/sbin/bridge-stp. See
https://elixir.bootlin.com/linux/v5.18/source/net/bridge/br_private.h#L53.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Tested-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mstpd/mstpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mstpd/mstpd.mk b/package/mstpd/mstpd.mk
index 907d094242..07c41af8df 100644
--- a/package/mstpd/mstpd.mk
+++ b/package/mstpd/mstpd.mk
@@ -10,4 +10,8 @@ MSTPD_AUTORECONF = YES
 MSTPD_LICENSE = GPL-2.0, RSA Data Security (md5)
 MSTPD_LICENSE_FILES = LICENSE hmac_md5.c
 
+# The Linux kernel requires mstp binaries to be installed into /sbin,
+# not /usr/sbin.
+MSTPD_CONF_OPTS = --sbindir=/sbin
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
