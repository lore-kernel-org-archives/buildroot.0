Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CFA1C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 10:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A510160D72;
	Sun, 26 Dec 2021 10:33:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_mqaVcAjVrt; Sun, 26 Dec 2021 10:33:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0EDB260D61;
	Sun, 26 Dec 2021 10:33:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7273B1BF476
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DB264032A
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:33:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a7bPYREb_Bcx for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 10:33:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7775B404B6
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:33:38 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 45F86E0003;
 Sun, 26 Dec 2021 10:33:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 11:33:29 +0100
Message-Id: <20211226103329.660967-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/binutils: fix an OpenRISC binutils 2.37
 patch
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When binutils 2.37 was introduced in commit
62f0232980c8168631b29f27edf612af8109c691 ("package/binutils: add
version 2.37"), the patch
0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch was
not properly updated. Indeed, between binutils 2.36 and 2.37, binutils
has switched to using the standard "bool" type, so instead of using
TRUE/FALSE, true/false must be used.

With this change, the binutils patch matches the one that was merged
upstream.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...4-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
index 779baeab63..0d18321ee1 100644
--- a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
+++ b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
@@ -46,7 +46,7 @@ index 32063ab0289..67252394173 100644
 +	      _bfd_error_handler
 +		(_("%pB: pc-relative relocation against dynamic symbol %s"),
 +		 input_bfd, name);
-+	      ret_val = FALSE;
++	      ret_val = false;
 +	      bfd_set_error (bfd_error_bad_value);
 +	    }
 +	  break;
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
