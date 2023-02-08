Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC456C636D3
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 18:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C71D8209B;
	Wed,  8 Feb 2023 18:20:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C71D8209B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uUSB9dxPmJjE; Wed,  8 Feb 2023 18:20:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 533A682097;
	Wed,  8 Feb 2023 18:20:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 533A682097
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D30ED1BF5E6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE87940C7B
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE87940C7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6hD4zrkJVR6Z for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 18:20:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A10B40184
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A10B40184
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 18:20:12 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 417431C0007;
 Wed,  8 Feb 2023 18:19:46 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pPp2j-00GTAM-BJ; Wed, 08 Feb 2023 19:19:41 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:19:32 +0100
Message-Id: <20230208181933.3925279-5-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230208181933.3925279-1-peter@korsgaard.com>
References: <20230208181933.3925279-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/5] package/norm: use external waf
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
http://autobuild.buildroot.net/results/ee1/ee15cadf8af10dee6c83b9726a034367e8ae81a7/

The bundled waf script is too old (2.0.7) for python >= 3.11 as it uses the
'U' modifier to open (universal newlines), which have been deprecated since
python 3.3 and finally removed in 3.11.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/norm/norm.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/norm/norm.mk b/package/norm/norm.mk
index 2f9fc7b657..a3fa1b4f80 100644
--- a/package/norm/norm.mk
+++ b/package/norm/norm.mk
@@ -11,6 +11,9 @@ NORM_INSTALL_STAGING = YES
 NORM_LICENSE = NRL License
 NORM_LICENSE_FILES = LICENSE.TXT
 
+# The bundled waf script is too old for >= python3.11
+NORM_NEEDS_EXTERNAL_WAF = YES
+
 ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
 NORM_DEPENDENCIES += libnetfilter_queue
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
