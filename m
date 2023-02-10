Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5A3C636CD
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 14:14:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B621E40384;
	Fri, 10 Feb 2023 14:14:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B621E40384
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HyaCFweHp1rL; Fri, 10 Feb 2023 14:14:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5721415FD;
	Fri, 10 Feb 2023 14:14:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5721415FD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A10281BF2C9
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7B3C0818A1
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 14:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B3C0818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rx9mCMFC9L_W for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A859F81756
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A859F81756
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 944E784E82; Fri, 10 Feb 2023 14:14:50 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 15:08:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e2fd606b91784ced64c7312e02fcbf95f3e736d6
X-Git-Newrev: 1b4d7f6e13212b4c65ec2832681719fd960e75e6
X-Patchwork-Hint: ignore
Message-Id: <20230210141450.944E784E82@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-waf.mk: drop bundled
 waf/waflib when external waf is used
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b4d7f6e13212b4c65ec2832681719fd960e75e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Waf requires that the version of the waf script matches the version of
waflib, so drop any bundled waf/waflib if _NEEDS_EXTERNAL_WAF is used, as
otherwise waf errors out with errors like:

Waf script '2.0.24' and library '1.9.3' do not match

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
[Peter: Run as a post-patch hook as suggested by Yann]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-waf.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index e090afa9e6..0e752072c8 100644
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
+$(2)_POST_PATCH_HOOKS += WAF_PACKAGE_REMOVE_WAF_LIB
 else
 $(2)_WAF ?= ./waf
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
