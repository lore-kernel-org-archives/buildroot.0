Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BD5ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 10:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AB5740361;
	Mon, 12 Sep 2022 10:03:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2AB5740361
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8X-f9daRQ0EY; Mon, 12 Sep 2022 10:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2520940301;
	Mon, 12 Sep 2022 10:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2520940301
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AAB41BF9B4
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 10:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB156418E0
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 10:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB156418E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ygJgzvE0Er1D for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 10:03:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1408418DD
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B1408418DD
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 10:03:06 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AAB5ACBB15
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 09:56:04 +0000 (UTC)
Received: (Authenticated sender: foss@0leil.net)
 by mail.gandi.net (Postfix) with ESMTPSA id D55271C0003;
 Mon, 12 Sep 2022 09:55:57 +0000 (UTC)
From: Quentin Schulz <foss+buildroot@0leil.net>
To: buildroot@buildroot.org
Date: Mon, 12 Sep 2022 11:55:33 +0200
Message-Id: <20220912095540.957477-2-foss+buildroot@0leil.net>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912095540.957477-1-foss+buildroot@0leil.net>
References: <20220912095540.957477-1-foss+buildroot@0leil.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Makefile: error out printvars target when VARS
 is empty or unset
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
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Quentin Schulz <foss+buildroot@0leil.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Quentin Schulz <quentin.schulz@theobroma-systems.com>

printvars returns nothing when VARS is not passed or empty. This is done
on purpose, see commit fd5bd12379dc ("Makefile: printvars: don't print
anything when VARS is not set").

An error message making explicit what is required from the user in order
to use printvars is however better than silently doing nothing.

This adds a check for a non-empty VARS variable.

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index a743e42f91..3cbcfa9196 100644
--- a/Makefile
+++ b/Makefile
@@ -1058,6 +1058,10 @@ endif
 # to workaround a bug in make 4.3; see https://savannah.gnu.org/bugs/?59093
 .PHONY: printvars
 printvars:
+ifndef VARS
+	@echo "Please pass a non-empty VARS to 'make printvars'"
+	@exit 1
+endif
 	@:
 	$(foreach V, \
 		$(sort $(foreach X, $(.VARIABLES), $(filter $(VARS),$(X)))), \
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
