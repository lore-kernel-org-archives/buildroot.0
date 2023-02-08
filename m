Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8805C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 18:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C6B44181C;
	Wed,  8 Feb 2023 18:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C6B44181C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eFPpFGfgCY81; Wed,  8 Feb 2023 18:20:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5796A417B9;
	Wed,  8 Feb 2023 18:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5796A417B9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E46691BF5E6
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB1AA416F1
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 18:19:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB1AA416F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oX1VhPTEiZUD for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 18:19:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E89B41838
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E89B41838
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 18:19:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 709D040003;
 Wed,  8 Feb 2023 18:19:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pPp2f-00GT9m-Bk; Wed, 08 Feb 2023 19:19:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:19:28 +0100
Message-Id: <20230208181933.3925279-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] package/pkg-waf.mk: drop bundled waf/waflib
 when external waf is used
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waf requires that the version of the waf script matches the version of
waflib, so drop any bundled waf/waflib if _NEEDS_EXTERNAL_WAF is used, as
otherwise waf errors out with errors like:

Waf script '2.0.24' and library '1.9.3' do not match

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-waf.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index e090afa9e6..a067e69c9b 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -38,6 +38,13 @@ WAF_OPTS = $(if $(VERBOSE),-v) -j $(PARALLEL_JOBS)
 
 define inner-waf-package
 
+# The version of waflib has to match with the version of waf,
+# otherwise waf errors out with:
+# Waf script 'X' and library 'Y' do not match
+define WAF_PACKAGE_REMOVE_WAF_LIB
+	$(RM) -fr $(@D)/waf $(@D)/waflib
+endef
+
 # We need host-python3 to run waf
 $(2)_DEPENDENCIES += host-python3
 
@@ -47,6 +54,7 @@ $(2)_NEEDS_EXTERNAL_WAF ?= NO
 ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
 $(2)_DEPENDENCIES += host-waf
 $(2)_WAF = $$(HOST_DIR)/bin/waf
+$(2)_PRE_CONFIGURE_HOOKS += WAF_PACKAGE_REMOVE_WAF_LIB
 else
 $(2)_WAF ?= ./waf
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
