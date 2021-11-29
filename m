Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86C9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 16:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4684A4024F;
	Mon, 29 Nov 2021 16:50:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YZ9fscOicpVm; Mon, 29 Nov 2021 16:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B66C401F3;
	Mon, 29 Nov 2021 16:50:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2FAC1BF325
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 16:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1A47401F3
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 16:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v8-kQ0rS8wtf for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 16:50:27 +0000 (UTC)
X-Greylist: delayed 00:56:27 by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC17640128
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 16:50:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [78.252.129.8])
 by smtp6-g21.free.fr (Postfix) with ESMTP id 95D14780371;
 Mon, 29 Nov 2021 17:50:23 +0100 (CET)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 17:50:00 +0100
Message-Id: <20211129165001.363636-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/2] package/gnuradio: force python3-six
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

host-python-six needs host-python (aka python2) but since
commit e9df5b0fc3f6e8bb36deedefb392bbc968116ee7 python-mako is
python3 only. python-six is build using python2 and python-mako with
python3 and gnuradio build fails with:

-- Python checking for python >= 2.7
-- Python checking for python >= 2.7 - found
--
-- Python checking for mako >= 0.4.2
-- Python checking for mako >= 0.4.2 - not found

This patch force the use of host-python3-six to be coherent

Fixes:
- http://autobuild.buildroot.net/results/2685fb00883e6936e24ca1f17b693e6e1c13c9fa

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/gnuradio/gnuradio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 2272a1162a..5616039559 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -22,7 +22,7 @@ endif
 GNURADIO_DEPENDENCIES = \
 	host-python3 \
 	host-python-mako \
-	host-python-six \
+	host-python3-six \
 	host-swig \
 	boost \
 	log4cpp \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
