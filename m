Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C54CC6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 159B581DED;
	Sat, 25 Mar 2023 21:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 159B581DED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hwMfrsuy_m6; Sat, 25 Mar 2023 21:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A6CA81DE3;
	Sat, 25 Mar 2023 21:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A6CA81DE3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5CDF41BF86C
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3712781E65
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3712781E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WYpJQ556EDG8 for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D22981D7C
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D22981D7C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ADFE82ABB; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:27:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 658e7626e54965669bf51e5e6d470d2638b1ac33
X-Git-Newrev: bb7822abad0d09cbd4a7bf794ae1ec95d2daca73
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.4ADFE82ABB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools: add FOO_AUTOPOINT
 flag
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
Content-Type: multipart/mixed; boundary="===============1751381936258110861=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1751381936258110861==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=bb7822abad0d09cbd4a7bf794ae1ec95d2daca73
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a new variable to run autopoint during autoreconf.

This variable depends on FOO_AUTORECONF = YES. It is mutually exclusive
to FOO_GETTEXTIZE. If both are set, FOO_AUTOPOINT is ignored to preserve
previous behavior.

This support is being added per a previous discussion [1].

The usage of gettextize needs to be removed cuz mama says so [2].
  ... is not part of the GNU build system, in the sense that it should
  not be invoked automatically, and not be invoked by someone who doesn’t
  assume the responsibilities of a package maintainer. For the latter
  purpose, a separate tool is provided, see Invoking the autopoint Program [3]

Using gettextize has the unintended consequence of updating the package
based on the version of host-gettext vs what was chosen by the upstream
maintainer. As mama said above, we should use autopoint. Do as she says
to avoid further scolding (gettextize shoehorning and package patching).

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20170827110920.15579-1-aleksander@aleksander.es/
[2] https://www.gnu.org/software/gettext/manual/html_node/gettextize-Invocation.html
[3] https://www.gnu.org/software/gettext/manual/html_node/autopoint-Invocation.html

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-autotools.mk | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 418cd10945..48485567d7 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -152,6 +152,15 @@ ifndef $(2)_GETTEXTIZE
  endif
 endif
 
+ifndef $(2)_AUTOPOINT
+ ifdef $(3)_AUTOPOINT
+  $(2)_AUTOPOINT = $$($(3)_AUTOPOINT)
+ else
+  $(2)_AUTOPOINT ?= NO
+ endif
+endif
+
+
 ifeq ($(4),host)
  $(2)_AUTORECONF_OPTS ?= $$($(3)_AUTORECONF_OPTS)
 endif
@@ -240,8 +249,14 @@ ifeq ($$($(2)_AUTORECONF),YES)
 ifeq ($$($(2)_GETTEXTIZE),YES)
 $(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
 $(2)_DEPENDENCIES += host-gettext
-endif
 $(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
+# autopoint is provided by gettext
+else ifeq ($$($(2)_AUTOPOINT),YES)
+$(2)_DEPENDENCIES += host-gettext
+$(2)_AUTORECONF_ENV += AUTOPOINT=$$(HOST_DIR)/bin/autopoint
+else
+$(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
+endif
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 # default values are not evaluated yet, so don't rely on this defaulting to YES
 ifneq ($$($(2)_LIBTOOL_PATCH),NO)

--===============1751381936258110861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1751381936258110861==--
