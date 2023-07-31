Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4830CC001E0
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 21:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0F6C40189;
	Mon, 31 Jul 2023 21:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0F6C40189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8tN-b-rgjYy; Mon, 31 Jul 2023 21:39:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1BDE40C0C;
	Mon, 31 Jul 2023 21:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1BDE40C0C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CA4C1BF25B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B478840C22
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 21:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B478840C22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4GIcwF54u-Yi for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 21:39:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0048940BBF
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 21:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0048940BBF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DCF6583E7E; Mon, 31 Jul 2023 21:39:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 23:39:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b2e5e6550aed4f79461919c6a59e00741eb4b11
X-Git-Newrev: 2b3e87e118892e4698d7586b42b6996925989838
X-Patchwork-Hint: ignore
Message-Id: <20230731213913.DCF6583E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-babel: add purge locale
 data support
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

commit: https://git.buildroot.net/buildroot/commit/?id=2b3e87e118892e4698d7586b42b6996925989838
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add purge loacle data support (inspired by BR2_ENABLE_LOCALE_PURGE
handling in Makefile) to reduce target space allocation by the
python-babel package, e.g. from 32MB to 24K for
target/usr/lib/python3.11/site-packages/babel/locale-data with
BR2_ENABLE_LOCALE_WHITELIST="C en_US de_DE".

The special en_US_POSIX locale data is kept as it is used by default
by the python-babel code:

https://github.com/python-babel/babel/blob/0ce196fccc024b1a65453ba6519954ada1dab6cb/babel/core.py#L1076

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-babel/python-babel.mk | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/package/python-babel/python-babel.mk b/package/python-babel/python-babel.mk
index 890a8b02b9..69c38c1a6e 100644
--- a/package/python-babel/python-babel.mk
+++ b/package/python-babel/python-babel.mk
@@ -12,5 +12,18 @@ PYTHON_BABEL_LICENSE = BSD-3-Clause
 PYTHON_BABEL_LICENSE_FILES = LICENSE
 HOST_PYTHON_BABEL_DEPENDENCIES = host-python-pytz
 
+# purge locale data (if enabled), keep special en_US_POSIX data which
+# is used by default by the python-babel code
+ifeq ($(BR2_ENABLE_LOCALE_PURGE),y)
+define PYTHON_BABEL_CLEANUP_LOCALE
+	for i in `ls $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/babel/locale-data/*.dat`; \
+	do \
+		i_base=`basename "$$i" .dat`; \
+		echo "$(BR2_ENABLE_LOCALE_WHITELIST) en_US_POSIX" | grep -qw "$$i_base" || rm "$$i"; \
+	done
+endef
+PYTHON_BABEL_TARGET_FINALIZE_HOOKS += PYTHON_BABEL_CLEANUP_LOCALE
+endif
+
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
