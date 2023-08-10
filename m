Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F347C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 21:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27F3A40A62;
	Thu, 10 Aug 2023 21:15:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27F3A40A62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dr7AtNdOnD0y; Thu, 10 Aug 2023 21:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C36940510;
	Thu, 10 Aug 2023 21:15:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C36940510
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA581BF379
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7C6041DFB
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 21:15:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C6041DFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZAreHDf33Mnh for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 21:15:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7862D41DD1
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 21:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7862D41DD1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6118585785; Thu, 10 Aug 2023 21:15:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 10 Aug 2023 23:07:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 5a75e7dbbc302f2d631b83d0d1ea45be9f617724
X-Git-Newrev: b574a9606e62e79a3b7f8aa3e14199ea73fc6826
X-Patchwork-Hint: ignore
Message-Id: <20230810211520.6118585785@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/erlang: do not
 hard-code the Erlang Interface Version (EI_VSN)
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

commit: https://git.buildroot.net/buildroot/commit/?id=b574a9606e62e79a3b7f8aa3e14199ea73fc6826
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The note above the erlang version instructs to refer to another note
further down the file. However, even if it is not too difficult to find,
it is still located a bit too far away, and the reference is not very
explicit what note we should look at.

When we introduced that variable in 6c1d128844c5 (package/erlang: export
EI_VSN so other packages can use it), the rationale for hard-coding it
was "to avoid spawning a shell every time the variable is dereferenced".

However, that can get a bit confusing and hard to follow. Also, that in
fact spawns a shell only once for each rebar-packages, so the overhead
is far from being too high.

The EI_VSN is only used by rebar-package packages, is derefrenced from
the rebar-infra and not the packages themselves, and is not needed by
erlang itself (it knows its own EI_VSN), so we can de-hard-code it, and
rely on build-time detection, by looking in the appropriate file.

We have two files where we could look:
  - lib/erl_interface/vsn.mk in the erlang source tree, but it is not
    installed,
  - .../lib/erlang/releases/$(ERLANG_RELASE)/installed_application_versions
    as installed by erlang.

We use the second one, as it is cleaner, for a package, to look into
installed files, rather than to look in the source tree of another
package.

Although both the host and target erlang are the same, we still look
into the corresponding file to extract the version. This is so that it
would be easier if in the future we ever manage to rely on a
system-installed erlang that could have a EI_VSN different from the
target one.

We can't re-use the variable ERLANG_EI_VSN, because it now needs to be
$(call)-ed with a parameter. Hopefully, external packages that use it
directly rather than through the rebar infra, are not legion...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Will Newton <will.newton@gmail.com>
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang/erlang.mk | 7 ++++---
 package/pkg-rebar.mk     | 4 ++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 593cb72937..29e2b74cbd 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -6,6 +6,7 @@
 
 # See note below when updating Erlang
 ERLANG_VERSION = 26.0.2
+ERLANG_RELEASE = $(firstword $(subst ., ,$(ERLANG_VERSION)))
 ERLANG_SITE = \
 	https://github.com/erlang/otp/releases/download/OTP-$(ERLANG_VERSION)
 ERLANG_SOURCE = otp_src_$(ERLANG_VERSION).tar.gz
@@ -26,9 +27,9 @@ ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
 HOST_ERLANG_DEPENDENCIES += host-autoconf
 HOST_ERLANG_PRE_CONFIGURE_HOOKS += ERLANG_RUN_AUTOCONF
 
-# Whenever updating Erlang, this value should be updated as well, to the
-# value of EI_VSN in the file lib/erl_interface/vsn.mk
-ERLANG_EI_VSN = 5.4
+# Return the EIV (Erlang Interface Version, EI_VSN)
+# $(1): base directory, i.e. either $(HOST_DIR) or $(STAGING_DIR)/usr
+erlang_ei_vsn = `sed -r -e '/^erl_interface-(.+)/!d; s//\1/' $(1)/lib/erlang/releases/$(ERLANG_RELEASE)/installed_application_versions`
 
 # The configure checks for these functions fail incorrectly
 ERLANG_CONF_ENV = ac_cv_func_isnan=yes ac_cv_func_isinf=yes
diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index e4e3f3bb6c..4b993dd970 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -32,10 +32,10 @@ REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps
 #
 REBAR_HOST_DEPS_ENV = \
 	ERL_COMPILER_OPTIONS='{i, "$(REBAR_HOST_DEPS_DIR)"}' \
-	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
+	ERL_EI_LIBDIR=$(HOST_DIR)/lib/erlang/lib/erl_interface-$(call erlang_ei_vsn,$(HOST_DIR))/lib
 REBAR_TARGET_DEPS_ENV = \
 	ERL_COMPILER_OPTIONS='{i, "$(REBAR_TARGET_DEPS_DIR)"}' \
-	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(ERLANG_EI_VSN)/lib
+	ERL_EI_LIBDIR=$(STAGING_DIR)/usr/lib/erlang/lib/erl_interface-$(call erlang_ei_vsn,$(STAGING_DIR)/usr)/lib
 
 ################################################################################
 # Helper functions
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
